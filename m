Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF733910B8
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 08:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqgzD3QS5z2yxR
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 16:29:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=EJHCNHCU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Efy7GmBq;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=EJHCNHCU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=Efy7GmBq; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqgys4h0Nz2xxn
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 16:29:24 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id C04C211FA;
 Wed, 26 May 2021 02:29:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 26 May 2021 02:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=fBy9fElUSoOWrgVahROjbbTjOC
 FXxSzn4iMLv6oOIe4=; b=EJHCNHCUD1TPQXeXvQpuMT8MbX0OnGJH+Vy96mszOi
 R3ByuflBQXs+/X3j+MMfg6M6tHKsa6uSZeLqvgc8wO/f8KVGrjnBszwA8g3zkwIo
 9kXwY3CWJa7Em9VHFSYovxH23f/jmNS+Hxpb6sbJWj5mHAJisbio932c3lsKjfIs
 kcSVa2kGJrWYYL/Tn5gu3lZEV0CjNQmQ8xJuGyq8scnaf75CI29B9DTXcvWVS/jn
 rE/ViCvVjtKS6i8cxN0QhPWKzNp7nCHGm6Jd8IoKyugR7PHGSQsed0qeWFg9cgFP
 7jcJ9pebvnTm1UeV05pcztnC0WByWwccsjq8ekZPEnHA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=fBy9fElUSoOWrgVah
 ROjbbTjOCFXxSzn4iMLv6oOIe4=; b=Efy7GmBq75U+J5b7/IHUvRWKRdzVZtcwr
 1WTIO2POlP5RjVI2L5E7TI/5wSJvV7X1DKByrX2zqUCCEcoPx5PNa8Za/3uwTE8y
 gKdjeMRwZ/0IT9+y/mQnAeQy/LPi6/aTKDxb3lq8aPuFKVS2sstyn23ZWs+pl4o4
 VOFeRH8hDdTAE/djGOKmk/oKsdqf2ij+QKY7ewMTl3nw6te3VpXCFGkjkvlXOBzq
 HbkcsCLpn560ebThN2wh77+U/7c3sYY8uaW1X4yicmggw9H+ZNSX6ugG76gaA40o
 gxvj3nRe97Qx3vJiIXSRLf13v2O2z/ZRp8bYFYmd9acExOa67klTg==
X-ME-Sender: <xms:v-qtYF2yiW7eppOD_FNJM7MrG2TWG6JmQSWCLO8IKN1iwR7cok2orA>
 <xme:v-qtYMGbkiLBVAjCbg7BlLp9VQ-S9KXVz7XLI93oHJG9MDH7hIF3gGZAWh7YIQDRP
 Uoi15J7UAip2RcCAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekvddguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheptehnughrvgif
 ucflvghffhgvrhihuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrfgrthhtvg
 hrnhepkefhieffjeevfeevhedtieeihfefvdejledvvddthefftedujeethfeuueelfedt
 necukfhppedvtdefrdehjedrvdduhedrkeenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:v-qtYF4PqFtp6ERT9Xz9vzG6lBV_HH78kRk184sZ3cY2El1fNWUHZQ>
 <xmx:v-qtYC1r6PeWOIuBohKvKp08BuMHghyx03W1EdVwJlvBnReAVpWDIg>
 <xmx:v-qtYIHU_217xntOaBGQsLkHu3n1NWLqKUqzi4LamQ9rGy7Z5o10dw>
 <xmx:wOqtYDN6GPUgg0rSiagUzPYz635l0wgs9CYcqEXGkvuPwgVOcH-8vA>
Received: from mistburn.lan (203-57-215-8.dyn.iinet.net.au [203.57.215.8])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Wed, 26 May 2021 02:29:17 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10] mctp-lpc: Match register addresses to updated
 devicetree
Date: Wed, 26 May 2021 15:59:08 +0930
Message-Id: <20210526062908.1662985-1-andrew@aj.id.au>
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

This driver was overlooked in the rearrangement we did upstream. It will
go away soon enough with the reworks to the KCS subsystem.

Cc: Andrew Geissler <geissonator@gmail.com>
Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 drivers/misc/mctp-lpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/mctp-lpc.c b/drivers/misc/mctp-lpc.c
index 71fc4ae69de7..0228f6bbf1a7 100644
--- a/drivers/misc/mctp-lpc.c
+++ b/drivers/misc/mctp-lpc.c
@@ -18,10 +18,10 @@
 #include <linux/uaccess.h>
 #include <linux/wait.h>
 
-#define LPC_HICRB            0x080
+#define LPC_HICRB            0x100
 #define     LPC_HICRB_IBFIF4         BIT(1)
 #define     LPC_HICRB_LPC4E          BIT(0)
-#define LPC_HICRC            0x084
+#define LPC_HICRC            0x104
 #define     LPC_KCS4_IRQSEL_MASK     GENMASK(7, 4)
 #define     LPC_KCS4_IRQSEL_SHIFT    4
 #define     LPC_KCS4_IRQTYPE_MASK    GENMASK(3, 2)
@@ -32,10 +32,10 @@
 #define     LPC_KCS4_IRQTYPE_RISING  0b11
 #define     LPC_KCS4_OBF4_AUTO_CLR   BIT(1)
 #define     LPC_KCS4_IRQ_HOST	     BIT(0)
-#define LPC_LADR4            0x090
-#define LPC_IDR4             0x094
-#define LPC_ODR4             0x098
-#define LPC_STR4             0x09C
+#define LPC_LADR4            0x110
+#define LPC_IDR4             0x114
+#define LPC_ODR4             0x118
+#define LPC_STR4             0x11C
 #define     STR4_IBF	     (1 << 1)
 #define     STR4_OBF	     (1 << 0)
 
-- 
2.30.2

