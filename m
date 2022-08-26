Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D80625A1EED
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 04:42:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDPJ15Mqrz3bfC
	for <lists+openbmc@lfdr.de>; Fri, 26 Aug 2022 12:42:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RTt5GrnT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RTt5GrnT;
	dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDPHc736vz30Qc
	for <openbmc@lists.ozlabs.org>; Fri, 26 Aug 2022 12:42:03 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id t5so395289pjs.0
        for <openbmc@lists.ozlabs.org>; Thu, 25 Aug 2022 19:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
        b=RTt5GrnTfa7hAfcc/J07/2fvusNJYRSxZfYZ03xUL76cBwmkm6jNEHsFfryhZiBO/q
         tlfUOk7ecPNjEGZOzx3FzriuX062rEa55QsGlNGohENjf1Dm7IC30j7hLAOX4kYrjX1/
         ZkIEgaYvQWnRu7U/QBNC7zqH6CO8PSIgp4fm9vWCQMoXIi13jaP59CwYCBjY3eSli0xo
         22OTfiK0uOKhDhYJFMayZGaPdb75L4kx8j7qgp5FR0n+sQar5YOA2beDqE5OKwrQ6Qb8
         NebSkTsK9MaFX6NwcwZ2bJlJiaugoiDOxbjAUreOT5jmxWzw5moDvd6o1E1NOWBHlqTm
         fPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
        b=bnhefsVDR26UNP7tt5V0CZAuSLVoy1w9auc9nzH4i/lay1ZxNeQOMKsrubxLlQwpCR
         +vunB35GHNklkGjFT3Y3CexlaFOSJaOp+5HO3gtrifCiaIlzuWOammRsh8bx1DC7higR
         MNcnTWSJWAY8RxpEFINuB93ftzuny4ihect3/So1hwIxP5lB8uprLOARyR9HATDUrmbR
         zHxHit7uNPa4wxzt8RC/CNU6KrAd+Jgbu0OcZZhkR2TRsfUxH+c4EPBkMaZNvmPVOrgS
         64WJzl6xqV91Ok6x8Sm+L8i92HnPWsMfEnGLo71kr8zB6bbRGpPPUx+Vnq3xHSWpfXnw
         jGIA==
X-Gm-Message-State: ACgBeo18jVsGRzdd+4ViFpP1ETACiaZ5CTCckPKmzzRXPCVGemi9YEyp
	Mwnf0DKBm0n5LTns8UK4qN5TQTwPqLw7uA==
X-Google-Smtp-Source: AA6agR4jBxOUZXbSQmInIFfHedB8ThuUhiJs5/hLw7Em9GE6AS9ynfIU+JcuiLYWoBObxWNIcEJgTQ==
X-Received: by 2002:a17:902:f712:b0:171:29d0:6f9f with SMTP id h18-20020a170902f71200b0017129d06f9fmr1776297plo.84.1661481720267;
        Thu, 25 Aug 2022 19:42:00 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id s34-20020a17090a69a500b001f021cdd73dsm444473pjj.10.2022.08.25.19.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 19:41:59 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Fri, 26 Aug 2022 10:41:20 +0800
Message-Id: <20220826024124.22747-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220826024124.22747-1-milkfafa@gmail.com>
References: <20220826024124.22747-1-milkfafa@gmail.com>
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

