Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF3331AD1
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:10:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYvz0hCXz3dSc
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:10:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IlYN/z0d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IlYN/z0d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYZ264Syz3cNt
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:34 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MXgcf097303; Mon, 8 Mar 2021 17:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0cXuMkSlSBiQ6j28n/0cifV7bGDNbhsjRyeEsiZJDa4=;
 b=IlYN/z0dA0ZagY9guWYFtKi/Arz3vXytzeSPiLi5oc7mcy3d5sHCh3OVRzHS7fDg7SUX
 7hqOlJHv4IYFVzbIaUKVdXyo2ELXm9lVD34a0MqSjQY20i6bntdslbjE3Qp84Mtg2s//
 3mHlXaAGOGvOAxrLweoWHuYW0w0h6R31i+YfUY8z9HmkWwtUaqLtaFI+3kH0X99teRDx
 a3RGLUCOO74d1g9i8mvBAsF6DEvww8MvhFeGcw7KXh72/8j85wl6TSmPZEznWprtPPsT
 NMuaWYLAGaV71mcmtm95B/prX2/M2y7tV7qWz+5bTRpEBRrkGQ1kNr9ub+VOmJDDwjQ5 /g== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 375vm8rmgk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:31 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128MkXob027617;
 Mon, 8 Mar 2021 22:54:30 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3741c89xsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:30 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsTeL26018252
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:29 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78AB6C605D;
 Mon,  8 Mar 2021 22:54:29 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45CCBC605A;
 Mon,  8 Mar 2021 22:54:29 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:29 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 31/35] i2c: Allow throttling of transfers to
 client devices
Date: Mon,  8 Mar 2021 16:54:15 -0600
Message-Id: <20210308225419.46530-32-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Jeffery <andrew@aj.id.au>

Some devices fail to cope in disastrous ways with the small command
turn-around times enabled by in-kernel device drivers.

Introduce per-client throttling of transfers to avoid these issues.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/i2c/i2c-core-base.c  |   8 +-
 drivers/i2c/i2c-core-smbus.c | 169 +++++++++++++++++++++++++++++------
 drivers/i2c/i2c-core.h       |  21 +++++
 include/linux/i2c.h          |   5 ++
 4 files changed, 172 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 573b5da145d1..fed369bcbc32 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -867,13 +867,17 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
 struct i2c_client *
 i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
 {
+	struct i2c_client_priv 	*priv;
 	struct i2c_client	*client;
 	int			status;
 
-	client = kzalloc(sizeof *client, GFP_KERNEL);
-	if (!client)
+	priv = kzalloc(sizeof *priv, GFP_KERNEL);
+	if (!priv)
 		return ERR_PTR(-ENOMEM);
 
+	mutex_init(&priv->throttle_lock);
+	client = &priv->client;
+
 	client->adapter = adap;
 
 	client->dev.platform_data = info->platform_data;
diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index f5c9787992e9..1dde58c8a387 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -10,6 +10,7 @@
  * SMBus 2.0 support by Mark Studebaker <mdsxyz123@yahoo.com> and
  * Jean Delvare <jdelvare@suse.de>
  */
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
@@ -21,6 +22,9 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/smbus.h>
 
+static s32 i2c_smbus_throttle_xfer(const struct i2c_client *client,
+				   char read_write, u8 command, int protocol,
+				   union i2c_smbus_data *data);
 
 /* The SMBus parts */
 
@@ -95,9 +99,9 @@ s32 i2c_smbus_read_byte(const struct i2c_client *client)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, 0,
-				I2C_SMBUS_BYTE, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, 0,
+					 I2C_SMBUS_BYTE, &data);
+
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte);
@@ -112,8 +116,8 @@ EXPORT_SYMBOL(i2c_smbus_read_byte);
  */
 s32 i2c_smbus_write_byte(const struct i2c_client *client, u8 value)
 {
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-	                      I2C_SMBUS_WRITE, value, I2C_SMBUS_BYTE, NULL);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, value,
+				       I2C_SMBUS_BYTE, NULL);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte);
 
@@ -130,9 +134,9 @@ s32 i2c_smbus_read_byte_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BYTE_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BYTE_DATA, &data);
+
 	return (status < 0) ? status : data.byte;
 }
 EXPORT_SYMBOL(i2c_smbus_read_byte_data);
@@ -150,10 +154,10 @@ s32 i2c_smbus_write_byte_data(const struct i2c_client *client, u8 command,
 			      u8 value)
 {
 	union i2c_smbus_data data;
+
 	data.byte = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_BYTE_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_BYTE_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_byte_data);
 
@@ -170,9 +174,9 @@ s32 i2c_smbus_read_word_data(const struct i2c_client *client, u8 command)
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_WORD_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_WORD_DATA, &data);
+
 	return (status < 0) ? status : data.word;
 }
 EXPORT_SYMBOL(i2c_smbus_read_word_data);
@@ -190,10 +194,10 @@ s32 i2c_smbus_write_word_data(const struct i2c_client *client, u8 command,
 			      u16 value)
 {
 	union i2c_smbus_data data;
+
 	data.word = value;
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_WORD_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_WORD_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_word_data);
 
@@ -218,9 +222,9 @@ s32 i2c_smbus_read_block_data(const struct i2c_client *client, u8 command,
 	union i2c_smbus_data data;
 	int status;
 
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_BLOCK_DATA, &data);
+
 	if (status)
 		return status;
 
@@ -248,9 +252,8 @@ s32 i2c_smbus_write_block_data(const struct i2c_client *client, u8 command,
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
 	memcpy(&data.block[1], values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_BLOCK_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_BLOCK_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_block_data);
 
@@ -264,9 +267,9 @@ s32 i2c_smbus_read_i2c_block_data(const struct i2c_client *client, u8 command,
 	if (length > I2C_SMBUS_BLOCK_MAX)
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
-	status = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-				I2C_SMBUS_READ, command,
-				I2C_SMBUS_I2C_BLOCK_DATA, &data);
+	status = i2c_smbus_throttle_xfer(client, I2C_SMBUS_READ, command,
+					 I2C_SMBUS_I2C_BLOCK_DATA, &data);
+
 	if (status < 0)
 		return status;
 
@@ -284,9 +287,8 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client, u8 command,
 		length = I2C_SMBUS_BLOCK_MAX;
 	data.block[0] = length;
 	memcpy(data.block + 1, values, length);
-	return i2c_smbus_xfer(client->adapter, client->addr, client->flags,
-			      I2C_SMBUS_WRITE, command,
-			      I2C_SMBUS_I2C_BLOCK_DATA, &data);
+	return i2c_smbus_throttle_xfer(client, I2C_SMBUS_WRITE, command,
+				       I2C_SMBUS_I2C_BLOCK_DATA, &data);
 }
 EXPORT_SYMBOL(i2c_smbus_write_i2c_block_data);
 
@@ -547,6 +549,71 @@ s32 i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 }
 EXPORT_SYMBOL(i2c_smbus_xfer);
 
+static int i2c_smbus_throttle_enter(const struct i2c_client *client)
+		__acquires(&priv->throttle_lock)
+{
+	struct i2c_client_priv *priv;
+	ktime_t earliest;
+	int rc;
+
+	priv = to_i2c_client_priv(client);
+
+	if (i2c_in_atomic_xfer_mode()) {
+		if (!mutex_trylock(&priv->throttle_lock))
+			return -EAGAIN;
+	} else {
+		rc = mutex_lock_interruptible(&priv->throttle_lock);
+		if (rc)
+			return rc;
+	}
+	earliest = ktime_add_us(priv->last, priv->delay_us);
+
+	if (priv->delay_us && ktime_before(ktime_get(), earliest)) {
+		if (i2c_in_atomic_xfer_mode()) {
+			mutex_unlock(&priv->throttle_lock);
+			return -EAGAIN;
+		}
+
+		usleep_range(priv->delay_us, 2 * priv->delay_us);
+	}
+
+	return 0;
+}
+
+static void i2c_smbus_throttle_exit(const struct i2c_client *client)
+		__releases(&priv->throttle_lock)
+{
+	struct i2c_client_priv *priv;
+
+	priv = to_i2c_client_priv(client);
+
+	if (priv->delay_us)
+		priv->last = ktime_get();
+	mutex_unlock(&priv->throttle_lock);
+}
+
+static s32 i2c_smbus_throttle_xfer(const struct i2c_client *client,
+				   char read_write, u8 command, int protocol,
+				   union i2c_smbus_data *data)
+{
+	s32 res;
+
+	res = i2c_smbus_throttle_enter(client);
+	if (res)
+		return res;
+
+	res = __i2c_lock_bus_helper(client->adapter);
+	if (!res)
+		res = __i2c_smbus_xfer(client->adapter, client->addr,
+				       client->flags, read_write, command,
+				       protocol, data);
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+
+	i2c_smbus_throttle_exit(client);
+
+	return res;
+}
+
 s32 __i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 		     unsigned short flags, char read_write,
 		     u8 command, int protocol, union i2c_smbus_data *data)
@@ -715,3 +782,47 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 }
 EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
 #endif
+
+int i2c_smbus_throttle_client(struct i2c_client *client,
+			       unsigned long delay_us)
+{
+	struct i2c_client_priv *priv;
+	int rc;
+
+	priv = to_i2c_client_priv(client);
+
+	if (i2c_in_atomic_xfer_mode()) {
+		if (!mutex_trylock(&priv->throttle_lock))
+			return -EAGAIN;
+	} else {
+		rc = mutex_lock_interruptible(&priv->throttle_lock);
+		if (rc)
+			return rc;
+	}
+	priv->delay_us = delay_us;
+	priv->last = ktime_get();
+	mutex_unlock(&priv->throttle_lock);
+
+	return 0;
+}
+
+int i2c_smbus_throttle_value(struct i2c_client *client, unsigned long *delay_us)
+{
+	struct i2c_client_priv *priv;
+	int rc;
+
+	priv = to_i2c_client_priv(client);
+
+	if (i2c_in_atomic_xfer_mode()) {
+		if (!mutex_trylock(&priv->throttle_lock))
+			return -EAGAIN;
+	} else {
+		rc = mutex_lock_interruptible(&priv->throttle_lock);
+		if (rc)
+			return rc;
+	}
+	*delay_us = priv->delay_us;
+	mutex_unlock(&priv->throttle_lock);
+
+	return 0;
+}
diff --git a/drivers/i2c/i2c-core.h b/drivers/i2c/i2c-core.h
index 8ce261167a2d..e916624c7b98 100644
--- a/drivers/i2c/i2c-core.h
+++ b/drivers/i2c/i2c-core.h
@@ -4,6 +4,27 @@
  */
 
 #include <linux/rwsem.h>
+#include <linux/i2c.h>
+#include <linux/timekeeping.h>
+#include <linux/kernel.h>
+#include <linux/mutex.h>
+
+struct i2c_client_priv {
+	struct i2c_client client;
+
+	/*
+	 * Per-client access throttling, described in terms of microsecond
+	 * delay between the end of the nth transfer and the start of the
+	 * (n+1)th transfer
+	 *
+	 * Do it in a wrapper struct to preserve const-ness of the i2c_smbus_*
+	 * interfaces.
+	 */
+	struct mutex throttle_lock;
+	unsigned long delay_us;
+	ktime_t last;
+};
+#define to_i2c_client_priv(c) container_of(c, struct i2c_client_priv, client)
 
 struct i2c_devinfo {
 	struct list_head	list;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 56622658b215..c05039e37d97 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -181,8 +181,13 @@ s32 i2c_smbus_write_i2c_block_data(const struct i2c_client *client,
 s32 i2c_smbus_read_i2c_block_data_or_emulated(const struct i2c_client *client,
 					      u8 command, u8 length,
 					      u8 *values);
+int i2c_smbus_throttle_client(struct i2c_client *client,
+			       unsigned long delay_us);
+int i2c_smbus_throttle_value(struct i2c_client *client,
+			     unsigned long *delay_us);
 int i2c_get_device_id(const struct i2c_client *client,
 		      struct i2c_device_identity *id);
+
 #endif /* I2C */
 
 /**
-- 
2.27.0

