Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA4CE7BBE
	for <lists+openbmc@lfdr.de>; Mon, 28 Oct 2019 22:49:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4727fC0bsVzF09h
	for <lists+openbmc@lfdr.de>; Tue, 29 Oct 2019 08:49:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=bjwyman@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mzXEG/A6"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4727dZ4nlPzDr37
 for <openbmc@lists.ozlabs.org>; Tue, 29 Oct 2019 08:48:48 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id o49so16953491qta.7
 for <openbmc@lists.ozlabs.org>; Mon, 28 Oct 2019 14:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jDcYLyIB9SK5Rba+ODMouRpEhSb/PYjidxgySmH0P7s=;
 b=mzXEG/A6eJkqvrRG2yMRQwF5TfehcO3oImboW1Z5MNwE/e43vvGmiVsKdO1IHdoFCP
 xlMcUJNb0T0j4WIWQ8/8120b7gfImQADHYouIjysOs5cReyDw9qjZAFoQ8ZrF59Wa+6n
 hnGY6CcWXZ688T64+hc9z7156htCael5AWCh99SaBgK4SaU0jdRmNXoiBcfBgw2EEiMx
 PGDkujPSb7A5+Lti0NmCv4IEC3HuRl93mf0dGSWzv80u4AGyLi5gtQ1LCPnLBz8spVMv
 GXzTK0UdO+ftflfnedr1U/hX0lbfOC2UeBGzC8R3SY3z73bREeDBx2O4XJxDf6xsfegT
 ZiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jDcYLyIB9SK5Rba+ODMouRpEhSb/PYjidxgySmH0P7s=;
 b=mqXD6m4x0/I9eIwG7fRQcPTJbSo4kuSrQLjjywwKsTlpbp0FRtVy3EkuHRThM+6hM6
 zm0hl4i3oktsq+WI0vp71XEDW2Sy5f8E3zMDB7XrrxYEZYKJfiDlOiOHCh7a8S0cG3xr
 g+Rb2iOpL9mA4QCFI0k1YnPf41C0c2VCkGtVAxm5G7EL2ZLz/36KLW6rihiE5jhILcuu
 azupb9KJ6lBGt2ftfmUtbLq+tyh/92DATdDIf2BBfjIcsd9i3ciIQHz/HJRJ5eElnB8C
 XeDqvAlUp/fXWAc3oWmoPdAwIUCr4jmZTpCNfsYRuB75MXvb6pVsNJfAYvOS1YxMUbDq
 sKNw==
X-Gm-Message-State: APjAAAVBBhrb3hQheSEKODvEfL1UEnNCgfsMSnTqvYyn+TnK2I2VUBcQ
 nDwX4eRDXLCqKMWOwXwvGdU=
X-Google-Smtp-Source: APXvYqxxNKXHtYPxd+vrBq7juVz67B5KFRt6COq1Q1HdRb+Y5qpRhkN9lF3kDdGNpO+ADjmKIsMydg==
X-Received: by 2002:ad4:5429:: with SMTP id g9mr11553926qvt.27.1572299324478; 
 Mon, 28 Oct 2019 14:48:44 -0700 (PDT)
Received: from gfwr610.rchland.ibm.com ([129.41.86.1])
 by smtp.gmail.com with ESMTPSA id w3sm4509795qtn.93.2019.10.28.14.48.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Oct 2019 14:48:43 -0700 (PDT)
From: Brandon Wyman <bjwyman@gmail.com>
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>
Subject: [PATCH linux dev-5.3] ARM: dts: aspeed: rainier: gpio-keys for PSU
 presence
Date: Mon, 28 Oct 2019 16:47:54 -0500
Message-Id: <20191028214754.381-1-bjwyman@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Brandon Wyman <bjwyman@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add in a gpio-keys section to the Rainier device tree source, add in the
power supply presence GPIOs.

Signed-off-by: Brandon Wyman <bjwyman@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts | 29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
index efb1e99b5124..6dee4bf1deef 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
@@ -3,6 +3,7 @@
 /dts-v1/;
 
 #include "aspeed-g6.dtsi"
+#include <dt-bindings/gpio/aspeed-gpio.h>
 
 / {
 	model = "Rainier";
@@ -33,6 +34,34 @@
 		};
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		ps0-presence {
+			label = "ps0-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 0) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 0)>;
+		};
+
+		ps1-presence {
+			label = "ps1-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 1) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 1)>;
+		};
+
+		ps2-presence {
+			label = "ps2-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 2) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 2)>;
+		};
+
+		ps3-presence {
+			label = "ps3-presence";
+			gpios = <&gpio0 ASPEED_GPIO(S, 3) GPIO_ACTIVE_LOW>;
+			linux,code = <ASPEED_GPIO(S, 3)>;
+		};
+	};
+
 };
 
 &emmc_controller {
-- 
2.23.0

