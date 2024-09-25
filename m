Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1429D985687
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 11:40:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDBXt6rd8z3c5M
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2024 19:40:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727257210;
	cv=none; b=kyh+fsQzkCNMQzZSilAHju4hNooblGFtcJZr1Kl6uHqgaKd/alM3fQTVMR/9uj68HcwJYSuU8N4x5ioQnm6f6opW9WiGNqSj0cLfF/g7TnDHOdedPtFE8Uc/JfLdVq/c8da3aui8MT2mm0qt9pE20nmQKOOsFlZ3lTX7L7PtUYtwdBqewF+1u42bfQ6dmaB3qFaNVJvaO/ONBxSnyHUbgupvc6wAcBJBdkHvu0xjFDtcG2o3fOA9mOfDNE1GN7ZYZPSudq2h9AMevTKgccvairlsXsMoWNcHsWz17e3ZbcCL4hkJkI/+IaSGw27GLxVkOsupBuqmFLfzIbSPIqJGBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727257210; c=relaxed/relaxed;
	bh=+hVeQm3M9Kb5BEWPHPjrFASpqXLbXMnOU9Rk2NX8DNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dx0SL0MBiX66gYzwraqsLwCsrXIjgFkQS0ma81esmhZPFhZNO5ovMrqQIzN2ZNG/9hGF3LUkCMdUDsydOEs4xKVp6RBpXhfwKP2Q99HGVRx/rR2Y9KY0SY/uiag0HavwEWMfP/JEb67ocIQoxtCaZ74jeZtYW02lY63D/eF/WADr8CtXYxPfBU5mnwOjBhw9zHIwpAo71yUAjPeEdoVOqQ+UNxlEKFEzqNhuBUtXtrzAk4+T8+2dvdUD5NnB65Kc2dYPng3w7V5JXegwKZ+WOEpheMF9qYk1VWMe3sRL+zFnwZzeNxaMPs0ksToW975/7RxSrdqPsi/aXeJevdSndw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1QyFweGu; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1QyFweGu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDBXm73sLz2xHt
	for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 19:40:07 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-206bd1c6ccdso61555595ad.3
        for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2024 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1727257204; x=1727862004; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+hVeQm3M9Kb5BEWPHPjrFASpqXLbXMnOU9Rk2NX8DNc=;
        b=1QyFweGu1oxHxY0U0R70Cf8f8iDPO4UFvv4u3HWUPAy5z317E1W2O6Oug7Tr5w0kXQ
         pYTWIlsxan6ReMsBLTEpDTIV/D0oFtm0kZ3yDdEcyY6qgoYX59YyexXEkJazo4OtcblQ
         fBuYM5MfhbSMscjHNfcSo6hT8zAWxgZ+1JiLBBFbPvGkyo1AOSj7Ek4QrZe+2SAk2Etg
         ccilBYZlqmJRhjN0MnCVS8PuVaYdjhH1M0vYewkBY2xu/8pGDgqAhQ/b/hX4yyc/esLK
         XU0+l+GBryDBzqdJzAGLhMgiIX43TkIPTwFOAVyLrJ+KW1jemuHmE3FIck8oHVPqT7sC
         rakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727257204; x=1727862004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+hVeQm3M9Kb5BEWPHPjrFASpqXLbXMnOU9Rk2NX8DNc=;
        b=rd7ufLSvw1nvUR+XnroV/Tjidl0pdU4Gx1+tlVO/2bQnR2Ahj649ceTHQ5JCUUXcPC
         5XGLm4a0UInduhOp2TkYWxjPazIxXmtCfDHLARMx76mL0CiauCz00Iqr9w8sKTY7WylB
         a/OC/A/dLuAYGFXV7P85RVNZTpkhnNcS4mpHrUwwYGx45nn5YzOiFrF0jkCjAY24+pCg
         a4dMLDo/9g1Znl+yLeqUZQd3kmjBuLiu0AcemrQhUqnzqrO8K5XFfYb/bsMFHabYK9A9
         GfCjjAQeJmgRCvas+G0vfySVuPUbafcrMdb5V32cgFT8X4Z+9AjTpI0CYLfXeHizQykz
         q+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQYvC5gOeN1fpxvbBpKUMITyL47c+1Nkm3f6GX4sx+BQw8EcrqVhN34fMhCBvsxyJG2ZkrGyx@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxn5os6eicnNyWsXjarkoj0ubZ+e1W4H0hB9LQj/++uPjBQ4wtn
	v6F0LrrSquK4Fl4KeZYbMy8vDP2shMHPLaVzwqGNyyAQ33K/E1/sYUz9IENfwXs=
X-Google-Smtp-Source: AGHT+IEcO5h5KcZFuc3iAGK66yGyxhN/Om1kVIyoX9CJW9qNJjpCSqoZx1payz3X0gYgWX71SgJidw==
X-Received: by 2002:a17:902:f68b:b0:206:ba7c:9f2e with SMTP id d9443c01a7336-20afc46b986mr28767005ad.25.1727257204439;
        Wed, 25 Sep 2024 02:40:04 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2620:15c:2a3:200:a147:cceb:deb3:ec96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20afb021af7sm10037905ad.168.2024.09.25.02.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:40:03 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: nuvoton: Add UDC nodes
Date: Wed, 25 Sep 2024 02:39:56 -0700
Message-ID: <20240925093956.2449119-1-william@wkennington.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The driver support was already added but we are missing the nodes in our
common devicetree. This enables npcm7xx platforms to enable the udc
nodes and expose USB devices endpoints.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 71 +++++++++++++++++++
 .../arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi | 65 +++++++++++++++++
 2 files changed, 136 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..358b52894ac0 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -99,6 +99,11 @@ rst: rst@801000 {
 		};
 	};
 
+	udc0_phy: usb-phy {
+		compatible = "usb-nop-xceiv";
+		#phy-cells = <0>;
+	};
+
 	ahb {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -179,6 +184,72 @@ fiux: spi@fb001000 {
 			status = "disabled";
 		};
 
+		udc5: udc@f0835000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0835000 0x1000
+			       0xfffd2800 0x800>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc6: udc@f0836000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0836000 0x1000
+			       0xfffd3000 0x800>;
+			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc7: udc@f0837000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0837000 0x1000
+			       0xfffd3800 0x800>;
+			interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc8: udc@f0838000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0838000 0x1000
+			       0xfffd4000 0x800>;
+			interrupts = <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc9: udc@f0839000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0xf0839000 0x1000
+			       0xfffd4800 0x800>;
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			nuvoton,sysgcr = <&gcr>;
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
index 30eed40b89b5..00615e7d1462 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi
@@ -58,5 +58,70 @@ gmac1: eth@f0804000 {
 					&rg2mdio_pins>;
 			status = "disabled";
 		};
+
+		udc0:udc@f0830000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0830000 0x0 0x1000
+			       0x0 0xfffeb000 0x0 0x800>;
+			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc1:udc@f0831000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0831000 0x0 0x1000
+			       0x0 0xfffeb800 0x0 0x800>;
+			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc2:udc@f0832000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0832000 0x0 0x1000
+			       0x0 0xfffec000 0x0 0x800>;
+			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc3:udc@f0833000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0833000 0x0 0x1000
+			       0x0 0xfffec800 0x0 0x800>;
+			interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
+
+		udc4:udc@f0834000 {
+			compatible = "nuvoton,npcm750-udc";
+			reg = <0x0 0xf0834000 0x0 0x1000
+			       0x0 0xfffed000 0x0 0x800>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk NPCM7XX_CLK_SU>;
+			clock-names = "clk_usb_bridge";
+			phys = <&udc0_phy>;
+			phy_type = "utmi_wide";
+			dr_mode = "peripheral";
+			status = "disabled";
+		};
 	};
 };
-- 
2.46.0.792.g87dc391469-goog

