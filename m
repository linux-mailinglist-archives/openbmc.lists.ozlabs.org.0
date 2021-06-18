Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF923AC1BA
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 06:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5lbB4Fm5z3cns
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 14:01:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=CAS3YhKB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=i9G+nvSS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=CAS3YhKB; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=i9G+nvSS; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lY34bfmz2xvH
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:19 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id EE2FF5C01A9;
 Thu, 17 Jun 2021 23:59:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 17 Jun 2021 23:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=ojmenqufaVANU
 qev241fSVvhECl4MD8cr9SjKY73r7U=; b=CAS3YhKB+oVxHf99odoIrUUETGRa0
 iUySISIt5hq/C9Vlda5iMS+kOeQPBRi5m/JoiFIGhqpugLpaRGqHpf0b1elhTPco
 32FMjqQ/FC3GwS7oFyqBEkGPjUe9Nn/ygqUdN99z1bYSEcmTTo+8zkI8/9g9hjq5
 UeQJnnwWT93/wOfswrGFh4CSJtPAXom5mhmv5iJ9MDt7WL/0DVdMzXGR3in/PWtR
 ClZoT3p7Zt6NuLKx/zlDDxLDWNIM8iv03ozpYRDksXzyvKu0+4LyFvuvIJHzM2p4
 xLcrNktBTZ786VXQ4UN1zWC/RLkh5i+KxaflfAEaXavEijtiOq9lXw0pw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=ojmenqufaVANUqev241fSVvhECl4MD8cr9SjKY73r7U=; b=i9G+nvSS
 0i1tsR5SoKtFztrNqv3p58NDNMoZVbPFHjFbK3TSQi3g5mUZHTn6NcsEEdiBeMpV
 o7B+t8orgypuFPPQzfjHJZig2/Qpy1H+LC+TWLv9pWzceNSTQSER3UkUDjxpBudV
 LiViEUrfGgIj0tSh7N+hZEACRLPlJMftHoxGXSwK+0ZK85MXe9MK1HzTx79Hkria
 hF4QziAEwW2Ig8Jr78AUFx/llr+yqTRHFHgVAJ1fqB7NLlboHQ1Ju5iRiDRDbmh3
 ySjGy3Bnw0WNOmcxrXZ4zTIrCNV8gv/Un54ED1f2R0I6Mz9dDclCFOHXBvN9Jivp
 uQPx36InshIy4Q==
X-ME-Sender: <xms:FBrMYBgimgIyPCkL1lUfI5QCaFW1e5muuxPNpekINWEezuvMv_AWRg>
 <xme:FBrMYGAwWBz_LM_wNfCe-pbS_2qZlK06yKxB0ssotP2wQ_xHmI_25_A3Z25QVX8Ta
 Z62Lf2Sqitr0-XrvA>
X-ME-Received: <xmr:FBrMYBEx4xwMyP3XxtCjrRrTKLaL1_vNYYTTdrVH3rqQmc-B-MTPuXBbb4upvfPDmAsdXH0m3erF6POGsW_hG1LjyhC6rJYtFq-XUwOAwa8JHUMugzVYsgU5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepjefgvdevheetkeevgeegleelgfelte
 etjeffleffvdduudevieffgeetleevhfetnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:FBrMYGSWYKn3ZOCjxIb4_c2uZUgqpPX29uHqlK-oF0BSkDxZWw--OQ>
 <xmx:FBrMYOyksX1g6ZTbLawMC_TamT-9ZGuUnsvBQqdum7mITWr_GFlwZw>
 <xmx:FBrMYM7cRVFDzomXwA2x4WvR1aU0FQMU0WmvU3l65IVqQHSxTAqyAw>
 <xmx:FBrMYEb_hKP6Ly0g4sTrJncltsiC1J7oScOBEcWvlXIYSNaKXKHUtw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:15 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 4/7] ARM: dts: rainier: Drop the openbmc,
 mctp-lpc node
Date: Fri, 18 Jun 2021 13:28:55 +0930
Message-Id: <20210618035858.4024689-5-andrew@aj.id.au>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210618035858.4024689-1-andrew@aj.id.au>
References: <20210618035858.4024689-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The MCTP LPC driver was loaded by hacking up the compatible in the
devicetree node for KCS 4. With the introduction of the raw KCS driver
this hack is no-longer required. Use the regular compatible string for
KCS 4 and configure the appropriate SerIRQ.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

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

