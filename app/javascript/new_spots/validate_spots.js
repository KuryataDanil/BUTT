document.addEventListener('DOMContentLoaded', function() {
    let spotIndex = 1;  // Индекс для спотов, начиная с 1

    window.addSpot = function() {
        const container = document.getElementById('spots-container');
        const newSpot = container.children[0].cloneNode(true);

        // Обновляем индексы полей для нового спота
        const inputs = newSpot.querySelectorAll('input');
        inputs.forEach(input => {
            // Заменяем старые индексы на новые
            const name = input.name;
            const newName = name.replace(/\[\d+\]/, `[${spotIndex}]`);
            input.name = newName;

            input.value = ''; // Очищаем значения в новых input
        });

        container.appendChild(newSpot); // Добавляем клонированное место

        spotIndex++;  // Увеличиваем индекс для следующего спота
    };

    window.removeSpotNew = function(button) {
        const container = document.getElementById('spots-container');
        if (container.children.length > 1) {
            button.closest('.flex').remove(); // Удаляем родительский элемент кнопки
            spotIndex--; // Уменьшаем индекс, так как один элемент был удален
        }
    };

    window.removeSpotEdit = function(button) {
        const spot = button.closest('.flex');
        const hiddenDestroyField = spot.querySelector('input[name$="[_destroy]"]');
        if (hiddenDestroyField) {
            hiddenDestroyField.value = '1'; // Отметка для удаления
        }
        spot.style.display = 'none'; // Скрыть элемент, чтобы его не было видно
    };
});
