Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB0F7D4B96
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 11:09:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TOTC93eT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF5pp33lzz3cTD
	for <lists+openbmc@lfdr.de>; Tue, 24 Oct 2023 20:09:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TOTC93eT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF5mF74bsz3c2L
	for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 20:07:09 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c0ecb9a075so28307875ad.2
        for <openbmc@lists.ozlabs.org>; Tue, 24 Oct 2023 02:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698138427; x=1698743227; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89is/1LnKO4AiNutFqqrfRo5OqHC095NE9dIPIBTM0w=;
        b=TOTC93eTYpp0T2QhnS8TUvecvDiz8r7xajtS8Ufzy3l+RvWChSDa1Nl7i2huVJwpO/
         xJ40Z11ndxIzWmzOTXXjwgeoPC/EUFI23xgb8fD1cv1DWgPUWwZgyWtzleMa/hqryedd
         YC7ABP8mGftlynVB3C06bxFWoM8n4auUAp92ZEPxHEOMa8OIrDz4YTuB+OGgIObx4zit
         RciTA904t+/xrKhG9NBBDTttvv4AgKRZzTM/X0J2/ZYgxIPgbGPyE1YVAHMBMURIx22K
         KXDJR7M0p//wVMEMOdcft5lEQ+0IqZCPd8QdOhDvtu+cjwRBM+9EZW8P/FaezAhF9A/r
         3C3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698138427; x=1698743227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89is/1LnKO4AiNutFqqrfRo5OqHC095NE9dIPIBTM0w=;
        b=IJAqaA6G+kKkKsjAm0B+hb1EZocZpnPeaeY7jg1XxSPj4MbO91/8nSpySPd3ym2SGq
         3VPSN+4pymejSZ16//2D6C9GDcAEVAI7zk/wqDfW4zelmkV4rhwVHjQfmRHeHC/mnegl
         q1q+GAStJ6Ci37hJXgZi7yWG4++moY4z19csNgroy0hlDkoXxgXIG+wZykFbA7+nCZmf
         N5/1H0VHINzspfeS6rWUluPMBsuPihXMud34MYIYvo6HKmvzEVdiKqDhsmYelhN+XMTB
         nWK6nxddnqRQtTAxjm3SYvW2xuj3irKO6B7ro1p5owHlbMC7SJf/ZBfMfR9fDwSfYhez
         O8rA==
X-Gm-Message-State: AOJu0YyiUv1p/gbqR0BqmX0PZNesdfYe8bYP7MnCMKawW/MQGFrkJhQv
	mbLNIymerO6PE9PMOJwiN10lcDywmmo=
X-Google-Smtp-Source: AGHT+IFXCVSLmAd/Gy9fHDpoMR+ks/WKOE5Azs1P5XZslfAFdwlkPp3EP3ooHLrNau/WIBImlRnVAA==
X-Received: by 2002:a17:902:e80d:b0:1bf:d92e:c5a7 with SMTP id u13-20020a170902e80d00b001bfd92ec5a7mr10570535plg.28.1698138427012;
        Tue, 24 Oct 2023 02:07:07 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.144.223])
        by smtp.gmail.com with ESMTPSA id c24-20020a170902d91800b001c9ab91d3d7sm7055324plz.37.2023.10.24.02.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 02:07:06 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: jim.t90615@gmail.com,
	JJLIU0@nuvoton.com,
	linus.walleij@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	brgl@bgdev.pl
Subject: [PATCH v6 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Tue, 24 Oct 2023 17:06:30 +0800
Message-Id: <20231024090631.3359592-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231024090631.3359592-1-jim.t90615@gmail.com>
References: <20231024090631.3359592-1-jim.t90615@gmail.com>
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the SGPIO controller to the NPCM7xx devicetree

Signed-off-by: Jim Liu <jim.t90615@gmail.com>
---
Changes for v6:
   - remove bus-frequency
   - check with dtbs_check
Changes for v5:
   - remove npcm8xx node
Changes for v4:
   - add npcm8xx gpio node
Changes for v3:
   - modify node name
   - modify in/out property name
Changes for v2:
   - modify dts node

---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index 868454ae6bde..df91517a4842 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -372,6 +372,30 @@ &fanin12_pins &fanin13_pins
 				status = "disabled";
 			};
 
+			gpio8: gpio@101000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x101000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
+			gpio9: gpio@102000 {
+				compatible = "nuvoton,npcm750-sgpio";
+				reg = <0x102000 0x200>;
+				clocks = <&clk NPCM7XX_CLK_APB3>;
+				interrupts = <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				nuvoton,input-ngpios = <64>;
+				nuvoton,output-ngpios = <64>;
+				status = "disabled";
+			};
+
 			i2c0: i2c@80000 {
 				reg = <0x80000 0x1000>;
 				compatible = "nuvoton,npcm750-i2c";
-- 
2.25.1

