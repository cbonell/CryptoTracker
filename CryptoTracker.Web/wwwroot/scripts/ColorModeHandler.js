let darkMode = localStorage.getItem("color-mode");

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
    } else {
        enableDarkMode();
    }
};

(function () {
    var toggleColorButton = document.getElementById('darkmode-toggle');
    if (!darkMode || darkMode == "dark") {
        enableDarkMode();
    } else {
        disableDarkMode();
    }
})();

let lastUrl = location.href;
new MutationObserver(() => {
    const url = location.href;
    if (url !== lastUrl) {
        lastUrl = url;
        onUrlChange();
    }
}).observe(document, { subtree: true, childList: true });


function onUrlChange() {
    let url = lastUrl.slice(lastUrl.lastIndexOf('/') + 1);

    if (url != 'Coin') {
        setIcon('/Coin.ico');
    }
}

window.setIcon = (path) => {
    var link = document.querySelector("link[rel~='icon']");
    link.href = path;
}