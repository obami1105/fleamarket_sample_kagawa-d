$(function(){

  function buildForm(categories){
    let options='';
    categories.forEach(function (category) { 
      options += `
                  <option value="${category.id}">${category.name}</option>
                 `;
    });

    
    const html=`
      <select class="section__second item__category"  name="item[category_id]">
        <option value="">選択してください</option>
        ${options}
      </select>
    `
    return html
  }


  $('.category__box').on('change','.item__category',function(){
    $(this).nextAll().remove()
    const category_id=$(this).val()

    $.ajax({
      type: "GET",
      url: "/api/items/category",
      data: {category_id: category_id },
      dataType: 'json'
    })
    .done(function(categories) {

  
      if(categories.length==0){
        return false
      }
      
      const select_form=buildForm(categories)
      const target=$('.category__box')
      target.append(select_form)
    
    })
    .fail(function() {
      alert('失敗')
    });
  })
});