package com.tst.swiftbus.expressbusbooking.service;

import java.util.Optional;
import java.util.function.Function;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tst.swiftbus.expressbusbooking.controller.dto.BusSearchDTO;
import com.tst.swiftbus.expressbusbooking.controller.dto.BusSearchResultDTO;
import com.tst.swiftbus.expressbusbooking.model.PageResult;
import com.tst.swiftbus.expressbusbooking.model.entity.Bus;
import com.tst.swiftbus.expressbusbooking.model.entity.BusSchedule_;
import com.tst.swiftbus.expressbusbooking.model.entity.BusType_;
import com.tst.swiftbus.expressbusbooking.model.entity.Bus_;
import com.tst.swiftbus.expressbusbooking.model.repo.BusSearchRepo;

import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.JoinType;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BusSearchService {

	private final BusSearchRepo repo;

	@Transactional(readOnly = true)
	public PageResult<BusSearchResultDTO> search(BusSearchDTO form, int page, int size) {
		return repo.search(queryFunc(form), countFunc(form), page, size);
	}

	private Function<CriteriaBuilder, CriteriaQuery<BusSearchResultDTO>> queryFunc(BusSearchDTO form) {

		return cb -> {
			var cq = cb.createQuery(BusSearchResultDTO.class);
			var root = cq.from(Bus.class);

			// Create each JOIN only once
			var route = root.join(Bus_.route, JoinType.INNER);
			var schedule = root.join(Bus_.schedules, JoinType.INNER);
			var busType = root.join(Bus_.busType, JoinType.INNER);

			// Reuse the same JOINs for selecting and filtering
			BusSearchResultDTO.select(cb, cq, root, route, schedule, busType);

			cq.where(form.where(cb, route, schedule, busType));

			// Sorting uses the same JOINs
			if ("highestPrice".equals(form.getSortBy())) {
				cq.orderBy(cb.desc(busType.get(BusType_.price)));

			} else if ("earliestDeparture".equals(form.getSortBy())) {
				cq.orderBy(cb.asc(schedule.get(BusSchedule_.departureTime)));

			} else if ("latestDeparture".equals(form.getSortBy())) {
				cq.orderBy(cb.desc(schedule.get(BusSchedule_.departureTime)));

			} else if ("duration".equals(form.getSortBy())) {

				// Calculate trip duration in seconds
				var duration = cb.diff(
						cb.function("UNIX_TIMESTAMP", Long.class, schedule.get(BusSchedule_.arrivalTime)),
						cb.function("UNIX_TIMESTAMP", Long.class, schedule.get(BusSchedule_.departureTime)));

				// Shortest duration first
				cq.orderBy(cb.asc(duration));

			} else {
				// Default: lowest price first
				cq.orderBy(cb.asc(busType.get(BusType_.price)));
			}

			return cq;
		};
	}

	private Function<CriteriaBuilder, CriteriaQuery<Long>> countFunc(BusSearchDTO form) {

		return cb -> {
			var cq = cb.createQuery(Long.class);
			var root = cq.from(Bus.class);

			var route = root.join(Bus_.route, JoinType.INNER);
			var schedule = root.join(Bus_.schedules, JoinType.INNER);
			var busType = root.join(Bus_.busType, JoinType.INNER);

			cq.select(cb.countDistinct(schedule.get(BusSchedule_.scheduleId)));

			cq.where(form.where(cb, route, schedule, busType));

			return cq;
		};
	}

	@Transactional(readOnly = true)
	public Optional<BusSearchResultDTO> findByBusNo(String busNo) {
		return repo.searchOne(cb -> {
			var cq = cb.createQuery(BusSearchResultDTO.class);
			var root = cq.from(Bus.class);

			// Create the required joins
			var route = root.join(Bus_.route, JoinType.INNER);
			var schedule = root.join(Bus_.schedules, JoinType.INNER);
			var busType = root.join(Bus_.busType, JoinType.INNER);

			// Pass all required arguments
			BusSearchResultDTO.select(cb, cq, root, route, schedule, busType);

			cq.where(cb.equal(root.get(Bus_.busNo), busNo));

			// Return the earliest schedule if multiple schedules exist
			cq.orderBy(cb.asc(schedule.get(BusSchedule_.departureTime)));

			return cq;
		});
	}

}
