document.onmousewheel = function () {
    let srcTop = document.documentElement.scrollTop + document.body.scrollTop
    if (srcTop > 800) {
        document.getElementsByTagName("nav")[0].classList.add("nav")
    }else {
        document.getElementsByTagName("nav")[0].classList.remove("nav")
    }
}
let resp = document.body.getElementsByClassName("resp")[0].firstElementChild