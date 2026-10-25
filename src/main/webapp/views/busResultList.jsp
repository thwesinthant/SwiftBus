<%@ include file="./fragments/navbar.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- FontAwesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<div class="min-h-screen bg-[#FFF7ED]">

<!-- ===================== COMPACT SEARCH BAR ===================== -->
<section class="py-4 pb-2">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        <form action="${pageContext.request.contextPath}/bus"
              method="get"
              class="bg-white rounded-xl border border-[#E1E6E9]
                     shadow-sm p-4">

            <!-- Heading -->
            <div class="flex items-center gap-2 mb-3">
                <i class="fa-solid fa-bus text-[#F2A93B]"></i>
                <h2 class="text-lg font-bold text-[#062E3D]">
                    Find Your Bus
                </h2>
            </div>

            <!-- One-row Search Fields -->
            <div class="flex flex-wrap xl:flex-nowrap
                        items-end gap-3">

                <!-- From -->
                <div class="flex-[1.2] min-w-[150px]">
                    <label for="startLocation"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        From
                    </label>

                    <select id="startLocation"
                            name="startLocation"
                            class="w-full h-10 rounded-lg border
                                   border-[#E1E6E9] bg-white px-3
                                   text-sm text-[#1E2933]
                                   focus:outline-none
                                   focus:border-[#F2A93B]
                                   focus:ring-1 focus:ring-[#F2A93B]">
                        <option value="">Select origin</option>
                        <option value="Yangon"
                            ${form.startLocation == 'Yangon' ? 'selected' : ''}>
                            Yangon
                        </option>
                        <option value="Mandalay"
                            ${form.startLocation == 'Mandalay' ? 'selected' : ''}>
                            Mandalay
                        </option>
                        <option value="Naypyitaw"
                            ${form.startLocation == 'Naypyitaw' ? 'selected' : ''}>
                            Naypyitaw
                        </option>
                        <option value="Bago"
                            ${form.startLocation == 'Bago' ? 'selected' : ''}>
                            Bago
                        </option>
                        <option value="Taunggyi"
                            ${form.startLocation == 'Taunggyi' ? 'selected' : ''}>
                            Taunggyi
                        </option>
                    </select>
                </div>

                <!-- To -->
                <div class="flex-[1.2] min-w-[150px]">
                    <label for="endLocation"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        To
                    </label>

                    <select id="endLocation"
                            name="endLocation"
                            class="w-full h-10 rounded-lg border
                                   border-[#E1E6E9] bg-white px-3
                                   text-sm text-[#1E2933]
                                   focus:outline-none
                                   focus:border-[#F2A93B]
                                   focus:ring-1 focus:ring-[#F2A93B]">
                        <option value="">Select destination</option>
                        <option value="Yangon"
                            ${form.endLocation == 'Yangon' ? 'selected' : ''}>
                            Yangon
                        </option>
                        <option value="Mandalay"
                            ${form.endLocation == 'Mandalay' ? 'selected' : ''}>
                            Mandalay
                        </option>
                        <option value="Naypyitaw"
                            ${form.endLocation == 'Naypyitaw' ? 'selected' : ''}>
                            Naypyitaw
                        </option>
                        <option value="Bago"
                            ${form.endLocation == 'Bago' ? 'selected' : ''}>
                            Bago
                        </option>
                        <option value="Taunggyi"
                            ${form.endLocation == 'Taunggyi' ? 'selected' : ''}>
                            Taunggyi
                        </option>
                    </select>
                </div>

                <!-- Travel Date -->
                <div class="flex-[1.15] min-w-[155px]">
                    <label for="travelDate"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        Travel Date
                    </label>

                    <input type="date"
                           id="travelDate"
                           name="travelDate"
                           value="${form.travelDate}"
                           class="w-full h-10 rounded-lg border
                                  border-[#E1E6E9] bg-white px-2
                                  text-sm text-[#1E2933]
                                  focus:outline-none
                                  focus:border-[#F2A93B]
                                  focus:ring-1 focus:ring-[#F2A93B]" />
                </div>

                <!-- Passenger Type -->
                <div class="flex-[0.8] min-w-[115px]">
                    <label for="passengerType"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        Passenger
                    </label>

                    <select id="passengerType"
                            name="passengerType"
                            class="w-full h-10 rounded-lg border
                                   border-[#E1E6E9] bg-white px-2
                                   text-sm text-[#1E2933]
                                   focus:outline-none
                                   focus:border-[#F2A93B]
                                   focus:ring-1 focus:ring-[#F2A93B]">
                        <option value="Local"
                            ${form.passengerType == 'Local' ? 'selected' : ''}>
                            Local
                        </option>
                        <option value="Foreigner"
                            ${form.passengerType == 'Foreigner' ? 'selected' : ''}>
                            Foreigner
                        </option>
                    </select>
                </div>

                <!-- Bus Class -->
                <div class="flex-[0.7] min-w-[95px]">
                    <label for="ticketType"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        Bus Class
                    </label>

                    <select id="ticketType"
                            name="ticketType"
                            class="w-full h-10 rounded-lg border
                                   border-[#E1E6E9] bg-white px-2
                                   text-sm text-[#1E2933]
                                   focus:outline-none
                                   focus:border-[#F2A93B]
                                   focus:ring-1 focus:ring-[#F2A93B]">
								<option value=""
								    ${empty form.ticketType ? 'selected' : ''}>
								    All bus types
								</option>
								
								<option value="AC"
								    ${form.ticketType == 'AC' ? 'selected' : ''}>
								    AC
								</option>
								
								<option value="VIP"
								    ${form.ticketType == 'VIP' ? 'selected' : ''}>
								    VIP
								</option>
								
								<option value="Sleeper"
								    ${form.ticketType == 'Sleeper' ? 'selected' : ''}>
								    Sleeper
								</option>
                    </select>
                </div>

                <!-- Seats -->
                <div class="w-[75px] shrink-0">
                    <label for="seats"
                           class="block text-xs font-medium
                                  text-[#5C6B73] mb-1.5">
                        Seats
                    </label>

                    <input type="number"
                           id="seats"
                           name="seats"
                           min="1"
                           value="${form.seats}"
                           placeholder="1"
                           class="w-full h-10 rounded-lg border
                                  border-[#E1E6E9] bg-white px-2
                                  text-sm text-[#1E2933]
                                  focus:outline-none
                                  focus:border-[#F2A93B]
                                  focus:ring-1 focus:ring-[#F2A93B]" />
                </div>

                <!-- Search Button: Same Row -->
                <div class="shrink-0">
                    <button type="submit"
                            class="h-10 px-5 rounded-lg
                                   inline-flex items-center
                                   justify-center gap-2
                                   bg-[#F2A93B] hover:bg-[#D98A1A]
                                   text-[#062E3D] text-sm font-semibold
                                   whitespace-nowrap shadow-sm
                                   transition duration-200
                                   focus:outline-none
                                   focus:ring-2
                                   focus:ring-[#F2A93B]/40">
                        <i class="fa-solid fa-magnifying-glass"></i>
                        Search
                    </button>
                </div>

            </div>
        </form>
    </div>
</section>
<!-- =================== END COMPACT SEARCH BAR =================== -->
<%-- Show filters/results only after a valid search. --%>
<c:choose>
    <c:when test="${searchPerformed}">






	
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col min-[861px]:flex-row gap-6 py-6">

<aside id="busFilters" class="card filters">
    <h4>Filter &amp; sort</h4>

    <form id="busFilterForm"
          action="${pageContext.request.contextPath}/bus"
          method="get">

        <!-- Preserve search values -->
        <input type="hidden" name="startLocation"
               value="${form.startLocation}">

        <input type="hidden" name="endLocation"
               value="${form.endLocation}">

        <input type="hidden" name="travelDate"
               value="${form.travelDate}">

        <input type="hidden" name="passengerType"
               value="${form.passengerType}">

        <input type="hidden" name="seats"
               value="${form.seats}">

        <!-- Preserve ALL active filter values -->
        <input type="hidden" name="sortBy"
               value="${form.sortBy}">

        <input type="hidden" name="ticketType"
               value="${form.ticketType}">

        <input type="hidden" name="departurePeriod"
               value="${form.departurePeriod}">

        <input type="hidden" name="busCategory"
               value="${form.busCategory}">

        <input type="hidden" name="promoCode"
               value="${form.promoCode}">

        <!-- Sort by -->
        <div class="filter-group">
            <div class="label">Sort by</div>

            <div class="chip-row">
                <button type="button"
                        data-filter="sortBy"
                        data-value="lowestPrice"
                        class="chip ${form.sortBy == 'lowestPrice' ? 'selected' : ''}">
                    Price
                </button>

                <button type="button"
                        data-filter="sortBy"
                        data-value="earliestDeparture"
                        class="chip ${form.sortBy == 'earliestDeparture' ? 'selected' : ''}">
                    Departure
                </button>

                <button type="button"
                        data-filter="sortBy"
                        data-value="duration"
                        class="chip ${form.sortBy == 'duration' ? 'selected' : ''}">
                    Duration
                </button>
            </div>
        </div>

        <!-- Dynamic Bus Types -->
        <div class="filter-group">
            <div class="label">Bus type</div>

            <div class="chip-row">
                <c:forEach var="type" items="${busTypes}">
                    <button type="button"
                            data-filter="ticketType"
                            data-value="${type.typeName}"
                            class="chip ${form.ticketType == type.typeName ? 'selected' : ''}">
                        <c:out value="${type.typeName}"/>
                    </button>
                </c:forEach>

                <button type="button"
                        data-filter="ticketType"
                        data-value=""
                        class="chip ${empty form.ticketType ? 'selected' : ''}">
                    All
                </button>
            </div>
        </div>

        <!-- Departure Time -->
        <div class="filter-group">
            <div class="label">Departure time</div>

            <div class="chip-row">
                <button type="button"
                        data-filter="departurePeriod"
                        data-value="morning"
                        class="chip ${form.departurePeriod == 'morning' ? 'selected' : ''}">
                    Morning
                </button>

                <button type="button"
                        data-filter="departurePeriod"
                        data-value="afternoon"
                        class="chip ${form.departurePeriod == 'afternoon' ? 'selected' : ''}">
                    Afternoon
                </button>

                <button type="button"
                        data-filter="departurePeriod"
                        data-value="night"
                        class="chip ${form.departurePeriod == 'night' ? 'selected' : ''}">
                    Night
                </button>

                <button type="button"
                        data-filter="departurePeriod"
                        data-value=""
                        class="chip ${empty form.departurePeriod ? 'selected' : ''}">
                    Any time
                </button>
            </div>
        </div>

    </form>
</aside>
	
  <!-- Main Results -->
<main class="flex-1 flex flex-col gap-5 min-w-0">

    <!-- Mobile Filter Toggle -->
    <div class="flex items-center justify-between gap-3 min-[861px]:hidden">
        <div>
            <h3 class="text-base font-bold text-[#062E3D]">
                Available Buses
            </h3>
            <p class="text-xs text-[#5C6B73] mt-1">
                Sort and refine your search
            </p>
        </div>

        <button type="button"
                id="filterToggleBtn"
                aria-expanded="false"
                aria-controls="busFilters"
                class="inline-flex items-center gap-2 px-4 py-2.5
                       rounded-xl border border-[#F0E5D8]
                       bg-white text-[#062E3D] text-sm font-semibold
                       shadow-sm hover:bg-[#FFF0D6] transition">

            <i class="fa-solid fa-sliders text-[#D98A1A]"></i>
            Filter &amp; Sort
            <i id="filterToggleIcon"
               class="fa-solid fa-chevron-down text-xs"></i>
        </button>
    </div>


  <c:forEach var="bus" items="${result.contents()}">

    <div 
		class="group bg-white rounded-2xl border border-gray-200
		       hover:border-orange-200 hover:shadow-xl
		       transition-all duration-300 overflow-hidden"
>

      <div class="p-5">

        <!-- Top Row -->
        <div class="flex flex-col lg:flex-row lg:items-center gap-5">

          <!-- Bus Image -->
          <div class="relative shrink-0">
            <img src="${bus.imageUrl() != null ? bus.imageUrl() : './images/banner-bus.png'}"
                 alt="Bus Image"
                 class="w-full lg:w-48 h-32 object-cover rounded-xl border border-gray-100" />

            
			<!-- Bus Type Badge -->
			<span class="absolute top-2 left-2 bg-orange-50
			             text-[#0A4F66] text-xs font-semibold
			             px-3 py-1 rounded-full shadow-sm">
			    ${bus.ticketType()}
			</span>

          </div>


          <!-- Bus Information -->
          <div class="flex-1 min-w-0">

            <!-- Bus Name -->
            <div class="flex items-center gap-2 mb-2">
              <div class="w-9 h-9 rounded-lg bg-orange-50
                          flex items-center justify-center">
                <i class="fa-solid fa-bus text-[#F2A93B]"></i>
              </div>

              <div>
                <h3 class="text-lg font-bold text-gray-900 truncate">
                  ${bus.busName()}
                </h3>

                <p class="text-xs text-gray-500">
                  Bus No. ${bus.busNo()}
                </p>
              </div>
            </div>


            <!-- Route -->
            <div class="flex items-center gap-3 mt-4">

              <!-- Start -->
              <div>
                <p class="text-xs text-gray-400 uppercase font-medium">
                  From
                </p>

                <p class="text-sm font-semibold text-gray-800">
                  ${bus.startLocation()}
                </p>
              </div>


              <!-- Route Line -->
              <div class="flex-1 flex items-center gap-2 max-w-[140px]">

               <div class="w-2.5 h-2.5 rounded-full bg-[#0A4F66]"></div>

				<div class="flex-1 border-t-2 border-dashed border-gray-300"></div>
				
				<i class="fa-solid fa-bus text-[#F2A93B] text-sm"></i>
				
				<div class="flex-1 border-t-2 border-dashed border-gray-300"></div>
				
				<div class="w-2.5 h-2.5 rounded-full bg-[#F2A93B]"></div>

              </div>


              <!-- Destination -->
              <div>
                <p class="text-xs text-gray-400 uppercase font-medium">
                  To
                </p>

                <p class="text-sm font-semibold text-gray-800">
                  ${bus.endLocation()}
                </p>
              </div>

            </div>


            
<!-- Departure + Duration + View Details -->
<div class="flex flex-wrap items-center gap-4 mt-4">

    <!-- Departure -->
    <div class="flex items-center gap-2 text-sm text-gray-600">
        <span class="w-8 h-8 rounded-lg bg-orange-50
                     flex items-center justify-center">
            <i class="fa-regular fa-clock text-[#F2A93B]"></i>
        </span>

        <div>
            <p class="text-xs text-gray-400">Departure</p>
            <p class="font-semibold text-gray-700">
                ${bus.formattedDepartureTime}
            </p>
        </div>
    </div>

    <!-- Duration -->
    <div class="h-8 w-px bg-gray-200 hidden sm:block"></div>

    <div class="flex items-center gap-2 text-sm text-gray-600">
        <span class="w-8 h-8 rounded-lg bg-orange-50
                     flex items-center justify-center">
            <i class="fa-solid fa-hourglass-half text-[#F2A93B]"></i>
        </span>

        <div>
            <p class="text-xs text-gray-400">Duration</p>
            <p class="font-semibold text-gray-700">
                ${bus.formattedDuration}
            </p>
        </div>
    </div>

   
</div>
            
          </div>


          <!-- Price + Booking -->
          <div class="lg:border-l lg:border-gray-100
                      lg:pl-6 lg:min-w-[190px]
                      flex lg:flex-col
                      items-center lg:items-end
                      justify-between gap-4">

            <div class="text-left lg:text-right">

              <p class="text-xs text-gray-400 uppercase font-medium mb-1">
                Price per seat
              </p>

              <div class="flex items-baseline gap-1 justify-end">
                <span class="text-xs font-medium text-gray-500">
                  MMK
                </span>

                <span class="text-2xl font-extrabold text-gray-900">
                  <fmt:formatNumber
                      value="${bus.pricePerSeat()}"
                      type="number"
                      groupingUsed="true" />
                </span>
              </div>

            </div>


            <form action="/bus/booking/${bus.busNo()}" method="get"
                  class="w-full lg:w-auto">

              <input type="hidden"
                     name="scheduleId"
                     value="${bus.scheduleId()}" />

              <button type="submit"
        class="w-full lg:w-auto
               bg-[#F2A93B] hover:bg-[#D98A1A]
               active:bg-[#B87412]
               text-[#062E3D] text-sm font-semibold
               px-5 py-2.5 rounded-xl
               shadow-sm hover:shadow-md
               flex items-center justify-center gap-2
               transition-all duration-200">
  
  Book Seat
</button>

            </form>

          </div>

        </div>

      </div>


      <!-- Bottom Info Bar -->
      <div class="px-5 py-2.5 bg-[#F7F9FA] border-t border-gray-100
            flex items-center justify-between">

        <div class="flex items-center gap-2 text-xs text-gray-500">
          <i class="fa-solid fa-shield-halved text-green-500"></i>
          Secure booking
        </div>

        <div class="flex items-center gap-2 text-xs text-gray-500">
          <i class="fa-solid fa-location-dot text-[#0A4F66]"></i>
          ${bus.startLocation()} &rarr; ${bus.endLocation()}
        </div>

      </div>

    </div>

  </c:forEach>


	<!-- No Results -->
	<c:if test="${empty result.contents()}">
	
	  <div class="bg-white border border-[#E1E6E9] rounded-2xl
	              py-16 px-6 text-center shadow-sm">
	
	    <!-- No Results Icon -->
	    <div class="w-16 h-16 mx-auto mb-5
	                rounded-full bg-[#FFF0D6]
	                flex items-center justify-center">
	
	      <i class="fa-solid fa-magnifying-glass
	                text-2xl text-[#0F6E8C]"></i>
	
	    </div>
	
	    <!-- Heading -->
	    <h3 class="text-lg font-bold text-[#062E3D] mb-2">
	      No buses found
	    </h3>
	
	    <!-- Description -->
	    <p class="text-sm text-[#5C6B73] max-w-md mx-auto leading-relaxed">
	      We couldn't find any buses matching your search criteria.
	      Try changing your route or travel date.
	    </p>
	
	    <!-- Modify Search Button -->
	    <button type="button"
	            onclick="history.back()"
	            class="mt-6 inline-flex items-center justify-center gap-2
	                   px-5 py-2.5 rounded-xl
	                   bg-[#F2A93B] hover:bg-[#D98A1A]
	                   active:bg-[#B87412]
	                   text-[#062E3D] text-sm font-semibold
	                   shadow-sm hover:shadow-md
	                   transition-all duration-200
	                   focus:outline-none focus:ring-2
	                   focus:ring-[#F2A93B]/40">
	
	      <i class="fa-solid fa-arrow-left"></i>
	      Modify Search
	
	    </button>
	
	  </div>
	
	</c:if>
	
	 
</main>
</div>
</div>
    </c:when>

    <c:otherwise>
        <section class="max-w-7xl mx-auto px-4 py-12">
            <div class="bg-white rounded-2xl border border-[#E1E6E9]
                        shadow-sm p-8 text-center">
                <i class="fa-solid fa-bus text-[#F2A93B] text-4xl mb-4"></i>

                <h2 class="text-xl font-bold text-[#062E3D] mb-2">
                    Find Your Next Journey
                </h2>

                <p class="text-sm text-[#5C6B73]">
                    Select your departure city, destination, and travel date
                    above to find available buses.
                </p>
            </div>
        </section>
    </c:otherwise>
</c:choose>


<script>
document.addEventListener('DOMContentLoaded', function () {

    // Mobile filter toggle
    const filterToggleBtn = document.getElementById('filterToggleBtn');
    const busFilters = document.getElementById('busFilters');
    const filterToggleIcon = document.getElementById('filterToggleIcon');

    if (filterToggleBtn && busFilters && filterToggleIcon) {
        filterToggleBtn.addEventListener('click', function () {
            const isOpen = busFilters.classList.toggle('open');

            filterToggleBtn.setAttribute('aria-expanded', String(isOpen));

            filterToggleIcon.classList.toggle('fa-chevron-down', !isOpen);
            filterToggleIcon.classList.toggle('fa-chevron-up', isOpen);
        });
    }

    // Bus filters and sorting
    const busFilterForm = document.getElementById('busFilterForm');

    if (!busFilterForm) {
        console.error('ERROR: busFilterForm was not found.');
        return;
    }

    busFilterForm.querySelectorAll('button[data-filter]').forEach(function (button) {
        button.addEventListener('click', function () {
            const filterName = this.dataset.filter;
            const filterValue = this.dataset.value;

            const hiddenInput = Array.from(
                busFilterForm.querySelectorAll('input[type="hidden"]')
            ).find(function (input) {
                return input.name === filterName;
            });

            if (!hiddenInput) {
                console.error('ERROR: Hidden input not found:', filterName);
                return;
            }

            hiddenInput.value = filterValue;

            console.log('Filter clicked:', filterName, '=', filterValue);
            console.log('Submitting form:', busFilterForm.action);

            busFilterForm.requestSubmit();
        });
    });

    console.log('Bus filters initialized successfully.');
});
</script>

</body>
</html>
