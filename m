Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BB3B125D
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:42:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8pxb6vLqz305n
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:42:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=OGo6SqSQ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=RzBod8Eo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=OGo6SqSQ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=RzBod8Eo; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8psr2KcSz309H
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:39:28 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id AB1B6D25;
 Tue, 22 Jun 2021 23:39:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Tue, 22 Jun 2021 23:39:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=sDPqIrp/dmfrZ
 0TQZoGzAIfFS0OKhVxV0OkEb/0/4Jk=; b=OGo6SqSQhWjY0zWFBYH8/IdDJagJ6
 lRWtTfMOKyuccACG1Ov8rcstmVU8lnA6IsHhYh31pjN9Sl3Wz5YWe8v9Vj94TrFx
 eC5sH4Al4W7U2jH1rj4/f6ej1QHkMgsJI7dpwRR5PH7MmH74uw1fyySZMr8DcJba
 Uvj2woo9lIsYX/JMl1AGErwpSrwOXjMoDZiAF7KAn8wW3BpCEOKW9gwZiaz7gNoy
 DO121IKzQVflR6w4Zr7M2vap0Wf8Yqr+46LuAhVnjK5U6uqI/5jkmDz7mz5fx+nX
 hOw4H24LJFWmuiSkT7fw1jDswOm4g2Js1iEg3kTQFi5rSJnDnx/cxrNaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=sDPqIrp/dmfrZ0TQZoGzAIfFS0OKhVxV0OkEb/0/4Jk=; b=RzBod8Eo
 jFzkzYKWMhotIlLYTcmUpACKYuXklnl63ZSTEUrD4MUqCdJq3RDR6N7c/UQD5rcF
 ckAlc2mEQ7bgTXfp5woEqGxbCT7V12KBb0cmlz7M6BqornZwCHE7JGuP671A6ZrS
 Z/hivWXOwqYFgBnd1AhWHNmmSY1DBfik6BApw4gXcFjDqaDvcvNromRVsvqZsdiA
 TQv2asWN9q74WDuH6Tf4lcWlCUE74x3Wa18Vu8Ld4yGtOFQdCEv/VZlQQXVALBn6
 z4fwNDS13c76IPQtgCPNVw+pq8P2yTdg0GeERTU5nzd/HKESwZoZ/pul8wXqxu6N
 V8xT0tTOV8k2Qg==
X-ME-Sender: <xms:7KzSYPjlXlZQj_I7cv6byHlpRb8wsv0NSKliu5vG2xxt4GrgNtg8tg>
 <xme:7KzSYMDWmmEVX8o03LQkMfN18tVgZhzBW6DMZrQWIaOq6OG1Ucocs5GYXLEhYj5Vn
 PZExjKKVchPjReMkA>
X-ME-Received: <xmr:7KzSYPFHPhxq_28w1APYExrlQO0kWMwK4b5X-S7xR5ThcSPXFlzmWOxgRH1nePfMzNTxD7y8YyVTezzpnhj4hNEQ8ycxF3yjlr6py4ZmFvWag1y2Sm8HhjpVaTLZG7Mln35t6BLw5Oeb7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddgieeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
 dtredttdenucfhrhhomheptehnughrvgifucflvghffhgvrhihuceorghnughrvgifsegr
 jhdrihgurdgruheqnecuggftrfgrthhtvghrnhepuefhtefhudeufeehffeffeetieeufe
 duleevgfekteefteekleetffehjeeukeehnecuffhomhgrihhnpehgihhthhhusgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnh
 gurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:7KzSYMSTNpB9bbzJjy0CVxwNs1qOfypHKA-C0TxMEpv42sABivNS4w>
 <xmx:7KzSYMzG8tzv__tbDgZEei3gcszqUKRWRqNW0dMZGM9FJj0WY1btZw>
 <xmx:7KzSYC6J8N7VA3UpzEAmYKc2B1qlLRSCEvcKHDjz5858XDy9WqpWgw>
 <xmx:7azSYCYS2I_OmYL1F-mbrkGB5kXeezV4sHje6knrakf4WNUlSNxaKQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Jun 2021 23:39:23 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v2 7/7] ARM: dts: p10bmc: Enable KCS channel 2
Date: Wed, 23 Jun 2021 13:08:54 +0930
Message-Id: <20210623033854.587464-8-andrew@aj.id.au>
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

Rainier uses KCS channel 2 as the source for the debug-trigger
application outlined at [1] and implemented at [2].

[1] https://github.com/openbmc/docs/blob/master/designs/bmc-service-failure-debug-and-recovery.md
[2] https://github.com/openbmc/debug-trigger

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 5 +++++
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 738785390fa3..43d998e39f65 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -4088,6 +4088,11 @@ &xdma {
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

