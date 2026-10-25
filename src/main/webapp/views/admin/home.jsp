<%@ include file="../fragments/navbar.jsp" %>

<!-- BANNER SECTION -->
<section
	class="banner h-[90vh] flex flex-col md:flex-row items-center justify-between px-10 py-10 mt-10 text-white">
	<!-- Left Side -->
	<div class="md:w-7/12 mb-8 md:mb-0">
		<h1
			class="mb-4  shadow shadow-orange text-3xl font-extrabold text-dark  md:text-5xl lg:text-6xl">
			SwiftBus Express Booking</h1>
		<p class="text-lg font-normal text-dark lg:text-xl ">Here at
			Flowbite we focus on markets where technology, innovation, and
			capital can unlock long-term value and drive economic growth.</p>
	</div>

	
	<!-- Right Side Form -->
	<div class="md:w-4/12  text-white p-6 rounded shadow"
		style="background: white; color: #002932;">
		<h4 class="text-xl font-semibold mb-4">Book Your Ticket</h4>
		<form method="get" action="/bus/search">
			<div class="grid grid-cols-2 gap-4 mb-4">
				<div class="relative w-full max-w-sm">
					<label for="underline_select"
						class="block mb-1 text-sm font-medium ">From</label>
					<div class="relative">

						<select name="startLocation" id="startLocation"
							class="peer block appearance-none w-full bg-transparent border-0 border-b-2 border-gray-300 py-2.5 pr-8 text-sm focus:border-blue-600 focus:outline-none focus:ring-0"
							required>
							<option value="" disabled selected>Select departure</option>
							<option value="Yangon">Yangon</option>
							<option value="Mandalay">Mandalay</option>
						</select>
						<!-- Custom Arrow -->
						<div
							class="pointer-events-none absolute inset-y-0 right-2 flex items-center">
							<svg class="w-4 h-4 text-gray-400" fill="none"
								stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg">
			        <path stroke-linecap="round" stroke-linejoin="round"
									d="M19 9l-7 7-7-7"></path>
			      </svg>
						</div>
					</div>
				</div>

				<div class="relative w-full max-w-sm">
					<label for="endLocation" class="block mb-1 text-sm font-medium">To</label>
					<div class="relative">
						<select name="endLocation" id="endLocation"
							class="peer block appearance-none w-full bg-transparent border-0 border-b-2 border-gray-300 py-2.5 pr-8 text-sm focus:border-blue-600 focus:outline-none focus:ring-0"
							required>
							<option value="" disabled selected>Select destination</option>
							<option value="Yangon">Yangon</option>
							<option value="Mandalay">Mandalay</option>
						</select>

						<!-- Custom Arrow -->
						<div
							class="pointer-events-none absolute inset-y-0 right-2 flex items-center">
							<svg class="w-4 h-4 text-gray-400" fill="none"
								stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"
								xmlns="http://www.w3.org/2000/svg">
			        <path stroke-linecap="round" stroke-linejoin="round"
									d="M19 9l-7 7-7-7"></path>
			      </svg>
						</div>
					</div>
				</div>
			</div>

			<div class="grid grid-cols-5 gap-4 mb-4  ">

				<!-- Ticket Type -->
				<div class="col-span-2">
					<label for="ticketType" class="block mb-2 text-sm font-medium">Ticket
						Type</label> <select name="ticketType" id="ticketType"
						class="w-full px-3 py-2.5 border text-sm border-gray-300 rounded">
						<option value="">Any</option>
						<option value="AC">AC Seater</option>
						<option value="VIP">VIP</option>
						<option value="Sleeper">Sleeper</option>
					</select>
				</div>

				<!-- Passenger Type -->
				<div class="col-span-2">
					<label for="passengerType" class="block mb-2 text-sm font-medium">Passenger
						Type</label> <select name="passengerType" id="passengerType"
						class="w-full px-3 py-2.5 border text-sm border-gray-300 rounded">
						<option value="">Any</option>
						<option value="Local">Local</option>
						<option value="Foreigner">Foreigner</option>
					</select>
				</div>

				<!-- Seats -->
				<div class="col-span-1">
					<label for="seats" class="block mb-2 text-sm font-medium">Seats</label>
					<input type="number" name="seats" id="seats" min="1" value="1"
						class="w-full px-3 py-2 border border-gray-300 rounded" required />
				</div>
			</div>

			<div class="mb-4">
				<label for="travelDate" class="block mb-2 text-sm">Travel
					Date</label> <input type="date" name="travelDate" id="travelDate"
					class="w-full text-sm px-3 py-2 border border-gray-300 rounded"
					required />
			</div>

			<div class="mb-4">
				<label for="promoCode" class="block mb-2 text-sm">Promo Code
					(optional)</label> <input type="text" name="promoCode" id="promoCode"
					placeholder="e.g. SWIFT10"
					class="w-full text-sm px-3 py-2 border border-gray-300 rounded" />
			</div>

			<button type="submit" style="background: #002932;"
				class="w-full text-white py-2 rounded ">Search Buses</button>
		</form>
	</div>


	
</section>

<!-- About Us Section -->
<section class="py-16 bg-white mt-50">
	<div
		class="container mx-auto px-6 md:px-12 flex flex-col md:flex-row items-center gap-10">

		<!-- Left Image with World Map & Vehicles -->
		<div class="md:w-1/2 flex justify-center">
			<img src="./images/banner-bus.png" alt="Logistics illustration"
				class="max-w-full h-auto">
		</div>

		<!-- Right Text Content -->
		<div class="md:w-1/2">
			<h2 class="text-3xl font-bold text-primary mb-4">About SwiftBus</h2>
			<p class="text-gray-700 mb-6">At SwiftBus, weâre committed to
				making intercity travel smooth and hassle-free. Our platform offers
				reliable booking, secure payment, and real-time updates for your
				journey. Whether it's business or leisure, our modern fleet and
				dedicated service ensure you arrive safely and comfortably.</p>

			<div class="mb-6">
				<div class="flex items-start space-x-4 mb-4">
					<div class="text-accent text-xl">
						<i class="fas fa-route"></i>
						<!-- You can replace with an SVG -->
					</div>
					<div>
						<h4 class="text-lg font-semibold text-accent">Nationwide
							Routes</h4>
						<p class="text-gray-600 text-sm">Travel across Myanmar with
							trusted routes covering major cities and towns.</p>
					</div>
				</div>

				<div class="flex items-start space-x-4">
					<div class="text-accent text-xl">
						<i class="fas fa-clock"></i>
					</div>
					<div>
						<h4 class="text-lg font-semibold text-accent">On-Time Service</h4>
						<p class="text-gray-600 text-sm">We prioritize punctuality to
							get you to your destination on time, every time.</p>
					</div>
				</div>
			</div>

			<a href="about.jsp"
				class="inline-block bg-blue-600 text-white px-6 py-3 rounded shadow hover:bg-primary transition">
				Learn More â </a>
		</div>
	</div>
</section>



<section class="max-w-6xl mx-auto px-4 py-12">
	<h2
		class="text-2xl font-bold text-gray-800 mb-10 text-center font-oswald">Popular
		Route Groups in Myanmar</h2>

	<div class="grid gap-8 md:grid-cols-2 lg:grid-cols-3">

		<!-- Yangon Routes Card -->
		<div class="bg-white shadow-md rounded-lg overflow-hidden">
			<img
				src="https://images.unsplash.com/photo-1606406054042-9c41401efec5"
				alt="Yangon" class="w-full h-40 object-cover">
			<div class="p-6">
				<h3 class="text-xl font-bold text-gray-800 mb-2">Yangon Routes</h3>
				<ul class="text-sm text-gray-600 space-y-1 mb-4">
					<li>Yangon â Mandalay</li>
					<li>Yangon â Bagan</li>
					<li>Yangon â Taunggyi</li>
				</ul>
				<a href="#"
					class="text-blue-600 text-sm font-medium hover:underline">View
					all Yangon routes â</a>
			</div>
		</div>

		<!-- Mandalay Routes Card -->
		<div class="bg-white shadow-md rounded-lg overflow-hidden">
			<img
				src="https://images.unsplash.com/photo-1586941442904-97f931ecded8"
				alt="Mandalay" class="w-full h-40 object-cover">
			<div class="p-6">
				<h3 class="text-xl font-bold text-gray-800 mb-2">Mandalay
					Routes</h3>
				<ul class="text-sm text-gray-600 space-y-1 mb-4">
					<li>Mandalay â Yangon</li>
					<li>Mandalay â Taunggyi</li>
					<li>Mandalay â Bagan</li>
				</ul>
				<a href="#"
					class="text-blue-600 text-sm font-medium hover:underline">View
					all Mandalay routes â</a>
			</div>
		</div>

		<!-- Bagan Routes Card -->
		<div class="bg-white shadow-md rounded-lg overflow-hidden">
			<img
				src="https://images.unsplash.com/photo-1601884666338-b17f7a4a21b3"
				alt="Bagan" class="w-full h-40 object-cover">
			<div class="p-6">
				<h3 class="text-xl font-bold text-gray-800 mb-2">Bagan Routes</h3>
				<ul class="text-sm text-gray-600 space-y-1 mb-4">
					<li>Bagan â Yangon</li>
					<li>Bagan â Mandalay</li>
					<li>Bagan â Inle</li>
				</ul>
				<a href="#"
					class="text-blue-600 text-sm font-medium hover:underline">View
					all Bagan routes â</a>
			</div>
		</div>

	</div>
</section>

<section class="py-16 bg-white" id="featured-buses">
	<div class="max-w-7xl mx-auto px-6">
		<h2 class="text-3xl font-bold text-center text-gray-800 mb-12">ð
			Featured Buses & Services</h2>

		<div class="grid grid-cols-1 md:grid-cols-3 gap-8">

			<!-- Bus Card -->
			<div
				class="bg-gray-50 rounded-lg shadow hover:shadow-lg transition p-6">
				<img src="https://via.placeholder.com/400x200" alt="VIP Bus"
					class="w-full h-40 object-cover rounded mb-4">
				<h3 class="text-xl font-semibold text-blue-700 mb-2">VIP Bus</h3>
				<p class="text-gray-600 mb-4">Extra legroom, reclining seats,
					charging ports, and personal curtains for long journeys.</p>
				<button
					class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">View
					Schedules</button>
			</div>

			<!-- Bus Card -->
			<div
				class="bg-gray-50 rounded-lg shadow hover:shadow-lg transition p-6">
				<img src="https://via.placeholder.com/400x200" alt="AC Seater"
					class="w-full h-40 object-cover rounded mb-4">
				<h3 class="text-xl font-semibold text-blue-700 mb-2">AC Seater</h3>
				<p class="text-gray-600 mb-4">Affordable and comfortable
					air-conditioned buses for quick and convenient travel.</p>
				<button
					class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">View
					Schedules</button>
			</div>

			<!-- Bus Card -->
			<div
				class="bg-gray-50 rounded-lg shadow hover:shadow-lg transition p-6">
				<img src="https://via.placeholder.com/400x200" alt="Sleeper Bus"
					class="w-full h-40 object-cover rounded mb-4">
				<h3 class="text-xl font-semibold text-blue-700 mb-2">Sleeper
					Bus</h3>
				<p class="text-gray-600 mb-4">Perfect for overnight travel with
					fully flat beds, pillows, and blankets provided.</p>
				<button
					class="w-full bg-blue-600 text-white py-2 rounded hover:bg-blue-700">View
					Schedules</button>
			</div>

		</div>
	</div>
</section>

<footer class=" text-white py-10" style="background: #002932;">
	<div
		class="max-w-7xl mx-auto px-6 grid grid-cols-1 md:grid-cols-4 gap-8">

		<!-- Brand -->
		<div>
			<h3 class="text-xl font-bold mb-4">SwiftBus</h3>
			<p class="text-sm text-gray-300">Your trusted travel partner for
				safe and smart bus bookings across Myanmar.</p>
		</div>

		<!-- Quick Links -->
		<div>
			<h4 class="font-semibold mb-3">Quick Links</h4>
			<ul class="space-y-2 text-sm text-gray-300">
				<li><a href="home.jsp" class="hover:underline">Home</a></li>
				<li><a href="booking.jsp" class="hover:underline">Booking</a></li>
				<li><a href="tickets.jsp" class="hover:underline">Tickets</a></li>
				<li><a href="profile.jsp" class="hover:underline">Profile</a></li>
			</ul>
		</div>

		<!-- Support -->
		<div>
			<h4 class="font-semibold mb-3">Support</h4>
			<ul class="space-y-2 text-sm text-gray-300">
				<li><a href="#" class="hover:underline">Contact Us</a></li>
				<li><a href="#" class="hover:underline">Help Center</a></li>
				<li><a href="#" class="hover:underline">Privacy Policy</a></li>
				<li><a href="#" class="hover:underline">Terms of Use</a></li>
			</ul>
		</div>

		<!-- Contact -->
		<div>
			<h4 class="font-semibold mb-3">Contact</h4>
			<p class="text-sm text-gray-300">ð 09 123 456 789</p>
			<p class="text-sm text-gray-300">ð§ support@swiftbus.com</p>
			<p class="text-sm text-gray-300 mt-2">ð Yangon, Myanmar</p>
		</div>

	</div>

	<div
		class="text-center text-sm text-gray-400 mt-10 border-t border-gray-700 pt-4">
		Â© 2025 SwiftBus. All rights reserved.</div>
</footer>

</body>

</html>
