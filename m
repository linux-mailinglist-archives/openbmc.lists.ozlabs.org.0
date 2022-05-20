Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4760B52E2B0
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 04:48:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4B4j1dWqz3bkl
	for <lists+openbmc@lfdr.de>; Fri, 20 May 2022 12:48:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HbGYfpAI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HbGYfpAI; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4B3l72Dwz3bhs
 for <openbmc@lists.ozlabs.org>; Fri, 20 May 2022 12:48:03 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id y41so6617811pfw.12
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 19:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
 b=HbGYfpAIScYy7rUPgRC2VngAHXrnAlthass+NUjn0m0ZxLDHydn3dGeqpTvh/cNgjc
 g8vtAZXI/SRU4tlbyfGc+Hx8vV1nLhfRAvK6qJgB/2leG3XkyvuQeXbWXQ4Wa4GDQvTK
 YIYWipvkjh48QVgz/5HiMGeCMymQOf+eaRqTZTI9P08q1s76dyFrsZnqyGpxg+ZoXEbk
 Ypfk0lic3xKsZC36dq1IrwaX8/35B9QQuMubluoyINN6iL8UNn6JF8ZrMiK5/HZf6ULV
 GzCl27WbdRi5NrPBba1x/pSIgvBDVt+N+nFD39KnHa9nLHtkYrhCfq14Dk3c85H9wqRx
 x8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
 b=E6NSX4vQvrsjhIB4KtExqLcTEjx2bJKhvp2hkj7sYLdnjFhiq22ovw0SFwWpuuu3cR
 oyA5kMj+4oUEYLSjw4GPFAn+/DLn4sNIJHEOq7MqItoRpu8wBqcuUkgsIYLA8dWU5s8/
 QXCGOJWOdtqECNgBXCsKxI/puaOXb/GkG51pd5DrlJBQZBWfOJY9e2Ejb+f2oDuQYVtY
 9pDpUlDQbiqH1hYXbLkG5Ygwi3awbQ0n7Q9mbj1BpADk+J3TrWMyd4lfKg208bC9lxgB
 tiUgFY/r+I113EwmKy+oVRU8lApTHEDnYtAove5rJuIja+Tuw+Zj1YrAXQ9Dpco7DCG1
 wceg==
X-Gm-Message-State: AOAM531VARqa6PzxdGWf/hBispxFm9Y2HY7naSC+GsWMFPK5oifTG+9j
 VBCH5VvMh94367qIN/qFXfg=
X-Google-Smtp-Source: ABdhPJxg2CUR6hFUHRTDEKGa2nHovb0+dGvuSLQdEKWoHzz5PoCdPR9PqK1r8IKVD6B0YSHQzpPD4Q==
X-Received: by 2002:a63:2ad0:0:b0:3c1:5f7e:fd78 with SMTP id
 q199-20020a632ad0000000b003c15f7efd78mr6620687pgq.56.1653014878947; 
 Thu, 19 May 2022 19:47:58 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 n9-20020a629709000000b0050df474e4d2sm379406pfe.218.2022.05.19.19.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 19:47:58 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Fri, 20 May 2022 10:47:40 +0800
Message-Id: <20220520024744.25655-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220520024744.25655-1-milkfafa@gmail.com>
References: <20220520024744.25655-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com,
 avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com,
 kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs. Tested with Nuvoton
NPCM750 evaluation board.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index 3696980a3da1..0d2df74974bf 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -178,6 +178,19 @@
 			status = "disabled";
 		};
 
+		video: video@f0810000 {
+			compatible = "nuvoton,npcm750-video";
+			reg = <0xf0810000 0x10000>, <0xf0820000 0x2000>;
+			reg-names = "vcd", "ece";
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_VCD>,
+				 <&rstc NPCM7XX_RESET_IPSRST2 NPCM7XX_RESET_ECE>;
+			reset-names = "vcd", "ece";
+			nuvoton,syscon-gcr = <&gcr>;
+			nuvoton,syscon-gfxi = <&gfxi>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -553,6 +566,12 @@
 				pinctrl-0 = <&smb15_pins>;
 				status = "disabled";
 			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm750-gfxi", "syscon",
+					     "simple-mfd";
+				reg = <0xe000 0x100>;
+			};
 		};
 	};
 
-- 
2.17.1

