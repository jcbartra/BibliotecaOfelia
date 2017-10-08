function nb(){
window.location.hash="nb";
window.location.hash="Again-nb" //chrome
window.onhashchange=function(){window.location.hash="nb";}
}