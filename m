Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D414C66724
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 08:42:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lNdk08tZzDqnF
	for <lists+openbmc@lfdr.de>; Fri, 12 Jul 2019 16:42:34 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="XPc/0qnf"; 
 dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lNVv28zdzDqYn
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jul 2019 16:36:39 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id b7so4285492pls.6
 for <openbmc@lists.ozlabs.org>; Thu, 11 Jul 2019 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cs8ItdG0oRQXx19eGomXoDMkVZNuOlWiu/5nIqGw1Q0=;
 b=XPc/0qnfduz14QYrWZtbY6tE/4pP9UhfGhLoXHDfenVNFpsbeEsSm2ZrjgsVEqDnm4
 NFty2PogpO2UIUaVQOjOvkqvdaiaoJWVUGDMrPZnqU0k4TWp0r7SmDZxnES0ouYdQwUB
 vYAgJWwvVc5DYtoZohm/fzu+htuorpH8hH+C0yNvkM4wbtRQ5UUzgeWRxCxCVUp2rKzq
 0Su3BW1qPxhQQxEtfhAtH8WuXjrGTDdnVtxUTeC5yebnlWx54g4HP9QsrgIwtvxTSRKt
 nF5clP3IVe6p46S41GBQeIiIi4MMPCs+MpMJUSHW2NZNuDiYk3AWSuT301loB0c2/xST
 YfJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cs8ItdG0oRQXx19eGomXoDMkVZNuOlWiu/5nIqGw1Q0=;
 b=uPyEiIUXeXQ/JxL3oUDwkfLKjl8Ixqtlq3yTb8DRIBZl/s5/VwqZ47mWtOaW04wfdo
 s/oIJkEwBypEu+qDHqUsaR44ftZuNiJsNi4RNXiPlE2KlPRGPwragpaFbUWJ40DHYZ/z
 omheyz9b3MObItNRlh2EcPn4oe0NLrxc6IgTq6aCD1WEXa1sxwfHms6qZ+1wCmUjoevt
 V1rc4cDpOferp5n9kI+vjbiWCDT4QjBdZhSsiWISB37gDA6WRIL1J0XAiqeBNxzJHHl5
 DjqTtvwOyUc15m6HD6Bsz6bZQBpIp2u9lfOR1bGdd5tRof+bqUXnsDVYkBajO1OREWqO
 FQ4w==
X-Gm-Message-State: APjAAAVRqw4PWjGUWhB7mzv4Rntu7hjhMvOA3oikT9fRdaqpiqwSpIa6
 r8IKTiFDDQQzRVi82ecXDXQ=
X-Google-Smtp-Source: APXvYqzxHxaRuMdUOpirDbxlu6O7CZTwQcHbagY2hqmKMRYIFee7xM75OZKqrqWXppLtusxqsNKMfw==
X-Received: by 2002:a17:902:124:: with SMTP id
 33mr9649294plb.145.1562913396860; 
 Thu, 11 Jul 2019 23:36:36 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id z19sm6610488pgv.35.2019.07.11.23.36.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 11 Jul 2019 23:36:36 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.2 v2 5/7] ARM: dts: nuvoton: nuvoton-npcm750-runbmc: Add
 i2c IOExpand nodes
Date: Fri, 12 Jul 2019 14:35:10 +0800
Message-Id: <20190712063511.96268-5-chyishian.jiang@gmail.com>
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

update nuvoton-npcm750-runbmc i2c nodes which define gpios outside
RunBMC module

Signed-off-by: Samuel Jiang <Samuel.Jiang@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts | 404 +++++++++++++++++++
 1 file changed, 404 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
index e46015c56d24..35ce793d0238 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -624,6 +624,410 @@
 	};
 };
 
+/* external io expander */
+
+&i2c10 {
+	gpio: pca9555@4e {
+		compatible = "nxp,pca9555";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&i2c11 {
+	pca9539_g1a: pca9539-g1a@74 {
+		compatible = "nxp,pca9539";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		reset-gpios = <&gpio7 4 GPIO_ACTIVE_LOW>;
+		G1A_P0_0 {
+			gpio-hog;
+			gpios = <0 0>;
+			output-high;
+			line-name = "TPM_BMC_ALERT_N";
+		};
+		G1A_P0_1 {
+			gpio-hog;
+			gpios = <1 0>;
+			input;
+			line-name = "FM_BIOS_TOP_SWAP";
+		};
+		G1A_P0_2 {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "FM_BIOS_PREFRB2_GOOD";
+		};
+		G1A_P0_3 {
+			gpio-hog;
+			gpios = <3 0>;
+			input;
+			line-name = "BMC_SATAXPCIE_0TO3_SEL";
+		};
+		G1A_P0_4 {
+			gpio-hog;
+			gpios = <4 0>;
+			input;
+			line-name = "BMC_SATAXPCIE_4TO7_SEL";
+		};
+		G1A_P0_5 {
+			gpio-hog;
+			gpios = <5 0>;
+			output-low;
+			line-name = "FM_UV_ADR_TRIGGER_EN_N";
+		};
+		G1A_P0_6 {
+			gpio-hog;
+			gpios = <6 0>;
+			input;
+			line-name = "RM_THROTTLE_EN_N";
+		};
+		G1A_P1_0 {
+			gpio-hog;
+			gpios = <8 0>;
+			input;
+			line-name = "FM_BMC_TPM_PRES_N";
+		};
+		G1A_P1_1 {
+			gpio-hog;
+			gpios = <9 0>;
+			input;
+			line-name = "FM_CPU0_SKTOCC_LVT3_N";
+		};
+		G1A_P1_2 {
+			gpio-hog;
+			gpios = <10 0>;
+			input;
+			line-name = "FM_CPU1_SKTOCC_LVT3_N";
+		};
+		G1A_P1_3 {
+			gpio-hog;
+			gpios = <11 0>;
+			input;
+			line-name = "PSU1_ALERT_N";
+		};
+		G1A_P1_4 {
+			gpio-hog;
+			gpios = <12 0>;
+			input;
+			line-name = "PSU2_ALERT_N";
+		};
+		G1A_P1_5 {
+			gpio-hog;
+			gpios = <13 0>;
+			input;
+			line-name = "H_CPU0_FAST_WAKE_LVT3_N";
+		};
+		G1A_P1_6 {
+			gpio-hog;
+			gpios = <14 0>;
+			output-high;
+			line-name = "I2C_MUX1_RESET_N";
+		};
+		G1A_P1_7 {
+			gpio-hog;
+			gpios = <15 0>;
+			input;
+			line-name = "FM_CPU_CATERR_LVT3_N";
+		};
+	};
+	pca9539_g1b: pca9539-g1b@75 {
+		compatible = "nxp,pca9539";
+		reg = <0x75>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		G1B_P0_0 {
+			gpio-hog;
+			gpios = <0 0>;
+			input;
+			line-name = "PVDDQ_ABC_PINALERT_N";
+		};
+		G1B_P0_1 {
+			gpio-hog;
+			gpios = <1 0>;
+			input;
+			line-name = "PVDDQ_DEF_PINALERT_N";
+		};
+		G1B_P0_2 {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "PVDDQ_GHJ_PINALERT_N";
+		};
+		G1B_P0_3 {
+			gpio-hog;
+			gpios = <3 0>;
+			input;
+			line-name = "PVDDQ_KLM_PINALERT_N";
+		};
+		G1B_P0_5 {
+			gpio-hog;
+			gpios = <5 0>;
+			input;
+			line-name = "FM_BOARD_REV_ID0";
+		};
+		G1B_P0_6 {
+			gpio-hog;
+			gpios = <6 0>;
+			input;
+			line-name = "FM_BOARD_REV_ID1";
+		};
+		G1B_P0_7 {
+			gpio-hog;
+			gpios = <7 0>;
+			input;
+			line-name = "FM_BOARD_REV_ID2";
+		};
+		G1B_P1_0 {
+			gpio-hog;
+			gpios = <8 0>;
+			input;
+			line-name = "FM_OC_DETECT_EN_N";
+		};
+		G1B_P1_1 {
+			gpio-hog;
+			gpios = <9 0>;
+			input;
+			line-name = "FM_FLASH_DESC_OVERRIDE";
+		};
+		G1B_P1_2 {
+			gpio-hog;
+			gpios = <10 0>;
+			output-low;
+			line-name = "FP_PWR_ID_LED_N";
+		};
+		G1B_P1_3 {
+			gpio-hog;
+			gpios = <11 0>;
+			output-low;
+			line-name = "BMC_LED_PWR_GRN";
+		};
+		G1B_P1_4 {
+			gpio-hog;
+			gpios = <12 0>;
+			output-low;
+			line-name = "BMC_LED_PWR_AMBER";
+		};
+		G1B_P1_5 {
+			gpio-hog;
+			gpios = <13 0>;
+			output-high;
+			line-name = "FM_BMC_FAULT_LED_N";
+		};
+		G1B_P1_6 {
+			gpio-hog;
+			gpios = <14 0>;
+			output-high;
+			line-name = "FM_CPLD_BMC_PWRDN_N";
+		};
+		G1B_P1_7 {
+			gpio-hog;
+			gpios = <15 0>;
+			output-high;
+			line-name = "BMC_LED_CATERR_N";
+		};
+	};
+};
+
+&i2c12 {
+	pca9539_g2a: pca9539-g2a@74 {
+		compatible = "nxp,pca9539";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		reset-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;
+		G2A_P0_0 {
+			gpio-hog;
+			gpios = <0 0>;
+			output-high;
+			line-name = "BMC_PON_RST_REQ_N";
+		};
+		G2A_P0_1 {
+			gpio-hog;
+			gpios = <1 0>;
+			output-high;
+			line-name = "BMC_RST_IND_REQ_N";
+		};
+		G2A_P0_2 {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "RST_BMC_RTCRST";
+		};
+		G2A_P0_3 {
+			gpio-hog;
+			gpios = <3 0>;
+			output-high;
+			line-name = "FM_BMC_PWRBTN_OUT_N";
+		};
+		G2A_P0_4 {
+			gpio-hog;
+			gpios = <4 0>;
+			output-high;
+			line-name = "RST_BMC_SYSRST_BTN_OUT_N";
+		};
+		G2A_P0_5 {
+			gpio-hog;
+			gpios = <5 0>;
+			output-high;
+			line-name = "FM_BATTERY_SENSE_EN_N";
+		};
+		G2A_P0_6 {
+			gpio-hog;
+			gpios = <6 0>;
+			output-high;
+			line-name = "FM_BMC_READY_N";
+		};
+		G2A_P0_7 {
+			gpio-hog;
+			gpios = <7 0>;
+			input;
+			line-name = "IRQ_BMC_PCH_SMI_LPC_N";
+		};
+		G2A_P1_0 {
+			gpio-hog;
+			gpios = <8 0>;
+			input;
+			line-name = "FM_SLOT4_CFG0";
+		};
+		G2A_P1_1 {
+			gpio-hog;
+			gpios = <9 0>;
+			input;
+			line-name = "FM_SLOT4_CFG1";
+		};
+		G2A_P1_2 {
+			gpio-hog;
+			gpios = <10 0>;
+			input;
+			line-name = "FM_NVDIMM_EVENT_N";
+		};
+		G2A_P1_3 {
+			gpio-hog;
+			gpios = <11 0>;
+			input;
+			line-name = "PSU1_BLADE_EN_N";
+		};
+		G2A_P1_4 {
+			gpio-hog;
+			gpios = <12 0>;
+			input;
+			line-name = "BMC_PCH_FNM";
+		};
+		G2A_P1_5 {
+			gpio-hog;
+			gpios = <13 0>;
+			input;
+			line-name = "FM_SOL_UART_CH_SEL";
+		};
+		G2A_P1_6 {
+			gpio-hog;
+			gpios = <14 0>;
+			input;
+			line-name = "FM_BIOS_POST_CMPLT_N";
+		};
+	};
+
+	pca9539_g2b: pca9539-g2b@75 {
+		compatible = "nxp,pca9539";
+		reg = <0x75>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		G2B_P0_0 {
+			gpio-hog;
+			gpios = <0 0>;
+			input;
+			line-name = "FM_CPU_MSMI_LVT3_N";
+		};
+		G2B_P0_1 {
+			gpio-hog;
+			gpios = <1 0>;
+			input;
+			line-name = "FM_BIOS_MRC_DEBUG_MSG_DIS";
+		};
+		G2B_P0_2 {
+			gpio-hog;
+			gpios = <2 0>;
+			input;
+			line-name = "FM_CPU1_DISABLE_BMC_N";
+		};
+		G2B_P0_3 {
+			gpio-hog;
+			gpios = <3 0>;
+			output-low;
+			line-name = "BMC_JTAG_SELECT";
+		};
+		G2B_P0_4 {
+			gpio-hog;
+			gpios = <4 0>;
+			output-high;
+			line-name = "PECI_MUX_SELECT";
+		};
+		G2B_P0_5 {
+			gpio-hog;
+			gpios = <5 0>;
+			output-high;
+			line-name = "I2C_MUX2_RESET_N";
+		};
+		G2B_P0_6 {
+			gpio-hog;
+			gpios = <6 0>;
+			input;
+			line-name = "FM_BMC_CPLD_PSU2_ON";
+		};
+		G2B_P0_7 {
+			gpio-hog;
+			gpios = <7 0>;
+			output-high;
+			line-name = "PSU2_ALERT_EN_N";
+		};
+		G2B_P1_0 {
+			gpio-hog;
+			gpios = <8 0>;
+			output-high;
+			line-name = "FM_CPU_BMC_INIT";
+		};
+		G2B_P1_1 {
+			gpio-hog;
+			gpios = <9 0>;
+			output-high;
+			line-name = "IRQ_BMC_PCH_SCI_LPC_N";
+		};
+		G2B_P1_2 {
+			gpio-hog;
+			gpios = <10 0>;
+			output-low;
+			line-name = "PMB_ALERT_EN_N";
+		};
+		G2B_P1_3 {
+			gpio-hog;
+			gpios = <11 0>;
+			output-high;
+			line-name = "FM_FAST_PROCHOT_EN_N";
+		};
+		G2B_P1_4 {
+			gpio-hog;
+			gpios = <12 0>;
+			output-high;
+			line-name = "BMC_NVDIMM_PRSNT_N";
+		};
+		G2B_P1_5 {
+			gpio-hog;
+			gpios = <13 0>;
+			output-low;
+			line-name = "FM_BACKUP_BIOS_SEL_H_BMC";
+		};
+		G2B_P1_6 {
+			gpio-hog;
+			gpios = <14 0>;
+			output-high;
+			line-name = "FM_PWRBRK_N";
+		};
+	};
+};
+
 &gcr {
 	serial_port_mux: mux-controller {
 	compatible = "mmio-mux";
-- 
2.20.1

