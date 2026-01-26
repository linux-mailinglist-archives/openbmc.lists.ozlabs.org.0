Return-Path: <openbmc+bounces-1278-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KiFHizxd2l8mgEAu9opvQ
	(envelope-from <openbmc+bounces-1278-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 23:56:44 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B9C8E195
	for <lists+openbmc@lfdr.de>; Mon, 26 Jan 2026 23:56:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0P6K5THQz2xrL;
	Tue, 27 Jan 2026 09:56:25 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769422995;
	cv=none; b=b1E6fYVJ7JSLIksYzqwLJlJmFlpbpDKtv4JsoteNkhx0HYlanMmX3iBvZuDv8P0PT2CLG5ro1wdzACicU8nNo7/b3KmmV9fqWpdgmHLjV2LWHOpJoksqtIIpti5I+JNOYfXUS7OUKvH+TtfkElF7vQ80r0ifglxKJjFLIZmIYjgkbMus/D3yOA6QKiknOTJu3hf3JHt2P8GGiIy+ZgYR26+1iUoPJGNTWyRj+v5LAU98dQdHOspdxhVhwtGQ9XAxwCFkmlZYNky4ErvxyfFDthPWLz3KcD8RKbcowC4u8lHvy1NrNJLsuNE8WF35+pmai4ZKO6utijr5fQLpjyALYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769422995; c=relaxed/relaxed;
	bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2i9znG67foGH2VZWgP1fA/Jefy7okFIfs3aweRMqO5KXHRXpLBrBs3oO59CNQCLnkkx6RbXFYYO/LzXruUREXpn7nHfYd7HWUpmMCXYq+QLNBDGvWnifi8yRr1Utm9Exj1pLKiLgUHEMeBBkOTQod+RdYHYC1pbcakzLIZx8S0Ajt2b3ZQ6djmwbDH8AQCUvAbDJUx+SLutg8/fEAcVXaIpWDwF1Vyl0pcfWt2q/fDhrCHWSSmqUK7v+iO7FgOP90ajoX19AHWwTvxA8QfP3FZOe/wuHOKmzjhEnHQJYi3zBuPlDm0FqLBWdbjC3SNXUC9hh97/OohABqHzdWquqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XDZqqcV/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XDZqqcV/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=a0987203069@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f04PH103rz2xpk
	for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 21:23:15 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so2564180a12.2
        for <openbmc@lists.ozlabs.org>; Mon, 26 Jan 2026 02:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422992; x=1770027792; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
        b=XDZqqcV/5kMkuw8jCBb5tRD0JgmEibZEUqpz4zozlC+rrh/8912l55poKK54Il4mGs
         1olWctWuZcOZXweUD/XAex0apRncTBrEgrxnkIg0OgotVqVLm7Hkqv3misYsHl+AItE3
         5k3ZYDBVtR8vdnA2ksZW7Q6H9IqQCpmcIhvaTXIYjq5bzu3D0OHmiTBXHmdIP92ChYpB
         4scp4jO3nDoaVMy0phK9RWrwNNFpLFgK+UAW4MQhzgp0LsTG8uAxcygdw0r8euWGZvB7
         bgi5ijZSJFmSwOezwmpWHZIBIfyVgs5ivYJLS0H87cuj3nUab2K699e/VovnD2gtuHSF
         Hldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422992; x=1770027792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YG5zC5nRKtuL2pWJfWd5vRZ0VVU+WDTQCf+ZvwSm3ng=;
        b=DLCa+6uROyDZsri9fs8L0mx5LSxQKWQYxcNOCE/cUNnhalBSOeG2QuMf3KIwnUagRC
         utjQaJSHZQIZPpDn1cAcsJ5ONJwZAouOtw359rDyiBWIdyfJiuLiw+cz3MOSwT0z+SEe
         zAfebxnUk56wM3H63wtpzSLutdDC4nTIHeDu4J6rPk+myHuP0ULqgCAWBVnYMNueQZl2
         n8/036qthxn7UfD1NYXHggQfkPxZS5IDyhJ+q1/E2NnXBmMEVm6zsbPePZu2XLukMuwz
         dgaJ+2Lr4e8C/zu0hTTjJCVdv+zra+uC3Xt+UsCyKD8D+ALtgL/Sq82g5SC5E5sp3T6m
         oOLQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7cr4p2Ude21AOLAKT/zmJM8X5zICR7eGBQorkloQx4vatOUQOX0Olx8kuWe/UkRxZiqUF5WkF@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzAG8vZCv8fFdCH+SeEOFp6S5Zqj7+ilThjK4BGUN1saHHgjepX
	jOZ3WSlb7BV1dE8HYx30FHoXnaBMpTLs4OYX+O7o+VR0gQ8BVnRMHQf2
X-Gm-Gg: AZuq6aL2GMuCjFMELJ4dCegDjbvGR3qw2E/HWOXYESFLGOwKOdyhYwmvIuOSFqFTcOk
	RRqZGf+Yjd9+Pmzfyhq0FnWH57eXZW1GuW464fhjNtEUxQZ6PLl/jxf6zVQepxSb5iN7PSGuaaO
	bsn5MhrF+jjKbW0nXVMqMm6MFgPMwIruNvbI5d9Wwe1wEAvLfgJVQa/4dEarLqkTGOP8O2in9dw
	XgffEy5D09rGBJEcx+A42uoS6FDbo9qGL6SsaJYQlHxyoRUJUApT/oze7xfVqcyrRvxog6THNnP
	Jxya7aus+6yBl/NMq9k5W0FmjzAH+yAWuIjOdaO9/PT6QQhVYQyN88UccvDnaaJ+trGurhBXCvU
	labI6tEuprLOwOZX5yyow3KvNHNJfL0MRCotMNa0eo2lSMV4bdzDoeG+IpSVyIzohARIaxzIFaJ
	cE3F2TklXGGP0B8nz7gBHFGBDFIA/dtvkJZRLviN52NrufkRBAq9RM5eTJqeZazOa09mKm2Sqy
X-Received: by 2002:a17:902:e5d0:b0:295:425a:350e with SMTP id d9443c01a7336-2a845240123mr34633815ad.8.1769422992175;
        Mon, 26 Jan 2026 02:23:12 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd776sm84958275ad.26.2026.01.26.02.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:23:11 -0800 (PST)
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
Cc: alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	peppe.cavallaro@st.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH net-next v9 2/3] arm64: dts: nuvoton: Add Ethernet nodes
Date: Mon, 26 Jan 2026 18:22:56 +0800
Message-ID: <20260126102257.2619862-3-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126102257.2619862-1-a0987203069@gmail.com>
References: <20260126102257.2619862-1-a0987203069@gmail.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	FROM_LOCAL_HEX,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.80 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1278-lists,openbmc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mcoquelin.stm32@gmail.com,m:richardcochran@gmail.com,m:alexandre.torgue@foss.st.com,m:joabreu@synopsys.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:yclu4@nuvoton.com,m:peppe.cavallaro@st.com,m:linux-arm-kernel@lists.infradead.org,m:netdev@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:linux-stm32@st-md-mailman.stormreply.com,m:a0987203069@gmail.com,m:andrew@lunn.ch,m:krzk@kernel.org,m:conor@kernel.org,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lunn.ch,davemloft.net,google.com,kernel.org,redhat.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	DBL_PROHIBIT(0.00)[2.100.85.208:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[a0987203069@gmail.com,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[foss.st.com,synopsys.com,nuvoton.com,st.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,st-md-mailman.stormreply.com,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[openbmc,netdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,0.0.0.0:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,2.111.199.128:email,2.100.46.192:email]
X-Rspamd-Queue-Id: 65B9C8E195
X-Rspamd-Action: no action

Add GMAC nodes for our MA35D1 development boards:
two RGMII interfaces for SOM board, and one RGMII
and one RMII interface for IoT board.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      | 33 +++++++++++++++++++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      | 32 ++++++++++++++++++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       | 32 ++++++++++++++++++
 3 files changed, 97 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts
index 9482bec1aa57..ee32cedf3d9b 100644
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
@@ -126,3 +128,34 @@ &uart14 {
 	pinctrl-0 = <&pinctrl_uart14>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-mode = "rmii";
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts
index f6f20a17e501..b1b3e45280d5 100644
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
@@ -129,3 +131,33 @@ &uart16 {
 	pinctrl-0 = <&pinctrl_uart16>;
 	status = "okay";
 };
+
+&gmac0 {
+	phy-handle = <&eth_phy0>;
+	status = "okay";
+
+	mdio0: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
+};
+
+&gmac1 {
+	phy-handle = <&eth_phy1>;
+	status = "okay";
+
+	mdio1: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy1: ethernet-phy@1 {
+			reg = <1>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
index e51b98f5bdce..477515ba9a80 100644
--- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
@@ -379,5 +379,37 @@ uart16: serial@40880000 {
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
+			status = "disabled";
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
+			status = "disabled";
+		};
 	};
 };
-- 
2.43.0


