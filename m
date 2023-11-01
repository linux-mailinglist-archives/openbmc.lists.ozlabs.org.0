Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5567DDB2E
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 03:54:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A1RkyzpT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SKs6103RQz3cVH
	for <lists+openbmc@lfdr.de>; Wed,  1 Nov 2023 13:54:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A1RkyzpT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=jim.t90615@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SKs3p5VP4z3c5k
	for <openbmc@lists.ozlabs.org>; Wed,  1 Nov 2023 13:52:06 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28003daaaa6so5131607a91.0
        for <openbmc@lists.ozlabs.org>; Tue, 31 Oct 2023 19:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698807124; x=1699411924; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmwkelqn/7JORWuWKU7tVME89Z4SF2V95JuPgI0aBA4=;
        b=A1RkyzpT7a6no1KhDdpPDteZyMSwgAK10SYECSepuIky7JpiZZxv9qzFAZTY7/piZf
         WQfxrcOYZhvORgF9qREaCPJ2KGrbBxsAMSmY2xZKZ7u34MndJumaB7BDO2G4+J2fJWke
         3+As45Jqb1XxM9RcacUr2cgu4WM7yV9cRCGaWk5muwpgRcMk8YTvc5NDoH5AoXtrdKXt
         4k8CnPoz81tcT2VY9UXnKzyu8ggIv2gQu6xahouSz2EEG5Z4ICdg+Zy+tDk2yATyKloZ
         zpEvuL9Fa4aB0e3RV7FAUgcT+hyDOBcn9arwG215HL48P34uO5Fo5KH2z6shFaO9qO7S
         el8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698807124; x=1699411924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rmwkelqn/7JORWuWKU7tVME89Z4SF2V95JuPgI0aBA4=;
        b=MpTBhKBxJBKrHPBETaur/d8Ow6wTupLtUEVtWeDWMMF25wcwEg43aJPDrcSG8wj51h
         9Xx3rFsMUSqWu9P3zmF3V9gkYsRVziwRVSpuIEcJnvavG+efWdUQgN84+eaAOyaeKQa9
         kSajiowWB2o2s/aRjsg6udJ/2IJzKMyBNG+fia5tF9w1YFJmVkAogTBZvpkaBjapHzDi
         AD+q7AM1LNzcQhm7SQyll6opOCNgzDRymD5QXSxD5tlV+IRFe0U2hT6KLncVo3GZjmGZ
         PTpKUOxg/CurOW/BnRmdrMfh/lTwsjFJRLruZc9wEBPHVC6l0K7NavjkB968459KVFnA
         wA/w==
X-Gm-Message-State: AOJu0YydxT076qSAmOTvFOt93aZVc6lBBC5DkFeO5VXLzRcphNbm4d3C
	Cdn9zKw71gQ0yIxWpyNKLRY0ypPZzsU=
X-Google-Smtp-Source: AGHT+IGPeZ7SkF62y3r6noBv5kY3zrFlq7NmYfffaSBWaKwjeIQKC0ydgFiRp9eYBriAw9f7dM1XNg==
X-Received: by 2002:a17:90a:b001:b0:27d:5964:4ee6 with SMTP id x1-20020a17090ab00100b0027d59644ee6mr13549952pjq.2.1698807123749;
        Tue, 31 Oct 2023 19:52:03 -0700 (PDT)
Received: from cs20-buildserver.lan ([1.200.130.202])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090b068600b002809074eb3esm1709685pjz.21.2023.10.31.19.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 19:52:03 -0700 (PDT)
From: Jim Liu <jim.t90615@gmail.com>
To: JJLIU0@nuvoton.com,
	krzysztof.kozlowski+dt@linaro.org,
	linus.walleij@linaro.org,
	andy@kernel.org,
	benjaminfair@google.com,
	brgl@bgdev.pl,
	jim.t90615@gmail.com,
	robh@kernel.org
Subject: [PATCH v7 2/3] arm: dts: nuvoton: npcm: Add sgpio feature
Date: Wed,  1 Nov 2023 10:51:09 +0800
Message-Id: <20231101025110.1704543-3-jim.t90615@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231101025110.1704543-1-jim.t90615@gmail.com>
References: <20231101025110.1704543-1-jim.t90615@gmail.com>
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
Changes for v7:
   - no change
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

