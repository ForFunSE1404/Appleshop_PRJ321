let categoryName = [];
let categoryCount = [];
let backgroundColor = [];
let color = [
	"#5969ff",
	"#FFC312",
	"#ff407b",
	"#25d5f2",
	"#ffc750",
	"#2ec551",
	"#feca57",
	"#ff9ff3",
	"#ee5253",
	"#10ac84",
	"#5f27cd",
	"#c8d6e5",
	"#222f3e",
	"#833471",
	"#0652DD",
	"#FDA7DF",
];


let url = window.location.origin;
$.getJSON(`${url}/getproductcategorycount`, function (data) {
	data.map((item, index) => {
		categoryName = [...categoryName, item.categoryName]
		categoryCount = [...categoryCount, item.count]
		backgroundColor = [...backgroundColor, color[index]];
	});


	(function (window, document, $, undefined) {
		"use strict";
		$(function () {
			if ($('#productcategorycount').length) {
				var ctx = document.getElementById("productcategorycount").getContext('2d');
				var myChart = new Chart(ctx, {
					type: 'doughnut',
					data: {
						labels: categoryName,
						datasets: [{
							backgroundColor: backgroundColor,
							data: categoryCount
						}]
					},
					options: {

						legend: {
							display: true,
							position: 'bottom',

							labels: {
								fontColor: '#71748d',
								fontFamily: 'Circular Std Book',
								fontSize: 14,
							}
						},


					}

				});
			}

		});

	})(window, document, window.jQuery);
});

let month = ["M1", "M2", "M3", "M4", "M5", "M6", "M7", "M8", "M9", "M10", "M11", "M12"];
let totalPrice = [];

let totalSale = 0;

$.getJSON(`${url}/sellbymonth`, function (data) {
	data.map((item, index) => {
		totalPrice[item.month -1] = item.totalPrice;
		totalSale += item.totalPrice
		console.log(totalSale)
	});

	$("#totalSale").text(`$${totalSale}`);
	(function (window, document, $, undefined) {
		"use strict";
		$(function () {
			if ($('#sellingbymonth').length) {
                var ctx = document.getElementById("sellingbymonth").getContext('2d');
                var myChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: month,
                        datasets: [{
                            label: 'Total Price',
                            data: totalPrice,
                           backgroundColor: "#5969ff",
                                    borderColor: "rgba(89, 105, 255,0.7)",
                            borderWidth: 2
                        },
                    ]
                    },
                    options: {
                        scales: {
                            yAxes: [{

                            }]
                        },
                             legend: {
                        display: true,
                        position: 'bottom',

                        labels: {
                            fontColor: '#71748d',
                            fontFamily: 'Circular Std Book',
                            fontSize: 14,
                        }
                    },

                    scales: {
                        xAxes: [{
                            ticks: {
                                fontSize: 14,
                                fontFamily: 'Circular Std Book',
                                fontColor: '#71748d',
                            }
                        }],
                        yAxes: [{
                            ticks: {
                                fontSize: 14,
                                fontFamily: 'Circular Std Book',
                                fontColor: '#71748d',
                            }
                        }]
                    }
                }

                    
                });
            }

		});

	})(window, document, window.jQuery);
});
