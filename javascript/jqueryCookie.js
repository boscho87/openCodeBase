String.prototype.hashCode = function () {
    var hash = 0;
    if (this.length == 0) return hash;
    for (i = 0; i < this.length; i++) {
        char = this.charCodeAt(i);
        hash = ((hash << 5) - hash) + char;
        hash = hash & hash; // Convert to 32bit integer
    }
    return hash;
};


$.get('/faq', function (response) {
    var hash = response.hashCode();
    console.log(hash);
    if ($.cookie('landing') == hash) {
        console.log('get old cookie');
    } else {
        console.log('create new cookie');
        $.cookie('landing', hash, {expires: 7, path: '/'});
    }
});
