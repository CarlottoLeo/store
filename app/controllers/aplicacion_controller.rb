class AplicacionController < ApplicationController

  def graphic

    data_array_1 = [1, 4, 3, 5, 9, 1, 4, 3, 4]
    data_array_2 = [4, 2, 10, 4, 7, 14, 12, 5]

    @barv = Gchart.bar(
      size: '300x400',
      bar_colors: %w(000000 0088FF),
      title: 'Gráfico de Barra',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Pedidos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 20,
      min_value: 0,
      axis_labels: [['2010|2011|2012|2013|2014|2015|2016|2017']]
    )

    @bar = Gchart.line(
      size: '400x400',
      bar_colors: %w(000000 0088FF),
      title: 'Gráfico de Linha',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Pedidos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 15,
      min_value: 0,
      axis_labels: [['2010|2011|2012|2013|2014|2015|2016|2017']]
    )

    @barc = Gchart.pie(
      size: '450x400',
      bar_colors: %w(000000 0088FF),
      title: 'Gráfico de Pizza',
      bg: 'EFEFEF',
      legend: ['Pedidos não finalizados', 'Pedidos Finalizados'],
      data: [[1, 4, 3, 5, 9], data_array_2],
      stacked: false,
      legend_position: 'bottom',
      axis_with_labels: [['x'], ['y']],
      max_value: 15,
      min_value: 0,
      axis_labels: [['2010|2011|2012|2013|2014|2015|2016|2017']]
    )
  end
end
