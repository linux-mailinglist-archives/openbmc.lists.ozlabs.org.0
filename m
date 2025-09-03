Return-Path: <openbmc+bounces-582-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4610DB42614
	for <lists+openbmc@lfdr.de>; Wed,  3 Sep 2025 17:59:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cH6j640TSz30D3;
	Thu,  4 Sep 2025 01:58:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756915114;
	cv=none; b=RcWycfvSM3YQCCccZbwi3NMLtsyH7F+zPNXvC0jpq+HALB0jF3lHinKh5za0MaXNUc28Lc9If5q1McacrIsvwZ6Ax3K63KGbk8VjYPkUrx+OWr9q6uRHcajqLTh/6k7DDb7ESgShwVAEddHdzp7HzrHkU3xRCaNDyuZxC6lIJzGLZSMJU2ILNiVyGXRLU1uRKTgdrOh0/qrGtFcW5kOhv6ssVI1X5QhuD/dSI7J0cajo2on9vtvB8o1tfJd0odpe2nrOefGxxSJFcORcPCAH6uD+SBjDF0mZBcj5j6W+oeyebMy6yZ9xl8qSltSP5GglQ8IDpyqajIrXDyvuO7VJRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756915114; c=relaxed/relaxed;
	bh=vmk3boFNVCJH6lQ+BXNRN3IfyvNeqAQ3KBrcoMZaqQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hDbvQthHj6mL9NmQDJkUaN8AsoAefr+ATUMgnxXR2HS/2fREOQjz37ZdHeT/a+J0OrP5AbkB40VufO3dwSLKOMD2Mwzjt2wCNaoNGIyNXDy3bBWp48/IrghLF+eN49XC/iPYQ7uJMWHMyBS9jUfn3i4Y7UGtWbiIPobvKdiJip1I8U5p+mshbFeobNlwxCnhybxarCRqeu5iVmEROlWDkg6i/egcu91kBtEnAYDF/udrFp3KP95FLrLL8yctgxZbnZ2HWvlzbk3XLiAmpiUYqDEBzphXUQpjYyLFqOgjDL47wq4/Zz/s7ouURJ1YoBRA2onwJlINfsaKs/Vk6pHmnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gfKqmwrI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gfKqmwrI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cH6j45l7Mz3020
	for <openbmc@lists.ozlabs.org>; Thu,  4 Sep 2025 01:58:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5837wg9K031754;
	Wed, 3 Sep 2025 15:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vmk3boFNVCJH6lQ+B
	XNRN3IfyvNeqAQ3KBrcoMZaqQA=; b=gfKqmwrI5VO4zb5BGANJzKZM5MyKzOnc5
	dpGnGdHI4GSkZ/0YeQaObWr/xXxkuYOBOaG2wWn+UwC767Vqi78LTHL+zuD5IRiW
	6LVIqvLtSxfzRA02zRmVxLyGm4ecXp/eraAJbdT9wiXdqNjSsKoPC1ZvhHbIs0W/
	/8+tJDqhKArp2A1biIMZQ5i6w+lchgByqZzL/fysEICYC3aydkGB9AXazYc6jB0i
	q9a+9jPLCoJ0drWQz9ToxQ5cEbehUSv0PSjM+IYPSzx46ZJqDoFPud7Or8D9csps
	lwOcXYxxtEHH41wa3hM8VFrkuwuGCe7OF/LfLjvCn5ftbDg+JMovQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usv35cps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 583DvvPj017618;
	Wed, 3 Sep 2025 15:58:17 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vc10ratj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 15:58:17 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 583FwFU521561910
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 3 Sep 2025 15:58:15 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26E7058054;
	Wed,  3 Sep 2025 15:58:15 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB84F5804E;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  3 Sep 2025 15:58:14 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: ninad@linux.ibm.com
Subject: [PATCH linux dev-6.12 v2 5/6] i2c: core: Add mux root adapter operations
Date: Wed,  3 Sep 2025 10:58:07 -0500
Message-ID: <20250903155810.2839634-6-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250903155810.2839634-1-ninad@linux.ibm.com>
References: <20250903155810.2839634-1-ninad@linux.ibm.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vvpeOuhyO47NUqQ4ydRJtZaQ3pvLQyDN
X-Authority-Analysis: v=2.4 cv=FPMbx/os c=1 sm=1 tr=0 ts=68b8659a cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=yg26B0FpSW6sT4ThZqEA:9
X-Proofpoint-GUID: vvpeOuhyO47NUqQ4ydRJtZaQ3pvLQyDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX7r2NuRvrVBlo
 hfYoz2A+Q88Yxt6j74fgty+iQ8RfFKVBCHkNZnYj1bMSbghnqOU46A96mL/o7dJML++HjGcQgwB
 lci1x1bdo2vRd7U9l4V7jc3Q4/V5PaAw3Pja/oSsnT4zRcJ5Mcb2vrTC4F2wx4Z9RKMUiwTobXG
 bC97OwnVbkKUBn5m+NRqUNRaC7XP9euwS5B84pFPGJCwvXi1xFrIAbJjzyN/N4B33RI0/ApmCBu
 n/jxwxcc9EPrqk7LCT5T60lb6mcqa9GruNGtDaXLGs+6+Dz/3iMtBQqM3vufj3J2ju4sPwM4jqJ
 Mn7kPubnpjDKLxBkToMadIq+p+u01npYlbfGbmC/EBzZfKpPscnEovG4e7cBMmN55fEJrQ/epe6
 KU6LfFCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Eddie James <eajames@linux.ibm.com>

Some I2C clients need the ability to control the root I2C bus even if the
endpoint device is behind a mux. For example, a driver for a chip that
can't handle any I2C traffic on the bus while coming out of reset
(including an I2C-driven mux switching channels) may need to lock the root
bus with the mux selection fixed for the entire time the device is in
reset.
For this purpose, add a new structure containing two function pointers to
the adapter structure. These functions pointers should be defined for
every adapter. The lock_select operation, for a mux adapter, locks the
parent adpaters up to the root and selects the adapter's channel. The
unlock_deselect operation deselects the mux channel and unlocks all the
adapters. For a non-mux adapter, the operations lock and unlock the
adapters up to the root. This scheme should work with multiple levels of
muxes and regular adapters in between.

OpenBMC-Staging-Count: 4
Signed-off-by: Eddie James <eajames@linux.ibm.com>
Reviewed-by: Joel Stanley <joel@jms.id.au>
Link: https://lore.kernel.org/r/20220906202829.1921114-2-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/i2c/i2c-core-base.c | 38 ++++++++++++++++++++++++++++
 drivers/i2c/i2c-mux.c       | 50 +++++++++++++++++++++++++++++++++++++
 include/linux/i2c.h         | 42 +++++++++++++++++++++++++++++++
 3 files changed, 130 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 75d30861ffe21..0e60f24521220 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1430,6 +1430,41 @@ static const struct i2c_lock_operations i2c_adapter_lock_ops = {
 	.unlock_bus =  i2c_adapter_unlock_bus,
 };
 
+/*
+ * For a non-mux adapter, the lock_select operation locks the chain of
+ * adapters upwards, returning the root. If there's a mux above this adapter
+ * somehow, it should also get locked and the desired channel selected.
+ */
+static struct i2c_adapter *i2c_adapter_lock_select(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter *ret = adapter;
+	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+
+	if (parent) {
+		ret = parent->mux_root_ops->lock_select(parent);
+		if (IS_ERR(ret))
+			return ret;
+	}
+
+	adapter->lock_ops->lock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
+	return ret;
+}
+
+static void i2c_adapter_unlock_deselect(struct i2c_adapter *adapter)
+{
+	struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(adapter);
+
+	adapter->lock_ops->unlock_bus(adapter, I2C_LOCK_ROOT_ADAPTER);
+
+	if (parent)
+		parent->mux_root_ops->unlock_deselect(parent);
+}
+
+static const struct i2c_mux_root_operations i2c_adapter_mux_root_ops = {
+	.lock_select = i2c_adapter_lock_select,
+	.unlock_deselect = i2c_adapter_unlock_deselect,
+};
+
 static void i2c_host_notify_irq_teardown(struct i2c_adapter *adap)
 {
 	struct irq_domain *domain = adap->host_notify_domain;
@@ -1527,6 +1562,9 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (!adap->lock_ops)
 		adap->lock_ops = &i2c_adapter_lock_ops;
 
+	if (!adap->mux_root_ops)
+		adap->mux_root_ops = &i2c_adapter_mux_root_ops;
+
 	adap->locked_flags = 0;
 	rt_mutex_init(&adap->bus_lock);
 	rt_mutex_init(&adap->mux_lock);
diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
index fda72e8be8850..3ba9a8beb7685 100644
--- a/drivers/i2c/i2c-mux.c
+++ b/drivers/i2c/i2c-mux.c
@@ -197,6 +197,49 @@ static void i2c_parent_unlock_bus(struct i2c_adapter *adapter,
 	rt_mutex_unlock(&parent->mux_lock);
 }
 
+/*
+ * For a mux adapter, the lock_select operation first locks just like the
+ * lock_bus operation. Then it selects the channel for this adapter and
+ * returns the root adapter. If there is another mux above this one, calling
+ * the parent lock_select should ensure that the channel is correctly
+ * selected.
+ */
+static struct i2c_adapter *i2c_mux_lock_select(struct i2c_adapter *adapter)
+{
+	int ret;
+	struct i2c_mux_priv *priv = adapter->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+
+	rt_mutex_lock_nested(&parent->mux_lock, i2c_adapter_depth(adapter));
+
+	adapter = parent->mux_root_ops->lock_select(parent);
+	if (IS_ERR(adapter))
+		return adapter;
+
+	ret = muxc->select(muxc, priv->chan_id);
+	if (ret < 0) {
+		parent->mux_root_ops->unlock_deselect(parent);
+		rt_mutex_unlock(&parent->mux_lock);
+		return ERR_PTR(ret);
+	}
+
+	return adapter;
+}
+
+static void i2c_mux_unlock_deselect(struct i2c_adapter *adapter)
+{
+	struct i2c_mux_priv *priv = adapter->algo_data;
+	struct i2c_mux_core *muxc = priv->muxc;
+	struct i2c_adapter *parent = muxc->parent;
+
+	if (muxc->deselect)
+		muxc->deselect(muxc, priv->chan_id);
+
+	parent->mux_root_ops->unlock_deselect(parent);
+	rt_mutex_unlock(&parent->mux_lock);
+}
+
 struct i2c_adapter *i2c_root_adapter(struct device *dev)
 {
 	struct device *i2c;
@@ -267,6 +310,11 @@ static const struct i2c_lock_operations i2c_parent_lock_ops = {
 	.unlock_bus =  i2c_parent_unlock_bus,
 };
 
+static const struct i2c_mux_root_operations i2c_mux_root_ops = {
+	.lock_select = i2c_mux_lock_select,
+	.unlock_deselect = i2c_mux_unlock_deselect,
+};
+
 int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 			u32 force_nr, u32 chan_id)
 {
@@ -326,6 +374,8 @@ int i2c_mux_add_adapter(struct i2c_mux_core *muxc,
 	else
 		priv->adap.lock_ops = &i2c_parent_lock_ops;
 
+	priv->adap.mux_root_ops = &i2c_mux_root_ops;
+
 	/*
 	 * Try to populate the mux adapter's of_node, expands to
 	 * nothing if !CONFIG_OF.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 388ce71a29a97..3081a48b9ec67 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -595,6 +595,26 @@ struct i2c_lock_operations {
 	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
 };
 
+/**
+ * struct i2c_mux_root_operations - represent operations to lock and select
+ * the adapter's mux channel (if a mux is present)
+ * @lock_select: Get exclusive access to the root I2C bus adapter with the
+ *   correct mux channel selected for the adapter
+ * @unlock_deslect: Release exclusive access to the root I2C bus adapter and
+ *   deselect the mux channel for the adapter
+ *
+ * Some I2C clients need the ability to control the root I2C bus even if the
+ * endpoint device is behind a mux. For example, a driver for a chip that
+ * can't handle any I2C traffic on the bus while coming out of reset (including
+ * an I2C-driven mux switching channels) may need to lock the root bus with
+ * the mux selection fixed for the entire time the device is in reset.
+ * These operations are for such a purpose.
+ */
+struct i2c_mux_root_operations {
+	struct i2c_adapter *(*lock_select)(struct i2c_adapter *adapter);
+	void (*unlock_deselect)(struct i2c_adapter *adapter);
+};
+
 /**
  * struct i2c_timings - I2C timing information
  * @bus_freq_hz: the bus frequency in Hz
@@ -737,6 +757,7 @@ struct i2c_adapter {
 
 	/* data fields that are valid for all devices	*/
 	const struct i2c_lock_operations *lock_ops;
+	const struct i2c_mux_root_operations *mux_root_ops;
 	struct rt_mutex bus_lock;
 	struct rt_mutex mux_lock;
 
@@ -834,6 +855,27 @@ i2c_unlock_bus(struct i2c_adapter *adapter, unsigned int flags)
 	adapter->lock_ops->unlock_bus(adapter, flags);
 }
 
+/**
+ * i2c_lock_select_bus - Get exclusive access to the root I2C bus with the
+ *   target's mux channel (if a mux is present) selected.
+ * @adapter: Target I2C bus
+ *
+ * Return the root I2C bus if mux selection succeeds, an ERR_PTR otherwise
+ */
+static inline struct i2c_adapter *i2c_lock_select_bus(struct i2c_adapter *adapter)
+{
+	return adapter->mux_root_ops->lock_select(adapter);
+}
+
+/**
+ * i2c_unlock_deselect_bus - Release exclusive access to the root I2C bus
+ * @adapter: Target I2C bus
+ */
+static inline void i2c_unlock_deselect_bus(struct i2c_adapter *adapter)
+{
+	adapter->mux_root_ops->unlock_deselect(adapter);
+}
+
 /**
  * i2c_mark_adapter_suspended - Report suspended state of the adapter to the core
  * @adap: Adapter to mark as suspended
-- 
2.48.1


