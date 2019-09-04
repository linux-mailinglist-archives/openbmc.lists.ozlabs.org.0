Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFDA78AF
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 04:19:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NSFW1XGmzDqnc
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 12:19:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=qq.com
 (client-ip=113.96.223.80; helo=qq.com; envelope-from=chicagoduan@qq.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=qq.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=qq.com header.i=@qq.com header.b="MRWUj/7B"; 
 dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at bilbo;
 Wed, 04 Sep 2019 12:19:04 AEST
Received: from qq.com (smtpbg414.qq.com [113.96.223.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NSDm65XzzDqPm
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 12:19:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1567563382; bh=QIZDohUsY4HgkrOIMxZYUSYkLdM0VKYlrfPIz3T75vU=;
 h=From:To:Subject:Date:Message-Id;
 b=MRWUj/7BBxFOkmlwc/nUP4fJ4pXOm1q1s7UhN/z8qOsHfJQ/z9YH9oiq9a0h8fZAm
 CzORFx6CMg3gmn3aiZseFD2sq5JTHAc2pRyPWxYlw/gtxy7RjDkwEOzY3XofhXAi3P
 3ejS1K+Ce6Rkmb89ubLWFs+ZvugqPwYtHkqKLYkk=
X-QQ-mid: esmtp7t1567563381tqolf4pls
Received: from localhost (unknown [111.207.123.58])
 by esmtp4.qq.com (ESMTP) with 
 id ; Wed, 04 Sep 2019 10:16:20 +0800 (CST)
X-QQ-SSF: 0100000000000090L1120F00000000Z
X-QQ-FEAT: DvlWCdCvWZyyjrVNMxQ67RctEvpnz9PInPK4IqDBoXlSR1lEY4RLL7vca2DYc
 11Z3Z2i57H17aiYbCHAsa8ksaqTCyN374qBIFW/TdANA6OI0ANKPs5ooNivD/02lKXTQxx/
 yDMP6CZFlyfb2qYsNEzfXmx2fdb4UtWKI/Z9geUO7yRX+ay5ljLaHCWv4BBo3NskQhCjoir
 l/PLbN2WpfjSzNwSoZgNWgd9SZZuNT/jkS2pK4EN5uuACgHrywag+qO/PFns1saLQx/JYLm
 RFSFgAJZ94ZjZPhnQqF3t7E3IulYQ2KJtKjw==
X-QQ-GoodBg: 0
From: Chicago Duan <chicagoduan@qq.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: aspeed: fp5280g2: Add led configure
Date: Wed,  4 Sep 2019 10:16:20 +0800
Message-Id: <20190904021620.40048-1-chicagoduan@qq.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtp:qq.com:bgforeign:bgforeign4
X-QQ-Bgrelay: 1
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
Cc: Chicago Duan <duanzhijia01@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Chicago Duan <duanzhijia01@inspur.com>

Added some led configure on fp5280g2.
Change BMC init-ok gpio to led, which needs to
blink when BMC initialization is complete.

Use TAB to align some lines

Signed-off-by: Chicago Duan <duanzhijia01@inspur.com>
---
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 55 ++++++++++++++-----
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 52c28f2fed6c..f1401138a94f 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -139,14 +139,48 @@
 	};
 
 	leds {
-	    compatible = "gpio-leds";
+		compatible = "gpio-leds";
 
-	    power {
-		    label = "power";
-		    /* TODO: dummy gpio */
-		    gpios = <&gpio ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
-	    };
+		power {
+			label = "power";
+			/* TODO: dummy gpio */
+			gpios = <&gpio ASPEED_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		init-ok {
+			label = "init-ok";
+			gpios = <&gpio ASPEED_GPIO(B, 7) GPIO_ACTIVE_LOW>;
+		};
+
+		front-memory {
+			label = "front-memory";
+			gpios = <&gpio ASPEED_GPIO(F, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		front-syshot {
+			label = "front-syshot";
+			gpios = <&gpio ASPEED_GPIO(I, 1) GPIO_ACTIVE_LOW>;
+		};
+
+		front-syshealth {
+			label = "front-syshealth";
+			gpios = <&gpio ASPEED_GPIO(I, 0) GPIO_ACTIVE_LOW>;
+		};
 
+		front-fan {
+			label = "front-fan";
+			gpios = <&gpio ASPEED_GPIO(H, 4) GPIO_ACTIVE_LOW>;
+		};
+
+		front-psu {
+			label = "front-psu";
+			gpios = <&gpio ASPEED_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		};
+
+		identify {
+			label = "identify";
+			gpios = <&gpio ASPEED_GPIO(Z, 7) GPIO_ACTIVE_LOW>;
+		};
 	};
 
 	iio-hwmon-battery {
@@ -740,15 +774,6 @@
 	aspeed,external-nodes = <&gfx &lhc>;
 };
 
-&gpio {
-	pin_gpio_b7 {
-		gpio-hog;
-		gpios = <ASPEED_GPIO(B,7) GPIO_ACTIVE_LOW>;
-		output-high;
-		line-name = "BMC_INIT_OK";
-	};
-};
-
 &wdt1 {
 	aspeed,reset-type = "none";
 	aspeed,external-signal;
-- 
2.17.1



