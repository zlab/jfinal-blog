<title>参数管理 &lsaquo; ${options['blog.name']!}</title>

<script type="text/javascript" src="${ctx}/js/admin/option.js"></script>

<div class="row">
    <div class="col-xs-12">

        <div class="space-4"></div>

        <ul class="nav nav-tabs padding-18">
            <li class="active"><a data-toggle="tab" href="#info" aria-expanded="true">
                <i class="green ace-icon fa fa-info-circle bigger-120"></i> 基本信息
            </a></li>

            <li class=""><a data-toggle="tab" href="#content" aria-expanded="false">
                <i class="green ace-icon fa fa-pencil-square-o bigger-120"></i> 文章内容
            </a></li>
        </ul>

        <div class="tab-content no-border padding-24">
            <div id="info" class="tab-pane active">
                <div class="profile-user-info profile-user-info-striped">
                    <div class="profile-info-row">
                        <div class="profile-info-name">博客名称</div>

                        <div class="profile-info-value">
                            <span class="editable editable-click" id="blog-name"
                                  data-name="blog.name" data-type="text">${options['blog.name']!}</span>
                        </div>
                    </div>

                    <div class="profile-info-row">
                        <div class="profile-info-name">博客描述</div>

                        <div class="profile-info-value">
                            <span class="editable editable-click" id="blog-desc"
                                  data-name="blog.desc" data-type="text">${options['blog.desc']!}</span>
                        </div>
                    </div>

                    <div class="profile-info-row">
                        <div class="profile-info-name">多说账号</div>

                        <div class="profile-info-value">
                            <span class="editable editable-click" id="ds-shortname"
                                  data-name="ds.shortname" data-type="text">${options['ds.shortname']!}</span>
                        </div>
                    </div>

                    <div class="profile-info-row">
                        <div class="profile-info-name">首页分页大小</div>

                        <div class="profile-info-value">
                            <span class="editable editable-click" id="post-pagesize"
                                  data-name="post.pagesize" data-type="text">${options['post.pagesize']!}</span>
                        </div>
                    </div>

                </div>
            </div>

            <div id="content" class="tab-pane"></div>
        </div>

        <div id="option-input-modal" class="modal"></div>
    </div>
    <!-- /.col -->
</div>
<!-- /.row -->

<!-- page specific plugin scripts -->
<script type="text/javascript">
    $(option.init);
</script>
