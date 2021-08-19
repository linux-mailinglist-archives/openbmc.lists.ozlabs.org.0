Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDE3F12F3
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 07:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gqv7Z26psz3bW5
	for <lists+openbmc@lfdr.de>; Thu, 19 Aug 2021 15:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dMrZyt1F;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=liuxiwei1013@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dMrZyt1F; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gqv7805HQz307D;
 Thu, 19 Aug 2021 15:52:35 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w6so3254826plg.9;
 Wed, 18 Aug 2021 22:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IF17aolAlURwpUnWUph8bUVhuWbBF2d6WJwX4WbnNTg=;
 b=dMrZyt1F3hsIKuO7fUpYJRjEo/VlUYlC5wrhdPkOgTPHv/q7L9oZNyGXgU8O/5YPa1
 ZUpaROFhFNeXOimJ15G5nC7IcR2fEe2hfkyeBEy7sPT23eycHsc0XRapOwXD9vOPstrn
 U9bEWJkncUXE8dPNvY+MT0s7H+ZFkm8ue/7xCWkE/4KAEx9FrgiEfy4pnra10GiGaHQ0
 o0/VHrjy8IB8XbBGpjrWKf1JMITmkJtY6mM63tNKGIF9td14di10jCmXRj15yu3tYNn6
 d3rCzYYP6KJ44D5BddEkUjMOu8G86JRvI8zWaYTY5bL8QRZhW+jTrCNjsakhjxaa+KbJ
 c1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IF17aolAlURwpUnWUph8bUVhuWbBF2d6WJwX4WbnNTg=;
 b=Q23bS8pMEi8uYa7ADlHZiSudI8Wx374My6aocq1cwIxcsJGe9DEEQnOp3U2jVNteax
 t2a2mW56qJ5rW0c883ZzbzbgPgIDl/gxehD3Mo5T2W8QeD1eD8Ih+nc8gJuG3elE1XOg
 hQmyKHZVKsZ14MuHFdqnYnaeUbYy5toGD1WHUxwhDAC53TZmNANbYxJ/Bep5PN9lzRU3
 CHpjHd//F9VBK2XuZ93ACEGSsMSe1mjDQGndKQdvBT2+mxFWlO5UdZLjCpoC48BCH5xK
 tcvT8E8bJB7FOSPftq6hFq/71uWQTdWST8/Ufgbbva94XDY3wiQlh2EkCkCiiP8Crl+T
 +URQ==
X-Gm-Message-State: AOAM533Migz0cD/1k762HZ70ET0pG0OYX3oxrW+pHu9xW3Bvks0/LIR4
 XZqsxpWKSzycikVbaTT1nMs=
X-Google-Smtp-Source: ABdhPJwtzQIbitrTyYk+vzJWEmbnvQ+C4XZlT5gcs8oW+Qkj0ReIzTignGSUCDvdAoV7s1cVJyzHzg==
X-Received: by 2002:a17:902:7786:b029:12c:dac0:15ba with SMTP id
 o6-20020a1709027786b029012cdac015bamr10194807pll.27.1629352352799; 
 Wed, 18 Aug 2021 22:52:32 -0700 (PDT)
Received: from localhost (95.169.4.245.16clouds.com. [95.169.4.245])
 by smtp.gmail.com with ESMTPSA id j35sm2162177pgm.55.2021.08.18.22.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 22:52:32 -0700 (PDT)
From: George Liu <liuxiwei1013@gmail.com>
X-Google-Original-From: George Liu <liuxiwei@inspur.com>
To: joel@jms.id.au,
	openbmc@lists.ozlabs.org
Subject: [PATCH] ARM: dts: fp5280g2: Enable KCS 3 for MCTP binding
Date: Thu, 19 Aug 2021 13:52:27 +0800
Message-Id: <20210819055227.140980-1-liuxiwei@inspur.com>
X-Mailer: git-send-email 2.30.2
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
Cc: robh+dt@kernel.org, George Liu <liuxiwei@inspur.com>,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: George Liu <liuxiwei@inspur.com>
---
 arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
index 1752f3250e44..d0c3acbf6c8c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts
@@ -3,6 +3,7 @@
 #include "aspeed-g5.dtsi"
 #include <dt-bindings/gpio/aspeed-gpio.h>
 #include <dt-bindings/leds/leds-pca955x.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "FP5280G2 BMC";
@@ -902,4 +903,10 @@ fan@7 {
 
 };
 
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xca2>;
+	aspeed,lpc-interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
+};
+
 #include "ibm-power9-dual.dtsi"
-- 
2.30.2

