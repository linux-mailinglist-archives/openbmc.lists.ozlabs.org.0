Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C64D3B1256
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pvx6Py3z3bt2
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:41:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=JNLS301s;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=OQ1/VLVE;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=JNLS301s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=OQ1/VLVE; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psg6gSfz307m
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:19 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 51C9AEC4;
 Tue, 22 Jun 2021 23:39:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 22 Jun 2021 23:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=nywLGSt2lhgne
 7YWWpdBw4RgY5fP4s/yT7U9JbKKIxI=; b=JNLS301sLTLVzNxfmW8oiFLiTTYdh
 D4n+FtZIsburH1B0NYyDLfLlKSS7kmdFmJ3dkI9hV5aWGyGnAe3PNCBLbjN1RB1b
 J76OBaon1Kt7yvQGnGQTjwIIhkeL3j3OCCH1WFLKEDd/SSGcwtIX0nh1DABdW9B9
 Nh8NWf69dh949wuXUwRU+1iSB2f2ljT1TT/1JS7JLLowu9MqbJdY6mbnB2LqrSnK
 2F6AqBd+xba/ooWezY8c7x7TalaRRTa4+3OqjUdI/23B04YE66BKLNYFYJhv1V6g
 FJR+tLziH2EdfpkX5kXVZvmacrkEaK0IfHFcHyASqAbNyK1S++Ur8DlDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=nywLGSt2lhgne7YWWpdBw4RgY5fP4s/yT7U9JbKKIxI=; b=OQ1/VLVE
 2lIs2LGhxRWLunNDOODYSv+7loTVJERvEy/32Gx9c++b1HJ+OLtET/BD4sviN9dc
 JIlcgXhMaVLQwepVO5qrvLXjYp91DAAm7vi1saCDNbYjTPvjPsnmthVADHlW/p8X
 obCU787lquJRpIF3Eo/iv7a9HgzWOO5hk7LPqd2gCntqkyQJHP8qInVJ/TX7ZYNd
 bzVpBVB556V1YazdLkTPte6BM0PcOU6rBtG05sjdjJERcFJBBH6QnrJqpRjCfsIM
 auYsShgV52I2ZFfoVCGHUr+G55IK76GHQmbdZKAt9FaXXbiK5TtLIu0IZ6G2vlYQ
 kRp7/4U/Bi8uyg==
X-ME-Sender: <xms:5KzSYNaLZ87dLpPXgwLhlNWbewR6KcHivb23iX906gTjIA0s8fWU8w>
 <xme:5KzSYEbq9q593SUi3JmbI5SaOFfCEdVfwq0h3ExhixhwHAOvgCzeHl-zAoDuaaK6v
 7qF_amqZ7ragP-xaQ>
X-ME-Received: <xmr:5KzSYP_7hPmbDsSkMEZSKTrhvPddf2EMGuAMqK6G1G0gp8vSxXJ6PRNymjNrs7-OlQ_t72PcwBBLFHvcnItsA95q0JIuZBsuQLrl_1_dlu7pRnb8GLHkUFwjiUWu-atqbPU0_kWr7WCZFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:5KzSYLrR_W2Tvevxee3rY13SZwsK9z80UNIphqZFLFzz5UDbkjzRJg>
 <xmx:5KzSYIosO79dSGQp2R8lbqSDZB-A3smyRy1q-VQPMWtdkzj3Ck5o0g>
 <xmx:5KzSYBSPVNJ8dekjUgnC4rwr11haUczEkqUc-Wyby6RRruXwEkkFkg>
 <xmx:5KzSYPT5z7cGChNTZ4rCAIJGPCYMyqG_UQ5UyE8G_sPfgKrfZUL00w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 4/7] ARM: dts: p10bmc: Drop the openbmc,
 mctp-lpc node
Date: Wed, 23 Jun 2021 13:08:51 +0930
Message-Id: <20210623033854.587464-5-andrew@aj.id.au>
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

The MCTP LPC driver was loaded by hacking up the compatible in the
devicetree node for KCS 4. With the introduction of the raw KCS driver
this hack is no-longer required. Use the regular compatible string for
KCS 4 and configure the appropriate SerIRQ.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 11 ++++++-----
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 11 ++++++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 1c9e4ff5388b..d899c9620286 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -4049,11 +4049,6 @@ &lpc_ctrl {
 	memory-region = <&flash_memory>;
 };
 
-&kcs4 {
-	compatible = "openbmc,mctp-lpc";
-	status = "okay";
-};
-
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -4092,3 +4087,9 @@ &xdma {
 	status = "okay";
 	memory-region = <&vga_memory>;
 };
+
+&kcs4 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 73e94be5424b..9ea3864651d6 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1717,11 +1717,6 @@ &lpc_ctrl {
 	memory-region = <&flash_memory>;
 };
 
-&kcs4 {
-	compatible = "openbmc,mctp-lpc";
-	status = "okay";
-};
-
 &mac2 {
 	status = "okay";
 	pinctrl-names = "default";
@@ -1784,3 +1779,9 @@ &xdma {
 	status = "okay";
 	memory-region = <&vga_memory>;
 };
+
+&kcs4 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.30.2

