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
