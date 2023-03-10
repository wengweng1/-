layui.use(['jquery', 'util'], function () {
    var $ = layui.jquery,
        util = layui.util;
    $(window).load(function () {
        $("#loading").fadeOut(500);
        new WOW().init();
    })
    util.fixbar();;
    $('.next').click(function () {
        $('html,body').animate({
            scrollTop: $('#section1').outerHeight() + 1
        }, 600);
    });
    $('#menu').on('click', function () {
        var mark = $(this).attr('data-mark');
        if (mark === 'false') {
            $(this).removeClass('menu_open').addClass('menu_close');
            //open
            $('#navgation').removeClass('navgation_close').addClass('navgation_open');
            $(this).attr({ 'data-mark': "true" });
        } else {
            $(this).removeClass('menu_close').addClass('menu_open');
            //close
            $('#navgation').removeClass('navgation_open').addClass('navgation_close');
            $(this).attr({ 'data-mark': "false" });
        }
    });

});

axios.post(SURL + 'post/queryTopList').then(function (res){
    var data = res.data;
    var postTopList = data.postTopList;
    let content = '';
    for (let obj of postTopList){
        content+=`
            <div class="layui-col-xs12 layui-col-sm4 layui-col-md4  wow fadeInUp" style="padding: 0 10px">
                <div class="single-news">
                
                    <div class="news-head">
                    <div class="fc-flag">置顶</div>
                        <img src="${obj.picture == null || obj.picture == "" ? "image/no.png" : obj.picture}">
                        <a href="detail.html?postId=${obj.id}" class="link"><i class="fa fa-link"></i></a>
                    </div>
                    <div class="news-content">
                        <h4>
                            <a href="#">
                                ${obj.title}
                            </a>
                        </h4>
                        <div class="date">
                            ${obj.ctime}
                        </div>
                        <p>
                            ${obj.content}
                        </p>
                        <a href="detail.html?postId=${obj.id}" class="btn">
                            查看详情 
                        </a>
                    </div>
                </div>
            </div>
        `
    }
    var indexList = document.getElementById("indexList");
    indexList.innerHTML = content;
});