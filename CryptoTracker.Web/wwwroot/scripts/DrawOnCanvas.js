﻿window.addEventListener('click', function (e) {
    var chartDrawButton = document.getElementById('chartDrawButton');
    var chartDrawCloseButton = document.getElementById('chartDrawCloseButton');

    if (chartDrawButton ) {
        if (chartDrawButton.contains(e.target)) {
            createDrawingCanvas();
            chartDrawButton.textContent = 'Reset'
            chartDrawCloseButton.style.display = "block";
        } else if (chartDrawCloseButton.contains(e.target)) {
            resetCanvas();
            chartDrawButton.textContent = 'Draw'
            chartDrawCloseButton.style.display = "none";
        }
    }
});

function resetCanvas() {
    var parent = document.getElementById('canvasParent');   
    parent.innerHTML = '';
}

function createDrawingCanvas() {
    html2canvas(document.getElementById('priceWrapper')).then(function (canvas) {
        canvas.id = "h2canvas";
        resetCanvas();
        var parent = document.getElementById('canvasParent');        
        parent.appendChild(canvas);

        draw();
    });
}

function draw() {
    var canvas = document.getElementById('h2canvas');
    var context = canvas.getContext('2d');

    var isIdle = true;
    function drawstart(event) {
        context.beginPath();
        context.moveTo(event.pageX - canvas.offsetLeft + document.getElementsByClassName("sidebar")[0].clientWidth + 10, event.pageY - canvas.offsetTop + 90);
        isIdle = false;
    }
    function drawmove(event) {
        if (isIdle) return;
        context.lineTo(event.pageX - canvas.offsetLeft + document.getElementsByClassName("sidebar")[0].clientWidth + 10, event.pageY - canvas.offsetTop + 90);
        context.stroke();
    }
    function drawend(event) {
        if (isIdle) return;
        drawmove(event);
        isIdle = true;
    }
    function touchstart(event) { drawstart(event.touches[0]) }
    function touchmove(event) { drawmove(event.touches[0]); event.preventDefault(); }
    function touchend(event) { drawend(event.changedTouches[0]) }

    canvas.addEventListener('touchstart', touchstart, false);
    canvas.addEventListener('touchmove', touchmove, false);
    canvas.addEventListener('touchend', touchend, false);

    canvas.addEventListener('mousedown', drawstart, false);
    canvas.addEventListener('mousemove', drawmove, false);
    canvas.addEventListener('mouseup', drawend, false);
}