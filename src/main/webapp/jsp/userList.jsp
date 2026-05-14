<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ include file="includes/header.jsp" %>


<div class="container-fluid">
<div class="row">
    <!-- Sidebar -->
    <%@ include file="includes/sidebar.jsp" %>

    <!-- Main content -->
    <main class="col-md-9 ms-sm-auto col-lg-10">
        <div class="page-header header-with-btn">
            <h1 class="h2"><i class="bi bi-people-fill me-2"></i>User Management</h1>
            <a href="UserController?action=showAddUser" class="btn-modern"><i class="bi bi-person-plus-fill"></i>Add New User</a>
        </div>
        
        <c:if test="${not empty successMessage}">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<c:out value="${successMessage}"/>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
		
		 <c:if test="${not empty errorMessage}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<c:out value="${errorMessage}"/>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>

        <!-- Users Table -->
        <div class="table-container">
            <div class="table-responsive">
            	<c:choose>
            		<c:when test="${not empty userList}">
		                <table class="table table-hover align-middle">
		                    <thead>
		                        <tr>
		                            <th>#</th>
		                            <th>First Name</th>
		                            <th>Last Name</th>
		                            <th>Email</th>
		                            <th>Actions</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                      <c:forEach var="user" items="${userList}" varStatus="status">
		                        <tr>
		                            <td><span class="badge bg-primary">${status.index + 1 }</span></td>
		                            <td>
		                                <div class="user-info">
		                                    <strong><c:out value="${user.firstName}" /></strong>
		                                </div>
		                            </td>
		                            <td><c:out value="${user.lastName}" /></td>
		                            <td><c:out value="${user.email}" /></td>
		                            <td>
		                                <a href="UserController?action=viewUser&userId=${user.userId}" class="action-btn edit" title="Edit User"><i class="bi bi-pencil-square"></i></a>
		                                <button class="action-btn delete" title="Delete User"><i class="bi bi-trash-fill"></i></button>
		                            </td>
		                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
                	</c:when>
            		<c:otherwise>	
	            		<div>
	            				No user found
	            		</div>
            		</c:otherwise>
                </c:choose>
            </div>
        </div>
    </main>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
