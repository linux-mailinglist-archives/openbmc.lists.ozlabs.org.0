Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F24C73AC1BE
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 06:02:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5ld81FNsz3cLy
	for <lists+openbmc@lfdr.de>; Fri, 18 Jun 2021 14:02:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=S5do6u7N;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=oBoLLJO0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=S5do6u7N; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=oBoLLJO0; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5lY91KyFz3c2l
 for <openbmc@lists.ozlabs.org>; Fri, 18 Jun 2021 13:59:25 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A0C15C01BC;
 Thu, 17 Jun 2021 23:59:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 17 Jun 2021 23:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=LM75F1V5SSsbT
 UQT4Cb6a5rKIFEaCjeF7lU1XAikCx8=; b=S5do6u7NjiKcoh0NRBpP0VWSnTpkK
 1h1bi84gchR6YZDjP23F/h/JbDzeEg2/tUnYoo4IbWkMDX0oUpEPK5+y0wR8sBBU
 rVsUnjNPbwkZ5QkzLsFRAWKKFGuVIUM0ETSPkxaDWG/z28EjKmFPaXrKqm+79B0s
 nE+O412ae9xM/maD68BaAi6wH3p3ALXzrVfvrYgdiNSxF04plm3wyTZ21zaBTuZo
 RdqWVPviL0/rPK5/mWUjv5x4L0JmBHKWgWL/bDVG+k+jzcC+gLmbWIoob0Ikr1D9
 0ocPzb6x+FqInPFK/XAw8fY60Ah2S03m7QokDOL4pKsZuAKHcnsRckMUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=LM75F1V5SSsbTUQT4Cb6a5rKIFEaCjeF7lU1XAikCx8=; b=oBoLLJO0
 W19FrqwY2EO7+mlDz6GUSM2r+Ei/X0YVa8WFGn05/j0e17leOQBJd5ID6P1rfE3a
 ucTO9woHAQFIe3LfKYePLQSvfx6plsK42apl+9oWcrG8+OuGAneQtzvD7clU+MBK
 fPuOlnp5nFgrm54P40D3bgcjaWjYdwwz34b8uOcZ7dqQE9TL58dXWPBX67/wAYs/
 7LmVKN+mUi3799h27sZH6LS7LX87ky8K6mT9ZDWNNRmjYhYaAev3zwi6AzfU5V+R
 hBdPZtom2r0y4ND3vdSZYFLJrQuV82kDqiLvp5Kt1bsQ+mBwuLRCaYMBo8Q6AAjw
 ofIfDNJOtEpdyQ==
X-ME-Sender: <xms:GhrMYDuMkgjb9QpOJjY6D7lfQiDFn5SfIbCb91aBl7wLl_O5DgvCvQ>
 <xme:GhrMYEfTvAhPg--9b4WvWhegACcQECLydY2DDXsbcntdVRuyJjZDA934UX6IVrI4p
 nwE1ILajAVlTFNmUA>
X-ME-Received: <xmr:GhrMYGwXDK3s4CgO2OHbV_Spsjz7Mxt2szIe-zCTqnrRLLsQwoPDj_NM4DgVqsnGWtR3l-3M8kGS69thC-iI1HoTA2MjnLJktYSIlEtNXFjaFeWMQzKMrdW->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefvddgjeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepuefhtefhudeufeehffeffeetieeufe
 duleevgfekteefteekleetffehjeeukeehnecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:GhrMYCNtpA9sEPAyJ3TFKJ1Mg07qCXP5t5kbm9xnPsgQ14dwWCoHQA>
 <xmx:GhrMYD-ul5XTMWn3r6d8SEd_A0g6dpUdx4gcZlYKeU9ix5U_I_ZCLQ>
 <xmx:GhrMYCVnHL2xis1Ct5_Wq3726X3FiZOwVSjnVfLDTN61Z8WgDdrvbw>
 <xmx:GhrMYAE2BHDPilbmeiQ-qyQbKqYpPRop56a1IVH1S_qNcKjd6uxrgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 23:59:20 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 7/7] ARM: dts: rainier: Enable KCS channel 2
Date: Fri, 18 Jun 2021 13:28:58 +0930
Message-Id: <20210618035858.4024689-8-andrew@aj.id.au>
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

Rainier uses KCS channel 2 as the source for the debug-trigger
application outlined at [1] and implemented at [2].

[1] https://github.com/openbmc/docs/blob/master/designs/bmc-service-failure-debug-and-recovery.md
[2] https://github.com/openbmc/debug-trigger

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 9d57f9f6a1c3..5e071b548cb1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1780,6 +1780,11 @@ &xdma {
 	memory-region = <&vga_memory>;
 };
 
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
 &kcs3 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0xca2>;
-- 
2.30.2

