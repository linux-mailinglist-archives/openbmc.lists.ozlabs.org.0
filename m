Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AF36337BB
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 09:59:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGdVB6fCdz3cKv
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 19:59:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMKfnKwM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eMKfnKwM;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGdSc2THVz3bjy
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 19:57:51 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id y10so11819824plp.3
        for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 00:57:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/LrnywkrjZ6Qfs+hNXfBn9CmvlX0OVs2pAPszfej7k=;
        b=eMKfnKwMv28riF4/1YDHxxK8upeNNMiNDjQpW6o9YVS+Jr8+795bfHT9iV16JsLvVT
         4R+DuRyRxtrXCFUOBSu0J0PQ7ZpTWro+WvQLwMhOA79LC7qatKMKILooHW7d2VUIRj4Q
         GFaDzHR3rQSNzlxn+SMa8IYGvvUA9KBlwR4VITz1PmSXik6FSxoKLpMddVwACxNbBnki
         aGmXJdVDkULulIV32etotTLKAzx+PpuDJT7+2fcvalTs1ExuB0b1MZN57NbvCz17ubmM
         PJ8ll8jP0cAamxd/I1a7jj7HwGHzn5E8lDfXrlUbmUXTW2iLZ+IHdg6JH+1G/8qxMYU+
         rDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/LrnywkrjZ6Qfs+hNXfBn9CmvlX0OVs2pAPszfej7k=;
        b=ggI9s7CRRSEi1inMvQEKM1ffVkL2bP1/7o3J/mvjJnIQ/Guv+BDmfRbcclkm0gBBXM
         w1P1NdKvZRJqLtv4NA/qzS+8+qhovzSnkLWdMVcTArDfsDsncxW+XY8ernEilzYKNwqw
         fwmvNwAeME9bjS4z+eZYoglYAJavbfdgrNyLpfGlezaSoN4c9jxbsJ9BhFKnoES7+cuK
         uaGOlBfgJRUDf8gdGo0OZpbX9ZRbN6Omqy75RLd7LggcLOX9FYL0PtZ0JDmlJQXSGYPS
         MXng2iFGQk0+BWMMkANIcC53fiSvW/TJilKXYb/PstUEVKGxWUcgu3+l4meXZjNl2p7T
         1deQ==
X-Gm-Message-State: ANoB5pkMotvH52GuDbguV/PR3GGCCQys5U2N9fBEMLYfe7HWQ27hRGgY
	WC0Uf5c+OzRmz/7C7c1YYyY=
X-Google-Smtp-Source: AA0mqf7R/9SWqm4vCdZgR/GaCtej2my5MbCo53bMaMnGAVFZ9TXhFDlZEVPGNFE3Ek/im26vNJqXEw==
X-Received: by 2002:a17:90b:3d7:b0:200:2538:1ca8 with SMTP id go23-20020a17090b03d700b0020025381ca8mr30950096pjb.79.1669107468489;
        Tue, 22 Nov 2022 00:57:48 -0800 (PST)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090341c900b0017a0668befasm11400246ple.124.2022.11.22.00.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 00:57:48 -0800 (PST)
From: Marvin Lin <milkfafa@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v7 1/7] ARM: dts: nuvoton: Add node for NPCM VCD and ECE engine
Date: Tue, 22 Nov 2022 16:57:18 +0800
Message-Id: <20221122085724.3245078-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122085724.3245078-1-milkfafa@gmail.com>
References: <20221122085724.3245078-1-milkfafa@gmail.com>
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
Cc: kwliu@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, tmaimon77@gmail.com, avifishman70@gmail.com, openbmc@lists.ozlabs.org, tali.perry1@gmail.com, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs. Tested with
Nuvoton NPCM750 evaluation board.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index c7b5ef15b716..293a550955bb 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -179,6 +179,19 @@ fiux: spi@fb001000 {
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
@@ -554,6 +567,12 @@ i2c15: i2c@8f000 {
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
2.34.1

