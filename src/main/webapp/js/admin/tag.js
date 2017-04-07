function Tag() {
    var self = this;

    /**
     * 标签列表
     */
    this.queryTagList = function() {
        var url = ctx + '/admin/tag/list/';
        var data = $('#tag-list, #query-form').collectData(true);
        $('#tag-list').load(url, data);
    };
    
    /**
     * 新增/修改
     */
    this.showInput = function(flag, id) {
        var url = ctx + '/admin/tag/input/';

        if (flag != 'add') {
            if (!id) {
                $.warn('请至少选择一条记录');
                return;
            }

            url += '?id=' + id;
        }

        $('#tag-input-modal').load(url, {}, function() {
            $(this).modal($.fn.modal.defaults);
        });
    };

    /**
     * 标签保存
     */
    this.saveTag = function() {
        var url = ctx + '/admin/tag/saveTag/';
        var data = $('#tag-form').collectData();
        $.postJSON(url, data, function(json) {
            $.success('保存成功');
            $('#tag-input-modal').modal('hide');
            self.queryTagList();
        });
    };

    /**
     * 删除标签
     */
    this.deleteTag = function(id, name) {
        $.confirm('删除标签【' + name + '】，是否继续？', function(result) {
            if (result) {
                var url = ctx + '/admin/tag/deleteTag/?id=' + id;
                $.postJSON(url, {}, function(json) {
                    $.success('删除成功');
                    self.queryTagList();
                });
            }
        });
    };
  
};

var tag = new Tag();
