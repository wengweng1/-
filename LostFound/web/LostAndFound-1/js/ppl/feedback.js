layui.use(['layedit'], function(){
    var comment="";
    layui.use(['layedit'], function(){
        var $ = layui.$,
            layedit = layui.layedit;
        var lb
        // 初始化编辑框
        initText();
        function initText() {
            lb = layedit.build('contents', {tool: [
                    'face' //表情
                    ,'|' //分割线
                    ,'link' //超链接
                    ,'help' //帮助

                ],height: 150});
        }

        // 帖子一级评论
        window.toFeedBack = function (obj){

            comment = layedit.getContent(lb);
            /*debugger
            alert(comment)*/
            //向后台发布请求，实现发布功能处理
            var datas={};
            /*datas.postId=postId;*/
            datas.content=comment;
            datas.title=document.getElementById('title').value;
            datas.uname=localStorage.getItem("username");
            //var parentId=document.getElementById("parentIds").getAttribute("value");
            //alert(parentId);
            //alert(comment);

            axios.post(SURL+'feedback/add',datas).then(function (res){

                if(res.code==200){
                    $("#remarkEditor").val('');
                    layer.msg("反馈成功！感谢您宝贵的建议~")
                    setTimeout( function() {location.reload();},2000);
                }else {
                    layer.msg(res.code.msg)
                }

            })

            // location.reload();
        }
        return false;

    });

});