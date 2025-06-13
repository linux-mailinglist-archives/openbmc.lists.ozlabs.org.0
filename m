Return-Path: <openbmc+bounces-192-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46570AD8243
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 07:03:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJS2g5NDJz30Lt;
	Fri, 13 Jun 2025 15:03:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749785741;
	cv=none; b=Wb8cClGHoOexr7PjQ5t1jjwSmqHdjhdmfUzJd/Nsc6GaCgE02cBs1Y8R0TCr/r2exuI9RsWEEV7uZjEV046MHAboSTptV047OiH63epubK6Y2thJYXTipaE1134Rp1SBhh3JeAEqjSqalCQtYtqEeUozPfIlWfA7N8Q1sJNLbpNrI0J/jUz4UFOd6zVcfdd70wHBtWyMYE1GQo643OsKuol6DMSyYGOGIALrEScXKRMC6xMpN4PTz7yML3AFtQsWKUNDwg8RG0TYpY/2rDxfzIerWWhXKdHrFDisDXFB6j5A5CgCoFZmP5wJWu6iUlkEiZ+HEXsbU9Y8o1h36ZR+og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749785741; c=relaxed/relaxed;
	bh=65WmPHyfjPpYD7f4l43ocWMBa8yXZsusQWVewwpUjII=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MzfcgPa9ChQe15ITSTLvwYVO9WSbkDMtzxBHDarxe0ulx7IDVdzr+LiiJV2RoFyDnqrcSGqqkaiwVSCy9FBsnhK0kYaAvBjD+CLSDHtN3J9KvaVHqOvrJ4mzrEtu5W+w5Bk3r4YSJD1R0fqsLLpcvepw7/pgDoqWGsWKbjM0KZVpyaLkr635pkOB+EG+jWi7tPepR4mMKWBx8vWkxVybKej6Ldy7HLwOJMKt8vxHQNjtwcg2XPirAxFOXUGZKVRx+2mIB1zSOj/vDqQk1KyFd+OBsoHlFBqcjTcH4NBppMX4JzwEeRRxVz2VZMIM8604mV38XHJH3yr3QRKftdjUfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJQ5m3ykwz30Nl
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 13:35:40 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:02 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:02 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <elbadrym@google.com>, <romlem@google.com>, <anhphan@google.com>,
	<wak@google.com>, <yuxiaozhang@google.com>, <BMC-SW@aspeedtech.com>
Subject: [PATCH 5/7] ARM: dts: aspeed-g6: Add PCIe RC node
Date: Fri, 13 Jun 2025 11:29:59 +0800
Message-ID: <20250613033001.3153637-6-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The AST2600 has one PCIe RC, and add the relative configure regmap.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi | 53 +++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index 8ed715bd53aa..d46a151e3c99 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -379,6 +379,59 @@ rng: hwrng@1e6e2524 {
 				quality = <100>;
 			};
 
+			pcie_phy1: pcie-phy@1e6ed200 {
+				compatible = "aspeed,ast2600-pcie-phy", "syscon";
+				reg = <0x1e6ed200 0x100>;
+			};
+
+			pcie_cfg: pcie-cfg@1e770000 {
+				compatible = "aspeed,ast2600-pcie-cfg", "syscon";
+				reg = <0x1e770000 0x80>;
+			};
+
+			pcie0: pcie@1e7700c0 {
+				compatible = "aspeed,ast2600-pcie";
+				device_type = "pci";
+				reg = <0x1e7700c0 0x40>;
+				linux,pci-domain = <0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+				bus-range = <0x80 0xff>;
+
+				ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+					  0x02000000 0x0 0x70000000 0x70000000 0x0 0x10000000>;
+
+				status = "disabled";
+
+				resets = <&syscon ASPEED_RESET_H2X>,
+					 <&syscon ASPEED_RESET_PCIE_RC_O>;
+				reset-names = "h2x", "perst";
+				clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+				pinctrl-names = "default";
+				pinctrl-0 = <&pinctrl_pcierc1_default>;
+
+				#interrupt-cells = <1>;
+				msi-parent = <&pcie0>;
+				msi-controller;
+				msi_address = <0x1e77005c>;
+
+				aspeed,ahbc = <&ahbc>;
+				aspeed,pciecfg = <&pcie_cfg>;
+				aspeed,pciephy = <&pcie_phy1>;
+
+				interrupt-map-mask = <0 0 0 7>;
+				interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+						<0 0 0 2 &pcie_intc0 1>,
+						<0 0 0 3 &pcie_intc0 2>,
+						<0 0 0 4 &pcie_intc0 3>;
+				pcie_intc0: interrupt-controller {
+					interrupt-controller;
+					#address-cells = <0>;
+					#interrupt-cells = <1>;
+				};
+			};
+
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2600-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;
-- 
2.43.0


