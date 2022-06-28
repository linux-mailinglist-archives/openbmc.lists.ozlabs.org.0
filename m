Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D2355BDD8
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 05:30:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LX9962Dtzz3btK
	for <lists+openbmc@lfdr.de>; Tue, 28 Jun 2022 13:30:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KvKi1qTc;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KvKi1qTc;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LX98969Gkz30Dp
	for <openbmc@lists.ozlabs.org>; Tue, 28 Jun 2022 13:30:01 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d5so9864563plo.12
        for <openbmc@lists.ozlabs.org>; Mon, 27 Jun 2022 20:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
        b=KvKi1qTcuRRJLbkS03z74pvwZe7LPQzrUIsZJFXadp/BT/OlBXTrYnYGrZhPADpL/n
         g7kiTviOwmYpj5yNGa4dRShD9cbijz3I2qEmOsfbNNkffc58ouvv6ZqURQ6gHiCnCYIu
         MsZRjulzoSv21HCTFh5Imt4AmDz9QZfOkgjNBPA9luMRxWxoiQepeLQCnFcB2TBnewLZ
         kbndcx4jA46vTChBvr3sCwU4jvtTwqxGu/67NtsnLw4OGtSO33GmC1/vcKUAWKwxoBiT
         Ysn/6OpdTvxQpG61quaODdhBEXHbyVCOetWVpitOg/ztF+wHikM8JJEYwVft/UqtQULX
         +FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
        b=KPqVt7n8BHewRJ4OK9pQj5kHu6/RxVRnkCNYPYueeCS9g1S28FxLmhA+pJULG7sczJ
         p1PTbCprOM6DCYdPgbNHC+J/9CTOVhmH24T39SQzdmij2G7VGi/mihkpApzOg/U6m+0A
         fqPleZWVNqDDtMik6aS84j32c9IAdBMIoHwpSa2OyvRuTDFcsTq+HXfohAUxJDXFg4ik
         NZEgo/J/q4ocCsi4L+nc5A21Kw8551JwzlcotoM0HwgYZX/c9Y17aLHRYxKS+4MAGA4H
         XQf160yVtTurfWd1sSBdlN+QekQDqd6shqzMgFoiGlrcPFmAQ4Xcfb4lV4B8Y/jFKw+1
         OA4w==
X-Gm-Message-State: AJIora9ci0zEUhvn30J8Bd3YJ8+jyaAI4d7AD118Ge9meTN3v0qP6q8f
	wkcXFf+NOysLxDbvswUSbtaeG/DDgEQH7w==
X-Google-Smtp-Source: AGRyM1vfnwL3x1TcjB2cio5SucnRAbUcBMG7vp6Lbnjm18qx0qb9Z2lLsk9d40rRwz/FMH09rWWqug==
X-Received: by 2002:a17:90a:dc82:b0:1ea:c77d:c9a4 with SMTP id j2-20020a17090adc8200b001eac77dc9a4mr25478601pjv.197.1656386999558;
        Mon, 27 Jun 2022 20:29:59 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c26-20020a62e81a000000b0050dc762816dsm8091160pfi.71.2022.06.27.20.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 20:29:59 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v4 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Tue, 28 Jun 2022 11:29:41 +0800
Message-Id: <20220628032945.15410-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220628032945.15410-1-milkfafa@gmail.com>
References: <20220628032945.15410-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
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

