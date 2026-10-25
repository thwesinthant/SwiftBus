
<%@ include file="fragments/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>

:root {
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
}

/* =========================================
   PAGE LAYOUT
========================================= */

* {
    box-sizing: border-box;
}

.seat-page {
    min-height: 100vh;
    background: var(--sb-bg);
    padding: 16px 20px 32px;
    color: var(--sb-deep);
}

.seat-container {
    width: 100%;
    max-width: 1180px;
    margin: 0 auto;
}

/* =========================================
   COMPACT BOOKING PROGRESS
========================================= */

.booking-progress {
    background: var(--sb-white);
    border: 1px solid #E3EBEF;
    border-radius: 14px;
    padding: 13px 20px 15px;
    margin-bottom: 18px;
    box-shadow: 0 3px 12px rgba(6, 46, 61, 0.035);
}

.progress-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
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
    margin: 3px 0 0;
    color: var(--sb-deep);
    font-size: 16px;
    line-height: 1.3;
    font-weight: 800;
}

.progress-count {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    flex-shrink: 0;
    background: #FFF4DF;
    color: #98600D;
    border: 1px solid #F5D9A5;
    border-radius: 7px;
    padding: 5px 8px;
    font-size: 10px;
    font-weight: 800;
    white-space: nowrap;
}

.progress-count span {
    color: #B58B4D;
    font-weight: 600;
}

.progress-track {
    display: flex;
    align-items: center;
    gap: 9px;
    width: 100%;
}

.progress-step {
    display: flex;
    align-items: center;
    gap: 8px;
    flex-shrink: 0;
    min-width: 0;
}

.progress-node {
    width: 30px;
    height: 30px;
    flex-shrink: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 9px;
    background: #F0F4F6;
    border: 1px solid #E1E9ED;
    color: #7A8B95;
    font-size: 12px;
    font-weight: 800;
    transition: background 0.2s ease, color 0.2s ease;
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
    font-weight: 600;
    line-height: 1.3;
}

.progress-caption {
    color: #A0ADB3;
    font-size: 9px;
    line-height: 1.3;
}

.progress-connector {
    height: 2px;
    flex: 1;
    min-width: 10px;
    border-radius: 10px;
    background: #E3EBEF;
}

/* Current step */

.progress-step.active .progress-node {
    background: var(--sb-gold);
    border-color: var(--sb-gold);
    color: var(--sb-deep);
    box-shadow: 0 0 0 3px rgba(242, 169, 59, 0.15);
}

.progress-step.active .progress-title {
    color: var(--sb-deep);
    font-weight: 800;
}

.progress-step.active .progress-caption {
    color: #A66B13;
}

/* Completed steps */

.progress-step.completed .progress-node {
    background: var(--sb-primary);
    border-color: var(--sb-primary);
    color: #FFFFFF;
}

.progress-step.completed .progress-title {
    color: var(--sb-primary);
}

.progress-connector.completed {
    background: var(--sb-primary);
}

/* =========================================
   MAIN CONTENT GRID
========================================= */

.seat-layout {
    display: grid;
    grid-template-columns: minmax(270px, 0.8fr) minmax(0, 1.5fr);
    gap: 18px;
    align-items: start;
}

/* =========================================
   SHARED CARDS
========================================= */

.sb-card {
    min-width: 0;
    background: var(--sb-white);
    border: 1px solid var(--sb-border);
    border-radius: 16px;
    box-shadow: 0 5px 20px rgba(6, 46, 61, 0.04);
    overflow: hidden;
}

.sb-card-content {
    padding: 20px;
}

.sb-eyebrow {
    margin-bottom: 6px;
    color: var(--sb-primary);
    font-size: 10px;
    text-transform: uppercase;
    letter-spacing: 1.3px;
    font-weight: 800;
}

.sb-heading {
    margin: 0;
    color: var(--sb-deep);
    font-size: 20px;
    line-height: 1.3;
    font-weight: 800;
}

.sb-subtitle {
    margin-top: 6px;
    color: var(--sb-muted);
    font-size: 12px;
    line-height: 1.5;
}

/* =========================================
   TRIP SUMMARY
========================================= */

.route-box {
    margin-top: 18px;
    padding: 15px;
    border-radius: 12px;
    background: #F2F8FA;
    border: 1px solid #E0EEF2;
}

.route-point {
    display: flex;
    gap: 11px;
    align-items: flex-start;
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
    font-size: 15px;
    font-weight: 800;
    color: var(--sb-deep);
    overflow-wrap: anywhere;
}

.route-caption {
    margin-top: 3px;
    color: var(--sb-muted);
    font-size: 11px;
}

.route-connector {
    height: 22px;
    border-left: 2px dashed #A7C9D3;
    margin: 4px 0 4px 5px;
}

.trip-details {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 15px 12px;
    margin-top: 20px;
}

.detail-label {
    margin-bottom: 5px;
    color: #82919A;
    font-size: 10px;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.detail-value {
    color: var(--sb-deep);
    font-size: 12px;
    line-height: 1.5;
    font-weight: 700;
    overflow-wrap: anywhere;
}

.type-badge {
    display: inline-flex;
    align-items: center;
    padding: 5px 9px;
    background: #E8F5F8;
    color: var(--sb-primary);
    border-radius: 7px;
    font-size: 11px;
    font-weight: 800;
}

/* Selected seat summary */

.selected-summary {
    margin-top: 18px;
    padding: 14px;
    background: #FFF9EF;
    border: 1px solid #F3DDB7;
    border-radius: 11px;
}

.selected-summary-label {
    font-size: 11px;
    color: #8B6B36;
    font-weight: 700;
}

.selected-summary-value {
    margin-top: 6px;
    color: #A66B13;
    font-size: 14px;
    font-weight: 800;
    overflow-wrap: anywhere;
}

/* Notice */

.notice-box {
    display: flex;
    gap: 10px;
    align-items: flex-start;
    margin-top: 16px;
    padding: 12px;
    background: #FFF7ED;
    border: 1px solid #F5D9AC;
    border-radius: 10px;
    color: #895A12;
    font-size: 11px;
    line-height: 1.6;
}

.notice-icon {
    flex-shrink: 0;
    font-size: 16px;
}

/* =========================================
   SEAT CARD HEADER
========================================= */

.seat-card-header {
    padding: 20px 20px 16px;
    border-bottom: 1px solid #EDF1F3;
}

.seat-legend {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 13px;
    margin-top: 15px;
}

.legend-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: #647984;
    font-size: 10px;
    font-weight: 600;
}

.legend-swatch {
    width: 12px;
    height: 12px;
    flex-shrink: 0;
    border-radius: 4px;
    border: 1px solid transparent;
}

.legend-available {
    background: #E1F4EA;
    border-color: #8FC9A8;
}

.legend-booked {
    background: #D7DEE2;
    border-color: #C2CCD1;
}

.legend-held {
    background: #FFF0C7;
    border-color: #E9C76D;
}

.legend-selected {
    background: var(--sb-gold);
    border-color: var(--sb-gold-dark);
}

/* =========================================
   BUS BODY
========================================= */

.bus-body {
    width: 100%;
    max-width: 380px;
    margin: 16px auto 0;
    padding: 15px 13px 20px;
    background: #F8FBFC;
    border: 2px solid #D7E5E9;
    border-radius: 62px 62px 20px 20px;
}

.bus-front {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    gap: 8px;
    padding: 5px 7px 13px;
    margin-bottom: 15px;
    border-bottom: 2px dashed #D5E3E7;
    color: #7A929C;
    font-size: 9px;
    font-weight: 800;
    letter-spacing: 1px;
}

.driver-icon {
    width: 32px;
    height: 27px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 8px;
    background: #E3EEF2;
    font-size: 16px;
}

/* =========================================
   SEAT GRID
========================================= */

#seatGrid {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
}

.seat-row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) 24px minmax(0, 1fr) minmax(0, 1fr);
    align-items: center;
    justify-items: center;
    gap: 6px;
    width: 100%;
}

.seat-aisle {
    width: 100%;
}

.seat-button {
    position: relative;
    width: 100%;
    max-width: 52px;
    min-width: 0;
    height: 42px;
    padding: 0 2px 3px;
    border-radius: 10px 10px 6px 6px;
    border: 1px solid #8FC9A8;
    background: #E1F4EA;
    color: #236344;
    font-size: 12px;
    font-weight: 800;
    cursor: pointer;
    transition:
        transform 0.15s ease,
        box-shadow 0.15s ease,
        background 0.15s ease;
}

.seat-button::after {
    content: "";
    position: absolute;
    left: 6px;
    right: 6px;
    bottom: 4px;
    height: 3px;
    border-radius: 3px;
    background: rgba(35, 99, 68, 0.16);
}

.seat-button:not(:disabled):hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 10px rgba(15, 110, 140, 0.13);
}

.seat-button:focus-visible {
    outline: 3px solid rgba(79, 184, 214, 0.65);
    outline-offset: 2px;
}

/* Booked seats */

.seat-button.booked {
    background: #D7DEE2;
    border-color: #C2CCD1;
    color: #687780;
    cursor: not-allowed;
}

/* Held seats */

.seat-button.held {
    background: #FFF0C7;
    border-color: #E9C76D;
    color: #8A6513;
    cursor: not-allowed;
}

/* Selected seats — ORANGE */

.seat-button.selected {
    background: var(--sb-gold);
    border-color: var(--sb-gold-dark);
    color: var(--sb-deep);
    box-shadow: 0 4px 10px rgba(217, 138, 26, 0.22);
}

.seat-button.selected::after {
    background: rgba(6, 46, 61, 0.2);
}

/* Empty seat message */

.seat-empty {
    padding: 20px 12px;
    text-align: center;
    color: var(--sb-muted);
    font-size: 12px;
}

/* =========================================
   SEAT FOOTER & ACTION BUTTONS
========================================= */

.seat-footer {
    padding: 15px 20px 20px;
    border-top: 1px solid #EDF1F3;
}

.seat-help {
    color: var(--sb-muted);
    font-size: 11px;
    line-height: 1.6;
}

.seat-actions {
    display: flex;
    gap: 10px;
    margin-top: 16px;
}

.sb-button {
    min-height: 43px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    border-radius: 10px;
    padding: 10px 16px;
    font-family: inherit;
    font-size: 12px;
    font-weight: 800;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    transition:
        background 0.2s ease,
        border-color 0.2s ease,
        transform 0.2s ease,
        box-shadow 0.2s ease;
}

.sb-button:active {
    transform: scale(0.98);
}

/* Cancel / Back */

.sb-button-secondary {
    flex: 0.8;
    color: var(--sb-dark);
    background: #FFFFFF;
    border: 1px solid #C8D8DE;
}

.sb-button-secondary:hover {
    background: #F2F8FA;
    border-color: #A7C9D3;
}

/* Confirm & Continue — ORANGE */

.sb-button-primary {
    flex: 1.5;
    color: var(--sb-deep);
    background: var(--sb-gold);
    border: 1px solid var(--sb-gold);
    box-shadow: 0 3px 8px rgba(217, 138, 26, 0.12);
}

.sb-button-primary:hover {
    background: var(--sb-gold-dark);
    border-color: var(--sb-gold-dark);
    color: #FFFFFF;
    box-shadow: 0 4px 12px rgba(217, 138, 26, 0.2);
}

.sb-button-primary:disabled {
    opacity: 0.55;
    cursor: not-allowed;
    box-shadow: none;
    transform: none;
}

/* =========================================
   TABLET — 900px AND BELOW
========================================= */

@media (max-width: 900px) {
    .seat-page {
        padding: 14px 16px 28px;
    }

    .seat-layout {
        grid-template-columns: minmax(0, 1fr);
        gap: 16px;
    }

    .booking-progress {
        padding: 13px 16px 14px;
        margin-bottom: 15px;
    }

    .progress-caption {
        display: none;
    }

    .progress-step {
        flex: 0 1 auto;
    }

    .progress-connector {
        min-width: 8px;
    }

    .sb-card-content {
        padding: 20px;
    }

    .seat-card-header {
        padding: 20px 20px 16px;
    }

    .bus-body {
        max-width: 390px;
        margin-top: 15px;
    }
}

/* =========================================
   MOBILE — 560px AND BELOW
========================================= */

@media (max-width: 560px) {
    .seat-page {
        padding: 10px 10px 24px;
    }

    .seat-container {
        width: 100%;
    }

    /* Compact progress card */

    .booking-progress {
        padding: 11px 10px 13px;
        margin-bottom: 12px;
        border-radius: 12px;
    }

    .progress-heading {
        gap: 8px;
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
        padding: 5px 6px;
        font-size: 9px;
    }

    .progress-track {
        gap: 4px;
    }

    .progress-step {
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
        gap: 5px;
        flex: 1;
        min-width: 0;
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
        white-space: normal;
        min-height: 24px;
    }

    .progress-title {
        font-size: 9px;
        line-height: 1.25;
        overflow-wrap: anywhere;
    }

    .progress-caption {
        display: none;
    }

    .progress-connector {
        flex: 0 1 18px;
        min-width: 4px;
        margin-bottom: 20px;
    }

    /* Cards */

    .seat-layout {
        gap: 12px;
    }

    .sb-card {
        border-radius: 13px;
    }

    .sb-card-content {
        padding: 16px;
    }

    .seat-card-header {
        padding: 16px 14px 13px;
    }

    .sb-eyebrow {
        font-size: 9px;
        margin-bottom: 5px;
    }

    .sb-heading {
        font-size: 18px;
    }

    .sb-subtitle {
        font-size: 11px;
        line-height: 1.5;
    }

    /* Route summary */

    .route-box {
        margin-top: 14px;
        padding: 12px;
    }

    .route-city {
        font-size: 14px;
    }

    .route-caption {
        font-size: 10px;
    }

    .trip-details {
        gap: 13px 10px;
        margin-top: 16px;
    }

    .detail-label {
        font-size: 9px;
    }

    .detail-value {
        font-size: 11px;
    }

    .type-badge {
        padding: 4px 7px;
        font-size: 10px;
    }

    .selected-summary {
        margin-top: 14px;
        padding: 12px;
    }

    .notice-box {
        margin-top: 12px;
        padding: 10px;
        font-size: 10px;
    }

    /* Seat legend */

    .seat-legend {
        gap: 8px 10px;
        margin-top: 12px;
    }

    .legend-item {
        gap: 5px;
        font-size: 9px;
    }

    .legend-swatch {
        width: 11px;
        height: 11px;
    }

    /* Bus seat map */

    .bus-body {
        max-width: 340px;
        margin-top: 12px;
        padding: 12px 9px 16px;
        border-radius: 48px 48px 16px 16px;
    }

    .bus-front {
        gap: 6px;
        padding: 4px 5px 11px;
        margin-bottom: 12px;
        font-size: 8px;
    }

    .driver-icon {
        width: 29px;
        height: 25px;
        font-size: 15px;
    }

    #seatGrid {
        gap: 9px;
    }

    .seat-row {
        grid-template-columns:
            minmax(0, 1fr)
            minmax(0, 1fr)
            18px
            minmax(0, 1fr)
            minmax(0, 1fr);
        gap: 4px;
    }

    .seat-button {
        max-width: 48px;
        height: 39px;
        border-radius: 8px 8px 5px 5px;
        font-size: 11px;
    }

    .seat-button::after {
        left: 5px;
        right: 5px;
        bottom: 3px;
        height: 2px;
    }

    .seat-empty {
        padding: 16px 8px;
        font-size: 11px;
    }

    /* Footer and buttons */

    .seat-footer {
        padding: 13px 14px 16px;
    }

    .seat-help {
        font-size: 10px;
    }

    .seat-actions {
        flex-direction: column-reverse;
        gap: 8px;
        margin-top: 13px;
    }

    .sb-button-secondary,
    .sb-button-primary {
        width: 100%;
        min-height: 42px;
        flex: auto;
        font-size: 12px;
    }
}

/* =========================================
   EXTRA SMALL MOBILE — 360px AND BELOW
========================================= */

@media (max-width: 360px) {
    .seat-page {
        padding: 8px 7px 20px;
    }

    .booking-progress {
        padding: 10px 7px 11px;
    }

    .progress-track {
        gap: 3px;
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
        margin-bottom: 19px;
    }

    .progress-count {
        font-size: 8px;
        padding: 4px 5px;
    }

    .bus-body {
        padding: 10px 6px 14px;
    }

    .seat-row {
        grid-template-columns:
            minmax(0, 1fr)
            minmax(0, 1fr)
            14px
            minmax(0, 1fr)
            minmax(0, 1fr);
        gap: 3px;
    }

    .seat-button {
        height: 35px;
        font-size: 10px;
    }

    .seat-legend {
        gap: 7px;
    }

    .legend-item {
        font-size: 8px;
    }
}
</style>

<div class="seat-page">
    <div class="seat-container">


<c:if test="${not empty error}">
    <div role="alert"
         style="margin-bottom: 16px; padding: 14px 16px;
                background: #FFF7ED; border: 1px solid #F5D9AC;
                border-radius: 10px; color: #895A12;
                font-size: 13px; line-height: 1.6;">
        <strong>Seat availability changed</strong><br>
        <c:out value="${error}" />
    </div>
</c:if>

		<!-- Compact Booking Progress -->
		<div class="booking-progress">
		    <div class="progress-heading">
			    <h2>Booking Progress</h2>
			    <span class="progress-count">Step 1 of 4</span>
			</div>
		
		    <div class="progress-track">
		        <div class="progress-step active">
		            <div class="progress-node">1</div>
		            <span class="progress-title">Select Seat</span>
		        </div>
		
		        <div class="progress-connector"></div>
		
		        <div class="progress-step">
		            <div class="progress-node">2</div>
		            <span class="progress-title">Traveller</span>
		        </div>
		
		        <div class="progress-connector"></div>
		
		        <div class="progress-step">
		            <div class="progress-node">3</div>
		            <span class="progress-title">Payment</span>
		        </div>
		
		        <div class="progress-connector"></div>
		
		        <div class="progress-step">
		            <div class="progress-node">4</div>
		            <span class="progress-title">Confirmation</span>
		        </div>
		    </div>
		</div>
		
		        
        <div class="seat-layout">

            <!-- Left: Trip Summary -->
            <aside class="sb-card">
                <div class="sb-card-content">
                    <div class="sb-eyebrow">Your journey</div>
                    <h2 class="sb-heading">Trip Summary</h2>
                    <p class="sb-subtitle">
                        Review your trip details before choosing your seats.
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
                                <c:out value="${result.scheduleId()}" />
                            </div>
                        </div>

                        <div>
                            <div class="detail-label">Price / Seat</div>
                            <div class="detail-value">
                                <fmt:formatNumber
                                    value="${result.pricePerSeat()}"
                                    pattern="#,##0.##" /> MMK
                            </div>
                        </div>
                    </div>

                    <div class="selected-summary">
                        <div class="selected-summary-label">
                            SELECTED SEATS
                        </div>
                        <div class="selected-summary-value" id="selectedSeats">
                            None selected
                        </div>
                    </div>

                    <div class="notice-box">
                        <span class="notice-icon">&#9432;</span>
                        <div>
                            <strong>Before you continue</strong><br>
                            Please arrive at least 30 minutes before departure.
                            Check your selected seats carefully before proceeding.
                        </div>
                    </div>
                </div>
            </aside>

            <!-- Right: Seat Selection -->
            <section class="sb-card">
                <div class="seat-card-header">
                    <div class="sb-eyebrow">Choose your place</div>
                    <h1 class="sb-heading">Select Your Seat</h1>
                    <p class="sb-subtitle">
                        Tap an available seat to select it. Tap it again to deselect.
                    </p>

                    <div class="seat-legend">
                        <div class="legend-item">
                            <span class="legend-swatch legend-available"></span>
                            Available
                        </div>
                        <div class="legend-item">
                            <span class="legend-swatch legend-booked"></span>
                            Booked
                        </div>
                        <div class="legend-item">
                            <span class="legend-swatch legend-held"></span>
                            Held
                        </div>
                        <div class="legend-item">
                            <span class="legend-swatch legend-selected"></span>
                            Selected
                        </div>
                    </div>
                </div>

                <div class="sb-card-content">
                    <div class="bus-body">
                        <div class="bus-front">
                            <span>FRONT OF BUS</span>
                            <span class="driver-icon">&#9781;</span>
                        </div>

                        <div id="seatGrid">
                            <div class="seat-empty">Loading seats...</div>
                        </div>
                    </div>
                </div>

                <div class="seat-footer">
                    <p class="seat-help">
                        Select the seat numbers you want. Booked and held seats
                        cannot be selected. Your choices will be submitted when
                        you continue.
                    </p>

                    <div class="seat-actions">
                        <button
                            type="button"
                            id="cancelBtn"
                            class="sb-button sb-button-secondary">
                             Cancel
                        </button>

                        <form
                            id="continueForm"
                            action="${pageContext.request.contextPath}/booking/steptwo"
                            method="post"
                            style="display: contents;">

						<!-- CSRF Protection -->
						    <input
						        type="hidden"
						        name="${_csrf.parameterName}"
						        value="${_csrf.token}" />

                            <input
                                type="hidden"
                                name="busNo"
                                value="<c:out value='${result.busNo()}' />">

                            <input
                                type="hidden"
                                name="scheduleId"
                                value="<c:out value='${result.scheduleId()}' />">

                            <input
                                type="hidden"
                                id="selectedSeatsInput"
                                name="selectedSeats"
                                value="">

                            <button
                                type="submit"
                                id="continueBtn"
                                class="sb-button sb-button-primary">
                                Confirm &amp; Continue
                            </button>
                        </form>
                    </div>
                </div>
            </section>

        </div>
    </div>
</div>


<script>
document.addEventListener('DOMContentLoaded', function () {
    const seatGrid = document.getElementById('seatGrid');
    const selectedSeatsSpan = document.getElementById('selectedSeats');
    const selectedSeatsInput = document.getElementById('selectedSeatsInput');
    const continueForm = document.getElementById('continueForm');
    const continueBtn = document.getElementById('continueBtn');
    const cancelBtn = document.getElementById('cancelBtn');

    const contextPath =
        '<c:out value="${pageContext.request.contextPath}" />';

    const busNo =
        '<c:out value="${result.busNo()}" />';

    const scheduleId =
        '<c:out value="${result.scheduleId()}" />';

    const statusUrl =
        contextPath + '/bus/booking/' +
        encodeURIComponent(busNo) + '/seat-status?scheduleId=' +
        encodeURIComponent(scheduleId);

    // Initial seat data from Spring Boot.
    const seats = [
        <c:forEach var="seat" items="${seats}" varStatus="status">
        {
            seatNumber: Number("<c:out value='${seat.seatNumber}' />"),
            booked: ${seat.booked},
            held: ${seat.held},
            heldByCurrentUser: ${seat.heldByCurrentUser},
            selected: ${seat.heldByCurrentUser}
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    // Restore previous choices after a failed booking attempt.
    const previouslySelectedSeatNumbers = [
        <c:forEach var="previousSeat"
                   items="${previouslySelectedSeats}"
                   varStatus="status">
        Number("<c:out value='${previousSeat}' />")<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];

    seats.forEach(function (seat) {
        if (
            previouslySelectedSeatNumbers.includes(seat.seatNumber) &&
            !seat.booked &&
            !seat.held
        ) {
            seat.selected = true;
        }
    });

    function updateSelection() {
        const selectedNumbers = seats
            .filter(function (seat) {
                return seat.selected;
            })
            .map(function (seat) {
                return seat.seatNumber;
            });

        selectedSeatsSpan.textContent = selectedNumbers.length
            ? selectedNumbers.join(', ')
            : 'None selected';

        selectedSeatsInput.value = selectedNumbers.join(',');

        continueBtn.disabled = selectedNumbers.length === 0;
    }

    // Update one seat button without rebuilding the whole seat layout.
    function updateSeatButton(button, seat) {
        button.className = 'seat-button';
        button.disabled = false;
        button.title = 'Select seat ' + seat.seatNumber;

        if (seat.booked) {
            button.classList.add('booked');
            button.disabled = true;
            button.title = 'Already booked';
            return;
        }

        if (seat.held && !seat.heldByCurrentUser) {
            button.classList.add('held');
            button.disabled = true;
            button.title = 'Currently held by another user';
            return;
        }

        if (seat.selected) {
            button.classList.add('selected');
            button.title = 'Your selected seat — click to deselect';
            return;
        }

        if (seat.heldByCurrentUser) {
            button.classList.add('held');
            button.title = 'Your existing hold — click to select again';
        }
    }

    function renderSeats() {
        seatGrid.innerHTML = '';

        if (seats.length === 0) {
            const message = document.createElement('div');
            message.className = 'seat-empty';
            message.textContent =
                'No seat information is available for this trip.';
            seatGrid.appendChild(message);
            updateSelection();
            return;
        }

        // Four seats per row: 2 seats + aisle + 2 seats.
        for (let i = 0; i < seats.length; i += 4) {
            const row = document.createElement('div');
            row.className = 'seat-row';

            for (let j = 0; j < 4; j++) {
                const index = i + j;

                if (j === 2) {
                    const aisle = document.createElement('div');
                    aisle.className = 'seat-aisle';
                    aisle.setAttribute('aria-hidden', 'true');
                    row.appendChild(aisle);
                }

                if (index < seats.length) {
                    const seat = seats[index];
                    const button = document.createElement('button');

                    button.type = 'button';
                    button.dataset.seatNumber = seat.seatNumber;
                    button.textContent = seat.seatNumber;
                    button.setAttribute(
                        'aria-label',
                        'Seat ' + seat.seatNumber
                    );

                    updateSeatButton(button, seat);
                    row.appendChild(button);
                } else {
                    row.appendChild(document.createElement('div'));
                }
            }

            seatGrid.appendChild(row);
        }

        updateSelection();
    }

    // Refresh seat statuses from the backend.
    let pollingInProgress = false;

    async function refreshSeatStatuses() {
        if (pollingInProgress || document.hidden) {
            return;
        }

        pollingInProgress = true;

        try {
            const response = await fetch(statusUrl, {
                method: 'GET',
                headers: {
                    'Accept': 'application/json'
                },
                credentials: 'same-origin',
                cache: 'no-store'
            });

            if (!response.ok) {
                throw new Error(
                    'Seat status request failed: ' + response.status
                );
            }

            const contentType =
                response.headers.get('content-type') || '';

            if (!contentType.includes('application/json')) {
                throw new Error('Expected JSON seat status data.');
            }

            const latestSeats = await response.json();

            if (!Array.isArray(latestSeats)) {
                throw new Error('Invalid seat status response.');
            }

            const latestByNumber = new Map();

            latestSeats.forEach(function (latest) {
                latestByNumber.set(
                    Number(latest.seatNumber),
                    latest
                );
            });

            seats.forEach(function (seat) {
                const latest = latestByNumber.get(
                    Number(seat.seatNumber)
                );

                // Keep existing state if this seat was not returned.
                if (!latest) {
                    return;
                }

                seat.booked = latest.booked === true;
                seat.held = latest.held === true;
                seat.heldByCurrentUser =
                    latest.heldByCurrentUser === true;

                // A seat no longer available to this user
                // cannot remain selected locally.
                if (
                    seat.booked ||
                    (seat.held && !seat.heldByCurrentUser)
                ) {
                    seat.selected = false;
                }

                // Keep other local selections unchanged.
            });

            // Update existing buttons; don't rebuild the seat grid.
            const buttons = seatGrid.querySelectorAll(
                'button[data-seat-number]'
            );

            buttons.forEach(function (button) {
                const seatNumber = Number(button.dataset.seatNumber);

                const seat = seats.find(function (item) {
                    return Number(item.seatNumber) === seatNumber;
                });

                if (seat) {
                    updateSeatButton(button, seat);
                }
            });

            updateSelection();

        } catch (error) {
            // Keep the current layout if polling temporarily fails.
            console.warn('Unable to refresh seat statuses:', error);

        } finally {
            pollingInProgress = false;
        }
    }

    // Handle seat selection.
    seatGrid.addEventListener('click', function (event) {
        const button = event.target.closest(
            'button[data-seat-number]'
        );

        if (!button || button.disabled) {
            return;
        }

        const seatNumber = Number(button.dataset.seatNumber);

        const seat = seats.find(function (item) {
            return Number(item.seatNumber) === seatNumber;
        });

        if (
            !seat ||
            seat.booked ||
            (seat.held && !seat.heldByCurrentUser)
        ) {
            return;
        }

        seat.selected = !seat.selected;

        updateSeatButton(button, seat);
        updateSelection();
    });

    // Validate the selected seats before submitting.
    continueForm.addEventListener('submit', function (event) {
        const selectedNumbers = seats
            .filter(function (seat) {
                return seat.selected;
            })
            .map(function (seat) {
                return seat.seatNumber;
            });

        if (selectedNumbers.length === 0) {
            event.preventDefault();
            alert('Please select at least one seat before continuing.');
            return;
        }

        selectedSeatsInput.value = selectedNumbers.join(',');
        continueBtn.disabled = true;
    });

    cancelBtn.addEventListener('click', function () {
        window.location.href =
            contextPath + '/bus/booking/' +
            encodeURIComponent(busNo) +
            '?scheduleId=' + encodeURIComponent(scheduleId);
    });

    // Draw the initial layout once.
    renderSeats();

    // Get fresh seat statuses immediately, then every 3 seconds.
    refreshSeatStatuses();

    const pollingTimer = setInterval(
        refreshSeatStatuses,
        3000
    );

    // Stop polling when leaving the page.
    window.addEventListener('pagehide', function () {
        clearInterval(pollingTimer);
    });
});
</script>
