Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0179630EE4
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 15:30:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Flh1485hzDqXD
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 23:30:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iTTyYyt+"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45FlbZ6ZcDzDqWC
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 23:26:48 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u17so6220462pfn.7
 for <openbmc@lists.ozlabs.org>; Fri, 31 May 2019 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i1F64qPRT0BQ3AGzMP1x3+y2Y38aTLgXptMApL3c37c=;
 b=iTTyYyt+0ArpVkkjcEaBvFvejlZpLSZHlqLp+Yn45HeOSqR9tp9aiC+2QdyWbIBX0b
 lqmwges40lB/8RGE/12KiNoGnWTMipLMfF0dHxvmXmO13ZbRIhixH0vMtuq01ELOVvEZ
 8/YCpcB96zNplX9tOz5XxX8RKvlJYbcWnLQ08qbB0A/kFcqkHxPkz8SlLxM7Cf6GHBJ3
 p4qGuhiVrEg3vKLdwPnC6RbfE5MiJq2WOj58KXoJu/ANmY/a+qgHk4EN82Y+/m/YclEM
 DpZmsZeTocpD5nh4KiO85Gmzb/MMYBZ+LugQ8cmyA0OkrxLBvZNc76kOolPAdF7y6M01
 NLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i1F64qPRT0BQ3AGzMP1x3+y2Y38aTLgXptMApL3c37c=;
 b=eHUXAJVqeWgmZchVUzMsWhj0W5ULd6xlAxpiTZggmQ7m1KIml+zBpx5fpI1uaG1QKU
 uNciXPzcVJzs3afXb30q34ApHyruR7+E2m2+GSUL9UOCPyskK9qSVo6XYAy2i2Oq9eON
 3enVepRLJ5zNXFo0X2C79Td6E5bkad0BNLNi9P7+b3oLDOsGwm3bjT/XHEPFk1vq7TYL
 PB5jSW+XrNwo7VXkdbTHJ3jfE5ZSuKEsQ9iYWYbTU81rz/CTxkl3Y4x4e8Pb3KtHaNMi
 73Y6kgyJ4nNuR6x2d/RhYTV0zpMw8UaEvlxywHAvSgFlGJJb4bogwaxPCNBhjfGg8EpV
 pEGQ==
X-Gm-Message-State: APjAAAVm3lU+kzDslgn1lagEMDoDDzpvX7vGmTnqmrmWGuY/N2U5Yznt
 VmwV3zLz3fcHc1osD0x0Z8U=
X-Google-Smtp-Source: APXvYqyxq8PVYmPSEzEanH+FbVld1lex6R5MkqxDdBepV352CCIW2+zyc3wdZWLVN4Ib88crmstjkg==
X-Received: by 2002:aa7:9a1d:: with SMTP id w29mr9864887pfj.81.1559309206544; 
 Fri, 31 May 2019 06:26:46 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id p20sm15444571pgk.7.2019.05.31.06.26.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 31 May 2019 06:26:46 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v5 2/4] ARM: dts: nuvoton: Add Quanta GSJ BMC pinctrl
 file.
Date: Fri, 31 May 2019 21:24:38 +0800
Message-Id: <20190531132440.37572-2-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
References: <20190531132440.37572-1-Fran.Hsu@quantatw.com>
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
Cc: openbmc@lists.ozlabs.org, Fran Hsu <Fran.Hsu@quantatw.com>,
 benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add pinctrl definition file for Quanta GSJ BMC device tree.
This file includes a series of Quanta GSJ default GPIO configuration.

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 .../boot/dts/nuvoton-npcm730-gsj-gpio.dtsi    | 477 ++++++++++++++++++
 1 file changed, 477 insertions(+)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
new file mode 100644
index 000000000..53cfd15fa
--- /dev/null
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-gpio.dtsi
@@ -0,0 +1,477 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018 Nuvoton Technology tomer.maimon@nuvoton.com
+
+/ {
+	pinctrl: pinctrl@f0800000 {
+		gpio0pp_pins: gpio0pp-pins {
+			pins = "GPIO0/IOX1DI";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio1pp_pins: gpio1pp-pins {
+			pins = "GPIO1/IOX1LD";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio2pp_pins: gpio2pp-pins {
+			pins = "GPIO2/IOX1CK";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio3pp_pins: gpio3pp-pins {
+			pins = "GPIO3/IOX1D0";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio4pp_pins: gpio4pp-pins {
+			pins = "GPIO4/IOX2DI/SMB1DSDA";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio5pp_pins: gpio5pp-pins {
+			pins = "GPIO5/IOX2LD/SMB1DSCL";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio6pp_pins: gpio6pp-pins {
+			pins = "GPIO6/IOX2CK/SMB2DSDA";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio7pp_pins: gpio7pp-pins {
+			pins = "GPIO7/IOX2D0/SMB2DSCL";
+			bias-disable;
+			drive-push-pull;
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
+		gpio10pp_pins: gpio10pp-pins {
+			pins = "GPIO10/IOXHLD";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio11pp_pins: gpio11pp-pins {
+			pins = "GPIO11/IOXHCK";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio12_pins: gpio12-pins {
+			pins = "GPIO12/GSPICK/SMB5BSCL";
+			bias-disable;
+			input-enable;
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
+		gpio17pp_pins: gpio17pp-pins {
+			pins = "GPIO17/PSPI2DI/SMB4DEN";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio18pp_pins: gpio18pp-pins {
+			pins = "GPIO18/PSPI2D0/SMB4BSDA";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio19pp_pins: gpio19pp-pins {
+			pins = "GPIO19/PSPI2CK/SMB4BSCL";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio24pp_pins: gpio24pp-pins {
+			pins = "GPIO24/IOXHDO";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio25pp_pins: gpio25pp-pins {
+			pins = "GPIO25/IOXHDI";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio37od_pins: gpio37od-pins {
+			pins = "GPIO37/SMB3CSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio59pp_pins: gpio59pp-pins {
+			pins = "GPIO59/SMB3DSDA";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio60_pins: gpio60-pins {
+			pins = "GPIO60/SMB3DSCL";
+			bias-disable;
+			input-enable;
+		};
+		gpio72od_pins: gpio72od-pins {
+			pins = "GPIO72/FANIN8";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio73od_pins: gpio73od-pins {
+			pins = "GPIO73/FANIN9";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio74od_pins: gpio74od-pins {
+			pins = "GPIO74/FANIN10";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio75od_pins: gpio75od-pins {
+			pins = "GPIO75/FANIN11";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio76od_pins: gpio76od-pins {
+			pins = "GPIO76/FANIN12";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio77od_pins: gpio77od-pins {
+			pins = "GPIO77/FANIN13";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio78od_pins: gpio78od-pins {
+			pins = "GPIO78/FANIN14";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio79od_pins: gpio79od-pins {
+			pins = "GPIO79/FANIN15";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio83_pins: gpio83-pins {
+			pins = "GPIO83/PWM3";
+			bias-disable;
+			input-enable;
+		};
+		gpio84pp_pins: gpio84pp-pins {
+			pins = "GPIO84/R2TXD0";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio85pp_pins: gpio85pp-pins {
+			pins = "GPIO85/R2TXD1";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio86pp_pins: gpio86pp-pins {
+			pins = "GPIO86/R2TXEN";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio87pp_pins: gpio87pp-pins {
+			pins = "GPIO87/R2RXD0";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio88pp_pins: gpio88pp-pins {
+			pins = "GPIO88/R2RXD1";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio89pp_pins: gpio89pp-pins {
+			pins = "GPIO89/R2CRSDV";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio90pp_pins: gpio90pp-pins {
+			pins = "GPIO90/R2RXERR";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio91_pins: gpio91-pins {
+			pins = "GPIO91/R2MDC";
+			bias-disable;
+			input-enable;
+		};
+		gpio92_pins: gpio92-pins {
+			pins = "GPIO92/R2MDIO";
+			bias-disable;
+			input-enable;
+		};
+		gpio93pp_pins: gpio93pp-pins {
+			pins = "GPIO93/GA20/SMB5DSCL";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio94pp_pins: gpio94pp-pins {
+			pins = "GPIO94/nKBRST/SMB5DSDA";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio95_pins: gpio95-pins {
+			pins = "GPIO95/nLRESET/nESPIRST";
+			bias-disable;
+			input-enable;
+		};
+		gpio125pp_pins: gpio125pp-pins {
+			pins = "GPIO125/SMB1CSCL";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio126od_pins: gpio126od-pins {
+			pins = "GPIO126/SMB1BSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio127od_pins: gpio127od-pins {
+			pins = "GPIO127/SMB1BSCL";
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
+		gpio141_pins: gpio141-pins {
+			pins = "GPIO141/SD1WP";
+			bias-disable;
+			input-enable;
+		};
+		gpio142od_pins: gpio142od-pins {
+			pins = "GPIO142/SD1CMD";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio143ol_pins: gpio143ol-pins {
+			pins = "GPIO143/SD1CD/SD1PWR";
+			bias-disable;
+			output-low;
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
+		gpio148_pins: gpio148-pins {
+			pins = "GPIO148/MMCDT4";
+			bias-disable;
+			input-enable;
+		};
+		gpio149_pins: gpio149-pins {
+			pins = "GPIO149/MMCDT5";
+			bias-disable;
+			input-enable;
+		};
+		gpio150_pins: gpio150-pins {
+			pins = "GPIO150/MMCDT6";
+			bias-disable;
+			input-enable;
+		};
+		gpio151_pins: gpio151-pins {
+			pins = "GPIO151/MMCDT7";
+			bias-disable;
+			input-enable;
+		};
+		gpio152_pins: gpio152-pins {
+			pins = "GPIO152/MMCCLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio153_pins: gpio153-pins {
+			pins = "GPIO153/MMCWP";
+			bias-disable;
+			input-enable;
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
+		gpio157_pins: gpio157-pins {
+			pins = "GPIO157/MMCDT1";
+			bias-disable;
+			input-enable;
+		};
+		gpio158_pins: gpio158-pins {
+			pins = "GPIO158/MMCDT2";
+			bias-disable;
+			input-enable;
+		};
+		gpio159_pins: gpio159-pins {
+			pins = "GPIO159/MMCDT3";
+			bias-disable;
+			input-enable;
+		};
+		gpio161_pins: gpio161-pins {
+			pins = "GPIO161/nLFRAME/nESPICS";
+			bias-disable;
+			input-enable;
+		};
+		gpio162_pins: gpio162-pins {
+			pins = "GPIO162/SERIRQ";
+			bias-disable;
+			input-enable;
+		};
+		gpio163_pins: gpio163-pins {
+			pins = "GPIO163/LCLK/ESPICLK";
+			bias-disable;
+			input-enable;
+		};
+		gpio164_pins: gpio164-pins {
+			pins = "GPIO164/LAD0/ESPI_IO0";
+			bias-disable;
+			input-enable;
+		};
+		gpio165_pins: gpio165-pins {
+			pins = "GPIO165/LAD1/ESPI_IO1";
+			bias-disable;
+			input-enable;
+		};
+		gpio166_pins: gpio166-pins {
+			pins = "GPIO166/LAD2/ESPI_IO2";
+			bias-disable;
+			input-enable;
+		};
+		gpio167_pins: gpio167-pins {
+			pins = "GPIO167/LAD3/ESPI_IO3";
+			bias-disable;
+			input-enable;
+		};
+		gpio168_pins: gpio168-pins {
+			pins = "GPIO168/nCLKRUN/nESPIALERT";
+			bias-disable;
+			input-enable;
+		};
+		gpio169_pins: gpio169-pins {
+			pins = "GPIO169/nSCIPME";
+			bias-disable;
+			input-enable;
+		};
+		gpio170_pins: gpio170-pins {
+			pins = "GPIO170/nSMI";
+			bias-disable;
+			input-enable;
+		};
+		gpio175od_pins: gpio175od-pins {
+			pins = "GPIO175/PSPI1CK/FANIN19";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio176od_pins: gpio176od-pins {
+			pins = "GPIO176/PSPI1DO/FANIN18";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio177_pins: gpio177-pins {
+			pins = "GPIO177/PSPI1DI/FANIN17";
+			bias-disable;
+			input-enable;
+		};
+		gpio190od_pins: gpio190od-pins {
+			pins = "GPIO190/nPRD_SMI";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio191_pins: gpio191-pins {
+			pins = "GPIO191";
+			bias-disable;
+			input-enable;
+		};
+		gpio192_pins: gpio192-pins {
+			pins = "GPIO192";
+			bias-disable;
+			input-enable;
+		};
+		gpio194pp_pins: gpio194pp-pins {
+			pins = "GPIO194/SMB0BSCL";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio195od_pins: gpio195od-pins {
+			pins = "GPIO195/SMB0BSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio196od_pins: gpio196od-pins {
+			pins = "GPIO196/SMB0CSCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio197od_pins: gpio197od-pins {
+			pins = "GPIO197/SMB0DEN";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio198od_pins: gpio198od-pins {
+			pins = "GPIO198/SMB0DSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio199od_pins: gpio199od-pins {
+			pins = "GPIO199/SMB0DSCL";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio200pp_pins: gpio200pp-pins {
+			pins = "GPIO200/R2CK";
+			bias-disable;
+			drive-push-pull;
+		};
+		gpio202od_pins: gpio202od-pins {
+			pins = "GPIO202/SMB0CSDA";
+			bias-disable;
+			drive-open-drain;
+		};
+		gpio203_pins: gpio203-pins {
+			pins = "GPIO203/FANIN16";
+			bias-disable;
+			input-enable;
+		};
+	};
+};
-- 
2.21.0

