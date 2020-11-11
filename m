Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA602AFBA2
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:24:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgn10PSvzDqQg
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:24:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=htAnRd+1; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWglv0S08zDqsq;
 Thu, 12 Nov 2020 10:23:52 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id f27so2546263pgl.1;
 Wed, 11 Nov 2020 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=N2LgTSKfWk09fHPTlpgxk+FWUKycAN1+sy73/0N+lpU=;
 b=htAnRd+1Sh/deb/MzYSg8ZeA9XmDxI9jAdDA0mdVUSephAAcr+sk4XPbMu2XhoEz3Y
 S/5IVFFvTCXKr3Ae2ZQ2oJlJxscC9MsoGvPhVpcIIFEvQksXXyUnR/5YBbr0A4lGgkM8
 G3Kxj6WM1eucze+yfJK4gcL81WDbpUQDMl4gxQ+ll+Z2EARLhqzfwE03w2DxDNQ3my6h
 6/cXJ3qBl08htrN7k2u41QkoXF6cfpVnr696bc1Vgev09HckSFKMVV+8QI4+UJMYSCUL
 FAjZMgLMCQbzSbHShqrAoyjJ/r3wUcBJm6CVZiVp8tBmFkA27wUpNdX1BHxs18COVb6A
 jDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=N2LgTSKfWk09fHPTlpgxk+FWUKycAN1+sy73/0N+lpU=;
 b=h5FHUIaxiomKxd7VTb2zvvbbkfozIhPBAsjW3AEDRIXB+z4x5py7mrTjUeITdoX3nr
 QyW4O589Xwr+upZFxrC3phqm7RgnpACjKqTsYAJ+w+ntAPkOpaYrvIZ6AVPz6YXzX8/f
 QwjES2oBsG3BHGFfKTRm4Mys4b9zToMG+GeRDYpTu8wJyRIsD1u+xHUovqdSZ3sItMUm
 ryV0OGCClDQap0o5/j7+GhjVn7IJDJ94NXVUrRC7J62zveJ913KqdR/r4Awq+4yXt3+D
 KadpP1oc8WJXjsFjjY3dkEAFIHMzcktg/D1UH15xuZcOLfrMrMtr3LHL7VC2yE8giraV
 1HOw==
X-Gm-Message-State: AOAM532DTYOb3QAOe9rUG6VUQFxz8rTM4ZrXk9gZHNczQK8vVVTgp65q
 Bdfk3M3q5XmFio0WMpJWGPs=
X-Google-Smtp-Source: ABdhPJwv6OQ30nQ97SFeBeF3qKT8VGyjMlYPqqYu2bKPk/BTa4gv+G14hGPvZVJb410AHvWRB2bfTg==
X-Received: by 2002:a17:90a:c693:: with SMTP id
 n19mr6296334pjt.69.1605137030062; 
 Wed, 11 Nov 2020 15:23:50 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id a128sm3901431pfb.195.2020.11.11.15.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 15:23:49 -0800 (PST)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH 2/4] ARM: dts: aspeed: wedge40: Use common dtsi
Date: Wed, 11 Nov 2020 15:23:28 -0800
Message-Id: <20201111232330.30843-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111232330.30843-1-rentao.bupt@gmail.com>
References: <20201111232330.30843-1-rentao.bupt@gmail.com>
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Simplify the Wedge40 device tree by using the common dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 .../boot/dts/aspeed-bmc-facebook-wedge40.dts  | 112 +-----------------
 1 file changed, 1 insertion(+), 111 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
index 8c426ba2f8ab..2dcfeae3c92a 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-wedge40.dts
@@ -2,137 +2,27 @@
 // Copyright (c) 2018 Facebook Inc.
 /dts-v1/;
 
-#include "aspeed-g4.dtsi"
+#include "ast2400-facebook-netbmc-common.dtsi"
 
 / {
 	model = "Facebook Wedge 40 BMC";
 	compatible = "facebook,wedge40-bmc", "aspeed,ast2400";
 
-	aliases {
-		/*
-		 * Override the default uart aliases to avoid breaking
-		 * the legacy applications.
-		 */
-		serial0 = &uart5;
-		serial1 = &uart1;
-		serial2 = &uart3;
-		serial3 = &uart4;
-	};
-
 	chosen {
 		stdout-path = &uart3;
 		bootargs = "console=ttyS2,9600n8 root=/dev/ram rw";
 	};
 
-	memory@40000000 {
-		reg = <0x40000000 0x20000000>;
-	};
-
 	ast-adc-hwmon {
 		compatible = "iio-hwmon";
 		io-channels = <&adc 5>, <&adc 6>, <&adc 7>, <&adc 8>, <&adc 9>;
 	};
 };
 
-&wdt1 {
-	status = "okay";
-	aspeed,reset-type = "system";
-};
-
 &wdt2 {
 	status = "disabled";
 };
 
-&fmc {
-	status = "okay";
-	flash@0 {
-		status = "okay";
-		m25p,fast-read;
-		label = "spi0.0";
-#include "facebook-bmc-flash-layout.dtsi"
-	};
-};
-
-&uart1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd1_default
-		     &pinctrl_rxd1_default>;
-};
-
-&uart3 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd3_default
-		     &pinctrl_rxd3_default>;
-};
-
-&uart4 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_txd4_default
-		     &pinctrl_rxd4_default
-		     &pinctrl_ndts4_default>;
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&mac1 {
-	status = "okay";
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_rgmii2_default &pinctrl_mdio2_default>;
-};
-
-&i2c0 {
-	status = "okay";
-};
-
-&i2c1 {
-	status = "okay";
-};
-
-&i2c2 {
-	status = "okay";
-};
-
-&i2c3 {
-	status = "okay";
-};
-
-&i2c4 {
-	status = "okay";
-};
-
-&i2c5 {
-	status = "okay";
-};
-
-&i2c6 {
-	status = "okay";
-};
-
-&i2c7 {
-	status = "okay";
-};
-
-&i2c8 {
-	status = "okay";
-};
-
-&i2c11 {
-	status = "okay";
-};
-
-&i2c12 {
-	status = "okay";
-};
-
-&vhub {
-	status = "okay";
-};
-
 &adc {
 	status = "okay";
 };
-- 
2.17.1

