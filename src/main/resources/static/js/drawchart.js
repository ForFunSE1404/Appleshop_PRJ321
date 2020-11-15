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


(function (window, document, $, undefined) {
	"use strict";
	$(function () {
		$.getJSON(`${url}/statistics/getproductcategorycount`, function (data) {
			data.map((item, index) => {
				categoryName = [...categoryName, item.categoryName]
				categoryCount = [...categoryCount, item.count]
				backgroundColor = [...backgroundColor, color[index]];
			});
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

	});
	let month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
	let totalPrice = [];
	$.getJSON(`${url}/statistics/sellbymonth`, function (data) {
		data.map((item, index) => {
			totalPrice[item.month - 1] = item.totalPrice;
			console.log(totalSale)
		});
		if ($('#sellingbymonth').length) {
			var ctx = document.getElementById("sellingbymonth").getContext('2d');
			var myChart = new Chart(ctx, {
				type: 'bar',
				data: {
					labels: month,
					datasets: [{
						label: 'Total Money',
						data: totalPrice,
						backgroundColor: "#ff407b",
						borderColor: "#ff600",
						borderWidth: 1
					}]
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
								fontSize: 13,
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

	$.getJSON(`${url}/statistics/totalcustomer`, function (data) {
		data.map((item) => {
			$("#totalcustomer").text(item);
		});
	});
	
	$.getJSON(`${url}/statistics/totalorder`, function (data) {
		data.map((item) => {
			$("#totalorder").text(item);
		});
	});
	
	$.getJSON(`${url}/statistics/totalproductsold`, function (data) {
		data.map((item) => {
			$("#totalproductsold").text(item);
		});
	});
		$.getJSON(`${url}/statistics/totalmoney`, function (data) {
		data.map((item) => {
			$("#totalSale").text('$' +item);
		});
	});
	
})(window, document, window.jQuery);
