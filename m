Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5174319513F
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 07:33:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pX9d4S6mzDr4m
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 17:33:25 +1100 (AEDT)
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
 header.s=fm2 header.b=wRlCQl85; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=mzBEP6gR; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pX8N0tPqzDr45
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 17:32:19 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D3CB05C0345;
 Fri, 27 Mar 2020 02:32:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 27 Mar 2020 02:32:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=from
 :to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=/yikLTZaqy9wE
 wZNWwG1Im8nNHRGGrnokh7KMS8/Axg=; b=wRlCQl85QpIDDu35CGZsBmvoMCJcR
 M3I3y0uRRlsXUrgycWrffZPzDV9MgtQ2Ydf9vclazsW1dOYVDf8zHJKxzYO2k0jq
 LPhlbIw05lV5AP7EEL7epNZFtrP51weW1Bv8K9ao9zQ9RWEzss0uIbsHxwlPWcnt
 Pgg0Ic0M+MWjq4/99d9bHylWcgM7nTu8zmTQPog9SaLT0zfv73FvPqpL8ktDEUrs
 g2QreY7tuhinx7en4XYsWZ47usc6oFReucscfFCQqA/pqoXfPsbbxiPlPklNqhWO
 4Gowicv8i5nfagpXYh7wsWZVZa/y2zVr1YMl8l6Tx3p4yNjw/FPeMZ3Mg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=/yikLTZaqy9wEwZNWwG1Im8nNHRGGrnokh7KMS8/Axg=; b=mzBEP6gR
 54b5AnzR+clW1R3ujXQX4ACAJ7nWwSWyuGOx3vINHvhF4MY8O1yDesjwizgj4nkd
 ELUDVSeaLfvNQv+KpNS7hJ/SyhJcdD8ew4uBxdX4/6RKNvaL9spAh26LyOJXZOXm
 1dIi81J1Y8XjXM6fNBDCRQXJXUkNEq7NlKJSZZ0Sys0Q4d27idvQsMifAYeFOlEv
 5plpwIPT72Kv84/qThU7pPw/a1/mKIn97K3I6dAtZOwFXUND6pPaAchD6rhHbecn
 CzfGlbL+cDYKrQSVmz9deUlyrgzUMukEDPvX4bu8J1QVfOB+jCigcRaMupjg9nIk
 yLANc7Ac5NCmLQ==
X-ME-Sender: <xms:8Z19XtC-yCbJZ5INZjxP2OA3eee_CxRGsT1qEBcHeNvO3hNgGlX16g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudehjedgudelhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
 ertdertddtnecuhfhrohhmpeetnhgurhgvficulfgvfhhfvghrhicuoegrnhgurhgvfies
 rghjrdhiugdrrghuqeenucfkphepuddukedrvddutddrudekfedrudelkeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:8Z19XnQIEEBS44WhbFtud4_xP-nv84rOnW9rFakGbafQnXuELY1kIg>
 <xmx:8Z19XsIG_aMMS0MuQZ7LG4kVN9e6LRjp_kCp1iT3ANxT-owpDXN0lQ>
 <xmx:8Z19XjfCzdIFaRBh1nlsBbk0CYNXuEb6tOXJI_DgAesrRHW-rD5OTA>
 <xmx:8Z19XkeSTWTMUSbAvrISruqICj8MEmxEc89O1yOQHx1tzgG7tI4dpw>
Received: from localhost.localdomain
 (ppp118-210-183-198.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.183.198])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7934D3280063;
 Fri, 27 Mar 2020 02:32:16 -0400 (EDT)
From: Andrew Jeffery <andrew@aj.id.au>
To: openbmc@lists.ozlabs.org
Subject: [WIP PATCH linux dev-5.4 2/4] ARM: dts: witherspoon: Add KCS node for
 LPC MCTP
Date: Fri, 27 Mar 2020 17:01:44 +1030
Message-Id: <20200327063146.28885-3-andrew@aj.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The compatible is terrible, but we need a way to describe how we want to
drive the hardware, and it's not in a fashion that's integrated into
IPMI.

Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
index da9e379b10bb..fcfc65dd8cae 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts
@@ -325,6 +325,14 @@
 	flash = <&spi1>;
 };
 
+&lpc_host {
+	kcs4: kcs4@0 {
+		compatible = "openbmc,mctp-lpc";
+		interrupts = <8>;
+		status = "okay";
+	};
+};
+
 &mac0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.20.1

