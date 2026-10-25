package com.tst.swiftbus.expressbusbooking.model.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import com.tst.swiftbus.expressbusbooking.model.entity.BusType;

public interface BusTypeRepo extends JpaRepository<BusType, String> {
}