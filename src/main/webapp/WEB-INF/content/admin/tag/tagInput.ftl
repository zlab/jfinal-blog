<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">标签信息</h4>
        </div>

        <div class="modal-body">
            <form id="tag-form" method="POST" class="form-horizontal">
                <input type="hidden" name="tag.id" value="${(tag.id)!}" datatype="number"/>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">名称</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="tag.name" id="name" value="${(tag.name)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="slug">别名</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="tag.slug" id="slug" value="${(tag.slug)!}"/>
                    </div>
                </div>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-sm" data-dismiss="modal" type="button">
                <i class="ace-icon fa fa-times"></i> 取 消
            </button>

            <button class="btn btn-sm btn-primary" type="button" onclick="$('#tag-form').submit()">
                <i class="ace-icon fa fa-check"></i> 保 存
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#tag-form').validate({
            submitHandler: tag.saveTag
        });
    });
</script>