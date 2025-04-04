Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB3A7C3AD
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 21:12:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTpBR5wTbz3cSN
	for <lists+openbmc@lfdr.de>; Sat,  5 Apr 2025 06:11:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743793916;
	cv=none; b=nOfOSjv6wGdpXS5gzRrWZjKBbuA7nEPLKLP94wJtvkSI8YVLBp0bM2hw8pbuqi1PELhF4+Zpyizi9CKtE8aUH1JZS9I/aNOxRmvMs+CsBqCUZmu4j2rBi8yadfgA++GPfmx4kpBTGwPZt+2CMIEhMsA0WfBu6wKTAFUjfKsRzg0fWj9HudttGCcQ6NN5uqb9g/tqA3G/mmyd7YCr92/e0T06iBy0HDKaIBidLgP7b4ACHC9eyPTEQHqd+iI3xkHpsqoljFiVDsOAod5Pva1IozfB+zlVVaLmJnf1CM7z7s2KQ54h8EXo5YfIfkh3i1OTqzTPIek+0uW20JHTym+0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743793916; c=relaxed/relaxed;
	bh=P2Rxwu2W6v3oVYS31v0sGvc4FOg7imKPmmcVRwTmg0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ouUnIcXSddqnXZXWobJ5dJhu2fHSEj2xesBvTtt8122pkK6nY5Qgw3Z9qJwWOf0zYiqpa8MzwQwWw08YUF93NTzTofFgOmnSGmrUC7EO6ZyJCB+4Z+hWZEsDWHvJ08LqxIRGMYMF0Jo9O4SGbJRc+5tq8HmFlhGhK8Jixl20UcuyDnBEx1dCXplQ0zfG8ELtFnD86PxJt1koQ5Bho7+EK6foesY/COPG/nAJwaGsu13w4TBbvpudYM5srM2To0klPcsa2IcX1m/7YhTTWLCi/UHxHi7DB468dv2rMIkiQrdxF4eCAOGfS6jaxTteesVNxuk4ixcG7JFjr4y/M93Nkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OKVlOC1s; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=OKVlOC1s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTpBL2sWQz2x9N
	for <openbmc@lists.ozlabs.org>; Sat,  5 Apr 2025 06:11:52 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227aaa82fafso22599475ad.2
        for <openbmc@lists.ozlabs.org>; Fri, 04 Apr 2025 12:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1743793911; x=1744398711; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Rxwu2W6v3oVYS31v0sGvc4FOg7imKPmmcVRwTmg0c=;
        b=OKVlOC1sWHw387704TyaL8ll0E8tx546buTTjWVI+3Vomot2dtjxVJ6ywVqxplAS9h
         e8IOvNM1QT6qvACy+a0UOTGwPqxnGzjwxvqRDgOmENEl8iqqb1Xh+ExbR9HLPsBo1hDr
         ++hKK7W31g5cz5l1kA8O3iBfVXelQgNM7pv4gD7d4PsNHEpPy39qPdz9CYBZiPRs57pP
         JZhIrTXDW962i3h4pdU/fEnsftQgSeUtRew4NCjdzcKG8FOVMtSSQtpVUnKsDNEXt9QM
         rQx30wP+f6Cc6gCtHYtLavTaYu4zpcI0/lbNZwtomHmwxzypPGdaWaKO9Ree24WcADk5
         mzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743793911; x=1744398711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2Rxwu2W6v3oVYS31v0sGvc4FOg7imKPmmcVRwTmg0c=;
        b=GG/10aFZ0qxxJjN2qfZdAkAzMYESqL/JoklKebARGCU1ps+T+Gi6+BokbTpPnCZfHc
         YgMM8LLN0K0OVHd+K5rA4NAD98p8yt+muu/KFMVd535BDod1amvjFOECLYk1KkzM0N9v
         HIa25RA2n2Qeb0W2tTfAq0vJqVS9AX42FmAcODrAYD28rO+YLM4PnG37969UFdoagCT4
         aoXJdvuzM5OTirg/Lu3P3WhYW5JTB3oCxPpKxIqhuuu/0qfqfEwreVZe7O1E2dtnSQsG
         HdfE5N94IwsBxk2EMXx/MoFeS20gajyg7m1tJA+nsKTwIdflvHvhG2T75Yy+UzHBPMl5
         /WDA==
X-Forwarded-Encrypted: i=1; AJvYcCX47dUXhcwHDID5bnIjOMIz5s5mdmFAoIHYzL2DfMX3WIVcE2zLRNIPluqKanV+CogPLylPNbn9@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBtUjSo9jIQ+i/2zTjPMOzhgyQIsbK3w6tK99CKpbp5VgLMuIn
	iij04Vz6jxqHTgB69xvEAP61YMC8P/XPZ4zJMUrr8jFsr12io5A/AguxzrBJZHk=
X-Gm-Gg: ASbGncuhwO6z7vSsB3m6Bfk2CniJ4QXAs6O0Kg36ZRHsjQaObeKa+Vp//d/WFi4ubLm
	+LaDRG5HY3jkV6g+b564AIAnaACQJAX0MlohRStjyuwvW8vyx8IhhqMqa1Qp+kvNojCHTxaTawT
	YD60vvhT7Gxil9I+kcio7ixnjeNj7WT0VVnky40tSXQlpzlYPK9CEZfVnnelShRRoF/nQ3SZriH
	nPIGhOhIIyuPxwgTbImj8cVNPnXfnoeI+vVqkSxY610sVU1uYXCy566vnh5+a5ex7WnLn/Q6Q+j
	HTico42ED1ZVktwjtSRh7vtspv1ocN3kBY+2LsK27MPP26V9EtDs7Hswdqex9KdQZ/GmYr6Pcyp
	zrfM/Wta7eDbu96pwhxmK4H+XeoiKTa4w
X-Google-Smtp-Source: AGHT+IEeaWCRdJ1SjZlMdTv0mv60UblHOMQY35gjKkojH5fDMz6tEXAoQmV0/K8Q81Wh61GvPwgWpg==
X-Received: by 2002:a17:902:ef03:b0:21f:6fb9:9299 with SMTP id d9443c01a7336-22a8a06cc5dmr54287345ad.27.1743793910520;
        Fri, 04 Apr 2025 12:11:50 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:2c9e:1e72:3ae7:b81c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e1bfsm36105765ad.168.2025.04.04.12.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 12:11:50 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH] ARM: dts: nuvoton: Add MMC Nodes
Date: Fri,  4 Apr 2025 12:11:44 -0700
Message-ID: <20250404191144.4111788-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, "William A. Kennington III" <william@wkennington.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We have the driver support code, now we just need to expose the device
node which can export the SDHCI and SDMMC properties for the 2 MMC
controllers in the npcm7xx. Tested on real hardware to verify that the
MMC controller is functional with filesystem access.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
index e337f40ae0f2..791090f54d8b 100644
--- a/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
+++ b/arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi
@@ -149,6 +149,29 @@ gmac0: eth@f0802000 {
 			status = "disabled";
 		};
 
+		sdmmc: mmc@f0842000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0842000 0x200>;
+			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_mmc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&mmc8_pins
+					&mmc_pins>;
+		};
+
+		sdhci: mmc@f0840000 {
+			compatible = "nuvoton,npcm750-sdhci";
+			status = "disabled";
+			reg = <0xf0840000 0x200>;
+			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =  <&clk NPCM7XX_CLK_AHB>;
+			clock-names = "clk_sdhc";
+			pinctrl-names = "default";
+			pinctrl-0 = <&sd1_pins>;
+		};
+
 		ehci1: usb@f0806000 {
 			compatible = "nuvoton,npcm750-ehci";
 			reg = <0xf0806000 0x1000>;
-- 
2.49.0.504.g3bcea36a83-goog

