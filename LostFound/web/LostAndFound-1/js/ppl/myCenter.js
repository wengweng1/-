layui.use(['jquery'], function () {
    var $ = layui.jquery;
    article.Init($);//初始化共用js

});
var article = {};
article.Init = function ($) {
    //var $ = layui.jquery,
    var slider = 0;
    blogtype();
    //类别导航开关点击事件
    $('.category-toggle').click(function (e) {
        e.stopPropagation();    //阻止事件冒泡
        categroyIn();
    });
    //类别导航点击事件，用来关闭类别导航
    $('.article-category').click(function () {
        categoryOut();
    });
    //遮罩点击事件
    $('.blog-mask').click(function () {
        categoryOut();
    });
    $('.f-qq').on('click', function () {
        window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + $(this).attr("href") + '&sharesource=qzone&title=' + $(this).attr("title") + '&pics=' + $(this).attr("cover") + '&summary=' + $(this).attr("desc") + '&desc=你的分享简述' + $(this).attr("desc"));
    });
    $("body").delegate(".fa-times", "click", function () {
        $(".search-result").hide().empty();
        $("#searchtxt").val("");
        $(".search-icon i").removeClass("fa-times").addClass("fa-search");
    });

    //显示类别导航
    function categroyIn() {
        $('.category-toggle').addClass('layui-hide');
        $('.article-category').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-mask').unbind('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend');
        $('.blog-mask').removeClass('maskOut').addClass('maskIn');
        $('.blog-mask').removeClass('layui-hide').addClass('layui-show');
        $('.article-category').removeClass('categoryOut').addClass('categoryIn');
        $('.article-category').addClass('layui-show');
    }

    //隐藏类别导航
    function categoryOut() {
        $('.blog-mask').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.blog-mask').addClass('layui-hide');
        });
        $('.article-category').on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function () {
            $('.article-category').removeClass('layui-show');
            $('.category-toggle').removeClass('layui-hide');
        });
        $('.blog-mask').removeClass('maskIn').addClass('maskOut').removeClass('layui-show');
        $('.article-category').removeClass('categoryIn').addClass('categoryOut');
    }

    function blogtype() {
        $('#category li').hover(function () {
            $(this).addClass('current');
            var num = $(this).attr('data-index');
            $('.slider').css({'top': ((parseInt(num) - 1) * 40) + 'px'});
        }, function () {
            $(this).removeClass('current');
            $('.slider').css({'top': slider});
        });
        $(window).scroll(function (event) {
            var winPos = $(window).scrollTop();
            if (winPos > 750)
                $('#categoryandsearch').addClass('fixed');
            else
                $('#categoryandsearch').removeClass('fixed');
        });
    }
};

function show(id) {
    var contents = document.getElementById(id).getAttribute("data-tooltip");
    //debugger
    layer.tips(contents, "#" + id + "", {
        tips: [1, '#78BA32']
    });
}

getPost();

var mydata;

function getPost() {
    var value = {};
    value.username = localStorage.getItem("username");
    axios.post(SURL + 'post/queryMyList', value).then(function (response) {

        var data = response.data;
        mydata = response.data;
        //console.log(mydata);
        //console.log(data);
        //获取postlist集合
        var postlist = data.postList;
        //console.log(postlist);
        //渲染数据
        let content = '';
        for (let obj of postlist) {
            var time = obj.ctime;
            var day = time.substring(8, 10);
            var hms = time.substring(11, 19);
            var year = time.substring(0, 4);
            var month = time.substring(5, 7);
            //alert(day);
            content += `
        <section class="article-item zoomIn article">
            <div class="fc-flag">置顶</div>
            <h5 class="title">
                <span >
                    <a ${obj.status == 1 && obj.flag == 0 ? 'style="color: white"' : 'style="display:none;"'} onclick="updatePostStatus(${obj.id})" class="layui-btn layui-btn-radius layui-btn-sm layer-demolist" href="javascript:;" id="test1${obj.id}" onmouseover="show('test1${obj.id}')" data-tooltip="暂未找到">寻物启事</a>
                    <a ${obj.status == 0 && obj.flag == 0 ? 'style="color: white"' : 'style="display:none;"'} onclick="updatePostStatus(${obj.id})" class="layui-btn layui-btn-radius layui-btn-sm layui-btn-normal layer-demolist" href="javascript:;" id="test2${obj.id}" onmouseover="show('test2${obj.id}')" data-tooltip="已经找到">寻物启事</a>
                    <a ${obj.status == 0 && obj.flag == 1 ? 'style="color: white"' : 'style="display:none;"'} onclick="updatePostStatus(${obj.id})" class="layui-btn layui-btn-radius layui-btn-sm layui-btn-warm layer-demolist" href="javascript:;" id="test3${obj.id}" onmouseover="show('test3${obj.id}')" data-tooltip="已经认领">失物招领</a>
                    <a ${obj.status == 1 && obj.flag == 1 ? 'style="color: white"' : 'style="display:none;"'} onclick="updatePostStatus(${obj.id})" class="layui-btn layui-btn-radius layui-btn-sm layui-btn-danger layer-demolist" href="javascript:;" id="test4${obj.id}" onmouseover="show('test4${obj.id}')" data-tooltip="等待认领">失物招领</a>
                </span>
                <a href="detail.html?postId=${obj.id}">${obj.title}</a>
            </h5>
            <div class="time">
                <span class="day">${day}</span>
                <span class="month fs-18">${month}
                <span class="fs-14">月</span></span>
                <span class="year fs-18 ml10">${year}</span>
            </div>
            <div class="content">
            
                <a href="detail.html?postId=${obj.id}" class="cover img-light">
                    <img src="${obj.picture == null || obj.picture == "" ? "image/no.png" : obj.picture}">
                </a>
                <p class="layui-btn layui-btn-primary layui-border-red">地址信息：${obj.address}</p>
                <br>
                <br>
                ${obj.content}
            </div>
            <div class="read-more">
                <a href="detail.html?postId=${obj.id}" class="fc-black f-fwb">查看详情</a>
            </div>
            <aside class="f-oh footer">
                <div class="f-fl tags">
                    <span class="fa fa-tags fs-16"></span>
                    <a class="tag">${obj.typeName}</a>
                </div>
                <div class="f-fl tags">
                    <i class="layui-icon fa fa-tags fs-16">&#xe60e;</i>
                    <a class="tag">${hms}</a>
                </div>
                <div class="f-fl tags" style="color: red">
                    <i class="layui-icon fa fa-tags fs-16 ">&#xe640;</i>
                    <a onclick="deletePost(${obj.id})">删除帖子</a>
                </div>
                <div class="f-fr">           
                    <span class="read">               
                        <i class="fa fa-eye fs-16"></i>               
                        <i class="num">${obj.viewCount}</i>           
                    </span>
                    <span class="ml20">               
                        <i class="fa fa-comments fs-16"></i>               
                        <a href="javascript:void(0)" class="num fc-grey">${obj.counts}</a>           
                    </span>
                </div>
            </aside>
        </section>
            `
        }
        //获取外围div标签
        var mainDiv = document.getElementById("LAY_bloglist");
        mainDiv.innerHTML = content;

        //渲染类型并渲染分类
        var userDiv = document.getElementById("category");

        var userContent = '';
        var user = data.user;
        //个人信息
        {
            document.getElementById("myHead").setAttribute("src", user.photo == null || user.photo == "" ? "image/no.png" : user.photo);
            document.getElementById("reward_code").setAttribute("src", user.rewardCode == null || user.rewardCode == "" ? "image/no.png" : user.rewardCode);
            document.getElementById("username").innerHTML = user.username;
            document.getElementById("Email").innerHTML = user.email;
            document.getElementById("sex").innerHTML = user.sex;
            document.getElementById("age").innerHTML = user.age;
            document.getElementById("personalSay").innerHTML = user.personalSay;
            document.getElementById("phone").innerHTML = user.phone;
            document.getElementById("lastTime").innerHTML = user.lastTime;
            document.getElementById("myHead2").setAttribute("src", user.photo == null || user.photo == "" ? "image/no.png" : user.photo);
            document.getElementById("username2").innerHTML = user.username;
            document.getElementById("Email2").innerHTML = user.email;
            document.getElementById("sex2").innerHTML = user.sex;
            document.getElementById("age2").innerHTML = user.age;
            document.getElementById("personalSay2").innerHTML = user.personalSay;
            document.getElementById("phone2").innerHTML = user.phone;
            document.getElementById("lastTime2").innerHTML = user.lastTime;
        }
        userDiv.innerHTML = userContent;

        //获取外围div标签
        var mainDiv = document.getElementById("LAY_bloglist");
        mainDiv.innerHTML = content;
    }).catch(function (error) {

    });
}

//修改帖子状态
function updatePostStatus(pid) {
    var user = mydata.user;
    var content;
    content = `
            <form class="layui-form"  method="post">
    
                <div class="layui-form-item" style="padding-top: 10px">
                    <label class="layui-form-label">帖子状态:</label>
                    <div class="layui-input-block" style="width: 250px;">
                      <select id="newStatus" lay-verify="required">
                        <option value="0">已完成</option>
                        <option value="1">进行中</option>
                      </select>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button class="layui-btn" lay-submit lay-filter="saveBtn" type="button" onclick="editPostInfo(${pid})">
                        保存修改
                    </button>
                </div>
            </form>
            <script>
                layui.use('form', function() { //此段代码必不可少
                    var form = layui.form;
                    form.render();
                });
             </script>

    `
    layer.open({
        type: 1,
        skin: 'layui-layer-demo', //样式类名
        closeBtn: 1, //不显示关闭按钮
        anim: 2,
        area: ['450px', '250px'], //宽高
        shadeClose: true, //开启遮罩关闭
        content: content
    });
}

//编辑个人信息回显
function showMe() {
    var user = mydata.user;
    var content;
    content = `
    <div class="layui-fluid">
        <div class="layui-row">
            <form class="layui-form"  method="post">
    
                <div class="layui-form-item" style="padding-top: 10px">
                    <label for="username" class="layui-form-label">
                        用户名
                    </label>
                    <div class="layui-input-inline">
                        <input id="ages" type="text" autocomplete="off" disabled name="username" 
                        style="cursor: not-allowed !important;" lay-verify="required" value="${user.username}" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>用户名无法更改
                    </div>
                </div>
                
                
                
                <!--<div class="layui-form-item">
                    <label for="username" class="layui-form-label">
                        性    别
                    </label>
                    <div class="layui-input-inline">
                        <input type="radio" name="sex" value="0"  title="男" autocomplete="off">
                        <div class="layui-unselect layui-form-radio ">
                            <i class="layui-anim layui-icon "></i>
                            <div>男</div>
                        </div> 
                        <input type="radio" name="sex" value="1" title="女"  autocomplete="off">
                        <div class="layui-unselect layui-form-radio layui-form-radioed">
                            <i class="layui-anim layui-icon layui-anim-scaleSpring""></i>
                            <div>女</div>
                        </div> 
                    </div> 
                </div>-->
                  
                <div class="layui-form-item" >
                    <label for="age" class="layui-form-label">
                        年    龄
                    </label>
                    <div class="layui-input-inline">
                        <input id="age" type="number" name="age" lay-verify="required" age="${user.age == null || user.age === "" ? "" : user.age}" value="${user.age == null || user.age === "" ? "" : user.age}" class="layui-input">
                        
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>担心隐私泄露可不填
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">个性签名</label>
                    <div class="layui-input-block">
                        <textarea name="personalSay" class="layui-textarea" id="write" placeholder="个性签名"></textarea>
                        <script> document.getElementById("write").value="${user.personalSay == null || user.personalSay === "" ? "" : user.personalSay}"</script>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-form-item ">
                        <label class="layui-form-label">上传按钮</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn layui-btn-danger" id="photo">
                                <i class="layui-icon">&#xe67c;</i>上传头像
                            </button>
                        </div>
                    </div>
                    <div class="layui-form-item ">
                        <label class="layui-form-label">图片预览</label>
                        <div class="layui-input-block">
                            <img id="myPhoto" style="width: 150px;" src="${user.photo == null || user.photo == "" ? "image/no.png" : user.photo}">
                        </div>
                    </div>
                </div>
                
                <div class="layui-form-item">
                    <div class="layui-form-item ">
                        <label class="layui-form-label">上传按钮</label>
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn layui-btn-normal" id="rewardCode">
                                <i class="layui-icon">&#xe67c;</i>上传赞赏码
                            </button>
                        </div>
                    </div>
                    <div class="layui-form-item ">
                        <label class="layui-form-label">图片预览</label>
                        <div class="layui-input-block">
                            <img id="myRewardCode" style="width: 150px;" src="${user.rewardCode == null || user.rewardCode == "" ? "image/no.png" : user.rewardCode}">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <button class="layui-btn" lay-submit lay-filter="saveBtn" type="button" onclick="editUserInfo()">
                        保存信息
                    </button>
                </div>
            </form>
        </div>
    </div>
    <script>
        //头像上传
        layui.use('upload', function(){
            let upload = layui.upload;
            let $ = layui.$;
            //执行实例
            let uploadInst = upload.render({
                elem: '#photo' //绑定元素
                ,url: SURL+'post/image' //上传接口
                ,done: function(res){
                    if (res.code == 0){
                        layer.msg("上传成功");
                        //获得图片的路径
                        let src = res.data.src;
                        //将图片进行回显
                        $("#myPhoto").attr("src",src);
                        //将图片的地址赋值给 form的隐藏域
                        $("#imagePath").attr("value",src);
                    }
                }
                ,error: function(){
                    //请求异常回调
                }
            });
        });
        
        //赞赏码上传
        layui.use('upload', function(){
            let upload = layui.upload;
            let $ = layui.$;
            //执行实例
            let uploadInst = upload.render({
                elem: '#rewardCode' //绑定元素
                ,url: SURL+'post/image' //上传接口
                ,done: function(res){
                    if (res.code == 0){
                        layer.msg("上传成功");
                        //获得图片的路径
                        let src = res.data.src;
                        //将图片进行回显
                        $("#myRewardCode").attr("src",src);
                        //将图片的地址赋值给 form的隐藏域
                        $("#imagePath").attr("value",src);
                    }
                }
                ,error: function(){
                    //请求异常回调
                }
            });
        });
    </script>
    `
    layer.open({
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['500px', '600px'], //宽高
        content: content,
    });
}

//删除帖子
function deletePost(postId) {
    layer.confirm('确定删除帖子吗？', function () {
        //获取要删除记录的id集合
        var values = {};
        values.id = postId;
        axios.post(SURL + 'post/deletePostById', values).then(function (response) {
            if (response.status == 200) {
                layer.msg("删除成功");
                // 刷新主页面 table一块
                setTimeout(function () {
                    window.location.href = "myCenter.html";
                }, 1500);
            }
        }).catch(function (error) {
            layer.msg("删除失败！");
        })
    });
}

/**
 * 编辑提交工作
 */
function editUserInfo() {
    //获取到值信息
    var age = document.getElementById("age").age;
    var personalSay = document.getElementById("write").value;
    var upload = document.getElementById("myPhoto").getAttribute("src");

    var upload2 = document.getElementById("myRewardCode").getAttribute("src");
    //发送信息到后台 发布工作
    var values = {};
    values.username = localStorage.getItem("username");
    // values.age = age;
    values.personalSay = personalSay;
    values.photo = upload;
    values.rewardCode = upload2;
    debugger

    axios.post(SURL + 'user/edit', values).then(function (res) {
        if(res.data.code==200){
            layer.msg("个人资料编辑成功");
            setTimeout( function() {window.location.href="myCenter.html";},2000);
        }else{
            layer.msg(res.data.msg+",请联系管理员！");
        }


    })
}

/**
 * 编辑帖子状态
 */
function editPostInfo(pid) {
    var postId = pid;
    var status = document.getElementById("newStatus").value;
    var values = {};
    values.id = postId;
    values.status = status;
    axios.post(SURL + 'post/updateStatus', values).then(function (res) {
        if (res.status == 200) {
            layer.msg("修改成功！");
            setTimeout(function () {
                window.location.href = "myCenter.html";
            }, 2000);
        } else {
            layer.msg("修改失败！请联系管理员");
        }
    }).catch(function (error) {
        layer.msg("修改失败！请联系管理员");
    })
}

function editPassword() {
    var user = mydata.user;
    var content;
    content = `
    <div class="layui-fluid">
        <div class="layui-row">
            <form class="layui-form" lay-filter="editPass">
    
                <div class="layui-form-item" style="padding-top: 10px">
                    <label for="oldPassword" class="layui-form-label">
                        原 密 码    
                    </label>
                    <div class="layui-input-inline">
                        <input id="oldPassword" type="password" name="oldPassword" lay-verify="oldPassword" autocomplete="off" class="layui-input" placeholder="原密码">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>请输入原密码
                    </div>
                </div>
                
                <div class="layui-form-item" style="padding-top: 10px">
                    <label for="newPassword1" class="layui-form-label">
                        新 密 码    
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="L_pass" name="reg_pass" lay-verify="reg_pass" autocomplete="off" class="layui-input" placeholder="新密码">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>请输入新密码
                    </div>
                </div>
                
                <div class="layui-form-item" style="padding-top: 10px">
                    <label for="L_repass" class="layui-form-label">
                        确认密码    
                    </label>
                    <div class="layui-input-inline">
                        <input type="password" id="L_repass" name="reg_repass" lay-verify="reg_repass" autocomplete="off" class="layui-input" placeholder="确认密码">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>请确认两次输入一致
                    </div>
                </div>

                <div class="layui-form-item">
                    <label for="L_repass" class="layui-form-label">
                    </label>
                    <input value="更新密码" class="layui-btn" type="submit" lay-filter="updatePassword" lay-submit>

                </div>
            </form>
        </div>
    </div>
    `
    layer.open({
        type: 1,
        skin: 'layui-layer-rim', //加上边框
        area: ['500px', '300px'], //宽高
        content: content,
    });
}

/*function updatePassword(){
    var oldPassword = document.getElementById("oldPassword").value;
    var newPassword1 = document.getElementById("newPassword1").value;
    var newPassword2 = document.getElementById("newPassword2").value;
    debugger
    //发送信息到后台 发布工作
    var values = {};
}*/
layui.use(['form', 'layer', 'jquery'],
    function () {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            oldPassword: function (value) {
                if (value.length < 6) {
                    return '请输入正确长度的密码哦！';

                }
            },
            pass: [/(.+){6,12}$/, '新密码必须6到12位'],
            newPassword2: function (value) {
                if ($('#newPassword1').val() != $('#newPassword2').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(updatePassword)', function (data) {
            // console.log(data);
            //发异步，把数据提交给后台
            var values = {};
            values.username = localStorage.getItem("username");
            // values.age = age;
            values.oldPassword = data.field.oldPassword;
            values.newPassword = data.field.reg_pass;
            // console.log(values)

            axios.post(SURL + 'user/updatepwd', values).then(function (res) {
                if(res.data.code==200){
                    layer.msg("账号密码修改成功,请重新登录！");
                    localStorage.clear();
                    setTimeout( function() {window.location.href="logReg.html";},2000);
                }else{
                    layer.msg(res.data.msg+"若忘记密码，请联系管理员！");
                }

            })
            return false;
        });

    }
);
