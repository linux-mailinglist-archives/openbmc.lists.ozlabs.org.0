Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E759E0F08
	for <lists+openbmc@lfdr.de>; Mon,  2 Dec 2024 23:50:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2JrG2NP5z3fQn
	for <lists+openbmc@lfdr.de>; Tue,  3 Dec 2024 09:49:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733107032;
	cv=none; b=kVYuWuIUogdN3+N3I53VNra8VpGdQed8ncMjwQEfCZI5oFEMQPCT9A1qVOaFT3xEMEP9j+ii05bcX7bSa48ZTe/fpVPFTf2WaaOHHiF9JgyalqScoYlUjt82lnBk5B2qYpeucQl84sJWWl3Iil2St9gaJOsa5e6eVOi+wq2V8kDweNO6psk21Mxd64a4HzJT6PF3zrMUMq/EhEvBr9YizOCtB7e6n0uypEESHaNViqL9t12OWDn7kPq9+PgrIwzk/+EQHfC/N1KpOFx5Wn7QcG4UtS2bWYL0O/K7rwsgIRHs3XwpRSddgrt6Zvz/Vf6XUicpYcDjUIUJuu6VEha9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733107032; c=relaxed/relaxed;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dt+yk524UwcTm1PUmodxaDhTw+Y2cJFSVV7DZcYiINlMsSPWl7eM6TxZjW8Lrpd+ZfS67avyczIIcbAYWPTOGKLiXfyaOtyC0ROxpuuhTZpNQ/yeAarn6Nm9zjVWve6oXuwItbAU+vqCgyR2e1gQNaLAeYhMdeHVMLHPHhFp6BQPDgHLOjYGBfjkkdutc3aqkCg3BNEVzGURrratCcqT6mL7IfsjtpyIO9JJ6i/mxfoRljCfMp1XuuUHxlsKJLbNbGlb0lE3lw1FrDaNOUXscVtpI9ofsatRL+FVIKaL2kxmixtYlDXu7tLN/1ys9SWWqChJ/TAyFdgqAoFT5w0wPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X/MwLR+a; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X/MwLR+a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y1nxM1QXJz2yZ5
	for <openbmc@lists.ozlabs.org>; Mon,  2 Dec 2024 13:37:11 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2155157c58cso11938745ad.0
        for <openbmc@lists.ozlabs.org>; Sun, 01 Dec 2024 18:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733107028; x=1733711828; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=X/MwLR+aMLKV1VzpI7cMVJEvrz3MLkuzPA4/aYEHFVpFDp8haLEXBCCs/zQGaQwoz8
         V7lpBHD6RfMK2mOycmXw8X58pdjLJoptGk2f2M9MMojvNsd+F8/pcVQIGuuj6JGqSxRX
         jD/gwR2niYc09M5NImcVDKMg6mh0ykShqJ9FuY9uLrNGVtOB2hcFG2a/wmlUFcX1qmmX
         YS9/NhiM1ONSKI9Lub63roHoe/O5kqxxXv6bXABjL7PVNWMnZ7UEDLjdT4kDK81hzJT/
         jvmjorUU5syD+MgGLJPZwUsPOp+lOL9dOGxWrv5EEvjCIDglBWpRX0SuG/VABgPy+GqR
         u0Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733107028; x=1733711828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=G6xhmWIo7xaRuLDOSTvUhON0OnylzcAdAVXZ42tJ0PusRzq839sKS901aMukDx835f
         axXvgm+mEKrF/WsIep0FFL27nCxLW3377CKvBDhNJQk1FaT9wLL8/tL0bMRgV6IpCM9d
         OQo2aQmy+KLbGxBbYIKbqKP6Nzkf2WrchgKUIfnOADl2oYmMrSqJEBNr3AhmzOSEfjfo
         7E/nE8UqEEILU4L/OOT09ELw1beJGev++2uoh9lDW6b7tXhYpUBjAQEHRL2iBF5hFBkk
         VunbXDWzfsQuJ5iwLhkwfxbTdPMFV1ysBHEopgZuEG52+hi6+8Cs0159naH9O+spv1ST
         GmIg==
X-Forwarded-Encrypted: i=1; AJvYcCUqVOBtZbzOgN+qoKWtoHMxZjIS3nNCN+wGXU+yRlapVW4nM6NpyVOWCPIkfZPZZ7r3AtghgHIm@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzG8JwwldNVmxMfaeYttBB9mnmc/cw7oz1rziNaRjnqNV6hhw2e
	0p4D4tdyKrooebyHL1u8T+6DgrudN0UkSgAsvD99te0+WIy01GT9
X-Gm-Gg: ASbGncvo86DfXNt1CoIlDt/wPhuNZ9q0tAHOHkWwSuSV+7cKy7Z2785QfErmH0fPmrO
	o6TlzLi2myZLVNmQeowIaXIQc5EEqFu95bvr6YXBeLHuoscjcomTkrMkjNR5esPR9x61dzVJXMB
	CaJ6VZy3kmL2bwK6FDMLLwy4SClDHIfDoT7hsHKf14+f+69sh/+DQWeVWgnB9ESe7paDfz5sIRY
	4sai5/bqYsivM+pkM2WjtdEYpgQX5+cHOCAHZiUVGZyTmpwPg0mlTzsjhXY7dAFxNFfInfES6h8
	dVU0mU/rMa5bNiU=
X-Google-Smtp-Source: AGHT+IHG9tioNmTzw/gRzfRn8wxxDcUErSWfYqRhSyvuPLyqeXYrc/COqMFFgjtQSZCuz7fHIUyDNQ==
X-Received: by 2002:a17:902:f710:b0:215:4e52:dcfe with SMTP id d9443c01a7336-2154e52e013mr146944605ad.5.1733107028536;
        Sun, 01 Dec 2024 18:37:08 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2159ebee334sm2306375ad.67.2024.12.01.18.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 18:37:08 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon,  2 Dec 2024 10:36:42 +0800
Message-Id: <20241202023643.75010-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241202023643.75010-1-a0987203069@gmail.com>
References: <20241202023643.75010-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 03 Dec 2024 09:49:25 +1100
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

