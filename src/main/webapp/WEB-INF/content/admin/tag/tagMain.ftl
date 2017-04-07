<title>标签管理 &lsaquo; ${options['blog.name']!}</title>

<script type="text/javascript" src="${ctx}/js/admin/tag.js"></script>

<div class="row">
    <div class="col-xs-12">

        <div class="space-4"></div>

        <form id="query-form" class="form-horizontal">
            <div class="form-group">
                <label class="col-sm-3 col-md-1 control-label">标签</label>

                <div class="col-sm-3">
                    <input type="text" class="col-xs-10" name="key">
                </div>

                <button type="button" id="query-btn" class="btn btn-primary btn-white ">
                    <i class="ace-icon fa fa-search"></i> 查 询
                </button>

                <button type="button" class="btn btn-white btn-info reset" onclick="$('#query-form').resetFields()">重
                    置
                </button>

                <button type="button" class="btn btn-white btn-success" onclick="tag.showInput('add')">新 增</button>
            </div>

        </form>

        <div id="tag-list"><#include "tagList.ftl"></div>

        <div id="tag-input-modal" class="modal"></div>
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
    $(function () {
        $('#query-btn').trigger('click');
    });
</script>
