Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D92AF330
	for <lists+openbmc@lfdr.de>; Wed, 11 Nov 2020 15:12:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWRWN6y82zDqvZ
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 01:12:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z8OQ/p10; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQvl6y2mzDqLf
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 00:44:51 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id q19so2115887ljc.10
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 05:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9r8b49v3ljRgTZvFAK4d4bWtQHAXArk3oNTb3u4fiLk=;
 b=Z8OQ/p10vRcXuUv1lZLBi8ghU5FtBvkX662Iv+VOPOsf+9Z4VSmtjS9EroUOkkjVAr
 OGIwnRa1mxQAK3Lj82n0wqakh4vZLDOdFOqDHSJAnFcp8dJo8Gc/n58qjhyRpwROZNnm
 dYJb4crN7NHz7CzQSlLYdMEeVcLJmUG5zZoNzaUhIKd+T8IU8T5ds9jmdaQmPnBcRp+3
 d0A+xLFxRkOFEcCHApQSJKcwBG4yIeNij2oQ2ET579IQCQhI7JimmFwW5t7Aw6LogrKS
 i8tgxrn9TZVjU4sqJ08IjnQOC1s9gOu0q0tn0EbU5uYVlUFcQEcMnUuXWWfDWOoaxtDk
 NcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9r8b49v3ljRgTZvFAK4d4bWtQHAXArk3oNTb3u4fiLk=;
 b=msHd6kXkHwu3EDHetRrkqexSVC4A5Z/CUBDiFbL4eN6FoPJcB01iVjrFxaCm9r+mtx
 7e+Ao4jt6zzTKN9Px4pG0zlVG3lChAmJMg/jge3F/cmcq5plNpovdsnxDT5IVFQ9CMwl
 p1I+focG80rodPRhPqhfeo123srD6/8NT2y2vrw0R7FLK4ITufsPs0lwaNW2SqQRcpqY
 Xxt2dxt5MyZxdtebnrpHDpzk68hvr1ctsaRvob1SCAtCWtw98CN+bI7zdSVqshz6lcGH
 vqla1/3IJaTDz/nxsgoeoHqTguXpVqU5lLhrM1QIq5WeVJRu6Y0FGrQHxA8MRdY/4Smt
 WNbQ==
X-Gm-Message-State: AOAM533MRo3mheQlhe+PcaWYBvU/xzEa2RnO1EDxT3d+7EByDvzGVv8f
 AiQpPWDDXAAabXiLuduyMdY=
X-Google-Smtp-Source: ABdhPJz5c4O99IUjeNzGUHShp+0jdw70g4bgGOTl2nyt+r1vIqeNJBABtEndRoZP7oybNME2mrHjSw==
X-Received: by 2002:a05:651c:11cd:: with SMTP id
 z13mr7371892ljo.65.1605102287192; 
 Wed, 11 Nov 2020 05:44:47 -0800 (PST)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id q191sm239916ljb.139.2020.11.11.05.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:44:46 -0800 (PST)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 3/3] ARM: dts: aspeed: amd-ethanolx: Add GPIO
 line names
Date: Wed, 11 Nov 2020 16:44:27 +0300
Message-Id: <20201111134427.1579-3-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201111134427.1579-1-aladyshev22@gmail.com>
References: <20201111134427.1579-1-aladyshev22@gmail.com>
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
Cc: Konstantin Aladyshev <aladyshev22@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add GPIO line names for AMD EthanolX customer reference board.
It populates AST2500 GPIO lines (A0-A7 to AC0-AC7) with AMD EthanolX
designated names.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index b93ed44eba0c..96ff0aea64e5 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -97,6 +97,50 @@
 		     &pinctrl_adc4_default>;
 };
 
+&gpio {
+	status = "okay";
+	gpio-line-names =
+	/*A0-A7*/	"","","FAULT_LED","CHASSIS_ID_LED","","","","",
+	/*B0-B7*/	"","","","","","","","",
+	/*C0-C7*/	"CHASSIS_ID_BTN","INTRUDER","AC_LOSS","","","","","",
+	/*D0-D7*/	"HDT_DBREQ","LOCAL_SPI_ROM_SEL","FPGA_SPI_ROM_SEL","JTAG_MUX_S",
+			"JTAG_MUX_OE","HDT_SEL","ASERT_WARM_RST_BTN","FPGA_RSVD",
+	/*E0-E7*/	"","","MON_P0_PWR_BTN","MON_P0_RST_BTN","MON_P0_NMI_BTN",
+			"MON_P0_PWR_GOOD","MON_PWROK","MON_RESET",
+	/*F0-F7*/	"MON_P0_PROCHOT","MON_P1_PROCHOT","MON_P0_THERMTRIP",
+			"MON_P1_THERMTRIP","P0_PRESENT","P1_PRESENT","MON_ATX_PWR_OK","",
+	/*G0-G7*/	"BRD_REV_ID_3","BRD_REV_ID_2","BRD_REV_ID_1","BRD_REV_ID_0",
+			"P0_APML_ALERT","P1_APML_ALERT","FPGA ALERT","",
+	/*H0-H7*/	"BRD_ID_0","BRD_ID_1","BRD_ID_2","BRD_ID_3",
+			"PCIE_DISCONNECTED","USB_DISCONNECTED","SPARE_0","SPARE_1",
+	/*I0-I7*/	"","","","","","","","",
+	/*J0-J7*/	"","","","","","","","",
+	/*K0-K7*/	"","","","","","","","",
+	/*L0-L7*/	"","","","","","","","",
+	/*M0-M7*/	"ASSERT_PWR_BTN","ASSERT_RST_BTN","ASSERT_NMI_BTN",
+			"ASSERT_LOCAL_LOCK","ASSERT_P0_PROCHOT","ASSERT_P1_PROCHOT",
+			"ASSERT_CLR_CMOS","ASSERT_BMC_READY",
+	/*N0-N7*/	"","","","","","","","",
+	/*O0-O7*/	"","","","","","","","",
+	/*P0-P7*/	"P0_VDD_CORE_RUN_VRHOT","P0_VDD_SOC_RUN_VRHOT",
+			"P0_VDD_MEM_ABCD_SUS_VRHOT","P0_VDD_MEM_EFGH_SUS_VRHOT",
+			"P1_VDD_CORE_RUN_VRHOT","P1_VDD_SOC_RUN_VRHOT",
+			"P1_VDD_MEM_ABCD_SUS_VRHOT","P1_VDD_MEM_EFGH_SUS_VRHOT",
+	/*Q0-Q7*/	"","","","","","","","",
+	/*R0-R7*/	"","","","","","","","",
+	/*S0-S7*/	"","","","","","","","",
+	/*T0-T7*/	"","","","","","","","",
+	/*U0-U7*/	"","","","","","","","",
+	/*V0-V7*/	"","","","","","","","",
+	/*W0-W7*/	"","","","","","","","",
+	/*X0-X7*/	"","","","","","","","",
+	/*Y0-Y7*/	"","","","","","","","",
+	/*Z0-Z7*/	"","","","","","","","",
+	/*AA0-AA7*/	"","SENSOR THERM","","","","","","",
+	/*AB0-AB7*/	"","","","","","","","",
+	/*AC0-AC7*/	"","","","","","","","";
+};
+
 //APML for P0
 &i2c0 {
 	status = "okay";
-- 
2.17.1

