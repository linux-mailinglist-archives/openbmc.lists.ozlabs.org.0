Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB11462EF
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 08:54:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483F0X3mkQzDqWG
	for <lists+openbmc@lfdr.de>; Thu, 23 Jan 2020 18:54:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HWlc0PUH; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483Dvp3Cx1zDqTT
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jan 2020 18:50:14 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id t14so997457plr.8
 for <openbmc@lists.ozlabs.org>; Wed, 22 Jan 2020 23:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HIya/ZFSigXHrEKocX44bLE3nip0uTMMExPPVZYQT4s=;
 b=HWlc0PUHjJanZQM+c7Il7FvFB7u8oEjZcIf/A9YTZazsVdwGNq0XqnSa4jUKQNaZEK
 Vp5c1uxGP8KTIClKH1MccXYQbLIdcyITNqcRvduPTvcOg/HIgCg48jVMWCJZ5KSEiu3D
 hIn0xdy65wRqIE3hC0EzVgl3XzO5FbKF0+aal7CJ33byEcuxvTJjAPJGZ0JR8gQWlGhI
 jevYxKeUclyt3PGSaLMp0TX1Wdq2ouxv6jiYpzJ1GHI0lJQEJFX0nJ9Gg5TdXVsgP7z3
 01r1aXKxcRBoIJFWI+Fv9rzFmXQQ/i4jwMK/1HNCzjttEepM3aZWIB+8Md8LCK27lVN8
 iWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HIya/ZFSigXHrEKocX44bLE3nip0uTMMExPPVZYQT4s=;
 b=Iqwg4TdMAT0c+f4b9NXQ4wfbLtYCoVWhvSIt1ZgK7PRK9C382kBmk6fj1gp91GfZxl
 AqeoKkaDq+NIvDoC9bodQPET+a3kXk7Y2N9KVSUEaysAwzoUx4waDWwtN17GAGuYvQ5N
 QTDiBrQW41kuAl84WQBOshQBO2b7zD6Ao/FeK3ahJFNnTphrEbi+Z6mz+PgUZTgRK5G3
 UElR1URXX0uwgxdB31nde1B04jhUTBRMSLQBIy0st/KxvZS4W9yhL93xkDuK1lMlHSUJ
 e2tRCbcKunW1JC9mZZobdKB7WItcrNqcPveeMA7EiOulhuKh/EZlnAa/aCPBjD/Ot7nK
 L9WQ==
X-Gm-Message-State: APjAAAX8+lw9eK07pj6u0a2Vgx0E73qmiMCJ4FXw6qgjVhfiUz8MWMok
 OBMfX6NYjTQcHXQMSZth82E=
X-Google-Smtp-Source: APXvYqx74XVtnYEz6qcmGi+UmZqEIBELrDcyCkOICoQHgHwVlWovKiMxX2H/nIVjiWGYmbX3N5SDUQ==
X-Received: by 2002:a17:90a:af81:: with SMTP id
 w1mr3255196pjq.14.1579765811905; 
 Wed, 22 Jan 2020 23:50:11 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id 3sm1526755pjg.27.2020.01.22.23.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 23:50:11 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 3/3] ARM: dts: aspeed-g6: add usb functions
Date: Wed, 22 Jan 2020 23:49:56 -0800
Message-Id: <20200123074956.21482-4-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200123074956.21482-1-rentao.bupt@gmail.com>
References: <20200123074956.21482-1-rentao.bupt@gmail.com>
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

Add USB components and according pin groups in aspeed-g6 dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 Changes in v2:
  - fixed vhub reg size in aspeed-g6.dtsi.

 arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi | 25 ++++++++++++++
 arch/arm/boot/dts/aspeed-g6.dtsi         | 43 ++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
index 045ce66ca876..7028e21bdd98 100644
--- a/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi
@@ -1112,6 +1112,31 @@
 		groups = "UART9";
 	};
 
+	pinctrl_usb2ah_default: usb2ah_default {
+		function = "USB2AH";
+		groups = "USBA";
+	};
+
+	pinctrl_usb2ad_default: usb2ad_default {
+		function = "USB2AD";
+		groups = "USBA";
+	};
+
+	pinctrl_usb2bh_default: usb2bh_default {
+		function = "USB2BH";
+		groups = "USBB";
+	};
+
+	pinctrl_usb2bd_default: usb2bd_default {
+		function = "USB2BD";
+		groups = "USBB";
+	};
+
+	pinctrl_usb11bhid_default: usb11bhid_default {
+		function = "USB11BHID";
+		groups = "USBB";
+	};
+
 	pinctrl_vb_default: vb_default {
 		function = "VB";
 		groups = "VB";
diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index 99cc7d7ced4d..5b3bd626f62a 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -245,6 +245,49 @@
 			status = "disabled";
 		};
 
+		ehci0: usb@1e6a1000 {
+			compatible = "aspeed,ast2600-ehci", "generic-ehci";
+			reg = <0x1e6a1000 0x100>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb2ah_default>;
+			status = "disabled";
+		};
+
+		ehci1: usb@1e6a3000 {
+			compatible = "aspeed,ast2600-ehci", "generic-ehci";
+			reg = <0x1e6a3000 0x100>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBPORT2CLK>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb2bh_default>;
+			status = "disabled";
+		};
+
+		uhci: usb@1e6b0000 {
+			compatible = "aspeed,ast2600-uhci", "generic-uhci";
+			reg = <0x1e6b0000 0x100>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			#ports = <2>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBUHCICLK>;
+			status = "disabled";
+			/*
+			 * No default pinmux, it will follow EHCI, use an
+			 * explicit pinmux override if EHCI is not enabled.
+			 */
+		};
+
+		vhub: usb-vhub@1e6a0000 {
+			compatible = "aspeed,ast2600-usb-vhub";
+			reg = <0x1e6a0000 0x350>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_usb2ad_default>;
+			status = "disabled";
+		};
+
 		apb {
 			compatible = "simple-bus";
 			#address-cells = <1>;
-- 
2.17.1

