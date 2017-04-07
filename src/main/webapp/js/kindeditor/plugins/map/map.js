KindEditor.plugin('map', function (K) {
    var self = this, name = 'map';
    self.clickToolbar(name, function () {
        self.cmd.toggle('<code></code>', {
            code: '*'
        });
    });
});