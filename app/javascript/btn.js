function btnColor() {  
  const btnList = document.querySelectorAll("#btn");

  btnList.forEach((btn) => {
    btn.addEventListener('mouseover', function(){
      btn.setAttribute("style", "background-color:#bfbbb0;");
    });
  
    btn.addEventListener('mouseout', function(){
      btn.removeAttribute("style", "background-color:#bfbbb0;");
    });
  });
};
setInterval(btnColor, 1000);