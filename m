Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50628A0C5E1
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 00:50:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YX8C12CtPz3g12
	for <lists+openbmc@lfdr.de>; Tue, 14 Jan 2025 10:50:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736747786;
	cv=none; b=OHf/kADQTzWGxbHmALO643QlsRvjZFw/VaxFQ7cVO4E18XW66xPUKad6YgBowd51JNiCP7uVDY/7Z/0TF1L2s3aa5cPAbpAWN0uq/WUt7gHjQMzvloy3PBlzxF+H/bCfW7RAlYPw5t/pgpfCcogr36rnQoy2tuD5blHHVtUEWe71Xv8v4hlhxNiCr/nSlvnuBV65a7hXPdaO7txQEQaVUxFmOdOHXh8XCmCLFYhT5JmzdAjM8dSJ1RFolFD62q/5o8OH1EScIhjc6tPCfBkVbDYjee1gAHogO9KM9ByGaNvrGh/nNZJg/1bm1DurK6L4+EcXrZcs9qKDIqk6G2BYEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736747786; c=relaxed/relaxed;
	bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZtSHhFqoGazOfFJEl1P+xalbSFTpFMpXvjiQMKFN64KQdszBhOpY9wsYsVWkb7t5UIxt6UrqLCNG4wUOolaS3kWbiv4zReiQb0zVv00gG9hNsNPqptQsmZ5VlKmogd46ifY+1CvYUEGR7uj1/MyGHLBxde67dPOASVm5ZWL6YieZi+L94+FpXKtA6hdEdSsWwXFfrvzeTqzNJVEMtafeCDoGgTYyrHvdy8PVzebqCTkLaGw9SQ+SIEwZvmG0bda4UmnIfj/y6oIMPlVAJUpPdYNJfT/xgelz6MjkYs4t++GpO/GPyjJ8jlQ03Gec/Thn0bTA41YxqV5Dkv2awIziEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZZAOiQz; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mZZAOiQz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWhMs5psVz3c75
	for <openbmc@lists.ozlabs.org>; Mon, 13 Jan 2025 16:56:25 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2efded08c79so5222899a91.0
        for <openbmc@lists.ozlabs.org>; Sun, 12 Jan 2025 21:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736747782; x=1737352582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
        b=mZZAOiQz4SjSR1UZtIFwvCHnWh/WIZgJh9K8/LeS9nzV/tCqVqNDilSstgVz9Osa1P
         7BRUu7PwNDlsPXtdKxpskDTC6RVG7z84q0Q18ZkcadP5AkWxPzvo8YL1PbJUZGqXJRRq
         9gLonynXadKC7TLYUOsXuawTaetLX/FKUYBQIYyFJUtfi5Xhmcro3wf/dxoS+adQUSrr
         JvQ4W4j5vPU/RKtMMQg3o4d7i860yooUbHMli60CXOF74cc3cGkQVuES9pgPXsosZ9oE
         zZ07WgTIVxZxwucAIciHwXnFcB4r85pchAl3EOvAehOPdVgMtEhompExWLwR51aivJ3P
         wBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736747782; x=1737352582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FSQkyqkgqScHqXzJErwqcEAXUJOMjLKNEmybZd7oQIk=;
        b=xT+Fh6TwMhUfP/8HwmDsgaz4DYcWauDsHtp6VyCFW8HfZi81X0Fc36kqfu3zKHP/Gv
         nLWABIcOWZMq0rqtiTCvfBKltVIgZq9jzyqijqI08jJywjoC9knkUcaK0fb9DSVSeXb3
         wxT48ZBp5QrwaqQdh0mij1eJGizEToMPbehjfeqKIw/TDn1XJv1n1TU0XrKXDZ7WXZn/
         wKDDd8HLc5+PZ82Cg0IXQJapzAmN240pwxGadOpIHoUxC60oLx1jvfZLDu/1Fjmkicgu
         aWGJkAYx2ETQjvW/+GfeDyOFk+rHjemReng3YKF9hymUxNDSj9bysE9JWmCeLms8+J2K
         5Bdw==
X-Forwarded-Encrypted: i=1; AJvYcCUy4kYsk8pD0YP7YU35+/udwgQKfwCPHWFYjODo0T0hMtgS7uycLWuhIfrstMqkmHmxkvyH2Smf@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5A/lOMbZg/KsCBzNRzcbLY4/s4hKB/Bc/xgbgh+HoDWwgbHVz
	cDQ0kCaWzmVuBpojcxesv30Q9jE1fsy/mJ1HbU2lBScVyqUngNDa
X-Gm-Gg: ASbGncsgLjAjYsns55iZutO0We0V1OvPLhT8VvIwb1J7skyi2NbtztjbL8Y96kCcMvQ
	8KfQaOG8tA1XVwfjPykRljQ/Ow8xaw0DBRVeDoewSITnjSBSQNUTWvVswMxMtJkUqZjcELTKi2o
	Y76LqIMeyeFyZAEWw4n5tkQrAwMgHcq9bBCf0AExGbCGvuUiDjhEsMjLN4n5bpHKTIKn1NPNLOq
	Rwn9bpOms2e8vpwtNwR8J9VaaxQxLXzp1q+HASOwo6dCaGpfknTiLAXSjdG7WLFgYKTaIbPbfNp
	R4ct/mTrxAYDZI4GPKdUaw==
X-Google-Smtp-Source: AGHT+IGK0pCUlGTYvHgXQyXKxRtr0riStVYSpTVlyPsCu8rNr3XTWRKoYOATBlijrdcahHUK+OCu1w==
X-Received: by 2002:a17:90b:224a:b0:2ee:49c4:4a7c with SMTP id 98e67ed59e1d1-2f548ec8a4emr31105280a91.18.1736747782317;
        Sun, 12 Jan 2025 21:56:22 -0800 (PST)
Received: from yclu-ubuntu.. (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942188csm7768806a91.23.2025.01.12.21.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 21:56:21 -0800 (PST)
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
Subject: [PATCH net-next v7 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 13 Jan 2025 13:54:33 +0800
Message-Id: <20250113055434.3377508-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250113055434.3377508-1-a0987203069@gmail.com>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 14 Jan 2025 10:50:13 +1100
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
two RGMII interfaces for SOM board, and one RGMII and one RMII interface for IoT board.

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

