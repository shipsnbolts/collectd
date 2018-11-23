# Postfix queue length monitor for collectd

To install:
<pre>
Create <b>/etc/collectd/queue.sh</b> and make it executable
</pre>
On collectd.conf enable Exec plugin and configure the Exec plugin:
<pre><Plugin exec>
	Exec postfix:postfix "/etc/collectd/queue.sh"
</Plugin></pre>

Its done!
