Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B001195163
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:37:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXGm2qK0zDr55
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 17:37:52 +1100 (AEDT)
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
 header.s=fm2 header.b=f3bHCZHt; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=j7Nf5tLp; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pX8S2XtZzDr42
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 17:32:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D8DD5C034D;
 Fri, 27 Mar 2020 02:32:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Mar 2020 02:32:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=jZcLeLB0UG/wd
 8io7LAHNTT/6h3HTScw++K57cUQf24=; b=f3bHCZHtlL/yrGk0qwI4GTYjUFL+b
 RUaq62SqsxLFONw4H70jfAMeUOPGw28HnAgL/12t2h7cyzhxJr+swdv4y5KUOO8s
 FCfvooXyNX+8n19x1gPaZbhbYCmRwiwCeWgPQGOO3XB/6RxbjOFyRmICmqpnlE6K
 VA7mee9+ppaCnaovsX1uFbevjYYAlWwCKnvxF+FA1zV3Xpe+VOO4rBm880SJbkue
 p8oI8JgpPx1Cw7/ZGEGrtnpVjpCYUoV86QF16/bNu5bAir22ZEbEbpplhvhzq66z
 Lqpnz+3bI3c9pf9EDAKzkvtqTcC+GhxXzsy2uMQS0smn3ZV3lEmJwxHFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=jZcLeLB0UG/wd8io7LAHNTT/6h3HTScw++K57cUQf24=; b=j7Nf5tLp
 mM7Z17rV1Mj89bBSedVBlRUctmLNShDLlIqu6NgaiILAjio0OSdY+/F5iq7jZT1Q
 GuwgjYKzrq9cbbHEDtKTApDcV1P2qOMu0pWGYA3TgsWk0O30xX+PX5YXA9tryPdI
 kFd9qYnR9OfClasVBITKfyzBvZTBr6jhNtzSjQ1SwcbdRS4md6/2MiPFnaiIwfNv
 Zj+jw27UV73pytp1gxpNkNvMJG48/LgDZY3iqOTU1/sdVoJCcs5uNUEm6D1qrGbq
 xnfe8/QD9DtMyJqdoEOWFfsFiDFai4qhbkYEBHIIDSnq6nhOchiG4VyfEOp5J9O1
 2RTNrkL5JyPsFA==
X-ME-Sender: <xms:9Z19Xq2mXVD74pXvhcL8Q1LJidZ7LyqdMGV3JhFxh2tEk3TikM-Skg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomheptehnughr
 vgifucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecukfhppeduud
 ekrddvuddtrddukeefrdduleeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghm
 pehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:9Z19Xv70n-IokWkcIihmrjQRxT548pI_ia5DQChWXbR0yIZV3Luu_Q>
 <xmx:9Z19XoS9x_4pFBinTePCo1dAGDNcdkkF1N0mmwjam3Krjxi0oiwn9Q>
 <xmx:9Z19XpnIUasfokUWlEa_F42I7aOl29NL4MxM7e1iUdZl4ZYFcqJXsg>
 <xmx:9p19XjOpUe1tiA_mgWrLX1TiYUODhCGaVImZ23bb289MHVQ8BR1cJQ>
Received: from localhost.localdomain
 (ppp118-210-183-198.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.183.198])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3B87A3280063;
 Fri, 27 Mar 2020 02:32:19 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [WIP PATCH linux dev-5.4 4/4] ARM: dts: rainier: Add KCS node for LPC
 MCTP
Date: Fri, 27 Mar 2020 17:01:46 +1030
Message-Id: <20200327063146.28885-5-andrew@aj.id.au>
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
Cc: Eddie James <eajames@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Eddie James <eajames@linux.ibm.com>

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index f4cad70d8edc..7ed6bbb759b2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -588,6 +588,14 @@
 	memory-region = <&flash_memory>;
 };
 
+&lpc_host {
+	kcs4: kcs4@0 {
+		compatible = "openbmc,mctp-lpc";
+		interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+		status = "okay";
+	};
+};
+
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.20.1

