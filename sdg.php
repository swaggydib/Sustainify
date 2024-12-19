<?php
include 'db_connection.php';

// Get SDG ID from URL
$sdg_id = isset($_GET['id']) ? intval($_GET['id']) : 1;

// Fetch SDG details
$sdg_query = "SELECT * FROM sdg WHERE id = $sdg_id";
$sdg_result = $conn->query($sdg_query);
$sdg = $sdg_result->fetch_assoc();

// Fetch Organizations for this SDG
$org_query = "SELECT o.* FROM organization o 
              JOIN sdg_organization so ON o.id = so.organization_id 
              WHERE so.sdg_id = $sdg_id";
$organizations = $conn->query($org_query);

// Fetch News for this SDG
$news_query = "SELECT * FROM news WHERE sdg_id = $sdg_id ORDER BY posted_date DESC";
$news_results = $conn->query($news_query);

// Fetch SDGs for navigation
$sdg_query = "SELECT id, image FROM sdg ORDER BY id";
$sdg_results = $conn->query($sdg_query);
?>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>SDG <?php echo $sdg_id; ?></title>
    <link rel="icon" href="icon/iconLogo/Logo.ico" type="icon/x-icon" />
    <link rel="stylesheet" href="sdgstyle.css?v=<?php echo time(); ?>" />
    <link rel="stylesheet" href="sdgqueries.css" />
    <link rel="stylesheet" href="swiper-bundle.min.css" />
  </head>
  <body>
    <nav id="desktop-nav">
      <a href="index.php">
        <div class="logo">SUSTAINIFY</div>
      </a>
      <div>
        <ul class="nav-links">
          <li><a href="index.php">SDGs</a></li>
          <li><a href="#organization">Organization</a></li>
          <li><a href="#news">News</a></li>
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
          <li><a href="index.php" onclick="togglemenu()">SDGs</a></li>
          <li>
            <a href="#organization" onclick="togglemenu()">Organization</a>
          </li>
          <li><a href="#news" onclick="togglemenu()">News</a></li>
        </div>
      </div>
    </nav>
    <!-- Main Information -->
    <section id="sdg-1">
      <div class="sdg-container">
        <div class="main-info">
          <div class="info-col1">
            <img src="<?php echo htmlspecialchars($sdg['image']); ?>" alt="SDG <?php echo $sdg_id; ?>" />
          </div>
          <div class="col-info2">
            <p>
            <?php echo htmlspecialchars($sdg['description']); ?>
            </p> 
          </div>
        </div>
      </div>
    </section>
    <!-- Organization Info -->
    <section id="organization">
    <h1 class="title">Organization & Volunteer</h1>
    <div class="organization-container swiper">
        <?php if ($organizations && $organizations->num_rows > 0): ?>
        <div class="slide-container">
            <div class="card-wrapper swiper-wrapper">
                <?php while($org = $organizations->fetch_assoc()): ?>
                <div class="card swiper-slide">
                    <a href="<?php echo htmlspecialchars($org['url']); ?>">
                        <div class="image-box">
                            <img src="<?php echo htmlspecialchars($org['logo']); ?>" alt="<?php echo htmlspecialchars($org['name']); ?>" />
                        </div>
                        <div class="organization-details">
                            <div class="name-organization">
                                <h3 class="name"><?php echo htmlspecialchars($org['name']); ?></h3>
                            </div>
                        </div>
                    </a>
                </div>
                <?php endwhile; ?>
            </div>
        </div>
        <div class="swiper-button-next swiper-navBtn"></div>
        <div class="swiper-button-prev swiper-navBtn"></div>
        <div class="swiper-pagination"></div>
        <?php else: ?>
        <p>No organizations found.</p>
        <?php endif; ?>
      </div>
    </section>
    <!-- News Info -->
    <section id="news">
      <div class="blog-section">
        <div class="section-content blog">
          <div class="title">
            <h2>News</h2>
          </div>
          <div class="news-card">
            <?php while($news = $news_results->fetch_assoc()): ?>
            <div class="news-card-details">
              <div class="image-section">
                <img src="<?php echo htmlspecialchars($news['image']); ?>" alt="<?php echo htmlspecialchars($news['title']); ?>" />
              </div>
              <div class="article">
                <h4><?php echo htmlspecialchars($news['title']); ?></h4>
                <p>
                <?php echo htmlspecialchars($news['paragraph']); ?>
                </p>
              </div>
              <div class="blog-view">
                <a
                  href="<?php echo htmlspecialchars($news['url']); ?>" target="_blank"
                  class="button"
                  >Read more</a
                >
              </div>
              <div class="posted-date">
                <p>Posted on <?php echo date('F d, Y', strtotime($news['posted_date'])); ?></p>
              </div>
            </div>
            <?php endwhile; ?>
          </div>
        </div>
      </div>
    </section>
    <!-- SDG IMG -->
    <section id="card-container">
      <div class="sdg-card-container1">
      <?php 
                $count = 0;
                while($sdg = $sdg_results->fetch_assoc()): 
                    $count++;
                    if ($count <= 9):
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
            $sdg_results->data_seek(9);
            $count = 0;
            ?>
      </div>
      <div class="sdg-card-container1">
      <?php 
                $count = 0;
                while($sdg = $sdg_results->fetch_assoc()): 
                    $count++;
                    if ($count <= 9):
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
          <img src="./assets/lOGGO-sdgs.jpeg" alt="sdgLogo" />
        </div>
      </div>
    </section>
    <!-- Mobile SDG IMG -->
    <section id="card-container-mobile">
    <div class="sdg-card-container1">
    <?php
        // Fetch all SDG names and images
        $sdg_nav_query = "SELECT id, name, image FROM sdg ORDER BY id";
        $sdg_nav_results = $conn->query($sdg_nav_query);
        
        while($sdg_nav = $sdg_nav_results->fetch_assoc()): 
        ?>
        <div class="sdg-card">
            <a href="sdg.php?id=<?php echo $sdg_nav['id']; ?>">
                <img src="<?php echo htmlspecialchars($sdg_nav['image']); ?>" alt="<?php echo htmlspecialchars($sdg_nav['name']); ?>">
            </a>
        </div>
        <?php endwhile; ?>
    </div>
    </section>
    <footer class="footer">
      <div class="footer-container">
        <div class="footer-section">
          <h3 class="footer-title">About Us</h3>
          <ul class="footer-list">
            <li>
              <a href="index.php#about" class="footer-link">Our Mission</a>
            </li>
            <li>
              <a href="index.php#contact" class="footer-link">Contact Us</a>
            </li>
          </ul>
        </div>
        <div class="footer-section">
          <h3 class="footer-title">Upcoming Event</h3>
          <ul class="footer-list">
            <li>
              <a href="index.php#event" class="footer-link">See What's Next</a>
            </li>
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
    <script src="swiper-bundle.min.js"></script>
    <script src="script.js"></script>
  </body>
</html>
<?php $conn->close(); ?>