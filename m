Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D53B3C85
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 08:11:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB67n5XPrz3bvQ
	for <lists+openbmc@lfdr.de>; Fri, 25 Jun 2021 16:11:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=A7w4iBn7;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q5K7HNpy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=A7w4iBn7; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=Q5K7HNpy; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB67J2MZCz302K;
 Fri, 25 Jun 2021 16:10:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 9A56F5C0136;
 Fri, 25 Jun 2021 02:10:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 25 Jun 2021 02:10:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=LUduNXh8afYXbZaxuU0n9BSi4R
 cIQyqyuYJqZGn4aX4=; b=A7w4iBn7/mLLqz57kL7lTTwksg0IDY0v6ZkbuqPMvz
 ZQS6WHcPu2pvenIJMpdCRd3fwsR/eLdkPJJhkp66B7fnOM5niS5FQZWs2SmpNbuq
 lwiatYzxCkHVzpYchDeN9dXmWdcbPknMR9xRO51xQBAvE08T3EnMLmXp2Isty6ty
 mSwbeladtcJkyeQdEAlSw2fyZswXSE0uPghTx6o6bbVhyWQKiOhEH+LOItT/9DiJ
 xexvHTz4kPon+bfuXIpmMu1qdNg7rROm6I7M5RYLmWki52Egqck8jma5BZJc91Le
 BdX6vh7Tg9WyuT0w6iW3KF9hjHN/sIxRoVovxCUQKJoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LUduNXh8afYXbZaxu
 U0n9BSi4RcIQyqyuYJqZGn4aX4=; b=Q5K7HNpydhuqt3xq/2HoSb8JAyO1BVkRj
 8vOfbllhHjDDEd3PeNjNrvik/6yFaWnrhlasXCZ6pfUyg7C1Yacp8ZX7VHOmyl8X
 q05WiDF9LwMh0uSmhrzgE4DASLWil7C6618qyLdH21IFBmlzwrDIdUi6tjX4pJLK
 fcBkWkd7nSoUtD1p5wrKM5+Untm8F/V2qYPFYr0t9IzPEIXT4rqMNiePZFjw9/rp
 0qbCc7SG9MYgmQYIKtudB1v6Yq0/cMBhjC+fdwACysN6hm1aWbpzvi3AFzMQvEJV
 eL7ykRu1sUhzeipk23RiJTWA04KLLsrLtjA+Ki+R3jScJKbjMq2Jw==
X-ME-Sender: <xms:VXPVYEYaYNDXcXN5gEboqhIaL-qf4pW2_NMr9wZ6AOP-HWUZm8cigA>
 <xme:VXPVYPYvBEWYCj8GhPsv-lWQck6rdD_DDQqyT5D7otVHHj33XQTU_e_u7k5hHehM7
 5BuvCosAuX6i2CNrw>
X-ME-Received: <xmr:VXPVYO_HB6hePwbBJ5lqMOk6OIiUt1SRRwpri6xb3RQbLIGM8wuvmmWdkikdpmjPgzBmMkP85ln5uWT5r1W3lt7CBqx46ajz3NQZsdsPYDMzkAJp6cQ3A03BaLlgyEJ78dFUMQI2usFU8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegiedguddtiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucggtffrrghtthgvrhhnpeekhfeiffejveefveehtdeiiefhfedvje
 elvddvtdehffetudejtefhueeuleeftdenucevlhhushhtvghrufhiiigvpedtnecurfgr
 rhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:VXPVYOpGKGDsj-ny5DcIJwp6pc36kAGNibwSOHIhQRaQkg0JVEHmog>
 <xmx:VXPVYPox2Kge905tLt-o4kQxBUtW3_EGZJlMtmcydTDQCABgVy4Z0A>
 <xmx:VXPVYMR_UoDv1kQRUNq1qD8AhMDdnm0dNHcbGiBx92e_uYIupChymA>
 <xmx:VnPVYAAkG84Dwse1LP-Cfax3AKsqfFzLDT8b7kZhwK0EDPRmOhvEaw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Jun 2021 02:10:26 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: tacoma: Add phase corrections for eMMC
Date: Fri, 25 Jun 2021 15:40:17 +0930
Message-Id: <20210625061017.1149942-1-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The degree values were reversed out from the magic tap values of 7 (in)
and 15 + inversion (out) initially suggested by Aspeed.

With the patch tacoma survives several gigabytes of reads and writes
using dd while without it locks up randomly during the boot process.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index c1478d2db602..670080bb80eb 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -189,6 +189,7 @@ &emmc_controller {
 
 &emmc {
 	status = "okay";
+	clk-phase-mmc-hs200 = <36>, <270>;
 };
 
 &fsim0 {
-- 
2.30.2

