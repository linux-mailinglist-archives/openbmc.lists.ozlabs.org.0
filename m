Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA22E263B26
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 05:01:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bn3Yw0LtqzDqbv
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 13:01:24 +1000 (AEST)
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
 header.s=fm3 header.b=lvkLvV+6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=rNCmrSB0; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bn3TR60FgzDqYq;
 Thu, 10 Sep 2020 12:57:31 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CA09C5C0158;
 Wed,  9 Sep 2020 22:57:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 09 Sep 2020 22:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=YE2vRbVOU5d4u
 pRUylPGxyphDiisOKAQ6iHDzsqNpKA=; b=lvkLvV+6VfcOhVE157CML9zlZ9bsA
 PhaVE+chAIdJKaOVJCYjxpErC098nDzZMGxe8rNMd36tmemPVjeLJPgWxFVSwvnC
 jnJ9t+ngrlQxiXiM96Xyq8zcSiqodq6spk96teH+aWTKoh6PFkfBzJ0Im313C0vX
 8iz1sssKUKh4cajzVMhAarkf8u3f2ADHFCXY/6ryfrMcGkJ6dKQxtTRKtfaChWwn
 aG5M1EcUV4bjCW7jgQ40R9zhjROoaOb+2d7G7Ap6RhcdHd1W1My288QUqeMnFIvd
 JrufPkBlQ/7i72pwQx69lqGpDzd/rjjJUIyxCLQmnYQW0pCBEByuaAYaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=YE2vRbVOU5d4upRUylPGxyphDiisOKAQ6iHDzsqNpKA=; b=rNCmrSB0
 h3BhRsnE/n2kDKakTNpcx4ooTgWDXtQUi8sHLjsjUvNaLaBDB3iQYpqXvB9b1r5v
 LLIJlTJ/u1wCKgxu7nDsFjGIAoQcGOBhpVF5lVBVQtrn1FSiod51ytPa3yK6SiEK
 kPkQ7R9FY0maLtwhKaNRPcF6mk86XJoSgDQwYf9Xkdsy6ynVirCo/8hItBD1xJWG
 LbhxbwthY/B9ahaibe6Gndf2sx60vYkNxUsluMDoOQKPaohl6BQzPlcTUoxDV2IM
 fhw7D9RWH97arNgrUB0Z5Lvy1rAcHpYCuEj/CrxGZps33yyWph0yUbENRH8A75LO
 hKPkf0u6CkPbGQ==
X-ME-Sender: <xms:GZZZX7i8X6Ez6uBkqYBCQHvUmbz1_lGXc-R6CyfXl68vTX2TaCFC1A>
 <xme:GZZZX4DG5ooYdXGJ98UynOmW0AXJ9MKQ7jji05zfWTfKszDt3TSIPnginyIxttntI
 Qula18JWM_eymckrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehiedgieegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecukfhppedugedrvddruddtledrkeehnecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvg
 ifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:GZZZX7Hc-W8yrJ8pXreuoONHOGtfNKYuFZwbF5ZPSBwlvd78IMNeKQ>
 <xmx:GZZZX4RpuV-Vyy5OM5WMIlYb3UT7ouqC57B4om3ud2t5XsHsqY4DSQ>
 <xmx:GZZZX4xJslCWETXF9cQsKjChJkNWitGFNovyUpv5shUVdOZlcHfR9w>
 <xmx:GZZZX3rjr-ZXzySYiS8AwnArvp7SK5aKj1HRS5tvyY7aWpvUVT1SgQ>
Received: from mistburn.lan
 (ppp14-2-109-85.adl-apt-pir-bras32.tpg.internode.on.net [14.2.109.85])
 by mail.messagingengine.com (Postfix) with ESMTPA id CDFF13069096;
 Wed,  9 Sep 2020 22:57:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/3] pinctrl: aspeed: Use the right pinconf mask
Date: Thu, 10 Sep 2020 12:26:30 +0930
Message-Id: <20200910025631.2996342-3-andrew@aj.id.au>
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

The Aspeed pinconf data structures are split into 'conf' and 'map'
types, where the 'conf' struct defines which register and bitfield to
manipulate, while the 'map' struct defines what value to write to
the register and bitfield.

Both structs have a mask member, and the wrong mask was being used to
tell the regmap which bits to update.

A todo is to look at whether we can remove the mask from the 'map'
struct.

Cc: Johnny Huang <johnny_huang@aspeedtech.com>
Fixes: 5f52c853847f ("pinctrl: aspeed: Use masks to describe pinconf bitfields")
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 2e0260c1a57c..6a94eaecf638 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -534,7 +534,7 @@ int aspeed_pin_config_set(struct pinctrl_dev *pctldev, unsigned int offset,
 		val = pmap->val << __ffs(pconf->mask);
 
 		rc = regmap_update_bits(pdata->scu, pconf->reg,
-					pmap->mask, val);
+					pconf->mask, val);
 
 		if (rc < 0)
 			return rc;
-- 
2.25.1

