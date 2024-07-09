document.addEventListener("DOMContentLoaded", function() {
    var sectionSerch = document.getElementById("section_serch");
    sectionSerch.classList.add("sticky");
});

document.getElementById('section_serch_item1_inputBox_item').addEventListener('click', function() {
           document.getElementById('section_serch_item1_input').focus();
        });
        
        const inputFields = document.querySelectorAll('#section_serch_item1_input');
        const inputBoxes = document.querySelectorAll('#section_serch_item1_inputBox_item');

        inputFields.forEach((inputField) => {
            inputField.addEventListener('focus', function() {
                inputFields.forEach(field => field.classList.add('focused'));
                inputBoxes.forEach(box => box.classList.add('focused'));
            });

            inputField.addEventListener('blur', function() {
                inputFields.forEach(field => field.classList.remove('focused'));
                inputBoxes.forEach(box => box.classList.remove('focused'));
            });
        });