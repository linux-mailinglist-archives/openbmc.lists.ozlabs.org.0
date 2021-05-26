Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7387939165F
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 13:41:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fqpth4K3mz2ysw
	for <lists+openbmc@lfdr.de>; Wed, 26 May 2021 21:41:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EGpnAGZ0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EGpnAGZ0; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fqpsx0VRdz2yRD
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 21:40:36 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id 22so696846pfv.11
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zxXE0hg/WIyahr2TJoaZs7y30FWXJ/NbfRBjsixBd0s=;
 b=EGpnAGZ02AX/sGqbyu22pB30ioWI4C2RXsD8nwfO9OrX531tWMQCGwXlom0x8O5Y8Q
 /110B6yavfsvcA7C+1rd3injPtXPqgDIE63UbaUpzgI9Fv/qPuvTReO3UeJkb+tqSAuc
 3V0DA7R6YUaj8/UMOdiDmp2fZG6LPRm0n2ZxvC24wl93m0GPnewxohQpVL5muzjmyWXI
 WmUaZeJJ8PvLf3wvAhA2Z6oncKnqlNnS6NpP6Z/rRpFRjwFQQkno0xnxUjAxhZ1IpdDG
 kuWVDyKPN//OefiCc2i7+XVn9KJWumn4eJC1ZaNUtfXS8q7KwfE0s6mB5ZFjWa8cMVUi
 Lw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zxXE0hg/WIyahr2TJoaZs7y30FWXJ/NbfRBjsixBd0s=;
 b=CuhpvRAlzaqhASnektYVyeuNWjymCwGtlbF2gGVy4LXyr+SXKIrGCWYpHMDgNnypr2
 FbnDNUoQ/BlyVMpYzC0L3YLiES8naOhZiIt9kL4UYZ9fqYlH87PegpTQXyAFoRhdpEr4
 9jSTZTxwBDE98M13vwx9f0W92YlQr3w5FYa6qevhDewrOtPRYxPdnBRGvr0H5G2Dy4a8
 K0pyICf6qeGlO4F2yevH30uOOGRucsdjtJwNwQcj6BpeF4R/lURVvCkHToYSUbsWG01D
 bNmeC6HturzjOILNZDfNz8kJelqU7a0/ZJ53UWRnTEkfMI6kJK2GhDhMGJZRgif2Rilz
 45iA==
X-Gm-Message-State: AOAM5301tDQLO89U9UAwROV7wHlwq8vw2K/xVTl0TuTAaMJDk1/EBaBv
 1suIr2PdIJQWthNlQwU+aUE=
X-Google-Smtp-Source: ABdhPJzKJdc47pfn7yJH3uC+MpwHOct0cevRIAZhldcahgI2TSPMdz5CKVgxHwN1vOKWAU0KWfDrbQ==
X-Received: by 2002:a63:5511:: with SMTP id j17mr24967171pgb.191.1622029234387; 
 Wed, 26 May 2021 04:40:34 -0700 (PDT)
Received: from george-Quanta.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id s14sm17124805pfs.108.2021.05.26.04.40.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 May 2021 04:40:34 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1 1/3] ARM: dts: nuvoton: gbs: fix pca9535 and GPIO
 node naming
Date: Wed, 26 May 2021 19:30:59 +0800
Message-Id: <20210526113101.7457-2-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20210526113101.7457-1-george.hung@quantatw.com>
References: <20210526113101.7457-1-george.hung@quantatw.com>
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
Cc: kwliu@nuvoton.com, yschu@nuvoton.com, Fran.Hsu@quantatw.com,
 benjaminfair@google.com, openbmc@lists.ozlabs.org, brandonkim@google.com,
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

- use the same node name for all the pca9535 nodes
- convert the gpio nodes to phandle

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 182 +++++++++++-----------
 1 file changed, 94 insertions(+), 88 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 24fae0e4f454..fe2836d220b9 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -623,14 +623,14 @@
 	clock-frequency = <100000>;
 	status = "okay";
 
-	pca9535_ifdet: pca9535-ifdet@24 {
+	pca9535_ifdet: pca9535@24 {
 		compatible = "nxp,pca9535";
 		reg = <0x24>;
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	pca9535_pwren: pca9535-pwren@20 {
+	pca9535_pwren: pca9535@20 {
 		compatible = "nxp,pca9535";
 		reg = <0x20>;
 		gpio-controller;
@@ -647,14 +647,14 @@
 			"pwr_u2_13_en","pwr_u2_12_en";
 	};
 
-	pca9535_pwrgd: pca9535-pwrgd@21 {
+	pca9535_pwrgd: pca9535@21 {
 		compatible = "nxp,pca9535";
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
 
-	pca9535_ledlocate: pca9535-ledlocate@22 {
+	pca9535_ledlocate: pca9535@22 {
 		compatible = "nxp,pca9535";
 		reg = <0x22>;
 		gpio-controller;
@@ -662,7 +662,7 @@
 
 	};
 
-	pca9535_ledfault: pca9535-ledfault@23 {
+	pca9535_ledfault: pca9535@23 {
 		compatible = "nxp,pca9535";
 		reg = <0x23>;
 		gpio-controller;
@@ -670,7 +670,7 @@
 
 	};
 
-	pca9535_pwrdisable: pca9535-pwrdisable@25 {
+	pca9535_pwrdisable: pca9535@25 {
 		compatible = "nxp,pca9535";
 		reg = <0x25>;
 		gpio-controller;
@@ -687,7 +687,7 @@
 			"u2_13_pwr_dis","u2_12_pwr_dis";
 	};
 
-	pca9535_perst: pca9535-perst@26 {
+	pca9535_perst: pca9535@26 {
 		compatible = "nxp,pca9535";
 		reg = <0x26>;
 		gpio-controller;
@@ -1086,94 +1086,100 @@
 	};
 };
 
-&pinctrl {
-	pinctrl-names = "default";
+&gpio0 {
+	/* POWER_OUT=gpio07, RESET_OUT=gpio06, PS_PWROK=gpio13 */
+	gpio-line-names =
+	/*0-31*/
+	"","","","","","","RESET_OUT","POWER_OUT",
+	"","","","","","PS_PWROK","","",
+	"","","","","","","","",
+	"","","","","","","","";
+};
 
-	gpio0: gpio@f0010000 {
-		/* POWER_OUT=gpio07, RESET_OUT=gpio06, PS_PWROK=gpio13 */
-		gpio-line-names =
-		/*0-31*/
-		"","","","","","","RESET_OUT","POWER_OUT",
-		"","","","","","PS_PWROK","","",
-		"","","","","","","","",
-		"","","","","","","","";
-	};
-	gpio1: gpio@f0011000 {
-		/* SIO_POWER_GOOD=gpio59 */
-		gpio-line-names =
-		/*32-63*/
-		"","","","","","","","",
-		"","","","","","","","",
-		"","","","","","","","",
-		"","","","SIO_POWER_GOOD","","","","";
+&gpio1 {
+	/* SIO_POWER_GOOD=gpio59 */
+	gpio-line-names =
+	/*32-63*/
+	"","","","","","","","",
+	"","","","","","","","",
+	"","","","","","","","",
+	"","","","SIO_POWER_GOOD","","","","";
+};
+
+&gpio2 {
+	bmc_usb_mux_oe_n {
+		gpio-hog;
+		gpios = <25 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "bmc-usb-mux-oe-n";
 	};
-	gpio2: gpio@f0012000 {
-		bmc_usb_mux_oe_n {
-			gpio-hog;
-			gpios = <25 GPIO_ACTIVE_HIGH>;
-			output-low;
-			line-name = "bmc-usb-mux-oe-n";
-		};
-		bmc_usb_mux_sel {
-			gpio-hog;
-			gpios = <26 GPIO_ACTIVE_HIGH>;
-			output-low;
-			line-name = "bmc-usb-mux-sel";
-		};
-		bmc_usb2517_reset_n {
-			gpio-hog;
-			gpios = <27 GPIO_ACTIVE_LOW>;
-			output-low;
-			line-name = "bmc-usb2517-reset-n";
-		};
+	bmc_usb_mux_sel {
+		gpio-hog;
+		gpios = <26 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "bmc-usb-mux-sel";
 	};
-	gpio3: gpio@f0013000 {
-		assert_cpu0_reset {
-			gpio-hog;
-			gpios = <14 GPIO_ACTIVE_HIGH>;
-			output-low;
-			line-name = "assert-cpu0-reset";
-		};
-		assert_pwrok_cpu0_n {
-			gpio-hog;
-			gpios = <15 GPIO_ACTIVE_HIGH>;
-			output-low;
-			line-name = "assert-pwrok-cpu0-n";
-		};
-		assert_cpu0_prochot {
-			gpio-hog;
-			gpios = <16 GPIO_ACTIVE_HIGH>;
-			output-low;
-			line-name = "assert-cpu0-prochot";
-		};
+	bmc_usb2517_reset_n {
+		gpio-hog;
+		gpios = <27 GPIO_ACTIVE_LOW>;
+		output-low;
+		line-name = "bmc-usb2517-reset-n";
 	};
-	gpio4: gpio@f0014000 {
-		/* POST_COMPLETE=gpio143 */
-		gpio-line-names =
-			/*128-159*/
-			"","","","","","","","",
-			"","","","","","","","POST_COMPLETE",
-			"","","","","","","","",
-			"","","","","","","","";
+};
+
+&gpio3 {
+	assert_cpu0_reset {
+		gpio-hog;
+		gpios = <14 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "assert-cpu0-reset";
 	};
-	gpio5: gpio@f0015000 {
-		/* POWER_BUTTON=gpio177 */
-		gpio-line-names =
-			/*160-191*/
-			"","","","","","","","",
-			"","","","","","","","",
-			"","POWER_BUTTON","","","","","","",
-			"","","","","","","","";
+	assert_pwrok_cpu0_n {
+		gpio-hog;
+		gpios = <15 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "assert-pwrok-cpu0-n";
 	};
-	gpio6: gpio@f0016000 {
-		/* SIO_S5=gpio199, RESET_BUTTON=gpio203 */
-		gpio-line-names =
-			/*192-223*/
-			"","","","","","","","SIO_S5",
-			"","","","RESET_BUTTON","","","","",
-			"","","","","","","","",
-			"","","","","","","","";
+	assert_cpu0_prochot {
+		gpio-hog;
+		gpios = <16 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "assert-cpu0-prochot";
 	};
+};
+
+&gpio4 {
+	/* POST_COMPLETE=gpio143 */
+	gpio-line-names =
+	/*128-159*/
+	"","","","","","","","",
+	"","","","","","","","POST_COMPLETE",
+	"","","","","","","","",
+	"","","","","","","","";
+};
+
+&gpio5 {
+	/* POWER_BUTTON=gpio177 */
+	gpio-line-names =
+	/*160-191*/
+	"","","","","","","","",
+	"","","","","","","","",
+	"","POWER_BUTTON","","","","","","",
+	"","","","","","","","";
+};
+
+&gpio6 {
+	/* SIO_S5=gpio199, RESET_BUTTON=gpio203 */
+	gpio-line-names =
+	/*192-223*/
+	"","","","","","","","SIO_S5",
+	"","","","RESET_BUTTON","","","","",
+	"","","","","","","","",
+	"","","","","","","","";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
 
 	gpio224ol_pins: gpio224ol-pins {
 		pins = "GPIO224/SPIXCK";
-- 
2.21.0

