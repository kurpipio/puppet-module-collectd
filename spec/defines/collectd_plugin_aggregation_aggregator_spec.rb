require 'spec_helper'

describe 'collectd::plugin::aggregation::aggregator', :type => :define do
  let :facts do
    {:osfamily => 'Debian'}
  end

  context 'aggregate cpu' do
    let(:title) { 'cpu' }
    let :params do
      {
        :plugin           => 'cpu',
        :type             => 'cpu',
        :groupby          => ["Host", "TypeInstance"],
        :calculateaverage => true,
      }
    end
    it 'Will create /etc/collectd/conf.d/aggregator-cpu.conf' do
      should contain_file('/etc/collectd/conf.d/aggregator-cpu.conf').with_content("<Plugin \"aggregation\">\n  <Aggregation>\n    Plugin \"cpu\"\n    Type \"cpu\"\n\n\n    GroupBy \"Host\"\n    GroupBy \"TypeInstance\"\n\n    CalculateAverage true\n  </Aggregation>\n</Plugin>\n")
    end
  end

end




