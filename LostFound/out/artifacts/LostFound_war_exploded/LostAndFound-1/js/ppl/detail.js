//接收postId
var postId = getQueryString("postId");
var values = {};
values.postId = postId;
function show(id) {
    var contents = document.getElementById(id).getAttribute("data-tooltip");
    layer.tips(contents, "#" + id + "", {
        tips: [2, '#78BA32']
    });
}
let tem='';
function show2(id) {
    var contents = document.getElementById(id).getAttribute("data-tooltip");
    layer.tips(tem, "#" + id + "", {
        tips: [2, '#0e1308']
    });

}
axios.post(SURL + 'post/queryCommentList', values).then(function (res) {
    var data = res.data;
    console.log(data);

    //帖子评论框渲染
    var postId=data.id;
    document.getElementById("postReplyId").setAttribute("data-postid",postId);
    //个人信息渲染
    var userData = data.user;
    tem = `
        <div class="comment-child"><img src="${data.user.photo}"/></div>
        <span style="color: #afb2af">性别：</span>${data.user.sex}</br>
        <span style="color: #afb2af">邮箱：</span>${data.user.email}</br>
        <span style="color: #afb2af">联系电话：</span>${data.user.phone}</br>
        <span style="color: #afb2af">个性签名：</span>${data.user.personalSay}</br>
        
        <div style="width: 30px; "><img src="${data.user.rewardCode}"/></div>
        
    `

    /*var parentId=null;
    document.getElementById("postReply").setAttribute("data-parentid",parentId);
    var parentName=null;
    document.getElementById("postReply").setAttribute("data-parentName",parentName);



    // 评论区数据渲染
    //引入评论信息的模板
    var template = document.getElementById("personInfo").innerHTML;
    var view = Mustache.render(template, data);

    document.getElementById("message-list").innerHTML = view;*/

    var commentList = data.commentList;
    // console.log(data);
    var message_list = document.getElementById("message-list");
    let content = '';
    for (let obj of commentList){
        content +=`
        <li class="zoomIn article">
            <div class="comment-parent">
                <a name="remark-1"></a>
                <img src="${obj.photo}"/>
                <div class="info">
                    <span class="username">${obj.uname}</span>
                </div>
                <div class="comment-content"> 
                    ${obj.content}
                </div>
                <p class="info info-footer">
                    <span class="comment-time">${obj.ctime}</span>
                    <a href="javascript:;" class="btn-reply"
                        data-targetid="${obj.id}" data-targetname="${obj.uname}"
                        id="${obj.id}id" >回复</a>
                </p>
            </div>
        `
        var list=obj.list;
        for (let objs of list){
            content+=`
            <hr/>
            <div class="comment-child">
                <a name="reply-1"></a>
                <img src="${objs.photo}">
                <div class="info">
                    <span class="username">${objs.uname}</span>
                    <span style="padding-right:0;margin-left:-5px;">回复</span>
                    <span class="username">${objs.parentName}</span>
                    <span>：${objs.content}</span>
                </div>
                <p class="info">
                    <!--<i class="fa fa-map-marker" aria-hidden="true"></i>
                    <span>四川</span>-->
                    <span class="comment-time">${objs.ctime}</span>
                    <a href="javascript:;" class="btn-reply"
                        data-targetid="${objs.id}" data-targetname="${objs.uname}" id="${objs.id}id"
                    >回复</a>
                </p>
            </div>
            `
        }
        content+=`
        <div class="replycontainer layui-hide">
            <form class="layui-form" action="">
                <input type="hidden" name="remarkId" value="1">
                <input type="hidden" name="targetUserId" value="0" id="${obj.id}" date-value="${obj.id}">
                <div class="layui-form-item">
                    <textarea name="replyContent" lay-verify="replyContent" placeholder="请输入回复内容"
                              class="layui-textarea" id="comment${obj.id}" style="min-height:80px;"></textarea>
                </div>
                <div class="layui-form-item">
                    <a class="layui-btn layui-btn-xs" data-parentid="${obj.id}"
                     onclick="commentReply(${obj.id})">
                        提交
                    </a>
                </div>
            </form>
        </div>
        </li>
        `
    }
    message_list.innerHTML = content;

    // 帖子详情渲染
    var time = data.ctime;
    var day = time.substring(8, 10);
    var hms = time.substring(11, 19);
    var year = time.substring(0, 4);
    var month = time.substring(5, 7);
    $("#day").html(day);
    $("#year").html(year);
    $("#month").html(month);

    $("#content").html(data.content);
    $("#picture").attr("src",data.picture);
    // $("#username").html(data.uname);
    //$("#uname").html('<a className="layui-btn layui-btn-radius layui-btn-sm layer-demolist" href="javascript:;" id="user'+data.user.id+'" onMouseOver="'+show("user"+data.user.id)+'" data-tooltip="暂未找到">'+data.user.username+'</a>');
    var userContent=`
        作者：
        <a href="javascript:;" data-method="offset" data-type="t" class="fc-link" id="u${data.user.id}" onmouseover="show2('u${data.user.id}')" >
            ${data.user.username}
        </a>
    `
    var username = document.getElementById("username");
    username.innerHTML = userContent;
    $("#typename").html(data.typeName);
    $("#title").html(data.title);
    $("#address").html('<i class="layui-icon">&#xe715;</i>&nbsp;&nbsp;'+data.address);
    $("#ctime").html(data.ctime);
    $("#viewCount").html(data.viewCount);
    $("#counts").html(data.counts);
    $("#bigphoto").attr("src", "image/no.png");
    // $("#photo").attr("src", data.photo);

    // 帖子状态
    var flagDiv = document.getElementById("flagDiv");
    let con = `
		<a ${data.status == 1 && data.flag == 0 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layer-demolist" href="javascript:;" id="test1${data.id}" onmouseover="show('test1${data.id}')" data-tooltip="暂未找到">寻物启事</a>
        <a ${data.status == 0 && data.flag == 0 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-normal layer-demolist" href="javascript:;" id="test2${data.id}" onmouseover="show('test2${data.id}')" data-tooltip="已经找到">寻物启事</a>
        <a ${data.status == 0 && data.flag == 1 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-warm layer-demolist" href="javascript:;" id="test3${data.id}" onmouseover="show('test3${data.id}')" data-tooltip="已经认领">失物招领</a>
        <a ${data.status == 1 && data.flag == 1 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-danger layer-demolist" href="javascript:;" id="test4${data.id}" onmouseover="show('test4${data.id}')" data-tooltip="正在寻找">失物招领</a>

    `;
    flagDiv.innerHTML = con;


})

function HTMLEncode(html) {
    var temp = document.createElement("div");
    (temp.textContent != null) ? (temp.textContent = html) : (temp.innerText = html);
    var output = temp.innerHTML;
    temp = null;
    return output;
}

//获取条件 对应的值信息
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return decodeURI(r[2]);
    return null;
}
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
        window.postReply = function (obj){
            comment = layedit.getContent(lb);
            // var ppl=comment.replace( /http:\/\/localhost*？\/X-client\/ /, '' );
            // var ppl=comment.replaceAll("/http:[^%]*X-client/", "");
            //
            // 你好<img src="http://localhost:1241/LostAndFound/X-client/layui/images/face/2.gif" alt="[哈哈]">
            // console.log("comment："+ppl)
            //
            // debugger
            // comment=HTMLEncode(comment);
            /*debugger
            alert(comment)*/
            //向后台发布请求，实现发布功能处理
            var datas={};
            datas.postId=postId;
            datas.content=comment;
            datas.uname=localStorage.getItem("username");
            //var parentId=document.getElementById("parentIds").getAttribute("value");
            //alert(parentId);
            //alert(comment);
            axios.post(SURL+'comment/add',datas).then(function (res){
                if(res.code==200){
                    $("#remarkEditor").val('');
                    location.reload();
                }
            })
            location.reload();
        }


    });
});
var string="this is the beginning, this is what i want to remove/ and this is the end"
string = string.replace( /,.*?\//, '' );
function commentReply(obj){
    //var parentd= $("input[name='targetUserId']").values();
    //var parentId=document.getElementById("parentIds").getAttribute("date-value");
    var parentIds =obj;

    //var parentId=document.getElementById("parentIds").getAttribute("date-value");
    var flagId=document.getElementById(parentIds).getAttribute("value");
    var parentName=document.getElementById(flagId+"id").getAttribute("data-targetname");
    var comment = document.getElementById("comment"+parentIds).value;
    //var comment = $("#comment").val();
    // var comment2 = $("#demo").val();
    //var comment = $("textarea[name='replyContent']").val();
    //var comment = document.getElementById('remarkEditor').value;
    //向后台发布请求，实现发布功能处理
    var datas={};
    datas.postId=postId;
    datas.content=comment;
    datas.parent=parentIds;
    datas.parentName=parentName;
    datas.uname=localStorage.getItem("username");
    //alert(comment);
    axios.post(SURL+'comment/add',datas).then(function (res){
        debugger
        if(res.code==200){
            //$("#remarkEditor").val('');
            debugger
            location.reload();
        }
    })
    location.reload();
}


/*var post_id;

function reflushComment(obj) {
    var postId = $(obj).data('postid');
    var parentId = $(obj).data('parentid');
    post_id=postId;
    var parentName = $(obj).data('parentName');
    var comment = $("#remarkEditor").val();

    //向后台发布请求，实现发布功能处理
    var datas={};
    datas.postId=postId;
    datas.parent=parentId;
    datas.parentName=parentName;
    datas.content=comment;

    /!*axios.post(SURL+'comment/add',datas).then(function (res){

    })*!/
}*/

// 帖子二级评论
function reflushComment(obj){
    var comment = $("#comment").val();
    var parentName = $(obj).data('data-parentName');
    var parent = $(obj).data('data-parentId');
    // var comment2 = $("#demo").val();
    //var comment = $("textarea[name='comment']").val();
    //var comment = document.getElementById('remarkEditor').value;
    debugger
    //向后台发布请求，实现发布功能处理
    var datas={};
    datas.postId=post_id;
    datas.content=comment;
    datas.parentName=parentName;
    datas.parent=parent;
    //alert(comment);
    axios.post(SURL+'comment/add',datas).then(function (res){
        if(res.code==200){
            $("#comment").val('');
            location.reload();
        }
    })
    location.reload();
}

