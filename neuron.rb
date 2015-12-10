class Neuron
  #
  # A neuron is created with a weight array with default value 0.
  # This is a basic neuron. For sigmoid function see Sigmoid.
  #
  def initialize(name, number_weights)
    @name = name
    @weights = Array.new(number_weights, 0)
    @inputs = nil # Holds the inputs from the last training exemplar
    @bias = -1
  end

  def net_input
    (0...inputs.count).inject(0) { |total, i| inputs[i] * weights[i] + total }
  end

  def activation
    net_input - bias > 0 ? 1 : 0
  end

  def change_weights(change)
    weights.zip(change).map! { |x, y| x + y }
  end

  attr_accessor :inputs, :weights, :bias
  attr_reader :name
end
