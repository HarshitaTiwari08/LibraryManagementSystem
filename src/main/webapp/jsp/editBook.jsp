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
            <h1 class="h2"><i class="bi bi-book-fill me-2"></i>Update Book</h1>
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

        <div class="form-container">
            <form action="BookController" method="post">
            	<input type="hidden" name="action" value="updateBook">
            	<input type="hidden" name="bookId" value="${book.bookId}">
            	
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="bookTitle" name="bookTitle"  placeholder="Book Title" value="${book.title}">
                            <label for="bookTitle"><i class="bi bi-book me-2"></i>Book Title</label>
                            <div id="bookTitleError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="author" name="author" placeholder="Author" value="${book.author}">
                            <label for="author"><i class="bi bi-person me-2"></i>Author</label>
                            <div id="authorError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="isbn" name="isbn" placeholder="ISBN" value="${book.isbn}">
                            <label for="isbn"><i class="bi bi-hash me-2"></i>ISBN Number</label>
                            <div id="isbnError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <select class="form-select" id="category" name="category">
                                <option selected disabled value="">Select category</option>
                                <option value="fiction" <c:if test="${book.category == 'fiction'}"> selected </c:if>>Fiction</option>
                                <option value="non-fiction" <c:if test="${book.category == 'non-fiction'}"> selected </c:if>>Non-fiction</option>
                                <option value="science" <c:if test="${book.category == 'science'}"> selected </c:if>>Science</option>
                                <option value="technology" <c:if test="${book.category == 'technology'}"> selected </c:if>>Technology</option>
                                <option value="history" <c:if test="${book.category == 'history'}"> selected </c:if>>History</option>
                                <option value="biography" <c:if test="${book.category == 'biography'}"> selected </c:if>>Biography</option>
                                <option value="mystery" <c:if test="${book.category == 'mystery'}"> selected </c:if>>Mystery</option>
                                <option value="romance" <c:if test="${book.category == 'romance'}"> selected </c:if>>Romance</option>
                            </select>
                            <label for="category"><i class="bi bi-collection me-2"></i>Category</label>
                            <div id="categoryError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="publisher" name="publisher" placeholder="Publisher" value="${book.publisher}">
                            <label for="publisher"><i class="bi bi-building me-2"></i>Publisher</label>
                            <div id="publisherError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="availableCopies" name="availableCopies" placeholder="Available Copies"  value="${book.availableCopies}" readonly="readonly">
                            <label for="pages"><i class="bi bi-file-text me-2"></i>Available Copies</label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="number" class="form-control" id="numberofcopies" name="numberofcopies" placeholder="Copies" min="1" value="${book.totalCopies}">
                            <label for="copies"><i class="bi bi-stack me-2"></i>Number of Copies</label>
                            <div id="numberOfCopiesError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-modern">
                        <i class="bi bi-save"></i>Update Book
                    </button>
                </div>
            </form>
        </div>
    </main>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
function setupEditBookValidation() {
    const form = document.querySelector('.form-container form');
    if (!form) {
        return;
    }

    const bookTitle = document.getElementById('bookTitle');
    const author = document.getElementById('author');
    const isbn = document.getElementById('isbn');
    const category = document.getElementById('category');
    const publisher = document.getElementById('publisher');
    const numberOfCopies = document.getElementById('numberofcopies');

    const bookTitleError = document.getElementById('bookTitleError');
    const authorError = document.getElementById('authorError');
    const isbnError = document.getElementById('isbnError');
    const categoryError = document.getElementById('categoryError');
    const publisherError = document.getElementById('publisherError');
    const numberOfCopiesError = document.getElementById('numberOfCopiesError');

    form.addEventListener('submit', function(event) {
        let hasError = false;

        if (!bookTitle.value.trim()) {
            bookTitleError.textContent = 'Please enter the book title.';
            hasError = true;
        } else {
            bookTitleError.textContent = '';
        }

        if (!author.value.trim()) {
            authorError.textContent = 'Please enter the author name.';
            hasError = true;
        } else {
            authorError.textContent = '';
        }

        if (!isbn.value.trim()) {
            isbnError.textContent = 'Please enter the ISBN number.';
            hasError = true;
        } else {
            isbnError.textContent = '';
        }

        if (!category.value) {
            categoryError.textContent = 'Please choose a category.';
            hasError = true;
        } else {
            categoryError.textContent = '';
        }

        if (!publisher.value.trim()) {
            publisherError.textContent = 'Please enter the publisher name.';
            hasError = true;
        } else {
            publisherError.textContent = '';
        }

        const totalValue = numberOfCopies.value.trim();
        const totalNumber = Number(totalValue);
        if (!totalValue) {
            numberOfCopiesError.textContent = 'Please enter the number of copies.';
            hasError = true;
        } else if (Number.isNaN(totalNumber) || totalNumber < 1) {
            numberOfCopiesError.textContent = 'Number of copies must be at least 1.';
            hasError = true;
        } else {
            numberOfCopiesError.textContent = '';
        }

        if (hasError) {
            event.preventDefault();
        }
    });
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupEditBookValidation);
} else {
    setupEditBookValidation();
}
</script>
</body>
</html>
