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