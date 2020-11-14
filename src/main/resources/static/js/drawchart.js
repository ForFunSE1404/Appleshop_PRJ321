let categoryName = [];
let categoryCount = [];
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
let backgroundColor = [];
$.getJSON('http://localhost:8080/getproductcategorycount', function(data) {
	data.map((item, index) => {
		categoryName = [...categoryName, item.categoryName]
		categoryCount = [...categoryCount, item.count]
		backgroundColor = [...backgroundColor, color[index]];
	});


	(function(window, document, $, undefined) {
		"use strict";
		$(function() {
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
Morris.Area({
	element: 'saleofmonths',
	behaveLikeLine: true,
	data: [
		{ x: '1 1', y: 0, },
		{ x: '2 2', y: 7500, },
		{ x: '3 3', y: 15000, },
		{ x: '4 4', y: 22500, },
		{ x: '5 5', y: 30000, },
		{ x: '6 6', y: 40000, },
		{ x: '7 7', y: 10123, },
		{ x: '8 8', y: 123, },

	],
	xkey: 'x',
	ykeys: ['y'],
	labels: ['X'],
	lineColors: ['#5969ff'],
	resize: true

});