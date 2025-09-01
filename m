Return-Path: <openbmc+bounces-540-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FB9B3D928
	for <lists+openbmc@lfdr.de>; Mon,  1 Sep 2025 07:59:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFdVy4zbsz2yrr;
	Mon,  1 Sep 2025 15:59:38 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756706378;
	cv=none; b=iBdLLm3ILen5swg0sjxq3hksP1sMZSQRDOat8YE8YGRP5/gUmTrn7evlJbsS8xbEB57heQp9+/P9LyC7L27noOEJs8bsa1mq/Q3yhqmtonlBcCkqzAWafa67FhGWw0L/WqnWTnVkgEvZqpFNsXStP7zRUdHp4dYU4OgBVHWmkevzTOgOnFLLkoCBmVIwPwvF6tDC/Onv94b6nXNU9JYhrh2d5T3s+PQw1IL49cy6sce8I44U1NB12lzhLwOzH50NR4pyQJUQO8pAR3hDskvHyvz1DJkYJUBdik8jZaiJHb/vqywiO1qhzhusO6IvzjVKrz4WXBuVWjni5N1BKLHzxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756706378; c=relaxed/relaxed;
	bh=X5jJzhHlol9iuCRH9wcJdJ+CUHknf07sIOCVsOGsGDI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OQrDBJ8pjFnUwKwusGgK/imYdCMNEGTvhB2vYONh/dK0kbWWwVw2JHL7eieLblY0yxM/2/VbIGsZa2wtYmKuH3N9zNi88zSq82pYzPaO/fKTNTeNwvOkbhH6DHZMsZLncB0avihG7o4rfB5vRfEiDvlEiboYwK6rFbj4W2ATrm/YJkduR53VAo15HpH3cTE5Y1La7j3e+6HypblYiuPDzK6KDa2wODN+LARxoPRG47mVRmtxitx6g70NctngKCaGQHE1Kv0BvZFHjl0p4TadtEeGEsDUVs0+0cPdBC/X26LKLQapumPUg6xRWdg5Wm7HsSWexyUy6K6r05cWfx6/og==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFdVx6BNtz2yrm;
	Mon,  1 Sep 2025 15:59:37 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 1 Sep
 2025 13:59:22 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 1 Sep 2025 13:59:22 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bhelgaas@google.com>,
	<lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<joel@jms.id.au>, <andrew@codeconstruct.com.au>, <vkoul@kernel.org>,
	<kishon@kernel.org>, <linus.walleij@linaro.org>, <p.zabel@pengutronix.de>,
	<linux-aspeed@lists.ozlabs.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v3 00/10] Add ASPEED PCIe Root Complex support
Date: Mon, 1 Sep 2025 13:59:12 +0800
Message-ID: <20250901055922.1553550-1-jacky_chou@aspeedtech.com>
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
Currently, the ASPEED PCIe Root Complex only supports a single port.

Summary of changes:
- Add device tree binding documents for ASPEED PCIe PHY, PCIe Config, and PCIe RC
- Update MAINTAINERS for new bindings and driver
- Add PCIe RC node and PERST control pin to aspeed-g6 device tree
- Implement ASPEED PCIe PHY driver
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Jacky Chou (10):
  dt-bindings: soc: aspeed: Add ASPEED PCIe Config
  dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
  dt-bindings: PCI: Add ASPEED PCIe RC support
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
  ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
  PHY: aspeed: Add ASPEED PCIe PHY driver
  PCI: Add FMT and TYPE definition for TLP header
  PCI: aspeed: Add ASPEED PCIe RC driver
  MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml     |  179 +++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml |   42 +
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |    2 +
 .../soc/aspeed/aspeed,ast2700-pcie-cfg.yaml   |   46 +
 MAINTAINERS                                   |   11 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   56 +
 drivers/pci/controller/Kconfig                |   16 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1137 +++++++++++++++++
 drivers/pci/pci.h                             |   12 +
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/aspeed/Kconfig                    |   15 +
 drivers/phy/aspeed/Makefile                   |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c          |  209 +++
 16 files changed, 1735 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,ast2700-pcie-cfg.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-pcie.c

---
v3:
 - Add ASPEED PCIe PHY driver
 - Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
 - Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
 - Update the binding doc for aspeed,ast2600-pcie to reflect the changes
 - Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
 - Update the device tree source to reflect the changes
 - Adjusted the use of mutex in RC drivers to use GRAND
 - Updated from reviewer comments

v2:
 - Moved ASPEED PCIe PHY yaml binding to `soc/aspeed` directory and
   changed it as syscon
 - Added `MAINTAINERS` entry for the new PCIe RC driver
 - Updated device tree bindings to reflect the new structure
 - Refactored configuration read and write functions to main bus and
   child bus ops
 - Refactored initialization to implement multiple ports support
 - Added PCIe FMT and TYPE definitions for TLP header in
   `include/uapi/linux/pci_regs.h`
 - Updated from reviewer comments
---

-- 
2.43.0


