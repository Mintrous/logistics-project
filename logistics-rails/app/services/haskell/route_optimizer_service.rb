module Haskell
  class RouteOptimizerService
    def self.run(deliveries)
      script_path = Rails.root.join("route-optimizer", "run.sh")
      deliveries_json = deliveries.to_json

      output = IO.popen([script_path.to_s], "r+") do |io|
        io.puts(deliveries_json)
        io.close_write
        io.read
      end

      JSON.parse(output)
    end
  end
end
