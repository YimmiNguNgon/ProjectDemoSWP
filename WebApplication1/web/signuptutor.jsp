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

    /* Validation Messages */
    .validation-message {
        font-size: 0.8rem;
        margin-top: 5px;
        display: none;
    }

    .invalid-feedback {
        color: #dc3545;
        display: block;
    }

    .valid-feedback {
        color: #28a745;
        display: block;
    }

    /* Password Requirements */
    .password-requirements {
        font-size: 0.8rem;
        color: #6c757d;
        margin-top: 5px;
    }

    .requirement {
        display: flex;
        align-items: center;
        margin-bottom: 3px;
    }

    .requirement i {
        margin-right: 5px;
        font-size: 0.7rem;
    }

    .valid {
        color: #28a745;
    }

    .invalid {
        color: #dc3545;
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

<form action="register" method="post" id="registerForm">
    <div class="mb-3 text-start">
        <label>Full Name</label>
        <input type="text" class="form-control" name="fullname" placeholder="Your full name" required>
    </div>
    
    <div class="mb-3 text-start">
        <label>Email</label>
        <input type="email" class="form-control" id="email" name="email" placeholder="Your email" required>
        <div class="validation-message" id="email-validation">Email must contain @ and a valid domain</div>
    </div>
    
    <div class="mb-3 text-start">
        <label>Password</label>
        <div class="input-group">
            <input type="password" class="form-control" id="password" name="password" placeholder="Your password" required>
            <div class="input-group-text password-toggle" onclick="togglePassword('password')">
                <i class="fas fa-eye"></i>
            </div>
        </div>
        <div class="password-requirements">
            <div class="requirement"><i id="length-icon" class="fas fa-circle invalid"></i> At least 8 characters</div>
            <div class="requirement"><i id="uppercase-icon" class="fas fa-circle invalid"></i> At least 1 uppercase letter</div>
            <div class="requirement"><i id="number-icon" class="fas fa-circle invalid"></i> At least 1 number</div>
            <div class="requirement"><i id="special-icon" class="fas fa-circle invalid"></i> At least 1 special character</div>
        </div>
    </div>
    
    <div class="mb-3 text-start">
        <label>Phone</label>
        <input type="text" class="form-control" id="phone" name="phone" placeholder="Your phone" required>
        <div class="validation-message" id="phone-validation">Phone must start with 0 and have 10 digits</div>
    </div>
    
    <div class="mb-3 text-start">
        <label for="gender">Gender</label>
        <select class="form-control" name="gender" id="gender" required>
            <option value="" disabled selected>-- Select Gender --</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
    </div>

    <input type="hidden" name="role" value="tutor">
    <button type="submit" class="btn-login" id="submit-btn">Sign Up</button>
</form>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const emailInput = document.getElementById('email');
        const phoneInput = document.getElementById('phone');
        const passwordInput = document.getElementById('password');
        const submitBtn = document.getElementById('submit-btn');
        const form = document.getElementById('registerForm');
        
        // Password validation elements
        const lengthIcon = document.getElementById('length-icon');
        const uppercaseIcon = document.getElementById('uppercase-icon');
        const numberIcon = document.getElementById('number-icon');
        const specialIcon = document.getElementById('special-icon');
        
        // Validation flags
        let isEmailValid = false;
        let isPhoneValid = false;
        let isPasswordValid = false;
        
        // Email validation
        emailInput.addEventListener('input', function() {
            const email = this.value;
            const emailValidation = document.getElementById('email-validation');
            
            if (/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                emailValidation.classList.remove('invalid-feedback');
                emailValidation.classList.add('valid-feedback');
                emailValidation.textContent = 'Email is valid';
                isEmailValid = true;
            } else {
                emailValidation.classList.remove('valid-feedback');
                emailValidation.classList.add('invalid-feedback');
                emailValidation.textContent = 'Please enter a valid email address';
                isEmailValid = false;
            }
            
            emailValidation.style.display = 'block';
            updateSubmitButton();
        });
        
        // Phone validation
        phoneInput.addEventListener('input', function() {
            const phone = this.value;
            const phoneValidation = document.getElementById('phone-validation');
            
            // Remove all non-digit characters
            const digitsOnly = phone.replace(/\D/g, '');
            
            if (digitsOnly.length === 10 && digitsOnly.startsWith('0')) {
                phoneValidation.classList.remove('invalid-feedback');
                phoneValidation.classList.add('valid-feedback');
                phoneValidation.textContent = 'Phone number is valid';
                isPhoneValid = true;
                // Update the input with formatted value
                this.value = digitsOnly;
            } else {
                phoneValidation.classList.remove('valid-feedback');
                phoneValidation.classList.add('invalid-feedback');
                phoneValidation.textContent = 'Phone must start with 0 and have 10 digits';
                isPhoneValid = false;
            }
            
            phoneValidation.style.display = 'block';
            updateSubmitButton();
        });
        
        // Password validation
        passwordInput.addEventListener('input', function() {
            const password = this.value;
            
            // Check length
            const isLengthValid = password.length >= 8;
            updateIcon(lengthIcon, isLengthValid);
            
            // Check uppercase
            const isUppercaseValid = /[A-Z]/.test(password);
            updateIcon(uppercaseIcon, isUppercaseValid);
            
            // Check number
            const isNumberValid = /[0-9]/.test(password);
            updateIcon(numberIcon, isNumberValid);
            
            // Check special character
            const isSpecialValid = /[!@#$%^&*(),.?":{}|<>]/.test(password);
            updateIcon(specialIcon, isSpecialValid);
            
            // Overall password validity
            isPasswordValid = isLengthValid && isUppercaseValid && isNumberValid && isSpecialValid;
            updateSubmitButton();
        });
        
        // Form submission validation
        form.addEventListener('submit', function(e) {
            if (!isEmailValid || !isPhoneValid || !isPasswordValid) {
                e.preventDefault();
                alert('Please fix all validation errors before submitting.');
            }
        });
        
        // Helper functions
        function updateIcon(iconElement, isValid) {
            if (isValid) {
                iconElement.classList.remove('fa-circle', 'invalid');
                iconElement.classList.add('fa-check-circle', 'valid');
            } else {
                iconElement.classList.remove('fa-check-circle', 'valid');
                iconElement.classList.add('fa-circle', 'invalid');
            }
        }
        
        function updateSubmitButton() {
            if (isEmailValid && isPhoneValid && isPasswordValid) {
                submitBtn.disabled = false;
            } else {
                submitBtn.disabled = true;
            }
        }
        
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = document.querySelector(`#${inputId} + .input-group-text i`);
            
            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
    });
</script>