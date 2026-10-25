<%@ include file="fragments/navbar.jsp" %>



<section class="max-w-6xl mx-auto px-4 py-10 mt-32">
  <h2 class="text-2xl font-bold text-gray-800 mb-8">👤 My Profile</h2>

  <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

    <!-- Profile Info / Settings -->
    <div class="bg-white shadow-md rounded-lg p-6">
      <h3 class="text-lg font-semibold mb-4 text-gray-700">Profile Information</h3>

      <form class="space-y-4">
        <div>
          <label class="block text-sm text-gray-600 mb-1">Full Name</label>
          <input type="text" placeholder="Your name"
            class="w-full px-4 py-2 border border-gray-300 rounded-md" />
        </div>

        <div>
          <label class="block text-sm text-gray-600 mb-1">Email Address</label>
          <input type="email" placeholder="you@example.com"
            class="w-full px-4 py-2 border border-gray-300 rounded-md" />
        </div>

        <div>
          <label class="block text-sm text-gray-600 mb-1">Phone</label>
          <input type="tel" placeholder="09xxxxxxx"
            class="w-full px-4 py-2 border border-gray-300 rounded-md" />
        </div>

        <div>
          <label class="block text-sm text-gray-600 mb-1">Password</label>
          <input type="password" placeholder="•••••••"
            class="w-full px-4 py-2 border border-gray-300 rounded-md" />
        </div>

        <button type="submit"
          class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-md">
          Update Profile
        </button>
      </form>
    </div>

    <!-- Booking History -->
    <div class="lg:col-span-2 bg-white shadow-md rounded-lg p-6">
      <h3 class="text-lg font-semibold mb-4 text-gray-700">📘 Booking History</h3>

      <!-- Booking Entry -->
      <div class="space-y-4">
        <!-- Repeat this block for each booking -->
        <div class="border border-gray-200 rounded-md p-4 flex flex-col md:flex-row justify-between items-start md:items-center">
          <div>
            <h4 class="font-semibold text-gray-800">Yangon ➝ Mandalay</h4>
            <p class="text-sm text-gray-500">Date: July 15, 2025 · 8:00 PM</p>
            <p class="text-sm text-gray-500">Seat: A3 · Type: VIP</p>
          </div>
          <div class="mt-3 md:mt-0">
            <p class="text-green-600 font-semibold">MMK 18,000</p>
            <a href="#" class="text-blue-600 text-sm hover:underline">View Details</a>
          </div>
        </div>

        <!-- Another Booking -->
        <div class="border border-gray-200 rounded-md p-4 flex flex-col md:flex-row justify-between items-start md:items-center">
          <div>
            <h4 class="font-semibold text-gray-800">Mandalay ➝ Taunggyi</h4>
            <p class="text-sm text-gray-500">Date: Aug 5, 2025 · 7:30 AM</p>
            <p class="text-sm text-gray-500">Seat: B1 · Type: AC Seater</p>
          </div>
          <div class="mt-3 md:mt-0">
            <p class="text-green-600 font-semibold">MMK 16,500</p>
            <a href="#" class="text-blue-600 text-sm hover:underline">View Details</a>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
