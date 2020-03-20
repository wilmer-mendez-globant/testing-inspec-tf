# encoding: utf-8

title 'two tier setup testing'

# load data from terraform output that populates json file
content = inspec.profile.file("terraform_output.json")
params = JSON.parse(content)

INSTANCE_ID = params['instance_id']['value']
VPC_ID = params['vpc_id']['value']
ELB_SG_ID = params['elb_security_group_id']['value']
EC2_SG_ID = params['ec2_security_group_id']['value']

# execute test
describe aws_vpc(vpc_id: VPC_ID) do
  its('cidr_block') { should cmp '10.0.0.0/16' }
end

describe aws_security_group(group_name: 'sg_example_sdc_ec2') do
  it { should exist }
  its('group_id') {should eq EC2_SG_ID} 
  its('group_name') { should eq 'sg_example_sdc_ec2' }
  its('description') { should eq 'SG allows access to EC2 instances' }
  its('vpc_id') { should eq VPC_ID }  
end

describe aws_security_group(ELB_SG_ID) do
  it { should exist }
  its('group_name') { should eq 'sg_example_sdc_elb' }
  its('description') { should eq 'SG allows access to ELB' }
  its('vpc_id') { should eq VPC_ID }  
end

describe # http://inspec.io/docs/reference/resources/aws_elb
describe aws_elb('sdc-example-elb') do
  it { should exist }
  its('external_ports') { should include 80 }
  its('internal_ports') { should include 80 }
  its('instance_ids') { should include INSTANCE_ID }
end

describe aws_ec2_instance(INSTANCE_ID) do
  it { should be_running }
  its('instance_type') { should eq 't2.micro' }
  its('image_id') { should eq 'ami-0fc20dd1da406780b' }
end
