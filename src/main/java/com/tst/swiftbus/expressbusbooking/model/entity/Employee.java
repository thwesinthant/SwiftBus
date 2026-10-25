/*
 * package com.tst.expressbooking.model.entity;
 * 
 * import java.math.BigDecimal; import java.time.LocalDate;
 * 
 * import jakarta.persistence.Column; import jakarta.persistence.Entity; import
 * jakarta.persistence.GeneratedValue; import
 * jakarta.persistence.GenerationType; import jakarta.persistence.Id; import
 * jakarta.persistence.Table; import lombok.Data;
 * 
 * @Entity
 * 
 * @Table(name = "employee")
 * 
 * @Data public class Employee {
 * 
 * @Id
 * 
 * @GeneratedValue(strategy = GenerationType.IDENTITY) private Integer
 * employeeId;
 * 
 * @Column(length = 50) private String name;
 * 
 * @Column(nullable = false, length = 50) private String role;
 * 
 * @Column(name = "contact_number", nullable = false, length = 20) private
 * String contactNumber;
 * 
 * @Column(name = "hire_date", nullable = false) private LocalDate hireDate;
 * 
 * @Column(nullable = false, precision = 10, scale = 2) private BigDecimal
 * salary; }
 */