class RoutesController < ApplicationController
  def optimize
    deliveries = Delivery.all
    addresses = deliveries.map { |d| { id: d.id, x: d.x, y: d.y } }

    optimized = Haskell::RouteOptimizerService.run(addresses)
    
    # Atualiza posição dos deliveries
    optimized_points = optimized["ordered_points"]
    optimized_points.each_with_index do |point, index|
      delivery = Delivery.find(point["id"])
      delivery.update(position: index + 1)
    end

    render json: { optimized: optimized_points, total_distance: optimized["total_distance"] }
  end
end
