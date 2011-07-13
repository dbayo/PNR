// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
 
    // Set Inital orientation
    // get the initial orientation from window which
    // returns 0 for portrait and 1 for landscape
    if(window.orientation == 0){
        var ori = "portrait";
    }else{
        var ori = "landscape";
    }
    changeOrientation(ori);
 
    // Orientation Change
    // When orientation changes event is triggered
    // exposing an orientation property of either
    // landscape or portrait
    $('body').bind('orientationchange',function(event){
        changeOrientation(event.orientation)
    })
 
    // Change the style dependengt on orientation
    function changeOrientation(ori){
        // Remove all classes separated by spaces
        $("#orientation").removeClass('portrait landscape');
        $("#orientation").addClass(ori);
        $("#orientation").html("<p>"+ori.toUpperCase()+"</p>");
    }
 
})