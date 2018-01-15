document.addEventListener("DOMContentLoaded", function(){
  var stuff = document.getElementById('mycanvas');
  stuff.height = 500;
  stuff.width = 500;

  var ctx = stuff.getContext('2d');
  ctx.fillStyle = "purple";
  ctx.fillRect(0,0,500,500);

  var x = 100;
  ctx.beginPath();
  ctx.arc(100, x, 20, 0, 2*Math.PI, true);
  ctx.strokeStyle = "green";
  ctx.stroke();
  ctx.fillStyle = "blue";
  ctx.fill();

  var thingy = function moveStuff() {
    x+=200;
    ctx.arc(100, x, 20, 0, 2*Math.PI, true);
  };
  setInterval(thingy, 2000);
});
