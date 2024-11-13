Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128259C7E13
	for <lists+openbmc@lfdr.de>; Wed, 13 Nov 2024 23:06:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XpcmK6Nyhz3drk
	for <lists+openbmc@lfdr.de>; Thu, 14 Nov 2024 09:05:37 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731475209;
	cv=none; b=GgTnijhREmy83EQ2+1Ge7Io7uARA9dK3TbdnVjishXPWiq0shv0oiws4cze21c1OufvQ4c+TLWb/46ck30dPosy3KE2MIdRBkegR9DnJdFOOGPjz5K22wVocNZBSbWpURvdVVFy18gPs/FDwsHyIm4MWhRSBnaJksCjgDPVhbTEtlSBkrufROqTWKsa+K7zhDcBpuK3PGDA7/SFrdTg/dVo3Z7+x5s+ATvp6qYcoac2tzvKd4+v5xL7ZYZaHgJF/gwXh4pA6N9nzMRXn8uPdXFU+yrhU3/XvL9jvLR5ATrP6PYZQUq+AJFbL5obGhV8dCIHiuFB1fEwm55W1asIhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731475209; c=relaxed/relaxed;
	bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NCrYvx4qq3JxeweHZicVNr9g3YuQrJWn5gRuFhbjWkagCc2jSfWA0hn59rj3sPEOwmVNpqEthzJ3CA3TlRk5kYdh0fw+Vd0P4hJtZ59BFqEChaj7joJQeZ34NguyZaL1KgEpyVnk+Jx3kAeOoM899qHRoqwEDkxjTENwKwogzXUVKrAZ8RWlab6pE1GgoKizPClGkfhoZS4H8ncP2a3prQW/74gojeEx0R3keqpyzpnFLiYFg87zZ8tf9XfsiPCcvfkSU4lST/ERL1cDdVZNnRlAK1Pk9MWz776HzExeNSquENxsg+DUe22uVqXY8QITUNZBb3yRnTCbE0pg54oHNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBlpJYQv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jBlpJYQv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XpBS82KdMz2xfB
	for <openbmc@lists.ozlabs.org>; Wed, 13 Nov 2024 16:20:08 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e4c2e36daso237660b3a.0
        for <openbmc@lists.ozlabs.org>; Tue, 12 Nov 2024 21:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731475206; x=1732080006; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=;
        b=jBlpJYQvwM0oZ3G52OeTlamdaPYOS0nfMQLJpapqOD+6X+cX49mj5Bw0RkrpNsKydl
         hTVvYIM4jYxM/odBeLix/d9jjVN/bYVx+IUAXy3jOZryKDa1mxum0A+m/cOXKUGldi8n
         1DaQT00hxc12OcfHaM3alydY8MJtAbTF8KDcrqBLdi4DTwVk3RzdP7cg/R+i1gwhQLNV
         tgvPYByxZRP2APujo6WhEgt3yYsAg2pCSLpNQJ4Nm9/UyFkfq5Uj4V5MJBHznj8oPBFO
         VqflJaEseGPgoGZb36EKxA5BOv+rR3gnd4NwXyHmEyoXVgL5dWlBdxu37OTnlNbC+kyY
         E3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731475206; x=1732080006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuVwXZjcL2Z1SKt3iutb0b2hQewo+6dCF311Yje5+1s=;
        b=xPk0rvmJ0KMrkFTwqwxf6br+7mYRTS8Mpmk0Z0NFAKEzvCf3RjpdBG1P8zah9SpCfo
         vG8Di8K0D1R+P5lJ1HBm6WwEzcl9eMYSFsJuCP05r/8hQo16+Zax8TN1NIHInPz2lsIv
         jW1r1v26SA7qF/bTVeD1BovsPZwDcy2bjIdiLr18RYI/R3MHFcuFmmbKv4AJrpF0GAkH
         wfnklg2ZKVhrc0d8d4DxIDcy+6HiZ29zt97MXTIYPoqZh/x96Jo4kb52f+xrm7zZFXOX
         RWkWlzcv1EDWfBC6Y9fUuHbaKGSS31o4WTVrLnBlMiiMu7KaIvrmsVlQF88EKk+r2ziZ
         EEDA==
X-Forwarded-Encrypted: i=1; AJvYcCVuA5vMC4vyT7IJIUSEZ91R6pDEIbWC3xQFyy7z8OXMLBrmLFejhHuTMODIHkclH/6Womxk71mm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKY71h/R7N8vHx1L5ThxbiBD/X2UIcRV7C7RgccIem03AzQIs4
	OHCkWqY7A2qZVhYSvuOsAjok4R0NirhiItGVfi3yVws3OEiCh7Nv
X-Google-Smtp-Source: AGHT+IGpB0xrH/V27To/lXeqTaqAnf+loTtbj7zqhrRLdFwxCNZXnx6HW51bRSHSDDQRKdW0iMg6fw==
X-Received: by 2002:a05:6a21:3391:b0:1d3:418a:e42 with SMTP id adf61e73a8af0-1dc23321c26mr29010340637.10.1731475205616;
        Tue, 12 Nov 2024 21:20:05 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079aaa01sm12644376b3a.100.2024.11.12.21.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 21:20:05 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com
Subject: [PATCH v2 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Wed, 13 Nov 2024 13:18:56 +0800
Message-Id: <20241113051857.12732-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113051857.12732-1-a0987203069@gmail.com>
References: <20241113051857.12732-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 14 Nov 2024 09:05:26 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII and one RMII
interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 52 +++++++++++++++++++
 3 files changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..5cc712ae92d8 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial13 = &uart13;
 		serial14 = &uart14;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
 	};
 
 	chosen {
@@ -126,3 +128,13 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-mode = "rgmii-id";
+	status = "okay";
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..08f5a7b5b507 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
 	};
 
 	chosen {
@@ -129,3 +131,11 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	status = "okay";
+};
+
+&gmac1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..7f7c7f8b7ad3 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,57 @@ uart16: serial@40880000 {
 			clocks = <&clk UART16_GATE>;
 			status = "disabled";
 		};
+
+		gmac0: ethernet@40120000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40120000 0x0 0x10000>;
+			interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC0_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 0>;
+			resets = <&sys MA35D1_RESET_GMAC0>;
+			reset-names = "stmmaceth";
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			mdio0 {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+			};
+		};
+
+		gmac1: ethernet@40130000 {
+			compatible = "nuvoton,ma35d1-dwmac";
+			reg = <0x0 0x40130000 0x0 0x10000>;
+			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk EMAC1_GATE>, <&clk EPLL_DIV8>;
+			clock-names = "stmmaceth", "ptp_ref";
+
+			nuvoton,sys = <&sys 1>;
+			resets = <&sys MA35D1_RESET_GMAC1>;
+			reset-names = "stmmaceth";
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			mdio1 {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				eth_phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 };
-- 
2.34.1

