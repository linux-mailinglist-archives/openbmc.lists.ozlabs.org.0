Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1105425A65E
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 09:22:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhFkR1JYVzDqNC
	for <lists+openbmc@lfdr.de>; Wed,  2 Sep 2020 17:22:07 +1000 (AEST)
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
 header.s=fm3 header.b=VzXzG+GT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=XR6ZK8R+; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhFf345r8zDqMt
 for <openbmc@lists.ozlabs.org>; Wed,  2 Sep 2020 17:18:19 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 479CC5C015B;
 Wed,  2 Sep 2020 03:18:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Sep 2020 03:18:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=su/KvZ9gwUaQr
 V9Eu6qfA9NKeJhc/8IMlA0nFzAli0U=; b=VzXzG+GTpoAkPrG4PE/DZrgPji8e4
 1vO9Nvt/Tra5Y3aN3fOHtAvYq8YIBsYgOoASzUFC7sQ5Hj/3/JBhy1CYj4FvbRyn
 0kPgxBI/zVFzD7V6j0bgMjtsOxa1URvGZZIfeXHLjHxCyOyk99p0/pQNkVTyMXiD
 eYt/bameBnzsLdXOZLSXbS5Q4Qy8jyBVs6OitBEzLk4+onZJjVwew4hoR5tkzQqg
 VU0Kr9uNfMeG/QaVa/yMJiC7UtHL++To/HzYAQ7nEsBzlAduz5Xmkmu0hHIogOBU
 ORE4+EynLvKUwPHt7g6vZ8cynJ4MbC6xodfsrMN/TlFQh/Vp/aFRG+hXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=su/KvZ9gwUaQrV9Eu6qfA9NKeJhc/8IMlA0nFzAli0U=; b=XR6ZK8R+
 V4kQYqtKRoM2gLRArbC6JFrI7sz9Ka/kX30M8wlkaPB6D/yEdoOa8yBey42eq8ZJ
 BdRnLSZ5uGEE67Nyl1obB1pR+zYvL8g6euhUc97Xpp0dNBXIZwNo+nfJxwxih4Wk
 wIEgH8C3G2s6jxxxnlF/pzY8hhNTdItjZ4avQxUXi7EpyhKTS0lj19z215VgQ8i9
 7NF9+BKNsw5SouYECNNt8BeD46QjT8Gb46/0p21wJbrUsat1DbbKDy3zzNx/bB1+
 NFL0QHRfM17PhxzTMofVqTe8IpVf4LZneHWDeP4+YkYZJmV5DfkvrrZUyz88onI0
 MQfjhpGluU62+w==
X-ME-Sender: <xms:OUdPX2phNvHWxuJpVnvLGPP3j3-hgaOuWGC5Ryiu7G8nq9m0ae3_yg>
 <xme:OUdPX0rSWpH__ewTTjzd2MbifqDQxkKBVo_YEmz-mZJSHUjdqLMtCkXvardRxM8k_
 6efJr0dTPNoA-K97g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudefkedguddukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepudegrddvrddutdelrdekheen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurh
 gvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:OUdPX7NdMnw7XUb2OUWnrkHSz-d9_wQCQzXK8kOHXr6uaaSdJtKXKg>
 <xmx:OUdPX14jiAHJfxp-GiOIXsPwf_xt_LNFqYWZzn2mGh0o_Njo5g3hgw>
 <xmx:OUdPX15HqVGQk4zu0jjwUZB8tZzKkEJIjZ-cnoHtKb1pNhwHtYTXkA>
 <xmx:OUdPX2VEx-8lANftU5Au81CU1c0Y0So_A-eSx--cjLK6koVmPna2XQ>
Received: from localhost.localdomain
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 18DE6328005E;
 Wed,  2 Sep 2020 03:18:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 2/3] pmbus: (ucd9000) Throttle SMBus transfers
 to avoid poor behaviour
Date: Wed,  2 Sep 2020 16:47:35 +0930
Message-Id: <20200902071736.2578715-3-andrew@aj.id.au>
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

Short turn-around times between transfers to UCD9000 devices can lead to
problematic behaviour, including unnecessary clock stretching, bus
lockups and potential corruption of the device's volatile state.

Introduce transfer throttling for the device with a minimum access
delay of 1ms.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/hwmon/pmbus/ucd9000.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 81f4c4f166cd..7ba400d62475 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -487,6 +487,8 @@ static int ucd9000_init_debugfs(struct i2c_client *client,
 }
 #endif /* CONFIG_DEBUG_FS */
 
+#define UCD9000_SMBUS_THROTTLE_US	1000
+
 static int ucd9000_probe(struct i2c_client *client,
 			 const struct i2c_device_id *id)
 {
@@ -502,6 +504,8 @@ static int ucd9000_probe(struct i2c_client *client,
 				     I2C_FUNC_SMBUS_BLOCK_DATA))
 		return -ENODEV;
 
+	i2c_smbus_throttle_client(client, UCD9000_SMBUS_THROTTLE_US);
+
 	ret = i2c_smbus_read_block_data(client, UCD9000_DEVICE_ID,
 					block_buffer);
 	if (ret < 0) {
-- 
2.25.1

