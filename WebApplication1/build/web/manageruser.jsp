<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>User Management</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <style>
            body {
                font-family: 'Open Sans', sans-serif;
                background: #F5F7FA;
                color: #404E67;
            }
            .table-wrapper {
                width: 90%;
                margin: 30px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title h2 {
                margin: 6px 0;
                font-size: 22px;
            }
            .table-title .add-new {
                float: right;
                font-size: 14px;
                min-width: 120px;
                border-radius: 50px;
            }
            table.table th, table.table td {
                border-color: #e9e9e9;
                padding: 12px;
                text-align: center;
            }
            table.table th {
                background: #f8f9fa;
            }
            table.table td {
                word-wrap: break-word;
                max-width: 200px;
            }
        </style>
    </head>
    <body>
        <div class="container-lg">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-8"><h2>User <b>Details</b></h2></div>
                            <div class="col-sm-4">
                                <!--                                <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>-->
                                <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Account</span></a>
                            </div>

                        </div>
                        <br>
                    </div>

                    <form action="manageruser" method="GET" class="mb-3">
                        <label for="roleFilter">Filter by Role:</label>
                        <select name="roleId" id="roleFilter" class="form-control d-inline-block w-auto ml-2">
                            <option value="">All</option>
                            <c:forEach var="role" items="${ListR}">
                                <option value="${role.id}">${role.roleName}</option>
                            </c:forEach>
                        </select>
                        <button type="submit" class="btn btn-primary ml-2">Filter</button>
                    </form>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th style="width: 10%;">User ID</th>
                                <th style="width: 10%;">Role</th>
                                <th style="width: 15%;">Image</th>
                                <th style="width: 15%;">Name</th>
                                <th style="width: 20%;">Email</th>
                                <th style="width: 20%;">Password</th>
                                <th style="width: 15%;">Phone</th>
                                <th style="width: 15%;">Gender</th>
                                <th style="width: 15%;">Address</th>

                                <th style="width: 10%;">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${ListA}" var="o">
                                <tr>
                                    <td>${o.userId}</td>
                                    <td>${o.roleId}</td>
                                    <td>
                                        <img src="${o.image}" alt="User Image" style="width: 50px; height: 50px; object-fit: cover; border-radius: 5px;">
                                    </td>
                                    <td>${o.name}</td>
                                    <td>${o.email}</td>
                                    <td>${o.password}</td>
                                    <td>${o.phone}</td>
                                    <td>${o.gender}</td>
                                    <td>${o.address}</td>

                                    <td>
                                        <a href="loadaccount?uid=${o.userId}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                        <a href="deleteaccount?uid=${o.userId}" class="delete" onclick="return confirm('Are you sure you want to delete this account?')">
                                            <i class="material-icons" title="Delete">&#xE872;</i>
                                        </a>
    <!--                                        <a href="deleteaccount?uid=${o.userId}" class="delete"><i class="material-icons" data-toggle="tooltip" title="Delete" >&#xE872;</i></a>-->
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <a href="homeadmin.jsp" class="btn btn-primary btn-custom">Back to Home</a>
                </div>
            </div>
        </div>
    </body>
    <script>
        $(document).ready(function () {
            $('[data-toggle="tooltip"]').tooltip(); // Kích hoạt tooltip
        });
    </script>

    <div id="addEmployeeModal" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <form name="addAccountForm" action="addaccount" method="POST" onsubmit="return validateAddAccountForm()">
                    <div class="modal-header">						
                        <h4 class="modal-title">Add Account</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">					
                        <!--                        <div class="form-group">
                                                    <label>User ID</label>
                                                    <input name="userid" type="text" class="form-control" required>
                                                </div>-->
                        <div class="form-group">
                            <label>Role</label>
                            <input id="add-role" name="role" type="number" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input id="add-name" name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input id="add-email" name="email" type="email" class="form-control" required>
                        </div>					
                        <div class="form-group">
                            <label>Password</label>
                            <input id="add-pass" name="pass" type="password" class="form-control" required>
                        </div>					
                        <div class="form-group">
                            <label>Phone</label>
                            <input id="add-phone" name="phone" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Gender</label>
                            <select id="add-gender" name="gender" class="form-control">
                                <option value="">Select Gender</option>
                                <option value="Nam">Nam</option>
                                <option value="Nữ">Nữ</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Address</label>
                            <select id="add-address" name="address" class="form-control">
                                <option value="">Select Address</option>
                                <option value="Hà Nội">Hà Nội</option>
                                <option value="TP HCM">TP HCM</option>
                                <option value="Đà Nẵng">Đà Nẵng</option>
                                <option value="Hải Phòng">Hải Phòng</option>
                                <option value="Cần Thơ">Cần Thơ</option>
                                <option value="Huế">Huế</option>
                                <option value="Bình Dương">Bình Dương</option>
                                <option value="Bắc Ninh">Bắc Ninh</option>
                                <option value="Nghệ An">Nghệ An</option>
                                <option value="Quảng Ninh">Quảng Ninh</option>
                                <option value="Thanh Hóa">Thanh Hóa</option>
                                <option value="Hải Dương">Hải Dương</option>
                                <option value="Nam Định">Nam Định</option>
                                <option value="Thái Nguyên">Thái Nguyên</option>
                                <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                <option value="Bắc Giang">Bắc Giang</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input id="add-image" name="image" type="text" class="form-control">
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Edit Modal HTML -->

    <script>
        function validateAddAccountForm() {
            let role = document.getElementById("add-role").value.trim();
            let name = document.getElementById("add-name").value.trim();
            let email = document.getElementById("add-email").value.trim();
            let password = document.getElementById("add-pass").value.trim();
            let phone = document.getElementById("add-phone").value.trim();
            let gender = document.getElementById("add-gender").value.trim().toLowerCase();
            let address = document.getElementById("add-address").value.trim();
            let image = document.getElementById("add-image").value.trim();

            let roleRegex = /^[2-4]$/;  // Chỉ chấp nhận số 2, 3, 4
            let nameRegex = /^[A-Za-zÀ-Ỹà-ỹ\s]+$/; // Chỉ ký tự chữ + tiếng Việt có dấu
            let emailRegex = /^[a-zA-Z0-9._%+-]+@gmail\.com$/; // Email phải có @gmail.com
            let passwordMinLength = 6;
            let phoneRegex = /^[0-9]{10}$/; // Số điện thoại phải có đúng 10 số
            let genderRegex = /^(nam|nữ)$/; // Chỉ nhận Nam hoặc Nữ
            let addressList = [
                "Hà Nội", "TP HCM", "Đà Nẵng", "Hải Phòng", "Cần Thơ", "Huế",
                "Bình Dương", "Bắc Ninh", "Nghệ An", "Quảng Ninh", "Thanh Hóa",
                "Hải Dương", "Nam Định", "Thái Nguyên", "Vĩnh Phúc", "Bắc Giang"
            ]; // Danh sách tỉnh/thành phố (có thể mở rộng)
            let imageRegex = /\.(jpg|jpeg|png|gif)$/i;
            let urlRegex = /^(https?:\/\/.*\.(?:png|jpg|jpeg|gif)(\?.*)?)$/i;

            if (!roleRegex.test(role)) {
                alert("Role chỉ có thể là số từ 2 đến 4.");
                return false;
            }
            if (!nameRegex.test(name)) {
                alert("Tên chỉ có thể chứa chữ cái, không chứa số hoặc ký tự đặc biệt.");
                return false;
            }
            if (!emailRegex.test(email)) {
                alert("Email phải có định dạng @gmail.com.");
                return false;
            }
            if (password.length < passwordMinLength) {
                alert("Mật khẩu phải có ít nhất 6 ký tự.");
                return false;
            }
            if (!phoneRegex.test(phone)) {
                alert("Số điện thoại phải có đúng 10 số.");
                return false;
            }
            if (!genderRegex.test(gender)) {
                alert("Giới tính chỉ có thể là 'Nam' hoặc 'Nữ'.");
                return false;
            }
            if (!addressList.includes(address)) {
                alert("Địa chỉ chỉ có thể là các tỉnh/thành phố của Việt Nam.");
                return false;
            }
            if (image !== "" && !(imageRegex.test(image) || urlRegex.test(image))) {
                alert("Ảnh phải là file hợp lệ (.jpg, .jpeg, .png, .gif) hoặc URL.");
                return false;
            }


            return true;
        }
    </script>

</html>