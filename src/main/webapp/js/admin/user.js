function User() {
    var self = this;

    /**
     * 用户列表
     */
    this.queryUserList = function() {
        var url = ctx + '/admin/user/list/';
        var data = $('#user-list, #query-form').collectData(true);
        $('#user-list').load(url, data);
    };
    
    /**
     * 新增/修改
     */
    this.showInput = function(flag, id) {
        var url = ctx + '/admin/user/input/';

        if (flag != 'add') {
            if (!id) {
                $.warn('请至少选择一条记录');
                return;
            }

            url += '?id=' + id;
        }

        $('#user-input-modal').load(url, {}, function() {
            $(this).modal($.fn.modal.defaults);
        });
    };

    /**
     * 用户保存
     */
    this.saveUser = function() {
        var url = ctx + '/admin/user/saveUser/';
        var data = $('#user-form').collectData();
        $.postJSON(url, data, function(json) {
            $.success('保存成功');
            $('#user-input-modal').modal('hide');
            self.queryUserList();
        });
    };

    /**
     * 删除用户
     */
    this.deleteUser = function(id, username) {
        $.confirm('删除帐号【' + username + '】，是否继续？', function(result) {
            if (result) {
                var url = ctx + '/admin/user/deleteUser/?id=' + id;
                $.postJSON(url, {}, function(json) {
                    $.success('删除成功');
                    self.queryUserList();
                });
            }
        });
    };
  
};

var user = new User();
