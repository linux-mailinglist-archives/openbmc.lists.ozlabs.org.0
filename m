Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A475453DB4
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 02:26:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hv4xz3JZSz2yXv
	for <lists+openbmc@lfdr.de>; Wed, 17 Nov 2021 12:25:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bTiS7jnT;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--wak.bounces.google.com (client-ip=2607:f8b0:4864:20::104a;
 helo=mail-pj1-x104a.google.com;
 envelope-from=3c1quyqmkbyqwakgoogle.comopenbmclists.ozlabs.org@flex--wak.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=bTiS7jnT; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hv4xX2dyVz2xDV
 for <openbmc@lists.ozlabs.org>; Wed, 17 Nov 2021 12:25:34 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id
 iq9-20020a17090afb4900b001a54412feb0so473251pjb.1
 for <openbmc@lists.ozlabs.org>; Tue, 16 Nov 2021 17:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=jzis9D6fqTyyLA02o3dSfzs5yeXW2O0+Qf+DxR2EUps=;
 b=bTiS7jnTXeCNNkiePPmzv8eI5F02AN9TpuuVmOQmReiT1bttmG112fOlQa2HVmv7iK
 vaqEBALepUgjzMRx6MtkCQ/yMlvPV+V2UB1XXSG42pyi/mkcKk80NE7oG3E2Er2By4Iw
 aA2rTyz5rOvRZONXeD3K1GdbBbHYBjDKxA3B+jegyj3qAfQxakwKdwSnGzCAZZKr9D8S
 0i88cUzVgCzmVzhpLpqul3o6ducwtkzVXjgo4n6eevI3iq7iorMJ2yGjjECmT5hbNF1q
 tnOB6GZDkgwU89OAMty7oTApkK18b7Qs4fVGCcYFL2InhDBPtToim1uW5H5sFycHfOx0
 yLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=jzis9D6fqTyyLA02o3dSfzs5yeXW2O0+Qf+DxR2EUps=;
 b=pkhczAwXFWNGqMDnktDsxXZrH/a5fHhkNk5ZXjEE8IMm4bQY2agiAc5XoThkEbemq1
 XTDAf78vE/TMQ5ffVNlIlLapU9AKT2WAhwDPKIUv9tLLp0pPneyBu8v7/IBarl3utMCP
 YBmtqMfjpP2qskXdE5DG7+d53Zch57NF/moMtcQkzluuQEgflIDxJbIq5cuDvoPlF/1o
 avun6gEdfKhnEpluYJnoWszS9FUXrXTdk5Jand2KQMegBvsSCCXo6f73UXLvICKHqnC3
 Spma22iAy3oTnJYCsUSWVI88SFUdKaVlAun/DGtEJ4co0MHH0Y36ub5+4uMPMXQbQIZ3
 cZEQ==
X-Gm-Message-State: AOAM532E2qKBFBsvhvIsUAnRZXH7iW20boA52IWD3dO7pTBWNwvYPg+I
 Yc9qECTsMuZQQ/u5vnIyJ2c6gYY=
X-Google-Smtp-Source: ABdhPJxKbny7Hyg+azjy336lJqICWE1jEiVwfA8cEngT+yLZ0bq0tdD7vltBF4qoJcDK4j3FUxDsi/A=
X-Received: from wak-linux.svl.corp.google.com
 ([2620:15c:2c5:13:784a:d347:659f:f1f3])
 (user=wak job=sendgmr) by 2002:a17:903:18b:b0:141:eda2:d5fa with SMTP id
 z11-20020a170903018b00b00141eda2d5famr50271146plg.63.1637112331084; Tue, 16
 Nov 2021 17:25:31 -0800 (PST)
Date: Tue, 16 Nov 2021 17:25:12 -0800
Message-Id: <20211117012512.1081593-1-wak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
Subject: [PATCH] ARM: dts: nuvoton: Fix FIU reg definition
From: "William A. Kennington III" <wak@google.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com, 
 tali.perry1@gmail.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 "William A. Kennington III" <wak@google.com>, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The current definitions have a reg-name for "memory", but no
corresponding reg space defined. These values were taken from the
NPCM7xx documentation and tested on real hardware.

Without this definition, the FIU driver does not take advantage of
direct read support.

Signed-off-by: William A. Kennington III <wak@google.com>
---
 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
index aca0e0e390d8..c164ec9fc96f 100644
--- a/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi
@@ -181,7 +181,7 @@ fiu0: spi@fb000000 {
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xfb000000 0x1000>;
+			reg = <0xfb000000 0x1000>, <0x80000000 0x10000000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPI0>;
 			clock-names = "clk_spi0";
@@ -192,7 +192,7 @@ fiu3: spi@c0000000 {
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xc0000000 0x1000>;
+			reg = <0xc0000000 0x1000>, <0xa0000000 0x20000000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPI3>;
 			clock-names = "clk_spi3";
@@ -265,7 +265,7 @@ fiux: spi@fb001000 {
 			compatible = "nuvoton,npcm750-fiu";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0xfb001000 0x1000>;
+			reg = <0xfb001000 0x1000>, <0xf8000000 0x2000000>;
 			reg-names = "control", "memory";
 			clocks = <&clk NPCM7XX_CLK_SPIX>;
 			clock-names = "clk_spix";
-- 
2.34.0.rc1.387.gb447b232ab-goog

