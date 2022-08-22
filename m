Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61459CC61
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 01:44:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBTVZ2tvbz2xjd
	for <lists+openbmc@lfdr.de>; Tue, 23 Aug 2022 09:44:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bh9C60Ti;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=pkarthikeyan1509@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bh9C60Ti;
	dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB3Ff4lZMz305d;
	Mon, 22 Aug 2022 17:02:12 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id w29so3904872pfj.3;
        Mon, 22 Aug 2022 00:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:from:to:cc;
        bh=9hTAXsgJD7aCEY0rX6FQ88fQXTYtB+TZMr3M3hDpDQs=;
        b=Bh9C60Tipnjy4vQntS579AMJ7qus7uhE7WRdika4d6MXyFhZsyhzIMsO4lkmHxDzQN
         0EkhLYKwgtviqmo57z6FZv2v2Gip37RKn5hu+S3cDn1D+ZLDBjBs0hHjab9cKCE7WbNI
         txbd5VNcZdAIbJU9ZaOOwlPJ89Gt2H0Yuy4jYm8F8IDvWn9PHEvI7+/zcAFXRPhCZqGL
         B4C7WWtJwVPVnkHVMTnWcDGsk9SVTODBniCD0XknithZjZfCf9RCIJ2CdAioGR2EEQsB
         1cUgkFFSZLRLDiTayq1eoQlDZpGfzSbSlR31bfo6w4KOk+rzypufZFF4f01IX12PB94v
         fSvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:content-disposition:mime-version:message-id:subject:to
         :from:date:x-gm-message-state:from:to:cc;
        bh=9hTAXsgJD7aCEY0rX6FQ88fQXTYtB+TZMr3M3hDpDQs=;
        b=pE/oZctq9WRTT0DM+e8KwKvmGGYqK4BnIMKcHv3vXdYXxZYcL60vPLbOPxS35pZ9UW
         h88ADaMhP5qVOrM4tHY0/+sFs/hta0Nrq+axlrpyYPaEXrv8Jg4QXppli2ELZ9wvpuLk
         Eo62VuNcKN5nQLbuXFvfpLka1Fu6bsMMASPuqdWfsRT6UB42oeMnmiPXs3fA4HsMygFt
         0gO/UhFhOfNF21TVT1e4hCtiAoLCmL2RU3+sXs8aIk2VeKDa/MPI3Gp+fR621iLPiRYD
         sE0tijq3QLWPOGztdk5920f7yK7C5uGVNmlcnx8lIzhhCXPLT7fW4OZvUP0l0RENtDjC
         ymTA==
X-Gm-Message-State: ACgBeo2QvqTPKKp/rwzvQICAJ6RqEbF03/ZRQ92bxDGnEif0jPoiUeZK
	nM9msAUA0tpTEHXGeeQtGJ8=
X-Google-Smtp-Source: AA6agR7U3qFwf7orYVDL/jYnFH1t9Vxflu/2FRsdQF9Y1so78REeNwwZ0D5NjlnvNiAYID8EU666iw==
X-Received: by 2002:a63:5f49:0:b0:41d:85a1:c4da with SMTP id t70-20020a635f49000000b0041d85a1c4damr15897132pgb.366.1661151729430;
        Mon, 22 Aug 2022 00:02:09 -0700 (PDT)
Received: from hcl-ThinkPad-T495 ([2401:4900:1ce3:34a6:18fb:c516:b109:2b8d])
        by smtp.gmail.com with ESMTPSA id x128-20020a626386000000b00535ffd27552sm6098788pfb.51.2022.08.22.00.02.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Aug 2022 00:02:09 -0700 (PDT)
Date: Mon, 22 Aug 2022 12:32:04 +0530
From: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH v1] ARM: dts: aspeed: Update for Facebook Yosemite V2 BMC
Message-ID: <20220822070204.GA6110@hcl-ThinkPad-T495>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Tue, 23 Aug 2022 09:39:56 +1000
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

This patch includes the following updates for Yosemite V2
BMC.

1) Updated GPIO configuration for power control.
2) Added IPMB-13 channel for Debug Card communication.
3) Removed EEPROM driver IPMB-12 channel and keeping it as
   "status ok".

Signed-off-by: Karthikeyan Pasupathi <pkarthikeyan1509@gmail.com>
---
 .../dts/aspeed-bmc-facebook-yosemitev2.dts    | 49 +++++++++++++++++--
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
index 8864e9c312a8..4d2ff7eb6740 100644
--- a/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-facebook-yosemitev2.dts
@@ -119,6 +119,40 @@
 			&pinctrl_adc15_default>;
 };
 
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/   "","","","","","","","",
+	/*B0-B7*/   "","","","","","","","",
+	/*C0-C7*/   "","","","","","","","",
+	/*D0-D7*/   "POWER_BUTTON","POWER_OUT1","","POWER_OUT2","","POWER_OUT3","","POWER_OUT4",
+	/*E0-E7*/   "DEBUG_UART_SEL0","DEBUG_UART_SEL1","DEBUG_UART_SEL2","DEBUG_UART_RX_SEL_N","","","","",
+	/*F0-F7*/   "","","","","","","","",
+	/*G0-G7*/   "LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2","LED_POST_CODE_3","","","","",
+	/*H0-H7*/   "","","","","","","","",
+	/*I0-I7*/   "SLOT1_POWER_OK","SLOT2_POWER_OK","SLOT3_POWER_OK","SLOT4_POWER_OK","","","","",
+	/*J0-J7*/   "","","","","","","","",
+	/*K0-K7*/   "","","","","","","","",
+	/*L0-L7*/   "","","","","","","","",
+	/*M0-M7*/   "","","","","","","","",
+	/*N0-N7*/   "","","I2C_SLOT1","I2C_SLOT2","I2C_SLOT3","I2C_SLOT4","","",
+	/*O0-O7*/   "","","","SELECTOR_BUTTON","SLOT1_POWER","SLOT2_POWER","SLOT3_POWER","SLOT4_POWER",
+	/*P0-P7*/   "","","","","LED_POST_CODE_4","LED_POST_CODE_5","LED_POST_CODE_6","LED_POST_CODE_7",
+	/*Q0-Q7*/   "","","","","","","","",
+	/*R0-R7*/   "","","","GPIO_DBG_CARD_PRSNT","","","","",
+	/*S0-S7*/   "RESET_OUT1","RESET_OUT2","RESET_OUT3","RESET_OUT4","","","","",
+	/*T0-T7*/   "","","","","","","","",
+	/*U0-U7*/   "","","","","","","","",
+	/*V0-V7*/   "","","","","","","","",
+	/*W0-W7*/   "","","","","","","","",
+	/*X0-X7*/   "","","","","","","","",
+	/*Y0-Y7*/   "","","","","","","","",
+	/*Z0-Z7*/   "POST_COMPLETE","POST_COMPLETE2","POST_COMPLETE3","POST_COMPLETE4","","","","",
+	/*AA0-AA7*/ "","","","","HAND_SW1","HAND_SW2","HAND_SW3","HAND_SW4",
+	/*AB0-AB7*/ "RESET_BUTTON","","","","","","","",
+		/*AC0-AC7*/ "","","","","","","","";
+};
+
 &i2c1 {
 	//Host1 IPMB bus
 	status = "okay";
@@ -207,11 +241,16 @@
 
 &i2c12 {
 	status = "okay";
-	//MEZZ_FRU
-	eeprom@51 {
-		compatible = "atmel,24c64";
-		reg = <0x51>;
-		pagesize = <32>;
+};
+
+&i2c13 {
+	status = "okay";
+	// Debug Card
+	multi-master;
+	ipmb13@10 {
+		compatible = "ipmb-dev";
+		reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
+		i2c-protocol;
 	};
 };
 
-- 
2.17.1

