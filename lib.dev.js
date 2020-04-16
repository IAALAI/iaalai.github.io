console.log('%c IAALAI', 'color: #7ee777;font-size: 30px');

function Sele(Elements, Strings) {
    if (Elements.constructor != HTMLCollection) {
        console.error("ERROR,the type a is wrong");
        return null
    }
    if (Strings.constructor != String) {
        console.error("ERROR,the type r is wrong");
        return null
    }
    for (var temp = 0; temp < Elements.length; temp++) {
        Elements[temp].onmouseover = function () {
            this.classList.add(Strings)
        };
        Elements[temp].onmouseout = function () {
            this.classList.remove(Strings)
        }
    }
}
function Oncl(Elements, func) {
    if(func != Function) {
        console.error("error,the type r is wrong")
    };
    if(Elements.constructor == HTMLCollection) {
        for(var a = 0;a < Elements.length;a++) {
            Elements[a].onclick = func 
        }
    }else{
        Elements.onclick = func
    }// 请尽可能传入元素合集，以防止出现问题
}