Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E944DD2A6
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 02:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKRtp5wjVz3bPL
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 12:56:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=jKrPgHeV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=jKrPgHeV; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK5FR5RVqz2xVq
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 22:55:54 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EFF683F312
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518149;
 bh=NNkRDkWPiveTHGJJVi4+4/ORT85T+y0AcSaoWSMmS+o=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=jKrPgHeVjSrZeS0WMkNL56RNQH0wkFJWbWnfVvmw8f/+2IqOZTLMUeQ7eUG/2Tk/x
 V7Mlf5geMQ3XPh5iohdlWvuSESm+vZOAx+Mr2bR19fUhdBlrethSRHJaf3iRlt+FJP
 hUd2SClixUV7+ZQI6M0LNJwEayPWDHPkPPqT0LF5loOh2qYqngylW1B4xOWjivkRGL
 CAuxQwWWL5xDJK7S+v7JTO9y59hAvDGywvuf5BWlmAvT9A7WJ5daiPFtD4vvfPhmZR
 izds4dckITZqXadj4bLlchx0ktRNvhJq4MCzfrTi6iYxkGkv6tWNZuvST8vm7G5pr/
 Uy0C3iFVESYOA==
Received: by mail-wr1-f69.google.com with SMTP id
 z1-20020adfec81000000b001f1f7e7ec99so1472245wrn.17
 for <openbmc@lists.ozlabs.org>; Thu, 17 Mar 2022 04:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NNkRDkWPiveTHGJJVi4+4/ORT85T+y0AcSaoWSMmS+o=;
 b=ZQC07u1Bmiq5SImzW2DehhnqgqrPu9vjeEqz2wxasvNwWF9UXWgt9TpNViYlfYv/N6
 o0g3wwOwFjOy7YaXJZwYRpqx3vjaEY7e4iJZQOZ5D9psA2bk+73TaML+9PLDXdytE6nR
 aclQiOxFQtRKi5n/2TNJFfHrZ1+/VC+AtVw0c07ZlwBtiZ7c2g98C2r9D8K7MtaRoBYB
 C+seSMGLhQ6bDMkA34dMRdy6SRuIsVH3dJsBT0/36LSQOISkeq4NdYOjHzziXsSs4z5y
 d/e4MwBc2Xe91VfyadSGOwPvsihbXHC+/o4fr0u8XiiXMEiTYU7ozBq8Gy6zlOAsfrYD
 eFvg==
X-Gm-Message-State: AOAM532XaXtdLz/b0n7qioGn/QETtHMKPsaJuoUQfuC1rj6cSNWHFuAn
 Hwwz5buNOZ6Ta8ssO22/yZjJkQtOegT9LMsP3XyaUvZtuB8HYrXo9n8JrtASOWoODoJaHsETERh
 6hceI6LzWqDvBcbiKo4tCb+CWYBk1mfEXREGW
X-Received: by 2002:adf:e7c2:0:b0:203:e177:f93f with SMTP id
 e2-20020adfe7c2000000b00203e177f93fmr3811131wrn.671.1647518149326; 
 Thu, 17 Mar 2022 04:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzluksm2ijGbV1ETbB+BHuJenpk8meaKL2FHMzBNsHmttg1+/DKcyqO/YoDEeWrnQIt4k8a0g==
X-Received: by 2002:adf:e7c2:0:b0:203:e177:f93f with SMTP id
 e2-20020adfe7c2000000b00203e177f93fmr3811087wrn.671.1647518149108; 
 Thu, 17 Mar 2022 04:55:49 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm11462862wms.9.2022.03.17.04.55.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:55:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Subject: [PATCH 01/18] ARM: dts: nspire: use lower case hex addresses in node
 unit addresses
Date: Thu, 17 Mar 2022 12:55:25 +0100
Message-Id: <20220317115542.450032-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:55:47 +1100
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Convert all hex addresses in node unit addresses to lower case to fix
dt_binding_check and dtc W=1 warnings.

Conversion was done using sed:

  $ sed -e 's/@\([a-zA-Z0-9_-]*\) {/@\L\1 {/' -i arch/arm/boot/dts/nspire*
  $ sed -e 's/<0x\([a-zA-Z0-9_-]*\) /<0x\L\1 /g' -i arch/arm/boot/dts/nspire*

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/nspire-classic.dtsi | 10 ++---
 arch/arm/boot/dts/nspire-cx.dts       |  4 +-
 arch/arm/boot/dts/nspire.dtsi         | 60 +++++++++++++--------------
 3 files changed, 37 insertions(+), 37 deletions(-)

diff --git a/arch/arm/boot/dts/nspire-classic.dtsi b/arch/arm/boot/dts/nspire-classic.dtsi
index 41744cc2bc72..01e1bb7c3c6c 100644
--- a/arch/arm/boot/dts/nspire-classic.dtsi
+++ b/arch/arm/boot/dts/nspire-classic.dtsi
@@ -17,7 +17,7 @@ clcd_pads: endpoint {
 
 &fast_timer {
 	/* compatible = "lsi,zevio-timer"; */
-	reg = <0x90010000 0x1000>, <0x900A0010 0x8>;
+	reg = <0x90010000 0x1000>, <0x900a0010 0x8>;
 };
 
 &uart {
@@ -30,12 +30,12 @@ &uart {
 
 &timer0 {
 	/* compatible = "lsi,zevio-timer"; */
-	reg = <0x900C0000 0x1000>, <0x900A0018 0x8>;
+	reg = <0x900c0000 0x1000>, <0x900a0018 0x8>;
 };
 
 &timer1 {
 	compatible = "lsi,zevio-timer";
-	reg = <0x900D0000 0x1000>, <0x900A0020 0x8>;
+	reg = <0x900d0000 0x1000>, <0x900a0020 0x8>;
 };
 
 &keypad {
@@ -66,10 +66,10 @@ ahb {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		intc: interrupt-controller@DC000000 {
+		intc: interrupt-controller@dc000000 {
 			compatible = "lsi,zevio-intc";
 			interrupt-controller;
-			reg = <0xDC000000 0x1000>;
+			reg = <0xdc000000 0x1000>;
 			#interrupt-cells = <1>;
 		};
 	};
diff --git a/arch/arm/boot/dts/nspire-cx.dts b/arch/arm/boot/dts/nspire-cx.dts
index 0c16b04e2744..590b7dff6ae5 100644
--- a/arch/arm/boot/dts/nspire-cx.dts
+++ b/arch/arm/boot/dts/nspire-cx.dts
@@ -92,10 +92,10 @@ ahb {
 		#address-cells = <1>;
 		#size-cells = <1>;
 
-		intc: interrupt-controller@DC000000 {
+		intc: interrupt-controller@dc000000 {
 			compatible = "arm,pl190-vic";
 			interrupt-controller;
-			reg = <0xDC000000 0x1000>;
+			reg = <0xdc000000 0x1000>;
 			#interrupt-cells = <1>;
 		};
 
diff --git a/arch/arm/boot/dts/nspire.dtsi b/arch/arm/boot/dts/nspire.dtsi
index 90e033d9141f..bb240e6a3a6f 100644
--- a/arch/arm/boot/dts/nspire.dtsi
+++ b/arch/arm/boot/dts/nspire.dtsi
@@ -20,9 +20,9 @@ bootrom: bootrom@0 {
 		reg = <0x00000000 0x80000>;
 	};
 
-	sram: sram@A4000000 {
+	sram: sram@a4000000 {
 		device = "memory";
-		reg = <0xA4000000 0x20000>;
+		reg = <0xa4000000 0x20000>;
 	};
 
 	timer_clk: timer_clk {
@@ -33,12 +33,12 @@ timer_clk: timer_clk {
 
 	base_clk: base_clk {
 		#clock-cells = <0>;
-		reg = <0x900B0024 0x4>;
+		reg = <0x900b0024 0x4>;
 	};
 
 	ahb_clk: ahb_clk {
 		#clock-cells = <0>;
-		reg = <0x900B0024 0x4>;
+		reg = <0x900b0024 0x4>;
 		clocks = <&base_clk>;
 	};
 
@@ -71,28 +71,28 @@ ahb {
 		#size-cells = <1>;
 		ranges;
 
-		spi: spi@A9000000 {
-			reg = <0xA9000000 0x1000>;
+		spi: spi@a9000000 {
+			reg = <0xa9000000 0x1000>;
 		};
 
-		usb0: usb@B0000000 {
+		usb0: usb@b0000000 {
 			compatible = "lsi,zevio-usb";
-			reg = <0xB0000000 0x1000>;
+			reg = <0xb0000000 0x1000>;
 			interrupts = <8>;
 
 			usb-phy = <&usb_phy>;
 			vbus-supply = <&vbus_reg>;
 		};
 
-		usb1: usb@B4000000 {
-			reg = <0xB4000000 0x1000>;
+		usb1: usb@b4000000 {
+			reg = <0xb4000000 0x1000>;
 			interrupts = <9>;
 			status = "disabled";
 		};
 
-		lcd: lcd@C0000000 {
+		lcd: lcd@c0000000 {
 			compatible = "arm,pl111", "arm,primecell";
-			reg = <0xC0000000 0x1000>;
+			reg = <0xc0000000 0x1000>;
 			interrupts = <21>;
 
 			/*
@@ -105,17 +105,17 @@ lcd: lcd@C0000000 {
 			clock-names = "clcdclk", "apb_pclk";
 		};
 
-		adc: adc@C4000000 {
-			reg = <0xC4000000 0x1000>;
+		adc: adc@c4000000 {
+			reg = <0xc4000000 0x1000>;
 			interrupts = <11>;
 		};
 
-		tdes: crypto@C8010000 {
-			reg = <0xC8010000 0x1000>;
+		tdes: crypto@c8010000 {
+			reg = <0xc8010000 0x1000>;
 		};
 
-		sha256: crypto@CC000000 {
-			reg = <0xCC000000 0x1000>;
+		sha256: crypto@cc000000 {
+			reg = <0xcc000000 0x1000>;
 		};
 
 		apb@90000000 {
@@ -143,16 +143,16 @@ uart: serial@90020000 {
 				interrupts = <1>;
 			};
 
-			timer0: timer@900C0000 {
-				reg = <0x900C0000 0x1000>;
+			timer0: timer@900c0000 {
+				reg = <0x900c0000 0x1000>;
 				clocks = <&timer_clk>, <&timer_clk>,
 					 <&timer_clk>;
 				clock-names = "timer0clk", "timer1clk",
 					      "apb_pclk";
 			};
 
-			timer1: timer@900D0000 {
-				reg = <0x900D0000 0x1000>;
+			timer1: timer@900d0000 {
+				reg = <0x900d0000 0x1000>;
 				interrupts = <19>;
 				clocks = <&timer_clk>, <&timer_clk>,
 					 <&timer_clk>;
@@ -171,18 +171,18 @@ rtc: rtc@90090000 {
 				interrupts = <4>;
 			};
 
-			misc: misc@900A0000 {
-				reg = <0x900A0000 0x1000>;
+			misc: misc@900a0000 {
+				reg = <0x900a0000 0x1000>;
 			};
 
-			pwr: pwr@900B0000 {
-				reg = <0x900B0000 0x1000>;
+			pwr: pwr@900b0000 {
+				reg = <0x900b0000 0x1000>;
 				interrupts = <15>;
 			};
 
-			keypad: input@900E0000 {
+			keypad: input@900e0000 {
 				compatible = "ti,nspire-keypad";
-				reg = <0x900E0000 0x1000>;
+				reg = <0x900e0000 0x1000>;
 				interrupts = <16>;
 
 				scan-interval = <1000>;
@@ -191,8 +191,8 @@ keypad: input@900E0000 {
 				clocks = <&apb_pclk>;
 			};
 
-			contrast: contrast@900F0000 {
-				reg = <0x900F0000 0x1000>;
+			contrast: contrast@900f0000 {
+				reg = <0x900f0000 0x1000>;
 			};
 
 			led: led@90110000 {
-- 
2.32.0

