﻿let darkMode = localStorage.getItem("color-mode");

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