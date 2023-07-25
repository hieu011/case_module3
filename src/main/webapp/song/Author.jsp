<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1">
    <title>Quản lý Tác Giả</title>
    <link rel="stylesheet" href="/css/stylePageAdmin.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.css" integrity="sha512-K0TEY7Pji02TnO4NY04f+IU66vsp8z3ecHoID7y0FSVRJHdlaLp/TkhS5WDL3OygMkVns4bz0/ah4j8M3GgguA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/11.7.12/sweetalert2.min.js" integrity="sha512-JbRQ4jMeFl9Iem8w6WYJDcWQYNCEHP/LpOA11LaqnbJgDV6Y8oNB9Fx5Ekc5O37SwhgnNJdmnasdwiEdvMjW2Q=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
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
                        <a href="/authors" class="active"><span class="las la-guitar"></span> <span class="menu-label">Quản Lý Tác Giả</span></a>
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
            <small>Trang Chủ / Quản Lý Tác Giả</small>
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
                    <a href="/authors?action=create"><button style="border: 1px solid #ced4da; padding: 0.375rem 0.75rem; background-color: #80bdff; color: white; font-size: 1rem; width: 160px; text-align: center; text-decoration: none; display: inline-block; font-weight: 400; line-height: 1.5; border-radius: 0.25rem; transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out; cursor: pointer;">Thêm Tác Giả Mới</button></a>
                </div>
                <div>
                    <form method="get" action="/authors">
                        <table width="100%">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th><span class="las la-sort"></span> TÊN TÁC GIẢ</th>
                                <th><span class="las la-sort"></span> THAO TÁC</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${authors}" var="author">
                                <tr>
                                    <td>${author.getId()}</td>
                                    <td>
                                        <div class="client">
                                            <div><span class="las la-guitar"></span></div>
                                            <div class="client-info">
                                                <h4>${author.getName()}</h4>
                                            </div>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="actions">
                                            <a href="/authors?action=edit&id=${author.getId()}"><span class="las la-pen-square" style="margin-left: 23px;"></span></a>
                                            <a href="javascript:void(0)" onclick="handleDeleteClick(${author.getId()},'${author.getName()}')" style="margin-left: 40px"><span class="las la-trash-alt" ></span></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
<script>
    function handleDeleteClick(id, name){
        Swal.fire({
            title: 'Are you sure?',
            text: "Bạn có muốn xóa tác giả " + name + " khỏi hệ thống hay không?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            console.log(result);
            if (result.isConfirmed) {
                location.assign("/authors?action=delete&id=" + id);
            }
        })
    }
</script>

<c:if test="${sessionScope.messageDeleteAuthor !=null}">
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
    <% session.setAttribute("messageDeleteAuthor", null);%>
</c:if>

<c:if test="${sessionScope.messageAddAuthor != null}">
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
<% session.setAttribute("messageAddAuthor", null);%>


<c:if test="${sessionScope.messageEditAuthor !=null}">
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
    <% session.setAttribute("messageEditAuthor", null);%>
</c:if>

</body>
</html>

