Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F05B475
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 08:05:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccKt6b4TzDqT6
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 16:05:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com;
 envelope-from=chyishian.jiang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OJuW9HO5"; 
 dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccGg3BvszDqT3
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 16:02:35 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id f25so5465725pgv.10
 for <openbmc@lists.ozlabs.org>; Sun, 30 Jun 2019 23:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDPAcR1zduQ27e/kISjjMCyl0sRFfQegmkmJ2b+MIJw=;
 b=OJuW9HO56HZDfirOeL2e3M/DzYiELzBAWBcCXZAMKwRO81ky4TNbE5ZrjlL8JoKUFe
 ozN3qfvr3udPku2QATztgwjOsfBR8tJnyRTR2XFncxLpjz3qzFEJrJgcCjVhkLjRy04T
 QCto6oFQH/EiociUgXI7GqqhzcNLuzctQ4CIKD8Y3VJhgbkqfV55LWdh1M7u8F2L9A18
 Kt4SBcrhnBsCC0NzSxOzg/tjQxBnuOhGXQCpGMcvuQtH/0QBGJD0PF9k0lFWNu+Yk6FU
 DcxNdO8kY4dF+EcoFepoTXPnTPBtcYcZyFfzPEBcwOzpGeaGAiAvftmZMTQxvkEbH2Cw
 OaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SDPAcR1zduQ27e/kISjjMCyl0sRFfQegmkmJ2b+MIJw=;
 b=XxYGI3LMQ9joR/pQKGRG1gXM9JUoFsbiwwgbmu+Kbsi6n3rnL/bGZCeeiNFNvXxPII
 BpiOB1bVjn7vqcn1f9YGpuZgSHVr5s5TacN/x8HBLDG/q6BRu/0WMIUtDqD0e7NCOaqd
 T8M5s7RlL0kAA/7wGssw7CoAX9zWV1gWyRfP2hgFN+zHcxfantqwqO5zXqrnFnxPsHj1
 FB6T3DAQdVeb6w6s2GV9nBQsZB1a2duvNC01eZ4gKJOnukI7Mmbr5voYIhdQYE9RA52j
 CYtjK9dqWZRx61kamSuUQf80NY7qBdmcWfuBny8OUAQV3guLbjOUMgrqYBfGZJiUEVGG
 JtLA==
X-Gm-Message-State: APjAAAUSQAlNWM95Rd/pqpKZ0mBmNrMM55ThgnGPgIdZ+4Eyzq5s24hQ
 1WuHf2+lIk0TtGCAopTyK7A=
X-Google-Smtp-Source: APXvYqyO9bXIMorLkYnkxfbKRAlMsnl3hbYXHAymJZT6qbBFusc2OiJdo1sPgNmJt1s1HC7yZKTqWQ==
X-Received: by 2002:a63:7a4f:: with SMTP id j15mr23448665pgn.427.1561960952509; 
 Sun, 30 Jun 2019 23:02:32 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id w14sm8672127pfn.47.2019.06.30.23.02.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 30 Jun 2019 23:02:31 -0700 (PDT)
From: Samuel Jiang <chyishian.jiang@gmail.com>
To: joel@jms.id.au,
	tomer.maimon@nuvoton.com,
	KWLIU@nuvoton.com
Subject: [PATCH dev-5.17 v1 4/6] ARM: dts: nuvoton: nuvoton-npcm750-runbmc:
 Add i2c IOExpand nodes
Date: Mon,  1 Jul 2019 14:01:35 +0800
Message-Id: <20190701060137.22116-4-chyishian.jiang@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190701060137.22116-1-chyishian.jiang@gmail.com>
References: <20190701060137.22116-1-chyishian.jiang@gmail.com>
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
index b7d3b4d83f0d..71501ccbef18 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-runbmc.dts
@@ -577,6 +577,410 @@
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
+			output-low;
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

