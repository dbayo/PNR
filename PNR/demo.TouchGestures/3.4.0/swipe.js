function addSwipeListener(el, listener)
{
 var startX;
 var startY;
 var dx;
 var dy;
 var direction;
 
 function cancelTouch()
 {
  startX = null;
  startY = null;
  direction = null;
 }
 
    function onTouchMove(e)
    {
        e.preventDefault();
        if (e.touches.length > 1)
        {
            //fail
            cancelTouch();
        }
        else
        {
            dx = e.touches[0].pageX - startX;
            dy = e.touches[0].pageY - startY;
            if (direction == null)
            {
                direction = dx;
            }
            
            //rotate
            if ((dy > 60 || dy < -60)&&(Math.abs(dx) < 60 && (Math.abs(dx) < Math.abs(dy))))
            {
                var tempy = dy;
                if (tempy > 60) { tempy=tempy-60; }
                if (tempy < -60) { tempy=tempy+60; }
                
                tempy = parseInt(tempy/3);
                
                x$("#cardFront").setStyle("webkitTransform","rotate(" + ((rotation + tempy) % 360) + "deg)");
                x$("#cardBack").setStyle("webkitTransform","rotate(" + ((rotation + tempy) % 360) + "deg)");
            }
        }
    }

 function onTouchEnd(e)
 {
    cancelTouch();

    try
    {
        //flip
        if (Math.abs(dx) > 60 && (Math.abs(dx) > Math.abs(dy)))
        {
            listener({ target: el, direction: dx > 0 ? 'right' : 'left' });
        } 
        else
        {
            window.scroll(0,0);  //return scroll to center

            //rotate
            if (Math.abs(dy) > 60)
            {
                var tempy = dy;
                if (tempy > 60) { tempy=tempy-60; }
                if (tempy < -60) { tempy=tempy+60; }
                tempy = parseInt(tempy/3);  
                
                rotation = (rotation + tempy) % 360;
            }
        }
        

    }
    catch(e) { 
    //alert("error in onTouchEnd: " + e.message); 
    }
  
    dx=0;
    dy=0;
 }
 
 function onTouchStart(e)
 {
    if (e.touches.length == 1)
    {
        startX = e.touches[0].pageX;
        startY = e.touches[0].pageY;
        el.addEventListener('touchmove', onTouchMove, false);
        el.addEventListener('touchend', onTouchEnd, false);
    }
 }
 
 el.addEventListener('touchstart', onTouchStart, true);
}