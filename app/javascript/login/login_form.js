document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const inputs = form.querySelectorAll('input');

    inputs.forEach(input => {
        input.addEventListener('input', function() {
            const error = this.parentElement.querySelector('.text-red-600');
            if (error) {
                error.style.display = 'none';
            }
        });
    });

    form.addEventListener('submit', function(e) {
        let hasError = false;
        inputs.forEach(input => {
            if (input.value.trim() === '') {
                const error = input.parentElement.querySelector('.text-red-600') ||
                    document.createElement('div');
                error.className = 'mt-1 text-sm text-red-600';
                error.textContent = `${input.placeholder} is required`;
                if (!input.parentElement.querySelector('.text-red-600')) {
                    input.parentElement.appendChild(error);
                }
                hasError = true;
            }
        });

        if (hasError) {
            e.preventDefault();
        }
    });
});