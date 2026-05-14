<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="includes/header.jsp" %>

<style>
    .info-card {
        background: linear-gradient(135deg, rgba(52, 152, 219, 0.1) 0%, rgba(155, 89, 182, 0.1) 100%);
        border: 1px solid rgba(52, 152, 219, 0.2);
        border-radius: var(--border-radius);
        padding: 1.5rem;
        margin-bottom: 2rem;
    }

    .info-card .icon {
        font-size: 2rem;
        color: #3498db;
        margin-bottom: 1rem;
    }

    .user-type-card {
        border: 2px solid #e9ecef;
        border-radius: var(--border-radius);
        padding: 1.5rem;
        margin-bottom: 1rem;
        cursor: pointer;
        transition: var(--transition);
        background: rgba(255, 255, 255, 0.8);
    }

    .user-type-card:hover {
        border-color: #1ABC9C;
        background: rgba(26, 188, 156, 0.05);
        transform: translateY(-2px);
        box-shadow: var(--card-shadow);
    }

    .user-type-card.selected {
        border-color: #1ABC9C;
        background: rgba(26, 188, 156, 0.1);
        box-shadow: var(--card-shadow);
    }

    .user-type-card .icon {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }

    .user-type-card h6 {
        margin-bottom: 0.5rem;
        color: #2c3e50;
    }

    .user-type-card p {
        font-size: 0.9rem;
        color: #6c757d;
        margin-bottom: 0;
    }
</style>


<div class="container-fluid">
<div class="row">
    <!-- Sidebar -->
    <%@ include file="includes/sidebar.jsp" %>

    <!-- Main content -->
	<main class="col-md-9 ms-sm-auto col-lg-10">
        <div class="page-header">
            <h1 class="h2"><i class="bi bi-person-plus me-2"></i>Add New User</h1>
        </div>

        <!-- Info Card -->
        <!-- <div class="info-card">
            <div class="icon">
                <i class="bi bi-info-circle"></i>
            </div>
            <h5>User Registration</h5>
            <p class="mb-0">Register new library members and staff. Choose the appropriate user type and fill in the required information to create a new account.</p>
        </div> -->

        <!-- User Type Selection -->
        <div class="form-container">
            <form id="userForm" action="UserController" method="post">
            	<input type="hidden" name="action" value="addUser">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name">
                            <label for="firstName"><i class="bi bi-person me-2"></i>First Name</label>
                            <div id="firstNameError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name">
                            <label for="lastName"><i class="bi bi-person me-2"></i>Last Name</label>
                            <div id="lastNameError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="email" class="form-control" id="email" name="email" placeholder="Email">
                            <label for="email"><i class="bi bi-envelope me-2"></i>Email Address</label>
                            <div id="emailError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-floating">
                            <input type="tel" class="form-control" id="phone" name="phone" placeholder="Phone">
                            <label for="phone"><i class="bi bi-telephone me-2"></i>Phone Number</label>
                            <div id="phoneError" class="text-danger small mt-1"></div>
                        </div>
                    </div>
                </div>

                <div class="form-floating">
                    <textarea class="form-control" id="address" name="address" placeholder="Address"></textarea>
                    <label for="address"><i class="bi bi-geo-alt me-2"></i>Address</label>
                    <div id="addressError" class="text-danger small mt-1"></div>
                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-modern">
                        <i class="bi bi-person-plus"></i>Create User
                    </button>
                </div>
            </form>
        </div>
    </main>

</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
function setupAddBookValidation() {
    const form = document.querySelector('.form-container form');
    if (!form) {
        return;
    }

    const bookTitleError = document.getElementById('bookTitleError');
    const authorError = document.getElementById('authorError');
    const isbnError = document.getElementById('isbnError');
    const categoryError = document.getElementById('categoryError');
    const publisherError = document.getElementById('publisherError');
    const availableCopiesError = document.getElementById('availableCopiesError');
    const numberOfCopiesError = document.getElementById('numberOfCopiesError');

    form.addEventListener('submit', function(event) {
        let hasError = false;

        const bookTitle = document.getElementById('bookTitle').value.trim();
        const author = document.getElementById('author').value.trim();
        const isbn = document.getElementById('isbn').value.trim();
        const category = document.getElementById('category').value.trim();
        const publisher = document.getElementById('publisher').value.trim();
        const availableCopies = document.getElementById('availableCopies').value.trim();
        const numberOfCopies = document.getElementById('numberofcopies').value.trim();

        // Validation starts
        if (!bookTitle) {
            bookTitleError.textContent = 'Please enter the book title.';
            hasError = true;
        } else {
            bookTitleError.textContent = '';
        }

        if (!author) {
            authorError.textContent = 'Please enter the author name.';
            hasError = true;
        } else {
            authorError.textContent = '';
        }

        if (!isbn) {
            isbnError.textContent = 'Please enter the ISBN number.';
            hasError = true;
        } else {
            isbnError.textContent = '';
        }

        if (!category) {
            categoryError.textContent = 'Please choose a category.';
            hasError = true;
        } else {
            categoryError.textContent = '';
        }

        if (!publisher) {
            publisherError.textContent = 'Please enter the publisher name.';
            hasError = true;
        } else {
            publisherError.textContent = '';
        }

        const totalNumber = Number(numberOfCopies);
        if (!numberOfCopies) {
            numberOfCopiesError.textContent = 'Please enter the number of copies.';
            hasError = true;
        } else if (Number.isNaN(totalNumber) || totalNumber < 1) {
            numberOfCopiesError.textContent = 'Number of copies must be at least 1.';
            hasError = true;
        } else {
            numberOfCopiesError.textContent = '';
        }

        const availableNumber = Number(availableCopies);
        if (!availableCopies) {
            availableCopiesError.textContent = 'Please enter available copies.';
            hasError = true;
        } else if (Number.isNaN(availableNumber) || availableNumber < 1) {
            availableCopiesError.textContent = 'Available copies must be at least 1.';
            hasError = true;
        } else if (availableNumber > totalNumber) {
            availableCopiesError.textContent = 'Available copies must be less than or equal to total copies.';
            hasError = true;
        } else {
            availableCopiesError.textContent = '';
        }

        // ✅ Stop form submission if any error found
        if (hasError) {
            event.preventDefault();
        }
    });
}

if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', setupAddUserValidation);
} else {
    setupAddUserValidation();
}
</script>
</body>
</html>
