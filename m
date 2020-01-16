Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986213FDF0
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 00:31:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zL6f1P9rzDr1q
	for <lists+openbmc@lfdr.de>; Fri, 17 Jan 2020 10:31:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pvhfjGPF; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zL0c3wKHzDr9K
 for <openbmc@lists.ozlabs.org>; Fri, 17 Jan 2020 10:25:49 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id x7so10682201pgl.11
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jan 2020 15:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2yHABHvwxnXim25ZBfXIQNHhAqZGiEyWkS3DEO4gD7M=;
 b=pvhfjGPF62A8Vt7CoU4XNJHlGAof79jQ5Ba6tCEBCpaOKVUfxowcriaBJyG0iKdRnS
 2YAHUPOS1T8mbbRR+D9cwMeFyt0GGm5SqmlFZRAx1z956ahFV4XerZFurCDqZ+D7Zdnd
 jGraHpPVNGr1jW9jdNKkZ9Zl1bIgQR3SzT5O++tWJoaGZxh4u5BYoB8GkzcCkwULjIRb
 Um+/kAwX37ZKCUCzEIfvcalCB4LTpw59bsbE2+xtyubHRLstTQWMXsK2fRSmNjexrT9u
 ueMgKhpW7A3n43vPMb1Yh9r+HJ6uiwiyi8DGDkMgXDK7gD2HBqHu7qqZGXnTAjrH4gsU
 da8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2yHABHvwxnXim25ZBfXIQNHhAqZGiEyWkS3DEO4gD7M=;
 b=OnP+Qce1rNtNREo0ibDuwmTFs/1KACxN7xzU+YtmyR22+sibPzGk4pFzlKVS2EP0GP
 emdkcCKuDqEtQ9JZqbY1rM6oB87cV0OaiIWbpX5QtYXE5+ZfUSqpHHTXFw9G5zGWC0vN
 QF87e8XRUs5Ud3usFBx4Y+xTYiiVsBP7/bU996F/STPMFdMZM0WwnreJfEzA7SZd2UT0
 Ah00Cn9MIurxWbXxq47NzucDXyxi0nfQpKJ/ZRmXrsFWiBqeSBfy7A5mCILpozrXlrkU
 OV+UK639pAWqlwL2V/q/CiPo+Qpq4bEjgItequGZDqQiHInCGLWA90hc7RfjokPT/Xw8
 oayw==
X-Gm-Message-State: APjAAAV9nFG033ayaO5FMGR8INdGFOmc1BJRIJIuFlaqEruq4CWy4BId
 u6UNa0P5nqdwIcAUgcp03r0=
X-Google-Smtp-Source: APXvYqzlXK5qxZPPdNOAPtW3t2c6C3akgXIay6WUNKwcjgVKiJZacSkw+skK0OxHdN7V4LAzbnpTIQ==
X-Received: by 2002:a65:488f:: with SMTP id n15mr44241773pgs.61.1579217146565; 
 Thu, 16 Jan 2020 15:25:46 -0800 (PST)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::1:7c0c])
 by smtp.gmail.com with ESMTPSA id o6sm25532204pgg.37.2020.01.16.15.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 15:25:46 -0800 (PST)
From: rentao.bupt@gmail.com
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 taoren@fb.com, openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 2/2] ARM: dts: aspeed-g6: add usb functions
Date: Thu, 16 Jan 2020 15:25:25 -0800
Message-Id: <20200116232525.2819-3-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116232525.2819-1-rentao.bupt@gmail.com>
References: <20200116232525.2819-1-rentao.bupt@gmail.com>
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

Add USB function pins and devices in aspeed-g6 dtsi.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
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
index 99cc7d7ced4d..d344bb278bdb 100644
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
+			 * No default pinmux, it will follow EHCI, use an explicit pinmux
+			 * override if you don't enable EHCI
+			 */
+		};
+
+		vhub: usb-vhub@1e6a0000 {
+			compatible = "aspeed,ast2600-usb-vhub";
+			reg = <0x1e6a0000 0x300>;
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

