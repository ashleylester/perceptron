require_relative 'single_layer.rb'
require 'CSV'

class Network
  #
  # A network consists of a perceptron and some training data.
  # Training data is loaded from a filepath and is split into
  # two 2d arrays, one for inputs, one for outputs. For CSV
  # formatting see README.
  #
  def initialize(num_inputs, num_outputs)
    @perceptron = SingleLayer.new(num_inputs, num_outputs)
    @training_inputs = []
    @training_outputs = []
    @max_epoch = 1000
    @learn_rate = 0.1
  end

  def import_data(path)
    @training_data = CSV.foreach(path, converters: :float) do |row|
      @training_inputs << row[0...@perceptron.num_inputs]
      @training_outputs << row[@perceptron.num_inputs..-1]
    end
  end

  def train!
    epoch = 1
    error = 1

    while epoch < @max_epoch && error > 0
      puts "epoch #{epoch} of #{@max_epoch}"
      (0...@training_inputs.size).each do |i|
        puts "exemplar #{i} of #{@training_inputs.size}"
        @perceptron.neurons.each_with_index do |neuron, j|
          neuron.inputs = @training_inputs[i] # Clamp
          error = neuron.activation - @training_outputs[i][j] # Calculate error
          puts "error: #{error}"
          change = @training_inputs[i].collect { |x| x * @learn_rate } # Adjust weights
          neuron.change_weights(change) if error > 0 # Apply adjustment
          puts "changed weights on neuron #{neuron.name} by #{change}" if error > 0 # Apply adjustment
        end
      end
      epoch += 1
    end


  end

  attr_reader :training_inputs, :training_outputs
end

network = Network.new(3,3)
network.import_data('data.csv')
print network.training_inputs
puts ''
print network.training_outputs
puts ''
network.train!
