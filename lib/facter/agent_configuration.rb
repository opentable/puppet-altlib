Facter.add(:agent_ssldir) do
  setcode { Puppet[:ssldir] }
end

Facter.add(:agent_config) do
  setcode { Puppet[:config] }
end

Facter.add(:agent_rundir) do
  setcode { Puppet[:rundir] }
end