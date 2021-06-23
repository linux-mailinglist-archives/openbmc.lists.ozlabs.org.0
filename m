Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE343B1254
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:40:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pvV2w1Dz3bsk
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:40:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=GVcyu69q;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PudS5yAq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GVcyu69q; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=PudS5yAq; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psd2dXcz3098
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:17 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id BAEAFEC8;
 Tue, 22 Jun 2021 23:39:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 22 Jun 2021 23:39:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=3/zXr0MFCoTlv
 4MVeFTVcgwaIENgH4z2YG9XCFzoO4w=; b=GVcyu69qOvno4ZoxEgZpEflu1CkuH
 KH3ZPiejjAcXbLEHGqVEgir7Q8N3IOy038cG0SS0u/fKI9DhD3rVLalcUwNpJANe
 UB0fSaMbvO6j4fQ1LV4OO5D7Yd3hCrjTqgWx9Si+wd3hcUD38gI29EdGjJ2g26oA
 wPZKwgDn+iQgz5Vguj7WCrMWbLg56rU2hpe37x39xejaStljv4OZPQmBfX8CJGUr
 Aft+Zp46aqfB6id5yz30F2Akwq2pcI2ohn0TE3J3rUzG9tasSu8donkSGFwiQUK2
 UxwKRrt0oRAq3bxR1C4WMiSU4RFDEHYqhf6F4qcsMGb4rXcphrx9r5J8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=3/zXr0MFCoTlv4MVeFTVcgwaIENgH4z2YG9XCFzoO4w=; b=PudS5yAq
 IDnw4WyRbRwqOTACL0cCUC0x6lrHoth5ko5/zqPr35VOyMpqwBh4dRNfGBk0OsJz
 +9HgpXyYDeU2ZRNcMZeSnnCVhCqRZGJGbNtNbNn3TnzBpnHZcQ8WcHyHJeG6NmVp
 FZdi3SE4LYxHrImnge5oC1OfN5C175w8I265j7XwGrurCIQx5ATrY375Yr7HeAMV
 Y5yr3SVyXjUQmJOyckfpI32PIs1H9FIxHVpTksdVjTGUA8tDYjC200aDh9m6Z70e
 lheDfIhdKaERBPphTyM8hPVhujbCtvC66oSuflnFeB2LkbH9R+2r27QKRqKAH+b7
 Y4dWyYswBEavqw==
X-ME-Sender: <xms:4qzSYHXvHEHhfQcI4V3LSh-wxleAtAvW5r2ZusPCl9Qy6umzgc2hww>
 <xme:4qzSYPkuRzaexDFflnKqA62xDRtAoP94psCA6pXOO_V5xbVx4hEuntsNYvk9-Z-XK
 Sny8h-smWkx7Z-MUA>
X-ME-Received: <xmr:4qzSYDYOb0MT0cr7Y6Q4Cxzql3Lm1HDu6LEOPw6T2hNvqD8DSwwswNuaOMfsYTjt00g3pP66QEYCZ32JMbEceUIJf-XUnCFy2AaJXMNNgC0tC1Nc_dKxbogyTHtIG9urEY9oFLxluCE0qQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4qzSYCX9uK9cxlrjYyMax68RsClfV2xuhd9X1BiX4s_5OP6ywDXUAg>
 <xmx:4qzSYBnLkrU6RJCmZozs0ApyDHR2cwq7YB5XYokDYgAKeimPVAt-kQ>
 <xmx:4qzSYPeL65vkTE9LXZu9o_orTPxS3iEIAQY6t8I6RkxVB4tNqG_zaQ>
 <xmx:4qzSYAt8P2u8znd_AtXoxiryzxMkRZD812AvBvjBBhy6RHIimhRLGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 3/7] ARM: configs: Enable IPMI KCS raw
 chardev
Date: Wed, 23 Jun 2021 13:08:50 +0930
Message-Id: <20210623033854.587464-4-andrew@aj.id.au>
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

The raw KCS chardev is used by libmctp's vendor-defined LPC binding.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index cefbec257bd8..045d383ce5ce 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -180,6 +180,7 @@ CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_IPMI_KCS_BMC_SERIO=y
+CONFIG_IPMI_KCS_BMC_CDEV_RAW=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_TIMERIOMEM=y
-- 
2.30.2

