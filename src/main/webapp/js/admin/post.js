function Post() {
    var self = this;

    /**
     * 文章列表
     */
    this.queryPostList = function () {
        var url = ctx + '/admin/post/list/';
        var data = $('#post-list, #query-form').collectData(true);
        $('#post-list').load(url, data);
    };

    /**
     * 新增/修改
     */
    this.showInput = function (flag, id) {
        var url = ctx + '/admin/post/input/';

        if (flag != 'add') {
            if (!id) {
                $.warn('请至少选择一条记录');
                return;
            }

            url += '?id=' + id;
        }

        $('#post-input-modal').load(url, {}, function () {
            $(this).modal($.fn.modal.defaults);
        });
    };

    /**
     * 文章保存
     */
    this.savePost = function () {
        var url = ctx + '/admin/post/savePost/';
        var data = $('#post-form').collectData();
        if (!data.post.content) {
            $.warn('别忙提交，文章内容还没写呢！');
            return;
        }

        data.delTags = [];
        data.addTags = [];

        $('#tag-list .tag').each(function () {
            var checked = $(this).prop('checked');
            var owned = $(this).data('owned');
            var value = $(this).val();

            if (checked && !owned) {
                data.addTags.push(value);
            }

            if (!checked && owned) {
                data.delTags.push(value);
            }

        });

        $.postJSON(url, data, function (json) {
            $.success('保存成功');
            $('#post-input-modal').modal('hide');
            self.queryPostList();
        });
    };

    /**
     * 删除文章
     */
    this.deletePost = function (id, title) {
        $.confirm('删除文章【' + title + '】，是否继续？', function (result) {
            if (result) {
                var url = ctx + '/admin/post/deletePost/?id=' + id;
                $.postJSON(url, {}, function (json) {
                    $.success('删除成功');
                    self.queryPostList();
                });
            }
        });
    };

};

var post = new Post();
