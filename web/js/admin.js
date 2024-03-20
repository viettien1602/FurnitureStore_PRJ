/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var form = document.getElementById('show');
var i = document.getElementById('close');
var div = document.getElementById('add');
var display = 0;



function hideShow() {
    if (display == 1) {
        form.style.display = 'block';
        display = 0;
    } else {
        form.style.display = 'none';
        display = 1;

    }
};

i.addEventListener('click', hideShow);

document.addEventListener('DOMContentLoaded', function() {
    const input = document.getElementById('chooseFile');
    const fileName = document.getElementById('fileName');
    const noFileText = document.getElementById('noFile');

    input.addEventListener('change', function() {
        if (input.files.length > 0) {
            const file = input.files[0];

            noFileText.textContent = ''; // Clear the "No file chosen..." text
            noFileText.textContent = file.name;
        } else {
            fileName.textContent = 'Choose File';
            noFileText.textContent = 'No file chosen...';
        }
    });
});