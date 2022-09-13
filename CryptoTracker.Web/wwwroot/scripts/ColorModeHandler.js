﻿let darkMode = localStorage.getItem("color-mode");

window.addEventListener('click', function (e) {
    var toggleColorButton = document.getElementById('darkmode-toggle');

    if (toggleColorButton) {
        if (toggleColorButton.contains(e.target)) {
            // Clicked in box
            toggleColorMode();
        }
    }
});

const enableDarkMode = () => {
    document.documentElement.setAttribute("color-mode", "dark");
    localStorage.setItem("color-mode", "dark");
    darkMode = localStorage.getItem("color-mode");
}

const disableDarkMode = () => {
    document.documentElement.setAttribute("color-mode", "light");
    localStorage.setItem("color-mode", "light");
    darkMode = localStorage.getItem("color-mode");
}

const toggleColorMode = () => {
    if (darkMode == "dark") {
        disableDarkMode();
        console.log('in dark setting lights');
    } else {
        enableDarkMode();
        console.log('in light setting dark');

    }
};

(function () {

    var toggleColorButton = document.getElementById('darkmode-toggle');
    console.log(darkMode);
    if (darkMode == "dark") {
        //toggleColorButton.checked = false;
        enableDarkMode();
    } else {
        //toggleColorButton.checked = true;
        disableDarkMode();
    }
    console.log('a');
})();