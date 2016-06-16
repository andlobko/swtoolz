class CheckHostStatusICMPWorker
  #include Sidekiq::Worker
  include SidekiqStatus::Worker
  include NetTools

  def perform(host_klass, host_id)
    addr = host_klass.constantize.find(host_id) rescue addr = nil
    icmp_ping?(host_id) if addr
  end
end