<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${companyName} | ${tagline}</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Space+Mono:wght@400;700&family=Syne:wght@400;600;800&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>

    <!-- ===== HERO ===== -->
    <header class="hero">
        <div class="hero-noise"></div>
        <div class="hero-grid"></div>
        <div class="hero-content">
            <div class="badge">Est. ${established}</div>
            <h1 class="hero-title">${companyName}</h1>
            <p class="hero-tagline">~ ${tagline} ~</p>
            <a href="#courses" class="cta-btn">Explore Courses ↓</a>
        </div>
        <!-- Floating terminal decoration -->
        <div class="terminal-deco">
            <div class="terminal-bar"><span class="dot red"></span><span class="dot yellow"></span><span class="dot green"></span></div>
            <pre class="terminal-code">$ ./start-devops-journey.sh
> Initializing lab environment...
> Loading CI/CD pipelines...
> Connecting to cloud instances...
<span class="blink">█</span></pre>
        </div>
    </header>

    <!-- ===== COMPANY DETAILS ===== -->
    <section class="section info-section">
        <div class="container">
            <h2 class="section-title"><span class="line"></span>Company Details<span class="line"></span></h2>
            <div class="info-grid">
                <div class="info-card">
                    <span class="info-label">Name</span>
                    <span class="info-value">${companyName}</span>
                </div>
                <div class="info-card">
                    <span class="info-label">Tagline</span>
                    <span class="info-value">${tagline}</span>
                </div>
                <div class="info-card">
                    <span class="info-label">Established</span>
                    <span class="info-value">${established}</span>
                </div>
                <div class="info-card">
                    <span class="info-label">Location</span>
                    <span class="info-value">${location}</span>
                </div>
                <div class="info-card">
                    <span class="info-label">Website</span>
                    <span class="info-value">
                        <a href="https://${website}" target="_blank">${website}</a>
                    </span>
                </div>
                <div class="info-card">
                    <span class="info-label">Email</span>
                    <span class="info-value">
                        <a href="mailto:${email}">${email}</a>
                    </span>
                </div>
                <div class="info-card">
                    <span class="info-label">Phone</span>
                    <span class="info-value">${phone}</span>
                </div>
            </div>
        </div>
    </section>

    <!-- ===== COURSES ===== -->
    <section class="section courses-section" id="courses">
        <div class="container">
            <h2 class="section-title"><span class="line"></span>Courses Offered<span class="line"></span></h2>
            <div class="courses-grid">
                <%
                    List<String> courses = (List<String>) request.getAttribute("courses");
                    int i = 1;
                    for (String course : courses) {
                %>
                <div class="course-card" style="animation-delay: <%= (i * 0.08) %>s">
                    <span class="course-num"><%= String.format("%02d", i) %></span>
                    <span class="course-name"><%= course %></span>
                    <span class="course-arrow">→</span>
                </div>
                <% i++; } %>
            </div>
        </div>
    </section>

    <!-- ===== KEY FEATURES ===== -->
    <section class="section features-section">
        <div class="container">
            <h2 class="section-title"><span class="line"></span>Key Features<span class="line"></span></h2>
            <div class="features-grid">
                <%
                    List<String> features = (List<String>) request.getAttribute("features");
                    for (String feature : features) {
                %>
                <div class="feature-card">
                    <span class="checkmark">✔</span>
                    <span class="feature-text"><%= feature %></span>
                </div>
                <% } %>
            </div>
        </div>
    </section>

    <!-- ===== FOOTER ===== -->
    <footer class="footer">
        <div class="footer-content">
            <p class="footer-cta">Enroll Today</p>
            <p class="footer-motto">Learn. Build. Deploy.</p>
            <p class="footer-copy">&copy; 2024 ${companyName}. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>
