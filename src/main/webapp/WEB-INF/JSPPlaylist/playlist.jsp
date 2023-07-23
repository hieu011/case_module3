<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <meta name="description" content="">
    <meta name="author" content="">

    <title>Music App</title>

    <!-- CSS FILES -->
    <link rel="preconnect" href="https://fonts.googleapis.com">

    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400&family=Sono:wght@200;300;400;500;700&display=swap"
            rel="stylesheet">

    <link rel="stylesheet" href="css/bootstrap.min.css">

    <link rel="stylesheet" href="css/bootstrap-icons.css">

    <link rel="stylesheet" href="css/owl.carousel.min.css">

    <link rel="stylesheet" href="css/owl.theme.default.min.css">

    <link href="css/style.css" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <!--

TemplateMo 584 Pod Talk

https://templatemo.com/tm-584-pod-talk

-->
    <style>
        .icon {
            font-size: 2em; /* Thay đổi kích thước biểu tượng ở đây */
        }
        .wrap-icon{
            border-radius: 50%;
            width: 72px;
            height: 72px;
            line-height: 72px;
        }
    </style>
</head>

<body>

<main>

    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand me-lg-5 me-0" href="index.html">
                <img src="images/2-removebg-preview.png" class="logo-image img-fluid" alt="templatemo pod talk">
                <P class="logo-name">MUSIC HOUSE</P>
            </a>

            <form action="#" method="post" class="custom-form search-form flex-fill me-3" role="search">
                <div class="input-group input-group-lg">
                    <input name="search" type="search" class="form-control" id="search" placeholder="Search Song"
                           aria-label="Search">

                    <button type="submit" class="form-control" id="submit-search">
                        <i class="bi-search"></i>
                    </button>
                </div>
            </form>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-lg-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/home">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="/playlist">Playlist</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link" href="#">Music Chart</a>
                    </li>
                </ul>

                <div class="ms-4">
                    <button type="button" class="btn custom-btn" >hieu</button>
                </div>

                <div class="ms-4">
                    <a href="#section_3" class="btn custom-btn custom-border-btn smoothscroll">Login</a>
                </div>
            </div>
        </div>
    </nav>


    <section class="hero-section">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 col-12">
                    <div class="text-center mb-5 pb-2">
                        <h1 class="text-white">Your Playlist</h1>

                        <p class="text-white">Explore your favorite songs</p>

                        <a href="#section_2" class="btn custom-btn smoothscroll mt-3">Create Playlist</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="trending-podcast-section section-padding">
        <div class="container">
            <div class="row">

                <div class="col-lg-12 col-12">
                    <div class="section-title-wrap mb-5">
                        <h4 class="section-title">Playlists</h4>
                    </div>
                </div>
                <c:forEach items="${playlists}" var="playlist">
                    <div class="col-lg-4 col-12 mb-4 mb-lg-0">
                        <div class="custom-block custom-block-full">
                            <div class="custom-block-image-wrap">
                                <a href="detail-page.html">
                                    <img src="/assets/playlish.jpg" class="custom-block-image img-fluid"
                                         alt="">
                                </a>
                            </div>

                            <div class="custom-block-info">
                                <h5 class="mb-2">
                                    <a href="detail-page.html">
                                            ${playlist.getName()}
                                    </a>
                                </h5>

                                <div class="custom-block-bottom d-flex justify-content-between mt-3">
                                    <a href="javascript:void(0)" class="bi-headphones me-1">
                                        <span>100k</span>
                                    </a>
                                </div>

                                <a href="javascript:void(0)" class="custom-block-icon wrap-icon" onclick="clickToPlayMusic(2)">
                                    <i class="bi-play-fill icon"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>
    </section>

    <section class="music-control">
        <div class="wrapper">
            <div class="col l-3">
                <div class="music-control__left">
                    <div class="music-control__left-img-box">
                        <div class="img-area">
                            <img src="" alt="">
                        </div>
                    </div>
                    <div class="song-details">
                        <span class="name">hieu</span>
                        <br>
                        <span class="artist">hieu</span>
                    </div>
                </div>
            </div>

            <div class="col l-6">
                <div class="music-control-center">
                    <div class="music-control-icon">
                        <div class="controls">
                            <i id="repeat-plist" class="material-icons" title="Playlist looped">repeat</i>
                            <i id="prev" class="material-icons">skip_previous</i>
                            <div class="play-pause">
                                <i class="material-icons play">play_arrow</i>
                            </div>
                            <i id="next" class="material-icons">skip_next</i>
                            <i id="more-music" class="material-icons">queue_music</i>
                        </div>
                    </div>
                    <div class="music-control__progress">
                        <div class="progress-area">
                            <div class="progress-bar">
                                <audio id="main-audio" src=""></audio>
                            </div>
                            <div class="song-timer">
                                <span class="current-time">0:00</span>
                                <span class="max-duration">0:00</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="music-list">
                <div class="header">
                    <div class="row">
                        <i class="list material-icons">queue_music</i>
                        <span>Music list</span>
                    </div>
                    <i id="close" class="material-icons">close</i>
                </div>
                <ul>
                </ul>
            </div>
        </div>
    </section>
</main>


<footer class="site-footer">
    <div class="container">
        <div class="row">

            <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                <div class="subscribe-form-wrap">
                    <h6>Subscribe. Every weekly.</h6>

                    <form class="custom-form subscribe-form" action="#" method="get" role="form">
                        <input type="email" name="subscribe-email" id="subscribe-email" pattern="[^ @]*@[^ @]*"
                               class="form-control" placeholder="Email Address" required="">

                        <div class="col-lg-12 col-12">
                            <button type="submit" class="form-control" id="submit-sub">Subscribe</button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- <div class="col-lg-3 col-md-6 col-12 mb-4 mb-md-0 mb-lg-0">
                    <h6 class="site-footer-title mb-3">Contact</h6>

                    <p class="mb-2"><strong class="d-inline me-2">Phone:</strong> 010-020-0340</p>

                    <p>
                        <strong class="d-inline me-2">Email:</strong>
                        <a href="#">inquiry@pod.co</a>
                    </p>
                </div> -->

            <div class="col-lg-6 col-md-6 col-12">
                <h6 class="site-footer-title mb-3 text-center">Download Mobile</h6>

                <div class="site-footer-thumb mb-4 pb-2">
                    <div class="d-flex flex-wrap justify-content-center">
                        <a href="#">
                            <img src="images/app-store.png" class="me-3 mb-2 mb-lg-0 img-fluid" alt="">
                        </a>

                        <a href="#">
                            <img src="images/play-store.png" class="img-fluid" alt="">
                        </a>
                    </div>
                </div>

                <h6 class="site-footer-title mb-3 text-center">Social</h6>

                <ul class="social-icon align-items-center justify-content-center d-flex">
                    <li class="social-icon-item">
                        <a href="#" class="social-icon-link bi-instagram"></a>
                    </li>

                    <li class="social-icon-item">
                        <a href="#" class="social-icon-link bi-twitter"></a>
                    </li>

                    <li class="social-icon-item">
                        <a href="#" class="social-icon-link bi-whatsapp"></a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <div class="container pt-5">
        <div class="row align-items-center">

            <div class="col-lg-3 col-md-3 col-12">
                <a class="navbar-brand" href="index.html">
                    <img src="images/2-removebg-preview.png" class="logo-image img-fluid" alt="templatemo pod talk">
                    <P class="logo-name">MUSIC HOUSE</P>
                </a>
            </div>

            <div class="col-lg-6 col-md-8 col-12 d-flex justify-content-between">
                <ul class="site-footer-links">
                    <li class="site-footer-link-item">
                        <a href="#" class="site-footer-link">Homepage</a>
                    </li>

                    <li class="site-footer-link-item">
                        <a href="#" class="site-footer-link">Browse episodes</a>
                    </li>

                    <li class="site-footer-link-item">
                        <a href="#" class="site-footer-link">Help Center</a>
                    </li>

                    <li class="site-footer-link-item">
                        <a href="#" class="site-footer-link">Contact Us</a>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3 col-md-2">
                <a href="#" class="site-footer-link">Copyright © 2036</a>
            </div>
        </div>
    </div>
</footer>


<!-- JAVASCRIPT FILES -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/custom.js"></script>

</body>

</html>