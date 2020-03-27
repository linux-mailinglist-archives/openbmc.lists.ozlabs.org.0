Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 534A9195159
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:36:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXFC466bzDr4d
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 17:36:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=CqWqygfc; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=J9x7ddst; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pX8Q0hkhzDr48
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 17:32:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id CDC515C0341;
 Fri, 27 Mar 2020 02:32:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Mar 2020 02:32:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=myLDe0YXcD2pd
 IujNvmg6PmhpRJcm1hLVPMpDpgZbdk=; b=CqWqygfcEJGw5JCw4e827Wa4CjFlO
 7EGDGytdIkJUzv5oEkGQKPVE7pjmW5hkXcLktUjvGKwFDT3oFqp7elb8ajAtVpVG
 HGNrotrjrHPFCl9ucom23UO+dDd3BxHW2puOSv6G6v8GPI+82r81D4N5/FPWQKug
 cTQ012v65SBbZl44whBXVERdGZujDMo78qd0F4sPsZsNBdLr3wj6UUhA9eUis2mW
 MWGf9+Vu8MQG0P/l5XIWeWGhnhF0mW71ZqTj8rshpu8DGVSHsqsMIWLZYXbUgaYt
 bIUjLOH/AXo7EBlERoWlwAovmUaajWaonnqrPu4kNOY0qfetI5v05g5BQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=myLDe0YXcD2pdIujNvmg6PmhpRJcm1hLVPMpDpgZbdk=; b=J9x7ddst
 tElJxZjjaaymidai/QbEAyLMeoWHxJMZJo064KV7zbAQ+MGCmv9Xy+WQz9sAcgvd
 L0n0pKVt1X98UeyIupctDGgZhRZ78s1cWJ/QayV9i9wgcP8V80IBODLS6jeQSEyc
 LjgGUNXFCKfxuCsbrle48hqzZi07NjnVW3OJErl5wzZkNwalQDC9t+fIvm3hpevL
 JSo0KP/mkIN4/5VdN3tnA59yp1esmi+FEy46IFZEm3RtrNuEPxPPV/l7JgE+URtc
 iBaosISGcaIsFWoqR02z+xDQXWdVshpwgdA4c9omHCm9exgcRbaW898p7GuxK+6A
 BMPlQcAL1wUCjA==
X-ME-Sender: <xms:8519Xtsrd00HSttqIGuyN4I5sMQmWFoEm1u9yFU5CyFHwVG31kHOoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucfkphepuddukedrvddutddrudekfedrudelkeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:8519XtO-y-eYkX-N8G5X1w82RF4HtsoJeDCCWecQXs293-coPvWpQg>
 <xmx:8519XiiyadZogjhTQX4vQybgFjHbzI4i4CtL60Blhd-jP55BrFKmkQ>
 <xmx:8519Xv6fDrUJ-lgjqvl3c12-s6UGV8pdlSLaiLA4mXQNDRQcboWLJA>
 <xmx:8519Xr_Hn-g9Sy3cOfVPMBxl6M3c0HOK-_P6IdsJKnXL3jyP1E7V_g>
Received: from localhost.localdomain
 (ppp118-210-183-198.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.183.198])
 by mail.messagingengine.com (Postfix) with ESMTPA id 48CC53280065;
 Fri, 27 Mar 2020 02:32:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [WIP PATCH linux dev-5.4 3/4] ARM: dts: tacoma: Add KCS node for LPC
 MCTP
Date: Fri, 27 Mar 2020 17:01:45 +1030
Message-Id: <20200327063146.28885-4-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200327063146.28885-1-andrew@aj.id.au>
References: <20200327063146.28885-1-andrew@aj.id.au>
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
Cc: Andrew Geissler <geisonator@yahoo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Andrew Geissler <geisonator@yahoo.com>

Signed-off-by: Andrew Geissler <geisonator@yahoo.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 194a48220e2f..969289ea6699 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -810,3 +810,11 @@
 	/* 1G DRAM with 8M VRAM which is reserved at the top. */
 	memory = <0xbf800000 0x00800000>;
 };
+
+&lpc_host {
+       kcs4: kcs4@0 {
+               compatible = "openbmc,mctp-lpc";
+               interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+               status = "okay";
+       };
+};
-- 
2.20.1

