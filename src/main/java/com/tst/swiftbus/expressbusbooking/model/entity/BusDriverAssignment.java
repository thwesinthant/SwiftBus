/*
 * package com.tst.expressbooking.model.entity;
 * 
 * import java.util.List;
 * 
 * import jakarta.persistence.Entity; import jakarta.persistence.FetchType;
 * import jakarta.persistence.GeneratedValue; import
 * jakarta.persistence.GenerationType; import jakarta.persistence.Id; import
 * jakarta.persistence.JoinColumn; import jakarta.persistence.ManyToOne; import
 * jakarta.persistence.OneToMany; import jakarta.persistence.Table; import
 * lombok.Data;
 * 
 * @Entity
 * 
 * @Table(name = "bus_driver_assignment")
 * 
 * @Data public class BusDriverAssignment {
 * 
 * @Id
 * 
 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Integer
 * assignmentId;
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "bus_no", referencedColumnName = "bus_no", nullable =
 * false) private Bus bus;
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "schedule_id", referencedColumnName = "schedule_id",
 * nullable = false) private BusSchedule schedule;
 * 
 * @ManyToOne(fetch = FetchType.LAZY)
 * 
 * @JoinColumn(name = "driver_id", referencedColumnName = "employee_id",
 * nullable = false) private Employee driver;
 * 
 * @OneToMany(mappedBy = "driver") private List<BusDriverAssignment>
 * assignments;
 * 
 * }
 */