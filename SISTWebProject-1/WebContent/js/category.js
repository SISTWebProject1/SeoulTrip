const btn = document.getElementsByClassName('heart_button');

for (var i = 0; i < btn.length; i++) {
  btn[i].addEventListener('mouseover', changeColor.bind(this, i, 'red'));
  btn[i].addEventListener('mouseout', changeColor.bind(this, i, 'white'));
}
function changeColor(i, color) {
  btn[i].style.backgroundColor = color;
}