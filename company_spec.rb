require 'rspec'
require './generate'
require 'fileutils'

describe 'generate' do

before :all do
  @csv_file = "data/company.csv"
  FileUtils.rm_rf(@csv_file)
end

  it 'should return an array of 350 people' do
    expect(people.length).to eq 350
  end

  it 'should return an array of 27 companies' do
    expect(companies.length).to eq 27
  end

  it 'should return an employment array of first name, last name, and company name' do
    expect(employment.first.length).to eq 3
  end

  it 'should create a company.csv file' do
    generate
    expect(File.exist?(@csv_file)).to be_true
  end
end