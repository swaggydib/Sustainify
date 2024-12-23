-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 04:44 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdg_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `message`, `timestamp`) VALUES
(1, 'adib', 'adib@gmail.com', 'php test 4', '2024-12-11 15:11:26'),
(2, 'adib', 'adib@gmail.com', 'php test 4', '2024-12-11 15:12:06'),
(3, 'adib', 'adib@gmail.com', 'php test 5', '2024-12-11 15:13:45'),
(4, 'adib', 'adib@gmail.com', 'php test 5', '2024-12-11 15:14:02'),
(5, 'adib', 'adib@gmail.com', 'php test 6', '2024-12-11 15:16:03'),
(6, 'adib', 'adib@gmail.com', 'php testttt', '2024-12-11 15:28:08'),
(7, 'adib', 'adib@gmail.com', 'php test another one', '2024-12-11 15:28:40'),
(8, 'adib', 'adib@gmail.com', 'php test another one', '2024-12-11 15:29:33'),
(9, 'adib', 'adib@gmail.com', 'pliease lastt', '2024-12-11 15:31:17'),
(10, 'op', 'email@gmail.com', 'anzgay', '2024-12-13 06:33:22'),
(11, 'op', 'email@gmail.com', 'anzgay', '2024-12-13 06:33:22'),
(12, 'op', 'email@gmail.com', 'anzgay', '2024-12-13 06:33:26'),
(13, 'op', 'email@gmail.com', 'anzgay', '2024-12-13 06:33:29');

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `posted_date` date NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sdg_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `image`, `paragraph`, `posted_date`, `url`, `sdg_id`) VALUES
(1, 'Ending Poverty : The road to 2030', './news/news1.jpg', 'This event presents an opportunity to showcase the world’s progress to date on reducing extreme poverty, identify barriers to future progress on SDG 1, convene country representatives to reflect on real-life lessons and progress, and highlight and share the World Bank Group’s work and analysis of ending global extreme poverty by 2030 and boosting shared prosperity in every country.', '2017-05-11', 'https://www.worldbank.org/en/events/2017/03/21/ending-poverty-the-road-to-2030', 1),
(2, 'The wider the gap between rich and poor the higher the flood mortality', './news/news2.webp', 'Economic inequality is rising within many countries globally, and this can significantly influence the social vulnerability to natural hazards. We analysed income inequality and flood disasters in 67 middle- and high-income countries between 1990 and 2018 and found that unequal countries tend to suffer more flood fatalities.', '2023-04-17', 'https://www.nature.com/articles/s41893-023-01107-7', 1),
(3, 'Expert Group Meeting on Sustainable Development Goal 1', './news/news3.png', 'This Expert Group Meeting examined progress made on SDG1, which calls for ending extreme poverty by 2030. The outcomes from these discussions will be used as substantive inputs in preparation for the 2024 UN High Level Political Forum to be held in New York in July.', '2024-05-07', 'https://www.worldbank.org/en/events/2024/05/07/sustainable-development-goal-1-expert-group-meeting#1', 1),
(7, 'Hunger numbers stubbornly high for three consecutive years', 'news/6764ff14e50f0.jpg', 'Around 733 million people faced hunger in 2023, equivalent to one in eleven people globally and one in five in Africa, according to the latest State of Food Security and Nutrition in the World (SOFI) report published today by five United Nations specialized agencies.', '2024-07-24', 'https://www.who.int/news/item/24-07-2024-hunger-numbers-stubbornly-high-for-three-consecutive-years-as-global-crises-deepen--un-report', 2),
(8, 'Achieving SDG 2 without breaching the 1.5 °C threshold: A global roadmap', 'news/6764ff6aec0b2.jpeg', '“The Global Roadmap brings solutions and clear outcomes that we want to implement to contribute to food security and nutrition goals and ensure we contribute to the 1.5°C agenda,\" said FAO’s Chief Economist, Máximo Torero.', '2024-01-26', 'https://www.fao.org/new-york/news/news-detail/achieving-sdg-2-without-breaching-the-1.5--c-threshold--a-global-roadmap/en', 2),
(9, 'Leveraging Partnerships for Sustainable Agrifood Systems', 'news/6764ffe749396.jpg', 'The 2024 ECOSOC Partnership Forum, held on 30 January, included a dedicated SDG Action Segment for Goal 2, co-organized by the Food and Agriculture Organization of the United Nations (FAO), the UN Major Group for Science and Technology, and the UN Major Group for Children and Youth.', '2024-02-01', 'https://www.fao.org/sustainable-development-goals-helpdesk/transform/news-detail/leveraging-partnerships-for-sustainable-agrifood-systems--the-sdg-action-segment-for-goal-2-at-the-2024-ecosoc-partnership-forum/en', 2),
(10, 'Hadiah Ulang Tahun yang Ditunggu! Pemeriksaan Kesehatan Gratis dari Pemerintah!', 'news/6765009275953.webp', '\"Apa kabar teman-teman? Kalian sudah gak sabar mendapatkan hadiah ulang tahun pertama dari pemerintah berupa pemeriksaan kesehatan gratis?\"', '2024-11-24', 'https://www.merahputih.com/post/read/alodokter-menuju-indonesia-sehat-2045-siap-edukasi-masyarakat-pentingnya-program-skrining-kesehatan', 3),
(11, 'Alodokter menuju Indonesia sehat 2045', 'news/676500f1cf8d0.jpg', 'Platform telemedicine Alodokter berkomitmen untuk terus menyediakan layanan kesehatan demi menuju Indonesia Sehat 2045. Berbagai fitur nan hadir di aplikasi Alodokter siap untuk mewujudkan hal tersebut.', '2024-11-25', 'https://www.nature.com/articles/s41893-023-01107-7', 3),
(12, 'Tiga Area Prioritas Kesehatan yang Ditekankan Presiden Prabowo', 'news/67650138e6eac.jpg', 'Menteri Kesehatan (Menkes) RI Budi Gunadi Sadikin, sebagai inspektur upacara, dalam amanatnya, mengatakan bahwa tentang kesehatan telah menjadi program prioritas dalam pemerintahan Kabinet Merah Putih.', '2024-11-12', 'https://www.kemkes.go.id/id/tiga-area-prioritas-kesehatan-yang-ditekankan-presiden-prabowo', 3),
(13, 'Dunia apresiasi transformasi pendidikan Indonesia dalam GSVI  2024', 'news/676501c222984.webp', 'Kegiatan ini mempertemukan Indonesia dengan 56 peserta dari 20 negara dan sembilan organisasi internasional, dengan mengusung tema \"Lebih dari Intervensi Teknologi: Menavigasi Transformasi Pendidikan Indonesia\".', '2024-10-01', 'https://www.antaranews.com/berita/4368235/dunia-apresiasi-transformasi-pendidikan-indonesia-dalam-gsvi-2024', 4),
(14, 'Hibah Buku Bahan Bacaan Bermutu Diharapkan Tingkatkan Literasi di Sekolah', 'news/6765021b7d3f1.webp', 'Badan Pengembangan dan Pembinaan Bahasa telah melakukan pencetakan dan pengiriman buku pengayaan pendukung Gerakan Literasi Nasional (GLN) dalam rangka meningkatkan minat baca siswa agar kecakapan literasi dan numerasi siswa meningkat.', '2024-11-15', 'https://suarantb.com/2024/11/15/hibah-buku-bahan-bacaan-bermutu-diharapkan-tingkatkan-literasi-di-sekolah/', 4),
(15, 'Jabar Dorong Pendidikan Inklusif dan Berkarakter untuk Indonesia Emas 2045', 'news/67650296743cf.jpg', '\"Kita bicara pendidikan inklusif menuju Indonesia Maju 2045. Kita bicara pendidikan dari perspektif karakter, dari perspektif sistem, dan lain sebagainya,\" ujar Herman Suryatman, ditemui usai kegiatan.', '2024-09-13', 'https://jabarprov.go.id/berita/jabar-dorong-pendidikan-inklusif-dan-berkarakter-untuk-indonesia-emas-2045-15348', 4),
(16, 'Ring the Bell for Gender Equality 2024', 'news/67650b659e2a2.webp', 'Bursa Efek Indonesia Indonesia (BEI) bersama dengan UN Women, IFC, IGCN, and IBCWE, menyelenggarakan pembunyian bel untuk kesetaraan gender untuk meningkatkan perhatian tentang peran sektor swasta dalam mendorong pencapaian kesetaraan gender untuk kelima kalinya.', '2024-03-14', 'https://www.idx.co.id/id/berita/berita/59407318-c6f0-ee11-b808-005056aec3a4', 5),
(17, 'Kementerian PPPA: Perlu kolaborasi K/L tingkatkan pemahaman isu gender', 'news/67650bd8771f1.webp', 'Kementerian Pemberdayaan Perempuan dan Perlindungan Anak (PPPA) menilai diperlukan penguatan koordinasi dan kolaborasi antara Kementerian/Lembaga (K/L) serta pemangku kepentingan lainnya dalam meningkatkan pemahaman mengenai isu kesetaraan gender di Indonesia.', '2024-07-22', 'https://www.antaranews.com/berita/4209120/kementerian-pppa-perlu-kolaborasi-k-l-tingkatkan-pemahaman-isu-gender', 5),
(18, 'Perjuangkan Kesetaraan Gender, Perempuan Diminta Melakukan Ini', 'news/67650c24ce123.jpeg', 'Isu kesetaraan gender mesti menjadi gerakan nasional seluruh perempuan Indonesia. Dorongan terhadap isu tersebut mesti dikedepankan, karena relevan di tengah dominasi laki-laki di dunia industri.', '2024-08-29', 'https://www.medcom.id/nasional/peristiwa/yNLBqG6k-perjuangkan-kesetaraan-gender-perempuan-diminta-melakukan-ini', 5),
(19, 'Bantuan air bersih ke Pulau Gili Ketapang terus mengalir', 'news/67650d6b9ded8.webp', 'Bantuan air bersih untuk masyarakat yang mengalami krisis air akibat putusanya pipa PDAM di bawah laut di Pulau Gili Ketapang, Kabupaten Probolinggo, Jawa Timur, terus mengalir.', '2024-12-05', 'https://www.antaranews.com/berita/4515065/bantuan-air-bersih-ke-pulau-gili-ketapang-terus-mengalir', 6),
(20, 'Distribusi Air Bersih Terganggu, PDAM Sinjai Siapkan Layanan Mobil Tangki', 'news/67650ee8ea81e.jpg', 'Kami menyarankan kepada pelanggan yang terdampak agar menghubungi kami untuk kita siap antarkan air dan itu gratis,\" kata Direktur PDAM Sinjai, Nasrullah Mustamin.', '2024-12-05', 'https://makassar.tribunnews.com/2024/12/05/distribusi-air-bersih-terganggu-pdam-sinjai-siapkan-layanan-mobil-tangki', 6),
(21, 'DPRD DKI: Pentingnya Pelayanan Terbaik Air Bersih di Jakarta', 'news/676511d37affb.jpg', 'Anggota Komisi C DPRD DKI Jakarta, Nasdiyanto, mendorong Perumda Air Minum Jaya (PAM Jaya) untuk aktif mensosialisasikan proyek galian jalan yang bertujuan untuk pemeliharaan jaringan pipa.', '2024-12-03', 'https://tirto.id/dprd-dki-pentingnya-pelayanan-terbaik-air-bersih-di-jakarta-g6pM', 6),
(22, 'ITS Bangun Proyek REIDI, Living Laboratory Terbesar di Indonesia', 'news/67651269b0779.jpg', 'Proyek REIDI sendiri merupakan salah satu bagian dari program besar INSPIRASI, kerja sama antara ITS dengan Nanyang Technological University (NTU) Singapura dan beberapa universitas lain di Indonesia dalam pembangunan living laboratory renewable energy atau laboratorium demonstrator pertama di Indonesia.', '2024-06-06', 'https://www.its.ac.id/news/2024/06/06/its-bangun-proyek-reidi-living-laboratory-terbesar-di-indonesia/', 7),
(23, 'Kolaborasi Teknik Perminyakan ITB dan Pertamina New and Renewable Energy untuk Mencetak Team Leader Hebat di Bidang Energi', 'news/67651450c1128.jpg', 'peserta dikenalkan kepada selebritis yang berkomitmen pada sustainability dan lingkungan. Salah satunya kolaborasi band Coldplay dengan program One Tree Planted yang hasil penjualan tiket konsernya digunakan untuk penanaman pohon, menunjukkan bagaimana industri hiburan dapat berperan dalam pelestarian lingkungan.', '2024-09-11', 'https://itb.ac.id/berita/kolaborasi-teknik-perminyakan-itb-dan-pertamina-new-and-renewable-energy-untuk-mencetak-team-leader-hebat-di-bidang-energi/61326', 7),
(24, 'Mantap! WSP Terapkan Jalan Tol Berbasis Renewable Energy', 'news/676514d1adc8c.jpeg', 'Kehadiran SPKLU ini semakin memperkuat komitmen WSP dalam mendukung pengurangan emisi karbon dan membangun ekosistem bisnis yang ramah lingkungan. WSP juga tengah melakukan migrasi seluruh armada kendaraan operasional, seperti kendaraan patroli, ambulans, dan derek, menjadi kendaraan listrik.', '2024-12-05', 'https://www.cnbcindonesia.com/news/20241205150240-4-593690/mantap-wsp-terapkan-jalan-tol-berbasis-renewable-energy', 7),
(25, 'Indonesia Didukung Wujudkan Program Pekerjaan Layak Nasional', 'news/6765153d976f6.jpeg', 'Dukungan dan kemitraan antara Indonesia dan ILO di bidang ketenagakerjaan akan semakin baik. Kami berharap kerja sama ini dapat berlanjut dan terus berkembang ke depan,\" kata Kepala Biro Kerja Sama Kemnaker, Muhammad Arif Hidayat di Jenewa, Swiss', '2024-11-04', 'https://www.rri.co.id/internasional/430255/indonesia-didukung-wujudkan-program-pekerjaan-layak-nasional', 8),
(26, 'Skills for SDG 8: Achieving decent work and economic growth', 'news/6765158494d7e.jpg', 'Experts from ILO, UNEP, the African Center for Economic Transformation, and ClimateView share insights into what aspiring professionals should keep in mind in the pursuit of SDG 8.', '2024-05-03', 'https://www.devex.com/news/skills-for-sdg-8-achieving-decent-work-and-economic-growth-107306', 8),
(27, 'Navigating the Path to Decent Work and Reducing Youth Unemployment', 'news/676515dcd7505.jpg', 'According to the International Labour Organization (ILO), global youth unemployment was 13% in 2023, with many young people facing limited prospects for stable and decent work. On the flip side, the World Economic Forum (WEF) found that 44% of businesses report difficulties in finding talent with the right skills to fill jobs.', '2024-09-26', 'https://news.sap.com/2024/09/navigating-decent-work-reducing-youth-unemployment/', 8),
(28, 'UN Report: Morocco on Rise in Industry and Innovation', 'news/67651681e605f.jpeg', 'Compiled by the Sustainable Development Solutions Network and the Bertelsmann Foundation, and released last week, the report identifies Morocco as a frontrunner in Africa when it comes to achieving SDG 9.', '2024-07-04', 'https://www.moroccoworldnews.com/2024/07/363662/un-report-morocco-on-rise-in-industry-and-innovation', 9),
(29, 'Pakistan: Accelerating green industrialization amid climate and economic shocks', 'news/676516d850a91.jpg', 'Facing severe climate and economic challenges, Pakistan urgently needs investment and policy support to pursue green industrialization and bolster its economy while enhancing climate resilience. With a per capita income of $1,596, the South Asian nation hovers between the World Bank\'s low and lower-middle income categories.', '2023-12-19', 'https://unctad.org/news/pakistan-accelerating-green-industrialization-amid-climate-and-economic-shocks', 9),
(30, 'Cutting Carbon, Growing Savings: How UNIDO is Helping Indonesia’s Fertilizer Industry Slash Emissions', 'news/6765172691bcf.jpg', 'The United Nations Industrial Development Organization (UNIDO) is joining forces with the Indonesian Government and the fertilizer industry to lower the sector’s greenhouse gas emissions and help Indonesia meet its climate commitments.', '2024-12-03', 'https://indonesia.un.org/en/284965-cutting-carbon-growing-savings-how-unido-helping-indonesia%E2%80%99s-fertilizer-industry-slash', 9),
(31, 'A call to action to save SDG10: reduce inequalities', 'news/676517abc7890.png', 'During the COVID-19 pandemic and global inflation crisis, inequality of income, wealth and health outcomes rose sharply. Without seriously tackling inequality, we will not end AIDS by 2030 (SDG 3.3), and the SDGs on poverty, gender and education will be strongly compromised.', '2023-07-18', 'https://www.unaids.org/en/resources/presscentre/pressreleaseandstatementarchive/2023/july/20230717_save-SDG10-reduce-inequalities', 10),
(32, 'SDG 10: Reduce inequality within and among countries', 'news/6765180d7a0d2.webp', 'Inequalities remain persistently stark in the world today. From 1988 and 2008, the wealthiest 5 per cent of people captured 44 per cent of global income, while little changed for the poorest. In developing countries, income inequality rose by 11 per cent between 1990 and 2010.', '2023-07-24', 'https://eca.unwomen.org/en/news/in-focus/women-and-the-sdgs/sdg-10-reduced-inequalities-0', 10),
(33, '2023 in Nine Charts: A Growing Inequality', 'news/67651898e0500.webp', 'If 2022 was a year of uncertainty, 2023 is the year of inequality. For countries hoping to bounce back from the devastating losses of the COVID-19 pandemic, the battle has been made tougher by the compounding threats of climate change, fragility, conflict and violence, or food insecurity, to name a few—that make it difficult for economies across the board to fully recover.', '2023-12-18', 'https://www.worldbank.org/en/news/feature/2023/12/18/2023-in-nine-charts-a-growing-inequality', 10),
(34, 'Pengembangan dan Teknologi Smart City', 'news/676519160775d.png', 'Konsep kota cerdas atau smart city telah menjadi konsep pembangunan kota yang digunakan oleh banyak kota di dunia. Di Indonesia, smart city kembali mendapat perhatian luas ketika pemerintah memaparkan rencana pembangunan Ibu Kota Nusantara sebagai kota pintar.', '2024-11-22', 'https://kompaspedia.kompas.id/baca/paparan-topik/pengembangan-dan-teknologi-smart-city', 11),
(35, 'Remodel Bangunan Pondok Asshodiqiyah Menuju Sustainable Cities and Communities', 'news/676519d1040d6.jpg', 'Raffa Mulia Maulana, mahasiswa Teknik Sipil Universitas Diponegoro, berhasil mendiseminasikan output perancangan terintegrasi pembangunan bangunan hijau di Pondok Pesantren Asshodiqiyah', '2024-11-28', 'https://www.netralnews.com/remodel-bangunan-pondok-asshodiqiyah-menuju-sustainable-cities-and-communities/ZTZSSkFTaU92Y2pNZGVHUWZwK3dqUT09', 11),
(36, 'BLUETTI dan UN-Habitat Berkolaborasi Mempromosikan Energi Bersih dan Pembangunan Berkelanjutan di Afrika', 'news/676582ae16aaf.webp', 'BLUETTI, pemimpin pasar solusi penyimpanan energi bersih dunia, telah menjadi mitra strategis United Nations Human Settlements Programme (UN-Habitat) di 12th World Urban Forum (WUF12) yang berlangsung di Kairo pada 4-8 November', '2024-11-11', 'https://www.antaranews.com/berita/4457105/bluetti-dan-un-habitat-berkolaborasi-mempromosikan-energi-bersih-dan-pembangunan-berkelanjutan-di-afrika', 11),
(37, 'Program Green Development, Ridwan Kamil Gandeng WWF Indonesia', 'news/67658387b718d.jpg', 'Gubernur Jawa Barat Ridwan Kamil menandatangani naskah kerja sama dengan organisasi lingkungan hidup, WWF Indonesia untuk pembangunan hijau.', '2019-09-07', 'https://www.tempo.co/ekonomi/program-green-development-ridwan-kamil-gandeng-wwf-indonesia-709524', 12),
(38, 'Fikom Untar Student Event Invites People to Build Responsible Consumption Behavior', 'news/676583e1a9556.jpg', 'Coinciding with World Environment Day, students of the Faculty of Communication Sciences (Fikom) Untar held an ADEM event “Ada Demi Alam, Ada demi Bumi” at Kolabora Hayam Wuruk Plaza, West Jakarta on Wednesday (5/6) as part of the Communication Week (Commweek) series', '2024-06-05', 'https://untar.ac.id/en/2024/06/05/fikom-untar-student-event-invites-people-to-build-responsible-consumption-behavior/', 12),
(39, 'Goyal calls for promoting sustainable consumption to cut carbon footprint', 'news/6765849c68bb0.avif', 'Commerce and Industry Minister Piyush Goyal on Monday called for promoting sustainable consumption patterns to cut carbon footprint and resolve issues of environment.', '2024-12-02', 'https://www.business-standard.com/economy/news/goyal-calls-for-promoting-sustainable-consumption-to-cut-carbon-footprint-124120200786_1.html', 12),
(40, 'Vietnam and GGGI launch plan for green growth and climate action', 'news/67658516cde00.jpg', 'The strategic framework is set to fortify Vietnam-GGGI collaboration over the next five years, driving support for Vietnam’s green growth ambitions and climate actions, including achieving the net-zero 2050 target.', '2024-12-08', 'https://vir.com.vn/vietnam-and-gggi-launch-plan-for-green-growth-and-climate-action-119289.html', 13),
(41, 'Brawijaya Univ. develops data system for climate change monitoring', 'news/6765858f7f362.webp', 'Brawijaya University collaborated with several internationalv institutions to develop the Magnetic Data Acquisition System (MAGDAS) to monitor climate change globally and mitigate disasters in the future.', '2024-12-07', 'https://jatim.antaranews.com/berita/856243/brawijaya-univ-develops-data-system-for-climate-change-monitoring', 13),
(42, 'International Geneva has adopted its Climate Action Plan', 'news/676586865aaed.jpg', 'At the initiative of 2050Today, the Geneva Climate Action Forum, nearly 40 players in international Geneva have pledged to reduce their greenhouse gas emissions by an average of one third by 2030', '2024-12-05', 'https://wmo.int/media/update/international-geneva-has-adopted-its-climate-action-plan', 13),
(43, 'THAI TEEN TAKES MARINE CONSERVATION FIGHT TO COP29', 'news/676586e348baf.jpg', 'A Thai high school student brought her innovative solution to marine pollution to the global stage at COP29, presenting a circular economy project that transforms destructive ghost fishing nets into sustainable materials.', '2024-11-25', 'https://www.khaosodenglish.com/sustain/2024/11/25/thai-teen-takes-marine-conservation-fight-to-cop29/', 14),
(44, 'Blue Manifesto: The Roadmap to a healthy ocean in 2030', 'news/676587304a2f4.webp', 'Europe\'s seas are at a tipping point. Here\'s our step-by-step science-based roadmap to guide the EU in restoring marine life by ending overexploitation, destructive practices, and pollution.', '2024-10-01', 'https://www.birdlife.org/news/2024/10/01/blue-manifesto-the-roadmap-to-a-healthy-ocean-in-2030/', 14),
(45, 'Here\'s how to mobilize for Sustainable Development Goal 14 ahead of UN Ocean Conference 2025', 'news/676587821eef3.jpg', 'When humans arrived at the moon on NASA\'s Voyager 1, a famous photo image was captured of our planet Earth, the planet scientist Carl Sagan memorably called the \"pale blue dot.\"', '2024-10-21', 'https://www.weforum.org/stories/2024/10/sustainable-development-goal-14-un-ocean-conference-2025/', 14),
(46, 'South Sorong\'s forest conservation: A global legacy', 'news/6765880196f19.webp', 'Forests on Papua Island have become an inseparable part of the indigenous peoples\' lives, serving as a source of food and an integral part of their identity. This reality is well understood by the customary law community living in Konda Sub-District, South Sorong District, Southwest Papua.', '2024-10-26', 'https://en.antaranews.com/news/331421/south-sorongs-forest-conservation-a-global-legacy', 15),
(47, 'Educating Indonesian youth for peatland conservation', 'news/67658845ed601.webp', 'In schoolyards across West Kalimantan and South Sumatra, Indonesia, junior high students are heard discussing the cucumbers they planted, the tomatoes they harvested, and the pineapple jam they just made. All of it is spurred by a newly acquired knowledge of how to sustainably manage one of the planet’s most extraordinary yet unappreciated ecosystems.', '2024-10-20', 'https://forestsnews.cifor.org/89854/educating-indonesian-youth-for-peatland-conservation?fnl=', 15),
(48, 'Indonesia steps up Sumatran tiger conservation', 'news/676588ba3af13.webp', 'Indonesia is intensifying efforts to protect Sumatran tigers through community engagement and conservation partnerships. During the Global Tiger Day 2024 event in Jakarta on Sunday, Ismanto, head of Bukit Barisan Selatan National Park (TNBBS), highlighted the park’s collaboration with partners to safeguard Sumatran tigers', '2024-07-28', 'https://en.antaranews.com/news/320231/indonesia-steps-up-sumatran-tiger-conservation', 15),
(49, 'Accelerating Progress to Achieve Justice for Children', 'news/6765891f38971.png', 'On July 10, 2024, in New York, Delphine Schantz, UNODC Representative, attended the High-Level Political Forum 2024 Official Side Event titled \"SDG16: Accelerating Progress to Achieve Justice for Children - Leveraging Insights to Close the Justice Gap.\" In her address, Schantz highlighted pivotal moments and initiatives by the UNODC and the END VAC team to expedite achieving Justice for Children.', '2024-07-16', 'https://www.unodc.org/unodc/en/justice-and-prison-reform/endvac/un-high-level-political-forum-2024---sdg16_-accelerating-progress-to-achieve-justice-for-children.html?testme', 16),
(50, 'SDG 16 as an enabler of the 2030 Agenda', 'news/676589a2bb099.jpg', 'SDG 16 focuses on promoting peaceful and inclusive societies for sustainable development, providing access to justice for all, and building effective, accountable, and inclusive institutions at all levels.', '2024-07-23', 'https://www.idea.int/news/sdg-16-enabler-2030-agenda', 16),
(51, 'Turning the Tide: Scaling SDG 16 for the Future, Reinforcing Access to Justice, and Advancing Democracy', 'news/676589dddd9b3.png', 'This High-Level Political Forum event will demonstrate the United States’ strategic support for United Nations Sustainable Development Goal 16', '2024-07-16', 'https://www.idea.int/events/turning-tide-scaling-sdg-16-future-reinforcing-access-justice-and-advancing-democracy', 16),
(52, 'UNV Offer of Support to the Ukraine Crisis', 'news/67658a33bc1a4.jpg', 'Since the escalation of the war in February 2022, volunteers, war-affected communities, civil society organizations, and Ukrainian and international humanitarian workers have joined hands to support millions of people whose lives have been devastated by the ongoing war in Ukraine.', '2024-05-02', 'https://www.unv.org/unv-offer-support-ukraine-crisis', 17),
(53, 'Vodafone and WWF announce global partnership', 'news/67658a8ba73dc.avif', 'Vodafone and WWF today announced a major global partnership that will support Vodafone’s goals to reduce carbon emissions to ‘net zero’ by 2040, help to eliminate e-waste and encourage a more circular economy for mobile phones.', '2024-05-30', 'https://www.vodafone.com/news/protecting-the-planet/vodafone-wwf-announce-global-partnership', 17),
(54, 'Global partners cheer progress towards eliminating cervical cancer and underline challenges', 'news/67658acd8f7f7.jpg', 'World leaders, cervical cancer survivors, advocates, partners, and civil society are coming together today to mark the third Cervical Cancer Elimination Day of Action.', '2023-11-17', 'https://www.who.int/news/item/17-11-2023-global-partners-cheer-progress-towards-eliminating-cervical-cancer-and-underline-challenges', 17);

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`id`, `name`, `logo`, `url`) VALUES
(1, 'Oxfam', './organization/images.png', 'https://indonesia.oxfam.org/'),
(2, 'Concern', './organization/images (1).png', 'https://www.concern.net/'),
(3, 'UNDP Indonesia', './organization/images (2).png', 'https://www.undp.org/id/indonesia'),
(4, 'Habitat for Humanity', './organization/HabitatImage.jpeg', 'https://habitatindonesia.org/'),
(5, 'Terminate Hunger', './organization/images (3).png', 'https://terminatehunger.org'),
(6, 'Bread for the World', './organization/bread.png', 'https://www.bread.org/'),
(7, 'FAO', './organization/food-and-agriculture-organization.webp', 'https://www.fao.org/home/en'),
(8, 'Action Against Hunger', './organization/action.png', 'https://www.actionagainsthunger.org/'),
(9, 'HEP Indonesia', './organization/sdg3-HEP.png', 'https://www.instagram.com/hep.id/'),
(10, 'doctorSHARE', './organization/sdg3-doctorSHARE.png', 'https://www.doctorshare.org/relawan'),
(11, 'WHO Indonesia', './organization/sdg3-WHOid.jpg', 'https://www.who.int/indonesia'),
(12, 'Bali Children Foundation', './organization/sdg4-bali.jpg', 'https://www.balichildrenfoundation.org/'),
(13, 'Hoshizora Foundation', './organization/sdg4-hoshizora.webp', 'https://hoshizora.org/who-we-are/'),
(14, 'AIESEC', './organization/sdg4-aiesec.png', 'https://aiesec.or.id/globalvolunteer/'),
(15, 'AkBer', './organization/sdg4-akber.png', 'https://akademiberbagi.org/'),
(16, 'UN Women', './organization/sdg5-UNW.png', 'https://www.instagram.com/unwomenid/p/C_KgsS6N2r5/'),
(17, 'IBCWE', './organization/sdg5-ibcwe.png', 'https://ibcwe.id/id/home-id/'),
(18, 'recoftc-WAVES', './organization/sdg5-waves.jpeg', 'https://www.recoftc.org/vi/projects/WAVES'),
(19, 'WASH', './organization/sdg6-wash.webp', 'https://thewashfoundation.org/volunteer/'),
(20, 'Water.org', './organization/sdg6-water.jpg', 'https://water.org/'),
(21, 'UNICEF Indonesia', './organization/sdg6-unicef.png', 'https://www.unicef.org/indonesia/id/air-sanitasi-dan-kebersihan-wash'),
(22, 'METI', './organization/sdg7-METI.png', 'https://metiires.or.id/asosiasi/organisasi/'),
(23, 'Renewable Energy Indonesia', './organization/sdg7-REI.png', 'https://renewableenergy.id/changemakers/lsm-dan-asosiasi/'),
(24, 'Society of Renewable Energy', './organization/sdg7-sre.png', 'https://www.sre.co.id/'),
(25, 'INAGA', './organization/sdg7-INAGA.png', 'https://www.inaga-api.or.id/'),
(26, 'International Labour Indonesia', './organization/sdg8-ilo.png', 'https://www.ilo.org/'),
(27, 'Indonesia Mengglobal', './organization/sdg8-im.png', 'https://www.indonesiamengglobal.com/'),
(28, 'PwC', './organization/sdg9-pwc.png', 'https://www.pwc.com/id/en.html'),
(29, 'UNIDO', './organization/sdg9-unido.png', 'https://www.unido.org/'),
(30, 'International Telecommunication Union', './organization/sdg9-itu.png', 'https://www.itu.int/en/action/youth/Pages/Default.aspx'),
(31, 'GI Hub', './organization/sdg9-gihub.png', 'https://www.gihub.org/'),
(32, 'Inequality.org', './organization/sdg10-inequality.jpg', 'https://inequality.org/'),
(33, 'ActionAid', './organization/sdg10-actionaid.png', 'https://actionaid.org/'),
(34, 'ICLEI', './organization/sdg11-iclei.png', 'https://iclei.org/?gad_source=1&gclid=Cj0KCQiApNW6BhD5ARIsACmEbkV2Y-lFM0Q5amnp5CrpKD4zVkzYFSLKj1i0shd7JxVLdTcXFOyku-caAvUfEALw_wcB'),
(35, 'GEF', './organization/sdg11-gef.jpg', 'https://www.thegef.org/'),
(36, 'World Bank', './organization/sdg11-worldbank.png', 'https://www.worldbank.org/ext/en/home'),
(37, 'UNEP', './organization/sdg12-unep.png', 'https://www.unep.org/topics/sustainable-development-goals/why-do-sustainable-development-goals-matter/goal-12-9'),
(38, 'WRI', './organization/sdg12-wri.png', 'https://www.wri.org/'),
(39, 'WWF Indonesia', './organization/sdg12-wwf.png', 'https://www.wwf.id/id'),
(40, 'Mercy Corps', './organization/sdg13-mercy.png', 'https://www.mercycorps.or.id/'),
(41, 'Bintari', './organization/sdg13-bintari.webp', 'https://bintari.or.id/en/'),
(42, 'Reef Check Indonesia', './organization/sdg14-rci.png', 'https://reefcheck.or.id/'),
(43, 'CTI', './organization/sdg14-cti.png', 'https://www.coraltriangleinitiative.org/country/indonesia'),
(44, 'IUCN', './organization/sdg15-iucn.png', 'https://iucn.org/'),
(45, 'GGGI', './organization/sdg15-gggi.png', 'https://gggi.org/country/indonesia/'),
(46, 'FSC', './organization/sdg15-fsc.svg', 'https://www.id.fsc.org/id-id'),
(47, 'IDLO', './organization/sdg16-idlo.avif', 'https://www.idlo.int/'),
(48, 'A4ID', './organization/sdg16-a4id.png', 'https://www.a4id.org/'),
(49, 'OECD', './organization/sdg17-oecd.png', 'https://www.oecd.org/en.html'),
(50, 'IGCN', './organization/sdg17-igcn.webp', 'https://indonesiagcn.org/'),
(52, 'Sustainify', 'organization/67658cb6f1457.png', 'http://localhost/Sustainify/index.php');

-- --------------------------------------------------------

--
-- Table structure for table `sdg`
--

CREATE TABLE `sdg` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sdg`
--

INSERT INTO `sdg` (`id`, `name`, `image`, `description`) VALUES
(1, 'No Poverty', './assets/E-WEB-Goal-01.png', 'Global efforts to eradicate extreme poverty have faced significant setbacks by the COVID-19 pandemic and a series of major shocks during 2020-22. The pandemic caused extreme poverty to increase in 2020 for the first time in decades, reversing global progress by three years. Recovery has been uneven, with low-income countries lagging behind. With the ongoing poly-crisis, ending poverty by 2030 appears increasingly out of reach, particularly in regions that lack the fiscal capacity to cope with economic stresses.'),
(2, 'Zero Hunger', './assets/E-WEB-Goal-02.png', 'Globally, hunger persists with nearly 1 in 10 of the world\'s population facing it in 2022, while 2.4 billion people experienced moderate to severe food insecurity. In the same year, nearly 60% of countries worldwide saw significant increases in food prices due to conflicts and disrupted supply chains. Achieving zero hunger requires intensified efforts to transform food systems towards sustainability, resilience, and equity. Furthermore, accelerating improvements in diets, nutrition, health, and hygiene is crucial to meeting the SDG target of halving the number of children suffering from chronic undernutrition.'),
(3, 'Good Health and Well Being', './assets/E-WEB-Goal-03.png', 'Globally, ensuring health and well-being for all remains a pressing challenge, with millions lacking access to essential healthcare services and experiencing preventable illnesses. In 2022, over 1 billion people were unable to afford basic health services, and health systems in over 70 countries faced critical shortages of healthcare professionals. Achieving good health and well-being requires strengthening universal health coverage, enhancing the availability and affordability of medicines and vaccines, and addressing social determinants of health, including education, housing, and environmental factors.'),
(4, 'Quality Education', './assets/E-WEB-Goal-04.png', 'Globally, achieving inclusive and equitable quality education remains a critical goal, as millions of children and youth lack access to learning opportunities. In 2022, nearly 244 million children and adolescents worldwide were out of school, and disparities in access to digital learning tools further widened educational inequality. Achieving quality education requires investments in teacher training, modern learning environments, and accessible technology, as well as addressing barriers such as poverty, gender inequality, and conflicts.'),
(5, 'Gender Equality', './assets/E-WEB-Goal-05.png', 'Globally, gender inequality persists, with women and girls facing systemic barriers in social, economic, and political spheres. As of 2023, women hold less than 30% of leadership positions worldwide, and nearly 20% of women aged 20–24 were married before the age of 18, limiting their opportunities for education and economic empowerment. Achieving gender equality requires eliminating discriminatory practices, ensuring access to education and healthcare, and empowering women through equitable economic and leadership opportunities. Moreover, addressing gender-based violence and providing legal frameworks for equal rights are critical steps towards sustainable development.'),
(6, 'Clean Water and Sanitation', './assets/E-WEB-Goal-06.png', 'Clean water and sanitation are fundamental to health, ecosystems, and sustainable development. However, billions still struggle with inadequate access. Over 2 billion people globally lack access to safe drinking water, and 3.6 billion live without safely managed sanitation systems, leading to severe health and environmental challenges. Water scarcity affects 40% of the global population, with climate change and pollution worsening the situation. Achieving this goal requires investing in sustainable water infrastructure, improving sanitation services, and protecting freshwater ecosystems to ensure clean water for all by 2030.'),
(7, 'Affordable and Clean Energy', './assets/E-WEB-Goal-07.png', 'Ensuring access to affordable, reliable, sustainable, and modern energy is vital for economic growth, environmental protection, and improving quality of life. Globally, 675 million people still lived without electricity in 2021, and nearly 2.3 billion relied on polluting fuels for cooking, resulting in health and environmental impacts. The transition to clean energy requires expanding renewable energy sources, improving energy efficiency, and ensuring equitable access to affordable energy technologies, particularly in developing regions. Achieving this goal is critical for addressing climate change and fostering sustainable development.'),
(8, 'Decent Work and Economic Growth', './assets/E-WEB-Goal-08.png', 'Promoting sustained economic growth and decent work opportunities is essential for reducing poverty and fostering equitable development. Globally, unemployment remains a persistent challenge, with over 200 million people unemployed in 2023, and millions more engaged in informal or precarious jobs. Achieving this goal requires fostering innovation, supporting small and medium-sized enterprises, ensuring fair labor practices, and addressing barriers to economic participation, especially for youth, women, and marginalized communities. Sustainable growth must balance economic progress with environmental preservation and social well-being.'),
(9, 'Industry, Innovation, and Infrastructure', './assets/E-WEB-Goal-09.png', 'Industrialization, innovation, and resilient infrastructure are vital for economic growth, job creation, and sustainable development. Globally, manufacturing value-added (MVA) per capita rose from $1,646 in 2015 to $1,875 in 2022, but least developed countries (LDCs) only reached $159, showing stark disparities in industrial growth. Mobile broadband now covers 95% of the global population, yet 18% of people in sub-Saharan Africa remain unconnected. Achieving this goal requires closing the digital divide, fostering sustainable practices, and increasing investments in infrastructure and technology to ensure equitable and inclusive progress​'),
(10, 'Reduced Inequalities', './assets/E-WEB-Goal-10.png', 'Reducing inequalities within and among countries is crucial for achieving inclusive and sustainable development. As of 2022, the income share of the richest 10% globally was 40%, while the bottom 50% only earned about 10%, highlighting the stark disparity in wealth distribution. In developing countries, inequality is rising, with more than 2 billion people experiencing social exclusion due to factors such as gender, ethnicity, and disabilities. Achieving this goal requires promoting policies that foster income equality, equitable access to resources, and inclusive social, economic, and political participation for all people.'),
(11, 'Sustainable Cities and Communities', './assets/E-WEB-Goal-11.png', 'Ensuring that cities and human settlements are inclusive, safe, resilient, and sustainable is key to promoting well-being for all. By 2022, more than 55% of the world’s population lived in urban areas, a number expected to increase to 68% by 2050, putting pressure on infrastructure and housing. Urban slums are home to more than 1 billion people globally, with a significant proportion lacking access to basic services like clean water, sanitation, and secure housing. Achieving this goal requires improving urban planning, expanding affordable housing, and investing in sustainable transport systems to create cities that are both inclusive and environmentally friendly'),
(12, 'Responsible Consumption and Production', './assets/E-WEB-Goal-12.png', 'Achieving sustainable consumption and production patterns is essential for reducing the ecological footprint and promoting environmental stewardship. Global resource use has more than tripled since 1970, with the world consuming an estimated 92.8 billion tons of materials in 2020, leading to unsustainable pressure on the planet\'s resources. Around 931 million tons of food are wasted annually, contributing to both food insecurity and environmental harm. Achieving this goal requires promoting sustainable production practices, reducing waste, increasing recycling rates, and fostering circular economy models to ensure that growth does not come at the expense of'),
(13, 'Climate Action', './assets/E-WEB-Goal-13.png', 'Addressing climate change and its impacts is critical to ensuring a sustainable future for all. Global CO2 emissions reached an all-time high in 2022, with energy-related emissions contributing significantly to climate change, highlighting the urgent need for reductions. Extreme weather events, such as floods, heatwaves, and droughts, have increased in frequency and intensity, affecting millions globally. Achieving this goal requires enhanced climate action through reducing greenhouse gas emissions, promoting renewable energy, and supporting vulnerable communities in adapting to climate change. Scaling up climate finance is essential for both mitigation and adaptation efforts, especially in developing nations'),
(14, 'Life Below Water', './assets/E-WEB-Goal-14.png', 'Protecting and conserving the oceans, seas, and marine resources is vital for sustaining life on Earth. Over 8 million tons of plastic enter the oceans every year, threatening marine life and ecosystems. Nearly 30% of the world’s fish stocks are overfished, and marine ecosystems are severely impacted by climate change, including coral bleaching and ocean acidification. Achieving this goal requires reducing marine pollution, protecting marine biodiversity, and promoting sustainable fishing practices. Efforts must also focus on increasing marine protected areas and ensuring that oceans remain resilient in the face of climate impacts'),
(15, 'Life on Land', './assets/E-WEB-Goal-15.png', 'Protecting, restoring, and promoting the sustainable use of terrestrial ecosystems is vital for biodiversity and human well-being. Since 1990, the world has lost around 420 million hectares of forests, and land degradation affects over 3 billion people, threatening food security and increasing vulnerability to climate change. Over 1 million species are at risk of extinction due to habitat destruction, pollution, and overexploitation. Achieving this goal requires halting deforestation, restoring degraded ecosystems, and protecting biodiversity. Efforts must also focus on promoting sustainable land use and enhancing conservation initiatives to ensure that ecosystems can support both people and wildlife'),
(16, 'Peace, Justice and Strong institution', './assets/E-WEB-Goal-16.png', 'Promoting peaceful and inclusive societies, providing access to justice for all, and building effective, accountable institutions are critical for sustainable development. In 2022, nearly 1 in 4 people globally experienced some form of violence or criminal activity, and corruption continues to undermine social and economic progress in many regions. More than 2 billion people still lack access to justice, and political instability affects the growth of many nations. Achieving this goal requires strengthening the rule of law, promoting human rights, and ensuring transparency and accountability in public institutions. Efforts must also focus on empowering individuals and communities to participate in decision-making and conflict resolution'),
(17, 'Partnerships For The Goals', './assets/E-WEB-Goal-17.png', 'Strengthening the means of implementation and revitalizing global partnerships are essential for achieving all SDGs. As of 2023, international development financing has seen fluctuations, with developing countries facing challenges in securing necessary investments to meet SDG targets. Global trade, technological advancements, and finance flows continue to concentrate in high-income countries, leaving developing nations with limited access to resources. Achieving this goal requires fostering strong partnerships between governments, the private sector, and civil society. Enhanced cooperation, knowledge-sharing, and innovative financing models are key to achieving sustainable development and ensuring no one is left behind');

-- --------------------------------------------------------

--
-- Table structure for table `sdg_event`
--

CREATE TABLE `sdg_event` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `place` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `from_url` varchar(255) DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sdg_event`
--

INSERT INTO `sdg_event` (`id`, `title`, `time`, `place`, `image`, `from_url`, `organization_id`) VALUES
(11, 'Fun Run', '2025-01-01 06:30:00', 'UII', 'events/67658ce5c0b3b.webp', 'https://docs.google.com/forms/d/e/1FAIpQLScx75H9aUKNRX5qTNRGsri168CPCvss6qLrZv9O9-FURDyxIA/viewform?usp=sharing', 52),
(12, 'SDG Workshop', '2025-02-10 12:30:00', 'Tentrem Hotel', 'events/67658d8f4b9fb.webp', 'https://docs.google.com/forms/d/e/1FAIpQLScx75H9aUKNRX5qTNRGsri168CPCvss6qLrZv9O9-FURDyxIA/viewform?usp=sharing', 52),
(13, 'Charity for Marine Conservation', '2025-01-26 08:00:00', 'Parangtritis', 'events/67658ea66a3e3.webp', 'https://docs.google.com/forms/d/e/1FAIpQLScx75H9aUKNRX5qTNRGsri168CPCvss6qLrZv9O9-FURDyxIA/viewform?usp=sharing', 52);

-- --------------------------------------------------------

--
-- Table structure for table `sdg_organization`
--

CREATE TABLE `sdg_organization` (
  `sdg_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sdg_organization`
--

INSERT INTO `sdg_organization` (`sdg_id`, `organization_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 10),
(3, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(5, 14),
(5, 16),
(5, 17),
(5, 18),
(6, 19),
(6, 20),
(6, 21),
(7, 22),
(7, 23),
(7, 24),
(7, 25),
(8, 3),
(8, 26),
(8, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(10, 1),
(10, 32),
(10, 33),
(11, 34),
(11, 35),
(11, 36),
(12, 37),
(12, 38),
(12, 39),
(13, 37),
(13, 40),
(13, 41),
(14, 39),
(14, 42),
(14, 43),
(15, 44),
(15, 45),
(15, 46),
(16, 3),
(16, 47),
(16, 48),
(17, 37),
(17, 49),
(17, 50);

-- --------------------------------------------------------

--
-- Table structure for table `todo_list`
--

CREATE TABLE `todo_list` (
  `id` int(11) NOT NULL,
  `task` varchar(255) NOT NULL,
  `is_done` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sdg_id` (`sdg_id`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sdg`
--
ALTER TABLE `sdg`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sdg_event`
--
ALTER TABLE `sdg_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `sdg_organization`
--
ALTER TABLE `sdg_organization`
  ADD PRIMARY KEY (`sdg_id`,`organization_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `todo_list`
--
ALTER TABLE `todo_list`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `organization`
--
ALTER TABLE `organization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `sdg`
--
ALTER TABLE `sdg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sdg_event`
--
ALTER TABLE `sdg_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `todo_list`
--
ALTER TABLE `todo_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_ibfk_1` FOREIGN KEY (`sdg_id`) REFERENCES `sdg` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sdg_event`
--
ALTER TABLE `sdg_event`
  ADD CONSTRAINT `sdg_event_ibfk_1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sdg_organization`
--
ALTER TABLE `sdg_organization`
  ADD CONSTRAINT `sdg_organization_ibfk_1` FOREIGN KEY (`sdg_id`) REFERENCES `sdg` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sdg_organization_ibfk_2` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
