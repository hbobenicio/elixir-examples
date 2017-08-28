defprotocol NeuralNetwork.Protocols.Evaluable do
  
  @doc "Evaluation function for a struct type given some input"
  def eval(struct, input)
end
