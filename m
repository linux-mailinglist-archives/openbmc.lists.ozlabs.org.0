Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 290EDA01C6E
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 00:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRCm673Dhz88dc
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 10:13:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1032"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735885997;
	cv=none; b=lE/kj3KBafQYoIMlA6eQC5P4jG4dy5BNUVq0+X5c8vyFXOkrHBbgnofhAPmgv0+tNRzNmR9BRSOLyND9e+Z6keYWW3lp9qsWOjdsRMlGpzEVhy/NlyJJl2Gb5LcLdymgSPx8Q4nqXPbGDj1f8cMEru24Ggcd3bgPD/QeGAMS6sLYvFTeAkldhU/xkSnb1Tx1s0km7cbXiQdzsslk4tdDr04kjKhJPJ0ZNbdmMBe5gl7sdV7LPKIZW5outzhi1wnxEAWUxnQBtX3RpQmtky8tAmoOi7uxyN4HTUfgyG+nGEyEvowZKXxmFrUdNO1ep9Ei4xtsOSs15zLu4AQvAoRwkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735885997; c=relaxed/relaxed;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=de/6bgto28y/t8eYSNeaIsaRVnJKWddHc2FD6+WjyvdiW9TjahEFKwBpI2diah/Unw9dA2wEJUjTGQ6jKiTdeNa4q7vPmFJd3kHMpR3zqjxgfrFmWlYZJA3VgeHbsU9lE33cnYbIm+7oUwCmio4NSAqgUOcVptZH8PI0lnSl/CYV1dv2fradZoheOkXeJgJLE2495YwF9Dp7TZGc83nDcsdvw7tEiTlC/uNn+wTnd3zEgPN24LXM1rsPDp5aqfMuThMf103UWAXEBdHCu43yVQf4Lszvo3Ru+VHrq921DgeVfy/qB9G8NBt1gIZyhRPdd3RrqFiHT27dFIo6v+NTwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cADZeCfX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cADZeCfX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPYg06tBZz2yQJ
	for <openbmc@lists.ozlabs.org>; Fri,  3 Jan 2025 17:33:16 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so16519551a91.3
        for <openbmc@lists.ozlabs.org>; Thu, 02 Jan 2025 22:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735885995; x=1736490795; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=cADZeCfXRnfEr/pTXy/OIFuIEdoWlomzCT9q7smhymoMlOLA20x/9tm3zpvrlEXQGr
         VuH57/RixBw/w2Ly6h2rsdzYgqfqiWHvDMo4MO1qq6d+xAc1Kb2bCdoAr+m+bh0oJwvV
         7N1PixkjlMIDT2ayReEBzcSJsk5v0DjAGYNAuB/h6dVd74Vr/1w3y4RoWShEeClsHr6g
         OphhMUzoNKAM6labvOYdPhGLWiayiIdelik6ya59TlGGDnLB2dxn5vf42Q2bAsp5sOYd
         WALkRntfllGBSK1fdib0qao1zxwjGAvVlnpyvH1mZVfWOmLQSLjTdJmYX6b/KZvuMwkO
         fegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735885995; x=1736490795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=rzr+TTXpYPyWqN2+/DKf4YthzgDVo/C4I8l59q9mjfYzKmxo/4hqWR97RSTNXFmh63
         XFOMgwUFH5CSRXNEMWA44ethzie/6Hdq7zvaezWCByMFC9r2jN98ABxptaq38RjYO+tS
         FVgNv9kv2OPC0fMcEh8VIR0LUAx7ehE5n2dZN3OTVc6eOuLofG62A91JEwRkU+pqlTVz
         Z68l6pT1y6cbxY4ziDGMclL9DjHNwu5PmH5I5Teflo1bBmc/nAuuMOSAmkiwNtrJv6zI
         qzrTMQzfBYtlCeT32uiuDB7J+JcLGVMzlJjZcthLPkz7uXp+XOhAj+ytLbdXFLB8LjOw
         RQNw==
X-Forwarded-Encrypted: i=1; AJvYcCU/+obC7QbhBapFGq2W5LDuifM0oGV1fLq9L4SCQmpLWza/rfLV1Tdm1YltDCY8xnnHi1011NHL@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz5UtWsxoq3UHDIHlnfg6VFc3IBSvmg5CV7Y3/xuBORUBopLL1v
	aOMu2M63bU6wNrtojULJdh/0u6VwepsvolNyYQChJolDZJTHY+OY
X-Gm-Gg: ASbGncuWRMdZ+SlqH2px6muFH7188452Yth8eZNHsOK4pqwi94EdztTYZ9YilnGFJrV
	a2DYP+BiuR0P5aujwTvD9kLvHioLV42qYaDW9piyR2ZHw6FMLJX/vY7cok+tZ1S5YjUxOANYwN1
	ZFLqUw56ozAmgdLY7RQth27FYwOmWq+dUEExtrjPf1HjkCE3yNzlUCXITH2AXT9Y2d3Z9vJBqpJ
	d2zCChtQ650I6rMTv/VUA2/M7qqGYiMm/PYyuRWdiLjCik1DS/p3hBtFWk8k4jtyHhRxX9bm3tf
	X1vgvzMkOI0W8T2k9JMWgg==
X-Google-Smtp-Source: AGHT+IG23kmj6DK+vlZPS0EcCMKK+e9+4Q3xk8hUGRJ9aeWgvaZ8mRigTjEz+v5buodrd7CiMiIrMw==
X-Received: by 2002:a17:90b:520e:b0:2ee:c9b6:c266 with SMTP id 98e67ed59e1d1-2f452e22592mr69746730a91.13.1735885995130;
        Thu, 02 Jan 2025 22:33:15 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ee26d89asm29427805a91.46.2025.01.02.22.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 22:33:14 -0800 (PST)
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
Subject: [PATCH net-next v6 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Fri,  3 Jan 2025 14:32:40 +0800
Message-Id: <20250103063241.2306312-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250103063241.2306312-1-a0987203069@gmail.com>
References: <20250103063241.2306312-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 06 Jan 2025 10:12:37 +1100
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
Cc: devicetree@vger.kernel.org, ychuang3@nuvoton.com, Joey Lu <a0987203069@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII and one RMII
interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 12 +++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 10 ++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 54 +++++++++++++++++++
 3 files changed, 76 insertions(+)

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
index f6f20a17e501..1d9ac350a1f1 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
@@ -18,6 +18,8 @@ aliases {
 		serial12 = &uart12;
 		serial14 = &uart14;
 		serial16 = &uart16;
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
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
index e51b98f5bdce..89712e262ee6 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,59 @@ uart16: serial@40880000 {
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
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy0>;
+			status = "disabled";
+
+			mdio0: mdio {
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
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
+			status = "disabled";
+
+			mdio1: mdio {
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

