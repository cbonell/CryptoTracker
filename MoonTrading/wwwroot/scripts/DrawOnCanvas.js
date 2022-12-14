window.addEventListener('click', function (e) {
    let chartDrawButton = document.getElementById('chartDrawButton');
    let chartDrawCloseButton = document.getElementById('chartDrawCloseButton');

    if (chartDrawButton) {
        if (chartDrawButton.contains(e.target)) {
            createDrawingCanvas();
            chartDrawButton.textContent = 'Reset'
            chartDrawCloseButton.style.display = "block";

            priceWrapper.style.display = "none"
        } else if (chartDrawCloseButton.contains(e.target)) {
            resetCanvas();
            chartDrawButton.textContent = 'Draw'
            chartDrawCloseButton.style.display = "none";
            priceWrapper.style.display = "block";
        }
    }
});

function resetCanvas() {
    let parent = document.getElementById('canvasParent');
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
    let canvas = document.getElementById('h2canvas');
    let context = canvas.getContext('2d');

    let isIdle = true;
    function drawstart(event) {
        context.beginPath();
        context.moveTo(event.pageX - canvas.offsetLeft + 10, event.pageY - canvas.offsetTop + 90);
        context.moveTo(event.pageX + 10, event.pageY + 90);
        context.strokeStyle = "red";
        isIdle = false;
    }
    function drawmove(event) {
        if (isIdle) return;
        console.log(event.pageX - canvas.offsetLeft + 10, event.pageY - canvas.offsetTop + 90);
        context.lineTo(event.pageX - canvas.offsetLeft + 10, event.pageY - canvas.offsetTop + 90);
        context.lineTo(event.pageX + 10, event.pageY + 90);
        context.stroke();
        context.strokeStyle = "red";
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
