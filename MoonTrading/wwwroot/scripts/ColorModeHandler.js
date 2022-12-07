let darkMode = localStorage.getItem("color-mode");

window.addEventListener('click', function (e) {
    let toggleColorButton = document.getElementById('darkmode-toggle');

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
    console.log('c');
    if (darkMode == "dark") {
        disableDarkMode();
    } else {
        enableDarkMode();
    }
};

(function () {
    if (!darkMode || darkMode == "dark") {
        enableDarkMode();
    } else {
        disableDarkMode();
    }
})();
