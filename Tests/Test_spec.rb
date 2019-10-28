
require 'rspec'
require 'rspec/core/project_initializer/spec/spec_helper'
require '../card'
require_relative 'spec_helper'


RSpec.describe 'A playing card Game' do

  def card(params={})
    defaults={
        suit: :hearts,
        rank: 7,
    }

    Card.new(**defaults.merge(params))
  end

  context 'Equality' do
    def subject
      @subject ||=card(suit: :spades,rank:4)
    end

    def other
      @other ||= card(suit: :hearts,rank:4)
    end


    it 'is equal to itself' do
      expect(subject).to eql(subject)
    end

    it 'is hash equal to itself' do
      other=card(suit: :spades,rank:4)
      expect(Set.new([subject,other]).size).to eql(1)

    end


  describe 'comparing to a card of different suit' do


    it 'is not hash equal ' do
      expect(Set.new([subject,other]).size).to eql(2)
    end

    it 'is not equal' do
      expect(subject).not_to eql(other)
    end

  end

  describe 'comparing to card of different rank' do

    def other
      @other ||= card(suit: :spades,rank:5)
    end

    it 'is not hash equal' do
      expect(Set.new([subject,other]).size).to eql(2)
    end


    it 'is not equal' do
      expect(subject).not_to eql(other)
    end

  end


  it 'Has a suit' do
    expect(card(suit: :spades).suit).to eq(:spades)
  end
  it 'Has a rank' do
    expect(card(rank:4).rank).to eql(4);

  end

  describe ' a jack' do

    it 'ranks higher than a 10' do
      lower=card(rank: 10)
      higher=card(rank: :jack)

      raise unless higher.rank>lower.rank
    end
  end

    end


end
