Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 053C3525A2C
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 05:36:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzvSp6gGqz3bky
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 13:36:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=n1gdkpQJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=n1gdkpQJ; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzvRv1DlMz3c9C
 for <openbmc@lists.ozlabs.org>; Fri, 13 May 2022 13:35:38 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id n10so6941635pjh.5
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 20:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vbCROyekNSS6r922VIpU9j52qiNMPCsXY7vyKjWup7s=;
 b=n1gdkpQJYWsQX/eNyIr99178nRxAREb6VAKPEq8l2QMwpSJHqM7MivzutUl80J6+04
 FOMOtYXiKXIPsDwEa50HN6WEa2ztKz4Qtgw358e9I10CqXuOnYHp/GwbNBVHvDhq4qST
 uPTuT8SJR2hVTLws1k6ks+BWsSFWY2fK4Cj0BcC3ft41atrlo4MHgxrHKC6cclDxp/v/
 gmQ9ICDqRbUykCBJracaVnB/x5TiAMAODAQVJSeOpwxL3R0XUQ8LWRyQI1XHHqWbFWSv
 zVlZv6Pz2J93o/SkV7pqiGrsOAX/jPpbRpPjiSpm9kNOoN3RIAx52/1KmHnsEhZRHQZJ
 R5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vbCROyekNSS6r922VIpU9j52qiNMPCsXY7vyKjWup7s=;
 b=J74vVmkTzjTQrxyi7Yim0dJdULJ50WMJ6fAxUEpEZJenQB1Xuq4waonvJbtxeciZAL
 h3JmYppPWcQTcX6bh9bTe+2wUgIt7d0BWd7g0a5SrGejnFKqPwyd9toZVERWL4NCRmKh
 1Hzq3lgb9Vvz3+eV6mNUzc86QKDtuHX9TvolbEBNV4NGrR1HvIsvl0473yIoKiMCc9+u
 foYCKX+tRhbOr8H9buM2e4zWd25cPTL2PUY4uQahE8PeiU/pTjjz58WSww26CG89GAv2
 d7/hzVIFXGkXI1Af3O5MT93ftkVkuVvvWzsr6350uhH2RFvlw+NSgRH9P8wCXEtCphfv
 KkZQ==
X-Gm-Message-State: AOAM533RE9s+x3T6iWBK2XRoMgVFVek+NPwVzABKLDlVX6NDq5a0vYB5
 hmIqcvSrOC2njxV7PNP0kGQ=
X-Google-Smtp-Source: ABdhPJx6A2fGWgDLxcD7QRm9iBmw5wSkeClt8vmV+fJ5TamKnVvIkXvDrs1imi7Y2Y3z5VQ+fxDKtA==
X-Received: by 2002:a17:903:290:b0:15c:1c87:e66c with SMTP id
 j16-20020a170903029000b0015c1c87e66cmr2797661plr.61.1652412936727; 
 Thu, 12 May 2022 20:35:36 -0700 (PDT)
Received: from localhost.localdomain (60-250-192-107.hinet-ip.hinet.net.
 [60.250.192.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020a1709027e0700b0015e8d4eb1c7sm685133plm.17.2022.05.12.20.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 20:35:30 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
X-Google-Original-From: Marvin Lin <kflin@nuvoton.com>
To: mchehab@kernel.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm: dts: Add node for NPCM Video Capture/Encode Engine
Date: Fri, 13 May 2022 11:34:46 +0800
Message-Id: <20220513033450.7038-2-kflin@nuvoton.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220513033450.7038-1-kflin@nuvoton.com>
References: <20220513033450.7038-1-kflin@nuvoton.com>
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, avifishman70@gmail.com,
 openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <kflin@nuvoton.com>
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

