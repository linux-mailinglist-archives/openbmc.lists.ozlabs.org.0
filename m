Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DA5F72EC
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 04:56:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkCd1208lz3029
	for <lists+openbmc@lfdr.de>; Fri,  7 Oct 2022 13:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LAnK3FuF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LAnK3FuF;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkCbN4mXnz2ywm
	for <openbmc@lists.ozlabs.org>; Fri,  7 Oct 2022 13:55:12 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso2986261pjv.0
        for <openbmc@lists.ozlabs.org>; Thu, 06 Oct 2022 19:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKuqKLe1+m/HqTlQ77/BWNrLok/0e7I8ZaqDybK3EoA=;
        b=LAnK3FuF8gGBzmcTeSsu0qrAQ+J5Gd64NncpgwHEgI5pMmnGtQsoV46q2H/1wSkW2t
         9S+f4H0AjewF9rXnzqfABL37c96k2C31jqY3uaWV0j/uOwGM26RSAxivB1KVBaW9kUBS
         8HzXV+0a5uYW2jbMqICITkePrAxCx8ZaYOz9CVZYU/RA6FElCh0C1lD3YI4bVv+wpQo8
         OckNlIOPNvAXC8X7lVmIW4UyJLwn6EVP3iCs+Egq6OWDMwZ/BwfCTkUswqDuCfgAU4nP
         QbbHYW1XSuzdebXgG7JDxcVsaJNRc046dEg7ih/gb4b7OpDddTZ7jAXphZXmzxr2Ggrp
         l1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKuqKLe1+m/HqTlQ77/BWNrLok/0e7I8ZaqDybK3EoA=;
        b=DImSYAIHejnx/i5sWElSZZdbENloGYexj0iikBSG6jKMDMgbJlZpiqZJe0w42hZV39
         QJnValhXeBtsgb5w7ujYdmi3qImKZ7HqvBdw3FehCSCvXot/BhDx8atQb6bBQhp+AmSv
         7OzkZ4Ec5sg9XeyzO1Ul2G6L2cB1hDIWTt6DpjfBBJPhn2+zJFML2RWRt1jLKoycKExb
         nHlEzNqMHv/FyZFkc2vU/grkyU8zTib2Di2+V9ie9cl7n3S2rN8yXmcXOaBrmlW06Fvr
         7YO4uOxA7CXmCSrgdkn/lbe1dlUL8T9DZ3hcnkQ41SiCoRSMeV9cM5CXvVxiDpes04pP
         wNtQ==
X-Gm-Message-State: ACrzQf1NCn92lxU/BtR2m3y6B/NY1615aAwh3nuVBUEivd7V3W3RY2Tp
	aoXKOs7rTf8Uwe16BvSTML9jdTTNVxWSdQ==
X-Google-Smtp-Source: AMsMyM64j6ScfSFYbOE6kmnazOdOjTcCmSxOwwSfm3U4w+Ukn1YcXAb9Z9BIhORzqszR3LOecs37lg==
X-Received: by 2002:a17:90a:4588:b0:205:d605:8bcc with SMTP id v8-20020a17090a458800b00205d6058bccmr2892005pjg.205.1665111310110;
        Thu, 06 Oct 2022 19:55:10 -0700 (PDT)
Received: from hcdev-d520mt2.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id h12-20020a63574c000000b0041c0c9c0072sm476944pgm.64.2022.10.06.19.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:55:09 -0700 (PDT)
From: Marvin Lin <milkfafa@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v1 1/5] arm64: dts: nuvoton: Add node for NPCM Video Capture/Encode Engine
Date: Fri,  7 Oct 2022 10:54:09 +0800
Message-Id: <20221007025413.3549628-2-milkfafa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221007025413.3549628-1-milkfafa@gmail.com>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
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
Cc: andrew@aj.id.au, kflin@nuvoton.com, Marvin Lin <milkfafa@gmail.com>, joel@jms.id.au, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add node for Video Capture/Differentiation Engine (VCD) and Encoding
Compression Engine (ECE) present on Nuvoton NPCM SoCs.

Signed-off-by: Marvin Lin <milkfafa@gmail.com>
---
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 19 +++++++++++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 18 ++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 28ba3b4633bb..925e3c42278c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -152,6 +152,19 @@ pcimbox: pcimbox@f0848000 {
 			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		video: video@f0810000 {
+			compatible = "nuvoton,npcm845-video";
+			reg = <0x0 0xf0810000 0x0 0x10000>, <0x0 0xf0820000 0x0 0x2000>;
+			reg-names = "vcd", "ece";
+			interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstc NPCM8XX_RESET_IPSRST2 NPCM8XX_RESET_VCD>,
+				 <&rstc NPCM8XX_RESET_IPSRST2 NPCM8XX_RESET_ECE>;
+			reset-names = "vcd", "ece";
+			gcr-syscon = <&gcr>;
+			gfxi-syscon = <&gfxi>;
+			status = "disabled";
+		};
+
 		apb {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -782,6 +795,12 @@ i2c26: i2c@fff0a000 {
 				nuvoton,sys-mgr = <&gcr>;
 				status = "disabled";
 			};
+
+			gfxi: gfxi@e000 {
+				compatible = "nuvoton,npcm845-gfxi", "syscon",
+					     "simple-mfd";
+				reg = <0xe000 0x100>;
+			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index 577e031e11e4..4dbf65ab9dd2 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -65,6 +65,19 @@ chosen {
 	memory {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		video_memory: framebuffer@0x33000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x33000000 0x0 0x01800000>;
+			reusable;
+			linux,cma-default;
+		};
+	};
 };
 
 &serial0 {
@@ -493,3 +506,8 @@ &pin241_slew
 			&pin242_slew
 			&pin243_slew>;
 };
+
+&video {
+	status = "okay";
+	memory-region = <&video_memory>;
+};
-- 
2.34.1

