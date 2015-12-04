require_relative 'neuron.rb'

class SingleLayer
  #
  # A single layer perceptron. Initializing the perceptron will
  # create num_outputs of neurons, each with
  # a weight vector of length matching num_inputs.
  #
  def initialize(num_inputs, num_outputs)
    @num_inputs = num_inputs
    @num_outputs = num_outputs
    @neurons = []
    num_outputs.times do |i|
      @neurons << Neuron.new(i, num_inputs)
    end
  end

  def train

  end

  attr_reader :num_inputs, :num_outputs
end