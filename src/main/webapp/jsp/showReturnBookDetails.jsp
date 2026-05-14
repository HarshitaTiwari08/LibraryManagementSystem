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
            <div>
                <h1 class="h2"><i class="bi bi-journal-arrow-up me-2"></i>Return Book Detail</h1>
                <p class="text-muted mb-0">Verify book condition and capture notes before completing the return.</p>
            </div>
            <a href="return_book.html" class="btn btn-outline-secondary">
                <i class="bi bi-arrow-left"></i>Back to Returns
            </a>
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

        <div class="row g-4">
            <div class="col-lg-4">
                <div class="card shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex align-items-start justify-content-between mb-3">
                            <div>
                                <h5 class="card-title mb-1">${bookIssued.book.title }</h5>
                                <p class="card-subtitle text-muted">${bookIssued.book.author }</p>
                            </div>
                        </div>
                        <div class="border-top pt-3">
                            <p class="text-muted text-uppercase small mb-2">Quick Details</p>
                            <ul class="list-unstyled mb-0">
                                <li class="mb-2">
                                    <i class="bi bi-hash me-2 text-primary"></i>
                                    ISBN: <code>${bookIssued.book.isbn }</code>
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-calendar-event me-2 text-primary"></i>
                                    Issued on: <strong>${bookIssued.issueDate }</strong>
                                </li>
                                <li class="mb-2">
                                    <i class="bi bi-calendar2-check me-2 text-primary"></i>
                                    Due date: <strong>${bookIssued.dueDate }</strong>
                                </li>
                                <li class="mb-0">
                                    <i class="bi bi-person me-2 text-primary"></i>
                                    Borrower: <strong>${bookIssued.user.firstName } ${bookIssued.user.lastName }</strong>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="form-container">
                    <h5 class="mb-3">Finalize Return</h5>
                    <form action="BookController" method="post" id="returnDetailForm">
                    	<input type="hidden" name="action" value="returnBook">
                    	<input type="hidden" name="issuedId" value="${bookIssued.issueId }">
                    	
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <input type="date" class="form-control" id="returnDate" name="returnDate">
                                    <label for="returnDate"><i class="bi bi-calendar-check me-2"></i>Return Date</label>
                                    <div id="returnDateError" class="text-danger small mt-1"></div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-floating">
                                    <select class="form-select" id="bookCondition" name="bookCondition">
                                        <option value="good" selected>Good</option>
                                        <option value="fair">Fair</option>
                                        <option value="damaged">Damaged</option>
                                        <option value="lost">Lost</option>
                                    </select>
                                    <label for="bookCondition"><i class="bi bi-clipboard-check me-2"></i>Book Condition</label>
                                    <div id="bookConditionError" class="text-danger small mt-1"></div>
                                </div>
                            </div>
                        </div>

                        <div class="form-floating">
                            <textarea class="form-control" id="returnNotes" name="returnNotes" placeholder="Return Notes" style="height: 140px;"></textarea>
                            <label for="returnNotes"><i class="bi bi-card-text me-2"></i>Return Notes</label>
                        </div>

                        <div class="alert alert-info d-flex align-items-center" role="alert">
                            <i class="bi bi-info-circle-fill me-2"></i>
                            <span>Record any damages or remarks in the notes to keep the member history up to date.</span>
                        </div>

                        <div class="form-actions">
                            <button type="submit" class="btn-modern">
                                <i class="bi bi-check2-circle"></i>Confirm Return
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
function setupSimpleReturnValidation() {
    const form = document.getElementById('returnDetailForm');
    if (!form) {
        return;
    }

    const returnDate = document.getElementById('returnDate');
    const bookCondition = document.getElementById('bookCondition');
    const returnDateError = document.getElementById('returnDateError');
    const bookConditionError = document.getElementById('bookConditionError');

    form.addEventListener('submit', function(event) {
        let hasError = false;

        if (!returnDate.value) {
            returnDateError.textContent = 'Please select the return date.';
            hasError = true;
        } else {
            returnDateError.textContent = '';
        }

        if (!bookCondition.value) {
            bookConditionError.textContent = 'Please choose the book condition.';
            hasError = true;
        } else {
            bookConditionError.textContent = '';
        }

        if (hasError) {
            event.preventDefault();
        }
    });
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupSimpleReturnValidation);
} else {
    setupSimpleReturnValidation();
}
</script>
</body>
</html>
