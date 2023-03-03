Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A7F6AB37E
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 00:26:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVHsR0t0Cz3c41
	for <lists+openbmc@lfdr.de>; Mon,  6 Mar 2023 10:26:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHzxKwO1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=tomato1220@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZHzxKwO1;
	dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSdYL5rpwz3cLf
	for <openbmc@lists.ozlabs.org>; Fri,  3 Mar 2023 17:36:52 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id y2so1543769pjg.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Mar 2023 22:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677825409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WdPwSlZe8LTdEXIINuf3aZh5UNoXUd9cwwSy79Q5hsw=;
        b=ZHzxKwO1wvJKSiDsTkbk7ln1pd/OTw+ISlW2xRp9KaEsIfQfJi/36cPvtrmpSBExEo
         m2Di9bm0utfYcuxpZDHidiZWS5M9hLIG7oTSX+Nt6Oqd09n94VVhBv4jFzO55OkdCq5i
         WZxUalrT65zbM+vichwfFqwJN6tdg63pkslF/5893XbcmL/CHhd6cf/OYZA9qAiG23Rt
         da2eZYIOAfF6ezo9qRnn37P/PNX//6WBxf8TWnoYNa9IAts8f83SMrC9S/8jpMeFJoN4
         h5hjSWbu9NHLRMQld85FkHuaQs6ntLXxC+jN+zhlbcJoPdMAmdjdy0sziG9gpiKn1NKD
         wC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677825409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WdPwSlZe8LTdEXIINuf3aZh5UNoXUd9cwwSy79Q5hsw=;
        b=KZ9kdJsBJrt+fUzj6f44hV21V6xEX2DI21ExoDYLaC9AThYrfUfXCnmhDMxX9AGtkE
         /KOM4MFqIRXqzph5O4PnxF8eXRGFsK363f9POQ8dWks8qMGWqOSSjHXpGUCe2TkxRwVj
         ceLF1Pt3+USL+/iDnpiU3rwH4N6s3CCHcHlSSXpn4cZjNCjQFC+Y+ISNrmpSUginnL+F
         6tQ3haNwSBhsRu4M/TEkalsBjwnqdjdWBQQ9zwyQPVAdiL+78h2kVhY+MAkfE5DNQjew
         Si4eE4zvYfKGOj2gNd9ni4agHxG1BMSlwzYgW7yBf5ljJPrxJOeIPxOPhnCgaMAo2wPN
         h/fg==
X-Gm-Message-State: AO0yUKWEcaNW52LJnG5ojNTzQBGABfR76NJYuZ+ZPQUsM2ixEKGKJPkE
	pEzq5pYEyNoSaRNrKZQb2rA=
X-Google-Smtp-Source: AK7set8Vy0EXakvE/Zg9+Vq1Txf5z3rxdn5EBq6Fl1tBcGChJZzp/bJ7WHspQe++eMr0xv2NyPQWfg==
X-Received: by 2002:a17:90b:1c81:b0:234:ba6b:7a02 with SMTP id oo1-20020a17090b1c8100b00234ba6b7a02mr591500pjb.32.1677825409352;
        Thu, 02 Mar 2023 22:36:49 -0800 (PST)
Received: from davidwang.dhcpserver.bu9bmc.local (1-34-79-176.hinet-ip.hinet.net. [1.34.79.176])
        by smtp.gmail.com with ESMTPSA id l30-20020a635b5e000000b004ff6b744248sm736348pgm.48.2023.03.02.22.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 22:36:48 -0800 (PST)
From: David Wang <tomato1220@gmail.com>
X-Google-Original-From: David Wang <davidwang@quantatw.com>
To: arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH 1/7] ARM: dts: nuvoton: Add Quanta GIS BMC Device Tree
Date: Fri,  3 Mar 2023 14:34:29 +0800
Message-Id: <20230303063435.803097-1-davidwang@quantatw.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 06 Mar 2023 10:24:04 +1100
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
Cc: devicetree@vger.kernel.org, David Wang <davidwang@quantatw.com>, fran.hsu@quantatw.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, linux-arm-kernel@lists.infradead.org, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the device tree for the Quanta GIS BMC and it's
based on NPCM730 SoC

Signed-off-by: David Wang <davidwang@quantatw.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 .../boot/dts/nuvoton-npcm730-gis-pincfg.dtsi  |  732 +++++++++++
 arch/arm/boot/dts/nuvoton-npcm730-gis.dts     | 1076 +++++++++++++++++
 3 files changed, 1809 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gis-pincfg.dtsi
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gis.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..40659106cfe1 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -396,6 +396,7 @@ dtb-$(CONFIG_ARCH_WPCM450) += \
 dtb-$(CONFIG_ARCH_NPCM7XX) += \
 	nuvoton-npcm730-gsj.dtb \
 	nuvoton-npcm730-gbs.dtb \
+	nuvoton-npcm730-gis.dtb \
 	nuvoton-npcm730-kudo.dtb \
 	nuvoton-npcm750-evb.dtb \
 	nuvoton-npcm750-runbmc-olympus.dtb
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gis-pincfg.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gis-pincfg.dtsi
new file mode 100644
index 000000000000..6f00f337df54
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gis-pincfg.dtsi
@@ -0,0 +1,732 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 Quanta Computer Inc. Fran.Hsu@quantatw.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio0od_pins: gpio0od-pins {
+			pins = "GPIO0/IOX1DI";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio1_pins: gpio1-pins {
+			pins = "GPIO1/IOX1LD";
+			input-enable;
+			bias-disable;
+		};
+		gpio1pp_pins: gpio1pp-pins {
+			pins = "GPIO1/IOX1LD";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio2_pins: gpio2-pins {
+			pins = "GPIO2/IOX1CK";
+			input-enable;
+			bias-disable;
+		};
+		gpio2pp_pins: gpio2pp-pins {
+			pins = "GPIO2/IOX1CK";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio3_pins: gpio3-pins {
+			pins = "GPIO3/IOX1D0";
+			input-enable;
+			bias-disable;
+		};
+		gpio3pp_pins: gpio3pp-pins {
+			pins = "GPIO3/IOX1D0";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio4_pins: gpio4-pins {
+			pins = "GPIO4/IOX2DI/SMB1DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio5_pins: gpio5-pins {
+			pins = "GPIO5/IOX2LD/SMB1DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio6od_pins: gpio6od-pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio7od_pins: gpio7od-pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio8_pins: gpio8-pins {
+			pins = "GPIO8/LKGPO1";
+			bias-disable;
+			input-enable;
+		};
+		gpio9_pins: gpio9-pins {
+			pins = "GPIO9/LKGPO2";
+			bias-disable;
+			input-enable;
+		};
+		gpio10_pins: gpio10-pins {
+			pins = "GPIO10/IOXHLD";
+			bias-disable;
+			input-enable;
+		};
+		gpio11_pins: gpio11-pins {
+			pins = "GPIO11/IOXHCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio12od_pins: gpio12od-pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio13_pins: gpio13-pins {
+			pins = "GPIO13/GSPIDO/SMB5BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio14_pins: gpio14-pins {
+			pins = "GPIO14/GSPIDI/SMB5CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio15od_pins: gpio15od-pins {
+			pins = "GPIO15/GSPICS/SMB5CSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio16pp_pins: gpio16pp-pins {
+			pins = "GPIO16/LKGPO0";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio17_pins: gpio17-pins {
+			pins = "GPIO17/PSPI2DI/SMB4DEN";
+			bias-disable;
+			input-enable;
+		};
+		gpio18o_pins: gpio18o-pins {
+			pins = "GPIO18/PSPI2D0/SMB4BSDA";
+			bias-disable;
+			output-high;
+		};
+		gpio19ol_pins: gpio19ol-pins {
+			pins = "GPIO19/PSPI2CK/SMB4BSCL";
+			bias-disable;
+			output-low;
+		};
+		gpio20_pins: gpio20-pins {
+			pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio21_pins: gpio21-pins {
+			pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio24_pins: gpio24-pins {
+			pins = "GPIO24/HGPIO4/IOXHDO";
+			bias-disable;
+			input-enable;
+		};
+		gpio25_pins: gpio25-pins {
+			pins = "GPIO25/HGPIO5/IOXHDI";
+			bias-disable;
+			input-enable;
+		};
+		gpio26od_pins: gpio26od-pins {
+			pins = "GPIO26/SMB5SDA";
+			bias-disable;
+			output-high;
+			drive-open-drain;
+		};
+		gpio27pp_pins: gpio27pp-pins {
+			pins = "GPIO27/SMB5SCL";
+			bias-disable;
+			output-high;
+			drive-push-pull;
+		};
+		gpio37pp_pins: gpio37pp-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio38_pins: gpio38-pins {
+			pins = "GPIO38/SMB3CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio39_pins: gpio39-pins {
+			pins = "GPIO39/SMB3BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio40_pins: gpio40-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio59od_pins: gpio59od-pins {
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio64_pins: gpio64-pins {
+			pins = "GPIO64/FANIN0";
+			bias-disable;
+			input-enable;
+			input-debounce;
+		};
+		gpio65_pins: gpio65-pins {
+			pins = "GPIO65/FANIN1";
+			bias-disable;
+			input-enable;
+			input-debounce;
+		};
+		gpio66od_pins: gpio66od-pins {
+			pins = "GPIO66/FANIN2";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio67od_pins: gpio67od-pins {
+			pins = "GPIO67/FANIN3";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio68pp_pins: gpio68pp-pins {
+			pins = "GPIO68/FANIN4";
+			bias-disable;
+			output-high;
+			drive-push-pull;
+		};
+		gpio69pp_pins: gpio69pp-pins {
+			pins = "GPIO69/FANIN5";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio70od_pins: gpio70od-pins {
+			pins = "GPIO70/FANIN6";
+			bias-disable;
+			output-high;
+			drive-open-drain;
+		};
+		gpio71_pins: gpio71-pins {
+			pins = "GPIO71/FANIN7";
+			bias-disable;
+			input-enable;
+		};
+		gpio72od_pins: gpio72od-pins {
+			pins = "GPIO72/FANIN8";
+			bias-disable;
+			output-high;
+			drive-open-drain;
+		};
+		gpio73_pins: gpio73-pins {
+			pins = "GPIO73/FANIN9";
+			bias-disable;
+			input-enable;
+		};
+		gpio74_pins: gpio74-pins {
+			pins = "GPIO74/FANIN10";
+			bias-disable;
+			input-enable;
+		};
+		gpio75pp_pins: gpio75pp-pins {
+			pins = "GPIO75/FANIN11";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio76od_pins: gpio76od-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			output-low;
+			drive-open-drain;
+		};
+		gpio77od_pins: gpio77od-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio78_pins: gpio78-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			input-enable;
+		};
+		gpio79_pins: gpio79-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			input-enable;
+		};
+		gpio80pp_pins: gpio80pp-pins {
+			pins = "GPIO80/PWM0";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio81pp_pins: gpio81pp-pins {
+			pins = "GPIO81/PWM1";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio82od_pins: gpio82od-pins {
+			pins = "GPIO82/PWM2";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio83od_pins: gpio83od-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio84od_pins: gpio84od-pins {
+			pins = "GPIO84/R2TXD0";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio85od_pins: gpio85od-pins {
+			pins = "GPIO85/R2TXD1";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio86od_pins: gpio86od-pins {
+			pins = "GPIO86/R2TXEN";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio87od_pins: gpio87od-pins {
+			pins = "GPIO87/R2RXD0";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio88_pins: gpio88-pins {
+			pins = "GPIO88/R2RXD1";
+			bias-disable;
+			input-enable;
+		};
+		gpio89od_pins: gpio89od-pins {
+			pins = "GPIO89/R2CRSDV";
+			bias-disable;
+			output-low;
+			drive-open-drain;
+		};
+		gpio90pp_pins: gpio90pp-pins {
+			pins = "GPIO90/R2RXERR";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio91od_pins: gpio91od-pins {
+			pins = "GPIO91/R2MDC";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio92od_pins: gpio92od-pins {
+			pins = "GPIO92/R2MDIO";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio93_pins: gpio93-pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio94_pins: gpio94-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio120_pins: gpio120-pins {
+			pins = "GPIO120/SMB2CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio121_pins: gpio121-pins {
+			pins = "GPIO121/SMB2CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio122_pins: gpio122-pins {
+			pins = "GPIO122/SMB2BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio123_pins: gpio123-pins {
+			pins = "GPIO123/SMB2BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio124_pins: gpio124-pins {
+			pins = "GPIO124/SMB1CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio125_pins: gpio125-pins {
+			pins = "GPIO125/SMB1CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio126_pins: gpio126-pins {
+			pins = "GPIO126/SMB1BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio127_pins: gpio127-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio130_pins: gpio130-pins {
+			pins = "GPIO130/SMB9SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio131od_pins: gpio131od-pins {
+			pins = "GPIO131/SMB9SDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio132od_pins: gpio132od-pins {
+			pins = "GPIO132/SMB10SCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio133od_pins: gpio133od-pins {
+			pins = "GPIO133/SMB10SDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio136_pins: gpio136-pins {
+			pins = "GPIO136/SD1DT0";
+			bias-disable;
+			input-enable;
+		};
+		gpio137_pins: gpio137-pins {
+			pins = "GPIO137/SD1DT1";
+			bias-disable;
+			input-enable;
+		};
+		gpio138_pins: gpio138-pins {
+			pins = "GPIO138/SD1DT2";
+			bias-disable;
+			input-enable;
+		};
+		gpio139_pins: gpio139-pins {
+			pins = "GPIO139/SD1DT3";
+			bias-disable;
+			input-enable;
+		};
+		gpio140_pins: gpio140-pins {
+			pins = "GPIO140/SD1CLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio141_pins: gpio141-pins {
+			pins = "GPIO141/SD1WP";
+			bias-disable;
+			input-enable;
+		};
+		gpio142_pins: gpio142-pins {
+			pins = "GPIO142/SD1CMD";
+			bias-disable;
+			input-enable;
+		};
+		gpio143_pins: gpio143-pins {
+			pins = "GPIO143/SD1CD/SD1PWR";
+			bias-disable;
+			input-enable;
+		};
+		gpio144_pins: gpio144-pins {
+			pins = "GPIO144/PWM4";
+			bias-disable;
+			input-enable;
+		};
+		gpio145od_pins: gpio145od-pins {
+			pins = "GPIO145/PWM5";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio146_pins: gpio146-pins {
+			pins = "GPIO146/PWM6";
+			bias-disable;
+			input-enable;
+		};
+		gpio147_pins: gpio147-pins {
+			pins = "GPIO147/PWM7";
+			bias-disable;
+			input-enable;
+		};
+		gpio148od_pins: gpio148od-pins {
+			pins = "GPIO148/MMCDT4";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio149od_pins: gpio149od-pins {
+			pins = "GPIO149/MMCDT5";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio150od_pins: gpio150od-pins {
+			pins = "GPIO150/MMCDT6";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio151od_pins: gpio151od-pins {
+			pins = "GPIO151/MMCDT7";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio152od_pins: gpio152od-pins {
+			pins = "GPIO152/MMCCLK";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio153pp_pins: gpio153pp-pins {
+			pins = "GPIO153/MMCWP";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio154_pins: gpio154-pins {
+			pins = "GPIO154/MMCCMD";
+			bias-disable;
+			input-enable;
+		};
+		gpio155_pins: gpio155-pins {
+			pins = "GPIO155/nMMCCD/nMMCRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio156_pins: gpio156-pins {
+			pins = "GPIO156/MMCDT0";
+			bias-disable;
+			input-enable;
+		};
+		gpio157od_pins: gpio157od-pins {
+			pins = "GPIO157/MMCDT1";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio158od_pins: gpio158od-pins {
+			pins = "GPIO158/MMCDT2";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio159od_pins: gpio159od-pins {
+			pins = "GPIO159/MMCDT3";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio160od_pins: gpio160od-pins {
+			pins = "GPIO160/CLKOUT/RNGOSCOUT";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio169od_pins: gpio169od-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio170od_pins: gpio170od-pins {
+			pins = "GPIO170/nSMI";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio171_pins: gpio171-pins {
+			pins = "GPIO171/SMB6SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio172pp_pins: gpio172pp-pins {
+			pins = "GPIO172/SMB6SDA";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio173od_pins: gpio173od-pins {
+			pins = "GPIO173/SMB7SCL";
+			bias-disable;
+			output-low;
+			drive-open-drain;
+		};
+		gpio174_pins: gpio174-pins {
+			pins = "GPIO174/SMB7SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio175ol_pins: gpio175ol-pins {
+			pins = "GPIO175/PSPI1CK/FANIN19";
+			bias-disable;
+			output-low;
+		};
+		gpio176o_pins: gpio176o-pins {
+			pins = "GPIO176/PSPI1DO/FANIN18";
+			bias-disable;
+			output-high;
+		};
+		gpio177_pins: gpio177-pins {
+			pins = "GPIO177/PSPI1DI/FANIN17";
+			bias-disable;
+			input-enable;
+		};
+		gpio188od_pins: gpio188od-pins {
+			pins = "GPIO188/SPI3D2/nSPI3CS2";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio189od_pins: gpio189od-pins {
+			pins = "GPIO189/SPI3D3/nSPI3CS3";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio191pp_pins: gpio191pp-pins {
+			pins = "GPIO191";
+			bias-disable;
+			output-high;
+			drive-push-pull;
+		};
+		gpio192pp_pins: gpio192pp-pins {
+			pins = "GPIO192";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio194_pins: gpio194-pins {
+			pins = "GPIO194/SMB0BSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio195_pins: gpio195-pins {
+			pins = "GPIO195/SMB0BSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio196_pins: gpio196-pins {
+			pins = "GPIO196/SMB0CSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio197_pins: gpio197-pins {
+			pins = "GPIO197/SMB0DEN";
+			bias-disable;
+			input-enable;
+		};
+		gpio198pp_pins: gpio198pp-pins {
+			pins = "GPIO198/SMB0DSDA";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio199_pins: gpio199-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio200pp_pins: gpio200pp-pins {
+			pins = "GPIO200/R2CK";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio202_pins: gpio202-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio204_pins: gpio204-pins {
+			pins = "GPIO204/DDC2SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio205_pins: gpio205-pins {
+			pins = "GPIO205/DDC2SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio206pp_pins: gpio206pp-pins {
+			pins = "GPIO206/HSYNC2";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio207pp_pins: gpio207pp-pins {
+			pins = "GPIO207/VSYNC2";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio217pp_pins: gpio217pp-pins {
+			pins = "GPIO217/RG2MDIO/DVHSYNC";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio218pp_pins: gpio218pp-pins {
+			pins = "GPIO218/nWDO1";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio219od_pins: gpio219od-pins {
+			pins = "GPIO219/nWDO2";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio220pp_pins: gpio220pp-pins {
+			pins = "GPIO220/SMB12SCL";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio221pp_pins: gpio221pp-pins {
+			pins = "GPIO221/SMB12SDA";
+			bias-disable;
+			output-low;
+			drive-push-pull;
+		};
+		gpio222od_pins: gpio222od-pins {
+			pins = "GPIO222/SMB13SCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio223_pins: gpio223-pins {
+			pins = "GPIO223/SMB13SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio224_pins: gpio224-pins {
+			pins = "GPIO224/SPIXCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio227_pins: gpio227-pins {
+			pins = "GPIO227/nSPIXCS0";
+			bias-disable;
+			input-enable;
+		};
+		gpio228_pins: gpio228-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			input-enable;
+		};
+		gpio230_pins: gpio230-pins {
+			pins = "GPIO230/SPIXD3";
+			bias-disable;
+			input-enable;
+		};
+		gpio231_pins: gpio231-pins {
+			pins = "GPIO231/nCLKREQ";
+			bias-disable;
+			input-enable;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gis.dts b/arch/arm/boot/dts/nuvoton-npcm730-gis.dts
new file mode 100644
index 000000000000..1422b2aadebf
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gis.dts
@@ -0,0 +1,1076 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 Quanta Computer Inc. Fran.Hsu@quantatw.com
+
+/dts-v1/;
+#include "nuvoton-npcm730.dtsi"
+#include "nuvoton-npcm730-gis-pincfg.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Quanta GIS Board (Device Tree v01.17)";
+	compatible = "nuvoton,npcm750";
+
+	aliases {
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
+		udc5 = &udc5;
+		udc6 = &udc6;
+		udc7 = &udc7;
+		udc8 = &udc8;
+		udc9 = &udc9;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+		i2c8 = &i2c8;
+		i2c11 = &i2c11;
+		i2c14 = &i2c14;
+		i2c15 = &i2c15;
+		i2c16 = &i2c_cpu0_dimmA;
+		i2c17 = &i2c_cpu0_dimmE;
+		i2c18 = &i2c_cpu1_dimmA;
+		i2c19 = &i2c_cpu1_dimmE;
+		i2c20 = &i2c_clock_gen_0;
+		i2c21 = &i2c_clock_gen_1;
+		i2c22 = &i2c_clock_gen_2;
+		i2c23 = &i2c_clock_gen_3;
+		i2c24 = &i2c_slot0;
+		i2c25 = &i2c_slot1;
+		i2c26 = &i2c_slot2;
+		i2c27 = &i2c_slot3;
+		i2c28 = &i2c_slot4;
+		i2c29 = &i2c_slot5;
+		i2c30 = &i2c_slot6;
+		i2c31 = &i2c_slot7;
+		i2c32 = &i2c_power_0;
+		i2c33 = &i2c_power_1;
+		i2c34 = &i2c_power_2;
+		i2c35 = &i2c_power_3;
+		i2c36 = &i2c_isl_0;
+		i2c37 = &i2c_isl_1;
+		i2c38 = &i2c_isl_2;
+		i2c39 = &i2c_isl_3;
+		i2c40 = &i2c_isl_4;
+		i2c41 = &i2c_isl_5;
+		i2c42 = &i2c_isl_6;
+		i2c43 = &i2c_isl_7;
+		i2c44 = &i2c_hostswap;
+		i2c45 = &i2c_tmp;
+		i2c46 = &i2c_fan_controller_1;
+		i2c47 = &i2c_fan_controller_2;
+		i2c48 = &i2c_seq;
+		i2c49 = &i2c_fru_1;
+		i2c50 = &i2c_fru_2;
+		i2c51 = &i2c_i2cool_1;
+		i2c52 = &i2c_i2cool_2;
+		i2c53 = &i2c_i2cool_3;
+		i2c54 = &i2c_i2cool_4;
+		i2c55 = &i2c_cpu_pirom;
+		fiu0 = &fiu0;
+		fiu1 = &fiu3;
+	};
+
+	chosen {
+		stdout-path = &serial3;
+	};
+
+	memory {
+		reg = <0 0x40000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		sas-cable0 {
+			label = "sas-cable0";
+			gpios = <&gpio6 19 GPIO_ACTIVE_LOW>;
+			linux,code = <211>;
+		};
+
+		sas-cable1 {
+			label = "sas-cable1";
+			gpios = <&gpio6 20 GPIO_ACTIVE_LOW>;
+			linux,code = <212>;
+		};
+
+		power-failure {
+			label = "power-failure";
+			gpios = <&gpio6 21 GPIO_ACTIVE_LOW>;
+			linux,code = <213>;
+		};
+	};
+
+	iio-hwmon {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 1>, <&adc 2>, <&adc 3>,
+			<&adc 4>, <&adc 5>, <&adc 6>, <&adc 7>;
+	};
+
+	iio-hwmon-battery {
+		compatible = "iio-hwmon";
+		io-channels = <&adc 0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-bmc-live {
+			gpios = <&gpio4 25 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		LED_SYS_ERROR {
+			gpios = <&gpio5 12 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_BMC_FAULT {
+			gpios = <&gpio6 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_SYS_ATTN {
+			gpios = <&gpio6 28 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_SYS_STATE {
+			gpios = <&gpio6 29 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
+	seven-seg-disp {
+		compatible = "seven-seg-gpio-dev";
+		refresh-interval-ms = /bits/ 16 <600>;
+		clock-gpios = <&gpio0 2 GPIO_ACTIVE_LOW>;
+		data-gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+		clear-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	pcie-slot {
+		pcie0: pcie-slot@0 {
+			label = "PE0";
+		};
+
+		pcie1: pcie-slot@1 {
+			label = "PE1";
+		};
+
+		pcie2: pcie-slot@2 {
+			label = "PE2";
+		};
+
+		pcie3: pcie-slot@3 {
+			label = "PE3";
+		};
+
+		pcie4: pcie-slot@4 {
+			label = "PE4";
+		};
+
+		pcie5: pcie-slot@5 {
+			label = "PE5";
+		};
+
+		pcie6: pcie-slot@6 {
+			label = "PE6";
+		};
+
+		pcie7: pcie-slot@7 {
+			label = "PE7";
+		};
+	};
+};
+
+&gcr {
+	serial_port_mux: mux-controller {
+		compatible = "mmio-mux";
+		#mux-control-cells = <1>;
+		mux-reg-masks = <0x38 0x07>;
+		idle-states = <2>; /* Serial port mode 3 (takeover) */
+	};
+};
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	snps,eee-force-disable;
+	status = "okay";
+};
+
+&emc0 {
+	status = "okay";
+	fixed-link {
+		speed = <100>;
+		full-duplex;
+	};
+};
+
+&mc {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&aes {
+	status = "okay";
+};
+
+&sha {
+	status = "okay";
+};
+
+&udc5 {
+	status = "okay";
+};
+
+&udc6 {
+	status = "okay";
+};
+
+&udc7 {
+	status = "okay";
+};
+
+&udc8 {
+	status = "okay";
+};
+
+&udc9 {
+	status = "okay";
+};
+
+&pcimbox {
+	status = "okay";
+};
+
+&fiu0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0cs1_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <19000000>;
+		spi-rx-bus-width = <2>;
+		label = "bmc";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			u-boot@0 {
+				label = "u-boot";
+				reg = <0x0000000 0xf0000>;
+			};
+			image-descriptor@f0000 {
+				label = "image-descriptor";
+				reg = <0xf0000 0x10000>;
+			};
+			hoth-update@100000 {
+				label = "hoth-update";
+				reg = <0x100000 0x100000>;
+			};
+			kernel@200000 {
+				label = "kernel";
+				reg = <0x200000 0x500000>;
+			};
+			rofs@700000 {
+				label = "rofs";
+				reg = <0x700000 0x35f0000>;
+			};
+			rwfs@3cf0000 {
+				label = "rwfs";
+				reg = <0x3cf0000 0x300000>;
+			};
+			hoth-mailbox@3ff0000 {
+				label = "hoth-mailbox";
+				reg = <0x3ff0000 0x10000>;
+			};
+		};
+	};
+};
+
+&fiu3 {
+	pinctrl-0 = <&spi3_pins>, <&spi3cs1_pins>;
+	status = "okay";
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
+		label="bios";
+	};
+	flash@1 {
+		compatible = "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <1>;
+		spi-max-frequency = <20000000>;
+		spi-rx-bus-width = <2>;
+		label = "bios-secondary";
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			bios-secondary-zero@0 {
+				label = "bios-secondary-0";
+				reg = <0x0000000 0x4000000>;
+			};
+			bios-secondary-one@4000000 {
+				label = "bios-secondary-1";
+				reg = <0x4000000 0x4000000>;
+			};
+		};
+	};
+};
+
+&watchdog1 {
+	status = "okay";
+};
+
+&rng {
+	status = "okay";
+};
+
+&serial0 {
+	status = "okay";
+};
+
+&serial1 {
+	status = "okay";
+};
+
+&serial2 {
+	status = "okay";
+};
+
+&serial3 {
+	status = "okay";
+};
+
+&adc {
+	#io-channel-cells = <1>;
+	status = "okay";
+};
+
+&otp {
+	status = "okay";
+};
+
+&lpc_kcs {
+	kcs1: kcs1@0 {
+		status = "okay";
+	};
+
+	kcs2: kcs2@0 {
+		status = "okay";
+	};
+
+	kcs3: kcs3@0 {
+		status = "okay";
+	};
+};
+
+&lpc_host {
+	lpc_bpc: lpc_bpc@40 {
+		monitor-ports = <0x80>;
+		status = "okay";
+	};
+};
+
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "disabled";
+	i2c-switch@73 {
+		compatible = "nxp,pca9546";
+		reg = <0x73>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 0 GPIO_ACTIVE_LOW>;
+
+		i2c_cpu0_dimmA: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_cpu0_dimmE: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c_cpu1_dimmA: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_cpu1_dimmE: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	i2c-switch@74 {
+		compatible = "nxp,pca9546";
+		reg = <0x74>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 1 GPIO_ACTIVE_LOW>;
+
+		i2c_clock_gen_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+		};
+
+		i2c_clock_gen_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c_clock_gen_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+		};
+
+		i2c_clock_gen_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+		};
+	};
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x75>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 4 GPIO_ACTIVE_LOW>;
+
+		i2c_slot0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			pcie-slot = &pcie0;
+		};
+
+		i2c_slot1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			pcie-slot = &pcie1;
+		};
+
+		i2c_slot2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			pcie-slot = &pcie2;
+			lm90@4a {
+				compatible = "national,lm90";
+				reg = <0x4a>;
+			};
+		};
+
+		i2c_slot3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			pcie-slot = &pcie3;
+		};
+
+		i2c_slot4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			pcie-slot = &pcie4;
+		};
+
+		i2c_slot5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			pcie-slot = &pcie5;
+		};
+
+		i2c_slot6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			pcie-slot = &pcie6;
+		};
+
+		i2c_slot7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+			pcie-slot = &pcie7;
+		};
+	};
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 2 GPIO_ACTIVE_LOW>;
+
+		i2c_power_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			zl8802@5b {
+				compatible = "isil,zl8802";
+				reg = <0x5b>;
+			};
+		};
+
+		i2c_power_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			max16600@60 {
+				compatible = "max16600";
+				reg = <0x60>;
+			};
+		};
+
+		i2c_power_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			max16600@60 {
+				compatible = "max16600";
+				reg = <0x60>;
+			};
+		};
+
+		i2c_power_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			stb_12v@68 {
+				compatible = "pm6764tr";
+				reg = <0x68>;
+			};
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 5 GPIO_ACTIVE_LOW>;
+
+		i2c_isl_0: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			vrm@46 {
+				compatible = "isil,isl69222";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			vrm@46 {
+				compatible = "isil,isl69222";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			vrm@46 {
+				compatible = "isil,isl69222";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_3: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			vrm@46 {
+				compatible = "isil,isl69222";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_4: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			vrm@46 {
+				compatible = "isil,isl69228";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_5: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			vrm@46 {
+				compatible = "isil,isl69228";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_6: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			vrm@46 {
+				compatible = "isil,isl69228";
+				reg = <0x46>;
+			};
+		};
+
+		i2c_isl_7: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+			vrm@46 {
+				compatible = "isil,isl69228";
+				reg = <0x46>;
+			};
+		};
+	};
+};
+
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pca9538: pca9538@72 {
+		compatible = "nxp,pca9538";
+		reg = <0x72>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		U3009_P0 {
+			gpio-hog;
+			gpios = <0 0>;
+			output-low;
+			line-name = "RST_SMB_MUX_TCA9545_N";
+		};
+	};
+
+	i2c-switch@75 {
+		compatible = "nxp,pca9546";
+		reg = <0x75>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 3 GPIO_ACTIVE_LOW>;
+
+		i2c_hostswap: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			adm1272@1f {
+				compatible = "adi,adm1272";
+				reg = <0x1f>;
+				shunt-resistor-micro-ohms = <330>;
+			};
+		};
+		i2c_tmp: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+		};
+		i2c_fan_controller_1: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			fan_controller@2c {
+				compatible = "maxim,max31790";
+				reg = <0x2c>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		i2c_fan_controller_2: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			fan_controller@2c {
+				compatible = "maxim,max31790";
+				reg = <0x2c>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+	};
+
+	i2c-switch@77 {
+		compatible = "nxp,pca9548";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x77>;
+		i2c-mux-idle-disconnect;
+		reset-gpios = <&pca9538 6 GPIO_ACTIVE_LOW>;
+
+		i2c_seq: i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			Sequencer@59 {
+				compatible = "maxim,max34451";
+				reg = <0x59>;
+			};
+		};
+
+		i2c_fru_1: i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+			mobo_fru@55 {
+				compatible = "atmel,24c64";
+				reg = <0x55>;
+			};
+		};
+
+		i2c_fru_2: i2c@2 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <2>;
+			eeprom@50 {
+				compatible = "atmel,24c2048";
+				reg = <0x50>;
+			};
+		};
+
+		i2c_i2cool_1: i2c@3 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <3>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_i2cool_2: i2c@4 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <4>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_i2cool_3: i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_i2cool_4: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+			lm75@5c {
+				compatible = "maxim,max31725";
+				reg = <0x5c>;
+				status = "okay";
+			};
+		};
+
+		i2c_cpu_pirom: i2c@7 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <7>;
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+	slave_mqueue: i2c-slave-mqueue@40000010 {
+		compatible = "i2c-slave-mqueue";
+		reg = <0x40000010>;
+		status = "okay";
+	};
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+};
+
+&i2c11 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c14 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	status = "okay";
+	Sequencer@59 {
+		compatible = "maxim,max34451";
+		reg = <0x59>;
+	};
+
+	bmc_fru@55 {
+		compatible = "atmel,24c64";
+		reg = <0x55>;
+	};
+};
+
+&spi0 {
+	cs-gpios = <&gpio6 22 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio175ol_pins &gpio176o_pins
+		&gpio177_pins>;
+	status = "okay";
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi1_pins>;
+		pinctrl-1 = <&gpio175ol_pins &gpio176o_pins
+				&gpio177_pins>;
+
+		tck-gpios = <&gpio5 15 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio5 16 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio5 17 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
+&spi1 {
+	cs-gpios = <&gpio6 23 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&gpio17_pins &gpio18o_pins
+		&gpio19ol_pins>;
+	status = "okay";
+	jtag_master {
+		compatible = "nuvoton,npcm750-jtag-master";
+		spi-max-frequency = <25000000>;
+		reg = <0>;
+
+		pinctrl-names = "pspi", "gpio";
+		pinctrl-0 = <&pspi2_pins>;
+		pinctrl-1 = <&gpio17_pins &gpio18o_pins
+				&gpio19ol_pins>;
+
+		tck-gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+		tdi-gpios = <&gpio0 18 GPIO_ACTIVE_HIGH>;
+		tdo-gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
+		tms-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <
+			/* GPI pins*/
+			&gpio4_pins
+			&gpio5_pins
+			&gpio8_pins
+			&gpio9_pins
+			&gpio10_pins
+			&gpio11_pins
+			&gpio13_pins
+			&gpio14_pins
+			&gpio20_pins
+			&gpio21_pins
+			&gpio24_pins
+			&gpio25_pins
+			&gpio38_pins
+			&gpio39_pins
+			&gpio40_pins
+			&gpio64_pins
+			&gpio65_pins
+			&gpio71_pins
+			&gpio73_pins
+			&gpio74_pins
+			&gpio78_pins
+			&gpio79_pins
+			&gpio88_pins
+			&gpio93_pins
+			&gpio94_pins
+			&gpio120_pins
+			&gpio121_pins
+			&gpio122_pins
+			&gpio123_pins
+			&gpio124_pins
+			&gpio125_pins
+			&gpio126_pins
+			&gpio127_pins
+			&gpio130_pins
+			&gpio136_pins
+			&gpio137_pins
+			&gpio138_pins
+			&gpio139_pins
+			&gpio140_pins
+			&gpio141_pins
+			&gpio142_pins
+			&gpio143_pins
+			&gpio144_pins
+			&gpio146_pins
+			&gpio147_pins
+			&gpio154_pins
+			&gpio155_pins
+			&gpio156_pins
+			&gpio171_pins
+			&gpio174_pins
+			&gpio194_pins
+			&gpio195_pins
+			&gpio196_pins
+			&gpio197_pins
+			&gpio199_pins
+			&gpio202_pins
+			&gpio204_pins
+			&gpio205_pins
+			&gpio223_pins
+			&gpio224_pins
+			&gpio227_pins
+			&gpio228_pins
+			&gpio230_pins
+			&gpio231_pins
+			&gpio177_pins
+			&gpio17_pins
+			/* GPO pins*/
+			&gpio175ol_pins
+			&gpio176o_pins
+			&gpio18o_pins
+			&gpio19ol_pins
+			>;
+};
+
+&gpio0 {
+	gpio-line-names =
+	/*0-31*/	"","","","","","","RESET_OUT","POWER_OUT",
+			"","","CPU1_MEM_THERM_EVENT","CPU2_MEM_THERM_EVENT","","PS_PWROK","","",
+			"","","","","SIO_POWER_GOOD","","","",
+			"CPU1_THERMTRIP","CPU2_THERMTRIP","","","","","","";
+};
+
+&gpio1 {
+	gpio-line-names =
+	/*32-63*/	"","","","","","","CPU_CATERR","",
+			"CPU_MCERR","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+};
+
+&gpio2 {
+	gpio-line-names =
+	/*64-95*/	"POWER_BUTTON","RESET_BUTTON","","","","","","",
+			"","CPU1_VRHOT","CPU2_VRHOT","","","DEBUG_EN_N","XDP_PRST_N","",
+			"","TCK_MUX_SEL","PWR_DEBUG_N","PREQ_N","","","","",
+			"","","","","","","PCH_BMC_THERMTRIP","";
+};
+
+&gpio4 {
+	gpio-line-names =
+	/*128-159*/	"","","","","","","","",
+			"","","CPU_ERR0","CPU_ERR1","CPU_ERR2","","","POST_COMPLETE",
+			"PRDY_N","SYSPWROK","","","","","","",
+			"","","","","SMI","","","";
+};
+
+&gpio6 {
+	gpio-line-names =
+	/*192-223*/	"","","","","","","","SIO_S5",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+};
+
+&gpio7 {
+	gpio-line-names =
+	/*224-255*/	"","","","PLTRST_N","CPU1_FIVR_FAULT","","CPU2_FIVR_FAULT","",
+			"","","","","","","","",
+			"","","","","","","","",
+			"","","","","","","","";
+};
+
+&peci0 {
+	cmd-timeout-ms = <1000>;
+	pull-down = <0>;
+	host-neg-bit-rate = <15>;
+	status = "okay";
+
+	intel-peci-dimmtemp@30 {
+		compatible = "intel,peci-client";
+		reg = <0x30>;
+		status = "okay";
+	};
+
+	intel-peci-dimmtemp@31 {
+		compatible = "intel,peci-client";
+		reg = <0x31>;
+		status = "okay";
+	};
+};
-- 
2.25.1

