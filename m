Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ABC9F6FA9
	for <lists+openbmc@lfdr.de>; Wed, 18 Dec 2024 22:43:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YD6bw3W6Fz3fTs
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2024 08:42:52 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734522303;
	cv=none; b=P3sIXCzUKXTYENz42UF2YxdilclifUi6utePcR8GWeF5ofuR2pp/JqKQHpLxdltbT8iFOOZEYsMNXGv7VOA8DjIxhtWH9hXMmQVg5bbea0kKlfSLTnPO5fDs9AcsB6OIZ4/xen+Bb/rUXQ3ZJruXYSNI7Vw4MQ5U8qwhJNNM0HPVdjkDq6haoaTSxIlEtOPEbf3oMfGgQ6krKfFk0IAO200Df64zVz8elilQ9kf4IMedm+nOD00mJgM3fL/d4z8/cGSWfAkz95DViFQeqnwyIn3NvG21In1Thn8i3Un1qHeOG3sZOkWlz8d7XGtqOCvHCC52f5pMEud92Q6iYSU8fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734522303; c=relaxed/relaxed;
	bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nJCx9eanNTyh43nV5SzoSL/hFTZ1i//Cil+xWchVsVdoq5ZCQega58AsaOkhwmx9UNMk4WBexNR+zsid+B5TRx9Kp2b4d8avriaZDWTLjNr9gTs00wkHSO2KQVoX+pvagJJEHw4TkPaLBiFXzznQpTGjUnYYTZdWFTQP/Lu9uUnFQZ2DDmCs8Zh0JLBPToua69OsWEICc6wP7yJlZP2bnQuRl/Qlc33+bpjwoajz2LUl2ey1swcwOpjFtC/s/ZPulo+rDn76n26EqmwVmfyld62O8REAxdKoHn+mxcOKeQHwAoOIH/jZyS4L1/gwsnC1wrJHRhWU33fR2szwtrGuyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuwJwKyW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FuwJwKyW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCsL60LKzz305C
	for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 22:45:01 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7fcf59a41ddso3276694a12.3
        for <openbmc@lists.ozlabs.org>; Wed, 18 Dec 2024 03:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734522299; x=1735127099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=FuwJwKyWOFQmMHoCNDCPOCWCYE1YQXLWWKvqOVVq926ht0sJ2uaW2NmLVcTu1Qj2kO
         TGGuKMZz2J2l1GlBJeN5S2t8eyTlcOg1R/8XZWvKtyLbcPP3huIN9LlLMpk8VsZHbCR2
         XhDzylPLKsYIVu5ysJs6qHH9TV/VNopgSJswFkYRAg8bvIAoY/SCcQWCImgNYHn8RNJz
         3AI2M0jhtmbzVaTximQ9sa+6PFVGVKPRN709clTy7LxznCVTd92gYSn3tQ1oa1Ip3K/b
         ePHLf+2P69jH3vSjXKTOaYdrW7mkzujwO4vPjaM+xVlfkN1yQmvrRvLaAGZSRxYsK87H
         TyHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734522299; x=1735127099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gt4NnAFdXC2reJFPXxH+iGtIQoMQDkVtQ1A5Cdj5rvs=;
        b=u7ZRI7XGczI3jumsXCG0GLvlSmb/0oKuIdvrEw4aKN1sb1TgyFrrMAbAJtZXH1EO0X
         cUpsFD0v2Y8jYx590kusFx3jA5IMsADFjadeZEtLSoJwpmWIH2KBHnyEKH9IKsWtTjw/
         73TExFcnlt1kEaJbf+9KKtJDT4wrh1zw1ae/vSOCw/n22WCuONAkypWbqbwSW7qCvkPZ
         60wR39VlwIikWBHQjxdSbrZ5UdOxZxjsaMp6GVSQ3azwmHDKB9zP80zLjtpwyvFr74CA
         Ra6pV5stIUwZP4aXAlwPkkDnsH81CKGkG8xZh/wCO0UcK7mN0YbW5oiDbXJ6sKOI/Vna
         Ugsg==
X-Forwarded-Encrypted: i=1; AJvYcCXHaUILPmcJZXWqT468BblauZBB3mJkRbwmai57BuBCgxw4gsdXg5ZeaPG/TUGVu0MU+0fXlseD@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzp7+J++ZyoMU8i2OIRPz6XqeUoPYWy92bIyZr0UCce/du5HbjN
	VC6KK6VHXv1b2DuT0x7ojwR6LlAREzlWVNCNelELR4UWM6cwDM98
X-Gm-Gg: ASbGnctfB0ygSsPlCZsaF0du/PrJKDCxmGjo7V9X0bX3uDTlVfHjrmIfXQ3KclwCi5U
	dUw0+mRTLN4fCi0KAcn8OehLhwY0ZPcSNwvHrV2gTczSDDvQI7KFMQ207FZRtLErBMEB3Bt1/EK
	aYk6ujoHJCk/OsTItOSpZwC4XuNH6X9BOUJABw48NoRaC7LMxS4zvfmdBj5uFk16+zcfibI1err
	ETNpTqu5kZm5yF9toJEtgH3RQXRsHgsJGzc6r7D0Y9VdVIitUzguAxBmIKcRCGX4LRY6R7NRFl/
	OOQ8rFQ6Pm/t4FIOGGJX/w==
X-Google-Smtp-Source: AGHT+IF5Ib/90iPtMR1ImZoOuveUzNiTCwjJb1vOUxqFuNbDY471/cF3KL5yw0aq8vc9EHNJa/MnvA==
X-Received: by 2002:a17:90b:2f03:b0:2ee:8619:210b with SMTP id 98e67ed59e1d1-2f2e9378f01mr3756869a91.29.1734522299091;
        Wed, 18 Dec 2024 03:44:59 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed62cddbsm1324362a91.15.2024.12.18.03.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:44:58 -0800 (PST)
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
Subject: [PATCH v5 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Wed, 18 Dec 2024 19:44:41 +0800
Message-Id: <20241218114442.137884-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241218114442.137884-1-a0987203069@gmail.com>
References: <20241218114442.137884-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Thu, 19 Dec 2024 08:42:42 +1100
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

