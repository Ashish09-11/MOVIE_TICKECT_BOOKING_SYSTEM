<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>War 2 - Cinema Book</title>

  <!-- Bootstrap & Fonts -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #ffffff;
      color: #222;
      margin: 0;
      padding: 0;
      overflow-x: hidden;
    }
    
        .back-btn {
        position: fixed;
        top: 100px;
        Left: 50px;
        background-color: #e50914;
        color: #fff;
        border: none;
        padding: 10px 18px;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
        font-size: 1rem;
        z-index: 10000;
        transition: 0.3s;
    }

    .back-btn:hover {
        background-color: #ff4b2b;
        transform: scale(1.05);
    }

    /* Navbar */
    .navbar {
      background-color: #ffffff;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      padding: 15px 5%;
    }

    .navbar-brand {
      font-weight: 700;
      font-size: 1.5rem;
      color: #e50914;
    }

    .navbar a {
      color: #222 !important;
      font-weight: 600;
    }

    .navbar a:hover {
      color: #e50914 !important;
    }

    /* Hero Section */
    .movie-hero {
      position: relative;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      height: 550px;
      display: flex;
      align-items: flex-end;
      justify-content: flex-start;
      color: white;
      border-radius: 20px;
      margin: 40px auto;
      max-width: 1100px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.3);
      overflow: hidden;
      padding: 40px;
      background-color: #000;
    }

    .movie-overlay {
      position: absolute;
      inset: 0;
      background: linear-gradient(to top, rgba(0, 0, 0, 0.85) 20%, transparent 80%);
      border-radius: 20px;
    }

    .movie-info {
      position: relative;
      z-index: 2;
      max-width: 700px;
      text-align: left;
    }

    .rating-stars {
      color: #ffc107;
      font-size: 1.2rem;
    }

    .tags span {
      display: inline-block;
      background-color: rgba(255, 255, 255, 0.2);
      border: 1px solid rgba(255, 255, 255, 0.4);
      color: #fff;
      padding: 5px 15px;
      margin-right: 10px;
      margin-bottom: 15px;
      border-radius: 15px;
      font-size: 0.9rem;
      font-weight: 500;
    }

    /* Buttons */
    .btn-book, .btn-trailer {
      font-weight: 600;
      padding: 12px 25px;
      border-radius: 10px;
      margin-right: 10px;
      transition: 0.3s ease;
    }

    .btn-book {
      background: linear-gradient(135deg, #e50914, #ff4b2b);
      color: #fff;
      border: none;
    }

    .btn-book:hover {
      background: linear-gradient(135deg, #ff4b2b, #ff6a00);
      transform: scale(1.05);
      box-shadow: 0 0 20px rgba(255, 75, 43, 0.6);
    }

    .btn-trailer {
      background-color: #fff;
      border: 2px solid #e50914;
      color: #e50914;
    }

    .btn-trailer:hover {
      background-color: #e50914;
      color: #fff;
      transform: scale(1.05);
    }

    /* Trailer Popup */
    .trailer-container {
      position: fixed;
      top: 0;
      right: -100%;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.95);
      display: flex;
      align-items: center;
      justify-content: center;
      transition: right 0.6s ease;
      z-index: 9999;
    }

    .trailer-container.active {
      right: 0;
    }

    .trailer-container iframe {
      width: 80%;
      height: 70%;
      border-radius: 10px;
      box-shadow: 0 0 30px rgba(255, 255, 255, 0.3);
    }

    .close-trailer {
      position: absolute;
      top: 20px;
      right: 40px;
      font-size: 2rem;
      color: #fff;
      cursor: pointer;
      transition: 0.3s;
    }

    .close-trailer:hover {
      color: #e50914;
      transform: scale(1.1);
    }

    /* Stats */
    .movie-stats {
      display: flex;
      justify-content: center;
      flex-wrap: wrap;
      gap: 40px;
      padding: 40px 20px;
      background-color: #f5f5f5;
      text-align: center;
    }

    .stat-number {
      font-size: 2rem;
      font-weight: 700;
      color: #e50914;
    }

    /* Sections */
    .plot-summary, .cast-crew {
      max-width: 1000px;
      margin: 50px auto;
      padding: 0 20px;
    }

    .plot-summary h2, .cast-crew h2 {
      font-size: 2rem;
      font-weight: 700;
      margin-bottom: 25px;
      color: #222;
      border-bottom: 3px solid #e50914;
      display: inline-block;
    }

    .plot-summary p {
      font-size: 1rem;
      line-height: 1.7;
      margin-bottom: 20px;
      color: #333;
    }

    .crew-section {
      margin-bottom: 30px;
    }

    .crew-member {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }

    .crew-member img {
      width: 60px;
      height: 60px;
      object-fit: cover;
      border-radius: 50%;
      margin-right: 15px;
    }

    .main-cast {
      display: flex;
      flex-wrap: wrap;
      gap: 30px;
    }

    .main-cast .crew-member {
      flex: 1 1 200px;
      background: #f9f9f9;
      padding: 15px;
      border-radius: 10px;
      transition: 0.3s ease;
    }

    .main-cast .crew-member:hover {
      background: #ffe8e6;
      transform: translateY(-3px);
    }

    footer {
      background-color: #f8f9fa;
      text-align: center;
      padding: 20px;
      font-size: 0.9rem;
      color: #777;
      border-top: 1px solid #ddd;
    }

    @media (max-width: 768px) {
      .movie-hero { height: auto; padding: 30px 20px; }
      .main-cast { flex-direction: column; }
      .crew-member { flex-direction: column; align-items: flex-start; }
      .crew-member img { margin-bottom: 10px; }
    }
  </style>
</head>

<body>

<button class="back-btn" onclick="window.location.href='userDashboard.jsp'">← Back</button>

  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg">
    <a class="navbar-brand" href="#">CINEMA BOOK</a>
    <form class="d-flex mx-auto search-bar">
      <input class="form-control me-2" type="search" placeholder="Search movies...">
      <button class="btn btn-danger" type="submit">Search</button>
    </form>
    <div>
      <a href="userDashboard.jsp" class="mx-3 text-decoration-none">Home</a>
      <a href="login.jsp" class="mx-3 text-decoration-none">Logout</a>
    </div>
  </nav>

  <!-- Hero Section -->
  <section class="movie-hero" style="background-image: url('https://i.pinimg.com/736x/f9/ff/28/f9ff28aa65ba42a80bcc26c351102457.jpg');">
    <div class="movie-overlay"></div>
    <div class="movie-info text-white">
      <h1>War 2</h1>
      <div class="d-flex align-items-center my-2">
        <span class="rating-stars"><i class="bi bi-star-fill"></i> 7.8/10</span>
        <span class="mx-3 badge bg-warning text-dark">U/A</span>
        <span>• 165 min • 2025</span>
      </div>
      <div class="tags">
        <span>Action</span>
        <span>Thriller</span>
        <span>Adventure</span>
      </div>
      <p class="movie-description">
        A new battle begins as elite agents face an international criminal mastermind. As old enemies rise, loyalty and betrayal collide in a war that will change everything.
      </p>
      <div class="buttons">
        <button class="btn btn-book" id="bookNow">🎟 Book Tickets Now</button>
        <button class="btn btn-trailer" id="watchTrailer">▶ Watch Trailer</button>
      </div>
    </div>
  </section>

  <!-- Trailer Popup -->
  <div class="trailer-container" id="trailerPopup">
    <span class="close-trailer" id="closeTrailer">&times;</span>
    <iframe id="trailerVideo" src="" frameborder="0" allowfullscreen></iframe>
  </div>

  <!-- Stats -->
  <div class="movie-stats">
    <div><div class="stat-number">50K+</div><p>User Reviews</p></div>
    <div><div class="stat-number">85%</div><p>Critics Score</p></div>
    <div><div class="stat-number">80%</div><p>Watchlisted</p></div>
    <div><div class="stat-number">500</div><p>Booked Today</p></div>
  </div>

  <!-- Plot Summary -->
  <section class="plot-summary">
    <h2>Plot Summary</h2>
    <p>After a legendary agent disappears, his former partner leads a mission to take down a global criminal network. The mission turns into a deadly chase that tests their courage, loyalty, and fate.</p>
    <p>As past secrets surface, both heroes must face each other to stop an impending catastrophe threatening world peace.</p>
  </section>

  <!-- Cast & Crew -->
  <section class="cast-crew">
    <h2>Cast & Crew</h2>

    <div class="crew-section mb-4">
      <h5>Director</h5>
      <div class="crew-member">
        <img src="https://upload.wikimedia.org/wikipedia/commons/1/17/Sidharth_Anand.png" alt="Sidharth Anand">
        <div><strong>Sidharth Anand</strong><br><p>Director</p></div>
      </div>
    </div>

    <div class="crew-section">
      <h5>Main Cast</h5>
      <div class="main-cast">
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/4/42/Hrithik_Roshan_at_India_International_Film_Academy_Awards_2014.jpg" alt="Hrithik Roshan">
          <div><strong>Hrithik Roshan</strong><br><p>Kabir</p></div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/6/6b/Tiger_Shroff_at_the_India_Glamour_Awards_2019.jpg" alt="Tiger Shroff">
          <div><strong>Tiger Shroff</strong><br><p>Khalid</p></div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/6/6e/Deepika_Padukone_at_the_Filmfare_Awards_2018.jpg" alt="Deepika Padukone">
          <div><strong>Deepika Padukone</strong><br><p>Aditi</p></div>
        </div>
        <div class="crew-member">
          <img src="https://upload.wikimedia.org/wikipedia/commons/a/a2/Dimple_Kapadia_2018.jpg" alt="Dimple Kapadia">
          <div><strong>Dimple Kapadia</strong><br><p>Anjali</p></div>
        </div>
      </div>
    </div>
  </section>

  <footer>
    &copy; 2025 Cinema Book — Your Ultimate Movie Ticket Partner 🎬
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // 🎟 Redirect to booking page
    document.getElementById('bookNow').addEventListener('click', () => {
      window.location.href = 'booking.jsp';
    });

    // ▶ Trailer Popup
    const trailerBtn = document.getElementById('watchTrailer');
    const trailerPopup = document.getElementById('trailerPopup');
    const trailerVideo = document.getElementById('trailerVideo');
    const closeTrailer = document.getElementById('closeTrailer');

    trailerBtn.addEventListener('click', () => {
      trailerPopup.classList.add('active');
      trailerVideo.src = "assets/trailer_Videos/war 2.mp4"; // War 2 trailer
    });

    closeTrailer.addEventListener('click', () => {
      trailerPopup.classList.remove('active');
      trailerVideo.src = "";
    });
  </script>
</body>
</html>
