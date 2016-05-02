require "#{ENV['BUSSER_ROOT']}/../kitchen/data/serverspec_helper"

describe 'KairosDB configuration' do
	it 'Configuration file exists' do
		expect(file('/opt/kairosdb/conf/kairosdb.properties')).to be_file
	end
end

describe 'KairosDB service' do
	it 'Should be enabled' do
		expect(service('kairosdb')).to be_enabled
	end
	it 'Should be running' do
		expect(service('kairosdb')).to be_running
	end
end