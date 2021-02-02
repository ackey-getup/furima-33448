function pullDown() {

  const pullDownCategory = document.getElementById("category")
  const pullDownCategories = document.getElementById("category-pull-down")
  const pullDownCategoryList = document.querySelectorAll(".pull-down-category")

  pullDownCategory.addEventListener('mouseover', function(){
    this.setAttribute("style", "background-color:lightblue;")
  })

  pullDownCategory.addEventListener('mouseout', function(){
    this.setAttribute("style", "background-color:white;")
  })

  pullDownCategory.addEventListener("click", function(){
    // プルダウンメニューの表示と非表示の設定
    if (pullDownCategories.getAttribute("style") == "display:block;") {
      // pullDownParentsにdisplay:block;が付与されている場合（つまり表示されている時）実行される
      pullDownCategories.removeAttribute("style", "display:block;")
    } else {
      // pullDownParentsにdisplay:block;が付与されていない場合（つまり非表示の時）実行される
      pullDownCategories.setAttribute("style", "display:block;")
    }
  })

  // コースの値を取得し表示する
  pullDownCategoryList.forEach(function(list){
    list.addEventListener('click', function(){
      value = list.innerHTML
    })
  })
}

window.addEventListener('load', pullDown)
