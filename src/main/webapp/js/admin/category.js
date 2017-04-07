function Category() {
    var self = this;

    /**
     * 分类目录列表
     */
    this.queryCategoryList = function() {
        var url = ctx + '/admin/category/list/';
        var data = $('#category-list, #query-form').collectData(true);
        $('#category-list').load(url, data);
    };
    
    /**
     * 新增/修改
     */
    this.showInput = function(flag, id) {
        var url = ctx + '/admin/category/input/';

        if (flag != 'add') {
            if (!id) {
                $.warn('请至少选择一条记录');
                return;
            }

            url += '?id=' + id;
        }

        $('#category-input-modal').load(url, {}, function() {
            $(this).modal($.fn.modal.defaults);
        });
    };

    /**
     * 分类目录保存
     */
    this.saveCategory = function() {
        var url = ctx + '/admin/category/saveCategory/';
        var data = $('#category-form').collectData();
        $.postJSON(url, data, function(json) {
            $.success('保存成功');
            $('#category-input-modal').modal('hide');
            self.queryCategoryList();
        });
    };

    /**
     * 删除分类目录
     */
    this.deleteCategory = function(id, name) {
        $.confirm('删除分类目录【' + name + '】，是否继续？', function(result) {
            if (result) {
                var url = ctx + '/admin/category/deleteCategory/?id=' + id;
                $.postJSON(url, {}, function(json) {
                    $.success('删除成功');
                    self.queryCategoryList();
                });
            }
        });
    };
  
};

var category = new Category();
