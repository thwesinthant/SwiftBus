<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<c:set var="root" value="${pageContext.request.contextPath}"
	scope="request" />
<title>SwiftBus</title>

<!-- Tailwind (CDN) -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Project fonts -->

<link rel="preconnect" href="https://fonts.gstatic.com" >

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;600;700;800&family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;500;600;700&family=Cabin:wght@400;500;600;700&family=Poppins:wght@400;500;600;700;800&family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Icons used across pages (route/clock glyphs etc.) -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="/css/home.css" rel="stylesheet">


<style>
  :root{
    --sb-navy:#002932;
    --sb-navy-dark:#001A20;
    --sb-orange:#F78837;
  }
  body{ font-family:'Open Sans', sans-serif; }
  h1,h2,h3,h4,.font-heading{ font-family:'Poppins', sans-serif; }
</style>
</head>
<body>

<header class="sticky top-0 z-50 bg-white/90 backdrop-blur border-b border-gray-100" id="siteHeader">
	<div class="max-w-7xl mx-auto px-6 h-[76px] flex items-center justify-between">

		<!-- Brand -->
		<a href="${root}/home" class="flex items-center gap-2 font-heading font-extrabold text-xl" style="color:var(--sb-navy);">
			<span class="w-8 h-8 rounded-lg inline-block" style="background:linear-gradient(135deg,var(--sb-navy),var(--sb-orange));"></span>
			SwiftBus
		</a>

		<!-- Desktop nav -->
		<nav class="hidden md:flex items-center gap-8 text-sm font-semibold text-gray-600">
			<a href="${root}/home" class="hover:text-[color:var(--sb-navy)]">Home</a>
			<a href="${root}/bus" class="hover:text-[color:var(--sb-navy)]">Booking</a>
			<a href="${root}/tickets" class="hover:text-[color:var(--sb-navy)]">Tickets</a>
			<a href="${root}/profile" class="hover:text-[color:var(--sb-navy)]">Profile</a>

			<c:choose>
				<c:when test="${not empty sessionScope.account}">
					<a href="${root}/logout"
						class="inline-flex items-center h-11 px-5 rounded-lg text-white font-bold text-sm"
						style="background:var(--sb-orange);">Log out</a>
				</c:when>
				<c:otherwise>
					<a href="${root}/login"
						class="inline-flex items-center h-11 px-5 rounded-lg text-white font-bold text-sm"
						style="background:var(--sb-orange);">Log in</a>
				</c:otherwise>
			</c:choose>
		</nav>

		<!-- Mobile hamburger -->
		<button id="hamburgerBtn" aria-label="Toggle menu" aria-expanded="false"
			class="md:hidden w-10 h-10 flex flex-col items-center justify-center gap-1.5">
			<span class="block w-5 h-0.5" style="background:var(--sb-navy);"></span>
			<span class="block w-5 h-0.5" style="background:var(--sb-navy);"></span>
			<span class="block w-5 h-0.5" style="background:var(--sb-navy);"></span>
		</button>
	</div>
</header>

<!-- Mobile drawer -->
<div id="drawerOverlay" class="fixed inset-0 bg-black/40 opacity-0 invisible transition-opacity duration-300 z-40"></div>
<nav id="mobileDrawer"
	class="fixed top-0 right-0 h-full w-[78vw] max-w-[320px] bg-white z-50 shadow-2xl px-6 pt-8 pb-6 flex flex-col gap-1 translate-x-full transition-transform duration-300">
	<a href="${root}/home" class="py-3 border-b border-gray-100 font-semibold">Home</a>
	<a href="${root}/bus" class="py-3 border-b border-gray-100 font-semibold">Booking</a>
	<a href="${root}/tickets" class="py-3 border-b border-gray-100 font-semibold">Tickets</a>
	<a href="${root}/profile" class="py-3 border-b border-gray-100 font-semibold">Profile</a>

	<c:choose>
		<c:when test="${not empty sessionScope.account}">
			<a href="${root}/logout" class="mt-5 text-center py-3 rounded-lg text-white font-bold" style="background:var(--sb-orange);">Log out</a>
		</c:when>
		<c:otherwise>
			<a href="${root}/login" class="mt-5 text-center py-3 rounded-lg text-white font-bold" style="background:var(--sb-orange);">Log in</a>
		</c:otherwise>
	</c:choose>
</nav>

<script>
	var header = document.getElementById('siteHeader');
	window.addEventListener('scroll', function () {
		header.classList.toggle('shadow-md', window.scrollY > 20);
	}, { passive: true });

	var hamburgerBtn = document.getElementById('hamburgerBtn');
	var mobileDrawer = document.getElementById('mobileDrawer');
	var drawerOverlay = document.getElementById('drawerOverlay');

	function closeDrawer() {
		mobileDrawer.classList.add('translate-x-full');
		drawerOverlay.classList.add('opacity-0', 'invisible');
		hamburgerBtn.setAttribute('aria-expanded', 'false');
		document.body.style.overflow = '';
	}
	function toggleDrawer() {
		var isOpen = mobileDrawer.classList.toggle('translate-x-full');
		drawerOverlay.classList.toggle('opacity-0');
		drawerOverlay.classList.toggle('invisible');
		hamburgerBtn.setAttribute('aria-expanded', String(!isOpen));
		document.body.style.overflow = isOpen ? '' : 'hidden';
	}
	hamburgerBtn.addEventListener('click', toggleDrawer);
	drawerOverlay.addEventListener('click', closeDrawer);
	document.querySelectorAll('#mobileDrawer a').forEach(function (a) {
		a.addEventListener('click', closeDrawer);
	});
</script>
