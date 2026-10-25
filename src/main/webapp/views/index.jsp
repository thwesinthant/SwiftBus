<%@ include file="fragments/navbar.jsp"%>


<!-- ===================== HERO ===================== -->
<section id="home" class="hero">
	<div class="wrap hero-grid">
		<div class="hero-copy">
			<span class="eyebrow">Trusted across Myanmar</span>
			<h1>Every seat, tracked live. Every ticket, yours to trust.</h1>
			<p>Compare routes and departure times, pick your exact seat on a
				real-time map, and travel with transparent pricing — no
				counters, no guesswork.</p>
			<div class="hero-actions">
				<a href="#search" class="btn btn-cta">Search buses</a>
				<a href="#how" class="btn btn-ghost-light">See how it works</a>
			</div>
			<div class="hero-stats">
				<div class="stat">
					<b>2.4M+</b><span>Tickets booked</span>
				</div>
				<div class="stat">
					<b>40+</b><span>Routes covered</span>
				</div>
				<div class="stat">
					<b>4.8/5</b><span>Average rating</span>
				</div>
			</div>
		</div>
		<div class="hero-photo">
			<img src="${root}/images/banner-bus.png"
				alt="Intercity coach travelling on an open highway at golden hour">
			<div class="hero-badge">
				<span class="ico">&#10003;</span>
				<div>
					<b>Seat 1D confirmed</b><span>Yangon &rarr; Mandalay</span>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ===================== SEARCH / BOOKING CARD ===================== -->
<div class="wrap" id="search">
	<div class="card search-card reveal">
		<h4>Book your ticket</h4>
		<form method="get" action="${root}/bus">
			<div class="field-row">
				<div class="field">
					<label for="startLocation">From</label>
					<select name="startLocation" id="startLocation" required>
						<option value="" disabled selected>Select departure</option>
						<option value="Yangon">Yangon</option>
						<option value="Mandalay">Mandalay</option>
					</select>
				</div>
				<button type="button" class="swap-btn" title="Swap origin and destination">&#8646;</button>
				<div class="field">
					<label for="endLocation">To</label>
					<select name="endLocation" id="endLocation" required>
						<option value="" disabled selected>Select destination</option>
						<option value="Yangon">Yangon</option>
						<option value="Mandalay">Mandalay</option>
					</select>
				</div>
			</div>

			<div class="field-grid4">
				<div class="field">
					<label for="travelDate">Travel date</label>
					<input type="date" name="travelDate" id="travelDate" required>
				</div>
				<div class="field">
					<label for="seats">Passengers</label>
					<input type="number" name="seats" id="seats" value="1" min="1" required>
				</div>
				<div class="field">
					<label for="ticketType">Bus type</label>
					<select name="ticketType" id="ticketType">
						<option value="">Any</option>
						<option value="AC">AC Seater</option>
						<option value="VIP">VIP</option>
						<option value="Sleeper">Sleeper</option>
					</select>
				</div>
			</div>

			<div class="field-grid4">
				<div class="field">
					<label for="passengerType">Passenger type</label>
					<select name="passengerType" id="passengerType">
						<option value="">Any</option>
						<option value="Local">Local</option>
						<option value="Foreigner">Foreigner</option>
					</select>
				</div>
				<div class="field" style="grid-column: span 2;">
					<label for="promoCode">Promo code (optional)</label>
					<input type="text" name="promoCode" id="promoCode" placeholder="e.g. SWIFT10">
				</div>
			</div>

			<button type="submit" class="btn btn-cta btn-full">Search buses</button>
		</form>
	</div>
</div>

<!-- ===================== ABOUT ===================== -->
<section id="about" class="section">
	<div class="wrap about-grid">
		<div class="about-photo reveal">
			<img src="${root}/images/banner-bus.png" alt="Passengers boarding a modern coach bus at a terminal">
		</div>
		<div class="about-copy reveal">
			<span class="eyebrow">About SwiftBus</span>
			<h2>Built to make intercity travel feel dependable again.</h2>
			<p>SwiftBus started with a simple frustration: booking a
				long-distance bus meant guessing which counter had honest
				prices and hoping your seat existed. We rebuilt that
				experience around live data — every route, every seat, every
				fare, visible before you commit.</p>
			<div class="about-points">
				<div class="about-point">
					<span class="chk">&#10003;</span>
					<div>
						<b>Verified fleet</b><span>Every bus is inspected for safety &amp; comfort</span>
					</div>
				</div>
				<div class="about-point">
					<span class="chk">&#10003;</span>
					<div>
						<b>Live seat maps</b><span>See exactly what's free before you pay</span>
					</div>
				</div>
				<div class="about-point">
					<span class="chk">&#10003;</span>
					<div>
						<b>Transparent pricing</b><span>Fees shown upfront, no counter surprises</span>
					</div>
				</div>
				<div class="about-point">
					<span class="chk">&#10003;</span>
					<div>
						<b>Instant e-tickets</b><span>Boarding pass on your phone, no printing</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ===================== SERVICES ===================== -->
<section id="services" class="section section-alt">
	<div class="wrap">
		<div class="section-head reveal">
			<span class="eyebrow">What we offer</span>
			<h2>Everything you need for a smooth trip</h2>
			<p>From the first search to the final mile, SwiftBus keeps every step visible and in your control.</p>
		</div>
		<div class="services-grid">
			<div class="card service-card reveal">
				<div class="service-ico" aria-hidden="true">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M4 17V9a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8" stroke="#fff" stroke-width="1.8" stroke-linecap="round"/><rect x="4" y="17" width="16" height="3" rx="1.2" stroke="#fff" stroke-width="1.8"/><circle cx="8" cy="20.5" r="1.2" fill="#fff"/><circle cx="16" cy="20.5" r="1.2" fill="#fff"/></svg>
				</div>
				<h3>Live seat maps</h3>
				<p>Pick your exact seat from a real-time layout — no double-booked rows, ever.</p>
			</div>
			<div class="card service-card reveal">
				<div class="service-ico" aria-hidden="true">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"><path d="M12 3l7 3v6c0 4.5-3 7.5-7 9-4-1.5-7-4.5-7-9V6l7-3z" stroke="#fff" stroke-width="1.8" stroke-linejoin="round"/><path d="M9 12l2 2 4-4" stroke="#fff" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
				</div>
				<h3>Verified fleet</h3>
				<p>Every bus in our fleet is checked for licensing, safety and service quality.</p>
			</div>
			<div class="card service-card reveal">
				<div class="service-ico" aria-hidden="true">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"><rect x="4" y="4" width="16" height="16" rx="3" stroke="#fff" stroke-width="1.8"/><path d="M8 2v4M16 2v4M4 10h16" stroke="#fff" stroke-width="1.8" stroke-linecap="round"/></svg>
				</div>
				<h3>Instant e-tickets</h3>
				<p>Your boarding pass and QR code land on your phone the moment you pay.</p>
			</div>
			<div class="card service-card reveal">
				<div class="service-ico" aria-hidden="true">
					<svg width="24" height="24" viewBox="0 0 24 24" fill="none"><circle cx="12" cy="12" r="9" stroke="#fff" stroke-width="1.8"/><path d="M12 7v5l3 2" stroke="#fff" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round"/></svg>
				</div>
				<h3>24/7 support</h3>
				<p>Real people on chat and phone whenever a trip needs a human touch.</p>
			</div>
		</div>
	</div>
</section>

<!-- ===================== POPULAR ROUTES ===================== -->
<section class="section">
	<div class="wrap">
		<div class="section-head reveal">
			<span class="eyebrow">Popular routes</span>
			<h2>Where travellers are headed this week</h2>
			<p>Jump straight into a search for the routes people book most.</p>
		</div>
		<div class="route-groups">
			<div class="card route-group-card reveal">
				<div class="imgwrap">
					<img src="https://images.unsplash.com/photo-1570125909232-eb263c188f7e?w=1000&amp;q=80&amp;auto=format&amp;fit=crop" alt="Yangon cityscape">
				</div>
				<div class="body">
					<h3>Yangon routes</h3>
					<ul>
						<li>Yangon &rarr; Mandalay</li>
						<li>Yangon &rarr; Bagan</li>
						<li>Yangon &rarr; Taunggyi</li>
					</ul>
					<div class="route-line"><span class="dot"></span><span class="line"></span><span class="dot end"></span></div>
				</div>
			</div>
			<div class="card route-group-card reveal">
				<div class="imgwrap">
					<img src="https://images.unsplash.com/photo-1586941442904-97f931ecded8?w=1000&amp;q=80&amp;auto=format&amp;fit=crop" alt="Mandalay street scene">
				</div>
				<div class="body">
					<h3>Mandalay routes</h3>
					<ul>
						<li>Mandalay &rarr; Yangon</li>
						<li>Mandalay &rarr; Taunggyi</li>
						<li>Mandalay &rarr; Bagan</li>
					</ul>
					<div class="route-line"><span class="dot"></span><span class="line"></span><span class="dot end"></span></div>
				</div>
			</div>
			<div class="card route-group-card reveal">
				<div class="imgwrap">
					<img src="https://images.unsplash.com/photo-1601884666338-b17f7a4a21b3?w=1000&amp;q=80&amp;auto=format&amp;fit=crop" alt="Bagan temples at sunrise">
				</div>
				<div class="body">
					<h3>Bagan routes</h3>
					<ul>
						<li>Bagan &rarr; Yangon</li>
						<li>Bagan &rarr; Mandalay</li>
						<li>Bagan &rarr; Inle</li>
					</ul>
					<div class="route-line"><span class="dot"></span><span class="line"></span><span class="dot end"></span></div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ===================== HOW IT WORKS ===================== -->
<section id="how" class="section section-alt">
	<div class="wrap">
		<div class="section-head reveal">
			<span class="eyebrow">How it works</span>
			<h2>Three steps, start to boarding</h2>
			<p>A booking flow with nothing hidden between search and seat.</p>
		</div>
		<div class="steps">
			<div class="step reveal">
				<div class="num">1</div>
				<h3>Search &amp; compare</h3>
				<p>Enter your route and date to see every departure, time and price side by side.</p>
			</div>
			<div class="step reveal">
				<div class="num">2</div>
				<h3>Pick your seat</h3>
				<p>Choose your exact seat on a live map — what you see is what you get.</p>
			</div>
			<div class="step reveal">
				<div class="num">3</div>
				<h3>Ride with confidence</h3>
				<p>Pay securely and receive an instant e-ticket, ready to scan at boarding.</p>
			</div>
		</div>
	</div>
</section>

<!-- ===================== TESTIMONIALS ===================== -->
<section class="section">
	<div class="wrap">
		<div class="section-head reveal">
			<span class="eyebrow">Travellers say</span>
			<h2>Trusted for the trips that matter</h2>
		</div>
		<div class="testi-grid">
			<div class="card testi-card reveal">
				<div class="testi-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
				<p>Booked a Yangon&ndash;Mandalay seat in two minutes and the seat map matched exactly what was on the bus. No more counter guesswork.</p>
				<div class="testi-person">
					<span class="testi-avatar">TZ</span>
					<div>
						<b>Thet Zin</b><span>Yangon</span>
					</div>
				</div>
			</div>
			<div class="card testi-card reveal">
				<div class="testi-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
				<p>The e-ticket saved me at a crowded terminal — just scanned my phone and walked straight to my seat.</p>
				<div class="testi-person">
					<span class="testi-avatar">MH</span>
					<div>
						<b>Mi Hlaing</b><span>Mandalay</span>
					</div>
				</div>
			</div>
			<div class="card testi-card reveal">
				<div class="testi-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
				<p>Support answered at midnight when my bus got rescheduled. Rebooked me on the next departure with no extra fee.</p>
				<div class="testi-person">
					<span class="testi-avatar">KA</span>
					<div>
						<b>Kyaw Aung</b><span>Bagan</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- ===================== CTA BANNER ===================== -->
<section class="section">
	<div class="wrap">
		<div class="cta-banner reveal">
			<div class="cta-bg">
				<img src="https://images.unsplash.com/photo-1499346030926-9a72daac6c63?w=1400&amp;q=80&amp;auto=format&amp;fit=crop" alt="Winding highway through green hills">
			</div>
			<div class="cta-scrim"></div>
			<h2>Ready to hit the road?</h2>
			<p>Search live seats across our full fleet and lock in your trip in under a minute.</p>
			<div class="actions">
				<a href="#search" class="btn btn-cta">Search buses now</a>
				<a href="#contact" class="btn btn-ghost-light">Talk to us</a>
			</div>
			<div class="cta-route">
				<span class="dot"></span><span class="line"></span><span class="dot"></span><span class="line"></span><span class="dot"></span>
			</div>
		</div>
	</div>
</section>

<!-- ===================== CONTACT ===================== -->
<section id="contact" class="section section-alt">
	<div class="wrap contact-grid">
		<div class="contact-info reveal">
			<span class="eyebrow">Contact</span>
			<h2>Question about a route or a booking?</h2>
			<p>Our team replies within a few hours, every day of the week. For urgent trip-day issues, call us directly.</p>
			<div class="contact-row">
				<span class="ico" aria-hidden="true"><svg width="18" height="18" viewBox="0 0 24 24" fill="none"><path d="M3 5h18v14H3z" stroke="currentColor" stroke-width="1.8"/><path d="M3 6l9 7 9-7" stroke="currentColor" stroke-width="1.8"/></svg></span>
				<div>
					<b>Email</b><span>support@swiftbus.com</span>
				</div>
			</div>
			<div class="contact-row">
				<span class="ico" aria-hidden="true"><svg width="18" height="18" viewBox="0 0 24 24" fill="none"><path d="M4 4h4l2 6-3 2a13 13 0 0 0 6 6l2-3 6 2v4a2 2 0 0 1-2 2C10 23 1 14 1 6a2 2 0 0 1 2-2z" stroke="currentColor" stroke-width="1.6"/></svg></span>
				<div>
					<b>Phone</b><span>09 123 456 789</span>
				</div>
			</div>
			<div class="contact-row">
				<span class="ico" aria-hidden="true"><svg width="18" height="18" viewBox="0 0 24 24" fill="none"><path d="M12 21s7-6.1 7-11.5A7 7 0 0 0 5 9.5C5 14.9 12 21 12 21z" stroke="currentColor" stroke-width="1.8"/><circle cx="12" cy="9.5" r="2.3" stroke="currentColor" stroke-width="1.8"/></svg></span>
				<div>
					<b>Head office</b><span>Yangon, Myanmar</span>
				</div>
			</div>
		</div>
		<div class="card contact-form reveal">
			<form id="contactForm">
				<div class="form-grid2">
					<div>
						<label for="fullName">Full name</label>
						<input type="text" id="fullName" placeholder="Your name" required>
					</div>
					<div>
						<label for="phone">Phone</label>
						<input type="tel" id="phone" placeholder="09xxxxxxxxx">
					</div>
					<div class="full">
						<label for="email">Email</label>
						<input type="email" id="email" placeholder="you@example.com" required>
					</div>
					<div class="full">
						<label for="message">Message</label>
						<textarea id="message" placeholder="How can we help?" required></textarea>
					</div>
				</div>
				<button type="submit" class="btn btn-cta btn-full">Send message</button>
				<div class="form-note" id="formNote">Thanks — your message has been sent. We'll reply soon.</div>
			</form>
		</div>
	</div>
</section>

<!-- ===================== FOOTER ===================== -->
<footer class="site-footer">
	<div class="wrap">
		<div class="footer-grid">
			<div class="footer-brand">
				<div class="brand">
					<span class="mark"></span>SwiftBus
				</div>
				<p>Live seat maps, a verified fleet and transparent pricing for intercity travel across Myanmar.</p>
				<div class="footer-social">
					<a href="#" aria-label="Facebook"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M14 9h3V6h-3c-1.7 0-3 1.3-3 3v2H9v3h2v7h3v-7h3l1-3h-4V9c0-.6.4-1 1-1z" fill="#CFE2E6"/></svg></a>
					<a href="#" aria-label="Instagram"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><rect x="3" y="3" width="18" height="18" rx="5" stroke="#CFE2E6" stroke-width="1.6"/><circle cx="12" cy="12" r="4" stroke="#CFE2E6" stroke-width="1.6"/><circle cx="17.5" cy="6.5" r="1.2" fill="#CFE2E6"/></svg></a>
					<a href="#" aria-label="X"><svg width="16" height="16" viewBox="0 0 24 24" fill="none"><path d="M4 4l16 16M20 4L4 20" stroke="#CFE2E6" stroke-width="1.8" stroke-linecap="round"/></svg></a>
				</div>
			</div>
			<div class="footer-col">
				<h4>Company</h4>
				<a href="#home">Home</a> <a href="#about">About</a> <a href="#services">Services</a> <a href="#contact">Contact</a>
			</div>
			<div class="footer-col">
				<h4>Support</h4>
				<a href="#">Help centre</a> <a href="#">Cancellations</a> <a href="#">Terms of use</a> <a href="#">Privacy policy</a>
			</div>
			<div class="footer-col">
				<h4>Popular routes</h4>
				<a href="#">Yangon &rarr; Mandalay</a> <a href="#">Yangon &rarr; Bagan</a> <a href="#">Mandalay &rarr; Taunggyi</a>
			</div>
		</div>
		<div class="footer-bottom">
			<span>&copy; 2026 SwiftBus. All rights reserved.</span> <span>Made for travellers across Myanmar</span>
		</div>
	</div>
</footer>

<button class="to-top" id="toTop" aria-label="Back to top">&uarr;</button>

<script>
	// Sticky header shrink is handled by navbar.jsp's own scroll logic if present.
	var toTop = document.getElementById('toTop');
	window.addEventListener('scroll', function() {
		toTop.classList.toggle('show', window.scrollY > 500);
	}, { passive: true });

	// Reveal on scroll
	var revealObserver = new IntersectionObserver(function(entries) {
		entries.forEach(function(entry) {
			if (entry.isIntersecting) {
				entry.target.classList.add('in-view');
				revealObserver.unobserve(entry.target);
			}
		});
	}, { threshold: 0.15 });
	document.querySelectorAll('.reveal').forEach(function(el) { revealObserver.observe(el); });

	// Swap origin/destination
	var swapBtn = document.querySelector('.swap-btn');
	if (swapBtn) {
		swapBtn.addEventListener('click', function() {
			var from = document.getElementById('startLocation');
			var to = document.getElementById('endLocation');
			var tmp = from.value;
			from.value = to.value;
			to.value = tmp;
		});
	}

	// Contact form demo submit (client-side only — wire to a real endpoint later)
	var contactForm = document.getElementById('contactForm');
	var formNote = document.getElementById('formNote');
	if (contactForm) {
		contactForm.addEventListener('submit', function(e) {
			e.preventDefault();
			formNote.classList.add('show');
			contactForm.reset();
			setTimeout(function() { formNote.classList.remove('show'); }, 5000);
		});
	}
</script>
</body>
</html>
