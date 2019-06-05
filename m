Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0333535E3A
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 15:47:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Jqq15hxDzDqGL
	for <lists+openbmc@lfdr.de>; Wed,  5 Jun 2019 23:47:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=franhsutw@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="iqOAdspI"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Jqcs1fNnzDqP8
 for <openbmc@lists.ozlabs.org>; Wed,  5 Jun 2019 23:38:36 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id 20so12419933pgr.4
 for <openbmc@lists.ozlabs.org>; Wed, 05 Jun 2019 06:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6h8jaVo2J5e6DWM/b3nWFn9EBXgpbLSVQlIxvAAVePY=;
 b=iqOAdspITLcrQDM7JXoemvglag46V2rBGBu80QbKtIsvfh08QJ6xp2ap04tAgUUwHR
 CnwcYRgpm/dO17rDik8AsDC4XSA3z5jFB9nD3kCUnE1mtrOn+Y+SXQ9kY0Y9B2zuV2iH
 nZXwDpB3FPDtil1E/1H1Zr01LT/77jvcVKzqCAJD2knPS0Y4p2uXR3lqnE17MOmQ+fWz
 XkuFN1rnzsTTcSQw/1NxhVzL3ZNEMYvx22KnO9Q41wYpsrxiHm8Cemyg0KfjYwYHtlsM
 O3dEblsYuEboQKSx/GMY3BvGJynNxt/Ma7TSCJJmO3IIIH5FQn28q6ThPw/q3/Nozq8D
 woAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6h8jaVo2J5e6DWM/b3nWFn9EBXgpbLSVQlIxvAAVePY=;
 b=b1vUG4PffgV25wglebhOME93t8EHPVo5MbFg8LgIvuYwGNxPXCEfMoqa6gDyHblwyu
 3MyjZvmPXRmq9Fexfii6edH3uoAT5tH5hSlDNGoM34Y3uqp32HmddtU7cf9tZT0OouVk
 Erh8mdVBRP0HvLmnoC+u44hJFrXKKbPjf1BA4E0IIIc8PlpEHe+SSXCSaU20ukciKKvf
 +Ixe9r9Z+yanCIodUdLAxSVi00JIwF0kYbYOP0KZJZ2K5BJLJNDXP59mxKY+TTUNQ1w5
 DclBGflJaVpVvE7OHV+b5YlT4OZkWOCUM5wT2FsN1kW/5wAg7zQyEoGBC8uYTgf2W/gB
 wARA==
X-Gm-Message-State: APjAAAXc7zeYqN69xQOkd3zmOn3yqQxAspGJoL9DLNj61Ooor957Efx1
 t7yUMkbf4lPC1pd2JNUdJr58Syx11S0=
X-Google-Smtp-Source: APXvYqzn8MUZQLgOi5WoInq1wTwJlj8fmxnBhKPNUHNvxwtVs9GOCoRtT88Otv7BzxmowOLh5HkJxw==
X-Received: by 2002:a63:1516:: with SMTP id v22mr4629310pgl.204.1559741914637; 
 Wed, 05 Jun 2019 06:38:34 -0700 (PDT)
Received: from localhost.localdomain (220-135-135-179.HINET-IP.hinet.net.
 [220.135.135.179])
 by smtp.gmail.com with ESMTPSA id u4sm20469361pfu.26.2019.06.05.06.38.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 06:38:34 -0700 (PDT)
From: Fran Hsu <franhsutw@gmail.com>
X-Google-Original-From: Fran Hsu <Fran.Hsu@quantatw.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH dev-5.1 v6 4/4] ARM: dts: nuvoton: Add GPIOs and LEDs to GSJ
 device tree.
Date: Wed,  5 Jun 2019 21:36:25 +0800
Message-Id: <20190605133625.991-4-Fran.Hsu@quantatw.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605133625.991-1-Fran.Hsu@quantatw.com>
References: <20190605133625.991-1-Fran.Hsu@quantatw.com>
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

Add Quanta GSJ BMC device tree part 2.
This file included the definition of following two functions:
1.GPIO
2.LED

Signed-off-by: Fran Hsu <Fran.Hsu@quantatw.com>
---
 arch/arm/boot/dts/nuvoton-npcm730-gsj.dts | 196 ++++++++++++++++++++++
 1 file changed, 196 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
index 37f3ed63b582..4ff8c818a353 100644
--- a/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj.dts
@@ -403,4 +403,200 @@
 		};
 	};
 
+	pinctrl: pinctrl@f0800000 {
+		pinctrl-names = "default";
+		pinctrl-0 = <
+				/* GPI pins*/
+				&gpio8_pins
+				&gpio9_pins
+				&gpio12_pins
+				&gpio13_pins
+				&gpio14_pins
+				&gpio60_pins
+				&gpio83_pins
+				&gpio91_pins
+				&gpio92_pins
+				&gpio95_pins
+				&gpio136_pins
+				&gpio137_pins
+				&gpio141_pins
+				&gpio144_pins
+				&gpio145_pins
+				&gpio146_pins
+				&gpio147_pins
+				&gpio148_pins
+				&gpio149_pins
+				&gpio150_pins
+				&gpio151_pins
+				&gpio152_pins
+				&gpio153_pins
+				&gpio154_pins
+				&gpio155_pins
+				&gpio156_pins
+				&gpio157_pins
+				&gpio158_pins
+				&gpio159_pins
+				&gpio161_pins
+				&gpio162_pins
+				&gpio163_pins
+				&gpio164_pins
+				&gpio165_pins
+				&gpio166_pins
+				&gpio167_pins
+				&gpio168_pins
+				&gpio169_pins
+				&gpio170_pins
+				&gpio177_pins
+				&gpio191_pins
+				&gpio192_pins
+				&gpio203_pins
+				/* GPO pins*/
+				&gpio0pp_pins
+				&gpio1pp_pins
+				&gpio2pp_pins
+				&gpio3pp_pins
+				&gpio4pp_pins
+				&gpio5pp_pins
+				&gpio6pp_pins
+				&gpio7pp_pins
+				&gpio10pp_pins
+				&gpio11pp_pins
+				&gpio15od_pins
+				&gpio17pp_pins
+				&gpio18pp_pins
+				&gpio19pp_pins
+				&gpio24pp_pins
+				&gpio25pp_pins
+				&gpio37od_pins
+				&gpio59pp_pins
+				&gpio72od_pins
+				&gpio73od_pins
+				&gpio74od_pins
+				&gpio75od_pins
+				&gpio76od_pins
+				&gpio77od_pins
+				&gpio78od_pins
+				&gpio79od_pins
+				&gpio84pp_pins
+				&gpio85pp_pins
+				&gpio86pp_pins
+				&gpio87pp_pins
+				&gpio88pp_pins
+				&gpio89pp_pins
+				&gpio90pp_pins
+				&gpio93pp_pins
+				&gpio94pp_pins
+				&gpio125pp_pins
+				&gpio126od_pins
+				&gpio127od_pins
+				&gpio142od_pins
+				&gpio143ol_pins
+				&gpio175od_pins
+				&gpio176od_pins
+				&gpio190od_pins
+				&gpio194pp_pins
+				&gpio195od_pins
+				&gpio196od_pins
+				&gpio197od_pins
+				&gpio198od_pins
+				&gpio199od_pins
+				&gpio200pp_pins
+				&gpio202od_pins
+				>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-bmc-live {
+			gpios = <&gpio4 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		LED_U2_0_LOCATE {
+			gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_LOCATE {
+			gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_LOCATE {
+			gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_LOCATE {
+			gpios = <&gpio0 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_LOCATE {
+			gpios = <&gpio0 10 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_LOCATE {
+			gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_BMC_TRAY_PWRGD {
+			gpios = <&gpio0 19 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_FAULT {
+			gpios = <&gpio6 8 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_LOCATE {
+			gpios = <&gpio0 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_7_LOCATE {
+			gpios = <&gpio0 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_0_FAULT {
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_1_FAULT {
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_2_FAULT {
+			gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_3_FAULT {
+			gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_4_FAULT {
+			gpios = <&gpio2 24 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_5_FAULT {
+			gpios = <&gpio2 25 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		LED_U2_6_FAULT {
+			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+	};
+
 };
-- 
2.21.0

