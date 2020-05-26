

// Fixing target _blank links
(function() {
    var links = document.getElementsByTagName("a");
    for (var i = 0, len = links.length; i < len; i++) {
        if (links[i].hostname !== window.location.hostname) {
            links[i].target = '_blank';
        }
    }
})()

