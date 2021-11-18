Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAF0455253
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 02:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HvjKt6Hczz305J
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 12:45:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pZMzJ81j;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wak.bounces.google.com (client-ip=2607:f8b0:4864:20::b49;
 helo=mail-yb1-xb49.google.com;
 envelope-from=3fbcvyqmkb94wakgoogle.comopenbmclists.ozlabs.org@flex--wak.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pZMzJ81j; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvjKS3jlfz2x9R
 for <openbmc@lists.ozlabs.org>; Thu, 18 Nov 2021 12:44:58 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id
 r18-20020a25ac52000000b005c9047c420bso7255067ybd.4
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 17:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=pYMZTosQ5ftCrN2lR7gXZ78YHFpF0mKoV43Mfdi/iIQ=;
 b=pZMzJ81j9j9ZPgEXKrg5McSKQtDF7oh6ZCiy50LpeDbMrPK3+r31b3EPsJYpZ9KBRW
 aeWQhEbPITjiMHM58+Kf8vLxoaCc/qBuWp8t+fNKuBFOajYH8D0nNHwdBkeh5fJWKrdc
 84zcpJdS871PVxPst3tnaETZxesDdBSywK4unMrU9GwnfIBoNEmOoCtiEUWhFRWsFvRD
 zpJ/QcC53WHp/5CX+G+NsM2TqziHc0oHlwIgW3CIngzFgxFzaR5wc0IKdAlzV8z3qI9Y
 MdC1bQX+k3skpop3JASV9efEaPsOgFkaz8HqjlqX8CNJPMe+qWfHGzpZZjR6gw84TlWT
 hVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=pYMZTosQ5ftCrN2lR7gXZ78YHFpF0mKoV43Mfdi/iIQ=;
 b=5mkoRwClKSF+Fll1iPs6FPpJF/OQ6IaypfiT6Svy6VJnrZeWN/JVEwbSDnRbSAdMTe
 Cj9X8vtaDbWtY1AzKvAusicG5lVSBKk5lNzbBTs672AdnhnPtWbrVzU9JfN7qwai9GEe
 nO5+33NnVk7cq7AidqJo7yWDc2O2aKvr5c4OqDuL5kfj6CK8WJHrDJXDLb7Hw/tjdqV1
 qIHbInoKegzL42H3KP0YROy/vT6MQbVZ4sNTNLenPJK+3dCIu/d7iMr2K/VfbmWHMUe8
 xW5xOZg1p3GOiWOJULexUapqlROozwzC7BaZlL9csRCuH+wWOtlrpeOx+jTUC7qvEN8d
 i8QQ==
X-Gm-Message-State: AOAM532CZYibYHUO3UhrZtfhQdL0Ng16wQR5Xw3uRxQfeHzu9cxu1Ei2
 rUaCKZQKI+qKLcGC26dO4qV+kyWrjqmcMy6B2FQWETwKbpTbR0A4AwpmM1COgn3igC8fKbguhM6
 GXrBEk+Kiji44Qjt39+nCEnlc+npFe+/MJKuYh79XxO7GqQp2jCVdPNXm
X-Google-Smtp-Source: ABdhPJwN6FbYqZuC414NfWqloRyYg/vIQhY6vQ7G7QApLSJdilr+JpEmUbjYRWBkELUqlgi9aSSwV3w=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:3d30:dcfc:3c2a:e3f0])
 (user=wak job=sendgmr) by 2002:a5b:648:: with SMTP id
 o8mr24337508ybq.208.1637199893159; 
 Wed, 17 Nov 2021 17:44:53 -0800 (PST)
Date: Wed, 17 Nov 2021 17:44:45 -0800
Message-Id: <20211118014445.1621187-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
Subject: [PATCH] ARM: dts: nuvoton: Fix GPIO pin names
From: "William A. Kennington III" <wak@google.com>
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: "William A. Kennington III" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The pinctrl driver for the NPCM7xx updated some of the pinctrl names to
include HGPIO definitions, but the dts file remained unchanged. This
breaks pinctrl parsing if the strings don't match.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi | 42 ++++++++++-----------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
index 444ea403547b..7c7942cdfd08 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
+++ b/arch/arm/boot/dts/nuvoton-npcm750-gpio.dtsi
@@ -219,77 +219,77 @@ gpio19ol_pins: gpio19ol-pins {
 			output-low;
 		};
 		gpio20_pins: gpio20-pins {
-			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
 			bias-disable;
 			input-enable;
 		};
 		gpio20o_pins: gpio20o-pins {
-			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
 			bias-disable;
 			output-high;
 		};
 		gpio20ol_pins: gpio20ol-pins {
-			pins = "GPIO20/SMB4CSDA/SMB15SDA";
+			pins = "GPIO20/HGPIO0/SMB4CSDA/SMB15SDA";
 			bias-disable;
 			output-low;
 		};
 		gpio21_pins: gpio21-pins {
-			pins = "GPIO21/SMB4CSCL/SMB15SCL";
+			pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
 			bias-disable;
 			input-enable;
 		};
 		gpio21ol_pins: gpio21ol-pins {
-			pins = "GPIO21/SMB4CSCL/SMB15SCL";
+			pins = "GPIO21/HGPIO1/SMB4CSCL/SMB15SCL";
 			bias-disable;
 			output-low;
 		};
 		gpio22_pins: gpio22-pins {
-			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
 			bias-disable;
 			input-enable;
 		};
 		gpio22ol_pins: gpio22ol-pins {
-			pins = "GPIO22/SMB4DSDA/SMB14SDA";
+			pins = "GPIO22/HGPIO2/SMB4DSDA/SMB14SDA";
 			bias-disable;
 			output-low;
 		};
 		gpio23_pins: gpio23-pins {
-			pins = "GPIO23/SMB4DSCL/SMB14SCL";
+			pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
 			bias-disable;
 			input-enable;
 		};
 		gpio23ol_pins: gpio23ol-pins {
-			pins = "GPIO23/SMB4DSCL/SMB14SCL";
+			pins = "GPIO23/HGPIO3/SMB4DSCL/SMB14SCL";
 			bias-disable;
 			output-low;
 		};
 		gpio24_pins: gpio24-pins {
-			pins = "GPIO24/IOXHDO";
+			pins = "GPIO24/HGPIO4/IOXHDO";
 			bias-disable;
 			input-enable;
 		};
 		gpio24o_pins: gpio24o-pins {
-			pins = "GPIO24/IOXHDO";
+			pins = "GPIO24/HGPIO4/IOXHDO";
 			bias-disable;
 			output-high;
 		};
 		gpio24ol_pins: gpio24ol-pins {
-			pins = "GPIO24/IOXHDO";
+			pins = "GPIO24/HGPIO4/IOXHDO";
 			bias-disable;
 			output-low;
 		};
 		gpio25_pins: gpio25-pins {
-			pins = "GPIO25/IOXHDI";
+			pins = "GPIO25/HGPIO5/IOXHDI";
 			bias-disable;
 			input-enable;
 		};
 		gpio25o_pins: gpio25o-pins {
-			pins = "GPIO25/IOXHDI";
+			pins = "GPIO25/HGPIO5/IOXHDI";
 			bias-disable;
 			output-high;
 		};
 		gpio25ol_pins: gpio25ol-pins {
-			pins = "GPIO25/IOXHDI";
+			pins = "GPIO25/HGPIO5/IOXHDI";
 			bias-disable;
 			output-low;
 		};
@@ -523,32 +523,32 @@ gpio58ol_pins: gpio58ol-pins {
 			output-low;
 		};
 		gpio59_pins: gpio59-pins {
-			pins = "GPIO59/SMB3DSDA";
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
 			bias-disable;
 			input-enable;
 		};
 		gpio59o_pins: gpio59o-pins {
-			pins = "GPIO59/SMB3DSDA";
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
 			bias-disable;
 			output-high;
 		};
 		gpio59ol_pins: gpio59ol-pins {
-			pins = "GPIO59/SMB3DSDA";
+			pins = "GPIO59/HGPIO6/SMB3DSDA";
 			bias-disable;
 			output-low;
 		};
 		gpio60_pins: gpio60-pins {
-			pins = "GPIO60/SMB3DSCL";
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
 			bias-disable;
 			input-enable;
 		};
 		gpio60o_pins: gpio60o-pins {
-			pins = "GPIO60/SMB3DSCL";
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
 			bias-disable;
 			output-high;
 		};
 		gpio60ol_pins: gpio60ol-pins {
-			pins = "GPIO60/SMB3DSCL";
+			pins = "GPIO60/HGPIO7/SMB3DSCL";
 			bias-disable;
 			output-low;
 		};
-- 
2.34.0.rc1.387.gb447b232ab-goog

