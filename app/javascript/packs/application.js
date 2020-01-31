require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")




  $(document).on('click', "#filter_product", function(){
    price = $("#price").val();
    material = $("#material").val();

    $.ajax({
      type: "GET", 
      url: "/products/filter",
      data: {
        price: price,
        material: material
      },
      success: function(){
      }
    });
  });
