Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BC13B1251
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:39:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pt949dLz303t
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=PhXe2lce;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=mn9t7UPI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=PhXe2lce; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=mn9t7UPI; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psX1HQNz300Q
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:12 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 85BF3EC4;
 Tue, 22 Jun 2021 23:39:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 22 Jun 2021 23:39:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=33OG8YRSBH++5
 +rmz3V+7Uv8nnEDRcFBvejaPQOoXUI=; b=PhXe2lcekBCYFaKXUvALzT42OPMFr
 G/Y+ot5hAtkYCkGJHsqo+Je4qks+6bqZetkcPLkct8XX6Qar5KX6dtNmytBEt6KP
 Q94HTjCaGhodlU7H7emBDMVg/jUaAiIxyoMCKJSmsj3gVpj7H8g9gnWbCpBlq7rA
 mQQ/GKXg8L8Bu74KGdhEu3wJo6AeOCTuPy2ilQ0r8V159LriGWKWV1ceQ1QtMenL
 r63/ra1TYP45ZZOaolFOYPz/w1kWYI52Xj9q+mBTh6H+3KyxMw5w7e2TJNIawS4X
 hhx7+avAx0pc5V9Ac8gQXdjnJUgRNv80H6QIvX+D6iQZUbhxUQMMrrfaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=33OG8YRSBH++5+rmz3V+7Uv8nnEDRcFBvejaPQOoXUI=; b=mn9t7UPI
 A7pjlMw7utJddNSwt4GteuTzjs5y73bfSb0mQT57cpl2VXboIPnnGAqk5JZY4oRC
 UR3PrRnD7yrN3zDPtFxsppjCtaOivWwNvVK3NKkZsgR3pmvpSipzjjfnwDr6uEl7
 IeoDH92u47ZS9IlTEvRZw5ywgHVtWInOIhrBurMusACLM4Fr2dA8N8dbfxY+C9LF
 RycqbA6VRfroma85LVdQ8LkBxdJL9C0D+1PMfgOuR30cL8nHB/Yhbmjk/thmls9g
 RL/NCOvIL22STjsz0ID700RmOC/bQwDK6p/3/dyr+Z4+v3fzwRzdPYCgyRQ/tyDu
 SkOURi7+ilwe+g==
X-ME-Sender: <xms:3azSYEjVIK60RfESZIUIKTXnRoKX4aPo-juvVC9yZmwjId5k371a6Q>
 <xme:3azSYNCb7_kvHwdGzkx7drC_JXhDb3GmvtTkw0ViIMzgSj4BwPIAjHFotUF4fjEuB
 vv3BG2z7YIDxsnnfQ>
X-ME-Received: <xmr:3azSYMGPIqwDvKkrBQsHlLXtGZZpE1DrJw6BY2ClxDLQwg0mMXkvt4f1o3AVA6r4X2KkqLbpYsm65R4AmjRfJZJJLl3DWuO4DnWzCFXKYxxP7k4TSTPt6_cWfROQTV0FyF91gmJjxWgd3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:3azSYFQHroC40ipUTgg1t2WwHZB67TkihvI2E-p-_yvY3FNuMmSwlw>
 <xmx:3azSYBxbYvr_S0eEzvUwvYN6M5KLb2s5oesZ9rdC7aojkf1lRkjgHg>
 <xmx:3azSYD6PcsDJX1KIgflxScAJ5ZCAN6c1Lfi1bkuUPZUozFXFdm_w3A>
 <xmx:3azSYPaD73VXYVUZTRCBRwHFKUwJSUIwy7Y0R3HnLR7K4mwGBlTlgg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:07 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 1/7] ipmi: kcs_bmc_aspeed: Fix less than
 zero comparison of a unsigned int
Date: Wed, 23 Jun 2021 13:08:48 +0930
Message-Id: <20210623033854.587464-2-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210623033854.587464-1-andrew@aj.id.au>
References: <20210623033854.587464-1-andrew@aj.id.au>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Colin Ian King <colin.king@canonical.com>

The comparisons of the unsigned int hw_type to less than zero always
false because it is unsigned. Fix this by using an int for the
assignment and less than zero check.

Addresses-Coverity: ("Unsigned compared against 0")
Fixes: 9d2df9a0ad80 ("ipmi: kcs_bmc_aspeed: Implement KCS SerIRQ configuration")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
Message-Id: <20210616162913.15259-1-colin.king@canonical.com>
Signed-off-by: Corey Minyard <cminyard@mvista.com>
---
 drivers/char/ipmi/kcs_bmc_aspeed.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/char/ipmi/kcs_bmc_aspeed.c b/drivers/char/ipmi/kcs_bmc_aspeed.c
index 9753ed0a5be6..b555286016b1 100644
--- a/drivers/char/ipmi/kcs_bmc_aspeed.c
+++ b/drivers/char/ipmi/kcs_bmc_aspeed.c
@@ -301,13 +301,15 @@ static inline int aspeed_kcs_map_serirq_type(u32 dt_type)
 static int aspeed_kcs_config_upstream_irq(struct aspeed_kcs_bmc *priv, u32 id, u32 dt_type)
 {
 	unsigned int mask, val, hw_type;
+	int ret;
 
 	if (id > 15)
 		return -EINVAL;
 
-	hw_type = aspeed_kcs_map_serirq_type(dt_type);
-	if (hw_type < 0)
-		return hw_type;
+	ret = aspeed_kcs_map_serirq_type(dt_type);
+	if (ret < 0)
+		return ret;
+	hw_type = ret;
 
 	priv->upstream_irq.mode = aspeed_kcs_irq_serirq;
 	priv->upstream_irq.id = id;
-- 
2.30.2

