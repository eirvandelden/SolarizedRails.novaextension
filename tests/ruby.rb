# This ruby test file is based on the test file by the Solarized colour scheme: https://ethanschoonover.com/solarized/
# ruby test file for ruby.rb

include Enumerable

def initialize(rbconfig)
  @rbconfig = rbconfig
  @no_harm = false
end

def load_savefile
  begin
    File.foreach(savefile()) do |line|
      k, v = *line.split(/=/, 2)
      self[k] = v.strip
      end
  rescue Errno::ENOENT
    setup_rb_error $!.message + "\n#{File.basename($0)} config first"
  end
end

if c['rubylibdir']
  # V > 1.6.3
  libruby         = "#{c['prefix']}/lib/ruby"
  siterubyverarch = c['sitearchdir']
end

parameterize = lambda { |path|
  path.sub(/\A#{Regexp.quote(c['prefix'])}/, '$prefix')
}
