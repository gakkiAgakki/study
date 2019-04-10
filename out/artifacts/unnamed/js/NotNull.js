/**
 * 判空与校验
 * Created by HASEE on 2019/3/26.
 */
function checkForm() {

    //校验文章标题
    //获得文章标题文本框的值：
    var title = document.getElementById("title").value;
    if (title == null || title == '') {
        alert("留言标题不能为空！");
        return false;
    }
    var title = document.getElementById("name").value;
    if (title == null || title == '') {
        alert("姓名不能为空！");
        return false;
    }else {
        var reg=/^[\u2E80-\u9FFF]+$/;//Unicode编码中的汉字范围
        if(!reg.test(document.getElementById("name").value)){
            alert("请输入中文名");
            return false;
        }
    }

    var title = document.getElementById("telephone").value;
    if (title == null || title == '') {
        alert("手机号码不能为空！");
        return false;
    }else{
        var myreg = /^1[3|4|5|7|8][0-9]\d{4,8}$/; //手机号校验
        if(!myreg.test(document.getElementById("telephone").value)) {
           alert("手机号码格式有误");
            return false;
        }
    }
    var title = document.getElementById("mail").value;
    if (title == null || title == '') {
        alert("邮箱不能为空！");
        return false;
    }else {
        // var reg =/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
        var reg =/(\S)+[@]{1}(\S)+[.]{1}(\w)+/;
        var bool = reg.test(document.getElementById("mail").value);
        // document.getElementsByClassName("carousel")
        if (bool == false) {
            alert("邮箱格式错误，请重新输入！");
            return false;
        }
    }
    var title = document.getElementById("unit").value;
    if (title == null || title == '') {
        alert("联系单位不能为空！");
        return false;
    }

    //校验文章描述
    //获得文章标题文本框的值：
    var content = document.getElementById("site").value;
    if (content == null || content == '') {
        alert("联系地址不能为空！");
        return false;
    }
    var content = document.getElementById("content").value;
    if (content == null || content == '') {
        alert("留言内容不能为空！");
        return false;
    }
    var content = document.getElementById("verify").value;
    if (content == null || content == '') {
        alert("验证码不能为空！");
        return false;
    }
}

function Checktest(){
    document.getElementById('kanbuq').disabled=true;
    document.getElementById('pic').src='codeServlet?ts='+new Date().getTime();
    document.getElementById('kanbuq').disabled=false;
}
