layui.config({
    base: 'dist/sliderVerify/'
}).use(['sliderVerify', 'jquery', 'carousel', 'form'], function(){
    var carousel = layui.carousel,
        form = layui.form,
        sliderVerify = layui.sliderVerify,
        $ = layui.jquery;
    var slider = sliderVerify.render({
        elem: '#slider',
        onOk: function(){//当验证通过回调
            layer.msg("滑块验证通过").style.zIndex = 1000;
        }

    })
    /*var slider2 = sliderVerify.render({
        elem: '#slider2',
        onOk: function(){//当验证通过回调
            layer.msg("滑块验证通过").style.zIndex = 1000;
        }
    })*/
    $('#reset').on('click',function(){
        slider.reset();
    })
    /*$('#reset2').on('click',function(){
        slider2.reset();
    })*/
    //自定义验证规则
    form.verify({
        userName: function(value){
            if(value.length < 3){
                return '账号至少得3个字符';
            }
        },
        check_email:function(value){
            if(value.length < 6){
                return '请输入六位数验证码';
            }
        },
        pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格'],
        reg_userName: function(value){
            if(value.length < 3){
                return '账号至少得3个字符';
            }
        },

        reg_pass: [/^[\S]{6,12}$/,'密码必须6到12位，且不能出现空格'],
        //email: [/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,'请输入正确的邮箱']

        reg_repass: function(value) {
            if ($('#L_pass').val() != $('#L_repass').val()) {
                return '两次密码不一致';
            }
        }
    });

    //监听登录提交
    form.on('submit(login)', function(data){

        if(slider.isOk()){
            //layer.msg(JSON.stringify(data.field));
        }else{
            layer.msg("请先通过滑块验证");
            return false;
        }
        /*layer.alert(JSON.stringify(data.field),{
            title: '最终的提交信息'
        })*/
        /*$('#get_email').click(function(){
             //判断邮箱位置是否为空
             var email = $("#L_email").val();
             if(email==""){
                 layer.msg("请输入邮箱后在验证！");
                 return;
            }
        });*/
        var username=data.field.userName;
        var password=data.field.nuse;

        var values={};
        values.username=username;
        values.password=password;


        axios.post(SURL+'loginIn',values).then(function (res){
            var data=res.data;
            if(data.code==200){
                localStorage.setItem("token",data.token);
                localStorage.setItem("username",data.username);
                localStorage.setItem("type",data.type);

                layer.msg(data.username+",好久不见呀！");
                setTimeout( function() {window.location.href="index.jsp";},2000);
            }else {
                layer.msg("用户名或密码错误！");
                slider.reset();
            }
        })
        return false;
    });

    //监听注册提交
    form.on('submit(register)', function(data){
        // console.log(123123)
        /*if(slider2.isOk()){
            //layer.msg(JSON.stringify(data.field));
        }else{
            layer.msg("请先通过滑块验证");
        }*/
        /*layer.alert(JSON.stringify(data.field),{
            title: '最终的提交信息'
        })*/
        var username=data.field.reg_userName;
        var password=data.field.reg_pass;
        var email=data.field.email;
        var values={};
        values.username=username;
        values.password=password;
        values.email=email;
        var identify=document.getElementById("check_email").value;
        values.identify=identify;
        debugger
        axios.post(SURL+'user/reg',values).then(function (res){
            // console.log(res);
            var datas=res.data;
            if(datas.code==200){
                layer.msg("注册成功，这就去登录吧！");
                setTimeout( function() {window.location.href="logReg.html";},2000);
            }else {
                layer.msg(datas.msg);
                /*slider2.reset();*/
            }
        })
        return false;
    });

    //设置轮播主体高度
    var zyl_login_height = $(window).height()/1.3;
    var zyl_car_height = $(".zyl_login_height").css("cssText","height:" + zyl_login_height + "px!important");


    //Login轮播主体
    carousel.render({
        elem: '#zyllogin'//指向容器选择器
        ,width: '100%' //设置容器宽度
        ,height:'zyl_car_height'
        ,arrow: 'always' //始终显示箭头
        ,anim: 'fade' //切换动画方式
        ,autoplay: true //是否自动切换false true
        ,arrow: 'hover' //切换箭头默认显示状态||不显示：none||悬停显示：hover||始终显示：always
        ,indicator: 'none' //指示器位置||外部：outside||内部：inside||不显示：none
        ,interval: '5000' //自动切换时间:单位：ms（毫秒）
    });

    //监听轮播--案例暂未使用
    carousel.on('change(zyllogin)', function(obj){
        var loginCarousel = obj.index;
    });

    //粒子线条
    $(".zyl_login_cont").jParticle({
        background: "rgba(0,0,0,0)",//背景颜色
        color: "#fff",//粒子和连线的颜色
        particlesNumber:100,//粒子数量
        //disableLinks:true,//禁止粒子间连线
        //disableMouse:true,//禁止粒子间连线(鼠标)
        particle: {
            minSize: 1,//最小粒子
            maxSize: 3,//最大粒子
            speed: 30,//粒子的动画速度
        }
    });

});

function toggleForm(){
    section = document.querySelector('section');
    container = document.querySelector('.container');
    container.classList.toggle('active');
    section.classList.toggle('active');
}

function check_have_email(){
    var email = $("#L_email").val();
    if(email==""){
        layer.msg("请输入邮箱后再获取验证码！");
        return
    }
    var values = {};
    values.email = email;
    layer.msg("验证码正在发送中！请有5~10秒延迟，请稍等~")
    axios.post(SURL+'user/sendEmail',values).then(function (res){
        console.log(res);
        var datas=res.data;
        if(datas.code==200){
            layer.msg("验证码发送成功！请及时查收~");
        }else {
            layer.msg(datas.msg);
        }
    })

}