Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A493467015
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 03:38:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4xpY1c73z2yxm
	for <lists+openbmc@lfdr.de>; Fri,  3 Dec 2021 13:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=IYtDe7wT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--suichen.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=394kpyqckb7yoqeydajckkcha.ykiklajxiyheopo.kvhwxo.knc@flex--suichen.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=IYtDe7wT; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4xnR2K3Lz2ywZ
 for <openbmc@lists.ozlabs.org>; Fri,  3 Dec 2021 13:37:46 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id
 m129-20020a632687000000b00324df4ad6c7so981671pgm.19
 for <openbmc@lists.ozlabs.org>; Thu, 02 Dec 2021 18:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5WF5G+TcHHJeFt6VfxRNn7xMKf0NVElrgo69xG5Qf+M=;
 b=IYtDe7wTYZDOLQOSe/34GHxczGrRTctcpA7QDSQSt9aPu2WSt7uv1SBnelKXmYriYk
 Ur4UU/PJ8vDNJ4fZZYka6apkFvO+Utv25mKr6CyQcpX8rN+NTGpV8Vcu9mOn9OXPopUs
 Zf9ASYmDMK/0vLFd0/HDn3Ny3OAgvbGM0iVdTmuM07ecTms4rMdyQeTBzGrZtlUpxaKE
 i1f1EUHb8ly9cass7tC/zJs/3Qei+fXc7hr792BesgGSbE2J9vBzEERIHETQIYwwL708
 WJnYnAtV0f2CQYaOFMeFyrQ373QBluf6oVIWgtrkzQlkgzmPpP4MyDJyNbazFtgELZqa
 z5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5WF5G+TcHHJeFt6VfxRNn7xMKf0NVElrgo69xG5Qf+M=;
 b=yMdJ5gLV2Q7IfprfATMjR48UzzmZr6fcJX/qLOKHVdFA9krY0fMqCi1G1q8621evFu
 ZSl6y0crIPATW+Op3TMEe3Ntpae/69e/91ARX204ikLwSTbw2uD05ztJSEOPFcimjyN0
 hnT/JuD0fVpYv+LSOsKCCQYgBGunOxPy9Dfu8KXO+vejf14qtjihTFpM6F2N+Idayu0+
 yeNmBRukFI0gnEWxXlxVa6r0UauGSDhz0uztmK1SxM38kuZ5jSu0/Oge104oq4grfFDz
 UGhWd4YORWz26a2Pu4uWMogpMtr3tPt1XHCkDvpebOhL5E1qAXkacFxI2Nqq3geoyMk6
 WrRw==
X-Gm-Message-State: AOAM530efzPB6YR6opCac+k3shdgdT8lB8ylAMj8oLlapDIuZahfu3n5
 o2u3qNNpCowv2I4+PU6qooNLsvltyV3e
X-Google-Smtp-Source: ABdhPJyQ/+bB1G+I/tQvi31Cv+12nyml5oP1Y2EX10+bIUa/WXGtflZu+fKUT3s7JiAf0tXn5wk0IuD0Skfr
X-Received: from suichen.svl.corp.google.com
 ([2620:15c:2c5:13:bc47:f5e4:20fa:844b])
 (user=suichen job=sendgmr) by 2002:aa7:8e48:0:b0:4a7:fe01:5971 with SMTP id
 d8-20020aa78e48000000b004a7fe015971mr16266876pfr.20.1638499063506; Thu, 02
 Dec 2021 18:37:43 -0800 (PST)
Date: Thu,  2 Dec 2021 18:37:26 -0800
In-Reply-To: <20211203023728.3699610-1-suichen@google.com>
Message-Id: <20211203023728.3699610-2-suichen@google.com>
Mime-Version: 1.0
References: <20211203023728.3699610-1-suichen@google.com>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
Subject: [RFC Patch v2 1/3] i2c debug counters as sysfs attributes
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
 joe@perches.com, Sui Chen <suichen@google.com>
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

Signed-off-by: Sui Chen <suichen@google.com>
---
 drivers/i2c/i2c-core-base.c |   2 +
 drivers/i2c/i2c-dev.c       | 103 ++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         |  27 ++++++++++
 3 files changed, 132 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 84f12bf90644a..c42113daf32a7 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1610,6 +1610,8 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	bus_for_each_drv(&i2c_bus_type, NULL, adap, __process_new_adapter);
 	mutex_unlock(&core_lock);
 
+	i2c_adapter_create_stats_folder(adap);
+
 	return 0;
 
 out_reg:
diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 77f576e516522..75f5e25400fdb 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -767,6 +767,109 @@ static void __exit i2c_dev_exit(void)
 	unregister_chrdev_region(MKDEV(I2C_MAJOR, 0), I2C_MINORS);
 }
 
+
+static struct i2c_adapter* kobj_to_adapter(struct device* pdev) {
+	struct kobject* dev_kobj = ((struct kobject*)pdev)->parent;
+	struct device* dev = container_of(dev_kobj, struct device, kobj);
+	return to_i2c_adapter(dev);
+}
+
+static ssize_t ber_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* ber_cnt = kobj_to_adapter(pdev)->stats->ber_cnt;
+	if (ber_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *ber_cnt);
+}
+DEVICE_ATTR_RO(ber_cnt);
+
+ssize_t nack_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* nack_cnt = kobj_to_adapter(pdev)->stats->nack_cnt;
+	if (nack_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *nack_cnt);
+}
+DEVICE_ATTR_RO(nack_cnt);
+
+ssize_t rec_succ_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* rec_succ_cnt = kobj_to_adapter(pdev)->stats->rec_succ_cnt;
+	if (rec_succ_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *rec_succ_cnt);
+}
+DEVICE_ATTR_RO(rec_succ_cnt);
+
+ssize_t rec_fail_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* rec_fail_cnt = kobj_to_adapter(pdev)->stats->rec_fail_cnt;
+	if (rec_fail_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *rec_fail_cnt);
+}
+DEVICE_ATTR_RO(rec_fail_cnt);
+
+ssize_t timeout_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* timeout_cnt = kobj_to_adapter(pdev)->stats->timeout_cnt;
+	if (timeout_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *timeout_cnt);
+}
+DEVICE_ATTR_RO(timeout_cnt);
+
+ssize_t i2c_speed_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* i2c_speed = kobj_to_adapter(pdev)->stats->i2c_speed;
+	if (i2c_speed == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *i2c_speed);
+}
+DEVICE_ATTR_RO(i2c_speed);
+
+ssize_t tx_complete_cnt_show(struct device* pdev,
+	struct device_attribute* attr, char* buf) {
+	u64* tx_complete_cnt = kobj_to_adapter(pdev)->stats->tx_complete_cnt;
+	if (tx_complete_cnt == NULL) return 0;
+	return sysfs_emit(buf, "%llu\n", *tx_complete_cnt);
+}
+DEVICE_ATTR_RO(tx_complete_cnt);
+
+void i2c_adapter_create_stats_folder(struct i2c_adapter* adapter) {
+	adapter->stats = kzalloc(sizeof(struct i2c_adapter_stats), GFP_KERNEL);
+	adapter->stats->kobj = kobject_create_and_add("stats", &adapter->dev.kobj);;
+}
+
+void i2c_adapter_stats_register_counter(struct i2c_adapter* adapter,
+	const char* counter_name, void* data_source) {
+	int ret;
+	if (adapter->stats == NULL) {
+		i2c_adapter_create_stats_folder(adapter);
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
+	if (ret) {
+		printk("Failed to create sysfs file for %s", counter_name);
+	}
+}
+
 MODULE_AUTHOR("Frodo Looijaard <frodol@dds.nl>");
 MODULE_AUTHOR("Simon G. Vogl <simon@tk.uni-linz.ac.at>");
 MODULE_DESCRIPTION("I2C /dev entries driver");
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 3eb60a2e9e618..448249eb6ca2e 100644
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
+	struct kobject* kobj;
+
+	/* a NULL value means the counter is not available */
+	u64* tx_complete_cnt;
+	u64* ber_cnt;
+	u64* nack_cnt;
+	u64* rec_succ_cnt;
+	u64* rec_fail_cnt;
+	u64* timeout_cnt;
+	u64* i2c_speed;
+};
+
 /* enforce max_num_msgs = 2 and use max_comb_*_len for length checks */
 #define I2C_AQ_COMB			BIT(0)
 /* first combined message must be write */
@@ -735,12 +757,17 @@ struct i2c_adapter {
 
 	struct i2c_bus_recovery_info *bus_recovery_info;
 	const struct i2c_adapter_quirks *quirks;
+	struct i2c_adapter_stats* stats;
 
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 };
 #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
 
+void i2c_adapter_create_stats_folder(struct i2c_adapter* adapter);
+void i2c_adapter_stats_register_counter(struct i2c_adapter* adapter,
+	const char* counter_name, void* data_source);
+
 static inline void *i2c_get_adapdata(const struct i2c_adapter *adap)
 {
 	return dev_get_drvdata(&adap->dev);
-- 
2.34.0.384.gca35af8252-goog

