Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F93E94EA
	for <lists+openbmc@lfdr.de>; Wed, 11 Aug 2021 17:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GlDgx2svJz30Kh
	for <lists+openbmc@lfdr.de>; Thu, 12 Aug 2021 01:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a2WmYk2x;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a2WmYk2x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlDbl22BXz2yyf
 for <openbmc@lists.ozlabs.org>; Thu, 12 Aug 2021 01:42:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17BFYeuR024207; Wed, 11 Aug 2021 11:42:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sdsFtizRvEG3x4EbZ7iCorKhlzSX6QCo7dTHgcn2JQU=;
 b=a2WmYk2xi3HzajFridAy5GAzRl5yYIH72UaUovcwRwDoexgW6SFGc6PqZsTmudXX2HeK
 iBp2LigDFLc/a9jcIFbF2tGmL0v39rjffoveeFAiWqM9v30Rwtr9gBf9Y2Fpm0qGSe0z
 RZRDaEtwSF6JfsWSsaZ9aBSDQmyHABPkBBkSuc0vwpiYkRMBf3shO+txcDB3lcqqkDp9
 KWfawyuSn65y90Ux9Nh/Hbb6wRQDnGK07juJPhXXA+RQfABa2tEqN+fLza6IySmtXXys
 kGNMQaIf6oVfCXoQ7xvZevkCMkxOlpC4suNBFVeN4+0gsDB1n3M+21A/puvXSexxjo8I gg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3acby5sc45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 11:42:36 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17BFYsYM019467;
 Wed, 11 Aug 2021 15:42:35 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3a9hteyt13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Aug 2021 15:42:35 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17BFgYf036831578
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Aug 2021 15:42:34 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 72CA26A05A;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4364D6A05F;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.42.251])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Aug 2021 15:42:34 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 01/14] i2c: Allow throttling of transfers to
 client devices
Date: Wed, 11 Aug 2021 10:42:19 -0500
Message-Id: <20210811154232.12649-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210811154232.12649-1-eajames@linux.ibm.com>
References: <20210811154232.12649-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZYuVGI8erP0zAVPPcnCHVzCxEgKzNUr-
X-Proofpoint-ORIG-GUID: ZYuVGI8erP0zAVPPcnCHVzCxEgKzNUr-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-11_05:2021-08-11,
 2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110104
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
Cc: Andrew Jeffery <andrew@aj.id.au>
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
index bdce6d3e5327..bf35710d0407 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -871,13 +871,17 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
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
index a670ae129f4b..89dbe147040f 100644
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

