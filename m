Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF8775483
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 09:55:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JPwZqtpP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLMmV0ckdz306p
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 17:55:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JPwZqtpP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLMf51JPbz3bT8
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 17:49:49 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-686bc261111so4663412b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 09 Aug 2023 00:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691567386; x=1692172186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAja0gf+f7f8fiWKKNV7mcYd215oWVSjDKAeH53b9JI=;
        b=JPwZqtpPFoAxpSi0vFz4CWQXhMYrDOUrLykzIY1yIwnRy3EENHlEZFbEvh4oN9crV4
         zZx7rp7MGKSZeVYmvOiIvc5yzDtJiCOYFBPB0yKTVHZc8OKdtUTGRe7svjUneztHDdJA
         /sf2GoYyxQnfmSwAZBC0C3K5NtE9grNuCdERw5/SgCw+Exed3KOlogn0DDS7+LA3AEKx
         f9zWjOqKRLK+7TAka7GKxAurIIP6RNSlPAwnuhSmI01v582bdfp4ajCCS+wNEwsSuxnU
         2k0ewMdo8ZwZBEJ8ogORMFEda+o2qLK8ComsFS9sbSh+B2DrFLyEXUK2Q8A65aYgDWDY
         1x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691567386; x=1692172186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tAja0gf+f7f8fiWKKNV7mcYd215oWVSjDKAeH53b9JI=;
        b=jnBn0mU3HRXbKUsrkNQBSR38Tu3XJzbhjlQF9bEu5iVDqjZ0HBSyrKgQ+le1X3mlIB
         Xo9b+Vp4rw7zc5VLR8AQIKf8E6jR8NY9GD0TAzSa3NSOkgi4FoWff80uyflJPNhhzQib
         +fatTRPUiRuR9EgYmp5M3gQnnFam9IW0mDIPjTx5YvHgy8JzdwkKquFZGjbPnRwKNrwI
         Ve3ODdGrCAZ7YcNiBVrZyQxXR8NkciwN7Vr938FbzFdMbTfP82IJweVX+RCdccjUeAqE
         EyPzGdXvb3UDax/Ou3jo3ZQEEFC1UeqD/ACNlZUlj4ytiCqCm6d/zr5mKB/NiG2UT3cP
         OU+A==
X-Gm-Message-State: AOJu0YzgFgNS59TMB3Ycs6WNcPXBJBhhacLAjAdVuzBlU/HIMAneO+ks
	9zjmR7eKeJG8Wai6dy3WFZnvMlphNy8=
X-Google-Smtp-Source: AGHT+IEbOxuCvkjUZT8aIw3cz9NKFxntTckrp0wJHYPu3WLr6h0ffvQeBc3sH6zAOg0ok8ijHZIwqA==
X-Received: by 2002:a05:6a21:998b:b0:13d:5b8e:db83 with SMTP id ve11-20020a056a21998b00b0013d5b8edb83mr2165808pzb.9.1691567385818;
        Wed, 09 Aug 2023 00:49:45 -0700 (PDT)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id v9-20020aa78509000000b0068285a7f107sm9620603pfn.177.2023.08.09.00.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 00:49:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-6.1 v3 5/5] ARM: dts: aspeed: everest: Move common devices up
Date: Wed,  9 Aug 2023 17:19:21 +0930
Message-Id: <20230809074921.116987-6-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230809074921.116987-1-joel@jms.id.au>
References: <20230809074921.116987-1-joel@jms.id.au>
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

Other systems have the SoC devices listed before the FSI description.
Move them up in order to make them similar.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts | 141 +++++++++----------
 1 file changed, 70 insertions(+), 71 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
index 632e4219a853..1f59ab28d29b 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts
@@ -2431,6 +2431,76 @@ &emmc {
 	clk-phase-mmc-hs200 = <210>, <228>;
 };
 
+&ibt {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&vuart1 {
+	status = "okay";
+};
+
+&vuart2 {
+	status = "okay";
+};
+
+&lpc_ctrl {
+	status = "okay";
+	memory-region = <&flash_memory>;
+};
+
+&mac2 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii3_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
+		 <&syscon ASPEED_CLK_MAC3RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&mac3 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rmii4_default>;
+	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
+		 <&syscon ASPEED_CLK_MAC4RCLK>;
+	clock-names = "MACCLK", "RCLK";
+	use-ncsi;
+};
+
+&wdt1 {
+	aspeed,reset-type = "none";
+	aspeed,external-signal;
+	aspeed,ext-push-pull;
+	aspeed,ext-active-high;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdtrst1_default>;
+};
+
+&wdt2 {
+	status = "okay";
+};
+
+&xdma {
+	status = "okay";
+	memory-region = <&vga_memory>;
+};
+
+&kcs2 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca8 0xcac>;
+};
+
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
 
 #include "ibm-power10-quad.dtsi"
 
@@ -3944,74 +4014,3 @@ &fsi_occ6 {
 &fsi_occ7 {
 	reg = <8>;
 };
-
-&ibt {
-	status = "okay";
-};
-
-&uart2 {
-	status = "okay";
-};
-
-&vuart1 {
-	status = "okay";
-};
-
-&vuart2 {
-	status = "okay";
-};
-
-&lpc_ctrl {
-	status = "okay";
-	memory-region = <&flash_memory>;
-};
-
-&mac2 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii3_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC3CLK>,
-		 <&syscon ASPEED_CLK_MAC3RCLK>;
-	clock-names = "MACCLK", "RCLK";
-	use-ncsi;
-};
-
-&mac3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rmii4_default>;
-	clocks = <&syscon ASPEED_CLK_GATE_MAC4CLK>,
-		 <&syscon ASPEED_CLK_MAC4RCLK>;
-	clock-names = "MACCLK", "RCLK";
-	use-ncsi;
-};
-
-&wdt1 {
-	aspeed,reset-type = "none";
-	aspeed,external-signal;
-	aspeed,ext-push-pull;
-	aspeed,ext-active-high;
-
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_wdtrst1_default>;
-};
-
-&wdt2 {
-	status = "okay";
-};
-
-&xdma {
-	status = "okay";
-	memory-region = <&vga_memory>;
-};
-
-&kcs2 {
-	status = "okay";
-	aspeed,lpc-io-reg = <0xca8 0xcac>;
-};
-
-&kcs3 {
-	status = "okay";
-	aspeed,lpc-io-reg = <0xca2>;
-	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
-};
-- 
2.40.1

