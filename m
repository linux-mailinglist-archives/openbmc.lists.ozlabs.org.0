Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7473C45D4
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 09:20:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GNZtS5tk1z301B
	for <lists+openbmc@lfdr.de>; Mon, 12 Jul 2021 17:20:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=PxOxRT0z;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=H+w4+wZj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.17;
 helo=wnew3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=PxOxRT0z; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=H+w4+wZj; 
 dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNZt65nq6z2yMq
 for <openbmc@lists.ozlabs.org>; Mon, 12 Jul 2021 17:20:30 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 562B32B006C7;
 Mon, 12 Jul 2021 03:20:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 12 Jul 2021 03:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=MBocd+72dyzm6HBOQObisasACa
 4RkbPFqTzWfzH9CXk=; b=PxOxRT0zhybX3/ji68BN+m0Vbw7ll7XGJjZMIfkf3z
 iDtfU3XYaZlGei8kkqxer5IVHiuaDCd3zsNKkeDMc1gU9xVQLq0fEgx8mG3eYLZW
 0tQx/GmXKBE0DF7BQmdqkLvac4m1BCH/6dB2uLxbLbqFXus0dXCGugwim3jbLOUh
 9bYZj12Td8ne+MRg1TcBrspxiato36l4eqSbMhj16cZZ4tNitFvGsQ1zO6yynFyd
 P/zNLDhD/X+nWge8Y+tOa+cea3NM2T/vi2a3wZtR9QpHg/kO4zelWZ3jEvPlmlrK
 WgeJBoYIu138RlYzzYWhNqUsRLbIkvXNh355DJHa2Gxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=MBocd+72dyzm6HBOQ
 ObisasACa4RkbPFqTzWfzH9CXk=; b=H+w4+wZjLl/A5mZnKj82JRNnGm/tuVde7
 vgG35SHgZIunScFShvgtVYGoc5aymKE56nqTq8Zv/DN5jQhUiVLibvOzf/d6Ek5G
 TQAPVn9YhZvubf9f6oNiS0LvI2sJ8Xb8vyKuxvLHfieWFir/rtlnL+1Ko5kXj/nl
 LA+Aw2fxkdhS0K9btukanyzjLwstU8u3APNuA3goPygEvxZOhYp0rm0GUiqoEz7A
 Mtj/bAIIeCzRslvXzd77Y4YxBwUjbMuZgTGjsJNRjQb56aubdF3e45zfWPASlYPd
 6Y6k2XWT8UkjCOOWk9Jv/5PL16WD3Bbv/zeOtryuo0dHnkN3Jemzw==
X-ME-Sender: <xms:N-3rYNTyNxhPShuvoZjNL-nlrFWxCr4k-J5ppIm14hv9LWRrHs42YA>
 <xme:N-3rYGz4Yo8yUX2p8Dh_IRqulWG9-00PHJpSpNxNdf7pbJmxvt0X53g6ntSyta0FU
 JpIbIZ-td4EyztXuQ>
X-ME-Received: <xmr:N-3rYC0mRZt_-gbsbTbm105-N_tqejW4nTE0xEFvzAR6e251jjT2VnX_VAv61bfuBCQN8tnUvzJNtXiDJnT86sfqeIfehCJYemAmqttk6y2ZQhZ3hTzqCvxKmYw9ceWtJgquYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddugdduudeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenogevohgrshhtrg
 hlqdfhgeduvddqtddvucdludehtddmnecujfgurhephffvufffkffoggfgsedtkeertder
 tddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfiesrghjrd
 hiugdrrghuqeenucggtffrrghtthgvrhhnpeetveetudetfeffvefghfehgfeuvdeikeel
 tdevtdfgteeggeffjeffteejtdethfenucffohhmrghinhepohhpvghnsghmtgdqphhroh
 hjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:N-3rYFAbHbl6gHEnZIiUqOi0uQGwejJPAHVmX3vy3qTtih36rCGczw>
 <xmx:N-3rYGhF8sG9rDgZdoQgaGlQeeuyVT7B9vxdSKOq4lsEHT7EUsU-lQ>
 <xmx:N-3rYJqZSesYFnc6AB0kAsFGuhIwl3AQlbqfRP_5uvF9musdbOosSw>
 <xmx:N-3rYOL7bZYtyKwHS9tYNpFLzCZVdNNxRQEi8irTDGUfUAvJQvh_C1iXaIE>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Jul 2021 03:20:22 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [RFC PATCH linux dev-5.10] ARM: dts: rainier: Add bmc-boot-indicator
 GPIO name
Date: Mon, 12 Jul 2021 16:50:13 +0930
Message-Id: <20210712072013.3102956-1-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The GPIO provides boot state to the operator panel. The operator panel
uses this signal to report BMC boot failures to the system administrators.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

I'm sure people will like to bikeshed the name, hence RFC.

I've put up a documentation patch here:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/44838

There's an associated recipe and service here:

https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/44839

Please review.

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 728855c5cb90..66daf629767f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -227,7 +227,7 @@ &ehci1 {
 &gpio0 {
 	gpio-line-names =
 	/*A0-A7*/	"","","","","","","","",
-	/*B0-B7*/	"","","","","","","checkstop","",
+	/*B0-B7*/	"bmc-boot-indicator","","","","","","checkstop","",
 	/*C0-C7*/	"","","","","","","","",
 	/*D0-D7*/	"","","","","","","","",
 	/*E0-E7*/	"","","","","","","","",
-- 
2.30.2

