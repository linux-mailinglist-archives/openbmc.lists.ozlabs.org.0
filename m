Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD0377CAE
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 08:59:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FdsNw0NX3z3c29
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 16:59:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=PshWke1s;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rS4AI83T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=PshWke1s; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=rS4AI83T; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdsCS1v7rz303Q
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 16:51:16 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 605811518;
 Mon, 10 May 2021 02:51:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 10 May 2021 02:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=E/ixKu5M2JttL
 2cs9RJ+XaSLGhPe2O/Ir119/N6vqYA=; b=PshWke1sV8TI1jNS9qoVUPDuLC41A
 fSYwrwpUwtiCxOUMxpDSrKMD215hJMcBhwLuCQijVQlmxUIJm5zaq0bSXKnKQOcF
 pDn0hJpCXUaO9VRkeBm6NVkxNar67opQN5+nvc99lBzb1LliDh0uJ89c+SK3JkpM
 pdXJ4mDfbNySzp0VuLgjWZY8HuKxkrYZ8e0t4eUdnRoNrGUml79sHMgJp0/3wef0
 +gEKSEn2fj02HJ8B9nTJKwEoMyzpI8ejNPS98adl03ADt7utVyUjo/0KaI0ttGP4
 36A9npoWjZhVWxm1rLDJds+mNk1FyjdkjMCp2jmkUaUtVcneuPBPDVwJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=E/ixKu5M2JttL2cs9RJ+XaSLGhPe2O/Ir119/N6vqYA=; b=rS4AI83T
 Vc15R+N8CKzjY89aC4sOCGvEK85it4ol/1oILF69Ft4/2460DFa+Gmpe1WycrQht
 LDAfUS19RN962pDr7IAfawOq4SlJSNF82NyMEaOrKn1BzAx8yce7Et81Q9L5sIH7
 1pP3LrhKq3NlaDYNM6uGawm/bZwEPTx85VdKWvyb509bDymHKceb+MCkn45VsHvB
 1905yFTxjH6vZ5spkpPZGLCYjJWf/T640QPihGZtCdYzGeWE5TEnvmi/T26Qqzxn
 hUjOz6SNHOApOhjVJyenHZc2t3p00vdMPf2ppmH1L9aX2R9ss3ffvTFRd9CWQsKK
 qdtUFfnGIexfIg==
X-ME-Sender: <xms:4deYYKpNVcNf_SzINjxulBkuf2rasvNPBQFyCMwGfJMGfRZDd2GoeA>
 <xme:4deYYIrpxhtihkgKP99-f7sa61xrRxy-pj-0jsT9iyYZ7ICJGn0wDSX9hOWiWIIgX
 XQEwfxCtkiI0p0Ixw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegjedguddtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeejgfdvveehteekveeggeellefgle
 etteejffelffdvudduveeiffegteelvefhteenucfkphepvddtfedrheejrddvudehrdek
 necuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghnug
 hrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:4deYYPPDG3iS6VfGYlQadDm8hTa5GdLVOAWDyy3erl8qJL9aQZYy0g>
 <xmx:4deYYJ4sxriRinRVjsEPFlMQWtX1EtOGz2dmxmTCmY8wktqF--zZJA>
 <xmx:4deYYJ63Yhp8DEhqflkJSCD6K9PtV3rr__cexiQapXHOiKkRESA1NQ>
 <xmx:4teYYKUDZwaF1F297wJ-EF8c4ji2XNekNMmRLqU91yyAsSJcXHtFHA>
Received: from localhost.localdomain (203-57-215-8.dyn.iinet.net.au
 [203.57.215.8]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon, 10 May 2021 02:51:12 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: joel@jms.id.au
Subject: [PATCH linux dev-5.10 v3 17/18] ARM: dts: rainier: Enable KCS channel
 2
Date: Mon, 10 May 2021 16:19:54 +0930
Message-Id: <20210510064955.1704652-18-andrew@aj.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510064955.1704652-1-andrew@aj.id.au>
References: <20210510064955.1704652-1-andrew@aj.id.au>
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

KCS channel 2 will be used to attempt data capture if the host
determines the BMC is unresponsive.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 73e94be5424b..757695fc1caa 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -1784,3 +1784,8 @@ &xdma {
 	status = "okay";
 	memory-region = <&vga_memory>;
 };
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
-- 
2.27.0

