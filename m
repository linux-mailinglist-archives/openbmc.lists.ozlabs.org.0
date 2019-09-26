Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CF6BF441
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 15:41:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fGKS488WzDqbt
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 23:41:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="WGJwBsfF"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="F5vnmBQ3"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGBy1XTGzDqjJ
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:35:22 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0E764719;
 Thu, 26 Sep 2019 09:35:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 26 Sep 2019 09:35:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=M1iyDZQoxGoqP
 BEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=WGJwBsfFh1kL5ZHM74Z4v2Pbg6EKm
 u/MfOmVw7kmC/Eu/416Tbw4nUI71GOfZPH/KosKZOLDHmbbmWhWc3JlV0Zc3cGtL
 YDLyJ9TB4ctm83fVHi3qNlzvAQw0gYKuqZFJmHyIQTRLvA8I9Zg5Oz8uaSOUUUvL
 YUnazhQvdxI8banHQWF3vSvCA4mxiAc/XR1evjoCQlJd2Ygeq7VtKLZvlqIZWQz4
 Vhua8pTO/zSJd6xARi/1q+3GItfWNRsSGMTH7usbembfLKUcFJzjDi6DQAMXmzu6
 egDDJlgil67JftqyATRiUBSlbkRHRpoGzTeryqRS5q+WLa/eJ+n8i5sYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=M1iyDZQoxGoqPBEuWgwS+K5O8DqyhEij/CquYJUJoaw=; b=F5vnmBQ3
 yDTMJ00ffqlRjbcv/RBlHYcGn8jopZvh9+AOFavmXwV0wvI97aOL2jIT+vREotV/
 QxDhgyDUWMfGTX5I+Yq2Hi31jQNVE47/GYFxI5Y4CHnMuEn3LiKcqqIDIp0MjHMA
 2TW06FwomA+ECZ+1wYgfzHjybzhTBUIvIiL70tgMd/f4NEvJi6+lRc3zrRwoFtpz
 H4mrJLhLqZ52QIPcCbK+/RqIIBN3PBGHDcMOxauzUbZBzmQJtd9a1gYBWdl5iiOM
 ZHTcWzsFjYRV4rGHQWuxkEb8t/fSOp6syq/mEWbwLUufXY24iD/DDhV2O0F0NzYm
 rUPvjn6jJI9Spw==
X-ME-Sender: <xms:l76MXe5YiI7sszGMmgtrShcmmE_yXSVvjhT1fKiGors3x6MAxjmgoA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgeptd
X-ME-Proxy: <xmx:l76MXTnoil0A3V1c_hjpklAUHCRkkvuOw68N5AZ17RzMZf7MQq9m-w>
 <xmx:l76MXVcKBJSmL3C5wiyGDwDpmrTsroXlOpe89P9GghzjFKUl7fTfJg>
 <xmx:l76MXZQg8eVYJTSv7CtXVJqAwOSz0hR457K4svn8p_SVeZf7m_5pKw>
 <xmx:l76MXcNzIdygJYdchxF33hz2ZNwCzDBgq6vw2hk5y_23729PTAk7Lw>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id A7DCCD6005F;
 Thu, 26 Sep 2019 09:35:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 02/15] pinctrl: aspeed-g6: Fix I2C14 SDA
 description
Date: Thu, 26 Sep 2019 23:05:55 +0930
Message-Id: <20190926133608.30566-3-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926133608.30566-1-andrew@aj.id.au>
References: <20190926133608.30566-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, johnny_huang@aspeedtech.com,
 openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The I2C function the pin participated in was incorrectly named SDA14
which lead to a failure to mux:

[    6.884344] No function I2C14 found on pin 7 (7). Found signal(s) MACLINK4, SDA14, GPIOA7 for function(s) MACLINK4, SDA14, GPIOA7

Fixes: 58dc52ad00a0 ("pinctrl: aspeed: Add AST2600 pinmux support")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index ff208b7c75a8..9079655cc818 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -87,7 +87,7 @@ FUNC_GROUP_DECL(MACLINK3, L23);
 
 #define K25 7
 SIG_EXPR_LIST_DECL_SESG(K25, MACLINK4, MACLINK4, SIG_DESC_SET(SCU410, 7));
-SIG_EXPR_LIST_DECL_SESG(K25, SDA14, SDA14, SIG_DESC_SET(SCU4B0, 7));
+SIG_EXPR_LIST_DECL_SESG(K25, SDA14, I2C14, SIG_DESC_SET(SCU4B0, 7));
 PIN_DECL_2(K25, GPIOA7, MACLINK4, SDA14);
 FUNC_GROUP_DECL(MACLINK4, K25);
 
-- 
2.20.1

