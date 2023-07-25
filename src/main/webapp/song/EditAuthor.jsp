<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
  <title>Quản lý User</title>
  <link rel="stylesheet" href="/css/stylePageAdmin.css">
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.css" integrity="sha512-K0TEY7Pji02TnO4NY04f+IU66vsp8z3ecHoID7y0FSVRJHdlaLp/TkhS5WDL3OygMkVns4bz0/ah4j8M3GgguA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.min.js" integrity="sha512-JbRQ4jMeFl9Iem8w6WYJDcWQYNCEHP/LpOA11LaqnbJgDV6Y8oNB9Fx5Ekc5O37SwhgnNJdmnasdwiEdvMjW2Q=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <style>
    .form-group {
      margin-bottom: 1rem;
    }

    label {
      font-weight: bold;
      display: block;
      margin-bottom: 0.5rem;
    }

    input[type="text"] {
      width: 100%;
      padding: 0.5rem;
      font-size: 1rem;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    .btn-primary {
      background-color: #007bff;
      color: #fff;
      padding: 0.5rem 1rem;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .dropdown-content {
      display: none;
    }

    /* Hiển thị nội dung dropdown khi hover vào nút */
    .dropdown:hover .dropdown-content {
      display: block;
    }

    .menu-label {
      color: #333; /* Màu chữ bạn muốn sử dụng (ví dụ: đen) */
      font-size: 12px;
    }

    .dropdown-content .las {
      font-size: 32px; /* Điều chỉnh kích thước của biểu tượng tại đây */
    }
    .dropdown-content .menu-label {
      font-size: 12px; /* Điều chỉnh kích thước của chữ tại đây */
    }
  </style>
</head>
<body>
<input type="checkbox" id="menu-toggle">
<div class="sidebar">
  <div class="side-header">
    <h3>M<span>usic House</span></h3>
  </div>

  <div class="side-content">
    <div class="profile">
      <div class="profile-img bg-img" style="background-image: url(/assets/image-song/anh-gai-xinh-1.jpg)"></div>
      <h4>Admin</h4>
      <small>Music Manager</small>
    </div>

    <div class="side-menu">
      <ul>
        <li>
          <a href="/songs">
            <span class="las la-music"></span>
            <small>Quản lý Nhạc</small>
          </a>
        </li>
        <li>
          <a href="/users">
            <span class="las la-user-alt"></span>
            <small>Quản lý User</small>
          </a>
        </li>
        <li>
          <a href="/songs?action=create">
            <span class="las la-plus-circle"></span>
            <small>Thêm Nhạc Mới</small>
          </a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-btn">
            <span class="las la-address-card"></span>
            <small>Tiện Ích...</small>
          </a>
          <div class="dropdown-content">
            <a href="/authors"><span class="las la-guitar"></span> <span class="menu-label">Quản Lý Tác Giả</span></a>
            <a href="#"><span class="las la-sliders-h"></span> <span class="menu-label">Quản Lý Thể Loại</span></a>
            <a href="#"><span class="las la-microphone-alt"></span> <span class="menu-label">Quản Lý Ca Sĩ</span></a>
          </div>
        </li>
      </ul>
    </div>
  </div>
</div>

<div class="main-content">
  <header>
    <div class="header-content">
      <label for="menu-toggle">
        <span class="las la-bars"></span>
      </label>

      <div class="header-menu">
        <label>
          <span class="las la-search"></span>
        </label>

        <div class="notify-icon">
          <span class="las la-envelope"></span>
          <span class="notify">4</span>
        </div>

        <div class="notify-icon">
          <span class="las la-bell"></span>
          <span class="notify">3</span>
        </div>

        <div class="user">
          <div class="bg-img" style="background-image: url(/assets/image-song/anh-gai-xinh-1.jpg)"></div>
          <a href="/login">
            <span class="las la-power-off"></span>
            <span>Đăng Xuất</span>
          </a>
        </div>
      </div>
    </div>
  </header>


  <main>

    <div class="page-header">
      <h1>Trang Chủ</h1>
      <small>Trang Chủ / Sửa thông tin nhạc sĩ</small>
    </div>

    <div class="page-content">

      <div class="analytics">
      </div>
      <form method="post">
        <c:if test="${requestScope.messageEditAuthor != null}">
        <script>
          window.onload = () => {
            Swal.fire({
              position: 'top-end',
              icon: 'success',
              title: 'Thêm tác giả thành công',
              showConfirmButton: false,
              timer: 1500
            })
          }
        </script>
        </c:if>
        <div class="form-group">
          <label for="name" style="margin-left: 650px;">Tên tác giả cần sửa:</label>
          <input type="text" id="name" name="name" class="form-control" value="${author.getName()}" style="border: 1px solid #ced4da; padding: 0.375rem 0.75rem; background-color: #fff; color: #495057; font-size: 1rem; width: 330px; margin-left: 650px;"/>
        </div>
        <div class="form-group">
          <a href="/authors" style="margin-left: 650px;"><button class="btn btn-primary">Xác nhận sửa</button></a>
        </div>
      </form>
    </div>
  </main>
</div>
</body>
</html>