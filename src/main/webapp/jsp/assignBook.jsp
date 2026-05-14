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
        <div class="page-header">
            <h1 class="h2"><i class="bi bi-arrow-right-circle me-2"></i>Assign Book to Member</h1>
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

        <div class="form-container">
            <form action="BookController" method="post">
            	<input type="hidden" name="action" value="assignBook">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select class="form-select" id="bookId" name="bookId">
                                <option value="" selected disabled>Choose a book</option>
                                <c:forEach var="book" items="${bookList}">
                                 	<option value="${book.bookId}">
                                 		<c:out value="${book.title}"/> - <c:out value="${book.author}" /> (Available - <c:out value="${book.availableCopies}" />)
                                 	</option>
                                </c:forEach>
                            </select>
                            <label for="selectBook"><i class="bi bi-book-fill me-2"></i>Select Book</label>
                            <div id="bookIdError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select class="form-select" id="userId" name="userId">
                               <option value="" selected disabled>Choose a member</option>
                               <c:forEach var="user" items="${userList}">
                                 	<option value="${user.userId}">
                                 		<c:out value="${user.firstName}"/> <c:out value="${user.lastName}" /> - <c:out value="${user.email}"/>
                                	</option>
                                </c:forEach>
                            </select>
                            <label for="selectMember"><i class="bi bi-person-fill me-2"></i>Select Member</label>
                            <div id="userIdError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="date" class="form-control" id="dueDate" name="dueDate">
                            <label for="dueDate"><i class="bi bi-calendar-event me-2"></i>Due Date</label>
                            <div id="dueDateError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="form-floating">
                    <textarea class="form-control" id="assignmmentNotes" name="assignmmentNotes" placeholder="Notes"></textarea>
                    <label for="notes"><i class="bi bi-card-text me-2"></i>Assignment Notes (Optional)</label>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-modern">
                        <i class="bi bi-check-circle"></i>Assign Book
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
function setupAssignBookValidation() {
    const form = document.querySelector('.form-container form');
    if (!form) {
        return;
    }

    const bookId = document.getElementById('bookId');
    const userId = document.getElementById('userId');
    const dueDate = document.getElementById('dueDate');

    const bookIdError = document.getElementById('bookIdError');
    const userIdError = document.getElementById('userIdError');
    const dueDateError = document.getElementById('dueDateError');

    form.addEventListener('submit', function(event) {
        let hasError = false;

        if (!bookId.value) {
            bookIdError.textContent = 'Please choose a book to assign.';
            hasError = true;
        } else {
            bookIdError.textContent = '';
        }

        if (!userId.value) {
            userIdError.textContent = 'Please choose a member.';
            hasError = true;
        } else {
            userIdError.textContent = '';
        }

        if (!dueDate.value) {
            dueDateError.textContent = 'Please select the due date.';
            hasError = true;
        } else {
            dueDateError.textContent = '';
        }

        if (hasError) {
            event.preventDefault();
        }
    });
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupAssignBookValidation);
} else {
    setupAssignBookValidation();
}
</script>
</body>
</html>
