<%@ include file="fragments/navbar.jsp" %>

<!-- SEARCH RESULT SEARCH BOX SECTION -->
<div class="flex flex-col mt-20 px-4 lg:px-20 shadow">

	<!-- Ticket & Passenger Type -->
	<div class="flex flex-wrap gap-6 justify-center">
		<!-- Ticket Type -->
		<div class="w-full sm:w-[45%] lg:w-auto">

			<select id="ticketType" required
				class="w-full px-3 py-2.5 border text-sm border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-500">
				<option selected disabled>Select</option>
				<option>AC Seater</option>
				<option>VIP</option>
				<option>Sleeper</option>
			</select>
		</div>

		<!-- Passenger Type -->
		<div class="w-full sm:w-[45%] lg:w-auto">

			<select id="passengerType" required
				class="w-full px-3 py-2.5 border text-sm border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-500">
				<option selected disabled>Select</option>
				<option>Local</option>
				<option>Foreigner</option>
			</select>
		</div>
	</div>

	<div class="text-gray-900 mx-auto w-fit">
		<!-- Main Search Form -->
		<form
			class="flex  flex-wrap items-end justify-center shadow-md p-6 rounded-xl bg-pink-100 gap-6 lg:gap-10 max-w-[1200px] mx-auto w-full">

			<!-- From -->
			<div class="w-full sm:w-[45%] lg:w-auto">
				<label for="from"
					class="block mb-1 text-sm font-medium text-gray-700">From</label>
				<div class="relative">
					<select id="from"
						class="peer block w-full appearance-none bg-transparent border-0 border-b-2 border-gray-300 py-2.5 pr-8 text-sm text-gray-700 focus:border-blue-600 focus:outline-none focus:ring-0">
						<option selected>Choose a country</option>
						<option value="US">United States</option>
						<option value="CA">Canada</option>
						<option value="FR">France</option>
						<option value="DE">Germany</option>
					</select>
					<div
						class="pointer-events-none absolute inset-y-0 right-2 flex items-center">
						<svg class="w-4 h-4 text-gray-400" fill="none"
							stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
								d="M19 9l-7 7-7-7" />
          </svg>
					</div>
				</div>
			</div>

			<!-- To -->
			<div class="w-full sm:w-[45%] lg:w-auto">
				<label for="to" class="block mb-1 text-sm font-medium text-gray-700">To</label>
				<div class="relative">
					<select id="to"
						class="peer block w-full appearance-none bg-transparent border-0 border-b-2 border-gray-300 py-2.5 pr-8 text-sm text-gray-700 focus:border-blue-600 focus:outline-none focus:ring-0">
						<option selected>Choose a country</option>
						<option value="US">United States</option>
						<option value="CA">Canada</option>
						<option value="FR">France</option>
						<option value="DE">Germany</option>
					</select>
					<div
						class="pointer-events-none absolute inset-y-0 right-2 flex items-center">
						<svg class="w-4 h-4 text-gray-400" fill="none"
							stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
            <path stroke-linecap="round" stroke-linejoin="round"
								d="M19 9l-7 7-7-7" />
          </svg>
					</div>
				</div>
			</div>

			<!-- Seats -->
			<div class="w-full sm:w-[45%] lg:w-[80px]">
				<label for="passengers"
					class="block mb-2 text-sm font-medium text-gray-700">Seats</label>
				<input type="number" id="passengers" min="1" value="1"
					class="w-full px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required />
			</div>

			<!-- Date -->
			<div class="w-full sm:w-[45%] lg:w-auto">
				<label for="date" class="block mb-2 text-sm">Travel Date</label> <input
					type="date" id="date"
					class="w-full text-sm px-3 py-2 border border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-blue-500"
					required />
			</div>

			<!-- Submit Button -->
			<div class="w-full sm:w-auto flex justify-end sm:items-end">
				<button type="submit"
					class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-md w-full sm:w-auto">
					Search</button>
			</div>

		</form>
	</div>

</div>


<!-- SEARCH RESULT  -->
<!-- Search Results Section -->
<div
	class="flex flex-col lg:flex-row justify-center mt-10 bg-green-100 ">

	<aside class="w-full lg:w-[22%] p-4  flex flex-col gap-5">
		<!-- Filter by Time -->
		<div class="bg-yellow-100 rounded-lg shadow p-6 ">
			<h4 class="text-lg font-semibold mb-2">🕒 Filter by Time</h4>
			<div class="space-y-2 text-sm text-gray-700">
				<label><input type="checkbox" class="mr-2"> Morning
					(6AM–12PM)</label><br> <label><input type="checkbox"
					class="mr-2"> Afternoon (12PM–6PM)</label><br> <label><input
					type="checkbox" class="mr-2"> Night (6PM–12AM)</label>
			</div>
		</div>

		<!-- Filter by Type -->
		<div class="bg-yellow-100 rounded-lg shadow  p-6 ">
			<h4 class="text-lg font-semibold mb-2">🚌 Bus Type</h4>
			<div class="space-y-2 text-sm text-gray-700">
				<label><input type="checkbox" class="mr-2"> AC
					Seater</label><br> <label><input type="checkbox" class="mr-2">
					VIP</label><br> <label><input type="checkbox" class="mr-2">
					Sleeper</label>
			</div>
		</div>

		<!-- Map -->
		<div
			class="bg-white rounded-lg shadow p-4 h-48 flex items-center justify-center text-gray-500 text-sm">
			🗺️ Map Placeholder</div>
	</aside>

	<main class="w-fit p-4 gap-5 flex flex-col">
		<!-- Bus Result Card -->
		<div
			class="bg-white  rounded-lg shadow-md p-4 flex flex-col md:flex-row gap-10 items-start md:items-center justify-between">

			<!-- Left: Bus Image & Info -->
			<div class="flex gap-4 items-start md:items-center">
				<!-- 🚌 Bus Image -->
				<img src="/images/bus-sample.jpg" alt="Bus Image"
					class="w-48 h-32 object-cover rounded-md shadow">

				<!-- Info -->
				<div class="flex gap-3 flex-col">
					<div class="flex gap-3 items-center">
						<!-- 🏷️ Bus Name -->
						<h3 class="text-lg font-bold text-gray-800">SwiftBus -
							Express Line</h3>
						<!-- 🎫 Type & Seats -->
						<div class="mt-2 flex gap-2 flex-wrap">
							<span
								class="bg-blue-100 text-blue-700 px-2 py-1 rounded-full text-xs">AC
								Seater</span>

						</div>
					</div>

					<div>
						<!-- 🧭 Destination -->
						<p class="text-sm text-gray-600">Yangon ➝ Mandalay</p>
						<!-- 📅 Date & Time -->
						<p class="text-sm text-gray-500">July 15 · 8:00 PM</p>
					</div>

					<!-- 🔍 View Details -->
					<div>
						<a href="#" class="text-sm text-blue-600 hover:underline">View
							Details</a>
					</div>
				</div>
			</div>

			<!-- Right: Price & Actions -->
			<div class="text-right space-y-2 md:text-left md:ml-auto">
				<!-- 💰 Price -->
				<p class="text-lg font-bold text-gray-800">MMK 18,000</p>

				<!-- 🔘 Book Button -->
				<button
					class="bg-blue-500 hover:bg-blue-600 text-white text-sm px-5 py-2 rounded-md">
					Book Now</button>


			</div>
		</div>
		
			<!-- Bus Result Card -->
		<div
			class="bg-white  rounded-lg shadow-md p-4 flex flex-col md:flex-row gap-10 items-start md:items-center justify-between">

			<!-- Left: Bus Image & Info -->
			<div class="flex gap-4 items-start md:items-center">
				<!-- 🚌 Bus Image -->
				<img src="/images/bus-sample.jpg" alt="Bus Image"
					class="w-48 h-32 object-cover rounded-md shadow">

				<!-- Info -->
				<div class="flex gap-3 flex-col">
					<div class="flex gap-3 items-center">
						<!-- 🏷️ Bus Name -->
						<h3 class="text-lg font-bold text-gray-800">SwiftBus -
							Express Line</h3>
						<!-- 🎫 Type & Seats -->
						<div class="mt-2 flex gap-2 flex-wrap">
							<span
								class="bg-blue-100 text-blue-700 px-2 py-1 rounded-full text-xs">AC
								Seater</span>

						</div>
					</div>

					<div>
						<!-- 🧭 Destination -->
						<p class="text-sm text-gray-600">Yangon ➝ Mandalay</p>
						<!-- 📅 Date & Time -->
						<p class="text-sm text-gray-500">July 15 · 8:00 PM</p>
					</div>

					<!-- 🔍 View Details -->
					<div>
						<a href="#" class="text-sm text-blue-600 hover:underline">View
							Details</a>
					</div>
				</div>
			</div>

			<!-- Right: Price & Actions -->
			<div class="text-right space-y-2 md:text-left md:ml-auto">
				<!-- 💰 Price -->
				<p class="text-lg font-bold text-gray-800">MMK 18,000</p>

				<!-- 🔘 Book Button -->
				<button
					class="bg-blue-500 hover:bg-blue-600 text-white text-sm px-5 py-2 rounded-md">
					Book Now</button>


			</div>
		</div>
		
		
				<!-- Bus Result Card -->
		<div
			class="bg-white   rounded-lg shadow-md p-4 flex flex-col md:flex-row gap-10 items-start md:items-center justify-between">

			<!-- Left: Bus Image & Info -->
			<div class="flex gap-4 items-start md:items-center">
				<!-- 🚌 Bus Image -->
				<img src="/images/bus-sample.jpg" alt="Bus Image"
					class="w-48 h-32 object-cover rounded-md shadow">

				<!-- Info -->
				<div class="flex gap-3 flex-col">
					<div class="flex gap-3 items-center">
						<!-- 🏷️ Bus Name -->
						<h3 class="text-lg font-bold text-gray-800">SwiftBus -
							Express Line</h3>
						<!-- 🎫 Type & Seats -->
						<div class="mt-2 flex gap-2 flex-wrap">
							<span
								class="bg-blue-100 text-blue-700 px-2 py-1 rounded-full text-xs">AC
								Seater</span>

						</div>
					</div>

					<div>
						<!-- 🧭 Destination -->
						<p class="text-sm text-gray-600">Yangon ➝ Mandalay</p>
						<!-- 📅 Date & Time -->
						<p class="text-sm text-gray-500">July 15 · 8:00 PM</p>
					</div>

					<!-- 🔍 View Details -->
					<div>
						<a href="#" class="text-sm text-blue-600 hover:underline">View
							Details</a>
					</div>
				</div>
			</div>

			<!-- Right: Price & Actions -->
			<div class="text-right space-y-2 md:text-left md:ml-auto">
				<!-- 💰 Price -->
				<p class="text-lg font-bold text-gray-800">MMK 18,000</p>

				<!-- 🔘 Book Button -->
				<button
					class="bg-blue-500 hover:bg-blue-600 text-white text-sm px-5 py-2 rounded-md">
					Book Now</button>


			</div>
		</div>
		
		
				<!-- Bus Result Card -->
		<div
			class="bg-white  rounded-lg shadow-md p-4 flex flex-col md:flex-row gap-10 items-start md:items-center justify-between">

			<!-- Left: Bus Image & Info -->
			<div class="flex gap-4 items-start md:items-center">
				<!-- 🚌 Bus Image -->
				<img src="/images/bus-sample.jpg" alt="Bus Image"
					class="w-48 h-32 object-cover rounded-md shadow">

				<!-- Info -->
				<div class="flex gap-3 flex-col">
					<div class="flex gap-3 items-center">
						<!-- 🏷️ Bus Name -->
						<h3 class="text-lg font-bold text-gray-800">SwiftBus -
							Express Line</h3>
						<!-- 🎫 Type & Seats -->
						<div class="mt-2 flex gap-2 flex-wrap">
							<span
								class="bg-blue-100 text-blue-700 px-2 py-1 rounded-full text-xs">AC
								Seater</span>

						</div>
					</div>

					<div>
						<!-- 🧭 Destination -->
						<p class="text-sm text-gray-600">Yangon ➝ Mandalay</p>
						<!-- 📅 Date & Time -->
						<p class="text-sm text-gray-500">July 15 · 8:00 PM</p>
					</div>

					<!-- 🔍 View Details -->
					<div>
						<a href="#" class="text-sm text-blue-600 hover:underline">View
							Details</a>
					</div>
				</div>
			</div>

			<!-- Right: Price & Actions -->
			<div class="text-right space-y-2 md:text-left md:ml-auto">
				<!-- 💰 Price -->
				<p class="text-lg font-bold text-gray-800">MMK 18,000</p>

				<!-- 🔘 Book Button -->
				<button
					class="bg-blue-500 hover:bg-blue-600 text-white text-sm px-5 py-2 rounded-md">
					Book Now</button>


			</div>
		</div>
		
	</main>


</div>
<!-- Stepper Component -->
<div class="flex flex-col md:flex-row justify-between items-start md:items-center bg-white rounded-lg shadow px-6 py-4 mb-6">
  <!-- Step 1 -->
  <div class="flex items-center space-x-3">
    <div class="flex items-center justify-center w-8 h-8 rounded-full text-white font-semibold"
         :class="currentStep >= 1 ? 'bg-blue-600' : 'bg-gray-300'">1</div>
    <div class="text-sm font-medium" :class="currentStep >= 1 ? 'text-blue-600' : 'text-gray-500'">
      Select Seat
    </div>
  </div>

  <!-- Divider -->
  <div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

  <!-- Step 2 -->
  <div class="flex items-center space-x-3">
    <div class="flex items-center justify-center w-8 h-8 rounded-full text-white font-semibold"
         :class="currentStep >= 2 ? 'bg-blue-600' : 'bg-gray-300'">2</div>
    <div class="text-sm font-medium" :class="currentStep >= 2 ? 'text-blue-600' : 'text-gray-500'">
      Traveller Info
    </div>
  </div>

  <!-- Divider -->
  <div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

  <!-- Step 3 -->
  <div class="flex items-center space-x-3">
    <div class="flex items-center justify-center w-8 h-8 rounded-full text-white font-semibold"
         :class="currentStep >= 3 ? 'bg-blue-600' : 'bg-gray-300'">3</div>
    <div class="text-sm font-medium" :class="currentStep >= 3 ? 'text-blue-600' : 'text-gray-500'">
      Payment
    </div>
  </div>

  <!-- Divider -->
  <div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

  <!-- Step 4 -->
  <div class="flex items-center space-x-3">
    <div class="flex items-center justify-center w-8 h-8 rounded-full text-white font-semibold"
         :class="currentStep >= 4 ? 'bg-blue-600' : 'bg-gray-300'">4</div>
    <div class="text-sm font-medium" :class="currentStep >= 4 ? 'text-blue-600' : 'text-gray-500'">
      Confirmation
    </div>
  </div>
</div>



</body>
</html>
