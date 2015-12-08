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

  # Returns as an array the activations of all neurons
  def output
    output = []
    @neurons.each do |neuron|
      output << neuron.activation
    end
  end

  attr_reader :num_inputs, :num_outputs, :neurons
end