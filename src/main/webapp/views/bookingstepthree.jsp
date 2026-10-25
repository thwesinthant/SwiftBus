<%@ include file="fragments/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>

    <style>
        .payment-page {
            --sb-primary: #0F6E8C;
            --sb-dark: #0A4F66;
            --sb-deep: #062E3D;
            --sb-cyan: #4FB8D6;
            --sb-gold: #F2A93B;
            --sb-gold-dark: #D98A1A;
            --sb-bg: #F7F9FA;
            --sb-border: #DCE6EA;
            --sb-muted: #7A8B95;

            min-height: 100vh;
            padding: 18px 20px 32px;
            background: var(--sb-bg);
            color: var(--sb-deep);
            font-family: inherit;
        }

        .payment-page *,
        .payment-page *::before,
        .payment-page *::after {
            box-sizing: border-box;
        }

        .payment-container {
            width: 100%;
            max-width: 1120px;
            margin: 0 auto;
        }

        /* Booking progress */

        .payment-progress {
            padding: 15px 22px;
            margin-bottom: 18px;
            background: #fff;
            border: 1px solid var(--sb-border);
            border-radius: 14px;
            box-shadow: 0 4px 16px rgba(6, 46, 61, 0.04);
        }

        .progress-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-bottom: 14px;
        }

        .progress-eyebrow {
            margin: 0;
            color: var(--sb-primary);
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 1.2px;
            text-transform: uppercase;
        }

        .progress-heading h2 {
            margin: 4px 0 0;
            font-size: 17px;
            font-weight: 800;
            line-height: 1.3;
        }

        .progress-count {
            flex-shrink: 0;
            padding: 6px 10px;
            border: 1px solid #F3DDB7;
            border-radius: 8px;
            background: #FFF7E9;
            color: #98600D;
            font-size: 10px;
            font-weight: 800;
            white-space: nowrap;
        }

        .progress-track {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .progress-step {
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 0;
            flex-shrink: 0;
        }

        .progress-node {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 30px;
            flex-shrink: 0;
            border: 1px solid #DCE6EA;
            border-radius: 9px;
            background: #F0F4F6;
            color: #7A8B95;
            font-size: 12px;
            font-weight: 800;
        }

        .progress-text {
            display: flex;
            flex-direction: column;
            gap: 2px;
            white-space: nowrap;
        }

        .progress-title {
            color: #7A8B95;
            font-size: 11px;
            font-weight: 700;
        }

        .progress-caption {
            color: #A0ADB3;
            font-size: 9px;
        }

        .progress-step.completed .progress-node {
            background: var(--sb-primary);
            border-color: var(--sb-primary);
            color: #fff;
        }

        .progress-step.completed .progress-title {
            color: var(--sb-primary);
        }

        .progress-step.active .progress-node {
            background: var(--sb-gold);
            border-color: var(--sb-gold);
            color: var(--sb-deep);
            box-shadow: 0 0 0 3px rgba(242, 169, 59, 0.16);
        }

        .progress-step.active .progress-title {
            color: var(--sb-deep);
            font-weight: 800;
        }

        .progress-step.active .progress-caption {
            color: #A66B13;
        }

        .progress-connector {
            flex: 1;
            min-width: 10px;
            height: 2px;
            border-radius: 5px;
            background: #E1E9ED;
        }

        .progress-connector.completed {
            background: var(--sb-primary);
        }

        /* Main layout */

        .payment-layout {
            display: grid;
            grid-template-columns: minmax(0, 0.88fr) minmax(0, 1.25fr);
            gap: 20px;
            align-items: start;
        }

        .payment-card {
            min-width: 0;
            overflow: hidden;
            background: #fff;
            border: 1px solid var(--sb-border);
            border-radius: 16px;
            box-shadow: 0 5px 20px rgba(6, 46, 61, 0.045);
        }

        .card-header {
            padding: 20px 22px 17px;
            border-bottom: 1px solid #EDF1F3;
        }

        .card-content {
            padding: 21px;
        }

        .card-eyebrow {
            margin-bottom: 6px;
            color: var(--sb-primary);
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 1.2px;
            text-transform: uppercase;
        }

        .card-title {
            margin: 0;
            color: var(--sb-deep);
            font-size: 20px;
            font-weight: 800;
            line-height: 1.35;
        }

        .card-subtitle {
            margin: 6px 0 0;
            color: var(--sb-muted);
            font-size: 12px;
            line-height: 1.6;
        }

        /* Trip summary */

        .route-box {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #E0EEF2;
            border-radius: 12px;
            background: #F2F8FA;
        }

        .route-point {
            display: flex;
            align-items: flex-start;
            gap: 11px;
        }

        .route-marker {
            width: 12px;
            height: 12px;
            margin-top: 4px;
            flex-shrink: 0;
            border: 3px solid var(--sb-primary);
            border-radius: 50%;
            background: #fff;
        }

        .route-marker.destination {
            border-color: var(--sb-gold-dark);
            border-radius: 3px;
        }

        .route-city {
            color: var(--sb-deep);
            font-size: 14px;
            font-weight: 800;
            overflow-wrap: anywhere;
        }

        .route-caption {
            margin-top: 4px;
            color: var(--sb-muted);
            font-size: 11px;
            line-height: 1.5;
        }

        .route-connector {
            height: 20px;
            margin: 4px 0 4px 5px;
            border-left: 2px dashed #A7C9D3;
        }

        .trip-details {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 16px 12px;
        }

        .detail-label {
            margin-bottom: 5px;
            color: #82919A;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 0.45px;
            text-transform: uppercase;
        }

        .detail-value {
            color: var(--sb-deep);
            font-size: 12px;
            font-weight: 700;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        .type-badge {
            display: inline-flex;
            align-items: center;
            padding: 5px 9px;
            border-radius: 7px;
            background: #E8F5F8;
            color: var(--sb-primary);
            font-size: 11px;
            font-weight: 800;
        }

        .selected-summary {
            margin-top: 20px;
            padding: 14px;
            border: 1px solid #F3DDB7;
            border-radius: 11px;
            background: #FFF9EF;
        }

        .selected-summary-label {
            color: #8B6B36;
            font-size: 10px;
            font-weight: 800;
            letter-spacing: 0.7px;
            text-transform: uppercase;
        }

        .selected-summary-value {
            margin-top: 7px;
            color: #A66B13;
            font-size: 13px;
            font-weight: 800;
            line-height: 1.6;
            overflow-wrap: anywhere;
        }

        /* Price summary */

        .price-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-top: 18px;
            padding-top: 16px;
            border-top: 1px solid #E8EEF0;
        }

        .price-label {
            color: #647984;
            font-size: 12px;
            font-weight: 700;
        }

        .price-value {
            color: var(--sb-deep);
            font-size: 13px;
            font-weight: 800;
            text-align: right;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 12px;
            margin-top: 13px;
            padding: 15px;
            border-radius: 10px;
            background: var(--sb-deep);
            color: #fff;
        }

        .total-label {
            font-size: 12px;
            font-weight: 700;
        }

        .total-value {
            color: #FFD58B;
            font-size: 19px;
            font-weight: 800;
            text-align: right;
            overflow-wrap: anywhere;
        }

        /* Payment methods */

        .payment-form {
            display: flex;
            flex-direction: column;
            gap: 13px;
        }

        .payment-intro {
            margin: 0 0 4px;
            color: var(--sb-muted);
            font-size: 12px;
            line-height: 1.6;
        }

        .payment-option {
            position: relative;
            display: flex;
            align-items: center;
            gap: 13px;
            padding: 15px;
            border: 1px solid #DCE6EA;
            border-radius: 12px;
            background: #fff;
            cursor: pointer;
            transition: border-color 0.2s ease,
                        background 0.2s ease,
                        box-shadow 0.2s ease;
        }

        .payment-option:hover {
            border-color: #A7C9D3;
            background: #F8FCFD;
        }

        .payment-option:has(input:checked) {
            border-color: var(--sb-primary);
            background: #F2F8FA;
            box-shadow: 0 0 0 2px rgba(15, 110, 140, 0.08);
        }

        .payment-option input[type="radio"] {
            width: 17px;
            height: 17px;
            flex-shrink: 0;
            margin: 0;
            accent-color: var(--sb-primary);
        }

        .payment-icon {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 43px;
            height: 43px;
            flex-shrink: 0;
            border-radius: 11px;
            background: #E8F5F8;
            color: var(--sb-primary);
            font-size: 19px;
            font-weight: 800;
        }

        .payment-option:nth-of-type(3) .payment-icon {
            background: #FFF3DF;
            color: #A66B13;
        }

        .payment-option:nth-of-type(4) .payment-icon {
            background: #EAF4ED;
            color: #34724B;
        }

        .payment-option-info {
            flex: 1;
            min-width: 0;
        }

        .payment-option-title {
            display: block;
            color: var(--sb-deep);
            font-size: 13px;
            font-weight: 800;
        }

        .payment-option-description {
            display: block;
            margin-top: 4px;
            color: var(--sb-muted);
            font-size: 11px;
            line-height: 1.5;
        }

        .payment-tag {
            flex-shrink: 0;
            padding: 4px 7px;
            border-radius: 6px;
            background: #E8F5F8;
            color: var(--sb-primary);
            font-size: 9px;
            font-weight: 800;
        }

        .payment-notice {
            display: flex;
            align-items: flex-start;
            gap: 10px;
            margin-top: 3px;
            padding: 12px;
            border: 1px solid #F5D9AC;
            border-radius: 10px;
            background: #FFF7ED;
            color: #895A12;
            font-size: 11px;
            line-height: 1.6;
        }

        .payment-notice-icon {
            flex-shrink: 0;
            font-size: 15px;
        }

        /* Actions */

        .payment-actions {
            display: flex;
            gap: 10px;
            margin-top: 7px;
        }

        .payment-button {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            min-height: 45px;
            padding: 11px 16px;
            border-radius: 10px;
            font-family: inherit;
            font-size: 12px;
            font-weight: 800;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background 0.2s ease,
                        border-color 0.2s ease,
                        transform 0.2s ease;
        }

        .payment-button:active {
            transform: scale(0.98);
        }

        .payment-button-back {
            flex: 0.8;
            border: 1px solid #C8D8DE;
            background: #fff;
            color: var(--sb-dark);
        }

        .payment-button-back:hover {
            background: #F2F8FA;
            border-color: #A7C9D3;
        }

        .payment-button-submit {
            flex: 1.5;
            border: 1px solid var(--sb-gold);
            background: var(--sb-gold);
            color: var(--sb-deep);
        }

        .payment-button-submit:hover {
            border-color: var(--sb-gold-dark);
            background: var(--sb-gold-dark);
            color: #fff;
        }

        .payment-button-submit:disabled {
            opacity: 0.6;
            cursor: not-allowed;
        }

        .secure-note {
            margin-top: 13px;
            color: var(--sb-muted);
            font-size: 10px;
            line-height: 1.6;
            text-align: center;
        }

        .field-error {
            display: none;
            color: #B42318;
            font-size: 11px;
            font-weight: 700;
        }

        .field-error.visible {
            display: block;
        }

/* Floating seat hold timer */
.floating-seat-timer {
    position: fixed;
    right: 22px;
    bottom: 22px;
    z-index: 1000;
    display: flex;
    align-items: center;
    gap: 9px;
    min-width: 130px;
    padding: 9px 13px;
    background: #FFFFFF;
    border: 1px solid #DCE6EA;
    border-radius: 13px;
    box-shadow: 0 5px 20px rgba(6, 46, 61, 0.14);
}

.floating-timer-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    flex-shrink: 0;
    border-radius: 9px;
    background: #FFF3DE;
    color: #A66B13;
    font-size: 16px;
}

.floating-timer-info {
    display: flex;
    flex-direction: column;
    gap: 2px;
}

.floating-timer-label {
    color: #647984;
    font-size: 10px;
    font-weight: 700;
    white-space: nowrap;
}

.floating-timer-value {
    color: #0A4F66;
    font-size: 18px;
    font-weight: 800;
    line-height: 1.2;
    font-variant-numeric: tabular-nums;
}

.floating-seat-timer.is-urgent {
    border-color: #F0C5BD;
    background: #FFF8F6;
}

.floating-seat-timer.is-urgent .floating-timer-icon {
    background: #FCE5E0;
    color: #B9382B;
}

.floating-seat-timer.is-urgent .floating-timer-label,
.floating-seat-timer.is-urgent .floating-timer-value {
    color: #B9382B;
}

.floating-seat-timer.is-expired {
    border-color: #E8B9B9;
    background: #FFF4F4;
}

.floating-seat-timer.is-expired .floating-timer-icon {
    background: #FCE5E5;
    color: #B42318;
}

.floating-seat-timer.is-expired .floating-timer-label,
.floating-seat-timer.is-expired .floating-timer-value {
    color: #B42318;
}

@media (max-width: 560px) {
    .floating-seat-timer {
        right: 12px;
        bottom: 12px;
        gap: 8px;
        min-width: 120px;
        padding: 8px 10px;
        border-radius: 12px;
    }

    .floating-timer-icon {
        width: 29px;
        height: 29px;
        font-size: 14px;
    }

    .floating-timer-value {
        font-size: 16px;
    }
}

        /* Responsive */

        @media (max-width: 850px) {
            .payment-layout {
                grid-template-columns: minmax(0, 1fr);
                gap: 16px;
            }

            .payment-page {
                padding-top: 15px;
            }
        }

        @media (max-width: 560px) {
            .payment-page {
                padding: 10px 10px 24px;
            }

            .payment-progress {
                padding: 12px 9px;
                margin-bottom: 13px;
                border-radius: 12px;
            }

            .progress-heading {
                gap: 7px;
                margin-bottom: 12px;
            }

            .progress-eyebrow {
                font-size: 9px;
                letter-spacing: 0.8px;
            }

            .progress-heading h2 {
                font-size: 14px;
            }

            .progress-count {
                padding: 5px 7px;
                font-size: 9px;
            }

            .progress-track {
                gap: 4px;
            }

            .progress-step {
                flex: 1;
                flex-direction: column;
                gap: 5px;
                text-align: center;
            }

            .progress-node {
                width: 28px;
                height: 28px;
                border-radius: 8px;
                font-size: 11px;
            }

            .progress-text {
                align-items: center;
                min-height: 24px;
                white-space: normal;
            }

            .progress-title {
                font-size: 9px;
                line-height: 1.35;
            }

            .progress-caption {
                display: none;
            }

            .progress-connector {
                flex: 0 1 18px;
                min-width: 4px;
                margin-bottom: 24px;
            }

            .payment-layout {
                gap: 13px;
            }

            .payment-card {
                border-radius: 13px;
            }

            .card-header {
                padding: 17px 15px 14px;
            }

            .card-content {
                padding: 16px;
            }

            .card-title {
                font-size: 18px;
            }

            .card-subtitle {
                font-size: 11px;
            }

            .route-box {
                padding: 13px;
                margin-bottom: 17px;
            }

            .trip-details {
                gap: 14px 10px;
            }

            .payment-option {
                gap: 10px;
                padding: 12px;
            }

            .payment-icon {
                width: 38px;
                height: 38px;
                font-size: 16px;
            }

            .payment-option-title {
                font-size: 12px;
            }

            .payment-option-description {
                font-size: 10px;
            }

            .payment-tag {
                display: none;
            }

            .payment-actions {
                gap: 8px;
            }

            .payment-button {
                padding: 11px 10px;
                font-size: 11px;
            }

            .total-value {
                font-size: 17px;
            }
        }
    </style>
</head>

<body>
<div class="payment-page">
    <main class="payment-container">

        <c:set var="seatCount" value="${fn:length(selectedSeats)}" />
        <c:set var="totalAmount"
               value="${result.pricePerSeat() * seatCount}" />

        <!-- Booking Progress -->
        <section class="payment-progress" aria-label="Booking progress">
            <div class="progress-heading">
                <div>
                    <p class="progress-eyebrow">Your booking</p>
                    <h2>Choose your payment</h2>
                </div>

                <span class="progress-count">STEP 3 OF 4</span>
            </div>

            <div class="progress-track">
                <div class="progress-step completed">
                    <div class="progress-node">&#10003;</div>
                    <div class="progress-text">
                        <span class="progress-title">Select Seat</span>
                        <span class="progress-caption">Completed</span>
                    </div>
                </div>

                <div class="progress-connector completed"></div>

                <div class="progress-step completed">
                    <div class="progress-node">&#10003;</div>
                    <div class="progress-text">
                        <span class="progress-title">Traveller Info</span>
                        <span class="progress-caption">Completed</span>
                    </div>
                </div>

                <div class="progress-connector completed"></div>

                <div class="progress-step active">
                    <div class="progress-node">3</div>
                    <div class="progress-text">
                        <span class="progress-title">Payment</span>
                        <span class="progress-caption">Current step</span>
                    </div>
                </div>

                <div class="progress-connector"></div>

                <div class="progress-step">
                    <div class="progress-node">4</div>
                    <div class="progress-text">
                        <span class="progress-title">Confirmation</span>
                        <span class="progress-caption">Next</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main Content -->
        <div class="payment-layout">

            <!-- Left: Trip Summary -->
            <section class="payment-card">
                <div class="card-header">
                    <div class="card-eyebrow">Your journey</div>
                    <h2 class="card-title">Trip Summary</h2>
                    <p class="card-subtitle">
                        Check your journey and selected seats before payment.
                    </p>
                </div>

                <div class="card-content">

                    <div class="route-box">
                        <div class="route-point">
                            <span class="route-marker"></span>
                            <div>
                                <div class="route-city">
                                    <c:out value="${result.startLocation()}" />
                                </div>
                                <div class="route-caption">
                                    <c:out value="${result.formattedDepartureTime}" />
                                </div>
                            </div>
                        </div>

                        <div class="route-connector"></div>

                        <div class="route-point">
                            <span class="route-marker destination"></span>
                            <div>
                                <div class="route-city">
                                    <c:out value="${result.endLocation()}" />
                                </div>
                                <div class="route-caption">
                                    <c:out value="${result.formattedArrivalTime}" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="trip-details">
                        <div>
                            <div class="detail-label">Bus</div>
                            <div class="detail-value">
                                <c:out value="${result.busName()}" />
                            </div>
                        </div>

                        <div>
                            <div class="detail-label">Bus Number</div>
                            <div class="detail-value">
                                <c:out value="${result.busNo()}" />
                            </div>
                        </div>

                        <div>
                            <div class="detail-label">Bus Type</div>
                            <div class="detail-value">
                                <span class="type-badge">
                                    <c:out value="${result.ticketType()}" />
                                </span>
                            </div>
                        </div>

                        <div>
                            <div class="detail-label">Passengers</div>
                            <div class="detail-value">
                                <c:out value="${seatCount}" />
                                <c:choose>
                                    <c:when test="${seatCount == 1}"> seat</c:when>
                                    <c:otherwise> seats</c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>

                    <div class="selected-summary">
                        <div class="selected-summary-label">Selected Seats</div>
                        <div class="selected-summary-value">
                            <c:forEach var="seat" items="${selectedSeats}" varStatus="status">
                                <c:if test="${status.index > 0}">, </c:if>
                                <c:out value="${seat}" />
                            </c:forEach>
                        </div>
                    </div>

                    <div class="price-summary">
                        <span class="price-label">Price per seat</span>
                        <span class="price-value">
                            <fmt:formatNumber value="${result.pricePerSeat()}"
                                              type="number"
                                              groupingUsed="true" /> MMK
                        </span>
                    </div>

                    <div class="price-summary">
                        <span class="price-label">Number of seats</span>
                        <span class="price-value">
                            <c:out value="${seatCount}" />
                        </span>
                    </div>

                    <div class="total-row">
                        <span class="total-label">Total Amount</span>
                        <span class="total-value">
                            <fmt:formatNumber value="${totalAmount}"
                                              type="number"
                                              groupingUsed="true" /> MMK
                        </span>
                    </div>
                </div>
            </section>

            <!-- Right: Payment Method -->
            <section class="payment-card">
                <div class="card-header">
                    <div class="card-eyebrow">Secure checkout</div>
                    <h2 class="card-title">Payment Method</h2>
                    <p class="card-subtitle">
                        Select how you would like to pay for your tickets.
                    </p>
                </div>

                <div class="card-content">
                    <form id="paymentForm"
                          class="payment-form"
                          action="${pageContext.request.contextPath}/booking/stepfour"
                          method="post">

						 <!-- CSRF Protection -->
					    <input type="hidden"
					           name="${_csrf.parameterName}"
					           value="${_csrf.token}" />
           
                        <!-- Preserve booking information -->
                        <input type="hidden"
                               name="busNo"
                               value="<c:out value='${result.busNo()}' />">

                        <input type="hidden"
                               name="scheduleId"
                               value="<c:out value='${result.scheduleId()}' />">

                        <input type="hidden"
       name="selectedSeats"
       value="${fn:join(selectedSeats, ',')}">

                        <p class="payment-intro">
                            Choose one payment option to continue.
                        </p>

                        <label class="payment-option">
                            <input type="radio"
                                   name="paymentMethod"
                                   value="WAVE_PAY"
                                   required>

                            <span class="payment-icon" aria-hidden="true">
                                W
                            </span>

                            <span class="payment-option-info">
                                <span class="payment-option-title">Wave Pay</span>
                                <span class="payment-option-description">
                                    Pay using your Wave Pay account.
                                </span>
                            </span>

                            <span class="payment-tag">Mobile Wallet</span>
                        </label>

                        <label class="payment-option">
                            <input type="radio"
                                   name="paymentMethod"
                                   value="MOBILE_BANKING"
                                   required>

                            <span class="payment-icon" aria-hidden="true">
                                &#9745;
                            </span>

                            <span class="payment-option-info">
                                <span class="payment-option-title">Mobile Banking</span>
                                <span class="payment-option-description">
                                    Use a supported mobile banking service.
                                </span>
                            </span>
                        </label>

                        <label class="payment-option">
                            <input type="radio"
                                   name="paymentMethod"
                                   value="BANK_TRANSFER"
                                   required>

                            <span class="payment-icon" aria-hidden="true">
                                &#8596;
                            </span>

                            <span class="payment-option-info">
                                <span class="payment-option-title">Bank Transfer</span>
                                <span class="payment-option-description">
                                    Transfer the payment through your bank.
                                </span>
                            </span>
                        </label>

                        <div id="paymentError"
                             class="field-error"
                             role="alert">
                            Please select a payment method to continue.
                        </div>

                        <div class="payment-notice">
                            <span class="payment-notice-icon" aria-hidden="true">
                                &#9432;
                            </span>
                            <span>
                                Please check your trip details and total amount
                                carefully before continuing. Your booking must
                                be validated by the server before payment is confirmed.
                            </span>
                        </div>

                        <div class="payment-actions">
                            <button type="button"
                                    class="payment-button payment-button-back"
                                    id="backButton">
                                &#8592; Back
                            </button>

                            <button type="submit"
                                    class="payment-button payment-button-submit"
                                    id="continueButton">
                                Continue
                                <span aria-hidden="true">&#8594;</span>
                            </button>
                        </div>

                        <div class="secure-note">
                            &#128274; Do not share your payment PIN or password.
                        </div>
                    </form>
                </div>
            </section>

        </div>
    </main>

<!-- Floating Seat Hold Timer -->
<div class="floating-seat-timer"
     id="seatHoldTimer"
     role="status"
     aria-live="polite">

    <span class="floating-timer-icon" aria-hidden="true">&#9201;</span>

    <div class="floating-timer-info">
        <span class="floating-timer-label" id="holdTitle">
            Seats held
        </span>

        <span class="floating-timer-value" id="holdCountdown">
            --:--
        </span>
    </div>
</div>

</div>

<script>

document.addEventListener("DOMContentLoaded", function () {
    const paymentForm = document.getElementById("paymentForm");
    const paymentError = document.getElementById("paymentError");
    const continueButton = document.getElementById("continueButton");
    const backButton = document.getElementById("backButton");

    const paymentMethods = document.querySelectorAll(
        'input[name="paymentMethod"]'
    );

    const timer = document.getElementById("seatHoldTimer");
    const countdown = document.getElementById("holdCountdown");
    const title = document.getElementById("holdTitle");

    const holdUntil = Number("${holdUntilEpochMillis}");

    let timerInterval = null;
    let holdExpired = false;
    let submitting = false;

    function expireHold() {
        holdExpired = true;

        countdown.textContent = "00:00";
        title.textContent = "Hold expired";

        timer.classList.remove("is-urgent");
        timer.classList.add("is-expired");

        continueButton.disabled = true;
        continueButton.textContent = "Seat Hold Expired";

        if (timerInterval !== null) {
            clearInterval(timerInterval);
            timerInterval = null;
        }
    }

    function updateCountdown() {
        const remainingMs = holdUntil - Date.now();

        if (remainingMs <= 0) {
            expireHold();
            return;
        }

        const totalSeconds = Math.ceil(remainingMs / 1000);
        const minutes = Math.floor(totalSeconds / 60);
        const seconds = totalSeconds % 60;

        countdown.textContent =
            String(minutes).padStart(2, "0") + ":" +
            String(seconds).padStart(2, "0");

        if (remainingMs <= 2 * 60 * 1000) {
            timer.classList.add("is-urgent");
            title.textContent = "Time left";
        } else {
            timer.classList.remove("is-urgent");
            title.textContent = "Seats held";
        }
    }

    if (!Number.isFinite(holdUntil) || holdUntil <= 0) {
        countdown.textContent = "--:--";
        title.textContent = "Hold unavailable";

        timer.classList.add("is-expired");

        continueButton.disabled = true;
        continueButton.textContent = "Seat Hold Unavailable";
    } else {
        updateCountdown();

        if (!holdExpired) {
            timerInterval = setInterval(updateCountdown, 1000);
        }
    }

    backButton.addEventListener("click", function () {
        window.history.back();
    });

    paymentMethods.forEach(function (method) {
        method.addEventListener("change", function () {
            paymentError.classList.remove("visible");
        });
    });

    paymentForm.addEventListener("submit", function (event) {
        // Client-side check only. The server must validate the hold too.
        if (
            holdExpired ||
            !Number.isFinite(holdUntil) ||
            holdUntil <= 0 ||
            Date.now() >= holdUntil
        ) {
            event.preventDefault();
            expireHold();
            return;
        }

        const selectedMethod = document.querySelector(
            'input[name="paymentMethod"]:checked'
        );

        if (!selectedMethod) {
            event.preventDefault();
            paymentError.classList.add("visible");
            return;
        }

        if (submitting) {
            event.preventDefault();
            return;
        }

        submitting = true;
        continueButton.disabled = true;
        continueButton.textContent = "Please wait...";
    });
});

</script>
</body>
</html>