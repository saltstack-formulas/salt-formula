# frozen_string_literal: true

require 'yaml'

control '`map.jinja` YAML dump' do
  title 'should match the comparison file'

  ### Method
  # The steps below for each file appear convoluted but they are both required
  # and similar in nature:
  # 1. The earliest method was to simply compare the files textually but this often
  #    led to false positives due to inconsistencies (e.g. spacing, ordering)
  # 2. The next method was to load the files back into YAML structures and then
  #    compare but InSpec provided block diffs this way, unusable by end users
  # 3. The final step was to dump the YAML structures back into a string to use
  #    for the comparison; this both worked and provided human-friendly diffs

  ### Comparison file for the specific platform
  ### Static, adjusted as part of code contributions, as map data is changed
  # Strip the `platform[:finger]` version number down to the "OS major release"
  platform_finger = system.platform[:finger].split('.').first.to_s
  # Use that to set the path to the file (relative to the InSpec suite directory)
  mapdata_file_path = "_mapdata/#{platform_finger}.yaml"
  # Load the mapdata from profile, into a YAML structure
  # https://docs.chef.io/inspec/profiles/#profile-files
  mapdata_file_yaml = YAML.safe_load(inspec.profile.file(mapdata_file_path))
  # Dump the YAML back into a string for comparison
  mapdata_file_dump = YAML.dump(mapdata_file_yaml)

  ### Output file produced by running the `_mapdata` state
  ### Dynamic, generated during Kitchen's `converge` phase
  # Derive the location of the dumped mapdata (differs for Windows)
  output_dir = platform[:family] == 'windows' ? '/temp' : '/tmp'
  # Use that to set the path to the file (absolute path, i.e. within the container)
  output_file_path = "#{output_dir}/salt_mapdata_dump.yaml"
  # Load the output into a YAML structure using InSpec's `yaml` resource
  # https://github.com/inspec/inspec/blob/49b7d10/lib/inspec/resources/yaml.rb#L29
  output_file_yaml = yaml(output_file_path).params
  # Dump the YAML back into a string for comparison
  output_file_dump = YAML.dump(output_file_yaml)

  describe 'File content' do
    it 'should match profile map data exactly' do
      expect(output_file_dump).to eq(mapdata_file_dump)
    end
  end
end
