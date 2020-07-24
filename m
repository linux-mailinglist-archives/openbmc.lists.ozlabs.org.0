Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D4E22BC04
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:35:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYG34Y4tzDrgQ
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:35:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oILo+5Ur; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCY9G0kM4zDrgF
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:31:14 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id z5so4376918pgb.6
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dcQNWsDTo/w3nHavq5vp42ZbkFesx9ljXve0onI3iZM=;
 b=oILo+5UrniBrZsR9h8Gges0mTUqtx6xahA506qQfqGS1utJnBt/AeqCdC7dcFEXK1w
 HmRW7rjx1k2vZmFUjMKtRLYSFHllqCVIK/4sxQeUmwWOruNuqc3ekKR7+nqI0USTsB4i
 5D1b/Y64bTH0YIh9riejdjzQ9g72TaU1+BSZNRqlJgvpo5n9naHJ3gisX27mdIuQIfXy
 4j0HGjWjESeN3YEEr07NtWor3HCsBtYULtfgPzgA3wEtve12VzCpKaxRqE5+/pLE7cWa
 YTJ7/0XnPLzq2VQUWV5mWLnA1LHsLL1IsgKSC+KMh96LCQ+YZR359LZ2UfIYBhZLO1Tk
 /c6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dcQNWsDTo/w3nHavq5vp42ZbkFesx9ljXve0onI3iZM=;
 b=K89VaIRSCBU6NcOEDNwU+KKKeNteM5MKgJl+LWiF+ETxPnn/G5C3ApYyxWxdsl2xx2
 Z6d5UqedBJ59TlUu4QKpNYp3JcJmBYs2krWIxkNG1Idl5p94YGzFeNOE6OXK2gF4T98c
 PSv8x4OTDPno3+cLjKq2eKqZ6EwFvzuwZW8SaKMabPJKyDlQ8ji119MOj1aXm5SMBUqo
 ubMVnH8iOGsO1oz3lW3vfeZX+gT+fdodOfc78FskTGnqxrZVhd1sTFfNFLrcMSK+/iIU
 /HqefkqPxy0/dfFobrhAbABw6bI7cmy4woW8x1uaShReg4RNg9y26UWkFy1/9U9KLVFU
 dTDg==
X-Gm-Message-State: AOAM530f2VPdzjbMzfZYFoPHwT82k1TV0UvRHQKUU7tDo3hpCoL5kwMM
 ALqCpfu+Q3Cp55Z3bjW1iyxAb8II3KY=
X-Google-Smtp-Source: ABdhPJzxpnnuEUIyyR47gb09c0m2e9GoqWsBUx/N5KzpXRrf9g8oVAbA4KChdijHKTKdRIlNuOac7g==
X-Received: by 2002:a63:135b:: with SMTP id 27mr7013391pgt.37.1595557871998;
 Thu, 23 Jul 2020 19:31:11 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w9sm3880239pfq.178.2020.07.23.19.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 19:31:10 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 2/3] ARM: dts: aspeed: rainier: Add CFAM reset
 GPIO
Date: Fri, 24 Jul 2020 12:00:35 +0930
Message-Id: <20200724023036.354310-3-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724023036.354310-1-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
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

The GPIO on Q0 is used for resetting the CFAM of the processor that the
ASPEED master is connected to.

The signal is wired as active high on the first pass systems.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Fix polarity
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index 0b5c6cc1c66a..18e0b22d5e48 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -126,6 +126,12 @@
 	#address-cells = <2>;
 	#size-cells = <0>;
 
+	/*
+	 * CFAM Reset is supposed to be active low but pass1 hardware is wired
+	 * active high.
+	 */
+	cfam-reset-gpios = <&gpio0 ASPEED_GPIO(Q, 0) GPIO_ACTIVE_HIGH>;
+
 	cfam@0,0 {
 		reg = <0 0>;
 		#address-cells = <1>;
-- 
2.27.0

