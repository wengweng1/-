

var user,type;
if(localStorage.getItem("token")){
    user=localStorage.getItem("username");
    type=localStorage.getItem("type");
    // console.log(user);
    // console.log(type);
}else {
    console.log("登录no?");
}

let personContent=`
        <a  ${type=='1'?'':'style="display:none"'} target="_blank" href="../../../../LostAndFound/static/X-admin/page/index/index.html" class="item">进入管理员界面</a><br/>
        
        <a href="javascript:;" onclick="loginOut()" class="red">退出</a><br/>
    `;

/**
 * 功能列表
 */
function funList() {
    if(user!=null){
        layer.tips(personContent, "#login", {
            tips: [3, '#ffffff']
        });
    }
}

/**
 * 退出账号
 */


/**
 * 根据用户是否登录修改状态栏
 */
change()
function change() {
    if(user==null){
        return
    }
    var hello_user = document.getElementById("hello_user");
    var content=`
    <a href="logReg.html" class="blog-user" id="login" onmouseover="funList()">
        <!--        <i class="fa fa-qq"></i>-->
        <button class="layui-btn layui-btn-radius" id="000">
        
            ${user}
            <i class="layui-icon layui-icon-more-vertical layui-font-12"></i>
        </button>
    </a>
    `
    hello_user.innerHTML = content;
}