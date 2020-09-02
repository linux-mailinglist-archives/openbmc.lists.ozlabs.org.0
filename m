Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D2925A655
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:20:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhFj23NC2zDqNC
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:20:54 +1000 (AEST)
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
 header.s=fm3 header.b=FP/wi00h; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kBTWsLvZ; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhFf50hrHzDqNC
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 17:18:20 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C71A95C015A;
 Wed,  2 Sep 2020 03:18:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Sep 2020 03:18:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=DF+8WFKZkNfE/
 hAl8yMNRNK11HZVnTOJW81VOZQCus0=; b=FP/wi00hr4FvKkskg+PMRDgMfiuQX
 aoDi3LCdxbCxMpnFp9AJ9naI1+gLA96PcUF8O6Cu33/OQ/8mcDyTsKhPN1YTsHj/
 tCcL4wnoICE5Aift2N9dDkmoooOmoG0SlrlCXyDzEHvKwuGwhk9avd/AsRZnvFxY
 piGj7HRK7eIRb9Qhd4yOpFCt3+qHKchfZTC0jEO3d3MrX+DR/w2z0nFwJokPwocL
 5FDsbLTlxfVqzqOtwNc+Ax3M1ihiBgSqxScHZ9Ur5PSo4uA+QE+CHTsaN8y2GcAi
 57GKlYflZdtVUyJQfCTrLCQ7ZV+4fqPGN/LWtV+T9Pp7ftlU0KPFNfH/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=DF+8WFKZkNfE/hAl8yMNRNK11HZVnTOJW81VOZQCus0=; b=kBTWsLvZ
 M+3QoNxLpmOgH00sk+F84yKpVyaQxZJOq61/KIakbGSY/grzsN/ob/+2R03maz6O
 gtHiNYUbZm2jAqtjPV17JtvF8Mm6Sw5yK3yMsKflRVArWxKk3Mlx30Jv7Ydvj+Jw
 kaoVhvG22meuHoe4yWsJtYvvJZBCXFTKwoITNROSe9ctrcmZJ4jQHJJYW5J9UWQc
 xpHtwlfSDZnuwHC9b7nVzbqyYBKBndib5DLK9bWkBf11ij2dQ+rGo37G7kq0xuvH
 nqniOuo69XmSdv4eJeXj6JUdHsNTUya3MfUVvoPY7PlELJXPxU11QqYC0yLgguPk
 7AsMx+4RNib6TQ==
X-ME-Sender: <xms:OkdPXw1RgOXUgl9_xw95HvfK7QiMkE7FKpgC9NvvTngNCeff48sAbg>
 <xme:OkdPX7FMZkZ5o2iqZBbW6aSIpqVzbf5XdyB98qWjzkHi3bBRfvCSbVQdsoRBsECgL
 K4qAqO9BZBnPpJNbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OkdPX44FAguXw2lg8wUaqID9RTqyeKB_1vlUnfU7Uv74e8F12Jc1FA>
 <xmx:OkdPX51dpQiHjI4TFjVCDG4FPmCE0MS6H_ApBCP0DQ0jLtDrVn3zCw>
 <xmx:OkdPXzGug--R3mTj0vNUBi-335gN_NZw_Ji4bxx3q8QLp_5LS7OyIQ>
 <xmx:OkdPX6wEKxEBjHYXLV0UStcyzYTynj3ad__wDa2wRVJOYNIQc-4AHA>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 93F0E328005D;
 Wed,  2 Sep 2020 03:18:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 3/3] ucd9000: Add a throttle delay attribute in
 debugfs
Date: Wed,  2 Sep 2020 16:47:36 +0930
Message-Id: <20200902071736.2578715-4-andrew@aj.id.au>
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

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/ucd9000.c | 39 ++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 7ba400d62475..23036f1b1bd1 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -401,6 +401,37 @@ static int ucd9000_debugfs_show_mfr_status_bit(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_mfr_status_bit,
 			 ucd9000_debugfs_show_mfr_status_bit, NULL, "%1lld\n");
 
+#define UCD9000_SMBUS_THROTTLE_US	1000
+static int throttle_delay_us = UCD9000_SMBUS_THROTTLE_US;
+
+static int ucd9000_debugfs_show_smbus_throttle_delay(void *data,
+						     u64 *val)
+{
+	struct i2c_client *client = data;
+	unsigned long ulval;
+	int rc;
+
+	rc = i2c_smbus_throttle_value(client, &ulval);
+	if (rc)
+		return rc;
+
+	*val = ulval;
+
+	return 0;
+}
+
+static int ucd9000_debugfs_store_smbus_throttle_delay(void *data,
+						      u64 val)
+{
+	struct i2c_client *client = data;
+
+	throttle_delay_us = val;
+	return i2c_smbus_throttle_client(client, val);
+}
+DEFINE_DEBUGFS_ATTRIBUTE(ucd9000_debugfs_smbus_throttle_delay,
+			 ucd9000_debugfs_show_smbus_throttle_delay,
+			 ucd9000_debugfs_store_smbus_throttle_delay, "%llu\n");
+
 static ssize_t ucd9000_debugfs_read_mfr_status(struct file *file,
 					       char __user *buf, size_t count,
 					       loff_t *ppos)
@@ -475,6 +506,8 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 	scnprintf(name, UCD9000_DEBUGFS_NAME_LEN, "mfr_status");
 	debugfs_create_file(name, 0444, data->debugfs, client,
 			    &ucd9000_debugfs_show_mfr_status_fops);
+	debugfs_create_file("smbus_throttle_delay", 0664, data->debugfs, client,
+			    &ucd9000_debugfs_smbus_throttle_delay);
 
 	return 0;
 }
@@ -487,8 +520,6 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 }
 #endif /* CONFIG_DEBUG_FS */
 
-#define UCD9000_SMBUS_THROTTLE_US	1000
-
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -504,7 +535,9 @@ static int ucd9000_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
-	i2c_smbus_throttle_client(client, UCD9000_SMBUS_THROTTLE_US);
+	ret = i2c_smbus_throttle_client(client, throttle_delay_us);
+	if (ret)
+		return ret;
 
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
 					block_buffer);
-- 
2.25.1

