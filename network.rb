require_relative 'single_layer.rb'
require 'CSV'

class Network
  #
  # A network consists of a perceptron and some training data.
  # Training data is loaded from a filepath and is split into
  # two 2d arrays, one for inputs, one for outputs. For CSV
  # formatting info see README.
  #
  def initialize(num_inputs, num_outputs)
    @perceptron = SingleLayer.new(num_inputs, num_outputs)
    @training_inputs = []
    @training_outputs = []
  end

  def import_data(path)
    @training_data = CSV.foreach(path, converters: :float) do |row|
      @training_inputs << row[0...@perceptron.num_inputs]
      @training_outputs << row[@perceptron.num_inputs..-1]
    end
  end

  def train!

  end

  attr_reader :training_inputs, :training_outputs
end

network = Network.new(3,3)
network.import_data('data.csv')
print network.training_inputs
puts ''
print network.training_outputs
