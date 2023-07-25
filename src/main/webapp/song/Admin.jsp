<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
  <title>Quản lý nhạc</title>
  <link rel="stylesheet" href="/css/stylePageAdmin.css">
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.css" integrity="sha512-K0TEY7Pji02TnO4NY04f+IU66vsp8z3ecHoID7y0FSVRJHdlaLp/TkhS5WDL3OygMkVns4bz0/ah4j8M3GgguA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.min.js" integrity="sha512-JbRQ4jMeFl9Iem8w6WYJDcWQYNCEHP/LpOA11LaqnbJgDV6Y8oNB9Fx5Ekc5O37SwhgnNJdmnasdwiEdvMjW2Q=="
          crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <style>
    .pagination a {
      color: black;
      float: left;
      padding: 8px 16px;
      text-decoration: none;
      transition: background-color .3s;
    }

    /* Style the active/current link */
    .pagination a.active {
      background-color: dodgerblue;
      color: white;
    }

    /* Add a grey background color on mouse-over */
    .pagination a:hover:not(.active) {background-color: #ddd;}

    .pagination-wrapper {
      display: flex;
      justify-content: flex-end;
    }

    .pagination {
      display: flex;
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .selected-page {
      background-color: #1E90FF; /* Màu xanh da trời */
      color: #fff; /* Màu trắng cho chữ số */
      padding: 2px 5px;
      border-radius: 5px;
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
          <a href="/songs" class="active">
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
      <small>Trang Chủ / Quản Lý Nhạc</small>
    </div>

    <div class="page-content">

      <div class="analytics">

        <div class="card">
          <div class="card-head">
            <h2>107,200</h2>
            <span class="las la-user-friends"></span>
          </div>
          <div class="card-progress">
            <small>Hoạt động của người dùng tháng này</small>
            <div class="card-indicator">
              <div class="indicator one" style="width: 60%"></div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-head">
            <h2>340,230</h2>
            <span class="las la-eye"></span>
          </div>
          <div class="card-progress">
            <small>Số lượt nghe</small>
            <div class="card-indicator">
              <div class="indicator two" style="width: 80%"></div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-head">
            <h2>653,200</h2>
            <span class="las la-heart"></span>
          </div>
          <div class="card-progress">
            <small>Số lượt thích</small>
            <div class="card-indicator">
              <div class="indicator three" style="width: 65%"></div>
            </div>
          </div>
        </div>

        <div class="card">
          <div class="card-head">
            <h2>47,500</h2>
            <span class="las la-envelope"></span>
          </div>
          <div class="card-progress">
            <small>Email mới</small>
            <div class="card-indicator">
              <div class="indicator four" style="width: 90%"></div>
            </div>
          </div>
        </div>

      </div>


      <div class="records table-responsive">

        <div class="record-header">
<%--          <div class="add">--%>
<%--            <span>Bộ lọc nhạc</span>--%>
<%--            <select name="" id="" style="width: 120px;">--%>
<%--              <option value="">Theo Bài hát</option>--%>
<%--              <option value="">Theo Tác giả </option>--%>
<%--              <option value="">Theo Thể loại</option>--%>
<%--              <option value="">Theo Ca sĩ</option>--%>
<%--            </select>--%>
<%--            <button>Lọc</button>--%>
<%--          </div>--%>

          <form method="get">
            <input type="text" placeholder="Nhập tên bài hát cần tìm..." class="form-select-button" name="kw" value="${pageable.getKw()}" style="width: 280px; padding: 0.375rem 0.75rem; font-size: 1rem; border: 1px solid #ced4da; border-radius: 0.25rem;">
            <select name="category-type" style="width: 150px; padding: 0.375rem 0.75rem; font-size: 1rem; border: 1px solid #ced4da; border-radius: 0.25rem;">
                <option value="-1">Tất cả thể loại</option>
              <c:forEach items="${categories}" var="ct">
                <option ${pageable.getCategoryType() == ct.getId() ? 'selected' : ''}  value="${ct.getId()}">${ct.getName()}</option>
              </c:forEach>
            </select>
            <button style="border: 1px solid #ced4da; padding: 0.375rem 0.75rem; background-color: #fff; color: #495057; font-size: 1rem; width: 120px; text-align: center; text-decoration: none; display: inline-block; font-weight: 400; line-height: 1.5; border-radius: 0.25rem; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; cursor: pointer;">Tìm kiếm</button>
          </form>
        </div>

        <div>
          <form method="get" action="/songs">
          <table width="100%">
            <thead>
            <tr>
              <th>ID</th>
              <th><span class="las la-sort"></span> TÊN BÀI HÁT</th>
              <th><span class="las la-sort"></span> TÊN TÁC GIẢ</th>
              <th><span class="las la-sort"></span> THỂ LOẠI</th>
              <th><span class="las la-sort" style="margin-left: 100px;"></span> NHẠC</th>
              <th><span class="las la-sort"></span> THAO TÁC</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${songs}" var="song">
            <tr>
              <td>#${song.id}</td>
              <td>
                <div class="client">
                  <img class="client-img bg-img" src="${song.getImage()}"/>
                  <div class="client-info">
                    <h4>${song.name}</h4>
                    <small>${song.getSinger().getName()}</small>
                  </div>
                </div>
              </td>
              <td>
                  ${song.getAuthor().getName()}
              </td>
              <td>
                  ${song.getCategory().getName()}
              </td>
              <td>
                <audio style="height: 30px" controls class="song-play">
                  <source src="${song.getSong()}" type="audio/mp3">
                </audio>
              </td>
              <td>
                <div class="actions">
                  <a href="/songs?action=edit&id=${song.getId()}"><span class="las la-pen-square" style="margin-left: 23px;"></span></a>
                  <a href="javascript:void(0)" onclick="handleDeleteClick(${song.getId()},'${song.getName()}')"><span class="las la-trash-alt" ></span></a>
                </div>
              </td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
          </form>
        </div>
      </div>
      <div class="pagination-wrapper">
      <div class="pagination" >
        <c:if test="${pageable.getPage() > 1}">
          <li class="page-item"><a class="page-link" href="/songs?kw=${pageable.kw}&page=${pageable.page-1}&customer-type=${pageable.categoryType}">Previous</a></li>
        </c:if>
        <c:forEach begin="1" end="${pageable.getTotal()}" var="i">
          <li class="page-item ${pageable.page == i ? 'active' : ''}">
            <a class="page-link" href="/songs?kw=${pageable.kw}&page=${i}&customer-type=${pageable.categoryType}">
              <c:choose>
                <c:when test="${pageable.page == i}">
                  <strong class="selected-page">${i}</strong>
                </c:when>
                <c:otherwise>
                  ${i}
                </c:otherwise>
              </c:choose>
            </a>
          </li>
        </c:forEach>
        <c:if test="${pageable.getPage() < pageable.getTotal()}">
          <li class="page-item"><a class="page-link" href="/songs?kw=${pageable.kw}&page=${pageable.page+1}&customer-type=${pageable.categoryType}">Next</a></li>
        </c:if>
<%--        <a href="#">&laquo;</a>--%>
<%--        <a href="#">1</a>--%>
<%--        <a class="active" href="#">2</a>--%>
<%--        <a href="#">3</a>--%>
<%--        <a href="#">4</a>--%>
<%--        <a href="#">5</a>--%>
<%--        <a href="#">6</a>--%>
<%--        <a href="#">&raquo;</a>--%>
      </div>
    </div>
    </div>
  </main>
</div>

<c:if test="${sessionScope.messageEdit !=null}">
  <script>
    window.onload = ()=>{
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Sửa thông tin thành công!',
        showConfirmButton: false,
        timer: 1500
      })
    }
  </script>
  <% session.setAttribute("messageEdit", null);%>
</c:if>

<c:if test="${sessionScope.messageDelete !=null}">
  <script>
    window.onload = ()=>{
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Xóa thành công!',
        showConfirmButton: false,
        timer: 1500
      })
    }
  </script>
  <% session.setAttribute("messageDelete", null);%>
</c:if>

<script>
  function handleDeleteClick(id, name){
    Swal.fire({
      title: 'Are you sure?',
      text: "Bạn có muốn xóa bài hát " + name + " hay không?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
      console.log(result);
      if (result.isConfirmed) {
        // /customers?action=delete&id=
        location.assign("/songs?action=delete&id=" + id);
      }
    })
  }
</script>

<c:if test="${sessionScope.messageAdd != null}">
  <script>
    window.onload = ()=>{
      Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: 'Thêm thành công',
        showConfirmButton: false,
        timer: 1500
      })
    }
  </script>
</c:if>
<% session.setAttribute("messageAdd", null);%>

</body>
</html>
