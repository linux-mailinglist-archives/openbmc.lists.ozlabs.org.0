Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1E89D1AEE
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 23:10:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xshcx4Pyhz30HP
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 09:09:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731918462;
	cv=none; b=FCGMKWLtkgzrRkgxYsDRixdqRhwLuZeECG7bpjSVH2k5wVUhmRTwGA5BKKwKoqWrUedvmWm/K2g5Kq+YtlLWOnlbrHIO9LQ3D1zxAXcpxweXYHOgQz/v9kkRfDzeg9k9+zxVot8X6ne3U4KiGrGHs3+wrr4YT0OMnTN/vukD9XnwwD5SKQPMhIiZB9dDsPG5SvXYFDCOcpJ5j0cWDqiCfnENtrP35AJbk+t0y2D5nLe8AZvEt8ZErHPv+OC4TUy63hNIsT8jRUYcFBaX1ZBKEMz2BkXuVt9hgEdU4a5qx2EtgPB8TgrpWd1Np/i8r6t9crSTKbeYWUcoFaaYPO3Hjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731918462; c=relaxed/relaxed;
	bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zws+NMnidVseNJx/hJKTtAmea5s1nZPpkdeVi0Wi/8qkN0lW1g99BR6nvhJm/OY1sXp9rBkW/2jiXHMYZJyDDn4vlgYPSJtzn9giLH7/fv8f/cWsTNIhgjiVq17CRagAdJNqOC52vIYTQXb07Oee0euQXjojY69dp9XgnyssQqAKF5Mgzvd8xmcChxHXFZqR1etnYkgqKHoFkXwZ5Zl9kN2cpPLAojU0SZe5G0mCTfShY0h6N9COp7N8mEkY2eFiTBSa2NU+zmj53lxQ9VFmI00WooJK52gZ4iCE/RwYvfQiD6MJq9lZxh8tHPTem9FEhTdV6tNORTpKhVv9x67H3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q22Wudcv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Q22Wudcv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XsLNF3TnCz2xpm
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 19:27:41 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20cf6eea3c0so35147245ad.0
        for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731918458; x=1732523258; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=;
        b=Q22WudcvCdQ3uIKJHJn7C25GYO0jjSXFISJsaL5s8QiFbDd4s5vrGySIJJQuOErfEO
         vXwU2UHxgkyZO0CFlV8zC0nMJ3RWXDeAImz9VbBkOqAjptq7tNwcmOEbpHITcOZfblYO
         g4mqmkeSjlPc6EJ8E7Zr6KL3HzGtKE7pKicAI/xOJgPOY/DOILamaULj+69cYQ8on7OE
         48yH8RMzoMw0ayQQJpkM4ZrKk5yNMxkEwpKEWtBYQW0pILOr0UD6hhCMXytoCZIlZU4S
         nc18fsF48JoQlBUBKtYwsjPmMvxNyu2shyFpwalmggC4ssQJfVjK+dOxxE+nvwujzmHW
         SzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731918458; x=1732523258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Js4XwaykndxmdA7yiX8pwiKscaOEEt+IBgrF0wpJ000=;
        b=ilaEbyVTZs0/HBjl96CeZqSbCM5KU0Z4iIooI018kZRZ08ZEctR8M9sAiN5wVpvJLi
         OvMu2+5fFW+W+Hs2LbafIfnS4cgAxbpNJgq8B3ZxjGnFHfjzOp+KE/O5gBIorsW8LgK3
         fr5+vVNKvMU/PnYiGpvYKhzgKSsfyBtqjBRfbzmtimYKDm/XcoGZhm2kE3SQqJ9/+8VQ
         rQeMRUQ4KiCYeS+C7qNu4OdEt1uCbmab8W21zKEx5DOjRudzkzih54ox+cwZ3pQdupox
         9vVwYxofWAPWKsc12ZO0KB7+VkipWHugET1p6VsuOJ1XhzJF5dHGp8o/SSP2b1GyyG/Q
         8jpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJHeuE0TfXLZCj/kVd+OUPp3qlJGkh+VHHJcHTRXQ5Llr/E1Nj09DCPtUwu2X/GrsI/1Qlbmd2@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyUjhacreh+JdX8NyegGHHVXG31QncXnfTI4EzrxYan1zbhiL7W
	Aaf/Ox1gIeawNEoQicwrbKVo99JDUdLK/LlSsmmLotpKG83Chh1j
X-Google-Smtp-Source: AGHT+IHsm3Txde2aN86FKECvf2CdflmYt/JDCEML/U6tfMKKmqNWqaQEFWe+BBbYl2dbFEA2ZfGw1Q==
X-Received: by 2002:a17:902:f710:b0:212:c9d:5f62 with SMTP id d9443c01a7336-2120c9d604amr71094745ad.52.1731918458392;
        Mon, 18 Nov 2024 00:27:38 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0ebbf9esm51883815ad.45.2024.11.18.00.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 00:27:38 -0800 (PST)
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
Subject: [PATCH v3 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 18 Nov 2024 16:27:06 +0800
Message-Id: <20241118082707.8504-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118082707.8504-1-a0987203069@gmail.com>
References: <20241118082707.8504-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 19 Nov 2024 09:09:45 +1100
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
index e51b98f5bdce..2e0071329309 100644
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
+			status = "disabled";
+
+			phy-mode = "rgmii-id";
+			phy-handle = <&eth_phy1>;
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

