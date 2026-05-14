<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="position-sticky sidebar-sticky">
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link active" href="DashboardController?action=viewDashboard"><i class="bi bi-speedometer2"></i>Dashboard</a></li>
			<li class="nav-item"><a class="nav-link active" href="BookController?action=showAssignBook"><i class="bi bi-arrow-right-circle"></i>Assign Book</a></li>
            <li class="nav-item"><a class="nav-link active" href="BookController?action=showReturnBook"><i class="bi bi-arrow-left-circle"></i>Return Book</a></li>
            <li class="nav-item"><a class="nav-link active" href="BookController?action=allBookList"><i class="bi bi-book"></i>Books</a></li>
            <li class="nav-item"><a class="nav-link active" href="BookController?action=showAddBook"><i class="bi bi-plus-circle"></i>Add Book</a></li>
            <li class="nav-item"><a class="nav-link active" href="UserController?action=allUserList"><i class="bi bi-people"></i>Users</a></li>
            <li class="nav-item"><a class="nav-link active" href="UserController?action=showAddUser"><i class="bi bi-person-plus"></i>Add User</a></li>
        </ul>
    </div>
</nav>
