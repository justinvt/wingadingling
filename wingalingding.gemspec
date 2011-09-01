# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "wingalingding"
  s.version = "0.1.0"
  s.signing_key = '/Users/justin/.gem/gem-private_key.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["justin"]
  s.date = "2011-09-01"
  s.description = "A gem to search through and get information on various unicode symbols/groups"
  s.email = "jvthibault@gmail.com"
  s.executables = ["wing"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README",
    "Rakefile",
    "VERSION",
    "bin/wing",
    "charsets/chars.txt",
    "charsets/chars_00000-01023.txt",
    "charsets/chars_01023-02047.txt",
    "charsets/chars_02047-03071.txt",
    "charsets/chars_03071-04095.txt",
    "charsets/chars_04095-05119.txt",
    "charsets/chars_05119-06143.txt",
    "charsets/chars_06143-07167.txt",
    "charsets/chars_07167-08191.txt",
    "charsets/chars_08191-09215.txt",
    "charsets/chars_09215-10239.txt",
    "charsets/chars_10239-11263.txt",
    "charsets/chars_11263-12287.txt",
    "charsets/chars_12287-13311.txt",
    "charsets/chars_13311-14335.txt",
    "charsets/chars_14335-15359.txt",
    "charsets/chars_15359-16383.txt",
    "charsets/chars_16383-17407.txt",
    "charsets/chars_17407-18431.txt",
    "charsets/chars_18431-19455.txt",
    "charsets/chars_19455-20479.txt",
    "charsets/chars_20479-21503.txt",
    "charsets/chars_21503-22527.txt",
    "charsets/chars_22527-23551.txt",
    "charsets/chars_23551-24575.txt",
    "charsets/chars_24575-25599.txt",
    "charsets/chars_25599-26623.txt",
    "charsets/chars_26623-27647.txt",
    "charsets/chars_27647-28671.txt",
    "charsets/chars_28671-29695.txt",
    "charsets/chars_29695-30719.txt",
    "charsets/chars_30719-31743.txt",
    "charsets/chars_31743-32767.txt",
    "charsets/chars_32767-33791.txt",
    "charsets/chars_33791-34815.txt",
    "charsets/chars_34815-35839.txt",
    "charsets/chars_35839-36863.txt",
    "charsets/chars_36863-37887.txt",
    "charsets/chars_37887-38911.txt",
    "charsets/chars_38911-39935.txt",
    "charsets/chars_39935-40959.txt",
    "charsets/chars_40959-41983.txt",
    "charsets/chars_41983-43007.txt",
    "charsets/chars_43007-44031.txt",
    "charsets/chars_44031-45055.txt",
    "charsets/chars_45055-46079.txt",
    "charsets/chars_46079-47103.txt",
    "charsets/chars_47103-48127.txt",
    "charsets/chars_48127-49151.txt",
    "charsets/chars_49151-50175.txt",
    "charsets/chars_50175-51199.txt",
    "charsets/chars_51199-52223.txt",
    "charsets/chars_52223-53247.txt",
    "charsets/chars_53247-54271.txt",
    "charsets/chars_54271-55295.txt",
    "charsets/chars_55295-56319.txt",
    "charsets/chars_56319-57343.txt",
    "charsets/chars_57343-58367.txt",
    "charsets/chars_58367-59391.txt",
    "charsets/chars_59391-60415.txt",
    "charsets/chars_60415-61439.txt",
    "charsets/chars_61439-62463.txt",
    "charsets/chars_62463-63487.txt",
    "charsets/chars_63487-64511.txt",
    "charsets/chars_64511-65535.txt",
    "charsets/chars_65535-66559.txt",
    "charsets/chars_66559-67583.txt",
    "charsets/chars_67583-68607.txt",
    "charsets/chars_68607-69631.txt",
    "charsets/chars_69631-70655.txt",
    "charsets/chars_70655-71679.txt",
    "charsets/chars_71679-72703.txt",
    "charsets/chars_72703-73727.txt",
    "charsets/chars_73727-74751.txt",
    "charsets/chars_74751-75775.txt",
    "charsets/chars_75775-76799.txt",
    "charsets/chars_76799-77823.txt",
    "charsets/chars_77823-78847.txt",
    "charsets/chars_78847-79871.txt",
    "charsets/chars_79871-80895.txt",
    "charsets/chars_80895-81919.txt",
    "charsets/chars_81919-82943.txt",
    "charsets/chars_82943-83967.txt",
    "charsets/chars_83967-84991.txt",
    "charsets/chars_84991-86015.txt",
    "charsets/chars_86015-87039.txt",
    "charsets/chars_87039-88063.txt",
    "charsets/chars_88063-89087.txt",
    "charsets/chars_89087-90111.txt",
    "charsets/chars_90111-91135.txt",
    "charsets/chars_91135-92159.txt",
    "charsets/chars_92159-93183.txt",
    "charsets/chars_93183-94207.txt",
    "charsets/chars_94207-95231.txt",
    "charsets/chars_95231-96255.txt",
    "charsets/chars_96255-97279.txt",
    "charsets/chars_97279-98285.txt",
    "charsets/chars_98285-98285.txt",
    "charsets/utf8.txt",
    "lib/char.rb",
    "lib/scraper.rb",
    "lib/wingalingding.rb",
    "log/scrape.log",
    "wingalingding.gemspec"
  ]
  s.homepage = "http://github.com/justinvt/wingalingding"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A gem to search through unicode symbols"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_development_dependency(%q<nokogiri>, ["~> 1.5"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
      s.add_dependency(%q<nokogiri>, ["~> 1.5"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.2"])
    s.add_dependency(%q<nokogiri>, ["~> 1.5"])
  end
end

