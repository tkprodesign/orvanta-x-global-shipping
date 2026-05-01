<?php
include('./app.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OrvantaX Global Shipping | Shipping, Tracking, Freight & Logistics Solutions</title>

    <link rel="stylesheet" href="/assets/stylesheets/main.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/main.css'); ?>">
    <link rel="stylesheet" href="/assets/stylesheets/home.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/home.css'); ?>">
    <link rel="stylesheet" href="/assets/stylesheets/ts/main.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/ts/main.css'); ?>" media="screen and (max-width: 1120px)">
    <link rel="stylesheet" href="/assets/stylesheets/ts/home.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/ts/home.css'); ?>" media="screen and (max-width: 1120px)">
    <link rel="stylesheet" href="/assets/stylesheets/ms/main.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/ms/main.css'); ?>" media="screen and (max-width: 760px)">
    <link rel="stylesheet" href="/assets/stylesheets/ms/home.css?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/stylesheets/ms/home.css'); ?>" media="screen and (max-width: 760px)">

    <link rel="shortcut icon" href="<?= htmlspecialchars(asset_url('/assets/images/branding/favicon.png')); ?>" type="image/png">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <script src="https://kit.fontawesome.com/79b279a6c9.js" crossorigin="anonymous" defer></script>
</head>

<body class="home-v2">

<?php include("common-sections/header.html"); ?>

<!-- ═══════════════════════════════════════════
     HERO
═══════════════════════════════════════════ -->
<section class="hv2-hero">
    <div class="hv2-hero__glow"></div>
    <div class="hv2-hero__inner">
        <img
            src="<?= htmlspecialchars(asset_url('/assets/images/branding/seal.png')); ?>"
            alt="OrvantaX Global Shipping"
            class="hv2-hero__logo"
        >
        <h1 class="hv2-hero__headline">Shipping Excellence</h1>
        <p class="hv2-hero__sub">
            Global logistics. Seamless delivery. Your trusted partner for freight, cargo, and courier services worldwide.
        </p>
        <div class="hv2-hero__ctas">
            <a href="#" class="js-open-support-chat hv2-btn hv2-btn--cyan" data-chat-message="I need help to make a quote.">Get a Quote</a>
            <a href="/track/" class="hv2-btn hv2-btn--ghost">Track Shipment</a>
        </div>
        <form class="hv2-hero__track" action="/track/" method="get">
            <input type="text" name="id" placeholder="Enter tracking number or InfoNotice®" autocomplete="off">
            <button type="submit">Track <span class="material-symbols-outlined">chevron_right</span></button>
        </form>
    </div>
    <a href="#hv2-stats" class="hv2-hero__scroll" aria-label="Scroll down">
        <span class="material-symbols-outlined">keyboard_arrow_down</span>
    </a>
</section>


<!-- ═══════════════════════════════════════════
     STATS
═══════════════════════════════════════════ -->
<section class="hv2-stats" id="hv2-stats">
    <div class="container">
        <div class="hv2-stats__grid">
            <div class="hv2-stat">
                <span class="hv2-stat__number">1M+</span>
                <span class="hv2-stat__label">Shipments Delivered</span>
            </div>
            <div class="hv2-stat">
                <span class="hv2-stat__number">150+</span>
                <span class="hv2-stat__label">Countries Served</span>
            </div>
            <div class="hv2-stat">
                <span class="hv2-stat__number">99.2%</span>
                <span class="hv2-stat__label">On-Time Delivery</span>
            </div>
            <div class="hv2-stat">
                <span class="hv2-stat__number">24/7</span>
                <span class="hv2-stat__label">Customer Support</span>
            </div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════
     SERVICES
═══════════════════════════════════════════ -->
<section class="hv2-services">
    <div class="container">
        <div class="hv2-section-header">
            <p class="hv2-eyebrow">What We Offer</p>
            <h2>Complete logistics solutions for every shipping need.<br>From air to ocean, we deliver.</h2>
        </div>
        <div class="hv2-services__grid">
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-plane-departure"></i>
                </div>
                <h3>Air Freight</h3>
                <p>Express air cargo solutions for time-sensitive shipments. Global network, priority handling, real-time tracking.</p>
                <a href="/shipping/create/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-ship"></i>
                </div>
                <h3>Ocean Freight</h3>
                <p>Cost-effective sea freight for large volumes. Full container load (FCL) and less than container load (LCL) options.</p>
                <a href="/shipping/create/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-truck"></i>
                </div>
                <h3>Ground Transport</h3>
                <p>Reliable road freight and courier services. Local and long-haul delivery with flexible scheduling.</p>
                <a href="/shipping/create/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-box-open"></i>
                </div>
                <h3>Customs Clearance</h3>
                <p>Streamlined customs brokerage and compliance. Expert handling of documentation and regulations.</p>
                <a href="/services/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-warehouse"></i>
                </div>
                <h3>Warehousing</h3>
                <p>Secure storage and distribution solutions. Inventory management, order fulfillment, and cross-docking.</p>
                <a href="/services/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
            <div class="hv2-service-card">
                <div class="hv2-service-card__icon">
                    <i class="fa-solid fa-globe"></i>
                </div>
                <h3>International Shipping</h3>
                <p>Worldwide reach with door-to-door service. Serving 150+ countries with comprehensive logistics solutions.</p>
                <a href="/shipping/create/" class="hv2-card-link">Learn more <span class="material-symbols-outlined">arrow_forward</span></a>
            </div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════
     WHY CHOOSE US
═══════════════════════════════════════════ -->
<section class="hv2-why">
    <div class="container">
        <div class="hv2-section-header hv2-section-header--light">
            <p class="hv2-eyebrow hv2-eyebrow--dark">Our Standards</p>
            <h2>Precision in Motion. Deliveries You Can Count On</h2>
            <p class="hv2-section-header__sub">From urgent parcels to secure government deliveries, OrvantaX handles every shipment with <strong>care, speed, and reliability</strong>.</p>
        </div>
        <div class="hv2-why__grid">
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-solid fa-medal"></i></div>
                <h4>Operational Excellence</h4>
                <p>Every package is delivered efficiently, safely, and on schedule.</p>
            </div>
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-regular fa-clock"></i></div>
                <h4>Time-Definite Logistics</h4>
                <p>Every shipment arrives when expected, no exceptions.</p>
            </div>
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-solid fa-shield-halved"></i></div>
                <h4>Chain of Custody</h4>
                <p>Sensitive documents and valuable parcels are protected at every step.</p>
            </div>
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-solid fa-chart-line"></i></div>
                <h4>Standardized Reliability</h4>
                <p>Every delivery follows a structured process, guaranteeing dependable results.</p>
            </div>
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-solid fa-network-wired"></i></div>
                <h4>Network Optimization</h4>
                <p>Deliveries follow a controlled, efficient process from pickup to drop-off.</p>
            </div>
            <div class="hv2-why-card">
                <div class="hv2-why-card__icon"><i class="fa-solid fa-user-tie"></i></div>
                <h4>Core Operational Mandate</h4>
                <p>Professionalism. Discipline. Dedication. Safety and efficiency define every operation.</p>
            </div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════
     BUSINESS vs PERSONAL SERVICES
═══════════════════════════════════════════ -->
<section class="hv2-solutions">
    <div class="container">
        <div class="hv2-section-header">
            <p class="hv2-eyebrow">Tailored For You</p>
            <h2>Logistics Solutions for Businesses and Individuals</h2>
            <p class="hv2-section-header__sub">From urgent parcels to freight movements, OrvantaX delivers with speed, security, and transparency.</p>
        </div>
        <div class="hv2-solutions__toggle">
            <button class="hv2-toggle-btn hv2-toggle-btn--active js-sol-btn" data-target="sol-business">Business</button>
            <button class="hv2-toggle-btn js-sol-btn" data-target="sol-personal">Personal</button>
        </div>
        <div class="hv2-solutions__panel hv2-solutions__panel--active" id="sol-business">
            <div class="hv2-solutions__grid">
                <div class="hv2-solution-item">
                    <h3>Government Logistics</h3>
                    <p>Compliance & Security. Time-sensitive and confidential deliveries for government agencies & personnel.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Start Order <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Bulk & Scheduled Deliveries</h3>
                    <p>Efficiency. Large shipments and recurring deliveries for organizations executed seamlessly.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Book Bulk <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Inter-City & Regional Delivery</h3>
                    <p>Coverage. Shipments reach cities and regions on schedule, supporting official operations.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Ship Route <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Document & Official Parcel Delivery</h3>
                    <p>Confidentiality. Critical documents and packages transported securely at every stage.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Send Docs <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
            </div>
        </div>
        <div class="hv2-solutions__panel" id="sol-personal">
            <div class="hv2-solutions__grid">
                <div class="hv2-solution-item">
                    <h3>Same-Day Delivery</h3>
                    <p>Urgency. Critical packages are picked up and delivered the same day.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Ship Today <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Family Parcel Delivery</h3>
                    <p>Care. Personal packages and parcels handled safely, ensuring timely arrival to loved ones.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Send Parcel <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Assisted Pickup & Delivery</h3>
                    <p>Convenience. Assisted pickups and deliveries are supported efficiently.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Book Pickup <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
                <div class="hv2-solution-item">
                    <h3>Event & Specialty Deliveries</h3>
                    <p>Flexibility. Packages for personal events, celebrations, or special requests managed with care.</p>
                    <a href="/shipping/create/" class="hv2-card-link">Ship Event <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════
     PROMO BANNER
═══════════════════════════════════════════ -->
<section class="hv2-banner">
    <div class="container">
        <div class="hv2-banner__inner">
            <div class="hv2-banner__text">
                <h3>Save up to 65% When You Ship International</h3>
                <p>Use code <strong>GoIntL2026</strong> at checkout to apply your discount automatically.</p>
            </div>
            <a href="/shipping?coupon=GoIntL2026" class="hv2-btn hv2-btn--cyan">
                Ship &amp; Save <span class="material-symbols-outlined">chevron_right</span>
            </a>
        </div>
    </div>
</section>


<!-- ═══════════════════════════════════════════
     IMPORTANT UPDATES
═══════════════════════════════════════════ -->
<section class="hv2-updates">
    <div class="container">
        <div class="hv2-section-header">
            <p class="hv2-eyebrow">Stay Informed</p>
            <h2>Important Updates</h2>
        </div>
        <div class="hv2-updates__list">
            <details class="hv2-accordion" open>
                <summary>
                    <span>Fuel Surcharge</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>Effective March 2, 2026, the U.S. International Ground Export Import Fuel Surcharge will change.</p>
                    <a href="https://assets.ups.com/adobe/assets/urn:aaid:aem:13ea22a9-bd18-49ee-a87c-c3b6f761a002/original/as/us-domestic-fuel-flyer.pdf" target="_blank" rel="noopener noreferrer" class="hv2-card-link">
                        Read More About the Rate Change <span class="material-symbols-outlined">open_in_new</span>
                    </a>
                </div>
            </details>
            <details class="hv2-accordion">
                <summary>
                    <span>Information about Flight 2976 Accident</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>Read more on current network advisories in our support center and shipment alerts.</p>
                </div>
            </details>
            <details class="hv2-accordion">
                <summary>
                    <span>Updated Tariff and Rate and Service Guides</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>Carrier tariff, service guide, and network terms were updated effective January 26, 2026.</p>
                    <a href="/support/" class="hv2-card-link">View Guides <span class="material-symbols-outlined">arrow_forward</span></a>
                </div>
            </details>
            <details class="hv2-accordion">
                <summary>
                    <span>Domestic Fuel Surcharge</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>Effective January 5, 2026, the U.S. Ground Domestic and the domestic ground fuel surcharge will change.</p>
                </div>
            </details>
            <details class="hv2-accordion">
                <summary>
                    <span>Large Package and Additional Handling Changes</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>Changes previously scheduled for December 22, 2025, have been delayed until January 26, 2026.</p>
                </div>
            </details>
            <details class="hv2-accordion">
                <summary>
                    <span>Learn More About Recent Trade Policy and Tariff Changes</span>
                    <span class="material-symbols-outlined hv2-accordion__icon">add</span>
                </summary>
                <div class="hv2-accordion__body">
                    <p>We'll help you stay informed about the <a href="/support/" class="hv2-card-link">impacts of the new tariffs <span class="material-symbols-outlined">arrow_forward</span></a></p>
                </div>
            </details>
        </div>
    </div>
</section>


<?php include("common-sections/footer.html"); ?>

<script src="/assets/scripts/home.js?v=<?php echo filemtime($_SERVER['DOCUMENT_ROOT'] . '/assets/scripts/home.js'); ?>"></script>
<script>
(function () {
    // Solutions toggle
    document.querySelectorAll('.js-sol-btn').forEach(function (btn) {
        btn.addEventListener('click', function () {
            document.querySelectorAll('.js-sol-btn').forEach(function (b) {
                b.classList.remove('hv2-toggle-btn--active');
            });
            document.querySelectorAll('.hv2-solutions__panel').forEach(function (p) {
                p.classList.remove('hv2-solutions__panel--active');
            });
            btn.classList.add('hv2-toggle-btn--active');
            var target = document.getElementById(btn.dataset.target);
            if (target) target.classList.add('hv2-solutions__panel--active');
        });
    });

    // Accordion icon swap
    document.querySelectorAll('.hv2-accordion').forEach(function (el) {
        el.addEventListener('toggle', function () {
            var icon = el.querySelector('.hv2-accordion__icon');
            if (icon) icon.textContent = el.open ? 'remove' : 'add';
        });
    });
})();
</script>
</body>
</html>
