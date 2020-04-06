"use strict";
class Test {
    constructor(current, imgs) {
        // elem.style.opacity = opacity;
        current.style.opacity = opacity;
        imgs[0].style.opacity = opacity;
    }
}
let elem = document.querySelector("#test");
const opacity = "0.6";
const current = document.querySelector("#current");
const imgs = document.querySelectorAll(".imgs img");
let test = new Test(current, imgs);
//Set first img opcity
imgs[0].style.opacity = opacity;
imgs.forEach(img => img.addEventListener("click", imgClick));
function imgClick(e) {
    // Reset the opacity
    imgs.forEach(img => (img.style.opacity = "1"));
    var element = e.target;
    // Chagnge current image to src of clicekd image
    current.src = element.src;
    //Add fade in class
    current.classList.add("fade-in");
    //Remove fade-in class after .5s
    setTimeout(() => current.classList.remove("fade-in"), 500);
    // Change the opacity to opacity var
    element.style.opacity = opacity;
}
//# sourceMappingURL=imageGallery.js.map