
<%--
  Created by IntelliJ IDEA.
  User: LAPTOP
  Date: 7/17/2023
  Time: 9:14 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
    <c:if test="${user == null}">
        #btn-music-select{
          pointer-events: none;
        }
    </c:if>
  </style>
</head>

<body>

<main>

  <nav class="navbar navbar-expand-lg">
    <div class="container">
      <a class="navbar-brand me-lg-5 me-0" href="/home">
        <img src="images/2-removebg-preview.png" class="logo-image img-fluid" alt="templatemo pod talk">
        <P class="logo-name">MUSIC HOUSE</P>
      </a>

      <form action="#" method="get" class="custom-form search-form flex-fill me-3" role="search">
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
            <a class="nav-link active" href="/home">Home</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="/playlist">Playlist</a>
          </li>

          <li class="nav-item dropdown">
            <a class="nav-link" href="#">Music Chart</a>
          </li>
        </ul>
        <c:if test="${user != null}">
          <div class="ms-4">
            <c:set var="username" value="${user.getUsername().substring(0, 4)}"></c:set>
            <button type="button" class="btn custom-btn" id="userInfo">${username}</button>

          </div>

          <div class="ms-4">
            <a href="/home?action=logout" class="btn custom-btn custom-border-btn smoothscroll">Logout</a>
          </div>
        </c:if>

        <c:if test="${user == null}">
          <div class="ms-4">
            <a href="/login" class="btn custom-btn custom-border-btn smoothscroll">Login</a>
          </div>
        </c:if>
      </div>
    </div>
  </nav>


  <section class="hero-section">
    <div class="container">
      <div class="row">

        <div class="col-lg-12 col-12">
          <div class="text-center mb-5 pb-2">
            <h1 class="text-white">Listen to Music House</h1>

            <p class="text-white">Listen it everywhere. Explore your favorite songs.</p>

            <a href="#section_2" class="btn custom-btn smoothscroll mt-3">Start listening</a>
          </div>

          <div class="owl-carousel owl-theme ">
            <div class="owl-carousel-info-wrap item">
              <img src="assets/image-singer/SingerC-pop/GEM.jpg"
                   class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  GEM
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>

                <span class="badge">Author</span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-twitter"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-facebook"></a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="owl-carousel-info-wrap item">
              <img src="assets/image-singer/SingerK-pop/BlackPink.jpg"
                   class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  BlackPink
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>

                <span class="badge"></span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-twitter"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-facebook"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-pinterest"></a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="owl-carousel-info-wrap item">
              <img src="assets/image-singer/SingerUS-UK/Charlie Puth.PNG"
                   class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  Charile Puth
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>

                <span class="badge">Author</span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-twitter"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-facebook"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-pinterest"></a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="owl-carousel-info-wrap item">
              <img src="assets/image-singer/SingerUS-UK/Justin Bieber.jpg" class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  Justin Bieber
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>
                <span class="badge">Author</span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-instagram"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-youtube"></a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="owl-carousel-info-wrap item">
              <img src="/assets/image-singer/SingerV-pop/Min.png"
                   class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  Min
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-instagram"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-youtube"></a>
                  </li>
                </ul>
              </div>
            </div>

            <div class="owl-carousel-info-wrap item">
              <img src="assets/image-singer/SingerV-pop/Sơn Tùng MTP.jpg"
                   class="owl-carousel-image img-fluid" alt="">

              <div class="owl-carousel-info">
                <h4 class="mb-2">
                  Sơn Tùng MTP
                  <img src="images/verified.png" class="owl-carousel-verified-image img-fluid"
                       alt="">
                </h4>

                <span class="badge">Singer</span>
                <span class="badge">Author</span>
              </div>

              <div class="social-share">
                <ul class="social-icon">
                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-linkedin"></a>
                  </li>

                  <li class="social-icon-item">
                    <a href="#" class="social-icon-link bi-whatsapp"></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>


  <section class="latest-podcast-section section-padding pb-0" id="section_2">
    <div class="container">
      <div class="row justify-content-center">

        <div class="col-lg-12 col-12">
          <div class="section-title-wrap mb-5">
            <h4 class="section-title">Lastest songs</h4>
          </div>
        </div>

        <c:forEach items="${requestScope.songs}" var="song">

          <div class="col-lg-6 col-12 p-2">
            <div class="custom-block d-flex">
              <div class="">
                <div class="custom-block-icon-wrap">
                  <div class="section-overlay"></div>
                  <a href="detail-page.html" class="custom-block-image-wrap">
                    <img src="${song.getImage()}"
                         class="custom-block-image img-fluid" alt="">

                  </a><a href="javascript:void(0)" class="custom-block-icon" onclick="clickToPlayMusic(${song.id})">
                  <i class="bi-play-fill"></i>
                </a>
                </div>
              </div>

              <div class="custom-block-info">
                <div class="custom-block-top d-flex mb-1">
                  <small class="me-4">
                    <i class="bi-clock-fill custom-icon"></i>
                    ${song.getDuration()}
                  </small>
                </div>

                <h5 class="mb-2">
                  <a href="detail-page.html">
                    ${song.getName()}
                  </a>
                </h5>

                <div class="profile-block d-flex">
                  <img src="${song.getSinger().getImage_singer()}"
                       class="profile-block-image img-fluid" alt="">

                  <p>
                    ${song.getSinger().getName()}
                    <img src="images/verified.png" class="verified-image img-fluid" alt="">
                    <strong>Singer</strong>
                  </p>
                </div>

                <div class="custom-block-bottom d-flex justify-content-between mt-3">
                  <a href="#" class="bi-headphones me-1">
                    <span>120k</span>
                  </a>

                  <a href="#" class="bi-heart me-1">
                    <span>42.5k</span>
                  </a>

                  <a href="#" class="bi-chat me-1">
                    <span>11k</span>
                  </a>

                  <a href="#" class="bi-download">
                    <span>50k</span>
                  </a>
                </div>
              </div>
<%--              <c:set var="id${song.getId()}" value="${song.getId()}"></c:set>--%>
              <div class="d-flex flex-column ms-auto">
                <form action="/home?action=userLogin" method="post">
                <button type="submit" style="border: none;background-color: white;" id="btn-music-select">
                  <div class="badge ms-auto">
                    <i class="bi-bookmark"></i>
                    <input type="hidden" value="${song.getId()}" name="songselect">
                  </div>
                </button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>



        <!-- <div class="swiper-button-prev swiper-button-white"></div>
        <div class="swiper-button-next swiper-button-white"></div> -->

        <nav aria-label="Page navigation example" class="col-5">
          <ul class="pagination m-4 justify-content-center d-flex listPage">

          </ul>
        </nav>
      </div>
    </div>
  </section>


  <section class="topics-section section-padding pb-0" id="section_3">
    <div class="container">
      <div class="row">

        <div class="col-lg-12 col-12">
          <div class="section-title-wrap mb-5">
            <h4 class="section-title">Topics</h4>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-overlay">
            <a href="detail-page.html" class="custom-block-image-wrap">
              <img src="images/topics/v-pop.jpg"
                   class="custom-block-image img-fluid" alt="">
            </a>
            <div class="custom-block-info custom-block-overlay-info">
              <h5 class="mb-1">
                <a href="listing-page.html">
                  V-POP
                </a>
              </h5>
              <p class="badge mb-0">5 Songs</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-overlay">
            <a href="detail-page.html" class="custom-block-image-wrap">
              <img src="images/topics/us-uk.jpg"
                   class="custom-block-image img-fluid" alt="">
            </a>

            <div class="custom-block-info custom-block-overlay-info">
              <h5 class="mb-1">
                <a href="listing-page.html">
                  US-UK
                </a>
              </h5>

              <p class="badge mb-0">5 Songs</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-overlay">
            <a href="detail-page.html" class="custom-block-image-wrap">
              <img src="images/topics/k-pop.jpg"
                   class="custom-block-image img-fluid" alt="">
            </a>

            <div class="custom-block-info custom-block-overlay-info">
              <h5 class="mb-1">
                <a href="listing-page.html">
                  K-POP
                </a>
              </h5>

              <p class="badge mb-0">5 Songs</p>
            </div>
          </div>
        </div>

        <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-overlay">
            <a href="detail-page.html" class="custom-block-image-wrap">
              <img src="images/topics/c-pop.jpg"
                   class="custom-block-image img-fluid" alt="">
            </a>

            <div class="custom-block-info custom-block-overlay-info">
              <h5 class="mb-1">
                <a href="listing-page.html">
                  C-POP
                </a>
              </h5>

              <p class="badge mb-0">5 Songs</p>
            </div>
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
            <h4 class="section-title">Trending songs</h4>
          </div>
        </div>

        <div class="col-lg-4 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-full">
            <div class="custom-block-image-wrap">
              <a href="detail-page.html">
                <img src="images/podcast/27376480_7326766.jpg" class="custom-block-image img-fluid"
                     alt="">
              </a>
            </div>

            <div class="custom-block-info">
              <h5 class="mb-2">
                <a href="detail-page.html">
                  Vintage Show
                </a>
              </h5>

              <div class="profile-block d-flex">
                <img src="images/profile/woman-posing-black-dress-medium-shot.jpg"
                     class="profile-block-image img-fluid" alt="">

                <p>Elsa
                  <strong>Influencer</strong>
                </p>
              </div>

              <p class="mb-0">Lorem Ipsum dolor sit amet consectetur</p>

              <div class="custom-block-bottom d-flex justify-content-between mt-3">
                <a href="#" class="bi-headphones me-1">
                  <span>100k</span>
                </a>

                <a href="#" class="bi-heart me-1">
                  <span>2.5k</span>
                </a>

                <a href="#" class="bi-chat me-1">
                  <span>924k</span>
                </a>
              </div>
            </div>

            <div class="social-share d-flex flex-column ms-auto">
              <a href="#" class="badge ms-auto">
                <i class="bi-heart"></i>
              </a>

              <a href="#" class="badge ms-auto">
                <i class="bi-bookmark"></i>
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-12 mb-4 mb-lg-0">
          <div class="custom-block custom-block-full">
            <div class="custom-block-image-wrap">
              <a href="detail-page.html">
                <img src="images/podcast/27670664_7369753.jpg" class="custom-block-image img-fluid"
                     alt="">
              </a>
            </div>

            <div class="custom-block-info">
              <h5 class="mb-2">
                <a href="detail-page.html">
                  Vintage Show
                </a>
              </h5>

              <div class="profile-block d-flex">
                <img src="images/profile/cute-smiling-woman-outdoor-portrait.jpg"
                     class="profile-block-image img-fluid" alt="">

                <p>
                  Taylor
                  <img src="images/verified.png" class="verified-image img-fluid" alt="">
                  <strong>Creator</strong>
                </p>
              </div>

              <p class="mb-0">Lorem Ipsum dolor sit amet consectetur</p>

              <div class="custom-block-bottom d-flex justify-content-between mt-3">
                <a href="#" class="bi-headphones me-1">
                  <span>100k</span>
                </a>

                <a href="#" class="bi-heart me-1">
                  <span>2.5k</span>
                </a>

                <a href="#" class="bi-chat me-1">
                  <span>924k</span>
                </a>
              </div>
            </div>

            <div class="social-share d-flex flex-column ms-auto">
              <a href="#" class="badge ms-auto">
                <i class="bi-heart"></i>
              </a>

              <a href="#" class="badge ms-auto">
                <i class="bi-bookmark"></i>
              </a>
            </div>
          </div>
        </div>

        <div class="col-lg-4 col-12">
          <div class="custom-block custom-block-full">
            <div class="custom-block-image-wrap">
              <a href="detail-page.html">
                <img src="images/podcast/12577967_02.jpg" class="custom-block-image img-fluid"
                     alt="">
              </a>
            </div>

            <div class="custom-block-info">
              <h5 class="mb-2">
                <a href="detail-page.html">
                  Daily Talk
                </a>
              </h5>

              <div class="profile-block d-flex">
                <img src="images/profile/handsome-asian-man-listening-music-through-headphones.jpg"
                     class="profile-block-image img-fluid" alt="">

                <p>
                  William
                  <img src="images/verified.png" class="verified-image img-fluid" alt="">
                  <strong>Vlogger</strong>
                </p>
              </div>

              <p class="mb-0">Lorem Ipsum dolor sit amet consectetur</p>

              <div class="custom-block-bottom d-flex justify-content-between mt-3">
                <a href="#" class="bi-headphones me-1">
                  <span>100k</span>
                </a>

                <a href="#" class="bi-heart me-1">
                  <span>2.5k</span>
                </a>

                <a href="#" class="bi-chat me-1">
                  <span>924k</span>
                </a>
              </div>
            </div>

            <div class="social-share d-flex flex-column ms-auto">
              <a href="#" class="badge ms-auto">
                <i class="bi-heart"></i>
              </a>

              <a href="#" class="badge ms-auto">
                <i class="bi-bookmark"></i>
              </a>
            </div>
          </div>
        </div>

      </div>
    </div>
  </section>

  <section class="music-control">
    <div class="wrapper">
      <!-- <div class="top-bar">
          <i class="material-icons">expand_more</i>
          <span>Now Playing</span>
          <i class="material-icons">more_horiz</i>
      </div> -->
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
              <c:if test="${user != null}">
                <i id="more-music" class="material-icons">queue_music</i>
              </c:if>
              <c:if test="${user == null}">
                <i id="more-music non-click" class="material-icons" style="background-color: #adb5bd">queue_music</i>
              </c:if>
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
          <!-- here li list are coming from js -->
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
        <a class="navbar-brand" href="/home">
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
<c:set var="allMusic" value="[]" />
<c:forEach items="${requestScope.songs}" var="s">
  <c:set var="name" value="${s.getName()}" />
  <c:set var="author" value="${s.getSinger().getName()}" />
  <c:set var="img" value="${s.getImage()}" />
  <c:set var="src" value="${s.getSong()}" />

  <%-- Tạo object key-value mới trong JSTL --%>
  <%-- Sử dụng escapeXml() để tránh xử lý các ký tự đặc biệt --%>
  <c:set var="newMusicObject" value='{"name": "${fn:escapeXml(name)}", "author": "${fn:escapeXml(author)}", "img": "${fn:escapeXml(img)}", "src": "${fn:escapeXml(src)}"}' />

  <%-- Lấy giá trị hiện tại của mảng allMusic và thêm object mới vào mảng --%>
  <%-- Sử dụng escapeXml() để tránh xử lý các ký tự đặc biệt --%>
  <c:set var="escapedAllMusic" value="${fn:escapeXml(allMusic)}" />
  <%-- Thêm object mới vào mảng --%>
  <c:set var="allMusic" value="${escapedAllMusic}${fn:escapeXml(newMusicObject)}" />
</c:forEach>



<!-- JAVASCRIPT FILES -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/owl.carousel.js"></script>
<%--<script src="js/custom.js"></script>--%>
<script src="js/music-list.js"></script>
<script src="js/script.js"></script>
<script src="js/pagination.js"></script>
<script>
  (function ($) {

    "use strict";

    // MENU
    $('.navbar-collapse a').on('click',function(){
      $(".navbar-collapse").collapse('hide');
    });

    // CUSTOM LINK
    $('.smoothscroll').click(function(){
      var el = $(this).attr('href');
      var elWrapped = $(el);
      var header_height = $('.navbar').height();

      scrollToDiv(elWrapped,header_height);
      return false;

      function scrollToDiv(element,navheight){
        var offset = element.offset();
        var offsetTop = offset.top;
        var totalScroll = offsetTop-0;

        $('body,html').animate({
          scrollTop: totalScroll
        }, 300);
      }
    });

    $('.owl-carousel').owlCarousel({
      center: true,
      loop: true,
      margin: 30,
      autoplay: true,
      responsiveClass: true,
      responsive:{
        0:{
          items: 2,
        },
        767:{
          items: 3,
        },
        1200:{
          items: 4,
        }
      }
    });

  })(window.jQuery);
</script>

<%--Music Control JS--%>
<script>
  // Music control

  const wrapper = document.querySelector(".wrapper"),
          musicImg = wrapper.querySelector(".img-area img"),
          musicName = wrapper.querySelector(".song-details .name"),
          musicArtist = wrapper.querySelector(".song-details .artist"),
          playPauseBtn = wrapper.querySelector(".play-pause"),
          prevBtn = wrapper.querySelector("#prev"),
          nextBtn = wrapper.querySelector("#next"),
          mainAudio = wrapper.querySelector("#main-audio"),
          progressArea = wrapper.querySelector(".progress-area"),
          progressBar = progressArea.querySelector(".progress-bar"),
          musicList = wrapper.querySelector(".music-list"),
          moreMusicBtn = wrapper.querySelector("#more-music"),
          closemoreMusic = musicList.querySelector("#close");

  var json_songs = '<%= request.getAttribute("json_songs") %>';
  var musicSelected = JSON.parse(json_songs);
  var allMusicArray = [];
  for(var i = 0; i < musicSelected.length;i++){
    var musicObject = {
      id: musicSelected[i].id,
      name: musicSelected[i].name,
      author: musicSelected[i].singer.name,
      img: musicSelected[i].image,
      src: musicSelected[i].song,
      duration: musicSelected[i].duration
    }
    allMusicArray.push(musicObject);
  }

  let musicIndex = Math.floor((Math.random() * allMusicArray.length) + 1);
  isMusicPaused = true;

  window.addEventListener("load", ()=>{
    loadMusic(musicIndex);
    playingSong();
  });


  function loadMusic(indexNumb) {
    musicName.innerText = allMusicArray[indexNumb - 1].name;
    musicArtist.innerText = allMusicArray[indexNumb - 1].author;
    musicImg.src = allMusicArray[indexNumb - 1].img;
    mainAudio.src = allMusicArray[indexNumb - 1].src;
  }

  //play music function
  function playMusic(){
    wrapper.classList.add("paused");
    playPauseBtn.querySelector("i").innerText = "pause";
    mainAudio.play();
  }

  //pause music function
  function pauseMusic(){
    wrapper.classList.remove("paused");
    playPauseBtn.querySelector("i").innerText = "play_arrow";
    mainAudio.pause();
  }

  //prev music function
  function prevMusic(){
    musicIndex--; //decrement of musicIndex by 1
    //if musicIndex is less than 1 then musicIndex will be the array length so the last music play
    musicIndex < 1 ? musicIndex = allMusicArray.length : musicIndex = musicIndex;
    loadMusic(musicIndex);
    playMusic();
    playingSong();
  }

  //next music function
  function nextMusic(){
    musicIndex++; //increment of musicIndex by 1
    //if musicIndex is greater than array length then musicIndex will be 1 so the first music play
    musicIndex > allMusicArray.length ? musicIndex = 1 : musicIndex = musicIndex;
    loadMusic(musicIndex);
    playMusic();
    playingSong();
  }

  // play or pause button event
  playPauseBtn.addEventListener("click", ()=>{
    const isMusicPlay = wrapper.classList.contains("paused");
    //if isPlayMusic is true then call pauseMusic else call playMusic
    isMusicPlay ? pauseMusic() : playMusic();
    playingSong();
  });

  //prev music button event
  prevBtn.addEventListener("click", ()=>{
    prevMusic();
  });

  //next music button event
  nextBtn.addEventListener("click", ()=>{
    nextMusic();
  });

  // update progress bar width according to music current time
  mainAudio.addEventListener("timeupdate", (e)=>{

    const currentTime = e.target.currentTime; //getting playing song currentTime
    const duration = e.target.duration; //getting playing song total duration

    let progressWidth = (currentTime / duration) * 100;

    progressBar.style.width = progressWidth + "%";

    let musicCurrentTime = wrapper.querySelector(".current-time"),
            musicDuartion = wrapper.querySelector(".max-duration");
    mainAudio.addEventListener("loadeddata", ()=>{
      // update song total duration
      let mainAdDuration = mainAudio.duration;
      let totalMin = Math.floor(mainAdDuration / 60);
      let totalSec = Math.floor(mainAdDuration % 60);
      if(totalSec < 10){ //if sec is less than 10 then add 0 before it
        totalSec = "0"+totalSec;
      }
      console.log()
      musicDuartion.innerText = totalMin + ":" + totalSec;

    });
    // update playing song current time
    let currentMin = Math.floor(currentTime / 60);
    let currentSec = Math.floor(currentTime % 60);
    if(currentSec < 10){ //if sec is less than 10 then add 0 before it
      currentSec = "0"+currentSec;
    }
    musicCurrentTime.innerText = currentMin+":"+currentSec;

  });

  // update playing song currentTime on according to the progress bar width
  progressArea.addEventListener("click", (e)=>{
    let progressWidth = progressArea.clientWidth; //getting width of progress bar
    let clickedOffsetX = e.offsetX; //getting offset x value
    let songDuration = mainAudio.duration; //getting song total duration

    mainAudio.currentTime = (clickedOffsetX / progressWidth) * songDuration;
    playMusic(); //calling playMusic function
    playingSong();
  });

  //change loop, shuffle, repeat icon onclick
  const repeatBtn = wrapper.querySelector("#repeat-plist");
  repeatBtn.addEventListener("click", ()=>{
    let getText = repeatBtn.innerText; //getting this tag innerText
    switch(getText){
      case "repeat":
        repeatBtn.innerText = "repeat_one";
        repeatBtn.setAttribute("title", "Song looped");
        break;
      case "repeat_one":
        repeatBtn.innerText = "shuffle";
        repeatBtn.setAttribute("title", "Playback shuffled");
        break;
      case "shuffle":
        repeatBtn.innerText = "repeat";
        repeatBtn.setAttribute("title", "Playlist looped");
        break;
    }
  });

  //code for what to do after song ended
  mainAudio.addEventListener("ended", ()=>{
    // we'll do according to the icon means if user has set icon to
    // loop song then we'll repeat the current song and will do accordingly
    let getText = repeatBtn.innerText; //getting this tag innerText
    switch(getText){
      case "repeat":
        nextMusic(); //calling nextMusic function
        break;
      case "repeat_one":
        mainAudio.currentTime = 0; //setting audio current time to 0
        loadMusic(musicIndex); //calling loadMusic function with argument, in the argument there is a index of current song
        playMusic(); //calling playMusic function
        break;
      case "shuffle":
        let randIndex = Math.floor((Math.random() * allMusicArray.length) + 1); //genereting random index/numb with max range of array length
        do{
          randIndex = Math.floor((Math.random() * allMusicArray.length) + 1);
        }while(musicIndex == randIndex); //this loop run until the next random number won't be the same of current musicIndex
        musicIndex = randIndex; //passing randomIndex to musicIndex
        loadMusic(musicIndex);
        playMusic();
        playingSong();
        break;
    }
  });

  //show music list onclick of music icon
  moreMusicBtn.addEventListener("click", ()=>{
    musicList.classList.toggle("show");
  });
  closemoreMusic.addEventListener("click", ()=>{
    moreMusicBtn.click();
  });


  let jsonmusicSelected = '<%= request.getAttribute("songSelected")%>';
  let allMusicSelectedJSON = JSON.parse(jsonmusicSelected);
  console.log(allMusicSelectedJSON);
  let allMusicSelected = [];
  for(let i = 0; i < allMusicSelectedJSON.length;i++){
    let musicObjectSelected = {
      id: allMusicSelectedJSON[i].id,
      name: allMusicSelectedJSON[i].name,
      singer: allMusicSelectedJSON[i].singer.name,
      img: allMusicSelectedJSON[i].image,
      song: allMusicSelectedJSON[i].song,
      duration: allMusicSelectedJSON[i].duration
    }
    allMusicSelected.push(musicObjectSelected);
  }
  console.log(allMusicSelected)
  let ulTag = wrapper.querySelector('.music-list ul');
  if(allMusicSelected.length > 0){
    for (let i = 0; i < allMusicSelected.length; i++) {
      //let's pass the song name, artist from the array
      let liTag = `<li li-index="${i + 1}">
                <div class="row">
                  <span>${allMusicSelected[i].name}</span>
                  <p>${allMusicSelected[i].singer}</p>
                </div>
                <span id="${allMusicSelected[i].song}" class="audio-duration">${allMusicSelected[i].duration}</span>
                <audio class="${allMusicSelected[i].song}" src="${allMusicSelected[i].song}"></audio>
              </li>`;
      ulTag.insertAdjacentHTML("beforeend", liTag); //inserting the li inside ul tag

      let liAudioDuartionTag = ulTag.querySelector(`#${allMusicSelected[i].song}`);
      let liAudioTag = ulTag.querySelector(`.${allMusicSelected[i].song}`);
      liAudioTag.addEventListener("loadeddata", ()=>{
        let duration = liAudioTag.duration;
        let totalMin = Math.floor(duration / 60);
        let totalSec = Math.floor(duration % 60);
        if(totalSec < 10){ //if sec is less than 10 then add 0 before it
          totalSec = "0"+totalSec;
        };
        liAudioDuartionTag.innerText = totalMin+":"+totalSec; //passing total duation of song
        liAudioDuartionTag.setAttribute("t-duration", totalMin+":"+totalSec); //adding t-duration attribute with total duration value
      });
    }
  }
  // let create li tags according to array length for list


  //play particular song from the list onclick of li tag
  function playingSong(){
    const allLiTag = ulTag.querySelectorAll("li");

    for (let j = 0; j < allLiTag.length; j++) {
      let audioTag = allLiTag[j].querySelector(".audio-duration");

      if(allLiTag[j].classList.contains("playing")){
        allLiTag[j].classList.remove("playing");
        let adDuration = audioTag.getAttribute("t-duration");
        audioTag.innerText = adDuration;
      }

      //if the li tag index is equal to the musicIndex then add playing class in it
      if(allLiTag[j].getAttribute("li-index") == musicIndex){
        allLiTag[j].classList.add("playing");
        audioTag.innerText = "Playing";
      }

      allLiTag[j].setAttribute("onclick", "clicked(this)");
    }
  }

  //particular li clicked function
  function clickToPlayMusic(id){
    // let getLiIndex = element.getAttribute("li-index");
    for(var i = 0; i < allMusicArray.length; i++){
      if(id == allMusicArray[i].id){
        musicIndex = id;
        break;
      }
    }
    // musicIndex = getLiIndex; //updating current song index with clicked li index
    loadMusic(musicIndex);
    playMusic();
    playingSong();
  }




</script>
</body>

</html>
