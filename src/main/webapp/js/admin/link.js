function Link() {
    var self = this;

    /**
     * 链接列表
     */
    this.queryLinkList = function() {
        var url = ctx + '/admin/link/list/';
        var data = $('#link-list, #query-form').collectData(true);
        $('#link-list').load(url, data);
    };
    
    /**
     * 新增/修改
     */
    this.showInput = function(flag, id) {
        var url = ctx + '/admin/link/input/';

        if (flag != 'add') {
            if (!id) {
                $.warn('请至少选择一条记录');
                return;
            }

            url += '?id=' + id;
        }

        $('#link-input-modal').load(url, {}, function() {
            $(this).modal($.fn.modal.defaults);
        });
    };

    /**
     * 链接保存
     */
    this.saveLink = function() {
        var url = ctx + '/admin/link/saveLink/';
        var data = $('#link-form').collectData();
        $.postJSON(url, data, function(json) {
            $.success('保存成功');
            $('#link-input-modal').modal('hide');
            self.queryLinkList();
        });
    };

    /**
     * 删除链接
     */
    this.deleteLink = function(id, name) {
        $.confirm('删除链接【' + name + '】，是否继续？', function(result) {
            if (result) {
                var url = ctx + '/admin/link/deleteLink/?id=' + id;
                $.postJSON(url, {}, function(json) {
                    $.success('删除成功');
                    self.queryLinkList();
                });
            }
        });
    };
  
};

var link = new Link();
