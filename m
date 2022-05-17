Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B5A529E17
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 11:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2W7x59ZBz3by1
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 19:30:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i3/TEtwK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=i3/TEtwK; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2W6x6Q8fz3bpR
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 19:30:01 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id bo5so16378348pfb.4
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=jvAEBjwUOb6zwBl6DiP+4dhdWO5kB2YZRGfj+rIA7BU=;
 b=i3/TEtwKdC1L8jE2kpraxfjfQMZdWlaYJ82HkAzVjRv1/y1XlOVgD1ZbQU7onzcfg4
 giVARRWtF7FK4zX+k1ALoozacX8jutwm3/ULK8aEXr4g2MGhBGqEkfF7h6KKVsaKUcnL
 azIFQtKcacL4leEBRCIlgqOPMb1y59+AEWnx8Hu3EDGY7Tr8hppkIPlpNEcfoZFmM51S
 VKqpotpc+dWRtQGiIWKDaUyEoM0SXgqNGP9X9I5/gp2PbgPW7Do52MFhLn3m415PhKcB
 6bD1x+JCldY9h1YFecy4cWIBPebN73w68lokoa7zrjkAoRpXPiqcoaZ2Yk7k2Q8l8Mxk
 9Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=jvAEBjwUOb6zwBl6DiP+4dhdWO5kB2YZRGfj+rIA7BU=;
 b=qqY6Y0WaRI0apxbUPb4uGYFylNeiOc6waT5a/TgEcfr35Uui79t9Psd/yfXoQUWTfG
 siiUjjKhsuc6gNgS+tKOTUHgdcU9DsBDb2bpBNaKHi2Cj0mhTYq2tluXRfQffwzp6sDd
 039RadAgKxk5eTEZRCIKIyj5v2gvx8glNHVvetcA2w7L/31joYxYC2KfSGFm/gsQ7FeY
 +Jm1Y7M+1WdWhuMpVQ444HmNHY+q93FvlGsByqtifV6Y7l7eXrIcyNOIE1tRpciHUGJY
 X3HxE5yNVtFZBN5+Dh0r5rRHs8CQpKtjUxBDya3uA92QRw9JOw1OsSF7bM7tiJUYnLOW
 tlEQ==
X-Gm-Message-State: AOAM531IoA6rRmW5UOZXLMXuOOb0Gx3Ljf/QAP779+xStYVv2hGbRbAe
 qgw7HqTXrEkfYKE6RLD+lV0=
X-Google-Smtp-Source: ABdhPJzwh48w1dJnWm+zZPcO4dArsIyEoEUhwOO2vSh7KhfR5xavNbJ0X9lVMD7tpl/w+Avzv0B6TQ==
X-Received: by 2002:a63:dd09:0:b0:3f2:804a:cf11 with SMTP id
 t9-20020a63dd09000000b003f2804acf11mr5338934pgg.621.1652779799416; 
 Tue, 17 May 2022 02:29:59 -0700 (PDT)
Received: from localhost.localdomain ([116.89.131.16])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a62b411000000b0050df474e4d2sm8399720pfn.218.2022.05.17.02.29.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:29:58 -0700 (PDT)
From: Medad CChien <medadyoung@gmail.com>
X-Google-Original-From: Medad CChien <ctcchien@nuvoton.com>
To: benjaminfair@google.com, yuenn@google.com, venture@google.com,
 tali.perry1@gmail.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 robh+dt@kernel.org, alexandre.belloni@bootlin.com, a.zummo@towertech.it,
 KWLIU@nuvoton.com, YSCHU@nuvoton.com, JJLIU0@nuvoton.com,
 KFTING@nuvoton.com, ctcchien@nuvoton.com
Subject: [PATCH v2 1/3] ARM: dts: nuvoton: Add nuvoton RTC3018Y node
Date: Tue, 17 May 2022 17:29:24 +0800
Message-Id: <20220517092927.19537-2-ctcchien@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220517092927.19537-1-ctcchien@nuvoton.com>
References: <20220517092927.19537-1-ctcchien@nuvoton.com>
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add nuvoton real time clock RTC3018Y in I2C node

Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 0334641f8829..c1248211b1b4 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -202,6 +202,12 @@
 		reg = <0x48>;
 		status = "okay";
 	};
+	rtc0: rtc@6f {
+		compatible = "nuvoton,nct3018y";
+		reg = <0x6f>;
+		#clock-cells = <0>;
+		host-wakeup-gpios = <&gpio0 0 GPIO_ACTIVE_LOW>;
+	};
 };
 
 /* lm75 on EB */
-- 
2.17.1

