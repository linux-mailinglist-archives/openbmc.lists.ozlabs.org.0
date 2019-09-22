Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C644DBA2B4
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 14:43:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bnFF42LvzDqRY
	for <lists+openbmc@lfdr.de>; Sun, 22 Sep 2019 22:43:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="kS69lLJH"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="G5Bb8KYv"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bn4z2b2GzDqLh
 for <openbmc@lists.ozlabs.org>; Sun, 22 Sep 2019 22:36:35 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id ED31A20F20;
 Sun, 22 Sep 2019 08:36:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Sun, 22 Sep 2019 08:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=n43poYL6+ZgDU
 TjCMsbfm9PHODmbYTvFAfggqzYavtw=; b=kS69lLJHq5GBkE+jRCZjC98QfZoJl
 3u8qfdP4KSaRHjCHUmq1eMlJIWuEBQzwKJlf60Yb/RAaBzx1Eo7D803jbHaAcWQu
 HqrHLtcC8lR2QXplcefhpG24Ue05tnTO2SbbFojS/kXQAMlOYpADjqbuavj/dsFM
 Yf737u9RgY/UsvfjZc2x/TdMn9gXijwgnD1sUHkrbLdY0w283xnu8XZZ6YMLjNRB
 zhYrf4vT8gPNxcwmBmBogNdES8eAD2qlFLVzfZZs5S/YcxH44IMUQLQTfdbs6FOS
 B6zv8hGTv1Nhses4PrZwlwemHURNbph/7mH5YUAlXg/FhFGzwP1V4VYuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=n43poYL6+ZgDUTjCMsbfm9PHODmbYTvFAfggqzYavtw=; b=G5Bb8KYv
 40kbICEdSUVjCj8rUcfHYEmvv9iAObvz5HQ/cO77GDxQnYQd6tLzvkMHkcbYzNJ3
 1sZQO5VO7cSVTyOVhO8Ftl4QyKor6JDijsDywJb+ikv5rpMl2C5e4ZG9vAolOfr7
 pOebEkeNVb6w3e6gKlOmIm/2PiN8ufWAnuJ+nfR9AULIKBkYRYGd9kyfStXsUkNG
 vHsQg2SqtggLir9dvGZCPzqvfGCud3YdFZHKr5VJIGGkoJKxuYPEUBe3NU+xNR9y
 dMNoxjPto7i0843xx8i4u0GKb2Ulrnk4Wk3ETUNHFNcS2PkigbrAeXOqSriWE6qm
 hY/OT7MxIuzTsA==
X-ME-Sender: <xms:0GqHXbFe-XhxCD8T4XbHIKh6gddu9eC4-rsp7S8-1JfK57qLmSRHXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdeigdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtkeertd
 ertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghj
 rdhiugdrrghuqeenucfkphepvddtfedrheejrddvudehrddujeeknecurfgrrhgrmhepmh
 grihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgvrhfuihii
 vgepge
X-ME-Proxy: <xmx:0GqHXSb8Nf3CLKCGXxAIdX9FJ3Fd4E7NCw8cpInMhCuQ171Wspw8sw>
 <xmx:0GqHXQDZCwgVwKML07yeOcmEPjqU_M9r_pgBdHFY4gUFIuFBRz__Cg>
 <xmx:0GqHXRBQZuc71NOsgYvXMMt9ADMlBop-r5RfJj-JjihtdmB2RnjVjQ>
 <xmx:0GqHXd7QAdJCS9w-7tzRKAUubRdDEdAiKhI6uCcNDpaU3c84H8I_Vw>
Received: from mistburn.lan (203-57-215-178.dyn.iinet.net.au [203.57.215.178])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2889880059;
 Sun, 22 Sep 2019 08:36:30 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.3 6/6] ARM: dts: tacoma: Enable 50MHz RMII RCLK
 for NCSI
Date: Sun, 22 Sep 2019 22:07:00 +0930
Message-Id: <20190922123700.749-7-andrew@aj.id.au>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190922123700.749-1-andrew@aj.id.au>
References: <20190922123700.749-1-andrew@aj.id.au>
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
Cc: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tacoma uses MAC3 for its NCSI-based interface to the outside world.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
index 408af001c06c..854b0a532a01 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts
@@ -28,6 +28,9 @@
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_GATE_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
 	use-ncsi;
 };
 
-- 
2.20.1

