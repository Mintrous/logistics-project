require 'rails_helper'

RSpec.describe RouteOptimizerService do
  it 'returns optimized points array' do
    deliveries = [double(x: 1, y: 2), double(x: 3, y: 4)]
    allow(Delivery).to receive(:all).and_return(deliveries)
    result = RouteOptimizerService.optimize(deliveries)
    expect(result).to eq([[3,4],[1,2]])
  end
end