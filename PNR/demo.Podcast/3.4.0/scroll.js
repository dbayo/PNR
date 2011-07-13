/*
 *@TODO - make this an object/class

Using this class
1) Embed the script
2) Create your divs in the following manner
  <div id="contentContainer" style="position:absolute;overflow:hidden;width:318px;height:300px;">
        <div id="content" class="content" style="position:absolute;width:100%;top:0px"></div>
  </div>
 3) call addScrollBar("idOfElement") on the onLoad function
 
 
 
You must create a contentContainer div that has the styles set for overflow:hidden, height and width that you want to display.  This div is the wrapper that hides the content behind it.
The second div is your actual content.  Do not set a height limiter on that, as JavaScript will find the height of the content and figure out the scrollbar.

To add scrolling to your div, just call

addScrollbar("idOfElement") and it will do the rest for you.  This adds a progress scrollbar to the right hand side, which you can disable as a second parameter.
	addScrollBar("idOfElement","disable") - this will remove it.
	
The scrollbar on the right hand side has a class of 'scrollBar', that you can add styles for the color, opacity, etc.
.scrollBar {
			z-index:3;background:white;opacity:.5;
}

*/
//Add a scroller to the page.  It expects a div that is inside another div.  A scrollbar is added by default, pass a "true" in the second parameter to ignore
function addScroller(el,noScroller)
{
   

    var lockX=0;
    var lockY=0;
    var boolScrollLock=false;
    var currentScrollingObject=null;
    var bottomMargin=0;
    var maxTop=0;
    var startTop=0;
    var scrollBar=null;
    var divHeight=0;
    var lastScrollbar="";
    var translateOpen='m11' in new WebKitCSSMatrix()?"3d(":"(";
    var translateClose='m11' in new WebKitCSSMatrix()?",0)":")";
    //for inertia
    var timeMoved=0;
    var distanceMoved=0;
    var prevTime=0;
    var finishScrollingObject=null;

    try{
        var element=document.getElementById(el);
        var container=element.parentNode;//Get the parent container div.  This has the overflow and height style parameters set

        element.addEventListener('touchstart',function(event){
            scrollStart(event,element,container);
        }, false);
        element.addEventListener('touchmove', scrollMove, false);
        element.addEventListener('touchend', scrollStop, false);
        if(!noScroller)
        {
            var scrollDiv=document.createElement("div");
            scrollDiv.style.position='absolute';
            scrollDiv.style.width="5px";
            scrollDiv.style.height="20px";
            scrollDiv.style.top="0px";
            scrollDiv.style.right="0px";
            scrollDiv.className='scrollBar';
            container.appendChild(scrollDiv);
            scrollBar=scrollDiv;
        }
        element.style.webkitTransform="translate"+translateOpen+"0,0px"+translateClose;
                element.style.webkitTransitionDuration="0ms";
    }
    catch(e){
        alert("error adding scroller" +e);
    }


    //handle the moving function
    function scrollMove(event)
    {
        try //to clear the selection on a scroll gesture
        {
            objTrackSelectedItem = null;
        }
        catch(e) {}
    
        try
        {
            if (currentScrollingObject!=null)
            {
                event.stopPropagation();
                var deltaY=lockY-event.touches[0].pageY;
                deltaY=-deltaY;
                var newTop=startTop+deltaY;
                if(newTop>0)
                    newTop=0;
                if (-newTop > maxTop) newTop = -maxTop;
                var top=-newTop;
                var bottom=bottomMargin-newTop;
                //var prevTop=numOnly(currentScrollingObject.style.top);
                var prevTop=new WebKitCSSMatrix(window.getComputedStyle(currentScrollingObject).webkitTransform).f;
			
                //currentScrollingObject.style.top=newTop+"px";
                //currentScrollingObject.style.clip="rect(" + top +"px,320px," + bottom + "px,0px)";

                currentScrollingObject.style.webkitTransform="translate"+translateOpen+"0,"+newTop+"px"+translateClose;
                currentScrollingObject.style.webkitTransitionDuration="0ms";
                //			console.log(top,newTop);
                if(scrollBar)
                {
                    //We must calculate the position.  Since we don't allow the page to scroll to the full content height, we use maxTop as height to work with.
                    var pos=(bottomMargin-numOnly(scrollBar.style.height))-(((maxTop+newTop)/maxTop)*(bottomMargin-numOnly(scrollBar.style.height)));
                    // scrollBar.style.top=pos+"px";
                    scrollBar.style.webkitTransitionDuration="0ms";
                    scrollBar.style.webkitTransform="translate"+translateOpen+"0,"+pos+"px"+translateClose;

                }
                if(prevTime)
                {
                    var tmpDistance=Math.abs(prevTop)-Math.abs(newTop);
                    var tmpTime=event.timeStamp-prevTime;
                    if(tmpTime<1000){//movement is under a second, keep adding the differences
                        timeMoved+=tmpTime;
                        distanceMoved+=tmpDistance;
                    }
                    else {//We haven't moved in a second, lets reset the variables
                        timeMoved=0;
                        distanceMoved=0;
                    }
                }
                prevTime=event.timeStamp;
            }
        }
        catch(e) {
            alert("error in scrollMove: " + e);
        }
    }



    //eleScrolling is the div to scroll
    //container is the container div that has a height and overflow property set
    function scrollStart(event,eleScrolling,container)
    {
        if(!container)
            return;
        try
        {
            timeMoved=0;
            distanceMoved=0;
            prevTime=null;
            howManySteps=0;
            howMuchScroll=0;
            finishScrollingObject=null;
            bottomMargin=container.clientHeight;//the container has a height property set via CSS
            maxTop=eleScrolling.clientHeight-bottomMargin;//We get the height of the element we are scrolling, then subtract the bottom margin so we don't scroll past it.  this is used for the scrollbar position
            divHeight=eleScrolling.clientHeight; //The height of the div's content
            if(maxTop<0)
                return;
            //Allow interaction to legit calls, like select boxes, etc.
            if(event.touches[0].target&&event.touches[0].target.type!=undefined)
                return;
            if (event.touches.length == 1 && boolScrollLock==false)
            {
                //startTop=numOnly(eleScrolling.style.top);
                startTop=new WebKitCSSMatrix(window.getComputedStyle(eleScrolling).webkitTransform).f;
                lockX = event.touches[0].pageX;
                lockY = event.touches[0].pageY;
                currentScrollingObject=eleScrolling;
                event.preventDefault();
                //get the scrollbar
                for(j in container.childNodes)
                {
                    if(container.childNodes[j].className=="scrollBar"){
                        scrollBar=container.childNodes[j];
                        break;
                    }
                }
                if(scrollBar)
                {
                    var pos=(bottomMargin-numOnly(scrollBar.style.height))-(((maxTop+startTop)/maxTop)*(bottomMargin-numOnly(scrollBar.style.height)));
                    scrollBar.style.webkitTransitionDuration="0ms";
                    scrollBar.style.webkitTransform="translate"+translateOpen+"0,"+pos+"px"+translateClose;

                }
            }
        } catch(e) {
            alert("error in scrollStart: " + e);
        }
    }

    //touchend callback.  Set the current scrolling object and scrollbar to null
    function scrollStop()
    {
        if(currentScrollingObject!=null){
            var myDistance=-distanceMoved;
            var dist=myDistance;
            var time=timeMoved;
            var friction = 2.5;
            var deceleration = 1.2;
            var speed = Math.abs(dist) / time * 1000,
            newDist = speed * speed / friction / 1000/2;
            newTime = 0;
            newDist = newDist * (dist < 0 ? -1 : 1);
            newTime = speed / deceleration;

            finishScrollingObject=currentScrollingObject;
            currentScrollingObject=null;
    
            var move=new WebKitCSSMatrix(window.getComputedStyle(finishScrollingObject).webkitTransform).f-newDist;

            if(move>0)
                move=0;
            if(move<(-maxTop))
                move=-maxTop;
            finishScrollingObject.style.webkitTransform="translate"+translateOpen+"0,"+move+"px"+translateClose;
            finishScrollingObject.style.webkitTransitionDuration=newTime+"ms";
            var pos=(bottomMargin-numOnly(scrollBar.style.height))-(((maxTop+move)/maxTop)*(bottomMargin-numOnly(scrollBar.style.height)));
            if(pos>bottomMargin)
                pos=bottomMargin;
            if(pos<0)
                pos=0;
            scrollBar.style.webkitTransitionDuration=newTime+"ms";
            scrollBar.style.webkitTransform="translate"+translateOpen+"0,"+pos+"px"+translateClose;
            clearScroll();
        }
    }


    function clearScroll(){
        currentScrollingObject=null;
        scrollBar=null;
        timeMoved=0;
        distanceMoved=0;
        prevTime=null;
    }
}

//This will reset the scrollbar and div content position to the top.
//it will hide the scrollbar if the content does not require scrolling
function resetDiv(el)
{
    try
    {
        if(typeof el == "string")
            el=document.getElementById(el);
        
        el.style.webkitTransform="translate"+translateOpen+"0,0px"+translateClose;
        el.style.webkitTransitionDuration="0ms";
        
        var container=el.parentNode; //parent container
        for(j in container.childNodes)
        {
            if(container.childNodes[j].className=="scrollBar"){
                container.childNodes[j].style.top="0px";
                if(el.clientHeight>container.clientHeight){
                    container.childNodes[j].style.display="block";
                }
                else {
                    container.childNodes[j].style.display="none";
                }
                return;
            }
        }
    }
    catch(e)
    {}
}



//Helper function to get only
if(!window.numOnly){
    function numOnly(val)
    {
        if(isNaN(parseFloat(val)))
            val=val.replace(/[^0-9.-]/,"");

        return  parseFloat(val);
    }
}
