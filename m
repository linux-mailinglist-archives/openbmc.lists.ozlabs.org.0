Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19D263B29
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 05:02:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn3bX3nnZzDqcj
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 13:02:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=Jv1Q6VTD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=MTMmKDWd; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn3TX13RVzDqZx;
 Thu, 10 Sep 2020 12:57:36 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8C0815C0159;
 Wed,  9 Sep 2020 22:57:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=OB2lHrQebYwpv
 9JP10shRNTHkMJDTLAT3gH5XItbtFo=; b=Jv1Q6VTDD8ezKAVCoJABssoNjOgUi
 IhRaZB2lc7CC2zoc2DjgTvg8HSlO2TbuF5hR65TbamBfyOan1enmEDGvVwz3vR0o
 oHcOIMq9+QZH+Y1YgVycDg926opT6iuxAx2LLtXub5aOOu2eq8p/8/rJKKkIlMdV
 ZEBFv+G9Bj3JW1bPOIntw0b5fxi9zPxJ5qzpF9VUH97d7ryE0xrnsFvYBL2NZsKv
 Xu0igyOBiGOTQFELhuPNEurBDC1hVQJV161TuC3sjluoOoTxgwUiQN0ItPk/XQJh
 1dio4OzNbiEDlTqz87e4TiiqQDPQFZz2klHePE4FuzG7KjPUa5ovqQOwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=OB2lHrQebYwpv9JP10shRNTHkMJDTLAT3gH5XItbtFo=; b=MTMmKDWd
 MQOwOIMAoVWGSce5ynfucSeKX9nAvTLcd7fobBlX/RriAnHmAycxsd8B4p1RBESg
 TZDaeP/8fE2HLad3oyZoS022D+Sr7LnzXyry5NMXgvTcaKY28A5Un2yc/9ist9B5
 1bdtFoccRvNeCYHk8FKuoxDkxZvJmjEkm1Irass+Z0/RUDGG1isHdQEKh5NWndjZ
 JBM+GqVOzAzfqxLaXqqJjoHhaMgIz7SZjb4TkI87uwd/k5pWygOlNhbl0q6DaBz5
 NsZY+fc7G+A42QHYQp5+eCCqWjcM+UdYf8uJa8i4MDxNnzsqYw9IFOX0ks5FuL1+
 cIBCgp+zKV2Tfg==
X-ME-Sender: <xms:HZZZX9UEatQ_AzFbDY63hxA5QtxML1Sz5a1mQWpu9luQxO_9yh-lXA>
 <xme:HZZZX9mIzSOB5I6ev5NvLz0McA8koUkAxIWz-DvyH4Qd73Jz3xNYSH5ssoteG-kg8
 2K0rLc-YEI-qtekHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
 vehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:HZZZX5aS4jRV27s4KdRgmc-xX1ArEfiBIjE_KuiOJVBN87XWOuFUuQ>
 <xmx:HZZZXwWaVo-Ue7i6VK1SMOKVnk0e9ta3E2o6tcMrbd84wVVBM4Kzsw>
 <xmx:HZZZX3nWH2UQfewZnIGAJE2tE_-KQoKUt8pQ1rCGPLp4ALzGPpGvIw>
 <xmx:HZZZXyv8Zo_trE-mSzSlpC-Dgh1WP9JtpYKnW1J8nZKfbLTItL9Axg>
Received: from mistburn.lan
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4C5713068C6A;
 Wed,  9 Sep 2020 22:57:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 3/3] pinctrl: aspeed-g6: Add bias controls for 1.8V GPIO
 banks
Date: Thu, 10 Sep 2020 12:26:31 +0930
Message-Id: <20200910025631.2996342-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910025631.2996342-1-andrew@aj.id.au>
References: <20200910025631.2996342-1-andrew@aj.id.au>
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
Cc: johnny_huang@aspeedtech.com, linux-aspeed@lists.ozlabs.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

These were skipped in the original patches adding pinconf support for
the AST2600.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
index 7efe6dbe4398..34803a6c7664 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c
@@ -19,6 +19,7 @@
 
 #define SCU400		0x400 /* Multi-function Pin Control #1  */
 #define SCU404		0x404 /* Multi-function Pin Control #2  */
+#define SCU40C		0x40C /* Multi-function Pin Control #3  */
 #define SCU410		0x410 /* Multi-function Pin Control #4  */
 #define SCU414		0x414 /* Multi-function Pin Control #5  */
 #define SCU418		0x418 /* Multi-function Pin Control #6  */
@@ -2591,6 +2592,22 @@ static struct aspeed_pin_config aspeed_g6_configs[] = {
 	/* MAC4 */
 	{ PIN_CONFIG_POWER_SOURCE,   { F24, B24 }, SCU458, BIT_MASK(5)},
 	{ PIN_CONFIG_DRIVE_STRENGTH, { F24, B24 }, SCU458, GENMASK(3, 2)},
+
+	/* GPIO18E */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, Y1, Y4, SCU40C, 4),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   Y1, Y4, SCU40C, 4),
+	/* GPIO18D */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, AB4, AC5, SCU40C, 3),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   AB4, AC5, SCU40C, 3),
+	/* GPIO18C */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, E4, E1, SCU40C, 2),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   E4, E1, SCU40C, 2),
+	/* GPIO18B */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, B2, D3, SCU40C, 1),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   B2, D3, SCU40C, 1),
+	/* GPIO18A */
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_PULL_DOWN, C6, A2, SCU40C, 0),
+	ASPEED_SB_PINCONF(PIN_CONFIG_BIAS_DISABLE,   C6, A2, SCU40C, 0),
 };
 
 /**
-- 
2.25.1

