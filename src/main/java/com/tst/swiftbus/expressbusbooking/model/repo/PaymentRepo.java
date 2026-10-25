
package com.tst.swiftbus.expressbusbooking.model.repo;

import java.util.Optional;

import com.tst.swiftbus.expressbusbooking.model.BaseRepository;
import com.tst.swiftbus.expressbusbooking.model.entity.Payment;

public interface PaymentRepo extends BaseRepository<Payment, Long> {

	Optional<Payment> findByTransactionReference(String transactionReference);
}
