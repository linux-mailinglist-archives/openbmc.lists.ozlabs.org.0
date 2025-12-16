Return-Path: <openbmc+bounces-1031-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E87F9CC083D
	for <lists+openbmc@lfdr.de>; Tue, 16 Dec 2025 02:51:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVfyR62FBz2yFc;
	Tue, 16 Dec 2025 12:50:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765849823;
	cv=none; b=DSuhTPPIs7rKFb9MQXIczdHKR6qIpwZMOj2+WHV+KG0zUKBXF6IRw5srx7+HzlWkKt8ZpBGAcspNV10BqXDdMtkEVxvZic0i2tti1nx3CvMZV2bOoGe2nle6SNhOhjMlplcwgXeRAIzVng7SahHmpXDB0UtG6roqVhu6iQTQcaduO0y/wec0sZ7SPOdrcDfoTjshqvAbpGM/oTAb49hbYHXKxhMryVS5XNCo51Uy6asOpme/bBql9n7n2/hShujB0owIBMyZN6EGWhOO5q6OmNIzc8buBkhYyNzwCRl+ZTHbMz+EQuUVV/TgN/JIXvvlu768HtCwQ2bboFEUTcVv6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765849823; c=relaxed/relaxed;
	bh=c99lV5XbwMeYCb6C/UXSekWsYjPQbNGy9E5UjxIMP/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GW1xSVALLp0BycqBxmmPl2zrE1PByKqkJUg02vpw47pFgBvEDodMt0DrnS2gomL46ZvLft0XX5fFu+TTYGSG+35g7o4w05ZmvlTqqBF0ofeRQN3LioI9GRCPsGlfyp1qJyjV061EOx2LY+rhlXcuSMLbCBnSfq1Dot+UHGDnJ1ROCouo/v6Rbjcyk7PKi79NxwtGE0nOsG7UjJnbJGohccuLC01v09FW16TKnH5VtVKVuWydBqLCTTUEgCOAjj0kgPN6/gwaVS2hpwV/JiEUmhC4yBeK+cW+ipieHs5AxbvJqJmu40ymQHwmSfyUHWwDXkwMzRJlKV2oc/OadmULng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVfyR1bZ4z2yFm;
	Tue, 16 Dec 2025 12:50:23 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Dec
 2025 09:50:01 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Dec 2025 09:50:01 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Tue, 16 Dec 2025 09:50:02 +0800
Subject: [PATCH v7 3/7] ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251216-upstream_pcie_rc-v7-3-4aeb0f53c4ce@aspeedtech.com>
References: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
In-Reply-To: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Neil Armstrong
	<neil.armstrong@linaro.org>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765849800; l=2673;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=5iCz5vaaMTKJcJypZ4ZjGdGSe5ESf+2Fv7rlS6vHva0=;
 b=4Xf/cCJdCLRSpmiSlzel8Lp5eYu4jYVblVkkuPCIJxx2JX/004XO6r6TOwgs3kvCfBvkrpJwS
 96DsV9mC85aCh/TUmk06ogWS62f2w0yPt73/uB14nDp94aAdVqK95Iy
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_FAIL,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The AST2600 has one PCIe RC and add the PCIe PHY for RC.
And add pinctrl support for PCIe RC PERST#.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi |  5 +++
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi         | 51 +++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
index e87c4b58994a..d46f2047135c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi
@@ -2,6 +2,11 @@
 // Copyright 2019 IBM Corp.
 
 &pinctrl {
+	pinctrl_pcierc1_default: pcierc1-default {
+		function = "PCIERC1";
+		groups = "PCIERC1";
+	};
+
 	pinctrl_adc0_default: adc0_default {
 		function = "ADC0";
 		groups = "ADC0";
diff --git a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
index f8662c8ac089..a525c63dac3c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-g6.dtsi
@@ -379,6 +379,57 @@ rng: hwrng@1e6e2524 {
 				quality = <100>;
 			};
 
+			pcie_phy1: phy@1e6ed200 {
+				compatible = "aspeed,ast2600-pcie-phy";
+				reg = <0x1e6ed200 0x100>;
+				#phy-cells = <0>;
+			};
+
+			pcie0: pcie@1e770000 {
+				compatible = "aspeed,ast2600-pcie";
+				device_type = "pci";
+				reg = <0x1e770000 0x100>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+				bus-range = <0x00 0xff>;
+
+				ranges = <0x01000000 0x0 0x00018000 0x00018000 0x0 0x00008000
+					  0x02000000 0x0 0x60000000 0x60000000 0x0 0x20000000>;
+
+				status = "disabled";
+
+				resets = <&syscon ASPEED_RESET_H2X>;
+				reset-names = "h2x";
+
+				#interrupt-cells = <1>;
+				msi-controller;
+
+				aspeed,ahbc = <&ahbc>;
+
+				interrupt-controller;
+				interrupt-map-mask = <0 0 0 7>;
+				interrupt-map = <0 0 0 1 &pcie0 0>,
+						<0 0 0 2 &pcie0 1>,
+						<0 0 0 3 &pcie0 2>,
+						<0 0 0 4 &pcie0 3>;
+
+				pcie@8,0 {
+					compatible = "pciclass,0604";
+					reg = <0x00004000 0 0 0 0>;
+					#address-cells = <3>;
+					#size-cells = <2>;
+					device_type = "pci";
+					resets = <&syscon ASPEED_RESET_PCIE_RC_O>;
+					reset-names = "perst";
+					clocks = <&syscon ASPEED_CLK_GATE_BCLK>;
+					pinctrl-names = "default";
+					pinctrl-0 = <&pinctrl_pcierc1_default>;
+					phys = <&pcie_phy1>;
+					ranges;
+				};
+			};
+
 			gfx: display@1e6e6000 {
 				compatible = "aspeed,ast2600-gfx", "syscon";
 				reg = <0x1e6e6000 0x1000>;

-- 
2.34.1


