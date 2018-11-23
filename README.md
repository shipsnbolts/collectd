# Postfix queue length plugin for collectd

To install:

Create /etc/collectd/queue.sh and make it executable

Configure the Exec plugin:

<Plugin exec>
	Exec postfix:postfix "/etc/collectd/queue.sh"
</Plugin>
