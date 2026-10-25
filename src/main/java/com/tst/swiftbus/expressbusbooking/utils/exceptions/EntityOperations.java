package com.tst.swiftbus.expressbusbooking.utils.exceptions;

import java.util.Optional;

public class EntityOperations {

	public static <T, ID> T safeCall(Optional<T> optional, String resourceName, String keyName, ID keyValue) {
		return optional.orElseThrow(() -> new AppBusinessException(
				"There is no %s with %s : %s.".formatted(resourceName, keyName, keyValue)));
	}

}
