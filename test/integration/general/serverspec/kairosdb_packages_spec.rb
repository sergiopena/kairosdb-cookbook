require "#{ENV['BUSSER_ROOT']}/../kitchen/data/serverspec_helper"


describe 'KairosDB packages' do
	it 'has the kairosdb package installed' do
		expect(package('kairosdb')).to be_installed
	end
end
