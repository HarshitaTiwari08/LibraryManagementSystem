<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="includes/header.jsp" %>

<div class="container-fluid">
<div class="row">
    <!-- Sidebar -->
    <%@ include file="includes/sidebar.jsp" %>

    <!-- Main content -->
    <main class="col-md-9 ms-sm-auto col-lg-10">
        <div class="page-header">
            <div>
                <h1 class="h2"><i class="bi bi-arrow-left-circle me-2"></i>Return Issued Books</h1>
                <p class="text-muted mb-0">Monitor borrowed books and record their safe return.</p>
            </div>
        </div>

		<c:if test="${not empty sucessMessage}">
			<div class="alert alert-success alert-dismissible fade show" role="alert">
				<c:out value="${sucessMessage}"/>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>
		
		  
	 	<c:if test="${not empty errorMessage}">
			<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<c:out value="${errorMessage}"/>
				<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
			</div>
		</c:if>

        <div class="table-container">
            <div class="table-responsive">
            	<c:choose>
            		<c:when test="${not empty issuedList}">
		                <table class="table table-hover align-middle">
		                    <thead>
		                        <tr>
		                            <th>#</th>
		                            <th>Book</th>
		                            <th>Member</th>
		                            <th>Issued On</th>
		                            <th>Due Date</th>
		                            <th>Status</th>
		                            <th>Action</th>
		                        </tr>
		                    </thead>
		                    <tbody>
		                       <c:forEach var="bookIssued" items="${issuedList}" varStatus="status">
		                        <tr>
		                            <td><span class="badge bg-primary">${status.index + 1 }</span></td>
		                            <td>
		                                <strong> <c:out value="${bookIssued.book.title}" /></strong>
		                                <div class="text-muted small">ISBN: <code><c:out value="${bookIssued.book.isbn}" /></code></div>
		                            </td>
		                            <td>
		                                <div><c:out value="${bookIssued.user.firstName}" /> <c:out value="${bookIssued.user.lastName}" /></div>
		                                <div class="text-muted small"><c:out value="${bookIssued.user.email}" /></div>
		                            </td>
		                            <td><c:out value="${bookIssued.issueDate}" /></td>
		                            <td><c:out value="${bookIssued.dueDate}" /></td>
		                            <c:choose>
            							<c:when test="${bookIssued.dueDayStatus eq 'Overdue'}">
		                            		<td><span class="badge bg-danger text-dark"><c:out value="${bookIssued.dueDayStatus}" /></span></td>
		                            	</c:when>
		                            	<c:when test="${bookIssued.dueDayStatus eq 'Due Today'}">
		                            		<td><span class="badge bg-warning text-dark"><c:out value="${bookIssued.dueDayStatus}" /></span></td>
		                            	</c:when>
		                            	<c:otherwise>
		                            		<td><span class="badge bg-success text-dark"><c:out value="${bookIssued.dueDayStatus}" /></span></td>
		                            	</c:otherwise>
		                            </c:choose>
		                            <td>
		                                <a href="BookController?action=showReturnBookDetails&issuedId=${bookIssued.issueId }" class="btn btn-sm btn-outline-primary">
		                                    <i class="bi bi-arrow-return-left me-1"></i>Return
		                                </a>
		                            </td>
		                        </tr>
		                        </c:forEach>
		                    </tbody>
		                </table>
                </c:when>
            	<c:otherwise>	
	            	<div>
	            			No books issued
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

