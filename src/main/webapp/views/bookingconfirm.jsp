<%@ include file="fragments/navbar.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<h1>Booking Confirmed</h1>

<p>Booking ID: <c:out value="${bookingId}" /></p>

<p>
    Payment Method:
    <c:out value="${paymentMethod}" />
</p>

<p>
    Transaction Reference:
    <c:out value="${transactionReference}" />
</p>

<p>
    Total Amount:
    <fmt:formatNumber value="${totalAmount}" groupingUsed="true" />
    MMK
</p>


<%--
<div id="stepper"
	class="flex mt-24 flex-col md:flex-row justify-between items-start md:items-center bg-white rounded-lg shadow px-6 py-4 mb-6">
	<!-- Step 1 -->
	<div class="flex items-center space-x-3 step" data-step="1">
		<div
			class="step-circle w-8 h-8 flex items-center justify-center rounded-full text-white font-semibold bg-blue-600">1</div>
		<div class="step-label text-sm font-medium text-blue-600">Select
			Seat</div>
	</div>
	<div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

	<!-- Step 2 -->
	<div class="flex items-center space-x-3 step" data-step="2">
		<div
			class="step-circle w-8 h-8 flex items-center justify-center rounded-full text-white font-semibold bg-gray-300">2</div>
		<div class="step-label text-sm font-medium text-gray-500">Traveller
			Info</div>
	</div>
	<div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

	<!-- Step 3 -->
	<div class="flex items-center space-x-3 step" data-step="3">
		<div
			class="step-circle w-8 h-8 flex items-center justify-center rounded-full text-white font-semibold bg-gray-300">3</div>
		<div class="step-label text-sm font-medium text-gray-500">Payment</div>
	</div>
	<div class="hidden md:block flex-1 border-t border-gray-300 mx-4"></div>

	<!-- Step 4 -->
	<div class="flex items-center space-x-3 step" data-step="4">
		<div
			class="step-circle w-8 h-8 flex items-center justify-center rounded-full text-white font-semibold bg-gray-300">4</div>
		<div class="step-label text-sm font-medium text-gray-500">Confirmation</div>
	</div>
</div>

<div class="max-w-4xl mx-auto px-4 py-12">

  <!-- 🎉 Success Message -->
  <div class="text-center mb-10">
    <div class="inline-block bg-green-100 text-green-600 rounded-full p-4 mb-4">
      <svg class="w-8 h-8" fill="none" stroke="currentColor" stroke-width="2"
        viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round"
          d="M5 13l4 4L19 7" />
      </svg>
    </div>
    <h2 class="text-2xl font-bold text-gray-800">Booking Confirmed!</h2>
    <p class="text-gray-600 mt-2">Your bus ticket has been successfully booked.</p>
  </div>

  <!-- 📦 Booking Summary -->
  <div class="bg-white shadow rounded-lg p-6 space-y-6">

    <!-- Route & Time -->
    <div class="flex flex-col md:flex-row justify-between border-b pb-4">
      <div>
        <h3 class="text-lg font-semibold text-gray-800">Yangon ➝ Mandalay</h3>
        <p class="text-sm text-gray-600">July 15, 2025 · 8:00 PM</p>
      </div>
      <div class="mt-3 md:mt-0">
        <span class="bg-blue-100 text-blue-700 px-3 py-1 text-sm rounded-full">VIP</span>
      </div>
    </div>

    <!-- Passenger Info -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 text-sm">
      <div>
        <p class="text-gray-500">Passenger Name</p>
        <p class="text-gray-800 font-medium">Thwe Sin Thant</p>
      </div>
      <div>
        <p class="text-gray-500">NRC Number</p>
        <p class="text-gray-800 font-medium">12/PaKaNa(N)123456</p>
      </div>
      <div>
        <p class="text-gray-500">Phone</p>
        <p class="text-gray-800 font-medium">09 123 456 789</p>
      </div>
      <div>
        <p class="text-gray-500">Email</p>
        <p class="text-gray-800 font-medium">example@email.com</p>
      </div>
      <div>
        <p class="text-gray-500">Selected Seats</p>
        <p class="text-gray-800 font-medium">5, 6, 7</p>
      </div>
      <div>
        <p class="text-gray-500">Payment Method</p>
        <p class="text-gray-800 font-medium">KBZPay</p>
      </div>
    </div>

    <!-- 💰 Total -->
    <div class="border-t pt-4 flex justify-between items-center">
      <span class="text-lg font-semibold text-gray-700">Total Paid</span>
      <span class="text-xl font-bold text-green-600">MMK 54,000</span>
    </div>
  </div>

  <!-- 🔘 Action Buttons -->
  <div class="text-center mt-8 space-x-4">
    <button
      class="bg-blue-500 hover:bg-blue-600 text-white px-6 py-2 rounded-md">
      Download Ticket
    </button>
    <button
      class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-6 py-2 rounded-md">
      Back to Home
    </button>
  </div>
</div>


<script>
  let currentStep = 1;

  function updateSteps() {
    document.querySelectorAll('.step').forEach(step => {
      const stepNum = parseInt(step.getAttribute('data-step'));
      const circle = step.querySelector('.step-circle');
      const label = step.querySelector('.step-label');

      if (stepNum === currentStep) {
        circle.classList.remove('bg-gray-300');
        circle.classList.add('bg-blue-600');
        label.classList.remove('text-gray-500');
        label.classList.add('text-blue-600');
      } else {
        circle.classList.remove('bg-blue-600');
        circle.classList.add('bg-gray-300');
        label.classList.remove('text-blue-600');
        label.classList.add('text-gray-500');
      }
    });
  }

  function nextStep() {
    if (currentStep < 4) {
      currentStep++;
      updateSteps();
    }
  }

  function prevStep() {
    if (currentStep > 1) {
      currentStep--;
      updateSteps();
    }
  }

  // Initialize on load
  document.addEventListener('DOMContentLoaded', updateSteps);
</script>

--%>
</body>
</html>
