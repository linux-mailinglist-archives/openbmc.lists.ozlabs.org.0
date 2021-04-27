Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F736C70A
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 15:31:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV2jW5BHgz2yxm
	for <lists+openbmc@lfdr.de>; Tue, 27 Apr 2021 23:31:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NYu9W4Wo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=ghung.quanta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NYu9W4Wo; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV2jH2jlMz2xgJ
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 23:31:28 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so267474pjk.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Apr 2021 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1fPZOSB6GyNqrQqdcwTI6XcCrJqZhoSkLI7iOyNNlY=;
 b=NYu9W4WoyWocEAQBY3RAy6Y9TzN8ZBhzfPPznmYiUVUcz/giit7Caw9YjM894PiFo7
 FGLiy92TcT1ic4hY/1TsIJWAhLbvh5G8Ta7WD/VXJYVc+UAIcwMnEF78DD+qPq8GIf6X
 g6my7iInzczYByntezWjqyY7NMFfeNsdtx0vuNnt2DAvixO0RtaQvQ3swXPz1E3+KMnX
 ERXxPxU45tCoH7U8W2AS/mU18i8gB/HYTbgYW9cm6oExKu3n8aPg0amMaibEM1KFDUj2
 5UwUX16UCvkEmjSnA+zdCPmxZjHFks5M4UB9ZpCzFdX+69Xu2M3IZee+tOHsBqyCQQup
 KLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z1fPZOSB6GyNqrQqdcwTI6XcCrJqZhoSkLI7iOyNNlY=;
 b=Ja79usUecOSNZf4a7s1l/jFpjiFJQv2P8tgCNPSSsx/j3LUd5yvd23ayeeP7GUUmdA
 jewC+XCz7AOGA5OWrJTqcQzQcHgGMq2NxeMZDyRQOhyKdE2ibIQTKxM8ghK/MRiAvCbv
 2FfGXSgzwI26YqUnMnCN12YDGHKyA0A5nUE3jy7kRRDu4VduF5OuiG+mfhuXvfMuHZ9d
 igXXd3i5RiOW9NmXsYDGpYn4g3757NiM77sZp6u+bhVMN86WwwuoDH+dFizQmf4T1eSR
 GN3wv44XTVvmxC7xCn8W1rU0puIh+lAtkqw47mXCbLlG5WRPmdb0D8L0rg/JggscKPkV
 q2qA==
X-Gm-Message-State: AOAM531qF8/M3HM826xb25NW/B7EOaFRHH+iYGCbZiPCbzGEx1zrf0JA
 ydwD+fy6XYasEwuzr5SynN0=
X-Google-Smtp-Source: ABdhPJwYyF9yYjT+46TQTS6G9dUM15lOq4LxmmkU8jnLypjCcL91s5XkuUNezcRKtuoC1WE+CrEbsg==
X-Received: by 2002:a17:902:8b86:b029:e5:bef6:56b0 with SMTP id
 ay6-20020a1709028b86b02900e5bef656b0mr24222450plb.76.1619530285133; 
 Tue, 27 Apr 2021 06:31:25 -0700 (PDT)
Received: from george-Quanta.com.com (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id e65sm2783687pfe.9.2021.04.27.06.31.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Apr 2021 06:31:22 -0700 (PDT)
From: George Hung <ghung.quanta@gmail.com>
X-Google-Original-From: George Hung <george.hung@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.10 v1] ARM: dts: nuvoton: add fans-efuse GPIO and fix
 naming
Date: Tue, 27 Apr 2021 21:21:51 +0800
Message-Id: <20210427132151.15362-1-george.hung@quantatw.com>
X-Mailer: git-send-email 2.21.0
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

* add fans-efuse GPIO to gpio-keys
* use the same node name for all the pca9535 nodes
* convert the gpio nodes to phandle

Signed-off-by: George Hung <george.hung@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gbs.dts | 188 ++++++++++++----------
 1 file changed, 100 insertions(+), 88 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
index 24fae0e4f454..3d53fbe54055 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gbs.dts
@@ -141,6 +141,12 @@
 			gpios = <&gpio3 25 GPIO_ACTIVE_LOW>;
 			linux,code = <121>;
 		};
+
+		fans-efuse {
+			label = "fans-efuse";
+			gpios = <&gpio4 18 GPIO_ACTIVE_HIGH>;
+			linux,code = <146>;
+		};
 	};
 
 	iio-hwmon {
@@ -623,14 +629,14 @@
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
@@ -647,14 +653,14 @@
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
@@ -662,7 +668,7 @@
 
 	};
 
-	pca9535_ledfault: pca9535-ledfault@23 {
+	pca9535_ledfault: pca9535@23 {
 		compatible = "nxp,pca9535";
 		reg = <0x23>;
 		gpio-controller;
@@ -670,7 +676,7 @@
 
 	};
 
-	pca9535_pwrdisable: pca9535-pwrdisable@25 {
+	pca9535_pwrdisable: pca9535@25 {
 		compatible = "nxp,pca9535";
 		reg = <0x25>;
 		gpio-controller;
@@ -687,7 +693,7 @@
 			"u2_13_pwr_dis","u2_12_pwr_dis";
 	};
 
-	pca9535_perst: pca9535-perst@26 {
+	pca9535_perst: pca9535@26 {
 		compatible = "nxp,pca9535";
 		reg = <0x26>;
 		gpio-controller;
@@ -1086,94 +1092,100 @@
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

