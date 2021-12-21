Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B85E647C53B
	for <lists+openbmc@lfdr.de>; Tue, 21 Dec 2021 18:45:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJP4F4NXQz2yPv
	for <lists+openbmc@lfdr.de>; Wed, 22 Dec 2021 04:45:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=H1TXf7VR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3erlcyqckb7oxznhmjslttlqj.htrtujsgrhqnxyx.t4qfgx.twl@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=H1TXf7VR; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJP3J5P8zz303H
 for <openbmc@lists.ozlabs.org>; Wed, 22 Dec 2021 04:44:28 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id
 i187-20020a2522c4000000b006093b616e65so25282295ybi.17
 for <openbmc@lists.ozlabs.org>; Tue, 21 Dec 2021 09:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=tstkmqRThhOrJgyx+bXU0cB1kakh9VwqC35Xj4Y7sHs=;
 b=H1TXf7VRnhvGMYIuNGRoKHGhiNZhPjvZuVRFBftoQAFzYF+HVtPZBGPR9MbsjuT0r3
 VTVuSMjgf6AK1I6QRjatJmo1afgs0KKpqGMcyaaOvLBOe6wtQtZ8EgX85/5i0qULNMF+
 nFWOc9ocKD5OWCKF1uzkF2YeaPOUiB/B+vqDx/+RVKBO2neOm9xTZtDDH4QAye0OaidL
 ttBbW+cS0C0CUpU4YHp217FkYRGUEs85cvv5LW1jUnih3WJmySo+2vEAunexnqC4shT/
 DeVrXUJLrEjzDkTZgmbc9lyKm50XoahUitaBVZ+uBmBUZeX14NepKhKoNSDN1HYpebi/
 VvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=tstkmqRThhOrJgyx+bXU0cB1kakh9VwqC35Xj4Y7sHs=;
 b=OmKRcZzaYGOt9vptQro4ZKdyZ4Ddgxck69ZqK6fKfRQ2/Owz1k0LYY0Ivtx7Q7PzBB
 n7Fee6pSAIXmAfGcfD/mYpmC7+Fk7j9xrtJS4N3zM0xzSJBWx5aiTwQydwW0+gfpdwvd
 oJoBQE2tqutZWNxZrN3DAgyWYME6lrMDJJ5aPjDJmQe/gZh7/ojHrNeyHrH05Qptgoq6
 0LTjp3YXGuXOC2EGEyvoq9LVFu+72OP+IvaxpmCAful+APR3k1jKvcEck1qzNi+kWjtK
 J723Wm781l9W6ARA1TS2n4PShAkJGUC5/rOfVmrbXe3u4Q1t2qCtBpPXBq4hHJWIOOHX
 XHpQ==
X-Gm-Message-State: AOAM532Mx1yaXHFudIoEATLOdmn8KPXDfEZFFWSMA/oDEGe1lGryI5Ew
 Uge11XdNyCyoEPY2kNIlQju9+6rSJNHn
X-Google-Smtp-Source: ABdhPJxMMnb+SjpJddfxXapAUglYaX2Jb8fWQY/cObc9QUb+NeD49lwCuuDh+pO4gSgiAs1MAH7d+BqvFTtN
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:19fd:5987:f46f:7488])
 (user=suichen job=sendgmr) by 2002:a25:7802:: with SMTP id
 t2mr5915521ybc.158.1640108665998; Tue, 21 Dec 2021 09:44:25 -0800 (PST)
Date: Tue, 21 Dec 2021 09:43:42 -0800
In-Reply-To: <20211221174344.1249202-1-suichen@google.com>
Message-Id: <20211221174344.1249202-2-suichen@google.com>
Mime-Version: 1.0
References: <20211221174344.1249202-1-suichen@google.com>
X-Mailer: git-send-email 2.34.1.307.g9b7440fafd-goog
Subject: [RFC Patch v3 1/3] i2c debug counters as sysfs attributes
From: Sui Chen <suichen@google.com>
To: linux-kernel@vger.kernel.org
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
Cc: benjaminfair@google.com, andrew@aj.id.au, openbmc@lists.ozlabs.org,
 tali.perry1@gmail.com, krellan@google.com, linux-i2c@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Sui Chen <suichen@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This change adds a few example I2C debug counters as sysfs attributes:
- ber_cnt (bus error count)
- nack_cnt (NACK count)
- rec_fail_cnt, rec_succ_cnt (recovery failure/success count)
- timeout_cnt (timeout count)
- i2c_speed (bus frequency)
- tx_complete_cnt (transaction completed, including both as an initiator
  and as a target)

The function i2c_adapter_create_stats_folder creates a stats directory
in the device's sysfs directory to hold the debug counters. The platform
drivers are responsible for instantiating the counters in the stats
directory if applicable.

i2c_adapter_create_stats_folder is placed in i2c-core-base.c for fixing
a build error on arc700.

Signed-off-by: Sui Chen <suichen@google.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 drivers/i2c/i2c-core-base.c |  23 +++++++
 drivers/i2c/i2c-dev.c       | 124 ++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  28 ++++++++
 3 files changed, 175 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84f12bf90644a..64dd79d32a0c3 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1610,6 +1610,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
 	mutex_unlock(&core_lock);
 
+	i2c_adapter_create_stats_directory(adap);
+
 	return 0;
 
 out_reg:
@@ -2617,6 +2619,27 @@ void i2c_put_dma_safe_msg_buf(u8 *buf, struct i2c_msg *msg, bool xferred)
 
 	kfree(buf);
 }
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
+
+	stats = kzalloc(sizeof(*stats), GFP_KERNEL);
+	if (!stats) {
+		adapter->stats = NULL;
+		return 1;
+	}
+	adapter->stats = stats;
+	adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);
+	return 0;
+}
+
 EXPORT_SYMBOL_GPL(i2c_put_dma_safe_msg_buf);
 
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 77f576e516522..902a964d47b10 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -767,6 +767,130 @@ static void __exit i2c_dev_exit(void)
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
+static ssize_t ber_cnt_show(struct device *pdev,
+			    struct device_attribute *attr, char *buf)
+{
+	u64 *ber_cnt = kobj_to_adapter(pdev)->stats->ber_cnt;
+
+	if (!ber_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *ber_cnt);
+}
+DEVICE_ATTR_RO(ber_cnt);
+
+ssize_t nack_cnt_show(struct device *pdev,
+		      struct device_attribute *attr, char *buf)
+{
+	u64 *nack_cnt = kobj_to_adapter(pdev)->stats->nack_cnt;
+
+	if (!nack_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *nack_cnt);
+}
+DEVICE_ATTR_RO(nack_cnt);
+
+ssize_t rec_succ_cnt_show(struct device *pdev,
+			  struct device_attribute *attr, char *buf)
+{
+	u64 *rec_succ_cnt = kobj_to_adapter(pdev)->stats->rec_succ_cnt;
+
+	if (!rec_succ_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *rec_succ_cnt);
+}
+DEVICE_ATTR_RO(rec_succ_cnt);
+
+ssize_t rec_fail_cnt_show(struct device *pdev,
+			  struct device_attribute *attr, char *buf)
+{
+	u64 *rec_fail_cnt = kobj_to_adapter(pdev)->stats->rec_fail_cnt;
+
+	if (!rec_fail_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *rec_fail_cnt);
+}
+DEVICE_ATTR_RO(rec_fail_cnt);
+
+ssize_t timeout_cnt_show(struct device *pdev,
+			 struct device_attribute *attr, char *buf)
+{
+	u64 *timeout_cnt = kobj_to_adapter(pdev)->stats->timeout_cnt;
+
+	if (!timeout_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *timeout_cnt);
+}
+DEVICE_ATTR_RO(timeout_cnt);
+
+ssize_t i2c_speed_show(struct device *pdev,
+		       struct device_attribute *attr, char *buf)
+{
+	u64 *i2c_speed = kobj_to_adapter(pdev)->stats->i2c_speed;
+
+	if (!i2c_speed)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *i2c_speed);
+}
+DEVICE_ATTR_RO(i2c_speed);
+
+ssize_t tx_complete_cnt_show(struct device *pdev,
+			     struct device_attribute *attr, char *buf)
+{
+	u64 *tx_complete_cnt = kobj_to_adapter(pdev)->stats->tx_complete_cnt;
+
+	if (!tx_complete_cnt)
+		return 0;
+	return sysfs_emit(buf, "%llu\n", *tx_complete_cnt);
+}
+DEVICE_ATTR_RO(tx_complete_cnt);
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
+					const char *counter_name, void *data_source)
+{
+	int ret = 1;
+
+	if (!adapter->stats) {
+		if (i2c_adapter_create_stats_directory(adapter))
+			return;
+	}
+
+	if (!strcmp(counter_name, "ber_cnt")) {
+		adapter->stats->ber_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_ber_cnt.attr);
+	} else if (!strcmp(counter_name, "nack_cnt")) {
+		adapter->stats->nack_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_nack_cnt.attr);
+	} else if (!strcmp(counter_name, "rec_succ_cnt")) {
+		adapter->stats->rec_succ_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_succ_cnt.attr);
+	} else if (!strcmp(counter_name, "rec_fail_cnt")) {
+		adapter->stats->rec_fail_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_rec_fail_cnt.attr);
+	} else if (!strcmp(counter_name, "timeout_cnt")) {
+		adapter->stats->timeout_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_timeout_cnt.attr);
+	} else if (!strcmp(counter_name, "i2c_speed")) {
+		adapter->stats->i2c_speed = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_i2c_speed.attr);
+	} else if (!strcmp(counter_name, "tx_complete_cnt")) {
+		adapter->stats->tx_complete_cnt = data_source;
+		ret = sysfs_create_file(adapter->stats->kobj, &dev_attr_tx_complete_cnt.attr);
+	}
+
+	if (ret)
+		dev_warn(&adapter->dev, "Failed to create sysfs file for %s\n", counter_name);
+}
+
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e618..23914600af586 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -21,6 +21,7 @@
 #include <linux/of.h>		/* for struct device_node */
 #include <linux/swab.h>		/* for swab16 */
 #include <uapi/linux/i2c.h>
+#include <linux/slab.h> /* for kzalloc */
 
 extern struct bus_type i2c_bus_type;
 extern struct device_type i2c_adapter_type;
@@ -684,6 +685,27 @@ struct i2c_adapter_quirks {
 	u16 max_comb_2nd_msg_len;
 };
 
+/**
+ * I2C statistics
+ * The list of statistics are currently copied from npcm7xx.
+ * Perhaps a more universal set of statistics can be used.
+ *
+ * The stats are currently modeled as pointers to members in the bus drivers.
+ * A null pointer indicates the counter is not supported by the bus driver.
+ */
+struct i2c_adapter_stats {
+	struct kobject *kobj;
+
+	/* a NULL value means the counter is not available */
+	u64 *tx_complete_cnt;
+	u64 *ber_cnt;
+	u64 *nack_cnt;
+	u64 *rec_succ_cnt;
+	u64 *rec_fail_cnt;
+	u64 *timeout_cnt;
+	u64 *i2c_speed;
+};
+
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
 #define I2C_AQ_COMB			BIT(0)
 /* first combined message must be write */
@@ -735,12 +757,18 @@ struct i2c_adapter {
 
 	struct i2c_bus_recovery_info *bus_recovery_info;
 	const struct i2c_adapter_quirks *quirks;
+	struct i2c_adapter_stats *stats;
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+int i2c_adapter_create_stats_directory(struct i2c_adapter *adapter);
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter *adapter,
+					const char *counter_name, void *data_source);
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);
-- 
2.34.1.307.g9b7440fafd-goog

