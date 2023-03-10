layui.use(['element', 'jquery', 'form', 'layedit', 'flow'], function () {
    var element = layui.element;
    var form = layui.form;
    var $ = layui.jquery;
    var layedit = layui.layedit;
    var flow = layui.flow;
    //评论和留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'link'],
    });
    //评论和留言的编辑器的验证
    form.verify({
        content: function (value) {
            value = $.trim(layedit.getContent(editIndex));
            if (value == "") return "请输入内容";
            layedit.sync(editIndex);
        },
        replyContent: function (value) {
            if (value == "") return "请输入内容";
        }
    });
    //回复按钮点击事件
    $('#message-list').on('click', '.btn-reply', function () {
        var targetId = $(this).data('targetid')
            , targetName = $(this).data('targetname')
            , $container = $(this).parent('p').parent().siblings('.replycontainer');
        if ($(this).text() == '回复') {
            $container.find('textarea').attr('placeholder', '回复【' + targetName + '】');
            $container.removeClass('layui-hide');
            $container.find('input[name="targetUserId"]').val(targetId);
            $(this).parents('.message-list li').find('.btn-reply').text('回复');
            $(this).text('收起');
        } else {
            $container.addClass('layui-hide');
            $container.find('input[name="targetUserId"]').val(0);
            $(this).text('回复');
        }
    });
});


//类型的渲染
axios.post(SURL + 'type/list', {}).then(function (res) {
    // var data = res.data;
    //创建type模板
    var tem = document.getElementById("typeTmp").innerHTML;
    var s = Mustache.render(tem, res);
    document.getElementById("typeDiv").innerHTML = s;
})


layui.use('upload', function(){
    let upload = layui.upload;
    let $ = layui.$;
    //执行实例
    let uploadInst = upload.render({
        elem: '#test1' //绑定元素
        ,url: SURL+'post/image' //上传接口
        // ,url: 'http://police.piplong.cn:8085/file/upload/image' //上传接口
        ,done: function(res){
            console.log(res)
            if (res.code === 0){
                layer.msg("上传成功");
                //获得图片的路径
                let src = res.data.src;
                //将图片进行回显
                $("#image").attr("src",src);
                //将图片的地址赋值给 form的隐藏域
                $("#imagePath").attr("value",src);
            }
        }
        ,error: function(){
            //请求异常回调
        }
    });
});

//添加启示信息
function addInfo(){
    //获取到值信息
    var flag=document.getElementById("flag").value;
    var flag=$("input[type='radio']:checked").val();
    //var title=uploadForm.title.value;
    var title=document.getElementById("title").value;
    //var typeName=uploadForm.typeName.value;
    var typeName=document.getElementById("typeName").value;
    debugger
    //var content=uploadForm.content.value;
    var content=document.getElementById("contents").value;
    var upload=document.getElementById("image").getAttribute("src");

    var address=document.getElementById("address").value;
debugger
    //发送信息到后台 发布工作
    var values={};
    values.flag=flag;
    values.title=title;
    values.typeName=typeName;
    values.content=content;
    values.picture=upload;
    values.address=address;
    values.uname=localStorage.getItem("username");


    axios.post(SURL+'post/add', values).then(function(res){
        window.location.href="article.html";
    })

}