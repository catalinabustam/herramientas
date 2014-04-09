#encoding: utf-8
require 'optparse'
require 'find'
require 'prawn'
require 'narray'
require 'fileutils'

options = {}
option_parser = OptionParser.new do |opts|

opts.on("-f DICOMDIR", "The DICOM directory") do |dicomdir|
    options[:dicomdir] = dicomdir
  end
end
option_parser.parse!

dirnames = Dir.entries(options[:dicomdir]).select {|entry| File.directory? File.join(options[:dicomdir],entry) and !(entry =='.' || entry == '..')}


  dirnames.each do |name|
    
  	outdir="#{options[:dicomdir]}_s/#{name}"
  
    multiframe=Dir.glob("#{options[:dicomdir]}/#{name}/*")
    
   
puts "multiframe"
    puts multiframe[0]
    
    puts "outputdir"
    puts outdir
   
    puts "/Applications/dcm4che-3.2.0/bin/./emf2sf -out-dir #{outdir} #{multiframe[0]}"
   
   `/Applications/dcm4che-3.2.0/bin/./emf2sf -out-dir #{outdir} #{multiframe[0]}`
  
end