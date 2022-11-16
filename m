Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D074662BB30
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 12:15:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC0p55GrNz3cKb
	for <lists+openbmc@lfdr.de>; Wed, 16 Nov 2022 22:15:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8cMBQRG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=F8cMBQRG;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC0nN66lDz3c8C;
	Wed, 16 Nov 2022 22:14:47 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id b21so16109101plc.9;
        Wed, 16 Nov 2022 03:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nyC+yDLSk48NJUeZiMOPIOe4ZUnpBcxh3+f3W/dMNhk=;
        b=F8cMBQRGmA7UbL/PbV3eIPwM+8lhBL3rkfuqTpNMjpbaBWgDF7PTr++FdWTUw9krKg
         KI4GEjGZk5QUGvDFGED9XEwDhm8xRb1X5KhVf2C7GCTC2/YDz/8rvX4nTLmKutT5c5jk
         1XrWaFRBgdQvVUhB/1Qe+3cnQIlIoJNYDhmTLiK7VjCjspEvgzNBP21iQ5aN65Yva2e6
         T9jvHyQn9I5tRE/u3pJuKdw8f/s2hoNPlReiYFF9s36gZ1hapteOeg4JgN24PD/DGu/4
         U0DghUrKY0x3mhfFZWP4nt7ykYBajM0IeM6OWeL3ZSX+9p0YGT/7P1tPA4pvmt3VMiJ7
         Dm2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyC+yDLSk48NJUeZiMOPIOe4ZUnpBcxh3+f3W/dMNhk=;
        b=hwoEenQs7E8H0I92bLJLd5sur8TXO5in93LG8utOjpQVMzbfbPMTGIezFTfk+7SQtf
         4eEfcc2cL1wqPNvJRxj2NQUTFo0kBmfjC1cafA8qGdV3H30AWY1mvgvkobYhaSjgU9kK
         CuuaP6E8fSLdGeyLC+nAz9zcEpcjeSEsWtrVsFsDJgmXofF23HT/xkhuus6kMxNMjbo3
         Qmc39lNk9Cm1OD4uinwjVfzNiNzHuKqfQASWzhDHPVTSkB2f5diJHi86adS8f0RIKY/v
         jKd2LkjaY0b7dkD4ccHxH8wVuRxNQeJ2ng+O7HPSKCB6cFbPvjTf8jO5Nt46AMEGdAyZ
         6phw==
X-Gm-Message-State: ANoB5pl25MoMpHgMIr5W7YSAqHGhf2iVQFh5w8n5WZrq4JcuEEXXIfk4
	GtuIAV7xORCQYfxJ/ic08jo=
X-Google-Smtp-Source: AA0mqf7w7C3XTM72ib/KnsNNsPX5J+DD22f1WSN/EZuW6n6yMcf+Zifxo6jiMnwqJySegYDIxLfz8A==
X-Received: by 2002:a17:902:ce8b:b0:186:a3a0:601c with SMTP id f11-20020a170902ce8b00b00186a3a0601cmr8419673plg.105.1668597285062;
        Wed, 16 Nov 2022 03:14:45 -0800 (PST)
Received: from hcl-ThinkPad-T495 ([2409:4072:707:8c4c:69fe:3231:5395:4d2f])
        by smtp.gmail.com with ESMTPSA id f21-20020aa79695000000b00561dcfa700asm10594330pfk.107.2022.11.16.03.14.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Nov 2022 03:14:44 -0800 (PST)
Date: Wed, 16 Nov 2022 16:44:35 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: [PATCH v1] ARM: dts: aspeed: Yosemite V2: Add GPIO line names
Message-ID: <20221116111435.GA27359@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Name the GPIOs to help userspace work with them. The names describe
the functionality the lines provide, it makes easier to share
userspace code across different system.

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>

---
--- v1 - Initial draft
---
---
 .../dts/aspeed-bmc-facebook-yosemitev2.dts    | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..f84e2eeb9fd1 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -119,6 +119,47 @@
 			&pinctrl_adc15_default>;
 };
 
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","","","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"","","","","","","","",
+	/*D0-D7*/	"POWER_BUTTON","POWER_OUT1","","POWER_OUT2","","POWER_OUT3","",
+			"POWER_OUT4",
+	/*E0-E7*/	"DEBUG_UART_SEL0","DEBUG_UART_SEL1","DEBUG_UART_SEL2",
+			"DEBUG_UART_RX_SEL_N","","","","",
+	/*F0-F7*/	"","","","","","","","",
+	/*G0-G7*/	"LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2",
+			"LED_POST_CODE_3","","","","",
+	/*H0-H7*/	"","","","","","","","",
+	/*I0-I7*/	"SLOT1_POWER_OK","SLOT2_POWER_OK","SLOT3_POWER_OK","SLOT4_POWER_OK",
+			"","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"","","","","","","","",
+	/*N0-N7*/	"","","I2C_SLOT1","I2C_SLOT2","I2C_SLOT3","I2C_SLOT4","","",
+	/*O0-O7*/	"","","","SELECTOR_BUTTON","SLOT1_POWER","SLOT2_POWER","SLOT3_POWER",
+			"SLOT4_POWER",
+	/*P0-P7*/	"","","","","LED_POST_CODE_4","LED_POST_CODE_5","LED_POST_CODE_6",
+			"LED_POST_CODE_7",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","GPIO_DBG_CARD_PRSNT","","","","",
+	/*S0-S7*/	"RESET_OUT1","RESET_OUT2","RESET_OUT3","RESET_OUT4","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"POST_COMPLETE","POST_COMPLETE2","POST_COMPLETE3","POST_COMPLETE4",
+			"","","","",
+	/*AA0-AA7*/	"","","","","HAND_SW1","HAND_SW2","HAND_SW3","HAND_SW4",
+	/*AB0-AB7*/	"RESET_BUTTON","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 &i2c1 {
 	//Host1 IPMB bus
 	status = "okay";
-- 
2.17.1

