<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="blue bigger">分类目录信息</h4>
        </div>

        <div class="modal-body">
            <form id="category-form" method="POST" class="form-horizontal">
                <input type="hidden" name="category.id" value="${(category.id)!}" datatype="number"/>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="name">名称</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="category.name" id="name"
                               value="${(category.name)!}"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label" for="slug">别名</label>

                    <div class="col-sm-8">
                        <input type="text" class="col-xs-12 required" name="category.slug" id="slug"
                               value="${(category.slug)!}"/>
                    </div>
                </div>
            </form>
        </div>

        <div class="modal-footer">
            <button class="btn btn-sm" data-dismiss="modal" type="button">
                <i class="ace-icon fa fa-times"></i> 取 消
            </button>

            <button class="btn btn-sm btn-primary" type="button" onclick="$('#category-form').submit()">
                <i class="ace-icon fa fa-check"></i> 保 存
            </button>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#category-form').validate({
            submitHandler: category.saveCategory
        });
    });
</script>