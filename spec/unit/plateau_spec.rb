require 'plateau.rb'

describe Plateau do

  map = [[:O,:O,:O,:O,:O,:O,:O,:O],
         [:O,:O,:O,:O,:O,:O,:O,:O],
         [:O,:O,:O,:O,:O,:O,:O,:O],
         [:O,:O,:O,:O,:O,:O,:O,:O],
         [:O,:O,:O,:O,:O,:O,:O,:O],
         [:O,:O,:O,:O,:O,:O,:O,:O]]

  subject(:plateau) {described_class.new(8,6)}

  it "can be generated with a custom width and height" do
    expect(plateau.map).to eq(map)
  end


end