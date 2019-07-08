Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7596195B
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 04:48:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hqdV3WVzzDqSm
	for <lists+openbmc@lfdr.de>; Mon,  8 Jul 2019 12:48:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="asWolZdU"; 
 dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hqcz0R6NzDqLf
 for <openbmc@lists.ozlabs.org>; Mon,  8 Jul 2019 12:48:01 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id p184so6831990pfp.7
 for <openbmc@lists.ozlabs.org>; Sun, 07 Jul 2019 19:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bNYzwZM+SJDe46SkVCnIGeCzeQk83VUiN5W/7tYUhKk=;
 b=asWolZdUWFz8nQMKjdoAD2ywOJarzec2TGfXXP4TnMiUivu8vSq4LWjp1cyXrfFpox
 3ahsZASDZ77gJFCtAHdw89gwxrOzuHam0GEnrLBOYHj2ZJUQzgL2FrkdRGF1/gnvOtEk
 KeHCmaUnH0iGSNgjwX3+etL1cdIDF8A+TNM5poItMJp5DBJfpF4RYS2SSZ3ggGF7VLOo
 hfym/AuvLZhvCPoB9Majt4lhalZdlKkpd9wCmRue60swRgPN23+Nzw62CyDD6MVwXwK7
 1yWwGurIq+ud/IjcCFBryBBw8YUWrKFKRcT8STRQF4ptpiYnfjWWtY+uSHe3+p4w7dub
 O+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bNYzwZM+SJDe46SkVCnIGeCzeQk83VUiN5W/7tYUhKk=;
 b=Ex1uaKnk5LppL2f78r0Ju/o4GGHq100Vwxbw7CVNa7fP9sOIxPyAM8hoEATUPsTZMw
 OTuEOAvxRMTinuM2WlCbUq68QQGKx1vLppydJaXCd9zcBuVbhrflq9oLpP5p6/TEf4bm
 Ay7zdP2gGRxm8X0N4EHWVixd3IQm3bYWnjDbFF6AeWacpZnIDxMDdPdZPS9mgknJlTDd
 +GOe7Nv8u4M+D3Hg5mQ45+0ZdDRLtBgv23BpumpzVqXfJZA+sX49QcdmsfRHj+IZUkiO
 rHgvLGM0W+FOYkodK7RuQ/B3Lh5J1vMe5YxWirLAdwD71NDeMpLRUpn+r9Wo/ajVYRv3
 a2Rg==
X-Gm-Message-State: APjAAAWC3JZ2HaWBx8/u+X/b4sVA2c7To4xXLnAc/sfsHsinCaRQIB0D
 vj0v4XaL31vEAmdHTK+fBsQ=
X-Google-Smtp-Source: APXvYqw8+LUeKbKQ6lCqomDNlEFm7tAoQfUr6m03U8zGBZ89L7HPQf+alyli4lI3v9qGSXc50mHN2g==
X-Received: by 2002:a63:4f5b:: with SMTP id p27mr20107134pgl.273.1562554076401; 
 Sun, 07 Jul 2019 19:47:56 -0700 (PDT)
Received: from voyager.ozlabs.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id q198sm20348861pfq.155.2019.07.07.19.47.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 19:47:55 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Adriana Kobylak <anoo@us.ibm.com>, Hongwei Zhang <hongweiz@ami.com>,
 John Wang <wangzqbj@inspur.com>, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.2] ARM: dts: aspeed: Remove mbox node from device
 tree
Date: Mon,  8 Jul 2019 12:17:49 +0930
Message-Id: <20190708024749.22039-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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

This device driver was never upstreamed and so it has been dropped from
the tree. Remove the node from systems that had it enabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 4 ----
 arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts | 4 ----
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts         | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index c762c02dc716..628195b66d46 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -235,10 +235,6 @@
 	flash = <&spi1>;
 };
 
-&mbox {
-	status = "okay";
-};
-
 &mac0 {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
index a3d6b71518fc..73319917cb74 100644
--- a/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-microsoft-olympus.dts
@@ -163,10 +163,6 @@
 	status = "okay";
 };
 
-&mbox {
-	status = "okay";
-};
-
 &pwm_tacho {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
index 270c9236deff..caac895c60b4 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-swift.dts
@@ -317,10 +317,6 @@
 	flash = <&spi1>;
 };
 
-&mbox {
-	status = "okay";
-};
-
 &mac0 {
 	status = "okay";
 	pinctrl-names = "default";
-- 
2.20.1

