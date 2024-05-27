import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['chartEmployeesCount']

  canvasEmployeesCountContext() { return this.chartEmployeesCountTarget.getContext('2d'); }
  
  connect() {
    new Chart(this.canvasEmployeesCountContext(), {
      type: 'bar',
      data: {
        labels: ['Até R$ 1.412,00', 'R$ 1.412,01 até R$ 2.666,68', 'R$ 2.666,69 até R$ 4.000,03', 'R$ 4.000,04 até R$ 7.786,02', 'Maior quê R$ 7.786,02'],
        datasets: [{
          axis: 'y',
          label: 'Quantidade de Funcionários',
          data: JSON.parse(document.querySelector('[data-employees-count]').dataset.employeesCount),
          fill: false,
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)'
          ],
          borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(54, 162, 235)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        indexAxis: 'y',
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            },
          }],
        },
      },
    })
  }
}
