"use strict";
//# sourceMappingURL=scrolling.js.map
var listElm = document.querySelector("#infinite-list");
console.log(listElm);
// Add 20 items.
var nextItem = 1;
var loadMore = function () {
    for (var i = 0; i < 10; i++) {
        var item = document.createElement("li");
        item.innerText = "Item " + nextItem++;
        listElm.appendChild(item);
    }
};
// Detect when scrolled to bottom.
listElm.addEventListener("scroll", function () {
    if (listElm.scrollTop + listElm.clientHeight >= listElm.scrollHeight) {
        loadMore();
    }
});
// Initially load some items.
loadMore();
window.onscroll = function () {
    var scrollHeight, totalHeight;
    scrollHeight = document.body.scrollHeight;
    //배정된 전체 스크롤 높이 (body에 의한 고정 값)
    totalHeight = window.scrollY + window.innerHeight;
    //scrollY 는 변화되는 값, 처음 0, 기본적으로 뿌려지는 화면 높이 innerheight
    if (totalHeight >= scrollHeight) {
        this.loadMore();
        console.log("at the bottom");
    }
};
//# sourceMappingURL=scrolling.js.map