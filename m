Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF055308A8
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65R82Dd5z3brm
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:26:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qoDnotxy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qoDnotxy; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L65Qp0QYgz3bh9
 for <openbmc@lists.ozlabs.org>; Mon, 23 May 2022 15:26:09 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id gg20so13022793pjb.1
 for <openbmc@lists.ozlabs.org>; Sun, 22 May 2022 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
 b=qoDnotxySoygzG7LDqmRxBz+yEnAjAoyUwB5EeLCCUnfIBo0oIK+1PXtE16UYnFlvE
 GVfqsI0HyM8P2rZxmc4svDZrb+l99fOuzadugqWvOmStscFC+Ax2CvHgtc+kqUQjOTVb
 ed42OFT7pW5FNi/yRvcyqhtbLntR1DQsgCLI03nEPnYTLPUULCFeBlVgGcMfYpC+hAMb
 ZOAVnoclGBt0dw1zcXyIJTuPVcVbU6vhhZy2yfEAgwEOiB36qtPzjLThpYQaGZutCgl9
 8kvLNcdf+uiWlG2F7V+Jp4HGD5jUYtNm8szMOCRkiXestQHeohSKZ6XVYEN1PVCpfUAZ
 wxtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PLLLntBRKNP/TR5HdmPuN09W5k0TVn71VC7Vx2rA/LU=;
 b=0SkLYfh9GRWBax1jY0ZG/TcJilukF59MAmgjvDPC6SbZRPY0u+vIPJ6tafQ4PE9MB2
 Xbx+K5vO9XPMAAfCbNQT2xwx797/CHcKn72G1SDDCZRoTvWirLCtKv1/x2+Z+Uu+lRHt
 ZuxPJs/rH1XpUrkw6Xqtqac8uQAB+oS3DTbjHLJOk55+zAwyI9tGXxC3PUSKvALJWpVA
 KB16ndwKtQZvz2E7ojBPPkCmo+C+t6UB7J/sCN6SXI8Z9PfLn8kClKb+SbA6SNwemuBv
 VEa9/XNMag+q0dU+Oe7qN1NH5OrVkLRmPNynuGPjTz3P/TRerNy9hkHqusWM1RU30dMs
 lCxA==
X-Gm-Message-State: AOAM532UDeB8XoSsZ8BQmnkn1tQppcwGRdKhCYq+5BzW+guusBPtXDJp
 7jyEKzSUWCcVUhbYsfpq4HI=
X-Google-Smtp-Source: ABdhPJyMHWgHcFMRk4ZK1dOj5OyOTswPsOPx+ERGze4TRYKvLU4M3Jj8l4qGkzJgLvBMtpDwuCKhsw==
X-Received: by 2002:a17:903:25cd:b0:162:2250:b04d with SMTP id
 jc13-20020a17090325cd00b001622250b04dmr4147933plb.12.1653283567458; 
 Sun, 22 May 2022 22:26:07 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 y5-20020a655285000000b003c14af50603sm3871523pgp.27.2022.05.22.22.26.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 May 2022 22:26:06 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Mon, 23 May 2022 13:25:44 +0800
Message-Id: <20220523052548.28109-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523052548.28109-1-milkfafa@gmail.com>
References: <20220523052548.28109-1-milkfafa@gmail.com>
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

