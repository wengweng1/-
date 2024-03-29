﻿var area;
layui.use(['element', 'jquery', 'form', 'layedit', 'flow'], function () {
    var element = layui.element;
    var form = layui.form;
    var $ = layui.jquery;
    var layedit = layui.layedit;
    var flow = layui.flow;
    //留言的编辑器
    var editIndex = layedit.build('remarkEditor', {
        height: 150,
        tool: ['face', '|', 'link'],
    });
    //留言的编辑器的验证
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
/*axios.post(SURL+'type/list',{}).then(function (res){
    // var data = res.data;
    //创建type模板
    var tem=document.getElementById("typeTmp").innerHTML;
    var s=Mustache.render(tem,res);
    document.getElementById("typeDiv").innerHTML=s;
})*/
 
