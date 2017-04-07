function Admin() {
    var self = this;

    /**
     * 登陆
     */
    this.login = function() {
        var url = ctx + '/admin/login/';
        var data = $('#login-form').collectData();
        $.postJSON(url, data, function(json) {
            ace.cookie.set('login.username', data.username);
            location.href = ctx + "/admin/";
        });
    };
}

var admin = new Admin();
