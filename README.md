# Postfix queue length monitor for collectd

To install:
<pre>
Create <b>/etc/collectd/queue.sh</b> and make it executable
</pre>
On collectd.conf enable Exec plugin and configure the Exec plugin:
<pre>&lt;Plugin exec&gt;
	Exec postfix:postfix "/etc/collectd/queue.sh"
&lt;/Plugin&gt;</pre>

Its done!
