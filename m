Return-Path: <openbmc+bounces-196-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F114AD8247
	for <lists+openbmc@lfdr.de>; Fri, 13 Jun 2025 07:04:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJS3d26mdz309v;
	Fri, 13 Jun 2025 15:03:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749785737;
	cv=none; b=AbTJRgThvmvGXOfcKpHlU4/hdYtOj65cNQhM6zzX7ajubMcRi/0LfAyXrisqK/vP9iorfo0E8pHQTG+Wk8wsp2qgpCS/l7RCYGBYQSTDSeS+IKr+GNMEG/cNjuJWCzkr1hSOL3DZSmdqUyqsZjV7wcOL1pbj8GjsMm+mH5Ut6p6gZ7kWzkBtsIdZPbG3Le+Nzi8+t7ipXZy5hLlRtHVpL1lWw6T/Fa1Hh7Bp5eovOqNdzDMCYVYd/REKge05bjBhhx1GIbbgPNY/IpIS3U4wMZ5QTyddJWx8HN0MeNKLzs12FZ+sTKLz6JVDYSd/7ieO1KS5wLHgSdPx09W3q7YYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749785737; c=relaxed/relaxed;
	bh=QOTEEcWVIiz6O+GToF2cpyo+TZ3hUNgZ0JY3xul8rTA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kb4zFkBMzMTezUzX16UIl2dSwPGsk8oOWOlRtMPTIfEPZU2M3sAB4ZFWKaERpa0VNeiiBoMiywJ7RLyNsTmEHqkGAUH80lXbAZV2+U7Pm7X5LFdYtIGxdnHLEv48JXfsIBswcPytlgxm5wXf4pW+fgPckImXe18rf6q9i114IrC88zmK57o0J3Q+kSqi08dlnZrVNq2SqCDatRRqSSMNLDlaR61+Lj2pQQJUKRHtSXgc8OzC/FDH41eForneyNPKBkuDUdZPFVdY3VCgUMx+7uQ1AQqfu+d/YCoYttAWBWHGNnjfaAYo3V+2mX2z1Ji+l/Ikj5rFggWTOGc3BHY3LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 315 seconds by postgrey-1.37 at boromir; Fri, 13 Jun 2025 13:35:36 AEST
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJQ5h6Hcnz2xKN
	for <openbmc@lists.ozlabs.org>; Fri, 13 Jun 2025 13:35:36 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Fri, 13 Jun
 2025 11:30:01 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 13 Jun 2025 11:30:01 +0800
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
Subject: [PATCH 0/7] Add ASPEED PCIe Root Complex support
Date: Fri, 13 Jun 2025 11:29:54 +0800
Message-ID: <20250613033001.3153637-1-jacky_chou@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
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

This patch series adds support for the ASPEED PCIe Root Complex,
including device tree bindings, pinctrl support, and the PCIe host controller
driver. The patches introduce the necessary device tree nodes, pinmux groups,
and driver implementation to enable PCIe functionality on ASPEED platforms.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
- Update MAINTAINERS for new bindings and driver
- Add PCIe RC node and PERST control pin to aspeed-g6 device tree
- Add PCIe RC PERST pin group to aspeed-g6 pinctrl
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Feedback and review are welcome.

Jacky Chou (7):
  dt-bindings: phy: Add document for ASPEED PCIe PHY
  dt-bindings: pci: Add document for ASPEED PCIe Config
  dt-bindings: pci: Add document for ASPEED PCIe RC
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST ctrl pin
  ARM: dts: aspeed-g6: Add PCIe RC node
  pinctrl: aspeed-g6: Add PCIe RC PERST pin group
  pci: aspeed: Add ASPEED PCIe host controller driver

 .../bindings/pci/aspeed-pcie-cfg.yaml         |   41 +
 .../devicetree/bindings/pci/aspeed-pcie.yaml  |  159 +++
 .../bindings/phy/aspeed-pcie-phy.yaml         |   38 +
 MAINTAINERS                                   |   10 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   53 +
 drivers/pci/controller/Kconfig                |   13 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1039 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |   12 +-
 10 files changed, 1370 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c

-- 
2.43.0


