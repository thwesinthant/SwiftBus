
<%@ include file="fragments/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<style>
/* =========================================
   TRAVELLER INFORMATION
   ========================================= */

.traveller-page {
    --sb-primary: #0F6E8C;
    --sb-dark: #0A4F66;
    --sb-deep: #062E3D;
    --sb-cyan: #4FB8D6;
    --sb-gold: #F2A93B;
    --sb-gold-dark: #D98A1A;
    --sb-bg: #F7F9FA;
    --sb-border: #DCE6EA;
    --sb-muted: #7A8B95;
    --sb-white: #FFFFFF;

    min-height: 100vh;
    padding: 22px 20px 42px;
    background: var(--sb-bg);
    color: var(--sb-deep);
    font-family: inherit;
}

.traveller-page *,
.traveller-page *::before,
.traveller-page *::after {
    box-sizing: border-box;
}

.traveller-container {
    width: 100%;
    max-width: 1120px;
    margin: 0 auto;
}

/* Booking Progress */

.traveller-progress {
    padding: 16px 22px;
    margin-bottom: 22px;
    background: var(--sb-white);
    border: 1px solid var(--sb-border);
    border-radius: 14px;
    box-shadow: 0 4px 16px rgba(6, 46, 61, 0.04);
}

.progress-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-bottom: 15px;
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
    color: var(--sb-deep);
    font-size: 17px;
    font-weight: 800;
}

.progress-count {
    padding: 6px 10px;
    border: 1px solid #F3DDB7;
    border-radius: 8px;
    background: #FFF7E9;
    color: #98600D;
    font-size: 11px;
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
    gap: 9px;
    min-width: 0;
    flex-shrink: 0;
}

.progress-node {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
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
    color: #FFFFFF;
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
    min-width: 12px;
    height: 2px;
    border-radius: 5px;
    background: #E1E9ED;
}

.progress-connector.completed {
    background: var(--sb-primary);
}

/* =========================================
   FLOATING SEAT HOLD TIMER
   ========================================= */

.floating-seat-timer {
    position: fixed;
    right: 22px;
    bottom: 22px;
    z-index: 1000;

    display: flex;
    align-items: center;
    gap: 9px;

    padding: 9px 13px;
    min-width: 130px;

    background: #FFFFFF;
    border: 1px solid #DCE6EA;
    border-radius: 13px;
    box-shadow: 0 5px 20px rgba(6, 46, 61, 0.14);

    transition: border-color 0.2s ease,
                background 0.2s ease;
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
    color: var(--sb-dark);
    font-size: 18px;
    font-weight: 800;
    font-variant-numeric: tabular-nums;
    line-height: 1.2;
}

.floating-seat-timer.is-urgent {
    border-color: #F0C5BD;
    background: #FFF8F6;
}

.floating-seat-timer.is-urgent .floating-timer-icon {
    background: #FCE5E0;
    color: #B9382B;
}

.floating-seat-timer.is-urgent .floating-timer-value,
.floating-seat-timer.is-urgent .floating-timer-label {
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

.floating-seat-timer.is-expired .floating-timer-value,
.floating-seat-timer.is-expired .floating-timer-label {
    color: #B42318;
}

/* Page Layout */

.traveller-layout {
    display: grid;
    grid-template-columns: minmax(0, 0.88fr) minmax(0, 1.25fr);
    gap: 22px;
    align-items: start;
}

.traveller-card {
    min-width: 0;
    overflow: hidden;
    background: var(--sb-white);
    border: 1px solid var(--sb-border);
    border-radius: 16px;
    box-shadow: 0 5px 20px rgba(6, 46, 61, 0.045);
}

.card-header {
    padding: 21px 22px 18px;
    border-bottom: 1px solid #EDF1F3;
}

.card-content {
    padding: 22px;
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
    font-size: 21px;
    line-height: 1.35;
    font-weight: 800;
}

.card-subtitle {
    margin: 7px 0 0;
    color: var(--sb-muted);
    font-size: 12px;
    line-height: 1.65;
}

/* Trip Summary */

.route-box {
    margin-top: 20px;
    padding: 16px;
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
    background: #FFFFFF;
}

.route-marker.destination {
    border-color: var(--sb-gold-dark);
    border-radius: 3px;
}

.route-city {
    color: var(--sb-deep);
    font-size: 15px;
    font-weight: 800;
    overflow-wrap: anywhere;
}

.route-caption {
    margin-top: 5px;
    color: var(--sb-muted);
    font-size: 11px;
    line-height: 1.5;
}

.route-connector {
    height: 22px;
    margin: 5px 0 5px 5px;
    border-left: 2px dashed #A7C9D3;
}

.trip-details {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 17px 14px;
    margin-top: 22px;
}

.detail-label {
    margin-bottom: 6px;
    color: #82919A;
    font-size: 10px;
    font-weight: 800;
    letter-spacing: 0.45px;
    text-transform: uppercase;
}

.detail-value {
    color: var(--sb-deep);
    font-size: 12px;
    line-height: 1.6;
    font-weight: 700;
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
    margin-top: 22px;
    padding: 15px;
    border: 1px solid #F3DDB7;
    border-radius: 11px;
    background: #FFF9EF;
}

.selected-summary-label {
    color: #8B6B36;
    font-size: 10px;
    font-weight: 800;
    letter-spacing: 0.8px;
}

.selected-summary-value {
    margin-top: 7px;
    color: #A66B13;
    font-size: 14px;
    font-weight: 800;
    overflow-wrap: anywhere;
}

.price-summary {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-top: 17px;
    padding-top: 17px;
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
    color: #FFFFFF;
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

.notice-box {
    display: flex;
    gap: 10px;
    align-items: flex-start;
    margin-top: 18px;
    padding: 13px;
    border: 1px solid #F5D9AC;
    border-radius: 10px;
    background: #FFF7ED;
    color: #895A12;
    font-size: 11px;
    line-height: 1.7;
}

.notice-icon {
    flex-shrink: 0;
    font-size: 15px;
}

/* Traveller Form */

.traveller-form {
    display: flex;
    flex-direction: column;
    gap: 17px;
}

.form-intro {
    display: flex;
    gap: 12px;
    align-items: flex-start;
    margin-bottom: 2px;
    padding: 13px;
    border: 1px solid #DDECF1;
    border-radius: 10px;
    background: #F4FAFC;
}

.form-intro-icon {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 34px;
    height: 34px;
    flex-shrink: 0;
    border-radius: 9px;
    background: #DDF1F6;
    color: var(--sb-primary);
    font-size: 16px;
    font-weight: 800;
}

.form-intro strong {
    display: block;
    margin-bottom: 3px;
    color: var(--sb-deep);
    font-size: 12px;
}

.form-intro p {
    margin: 0;
    color: var(--sb-muted);
    font-size: 11px;
    line-height: 1.6;
}

.form-group {
    min-width: 0;
}

.form-label {
    display: block;
    margin-bottom: 7px;
    color: #304D59;
    font-size: 12px;
    font-weight: 800;
}

.required-mark {
    color: #D64545;
}

.form-control {
    display: block;
    width: 100%;
    min-height: 44px;
    padding: 11px 13px;
    border: 1px solid #D5E0E5;
    border-radius: 9px;
    outline: none;
    background: #FFFFFF;
    color: var(--sb-deep);
    font: inherit;
    font-size: 12px;
    transition: border-color 0.2s ease, box-shadow 0.2s ease;
}

.form-control::placeholder {
    color: #A0ADB3;
}

.form-control:focus {
    border-color: var(--sb-cyan);
    box-shadow: 0 0 0 3px rgba(79, 184, 214, 0.15);
}

.form-control[readonly] {
    background: #F2F6F8;
    color: #647984;
    cursor: not-allowed;
}

.form-control:invalid:not(:placeholder-shown) {
    border-color: #D64545;
}

textarea.form-control {
    min-height: 95px;
    resize: vertical;
    line-height: 1.6;
}

.form-hint {
    display: block;
    margin-top: 6px;
    color: var(--sb-muted);
    font-size: 10px;
    line-height: 1.5;
}

.form-divider {
    height: 1px;
    margin: 1px 0;
    background: #EDF1F3;
}

.form-actions {
    display: flex;
    flex-direction: column;
    gap: 11px;
    margin-top: 3px;
}

.continue-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    min-height: 47px;
    padding: 12px 18px;
    border: 1px solid var(--sb-gold);
    border-radius: 10px;
    background: var(--sb-gold);
    color: var(--sb-deep);
    font-family: inherit;
    font-size: 13px;
    font-weight: 800;
    text-decoration: none;
    cursor: pointer;
    transition: background 0.2s ease, transform 0.2s ease,
                box-shadow 0.2s ease;
}

.continue-button:hover:not(:disabled) {
    border-color: var(--sb-gold-dark);
    background: var(--sb-gold-dark);
    color: #FFFFFF;
    box-shadow: 0 4px 12px rgba(217, 138, 26, 0.2);
}

.continue-button:active:not(:disabled) {
    transform: scale(0.99);
}

.continue-button:focus-visible {
    outline: 3px solid rgba(79, 184, 214, 0.6);
    outline-offset: 3px;
}

.continue-button:disabled {
    border-color: #D5DEE2;
    background: #E7ECEF;
    color: #7A8B95;
    box-shadow: none;
    cursor: not-allowed;
}

.secure-note {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 6px;
    color: var(--sb-muted);
    font-size: 10px;
    text-align: center;
}

/* Tablet */

@media (max-width: 850px) {
    .traveller-layout {
        grid-template-columns: minmax(0, 1fr);
        gap: 17px;
    }

    .traveller-progress {
        padding: 16px;
    }

    .traveller-page {
        padding-top: 17px;
    }

    .card-header {
        padding: 19px 20px 16px;
    }

    .card-content {
        padding: 20px;
    }
}

/* Mobile */

@media (max-width: 560px) {
    .traveller-page {
        padding: 12px 10px 80px;
    }

    .traveller-progress {
        padding: 12px 9px;
        margin-bottom: 13px;
        border-radius: 12px;
    }

    .progress-heading {
        gap: 7px;
        margin-bottom: 13px;
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
        min-height: 25px;
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
        margin-bottom: 25px;
    }

    .traveller-layout {
        gap: 13px;
    }

    .traveller-card {
        border-radius: 13px;
    }

    .card-header {
        padding: 17px 15px 14px;
    }

    .card-content {
        padding: 16px;
    }

    .card-title {
        font-size: 19px;
    }

    .card-subtitle {
        font-size: 11px;
    }

    .route-box {
        margin-top: 16px;
        padding: 13px;
    }

    .route-city {
        font-size: 14px;
    }

    .trip-details {
        gap: 15px 10px;
        margin-top: 18px;
    }

    .detail-label {
        font-size: 9px;
    }

    .detail-value {
        font-size: 11px;
    }

    .selected-summary {
        margin-top: 17px;
        padding: 13px;
    }

    .notice-box {
        margin-top: 14px;
        padding: 11px;
        font-size: 10px;
    }

    .traveller-form {
        gap: 15px;
    }

    .form-control {
        min-height: 43px;
    }

    .total-value {
        font-size: 17px;
    }

    .floating-seat-timer {
        right: 12px;
        bottom: 12px;
        gap: 8px;
        min-width: 120px;
        padding: 8px 10px;
        border-radius: 12px;
        box-shadow: 0 4px 16px rgba(6, 46, 61, 0.18);
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

@media (max-width: 360px) {
    .traveller-page {
        padding-right: 7px;
        padding-left: 7px;
    }

    .traveller-progress {
        padding: 11px 7px;
    }

    .progress-track {
        gap: 2px;
    }

    .progress-node {
        width: 25px;
        height: 25px;
        font-size: 10px;
    }

    .progress-title {
        font-size: 8px;
    }

    .progress-connector {
        min-width: 3px;
    }

    .card-content {
        padding: 13px;
    }

    .card-header {
        padding: 15px 13px;
    }
}
</style>

<div class="traveller-page">
    <main class="traveller-container">

        <!-- Booking Progress -->
        <section class="traveller-progress" aria-label="Booking progress">
            <div class="progress-heading">
                <div>
                    <p class="progress-eyebrow">Your booking</p>
                    <h2>Complete your details</h2>
                </div>
                <span class="progress-count">STEP 2 OF 4</span>
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

                <div class="progress-step active">
                    <div class="progress-node">2</div>
                    <div class="progress-text">
                        <span class="progress-title">Traveller Info</span>
                        <span class="progress-caption">Current step</span>
                    </div>
                </div>

                <div class="progress-connector"></div>

                <div class="progress-step">
                    <div class="progress-node">3</div>
                    <div class="progress-text">
                        <span class="progress-title">Payment</span>
                        <span class="progress-caption">Next</span>
                    </div>
                </div>

                <div class="progress-connector"></div>

                <div class="progress-step">
                    <div class="progress-node">4</div>
                    <div class="progress-text">
                        <span class="progress-title">Confirmation</span>
                        <span class="progress-caption">Finish</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Main Content -->
        <div class="traveller-layout">

            <!-- Trip Summary -->
            <aside class="traveller-card">
                <div class="card-content">
                    <div class="card-eyebrow">Your journey</div>
                    <h1 class="card-title">Trip Summary</h1>
                    <p class="card-subtitle">
                        Review your journey and selected seats before continuing.
                    </p>

                    <div class="route-box">
                        <div class="route-point">
                            <span class="route-marker"></span>
                            <div>
                                <div class="detail-label">Departure</div>
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
                                <div class="detail-label">Destination</div>
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
                            <div class="detail-label">Bus Number</div>
                            <div class="detail-value">
                                <c:out value="${result.busNo()}" />
                            </div>
                        </div>

                        <div>
                            <div class="detail-label">Bus Name</div>
                            <div class="detail-value">
                                <c:out value="${result.busName()}" />
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
                            <div class="detail-label">Schedule ID</div>
                            <div class="detail-value">
                                <c:out value="${scheduleId}" />
                            </div>
                        </div>
                    </div>

                    <!-- Selected Seats -->
                    <div class="selected-summary">
                        <div class="selected-summary-label">SELECTED SEATS</div>
                        <div class="selected-summary-value">
                            <c:forEach var="seat" items="${selectedSeats}" varStatus="loop">
                                <c:out value="${seat}" /><c:if test="${!loop.last}">, </c:if>
                            </c:forEach>
                        </div>
                    </div>

                    <!-- Price -->
                    <div class="price-summary">
                        <span class="price-label">Price per seat</span>
                        <span class="price-value">
                            <fmt:formatNumber value="${result.pricePerSeat()}"
                                              pattern="#,##0.##" /> MMK
                        </span>
                    </div>

                    <div class="total-row">
                        <span class="total-label">Total Amount</span>
                        <span class="total-value">
                            <fmt:formatNumber
                                value="${result.pricePerSeat() * fn:length(selectedSeats)}"
                                pattern="#,##0.##" /> MMK
                        </span>
                    </div>

                    <div class="notice-box">
                        <span class="notice-icon">&#9432;</span>
                        <div>
                            <strong>Before you continue</strong><br>
                            Please arrive at least 30 minutes before departure.
                            Check your traveller information carefully before proceeding.
                        </div>
                    </div>
                </div>
            </aside>

            <!-- Traveller Information -->
            <section class="traveller-card">
                <div class="card-header">
                    <div class="card-eyebrow">Passenger details</div>
                    <h2 class="card-title">Traveller Information</h2>
                    <p class="card-subtitle">
                        Enter the traveller's information for this booking.
                    </p>
                </div>

                <div class="card-content">
                    <form id="travellerForm"
                          action="${pageContext.request.contextPath}/booking/stepthree"
                          method="post"
                          class="traveller-form">

						<!-- CSRF Protection -->
						<input
						        type="hidden"
						        name="${_csrf.parameterName}"
						        value="${_csrf.token}" />
						        
                        <input type="hidden" name="busNo"
                               value="<c:out value='${result.busNo()}' />">

                        <input type="hidden" name="scheduleId"
                               value="<c:out value='${scheduleId}' />">

                        <input type="hidden" name="selectedSeats"
                               value="<c:out value='${fn:join(selectedSeats, \',\')}' />">

                        <div class="form-intro">
                            <div class="form-intro-icon">&#10003;</div>
                            <div>
                                <strong>Almost there!</strong>
                                <p>
                                    Make sure the details below are correct
                                    before moving to payment.
                                </p>
                            </div>
                        </div>

                        <!-- Full Name -->
                        <div class="form-group">
                            <label for="travellerName" class="form-label">
                                Full Name <span class="required-mark">*</span>
                            </label>
                            <input id="travellerName"
                                   type="text"
                                   name="name"
                                   value="<c:out value='${member.name}' />"
                                   class="form-control"
                                   placeholder="Enter traveller's full name"
                                   autocomplete="name"
                                   maxlength="100"
                                   required>
                        </div>

                        <!-- Gender -->
                        <div class="form-group">
                            <label for="travellerGender" class="form-label">
                                Gender <span class="required-mark">*</span>
                            </label>
                            <select id="travellerGender"
                                    name="gender"
                                    class="form-control"
                                    required>
                                <option value="" disabled
                                    ${empty member.gender ? 'selected' : ''}>
                                    Select gender
                                </option>
                                <option value="Male"
                                    ${member.gender == 'Male' ? 'selected' : ''}>
                                    Male
                                </option>
                                <option value="Female"
                                    ${member.gender == 'Female' ? 'selected' : ''}>
                                    Female
                                </option>
                            </select>
                        </div>

                        <!-- NRC -->
                        <div class="form-group">
                            <label for="travellerNrc" class="form-label">
                                NRC Number <span class="required-mark">*</span>
                            </label>
                            <input id="travellerNrc"
                                   type="text"
                                   name="nrc"
                                   value="<c:out value='${member.nrcRegion}' />/<c:out value='${member.nrcTownship}' />(<c:out value='${member.nrcType}' />)<c:out value='${member.nrcNumber}' />"
                                   class="form-control"
                                   placeholder="Enter NRC number"
                                   maxlength="50"
                                   required>
                        </div>

                        <!-- Phone -->
                        <div class="form-group">
                            <label for="travellerPhone" class="form-label">
                                Phone Number <span class="required-mark">*</span>
                            </label>
                            <input id="travellerPhone"
                                   type="tel"
                                   name="phone"
                                   value="<c:out value='${member.phone}' />"
                                   class="form-control"
                                   placeholder="Enter contact phone number"
                                   autocomplete="tel"
                                   maxlength="30"
                                   required>
                            <span class="form-hint">
                                Use a phone number that can be reached if needed.
                            </span>
                        </div>

                        <!-- Email -->
                        <div class="form-group">
                            <label for="travellerEmail" class="form-label">
                                Email Address
                            </label>
                            <input id="travellerEmail"
                                   type="email"
                                   name="email"
                                   value="<c:out value='${member.email}' />"
                                   class="form-control"
                                   autocomplete="email"
                                   readonly>
                            <span class="form-hint">
                                Your registered email address cannot be changed here.
                            </span>
                        </div>

                        <div class="form-divider"></div>

                        <!-- Special Request -->
                        <div class="form-group">
                            <label for="specialRequest" class="form-label">
                                Special Request
                                <span style="color:#82919A;font-weight:500;">
                                    (Optional)
                                </span>
                            </label>
                            <textarea id="specialRequest"
                                      name="request"
                                      rows="3"
                                      maxlength="500"
                                      class="form-control"
                                      placeholder="Any special requests for your journey?"></textarea>
                            <span class="form-hint">
                                Optional. Requests are subject to availability.
                            </span>
                        </div>

                        <!-- Submit -->
                        <div class="form-actions">
                            <button type="submit"
                                    id="continuePaymentBtn"
                                    class="continue-button">
                                Continue to Payment
                                <span aria-hidden="true">&#8594;</span>
                            </button>

                            <div class="secure-note">
                                <span aria-hidden="true">&#128274;</span>
                                Review your details before continuing
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </main>

    <!-- Floating Timer: stays visible while scrolling -->
    <div class="floating-seat-timer"
         id="seatHoldBanner"
         role="status"
         aria-live="polite">

        <span class="floating-timer-icon" aria-hidden="true">
            &#9201;
        </span>

        <div class="floating-timer-info">
            <span class="floating-timer-label" id="holdTitle">
                Seats held
            </span>
            <span class="floating-timer-value"
                  id="holdCountdown">--:--</span>
        </div>
    </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const banner = document.getElementById("seatHoldBanner");
    const countdown = document.getElementById("holdCountdown");
    const title = document.getElementById("holdTitle");
    const continueButton = document.getElementById("continuePaymentBtn");
    const form = document.getElementById("travellerForm");

    // This value must be generated from the actual database hold expiry.
    const holdUntil = Number("${holdUntilEpochMillis}");

    let timerInterval = null;
    let expired = false;

    function expireHold() {
        expired = true;

        countdown.textContent = "00:00";
        title.textContent = "Hold expired";

        banner.classList.remove("is-urgent");
        banner.classList.add("is-expired");

        continueButton.disabled = true;

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
            banner.classList.add("is-urgent");
            title.textContent = "Time left";
        } else {
            banner.classList.remove("is-urgent");
            title.textContent = "Seats held";
        }
    }

    // Do not allow the user to proceed when no valid expiry was supplied.
    if (!Number.isFinite(holdUntil) || holdUntil <= 0) {
        countdown.textContent = "--:--";
        title.textContent = "Hold unavailable";
        banner.classList.add("is-expired");
        continueButton.disabled = true;
        return;
    }

    updateCountdown();

    if (!expired) {
        timerInterval = setInterval(updateCountdown, 1000);
    }

    // Frontend safeguard only. The controller must validate the hold too.
    form.addEventListener("submit", function (event) {
        if (expired || Date.now() >= holdUntil) {
            event.preventDefault();
            expireHold();
        }
    });
});
</script>
</body>
</html>
