Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EC1529EC9
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 12:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Wwq6Y5cz3bqG
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 20:06:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=deOgNxB/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com;
 envelope-from=3hhodygckb5mfh5z41a3bb381.zb9bc1ay9z85fgf.bm8xyf.be3@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=deOgNxB/; dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2WwQ67Npz3brH
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 20:05:58 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-2d7eaa730d9so153659237b3.13
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=M7IGpJo20g6qdpbOYNHl9t4OXru5vzejsHQP1oVzQQk=;
 b=deOgNxB/rPuer4QvR9U4hnJgDoXAEGJnxfeE1gFNycjhT0OgPtZEz2/xRAOkQOuIaJ
 wRNqZuMVmCH9HOro5GJOygpgw6eNN7VtQ3rzM2rTUQZP0GHbCwR286O89qtwgcAHreTE
 JkoH3kqLBarEaEyv4scAs7PsQxFNZVwIARLlg4lec3hZ0shoezrzuXMU7lkMDAHkqsuA
 oAXQ3+2esLbc136NwfTuSB8495k3oQHy0VQPzMk1vzvMA5S3OG44tRu8x8KyX7cpGade
 wCWp9YBERuz/kkc1mWCqw0huF+nK+4xLXyFxaVv3Pxcj7mPacb3mJsm1Yo+9fZbXZyJr
 pCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=M7IGpJo20g6qdpbOYNHl9t4OXru5vzejsHQP1oVzQQk=;
 b=iTgqHTYxDIbShPSvreyGuLoT6aUAGaB7wSAiGdXLRv0yGNzOZvzY6zCknuZsPX+wAc
 9KrRH1QwPBhVy1435cri4klrzg25oMxes31JaWjhGZAOtaW1aJywbK+BB16uE57JfEXt
 P1RCnFYKE/oCbVHLQhRxfklenC46FniZ2F6vKW1eB+xYxcZ8d9rnljH7UOLOOp60gVUz
 fsF4+rMq7MfPsr6keBOk+VgJGdZJE8gK76Mp3xJ4ywzOtwMt5lBHdeq6uKy+fgbAy7Ji
 apOtYQGtHNufo1dkJsqaHfwbXxZee1Q7jqGDmRpXzsNzwN5e3EJ+FGiEY6WVOFTzFMfW
 PydA==
X-Gm-Message-State: AOAM530zVmXP5hxWJjLE+6TOVJz4L7x1SizVKh5atPS1lZcorg2wepDI
 xTg+kp4YzNJxjVC0vstMH3Fci6Q0ojbh
X-Google-Smtp-Source: ABdhPJx/Cp/IQu7Vjz5N3Z2e6+GlNi/+LhE6bPQVUpKyx2EvX+4JbVqOwD1tvTBbTRJiZfRn0O8AUi3P3UF+
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:ae7d:134a:180d:9b32])
 (user=suichen job=sendgmr) by 2002:a25:cd07:0:b0:64d:6cb9:7d88 with SMTP id
 d7-20020a25cd07000000b0064d6cb97d88mr14280136ybf.184.1652781956057; Tue, 17
 May 2022 03:05:56 -0700 (PDT)
Date: Tue, 17 May 2022 03:05:05 -0700
In-Reply-To: <20220517100505.2569874-1-suichen@google.com>
Message-Id: <20220517100505.2569874-2-suichen@google.com>
Mime-Version: 1.0
References: <20220517100505.2569874-1-suichen@google.com>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
Subject: [RFC Patch v5 1/1] i2c debug counters as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, wsa@kernel.org, 
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: andrew@aj.id.au, krellan@google.com, Sui Chen <suichen@google.com>,
 joel@jms.id.au, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change renames the I2C debug counters as suggested, and makes them
available to i2c_adapter's and i2c_client's:

 - bus_errors
 - transfers (only applicable to i2c_adapter)
 - messages (only applicable to i2c_client)
 - nacks
 - timeouts
 - recovery_successes (only applicable to i2c_adapter)
 - recovery_failures (only applicable to i2c_adapter)

The above stats are located in the sysfs path "stats". The kobj for
"stats" for a i2c-device or an i2c-adapter are added as children of
the device's and adapter's kobj.

Did some quick tests with QEMU using a program that saves/replays I2C
trace by reading hwmon sensors (the program is located at
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-tools/+/52527)

(normal read)
root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks}\
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks} && \
sleep 1 && ./i2c_bmk_bmc 0
46
0
92
0
/sys/class/hwmon/hwmon0/temp1_input: 0
[FindTraceEntries] t0=111.000000 t1=113.000000
Found 4 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_reply: i2c-1 #1 a=05c f=0001 l=2 [00-00]
 i2c_result: i2c-1 n=2 ret=2

root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks} \
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks}
47  <-- 1 more transfer on i2c-1
0
94  <-- 2 more messages sent to 1-005c
0

(deliberately nack)
root@gsj:~# sleep 1 && ./i2c_bmk_bmc 0
(injects 1 NACK using QEMU)
/sys/class/hwmon/hwmon0/temp1_input: 0
[FindTraceEntries] t0=116.000000 t1=118.000000
Found 3 interesting I2C trace entries:
 i2c_write: i2c-1 #0 a=05c f=0000 l=1 [00]
 i2c_read: i2c-1 #1 a=05c f=0001 l=2
 i2c_result: i2c-1 n=2 ret=-6

root@gsj:~# cat /sys/class/i2c-adapter/i2c-1/stats/{transfers,nacks} \
/sys/class/i2c-adapter/i2c-1/1-005c/stats/{messages,nacks}
47
1   <-- 1 more NACK on i2c-1
94
1   <-- 1 more NACK attributed to 1-005c

Signed-off-by: Sui Chen <suichen@google.com>
---
 drivers/i2c/i2c-core-base.c | 240 +++++++++++++++++++++++++++++++++++-
 drivers/i2c/i2c-dev.c       |  94 ++++++++++++++
 include/linux/i2c.h         |  41 ++++++
 3 files changed, 374 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84f12bf90644..4e7bd849f127 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -270,11 +270,22 @@ EXPORT_SYMBOL_GPL(i2c_generic_scl_recovery);
 
 int i2c_recover_bus(struct i2c_adapter *adap)
 {
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+
 	if (!adap->bus_recovery_info)
 		return -EBUSY;
 
 	dev_dbg(&adap->dev, "Trying i2c bus recovery\n");
-	return adap->bus_recovery_info->recover_bus(adap);
+	int ret = adap->bus_recovery_info->recover_bus(adap);
+
+	if (ret == 0)
+		++(adap->stats->recovery_successes);
+	else
+		++(adap->stats->recovery_failures);
+
+	return ret;
+
 }
 EXPORT_SYMBOL_GPL(i2c_recover_bus);
 
@@ -993,6 +1004,78 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 	return 0;
 }
 
+ssize_t i2c_client_stats_messages_show(struct kobject *kobj, struct kobj_attribute *addr,
+				       char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->messages);
+}
+
+struct kobj_attribute i2c_client_stats_messages_attr = {
+	.attr = { .name = "messages", .mode = 0444 },
+	.show = i2c_client_stats_messages_show,
+};
+
+ssize_t i2c_client_stats_bus_errors_show(struct kobject *kobj, struct kobj_attribute *addr,
+					 char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->bus_errors);
+}
+
+struct kobj_attribute i2c_client_stats_bus_errors_attr = {
+	.attr = { .name = "bus_errors", .mode = 0444 },
+	.show = i2c_client_stats_bus_errors_show,
+};
+
+ssize_t i2c_client_stats_nacks_show(struct kobject *kobj, struct kobj_attribute *addr,
+				    char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->nacks);
+}
+
+struct kobj_attribute i2c_client_stats_nacks_attr = {
+	.attr = { .name = "nacks", .mode = 0444 },
+	.show = i2c_client_stats_nacks_show,
+};
+
+ssize_t i2c_client_stats_timeouts_show(struct kobject *kobj, struct kobj_attribute *addr,
+				       char *buf)
+{
+	return sysfs_emit(buf, "%llu\n",
+		container_of(kobj, struct i2c_client_stats, kobj)->timeouts);
+}
+
+struct kobj_attribute i2c_client_stats_timeouts_attr = {
+	.attr = { .name = "timeouts", .mode = 0444 },
+	.show = i2c_client_stats_timeouts_show,
+};
+
+static struct attribute *i2c_client_stats_attrs[] = {
+	&i2c_client_stats_messages_attr.attr,
+	&i2c_client_stats_bus_errors_attr.attr,
+	&i2c_client_stats_nacks_attr.attr,
+	&i2c_client_stats_timeouts_attr.attr,
+	NULL
+};
+
+static struct kobj_type i2c_client_stats_ktype = {
+	.sysfs_ops = &kobj_sysfs_ops,
+	.default_attrs = i2c_client_stats_attrs,
+};
+
+/**
+ * Functions for maintaining the adapter -> client stats lookup structure
+ */
+static struct i2c_client_stats *__get_i2c_client_stats(struct i2c_adapter_stats *stats,
+						       int i2c_addr);
+static void __insert_i2c_client_stats(struct i2c_adapter_stats *stats,
+				      struct i2c_client_stats *client_stats,
+				      int i2c_addr);
+static void __remove_i2c_client_stats(struct i2c_adapter_stats *stats, int i2c_addr);
+static int __count_i2c_client_stats(struct i2c_adapter_stats *stats);
+
 /**
  * i2c_new_client_device - instantiate an i2c device
  * @adap: the adapter managing the device
@@ -1014,6 +1097,7 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 {
 	struct i2c_client	*client;
 	int			status;
+	struct i2c_client_stats *client_stats;
 
 	client = kzalloc(sizeof *client, GFP_KERNEL);
 	if (!client)
@@ -1069,6 +1153,20 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
 	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
 		client->name, dev_name(&client->dev));
 
+	client_stats = kzalloc(sizeof(*client_stats), GFP_KERNEL);
+	client->stats = client_stats;
+	client_stats->address = info->addr;
+
+	kobject_init_and_add(&client_stats->kobj, &i2c_client_stats_ktype,
+			     &client->dev.kobj, "stats");
+
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+
+	__insert_i2c_client_stats(adap->stats, client_stats, info->addr);
+	dev_info(&adap->dev, "Added i2c_client_stats, adapter has %d client stats now",
+		 __count_i2c_client_stats(adap->stats));
+
 	return client;
 
 out_remove_swnode:
@@ -1103,6 +1201,12 @@ void i2c_unregister_device(struct i2c_client *client)
 	if (ACPI_COMPANION(&client->dev))
 		acpi_device_clear_enumerated(ACPI_COMPANION(&client->dev));
 	device_remove_software_node(&client->dev);
+
+	__remove_i2c_client_stats(client->adapter->stats, client->addr);
+	dev_info(&client->adapter->dev, "Removed i2c_client_stats, adapter has %d client stats now",
+		 __count_i2c_client_stats(client->adapter->stats));
+	kfree(client->stats);
+
 	device_unregister(&client->dev);
 }
 EXPORT_SYMBOL_GPL(i2c_unregister_device);
@@ -2176,6 +2280,8 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	unsigned long orig_jiffies;
 	int ret, try;
+	int i, j, addr;
+	struct i2c_client_stats *cs;
 
 	if (WARN_ON(!msgs || num < 1))
 		return -EINVAL;
@@ -2223,6 +2329,50 @@ int __i2c_transfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		trace_i2c_result(adap, num, ret);
 	}
 
+	// Per-adapter I2C stats
+	if (!adap->stats)
+		i2c_adapter_create_stats_directory(adap);
+	if (ret < 0) {
+		if (ret == -ENXIO)
+			++(adap->stats->nacks);
+		else if (ret == -ETIMEDOUT)
+			++(adap->stats->timeouts);
+		else
+			++(adap->stats->bus_errors);
+	} else if (num > 0) {
+		++(adap->stats->transfers);
+	}
+
+	// Per-address I2C stats
+	// If no errors, incerement the message count per client
+	if (ret >= 0) {
+		for (i = 0; i < ret; ++i) {
+			addr = msgs[i].addr;
+			cs = __get_i2c_client_stats(adap->stats, addr);
+			if (!cs)  // For muxed devices, their stats are at the leaf level
+				continue;
+			if (num > 0)
+				++(cs->messages);
+		}
+	} else {  // Otherwise, attribute the error to each of the distinct addresses
+		for (i = 0; i < num; ++i) {
+			for (j = 0; j < i; ++j) {  // de-duplicate
+				if (msgs[i].addr == msgs[j].addr)
+					goto done;
+			}
+			cs = __get_i2c_client_stats(adap->stats, msgs[i].addr);
+			if (!cs)
+				continue;
+			if (ret == -ENXIO)
+				++(cs->nacks);
+			else if (ret == -ETIMEDOUT)
+				++(cs->timeouts);
+			else
+				++(cs->bus_errors);
+done:
+			{}
+		}
+	}
 	return ret;
 }
 EXPORT_SYMBOL(__i2c_transfer);
@@ -2619,6 +2769,94 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
 }
 EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
 
+static struct i2c_client_stats *__get_i2c_client_stats(struct i2c_adapter_stats *stats,
+						       int i2c_addr)
+{
+	int addr;
+	struct rb_node *n, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	n = stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (n) {
+		parent = n;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr)
+			n = n->rb_left;
+		else if (addr < i2c_addr)
+			n = n->rb_right;
+		else
+			return cs_node->stats;
+	}
+	return NULL;
+}
+
+static void __insert_i2c_client_stats(struct i2c_adapter_stats *stats,
+				      struct i2c_client_stats *client_stats, int i2c_addr)
+{
+	char buf[32];
+	int ret, addr;
+	struct rb_node **link, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	ret = 1;
+	link = &stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (*link) {
+		parent = *link;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr)
+			link = &(*link)->rb_left;
+		else if (addr < i2c_addr)
+			link = &(*link)->rb_right;
+		else
+			return; // Already exists
+	}
+
+	cs_node = kzalloc(sizeof(*cs_node), GFP_KERNEL);
+
+	cs_node->stats = client_stats;
+	rb_link_node(&cs_node->rb_node, parent, link);
+	rb_insert_color(&cs_node->rb_node, &stats->i2c_client_stats_root);
+}
+
+static void __remove_i2c_client_stats(struct i2c_adapter_stats *stats, int i2c_addr)
+{
+	int addr;
+	struct rb_node *n, *parent;
+	struct i2c_client_stats_rbnode *cs_node;
+
+	n = stats->i2c_client_stats_root.rb_node;
+	parent = NULL;
+	while (n) {
+		parent = n;
+		cs_node = rb_entry(parent, struct i2c_client_stats_rbnode, rb_node);
+		addr = cs_node->stats->address;
+		if (addr > i2c_addr) {
+			n = n->rb_left;
+		} else if (addr < i2c_addr) {
+			n = n->rb_right;
+		} else {
+			rb_erase(&cs_node->rb_node, &stats->i2c_client_stats_root);
+			return;
+		}
+	}
+}
+
+static int __count_i2c_client_stats(struct i2c_adapter_stats *stats)
+{
+	struct rb_node *n = stats->i2c_client_stats_root.rb_node;
+	int ret = 0;
+
+	while (n) {
+		++ret;
+		n = rb_next(n);
+	}
+	return ret;
+}
+
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C-Bus main module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 77f576e51652..50141dd42796 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -767,6 +767,100 @@ static void __exit i2c_dev_exit(void)
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
 
+static struct i2c_adapter *kobj_to_adapter(struct device *pdev)
+{
+	struct kobject *dev_kobj;
+	struct device *dev;
+
+	dev_kobj = ((struct kobject *)pdev)->parent;
+	dev = container_of(dev_kobj, struct device, kobj);
+	return to_i2c_adapter(dev);
+}
+
+ssize_t bus_errors_show(struct device *pdev,
+			struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->bus_errors);
+}
+DEVICE_ATTR_RO(bus_errors);
+
+ssize_t transfers_show(struct device *pdev,
+		       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->transfers);
+}
+DEVICE_ATTR_RO(transfers);
+
+ssize_t nacks_show(struct device *pdev,
+		   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->nacks);
+}
+DEVICE_ATTR_RO(nacks);
+
+ssize_t recovery_successes_show(struct device *pdev,
+				struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_successes);
+}
+DEVICE_ATTR_RO(recovery_successes);
+
+ssize_t recovery_failures_show(struct device *pdev,
+			       struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->recovery_failures);
+}
+DEVICE_ATTR_RO(recovery_failures);
+
+ssize_t timeouts_show(struct device *pdev,
+		      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%llu\n", kobj_to_adapter(pdev)->stats->timeouts);
+}
+DEVICE_ATTR_RO(timeouts);
+
+/**
+ * i2c_adapter_create_stats_directory - creates folder for I2C statistics.
+ * @adapter: the i2c_adapter to create the stats directory for.
+ *
+ * Return: 0 if successful, 1 if failed.
+ */
+int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter_stats *stats;
+	int ret = 1;
+
+	stats = kzalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats) {
+		adapter->stats = NULL;
+		return ret;
+	}
+	adapter->stats = stats;
+	adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_transfers.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for tx_complete_cnt\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_bus_errors.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for bus_errors\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nacks.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for nacks\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_successes.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_successes\n");
+
+	ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_recovery_failures.attr);
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for recovery_failures\n");
+
+	return ret;
+}
+
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e61..4547c4c782b6 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -20,6 +20,7 @@
 #include <linux/irqdomain.h>		/* for Host Notify IRQ */
 #include <linux/of.h>		/* for struct device_node */
 #include <linux/swab.h>		/* for swab16 */
+#include <linux/rbtree.h>
 #include <uapi/linux/i2c.h>
 
 extern struct bus_type i2c_bus_type;
@@ -297,6 +298,20 @@ struct i2c_driver {
 };
 #define to_i2c_driver(d) container_of(d, struct i2c_driver, driver)
 
+int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
+					const char *counter_name, void *data_source);
+
+struct i2c_client_stats {
+	struct kobject kobj;
+	int address;
+	u64 messages;
+	u64 bus_errors;
+	u64 nacks;
+	u64 timeouts;
+};
+
 /**
  * struct i2c_client - represent an I2C slave device
  * @flags: see I2C_CLIENT_* for possible flags
@@ -342,6 +357,7 @@ struct i2c_client {
 	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
 #endif
 	void *devres_group_id;		/* ID of probe devres group	*/
+	struct i2c_client_stats *stats; /* i2c client stats             */
 };
 #define to_i2c_client(d) container_of(d, struct i2c_client, dev)
 
@@ -684,6 +700,30 @@ struct i2c_adapter_quirks {
 	u16 max_comb_2nd_msg_len;
 };
 
+/**
+ * I2C adapter statistics
+ */
+struct i2c_adapter_stats {
+	struct kobject *kobj;
+
+	u64 transfers;
+	u64 bus_errors;
+	u64 nacks;
+	u64 recovery_successes;
+	u64 recovery_failures;
+	u64 timeouts;
+
+	struct rb_root i2c_client_stats_root;
+};
+
+struct i2c_client_stats_rbnode {
+	struct i2c_client_stats *stats;
+	struct rb_node rb_node;
+};
+
+struct i2c_client_stats *__get_or_create_i2c_client_stats(struct i2c_adapter_stats *stats,
+							  int i2c_addr);
+
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
 #define I2C_AQ_COMB			BIT(0)
 /* first combined message must be write */
@@ -738,6 +778,7 @@ struct i2c_adapter {
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
+	struct i2c_adapter_stats *stats;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
-- 
2.36.0.550.gb090851708-goog

