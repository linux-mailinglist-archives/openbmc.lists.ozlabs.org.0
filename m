Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F1AA8AC0C
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 01:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcgJ25vCbz3cPm
	for <lists+openbmc@lfdr.de>; Wed, 16 Apr 2025 09:25:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744759536;
	cv=none; b=Vqdjc/9FEjfGsuIwK95Hd6GFVVCmAlTKIXxrPfMX0jDTKVN/GQ0L0nTygK7LVZ6T4hCyZTBWhYFWczjHgBCC5GeczbSes2ihsROCJTebK3uzEE0f/EoBv+9haFFZLNITWNKRRIncDWqjuGIRZogIFBt576aYPfhVfNmWawKt2wHgx/OVqxUnXwEh21k9TKpPeDeo1n5jMBd00cYEG43uqUkENHlFaagbHyZMeMJ12iU5W1+IO9Bf1QB+oBBupf//odK8RznFXpDTzqBYYEKMD7n1tsXRxOVrj1lCf4f2nuDdLpee6MR8Ii0rmtTutI4MZH1LuSdSgvOK27NR1wfcUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744759536; c=relaxed/relaxed;
	bh=Typi1g6KX7Ehfn4YypTfJOkSrzPqdsOWJwM5fjFePI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YholevbT0CvbYGSCOkesHWMsHg9kK1EOsAFaeYawqDMrxZG6CHrJiLhpFFP/l3ruRKauiLlSHfbWOXkzegLNPW0JqDnnueimfc+PdStZ6kyNyM/ryEMPu5vPA/HeDv5bfyem/o+jdzA87cvshZvrQwdukhfd3eH5SxTuPGI0aFbS70Py6KVTrYhQKbqugnozpD4CVOdvAp/5NbhuKDsR9F6jOpYsb84V791TajmuCPNZleo3JQaOtZ3mAjjTbq1BWPrOZ9W9+cuImssmURD5pYT/lQ26/dlLvL1C32Ywb/lnLXSFoAghhgh9YlxAS1yJeGzelZ+/RStAcJa/w7iEEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com; dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=I0a7MH7j; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org) smtp.mailfrom=wkennington.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=I0a7MH7j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=wkennington.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=william@wkennington.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcgHy0T8fz2xjK
	for <openbmc@lists.ozlabs.org>; Wed, 16 Apr 2025 09:25:32 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4826108b3a.2
        for <openbmc@lists.ozlabs.org>; Tue, 15 Apr 2025 16:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744759529; x=1745364329; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Typi1g6KX7Ehfn4YypTfJOkSrzPqdsOWJwM5fjFePI0=;
        b=I0a7MH7jaZhKqEmnxgPbt1UDJeQ39olod1L3qjsObxxesxN4KyTvkWKVy7blXUJGQ/
         fvfE/Gd4lsonvKEHvI7j6YP3WJAn52IUNrY/Z+sLIbXfWT5+UdoU9nb1OOm6BnJFW9MP
         KY2vRrAY9X3xEIGtclIYJ5kFzypA89229y57f2SYZA/L308GwzK97ig+/pP7j0DDcfxI
         hXlb8i70I2DCDXZ+Lu8VrQtce5aK3A1Thw2wE9QX3p13uk9dj5aAy+5kPP/G/bO2tQ1t
         0Z8qRQArnWRwyK6s8S6QI/GbLdPkmbSue1LC35SFnroveOBGLIZ9MeM/xM0cnRxZHSDc
         Izeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744759529; x=1745364329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Typi1g6KX7Ehfn4YypTfJOkSrzPqdsOWJwM5fjFePI0=;
        b=IOuupUte6+LXi6soJ1R1kmz/6tktkPnsYKEqNZmWyKKT+BvJBLzNb9LR3UtX77W+bb
         Ek1oTnFdw8bOhmjfegPUS5yesgmucoSmGtuWY3b6H5O9m9tQxvA3MBFX7Pz/H92P7EFH
         Pko/pMxWfngmY2Jc6LzeR9ONDZozGrU99IhoMrpC8JwK/Ns+Sgv5mGlG6ZgFFxgTf580
         jAWYLuK01Y0KttiTKfXLv1iAymZrYmZDpBeZuFfHDlL1mCQqvLjZ3TyXA8ZwMYXVqesO
         YFL6vSYXS8dEB4a7PRbeP/wFnlENf1uYYuCSUFpHuBX5buZ38xYphW7UgTuuXuToz07A
         Ym0A==
X-Gm-Message-State: AOJu0Ywfp+fenyq/fOqu948PQdXcJd0SFZwM5Ld6uUHDunJXiWTSQ9Yh
	GcGdbPzAMbBsWApQfHAxWi0j+HUDkjI8XbniweCoXJKtAyInaZ16QHR0g1X5vWA=
X-Gm-Gg: ASbGncuhIvu1V5jY3RXv84UGJouDx5H14RTVX/gm2sLx69qdUJzv0sUBz1inubUotZI
	80/Am1dZy1+x+Lg9P4l4tvweY/cfknEh5KlifAtIIoxNrSddAGOJj+kvAOEC2pYQ/rm+FT8Ccqf
	/Tx7kg27qa7G4dir5i0P/64F7n0o6ZFvnORm1iyaZfXfaeMsBJJfWDoQb2ahg2vKnSJ40mL0qcn
	/kFYpy9sSxc/YYTnDz/94q/6i61dFvwr42cHOPGqgmduoyW18FYzJdLAyjQCJLibHmpOcjUYvWX
	b3TDQnPJ/rcLFnx9dv1FbPDFsjzogEo06ZuAronjdnV2HIaf6QnG67+Uub6DqmpoSxn2l+Bpziu
	fNbIXrn5Es3MCAHoMP/lUQujIvD4=
X-Google-Smtp-Source: AGHT+IEzphQP3s7FZ5e4GcCAa2R4BFsGamVOHIKYq0Z6d5ikKqoVlCyBOojccFabDl5OP2cE0NKWaA==
X-Received: by 2002:a05:6a00:a2a:b0:736:9f20:a175 with SMTP id d2e1a72fcca58-73c1f8d3744mr1737009b3a.2.1744759529366;
        Tue, 15 Apr 2025 16:25:29 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:ef0:9d76:c8a5:f522])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c5e98sm9443850b3a.57.2025.04.15.16.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 16:25:28 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: Fix nuvoton 8xx clock properties
Date: Tue, 15 Apr 2025 16:25:21 -0700
Message-ID: <20250415232521.2049906-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
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

The latest iteration of the clock driver got rid of the separate clock
compatible node, merging clock and reset devices.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 16 ++++++----------
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts     |  8 ++++++++
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index ecd171b2feba..4da62308b274 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -47,17 +47,13 @@ ahb {
 		interrupt-parent = <&gic>;
 		ranges;
 
-		rstc: reset-controller@f0801000 {
+		clk: rstc: reset-controller@f0801000 {
 			compatible = "nuvoton,npcm845-reset";
 			reg = <0x0 0xf0801000 0x0 0x78>;
 			#reset-cells = <2>;
 			nuvoton,sysgcr = <&gcr>;
-		};
-
-		clk: clock-controller@f0801000 {
-			compatible = "nuvoton,npcm845-clk";
+			clocks = <&refclk>;
 			#clock-cells = <1>;
-			reg = <0x0 0xf0801000 0x0 0x1000>;
 		};
 
 		apb {
@@ -81,7 +77,7 @@ timer0: timer@8000 {
 				compatible = "nuvoton,npcm845-timer";
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				clock-names = "refclk";
 			};
 
@@ -153,7 +149,7 @@ watchdog0: watchdog@801c {
 				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x801c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -162,7 +158,7 @@ watchdog1: watchdog@901c {
 				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x901c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 
@@ -171,7 +167,7 @@ watchdog2: watchdog@a01c {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0xa01c 0x4>;
 				status = "disabled";
-				clocks = <&clk NPCM8XX_CLK_REFCLK>;
+				clocks = <&refclk>;
 				syscon = <&gcr>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
index eeceb5b292a8..a20f95c60a62 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts
@@ -19,6 +19,14 @@ chosen {
 	memory@0 {
 		reg = <0x0 0x0 0x0 0x40000000>;
 	};
+
+	refclk: refclk-25mhz {
+		compatible = "fixed-clock";
+		clock-output-names = "ref";
+		clock-frequency = <25000000>;
+		#clock-cells = <0>;
+	};
+
 };
 
 &serial0 {
-- 
2.49.0.604.gff1f9ca942-goog

