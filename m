Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D63325A651
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:19:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhFgR4ZhFzDqTN
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:19:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Fzfy+mt8; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=CSkx8Rtb; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhFf30FzJzDqLl
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 17:18:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C234A5C0189;
 Wed,  2 Sep 2020 03:18:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Sep 2020 03:18:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=apf0w6uSspxIj
 iE/gEi4e8hpQHuG54bqfxnADmsjXn0=; b=Fzfy+mt8VQNtQCtlGYh7MK4NOYKMc
 zbQPzkRhdMbLRc4vLZO89XWvDAriotZfP+SBcOCM7qEgz2kwXrG8eVJl6G4YQ8AG
 JCsWHcvvdV/i7BVgXp798NKwH5mr+luoZ3OCOweeqe9QAM3C4tBUyh51dRuZSC/p
 b4ojazBqeg67/7PbUNwq59UvrGJYc3oys2rAI/rjpLyHd7QQNGBmOY6qb1OYiLeL
 wkzI9RVPrTyjjYhHalU1+ca7mKsK58LoELXV1CkTpuqAJiAJcOEvcnuw4eegm2si
 xyRy8a2irPCd/O05xeK+U07Puo2vAleFIzsCfT2HZLscFHx9ER5vSb8uQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=apf0w6uSspxIjiE/gEi4e8hpQHuG54bqfxnADmsjXn0=; b=CSkx8Rtb
 lhCL9KQ+LTTFxYADzGGtosgxBoLBOcnMgq/hnfB1o9XXtKz0poG3LJt69paFWoab
 J0lkLRxFM/ujn413rpJApZWr9YsyPyVTgnSY1UBha7t9inEdyYqdnl9G7iE7Ri6F
 lZTpCkR74RwEzzmsWfO+7dg7WBkUyL7TLuMXoJRmHwLRv2quR75e1D9SDjuSWNnU
 0g178+URx7KFrVVVfegPMRRz9oO4rbqNEAp+qfR0ik+UoON/lXVIfez53ekWZSLW
 TP4ybDIZ3n6RLgM234GozIQZbIosuTn35t7+GV74Q4REEjDejrLlLrUOuRXZZBYC
 O5NRvu5EFFc0pA==
X-ME-Sender: <xms:N0dPX7EzXR5pSjmLXmK1nYeK02XzwYzcLoltKgKPF9wdKE0f36Nqxg>
 <xme:N0dPX4UkQheDwEJK-jD1q_-Q4nn_nsS22na6czOWbAZe36dTj5M0fVcpfxOfgP2AK
 boKC-kqcZbdjWmmkQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:N0dPX9Ji9UtGC4zCYGpY1DEZv5AFzCP4YuVIY4BjYq3tgZiRgdhWbw>
 <xmx:N0dPX5Erv0gWQ5VhPHq3L_DEYDJeEuk6dFjdI8JQvJyhvaNjhb6pkQ>
 <xmx:N0dPXxWXed7UvKTAsQunn3fcsMBUTI5swLTAjYGWGUEZqiKTapBoqQ>
 <xmx:N0dPXwCDMmY70NJGEE-HJuif-qsOnwtK74D4OAjyKrI5qXvqrxCj6g>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 90D7C3280066;
 Wed,  2 Sep 2020 03:18:14 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 1/3] i2c: Allow throttling of transfers to
 client devices
Date: Wed,  2 Sep 2020 16:47:34 +0930
Message-Id: <20200902071736.2578715-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902071736.2578715-1-andrew@aj.id.au>
References: <20200902071736.2578715-1-andrew@aj.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 26f03a14a478..caf23868e490 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -741,13 +741,17 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
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
index 94ff1693b391..d56ee47da5b3 100644
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
index 4e7714c88f95..941dde784472 100644
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
2.25.1

