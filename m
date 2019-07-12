Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BEC6672C
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:45:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNjR0WChzDqVl
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:45:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vDOKdF0Z"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVz5Q2DzDqg3
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:43 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id m30so3860519pff.8
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pXtBCn4Ia2lotNK+bRq4DQdSD3Bk+w6V48mMBe5p5xo=;
 b=vDOKdF0ZFlPK06Iq77mwtnBlbaWA7rETaKHBIhAKtxUZR/XzFCfdsPthkiAjOSm2QV
 wWnfvKwM46crlN9x4cWsSZJf56FU12v0mCcn/LcobWd4J8jct9x/ek2KDfrTZBmJ1/NO
 23bwmeY/5+xOW6aiuNdKO+NKVIK1aLwWIaz8p5Yj8v99Ae+R1KDzW/wEslDYPWKCTHYO
 ktWULWISs3BD2qsKbSUYmewRULg8VdUo7gFI6FPb6FrxOvShGsrNtvOxnsYU+3AMJ3Pn
 PE9ahSVcPlOJmzj0RODiAy9dwktwuvi9SBaz+ubiMuihBatVhP06HjRTb/3OCO2fP1EY
 UD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pXtBCn4Ia2lotNK+bRq4DQdSD3Bk+w6V48mMBe5p5xo=;
 b=uJyF9JwQnYxgJauqxoWx4jpyIuumkSm8Usm1qOPogD7k47V/JRCDQ3KTXlXKXMgpaf
 cUdrJiOSWZPUU2Uk/dnCK/UkNek+GAEqYDqMFGA/SAqMfO3uJ4EFm1tu+beHFeCxjF+v
 bscLPzo7mBhx3MYqo4p0XVw6Qjj9IauaZBGZmt6co9ghyU/SDRHtMnOfIGE6cE3SrolD
 iZ6wQDbFkp+lL5EpA+xDz4OVj46Xl4xMHZ4SsD8H4TafezPoN510Hn8/BGHV7EYbK1xP
 +/zEPT7opbXhfCiRBST+71q36tWnS+PS631tPM98nC02iUn8TRiqtvnmqj9e2FnEEoQH
 rGEg==
X-Gm-Message-State: APjAAAV+hSDdAMCSrCfjuX3cUQ26NGu4aakanIQG+UUDdNh0Ao3UtGgp
 P9lM4m0sNDB/uTGEFS+QUOA=
X-Google-Smtp-Source: APXvYqyBH3HBy+Hos/EaacJGu43xhWNCJrKYUx361S6WtDrulfVYPmjONad1znJ1yRmT3lsdBTTeCA==
X-Received: by 2002:a63:2a8d:: with SMTP id q135mr8843255pgq.46.1562913401256; 
 Thu, 11 Jul 2019 23:36:41 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:40 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.2 v2 7/7] ARM: dts: nuvoton: nuvoton-npcm750-runbmc:
 define gpios outside Module
Date: Fri, 12 Jul 2019 14:35:12 +0800
Message-Id: <20190712063511.96268-7-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190712063511.96268-1-chyishian.jiang@gmail.com>
References: <20190712063511.96268-1-chyishian.jiang@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, Samuel Jiang <Samuel.Jiang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Samuel Jiang <Samuel.Jiang@quantatw.com>

update nuvoton-npcm750-runbmc and runbmc-gpio-dtsi gpios which outside
runbmc module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 .../boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi | 360 ++++++++++++++++++
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts  |  76 ++++
 2 files changed, 436 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi
index f2f575d099ab..18f320c14fe0 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc-gpio.dtsi
@@ -23,6 +23,21 @@
 			bias-disable;
 			output-low;
 		};
+		gpio5_pins: gpio5-pins {
+			pins = "GPIO5/IOX2LD/SMB1DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio6_pins: gpio6-pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio7_pins: gpio7-pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			bias-disable;
+			input-enable;
+		};
 		gpio8o_pins: gpio8o-pins {
 			pins = "GPIO8/LKGPO1";
 			bias-disable;
@@ -33,6 +48,16 @@
 			bias-disable;
 			output-low;
 		};
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
 		gpio12ol_pins: gpio12ol-pins {
 			pins = "GPIO12/GSPICK/SMB5BSCL";
 			bias-disable;
@@ -53,6 +78,46 @@
 			bias-disable;
 			output-low;
 		};
+		gpio20_pins: gpio20-pins {
+			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio21_pins: gpio21-pins {
+			pins = "GPIO21/SMB4CSCL/SMB15SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio22o_pins: gpio22o-pins {
+			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			bias-disable;
+			output-high;
+		};
+		gpio23_pins: gpio23-pins {
+			pins = "GPIO23/SMB4DSCL/SMB14SCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio24_pins: gpio24-pins {
+			pins = "GPIO24/IOXHDO";
+			bias-disable;
+			input-enable;
+		};
+		gpio25_pins: gpio25-pins {
+			pins = "GPIO25/IOXHDI";
+			bias-disable;
+			input-enable;
+		};
+		gpio30_pins: gpio27-pins {
+			pins = "GPIO30/SMB3SDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio31_pins: gpio27-pins {
+			pins = "GPIO31/SMB3SCL";
+			bias-disable;
+			input-enable;
+		};
 		gpio37ol_pins: gpio37ol-pins {
 			pins = "GPIO37/SMB3CSDA";
 			bias-disable;
@@ -68,6 +133,86 @@
 			bias-disable;
 			input-enable;
 		};
+		gpio40o_pins: gpio40o-pins {
+			pins = "GPIO40/SMB3BSCL";
+			bias-disable;
+			output-high;
+		};
+		gpio59_pins: gpio59-pins {
+			pins = "GPIO59/SMB3DSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio76_pins: gpio76-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			input-enable;
+		};
+		gpio77_pins: gpio77-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			input-enable;
+		};
+		gpio78o_pins: gpio78o-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			output-high;
+		};
+		gpio79_pins: gpio79-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			input-enable;
+		};
+		gpio82_pins: gpio82-pins {
+			pins = "GPIO82/PWM2";
+			bias-disable;
+			input-enable;
+		};
+		gpio83_pins: gpio83-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			input-enable;
+		};
+		gpio84_pins: gpio84-pins {
+			pins = "GPIO84/R2TXD0";
+			bias-disable;
+			input-enable;
+		};
+		gpio85o_pins: gpio85o-pins {
+			pins = "GPIO85/R2TXD1";
+			bias-disable;
+			output-high;
+		};
+		gpio86ol_pins: gpio86ol-pins {
+			pins = "GPIO86/R2TXEN";
+			bias-disable;
+			output-low;
+		};
+		gpio87_pins: gpio87-pins {
+			pins = "GPIO87/R2RXD0";
+			bias-disable;
+			input-enable;
+		};
+		gpio88_pins: gpio88-pins {
+			pins = "GPIO88/R2RXD1";
+			bias-disable;
+			input-enable;
+		};
+		gpio89_pins: gpio89-pins {
+			pins = "GPIO89/R2CRSDV";
+			bias-disable;
+			input-enable;
+		};
+		gpio90_pins: gpio90-pins {
+			pins = "GPIO90/R2RXERR";
+			bias-disable;
+			input-enable;
+		};
+		gpio93_pins: gpio93-pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			bias-disable;
+			input-enable;
+		};
 		gpio94ol_pins: gpio94ol-pins {
 			pins = "GPIO94/nKBRST/SMB5DSDA";
 			bias-disable;
@@ -103,6 +248,181 @@
 			bias-disable;
 			output-low;
 		};
+		gpio114o_pins: gpio114o-pins {
+			pins = "GPIO114/SMB0SCL";
+			bias-disable;
+			output-high;
+		};
+		gpio115_pins: gpio115-pins {
+			pins = "GPIO115/SMB0SDA";
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
+		gpio127o_pins: gpio127o-pins {
+			pins = "GPIO127/SMB1BSCL";
+			bias-disable;
+			output-high;
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
+		gpio145_pins: gpio145-pins {
+			pins = "GPIO145/PWM5";
+			bias-disable;
+			input-enable;
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
+		gpio153o_pins: gpio153o-pins {
+			pins = "GPIO153/MMCWP";
+			bias-disable;
+			output-high;
+		};
+		gpio155_pins: gpio155-pins {
+			pins = "GPIO155/nMMCCD/nMMCRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio160o_pins: gpio160o-pins {
+			pins = "GPIO160/CLKOUT/RNGOSCOUT";
+			bias-disable;
+			output-high;
+		};
+		gpio169o_pins: gpio169o-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			output-high;
+		};
+		gpio188o_pins: gpio188o-pins {
+			pins = "GPIO188/SPI3D2/nSPI3CS2";
+			bias-disable;
+			output-high;
+		};
+		gpio189_pins: gpio189-pins {
+			pins = "GPIO189/SPI3D3/nSPI3CS3";
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
+		gpio198o_pins: gpio198o-pins {
+			pins = "GPIO198/SMB0DSDA";
+			bias-disable;
+			output-high;
+		};
+		gpio199o_pins: gpio199o-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			output-high;
+		};
+		gpio200_pins: gpio200-pins {
+			pins = "GPIO200/R2CK";
+			input-enable;
+			bias-disable;
+		};
+		gpio202_pins: gpio202-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			input-enable;
+		};
+		gpio203o_pins: gpio203o-pins {
+			pins = "GPIO203/FANIN16";
+			bias-disable;
+			output-high;
+		};
 		gpio208_pins: gpio208-pins {
 			pins = "GPIO208/RG2TXC/DVCK";
 			bias-disable;
@@ -153,5 +473,45 @@
 			bias-disable;
 			output-low;
 		};
+		gpio224_pins: gpio224-pins {
+			pins = "GPIO224/SPIXCK";
+			bias-disable;
+			input-enable;
+		};
+		gpio225ol_pins: gpio225ol-pins {
+			pins = "GPO225/SPIXD0/STRAP12";
+			bias-disable;
+			output-low;
+		};
+		gpio226ol_pins: gpio226ol-pins {
+			pins = "GPO226/SPIXD1/STRAP13";
+			bias-disable;
+			output-low;
+		};
+		gpio227ol_pins: gpio227ol-pins {
+			pins = "GPIO227/nSPIXCS0";
+			bias-disable;
+			output-low;
+		};
+		gpio228o_pins: gpio228ol-pins {
+			pins = "GPIO228/nSPIXCS1";
+			bias-disable;
+			output-high;
+		};
+		gpio229o_pins: gpio229o-pins {
+			pins = "GPO229/SPIXD2/STRAP3";
+			bias-disable;
+			output-high;
+		};
+		gpio230_pins: gpio230-pins {
+			pins = "GPIO230/SPIXD3";
+			bias-disable;
+			input-enable;
+		};
+		gpio231o_pins: gpio231o-pins {
+			pins = "GPIO231/nCLKREQ";
+			bias-disable;
+			output-high;
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index 53d59ee07e71..559011a580e4 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -643,6 +643,82 @@
 				&gpio215ol_pins
 				&gpio216ol_pins
 				&gpio217ol_pins
+				/******* RunBMC outside Connector pins *******/
+				&gpio5_pins
+				&gpio6_pins
+				&gpio7_pins
+				&gpio10_pins
+				&gpio11_pins
+				&gpio20_pins
+				&gpio21_pins
+				&gpio22o_pins
+				&gpio23_pins
+				&gpio24_pins
+				&gpio25_pins
+				&gpio30_pins
+				&gpio31_pins
+				&gpio40o_pins
+				&gpio59_pins
+				&gpio76_pins
+				&gpio77_pins
+				&gpio78o_pins
+				&gpio79_pins
+				&gpio82_pins
+				&gpio83_pins
+				&gpio84_pins
+				&gpio85o_pins
+				&gpio86ol_pins
+				&gpio87_pins
+				&gpio88_pins
+				&gpio89_pins
+				&gpio90_pins
+				&gpio93_pins
+				&gpio114o_pins
+				&gpio115_pins
+				&gpio120_pins
+				&gpio121_pins
+				&gpio122_pins
+				&gpio123_pins
+				&gpio124_pins
+				&gpio125_pins
+				&gpio126_pins
+				&gpio127o_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio138_pins
+				&gpio139_pins
+				&gpio140_pins
+				&gpio141_pins
+				&gpio142_pins
+				&gpio143_pins
+				&gpio144_pins
+				&gpio146_pins
+				&gpio145_pins
+				&gpio147_pins
+				&gpio153o_pins
+				&gpio155_pins
+				&gpio160o_pins
+				&gpio169o_pins
+				&gpio188o_pins
+				&gpio189_pins
+				&gpio196_pins
+				&gpio197_pins
+				&gpio198o_pins
+				&gpio199o_pins
+				&gpio200_pins
+				&gpio202_pins
+				&gpio203o_pins
+				&gpio224_pins
+				&gpio225ol_pins
+				&gpio226ol_pins
+				&gpio227ol_pins
+				&gpio228o_pins
+				&gpio229o_pins
+				&gpio230_pins
+				&gpio231o_pins
+				&ddc_pins
+				&wdog1_pins
+				&wdog2_pins
 				>;
 	};
 
-- 
2.20.1

