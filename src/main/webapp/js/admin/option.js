function Option() {
    var self = this;

    this.init = function () {
        $.fn.editable.defaults.mode = 'inline';
       // $.fn.editable.defaults.onblur = 'ignore';
       // $.fn.editable.defaults.placement = 'bottom';
        //$.fn.editableform.loading = "<div class='editableform-loading'><i class='ace-icon fa fa-spinner fa-spin fa-2x light-blue'></i></div>";
        $.fn.editableform.buttons = '<button type="submit" class="btn btn-info editable-submit">' +
        '<i class="ace-icon fa fa-check"></i></button>' +
        '<button type="button" class="btn editable-cancel"><i class="ace-icon fa fa-times"></i></button>';

        $('#blog-name').editable({
            validate: function (value) {
                if ($.isBlank(value)) {
                    return '博客名称不能为空';
                }
            },
            success: self.saveOption
        });

        $('#blog-desc').editable({
            inputclass: 'blog-desc-input',
            validate: function (value) {
                if ($.isBlank(value)) {
                    return '博客描述不能为空';
                }
            },
            success: self.saveOption
        });

        $('#ds-shortname').editable({
            validate: function (value) {
                if ($.isBlank(value)) {
                    return '多说账号不能为空';
                }
            },
            success: self.saveOption
        });

        $('#post-pagesize').editable({
            validate: function (value) {
                if ($.isBlank(value)) {
                    return '分页大小不能为空';
                }
            },
            success: self.saveOption
        });
    }

    /**
     * 保存
     */
    this.saveOption = function (response, newValue) {
        var el = this;
        var url = ctx + '/admin/option/saveOption/';
        var data = {
            name: $(el).data('name'),
            value: newValue
        };

        $.postJSON(url, data, function (json) {
            $.success('保存成功');
            $(el).editable('setValue', newValue);
            $(el).editable('hide');
        });

        return false;
    };
};

var option = new Option();
