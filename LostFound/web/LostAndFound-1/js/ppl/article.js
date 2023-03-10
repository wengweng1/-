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

getPost();

function show(id) {
    var contents = document.getElementById(id).getAttribute("data-tooltip");
    layer.tips(contents, "#" + id + "", {
        tips: [1, '#78BA32']
    });
}
/*var user,type;
if(localStorage.getItem("token")){
    user=localStorage.getItem("username");
    type=localStorage.getItem("type");
    //console.log(user);
    //console.log(type);
}else {
    console.log("登录no?");
}

let personContent=`
        <a  ${type=='1'?'':'style="display:none"'} href="../../../../LostAndFound/X-admin/page/index/index.jsp" class="item">进入管理员界面</a><br/>
        
        <a href="javascript:;" onclick="loginOut()" class="red">退出</a><br/>
    `;*/
//高级查询
function selectPost(){
    var title=$('#searchtxt').val();
    getPost(null,null,null,title);
    debugger
}
function getPost(flag, status, type, title) {
    var values = {};
    if (flag != null) {
        values.flag = flag;
        values.status = status;
    }

    if (type != null) {
        values.typeName = type;
    }
    if (title != null) {
        values.title = title;
    }
    let SURL;
    axios.post(SURL + 'post/queryIndexList', values).then(function (response) {

        var data = response.data;
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
            <div class="fc-flag">${obj.typeName}</div>
            <h5 class="title" >
                <span >
                    <a ${obj.status == 1 && obj.flag == 0 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layer-demolist" href="javascript:;" id="test1${obj.id}" onmouseover="show('test1${obj.id}')" data-tooltip="暂未找到">寻物启事</a>
                    <a ${obj.status == 0 && obj.flag == 0 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-normal layer-demolist" href="javascript:;" id="test2${obj.id}" onmouseover="show('test2${obj.id}')" data-tooltip="已经找到">寻物启事</a>
                    <a ${obj.status == 0 && obj.flag == 1 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-warm layer-demolist" href="javascript:;" id="test3${obj.id}" onmouseover="show('test3${obj.id}')" data-tooltip="已经认领">失物招领</a>
                    <a ${obj.status == 1 && obj.flag == 1 ? 'style="color: white"' : 'style="display:none;"'}  class="layui-btn layui-btn-radius layui-btn-sm layui-btn-danger layer-demolist" href="javascript:;" id="test4${obj.id}" onmouseover="show('test4${obj.id}')" data-tooltip="正在寻找">失物招领</a>
                
                </span>
                    
                
                <a href="detail.html?postId=${obj.id}" target="_blank">${obj.title}</a>
            </h5>
            <div class="time">
                <span class="day">${day}</span>
                <span class="month fs-18">${month}
                <span class="fs-14">月</span></span>
                <span class="year fs-18 ml10">${year}</span>
            </div>
            <div class="content">
            
                <a href="detail.html?postId=${obj.id}" target="_blank" class="cover img-light">
                    <img src="${obj.picture == null || obj.picture == "" ? "image/no.png" : obj.picture}">
                </a>
                <p class="layui-btn layui-btn-primary layui-border-red">地址信息：${obj.address}</p>
                <br>
                <br>
                ${obj.content}
            </div>
            <div class="read-more">
                <a href="detail.html?postId=${obj.id}" class="fc-black f-fwb" target="_blank">查看详情</a>
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
        //标签的渲染
        var bqDiv = document.getElementById("bqDiv");
        var bqContent = `
       <div class="layui-input-inline" style="margin-bottom: 10px;margin-right: 10px">
       <button href="javascript:void(0)" type="button" onclick="getPost(1,1)" class="layui-btn layui-btn-primary layui-border-red" >
          正在寻找 ${data.find}
       </button>
       <a href="javascript:void(0)" onclick="getPost(1,0)" class="layui-btn layui-btn-primary layui-border-orange" >
           已经找到 ${data.find_ok}
       </a>
       </div>
       <div class="layui-input-inline" style="margin-bottom: 10px;margin-right: 10px">
       <a href="javascript:void(0)" onclick="getPost(0,1)" class="layui-btn layui-btn-primary layui-border-green" >
           等待认领 ${data.lost}
       </a>
       <a href="javascript:void(0)" onclick="getPost(0,0)" class="layui-btn layui-btn-primary layui-border-green" >
           已被认领 ${data.lost_ok}
       </a>
        </div>`;

        bqDiv.innerHTML = bqContent;
        //渲染类型并渲染分类
        var typeDiv = document.getElementById("category");

        var typeContent = '';
        typeContent += `<li data-index="0" class="slider"></li><li data-index="1"><a href="javascript:void(0)" onclick="getPost()">全部帖子 : ${postlist.length}</a></li>`;
        var index = 2;
        var typeList = data.typeList;
        for (let type of typeList) {
            name = type.typeName;
            typeContent += `
           <li data-index="${index}">
               <a href="javascript:void(0)" onclick="getPost(null,null,'${name}')">
                   ${type.typeName} : ${type.counts}
               </a>
           </li>`
            index++;
        }
        typeDiv.innerHTML = typeContent;

        //获取外围div标签
        var mainDiv = document.getElementById("LAY_bloglist");
        mainDiv.innerHTML = content;

    }).catch(function (error) {

    });
}

/**
 * 功能列表
 */
/*function funList() {
    if(user!=null){
        layer.tips(personContent, "#login", {
            tips: [3, '#ffffff']
        });
    }
}*/

/**
 * 退出账号
 */
/*
function loginOut(){
    localStorage.clear();
    window.location.href="../../../../LostAndFound/X-client/logReg.html";
}
*/
