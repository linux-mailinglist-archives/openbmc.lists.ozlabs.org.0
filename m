Return-Path: <openbmc+bounces-810-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94391C0CCD5
	for <lists+openbmc@lfdr.de>; Mon, 27 Oct 2025 10:58:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw88y39nLz2yrl;
	Mon, 27 Oct 2025 20:58:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761559122;
	cv=none; b=KNq0ZBuaKsKJF1TXcpbs5uU2FEZX4h5UmAKQFf2v3aTvOfk8XryGigTdqMCCUVRnsGd7UvK26GTyWUpqx7BaUgFfxphHuJZAl8qY7xP2uHXCWBKAzq5Dnf0qfWLjJyHPOybM8yaE5sGITjOUQhQyRFHTeDld8HFE3SnHPqTTRqMIOsm8tsz0j5cfwFeMK0YHo3BI5xUlnYUT/W5GGt9cZQjwpIfDTzT0eQmcM5P0WkO74GMDfCtKdBCrmDhxbRDrtGX/eLZn5II9SQqxRTUxsYPNNMRp8NVC+TmQbD4f1I7ygn1dr+uF80JmT/aWLUHYNkzvxbhj2LfcU9IIRyxdTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761559122; c=relaxed/relaxed;
	bh=Oga9ogGf0jTX/pA6LeSnCcJbghZKPh2bXwtElqu1MLY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4e6OzwXgBns89GjMPqblutwq8jQhtqwONVQ3uC7xnGsHmG+nbIa4oMqB4Fdtw+qhLhrzUOZGagN/DRZAvrtp97YmNPCMYFQqS7p8UG2h1PZ83UAMiQTrh2QFKvckHg8im/gIHH7rl9AYTupUci67lbsUWpJI+22KOcw3CvXGNKbJ1liXMsCXod4Ev1yJUvpRjVXl4fXaUawk7aeLOy/1+hq3E4bvpJhaMxrzCsdHb9pDFPXAE9li7UQzpcUTjxeZPOyfWztTPqgqb6uGjh3shxY18hcC2j4KTGcNrE5+nrrslO1MkjRV1SwcedEStHVXzMucqP1k5CaznzdPMjMog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw88x4c1zz2yjs;
	Mon, 27 Oct 2025 20:58:40 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 27 Oct
 2025 17:58:25 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 27 Oct 2025 17:58:25 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
	<robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<vkoul@kernel.org>, <kishon@kernel.org>, <linus.walleij@linaro.org>,
	<p.zabel@pengutronix.de>, <linux-aspeed@lists.ozlabs.org>,
	<linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>
CC: <jacky_chou@aspeedtech.com>
Subject: [PATCH v4 0/9] Add ASPEED PCIe Root Complex support
Date: Mon, 27 Oct 2025 17:58:16 +0800
Message-ID: <20251027095825.181161-1-jacky_chou@aspeedtech.com>
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

Jacky Chou (9):
  dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
  dt-bindings: PCI: Add ASPEED PCIe RC support
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
  ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
  PHY: aspeed: Add ASPEED PCIe PHY driver
  PCI: Add FMT, TYPE and CPL status definition for TLP header
  PCI: aspeed: Add ASPEED PCIe RC driver
  MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml     |  168 +++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml |   42 +
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |    2 +
 MAINTAINERS                                   |   11 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   54 +
 drivers/pci/controller/Kconfig                |   16 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1122 +++++++++++++++++
 drivers/pci/pci.h                             |   15 +
 drivers/phy/Kconfig                           |    1 +
 drivers/phy/Makefile                          |    1 +
 drivers/phy/aspeed/Kconfig                    |   15 +
 drivers/phy/aspeed/Makefile                   |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c          |  209 +++
 15 files changed, 1664 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/aspeed,ast2600-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c
 create mode 100644 drivers/phy/aspeed/Kconfig
 create mode 100644 drivers/phy/aspeed/Makefile
 create mode 100644 drivers/phy/aspeed/phy-aspeed-pcie.c

---
v4:
 - Remove aspeed,ast2700-pcie-cfg.yaml
 - Add more descriptions for AST2600 PCIe RC in aspeed,ast2600-pcie.yaml
 - Change interrupt-controller to legacy-interrupt-controller in yaml
   and dtsi
 - Remove msi-parent property in yaml and dtsi
 - Modify the bus range to starting from 0x00 in aspeed-g6.dtsi
 - Fixed the typo on MODULE_DEVICE_TABLE() in phy-aspeed-pcie.c
 - Add PCIE_CPL_STS_SUCCESS definition in pci/pci.h
 - Add prefix ASPEED_ for register definition in RC driver
 - Add a flag to indicate clear msi status twice for AST2700 workaround
 - Remove getting domain number
 - Remove scanning AST2600 HOST bridge on device number 0
 - Remove all codes about CONFIG_PCI_MSI
 - Get root but number from resouce list by IORESOURCE_BUS
 - Change module_platform_driver to builtin_platform_driver
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
2.34.1


