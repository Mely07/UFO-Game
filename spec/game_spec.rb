require 'spec_helper'
require "../lib/cli"
require "stringio"

describe UFOGame::CLI do
    it "user guesses a correct letter" do
        cli = UFOGame::CLI.new

        allow(cli).to receive(:generate_word).and_return('TEST')
        allow(cli).to receive(:gets).and_return('T', 'E', 'S', 'N')

        $stdout = StringIO.new
        cli.call
        output = $stdout.string
        
        expect(output).to include('Correct')
    end

    it "user guesses an incorrect letter" do
        cli = UFOGame::CLI.new

        allow(cli).to receive(:generate_word).and_return('TEST')
        allow(cli).to receive(:gets).and_return('A', 'B', 'C', 'D', 'F', 'G', 'N')
        
        $stdout = StringIO.new
        cli.call
        output = $stdout.string
        
        expect(output).to include('Incorrect')
    end
end