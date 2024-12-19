<?php
include 'db_connection.php';

// Fetch SDGs for navigation
$sdg_query = "SELECT id, image FROM sdg ORDER BY id";
$sdg_results = $conn->query($sdg_query);

// Fetch Upcoming Events
$events_query = "SELECT * FROM sdg_event ORDER BY time DESC LIMIT 3";
$events_results = $conn->query($events_query);
?>



<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sustainify</title>
    <link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <link rel="stylesheet" href="style.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="mediaqueries.css" />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      rel="stylesheet"
    />
  </head>

  <body>
    <nav id="desktop-nav">
      <a href="index.php">
        <div class="logo">SUSTAINIFY</div>
        <!-- <img src="./assets/Logo.png" alt="" class="logo" /> -->
      </a>
      <div>
        <ul class="nav-links">
          <li><a href="#sdg">SDGs</a></li>
          <li><a href="#about">About</a></li>
          <li><a href="#event">Event</a></li>
          <li><a href="#contact">Contact</a></li>
        </ul>
      </div>
    </nav>
    <nav id="hamburger-nav">
      <div class="logo">SUSTAINIFY</div>
      <div class="hamburger-menu">
        <div class="hamburger-icon" onclick="togglemenu()">
          <span></span>
          <span></span>
          <span></span>
        </div>
        <div class="menu-links">
          <li><a href="#sdg" onclick="togglemenu()">SDGs</a></li>
          <li><a href="#about" onclick="togglemenu()">About</a></li>
          <li><a href="#event" onclick="togglemenu()">Event</a></li>
          <li><a href="#contact" onclick="togglemenu()">Contact</a></li>
        </div>
      </div>
    </nav>
    <section id="sdg">
      <div class="sdg-container">
        <div class="sdg-card-container1">
        <?php 
                $count = 0;
                while($sdg = $sdg_results->fetch_assoc()): 
                    $count++;
                    if ($count <= 6):
                ?>
          <div class="sdg-card">
            <a href="sdg.php?id=<?php echo $sdg['id']; ?>">
              <img src="<?php echo htmlspecialchars($sdg['image']); ?>" alt="SDG <?php echo $sdg['id']; ?>" />
            </a>
          </div>
          <?php 
            endif;
            endwhile; 
                
            // Reset pointer for second container
            $sdg_results->data_seek(6);
            $count = 0;
            ?>
        </div>
        <div class="sdg-card-container2">
          <?php while($sdg = $sdg_results->fetch_assoc()): 
                    $count++;
                    if ($count <= 6):
                ?>
          <div class="sdg-card">
            <a href="sdg.php?id=<?php echo $sdg['id']; ?>">
              <img src="<?php echo htmlspecialchars($sdg['image']); ?>" alt="SDG <?php echo $sdg['id']; ?>" />
            </a>
          </div>
          <?php 
                    endif;
                endwhile; 
                
                // Reset pointer for third container
                $sdg_results->data_seek(12);
                $count = 0;
                ?>
          
        <div class="sdg-card-container3">
          <?php 
          while($sdg = $sdg_results->fetch_assoc()): 
                $count++;
                if ($count <= 5):
          ?>
          <div class="sdg-card">
            <a href="sdg.php?id=<?php echo $sdg['id']; ?>">
              <img src="<?php echo htmlspecialchars($sdg['image']); ?>" alt="SDG <?php echo $sdg['id']; ?>" />
            </a>
          </div>
          <?php 
                    endif;
                  endwhile; 
                  ?>
          <div class="sdg-card">
            <a href="">
              <img src="./assets/lOGGO-sdgs.jpeg" alt="sdgLogo" />
            </a>
          </div>
        </div>
      </div>
    </section>
    <section id="about">
      <div class="about-container">
        <div class="about-content">
          <div class="title">
            <h1>About Us</h1>
          </div>
          <div class="content">
            <h3>Empowering Sustainable Futures Together</h3>
            <p>
              SUSTAINIFY is a dedicated non-profit organization striving to
              create a better world by promoting sustainable development. Our
              mission is to inspire, educate, and collaborate with individuals
              and organizations to achieve impactful solutions for global
              challenges.
            </p>
          </div>
        </div>
        <div class="about-image">
          <img src="./assets/Logo.png" alt="SUSTAINIFY Logo" />
        </div>
      </div>
    </section>
    <section id="event">
      <div class="event-container">
        <h2 class="section-title">Upcoming Events & Workshops</h2>
        <div class="event-cards">
        <?php while($event = $events_results->fetch_assoc()): ?>
          <div class="event-card">
            <div class="event-image">
              <img
                src="<?php echo htmlspecialchars($event['image']); ?>"
                alt="<?php echo htmlspecialchars($event['title']); ?>"
              />
            </div>
            <div class="event-details">
              <h3 class="event-title"><?php echo htmlspecialchars($event['title']); ?></h3>
              <p class="event-description">
                Location: <?php echo htmlspecialchars($event['place']); ?>
                <br />
                Date: <?php echo date('F d, Y', strtotime($event['time'])); ?>
              </p>
              <div class="event-actions">
                <a
                  href="<?php echo htmlspecialchars($event['from_url']); ?>"
                  class="btn btn-primary"
                  >Register Now</a
                >
              </div>
            </div>
          </div>
        <?php endwhile; ?>
        </div>
      </div>
    </section>
    <section id="contact">
      <div class="alert hide">
        <span class="far fa-heart"></span>
        <span class="msg">Thank you, your message has been sent!</span>
        <span class="close-btn">
          <span class="fas fa-times"></span>
        </span>
      </div>
      <div class="contact-container">
        <h2>Contact Us</h2>
        <div class="contact-wrapper">
          <div class="contact-form">
            <h3>Send us a message</h3>
            <form action="submit_contact.php" method="post" name="sustainify-contact-form">
              <div class="form-group">
                <input type="text" name="name" placeholder="your name" required />
              </div>
              <div class="form-group">
                <input type="email" name="email" placeholder="your email" required/>
              </div>
              <div class="form-group">
                <textarea name="message" placeholder="your message" required></textarea>
              </div>
              <button type="submit">Send Message</button>
            </form>
          </div>
          <div class="contact-info">
            <h3>Contact Information</h3>
            <p><strong>Address:</strong> 123 Main St, City, State, Zip Code</p>
            <p><strong>Phone:</strong> (123) 456-7890</p>
            <p><strong>Email:</strong> support@example.com</p>
          </div>
        </div>
      </div>
    </section>
    <footer class="footer">
      <div class="footer-container">
        <div class="footer-section">
          <h3 class="footer-title">About Us</h3>
          <ul class="footer-list">
            <li><a href="#about" class="footer-link">Our Mission</a></li>
            <li><a href="#contact" class="footer-link">Contact Us</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3 class="footer-title">Upcoming Event</h3>
          <ul class="footer-list">
            <li><a href="#event" class="footer-link">See What's Next</a></li>
          </ul>
        </div>
        <div class="footer-section">
          <h3 class="footer-title">Stay Connected</h3>
          <ul class="footer-list connect-list">
            <li><a href="#" class="footer-link">Facebook</a></li>
            <li><a href="#" class="footer-link">Twitter</a></li>
            <li><a href="#" class="footer-link">LinkedIn</a></li>
          </ul>
        </div>
      </div>
      <div class="footer-bottom">
        <p>
          &copy; 2024 Sustainify. Made with <span class="heart">❤</span> for a
          better future.
        </p>
      </div>
    </footer>
    <script src="script.js"></script>

    <script>
      const scriptURL =
  "https://script.google.com/macros/s/AKfycbxe-mfuftXKklfSaC7wn5WScPJVYSmAnRjwrTmA_S2NFVG5xNQjB6roFnsJR6NDl4HK/exec";
const form = document.forms["sustainify-contact-form"];
const alertElement = document.querySelector(".alert");
const closeButton = alertElement.querySelector(".close-btn");

form.addEventListener("submit", (e) => {
  e.preventDefault();
  
  // Create FormData object
  const formData = new FormData(form);

  // First, submit to Google Sheets
  fetch(scriptURL, { method: "POST", body: formData })
    .then((googleResponse) => {
      console.log("Google Sheets submission success!", googleResponse);
      
      // Then, submit to PHP backend
      return fetch('submit_contact.php', {
        method: 'POST',
        body: formData
      });
    })
    .then((phpResponse) => {
      if (!phpResponse.ok) {
        throw new Error('PHP submission failed');
      }
      return phpResponse.text();
    })
    .then((phpResponseText) => {
      // Show success alert
      alertElement.classList.remove("hide");
      alertElement.classList.add("show");
      form.reset();
      console.log("Both Google Sheets and Database submission successful!");
    })
    .catch((error) => {
      console.error("Error!", error.message);
      // Optionally show an error alert
      alert("There was an issue submitting your message. Please try again.");
    });
});

closeButton.addEventListener("click", () => {
  alertElement.classList.remove("show");
  alertElement.classList.add("hide");
});
    </script>
  </body>
</html>
<?php $conn->close(); ?>