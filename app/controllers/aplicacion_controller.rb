class AplicacionController < ApplicationController
  def graphic
    data_array_1 = [1, 4, 3, 5, 9, 1, 4, 3, 5, 9]
    data_array_2 = [4, 2, 10, 4, 7, 14, 12, 20, 14, 17]

    @barv = Gchart.bar(
      size: '387x400',
      bar_colors: %w(000000 0088FF),
      title: 'Grafico de Barra',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Produtos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 15,
      min_value: 0,
      axis_labels: [['A|B|C|D|E|F|G|H|I|J']]
    )

    @bar = Gchart.line(
      size: '387x400',
      bar_colors: %w(000000 0088FF),
      title: 'Grafico de Linha',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Produtos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 15,
      min_value: 0,
      axis_labels: [['A|B|C|D|E|F|G|H|I|J']]
    )

    @barc = Gchart.pie(
      size: '387x400',
      bar_colors: %w(000000 0088FF),
      title: 'Grafico de Pizza',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Produtos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 15,
      min_value: 0,
      axis_labels: [['A|B|C|D|E|F|G|H|I|J']]
    )
  end
end
