<style>
    /* General Form Styling */
form {
    max-width: 500px;
    margin: 30px auto;
    padding: 25px;
    background: #ffffff;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
}

/* Input Fields */
.form-control {
    width: 100%;
    padding: 12px;
    font-size: 1rem;
    border-radius: 8px;
    border: 1px solid #ccc;
    background: #f8f9fa;
    transition: 0.3s;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
    background: #ffffff;
}

/* Labels */
label {
    font-weight: 600;
    color: #333;
    margin-bottom: 6px;
    display: block;
}

/* Password Toggle */
.input-group {
    display: flex;
    align-items: center;
    position: relative;
}

.password-toggle {
    cursor: pointer;
    padding: 10px;
    background: transparent;
    border: none;
    position: absolute;
    right: 10px;
}

.password-toggle i {
    font-size: 1.2rem;
    color: #555;
    transition: 0.3s;
}

.password-toggle:hover i {
    color: #007bff;
}

/* Button Styling */
.btn-login {
    padding: 12px;
    font-size: 1.1rem;
    background: linear-gradient(135deg, #007bff, #0056b3);
    color: white;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    width: 100%;
    margin-top: 15px;
    transition: 0.3s;
}

.btn-login:hover {
    background: linear-gradient(135deg, #0056b3, #003f7f);
    transform: translateY(-2px);
}

/* Additional Styling for Tutor Role */
input[name="role"][value="tutor"] {
    display: none; /* Hide the role input field */
}

/* Responsive Design */
@media (max-width: 768px) {
    form {
        padding: 20px;
    }

    .btn-login {
        font-size: 1rem;
    }
}
</style>
<form action="register" method="post">
    <div class="mb-3 text-start">
        <label>Full Name</label>
        <input type="text" class="form-control" name="fullname" placeholder="Your full name" required>
    </div>
    <div class="mb-3 text-start">
        <label>Email</label>
        <input type="email" class="form-control" name="email" placeholder="Your email" required>
    </div>
    <div class="mb-3 text-start">
        <label>Password</label>
        <div class="input-group">
            <input type="password" class="form-control" name="password" placeholder="Your password" required>
            <div class="input-group-text password-toggle">
                <i class="fas fa-eye"></i>
            </div>
        </div>
    </div>
    <div class="mb-3 text-start">
        <label>Phone</label>
        <input type="text" class="form-control" name="phone" placeholder="Your phone" required>
    </div>
    <input type="hidden" name="role" value="tutor">
    <button type="submit" class="btn-login">Sign Up</button>
</form>
