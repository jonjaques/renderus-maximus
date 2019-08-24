require 'sassc'
require 'benchmark'

def main
  # file = File.open("out/app.css", "w")
  
  benchmark_render
  # file.close
end

def benchmark_render
  timing = Benchmark.measure { 
    # file.puts render
    puts render
  }
  puts "render: #{timing.total.round(3)}s"
end

def render
  SassC::Engine.new('@import "scss/main.scss";', {
    load_paths: [
      "node_modules"
    ]
  }).render
end

main
