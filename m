Return-Path: <openbmc+bounces-906-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1D1C64190
	for <lists+openbmc@lfdr.de>; Mon, 17 Nov 2025 13:39:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d96kP2YvYz2yvM;
	Mon, 17 Nov 2025 23:39:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763383149;
	cv=none; b=iuaOhciHDfc8CMzgKPDGa538C1EaZ5aMlLgU7hsLoBWCkJIDps2pj1RHdrcWcAIFWCvMs32UZhhh0Lwy7E4pQ+ONqxl2fbUpHNljLfzppOO40YjRTAb80GFQtUNOfmnBoM3uJ8hLWxxrSbFDl7fm30b9LPfMcTpKNbb/2skw/aX69J4oP1MY8FPw1TCsu/MaPJEXcFFZ4Us3+cE8Fdo8Yw0LgKnUL2hhkqlTfiD+rwSHD2qEcPZnb7PyKlTdVxYH2sMrH4Od11a7rebLPQD9cYuMUcRqsfobcxMKRTND/nWaIJidFvNTllPcxZda7d2P8C19uWKfzhJRvBf/WJeVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763383149; c=relaxed/relaxed;
	bh=gqUSLvDhGy5c4Pe96kBfGkXPYBX94HjBM2qwGgB6GvU=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=juxe1l/y6aOBdnhnbcwZPhUIWZQzf0kC9VghzaSw9rblcn8xfPnIqA0FpKyZUqdxfuF0kxRhLFqihXlpzb5zCpdgSvOYQD4VmsPXkBiI82TGVL3uDTF8KL3KC84YWvM178JzVjLvIBvsBOZ9Vx4kFuh/qCYaX7gbDSoUINbUU9+53hgUgGR6MKw0jWIFyAZZlhX/hkVTJW+8OnleFbGUXMsDgh4KCOgsT2YNJTG9FLiKMbF9yQwU1k9RCm7jOltH6Je2zJbzoquLyAImof72mL1dqvuVDv9H0MmHyRP6Dj0hVsh+h9T8aN2IIxVHdneJuE60BGJ9jrMdGNSWadnWdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d96kN3V9fz2yv9;
	Mon, 17 Nov 2025 23:39:07 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 17 Nov
 2025 20:38:52 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 17 Nov 2025 20:38:52 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v5 0/8] Add ASPEED PCIe Root Complex support
Date: Mon, 17 Nov 2025 20:37:47 +0800
Message-ID: <20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com>
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
X-B4-Tracking: v=1; b=H4sIABsXG2kC/43NTU7DMBCG4atUXmNrfjKJw4p7IBQFZyAGtYnsN
 KKqcnfcLOgOWL4jPd9cTdYUNZvHw9UkXWOO06mEPBxMGPvTu9o4lDYEJIjA9jznJWl/7OYQtUv
 B+qqSRtrh1SObwuakb/Frn3x+KT3GvEzpsn9Y8Xbdx6BGBmYAdIzCNTcW7UcfPi9dGKfzU59n1
 WHRMLowHc1taaW7blCAKyZwJML+P5rvugUEkZbIYdEi8LeufjQCNdCKJ3HoEWv8HW/b9g07oTo
 wZgEAAA==
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Manivannan
 Sadhasivam" <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>, <openbmc@lists.ozlabs.org>,
	<linux-gpio@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763383131; l=4906;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=gF4hglxp1LlzjlZWp1T+90NygUlYjcsq/Mvi0As3xDo=;
 b=MWXQzl73ovjxvrLgyEvEY6IqZKZDLpWVz9vIUSeIgIwSZIbnOhBA5NJ3hLGLvUya//pVRoSgg
 yjkR0ewH6bqAWlsMQ2UWSwhxa6H85HaAmstcQrw/CU7g3mzvdewAgd2
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=
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

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v5:
- Remove legacy-interrupt-controller and the INTx points to pcie node itself.
- Correct bar mapping description and implementation to PCIe address
  configuration in pcie-aspeed.c driver.
- Link to v4: https://lore.kernel.org/r/20251027095825.181161-1-jacky_chou@aspeedtech.com/

Changes in v4:
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
- Link to v3: https://lore.kernel.org/r/20250901055922.1553550-1-jacky_chou@aspeedtech.com/

Changes in v3:
- Add ASPEED PCIe PHY driver
- Remove the aspeed,pciecfg property from AST2600 RC node, merged into RC node
- Update the binding doc for aspeed,ast2700-pcie-cfg to reflect the changes
- Update the binding doc for aspeed,ast2600-pcie to reflect the changes
- Update the binding doc for aspeed,ast2600-pinctrl to reflect the changes
- Update the device tree source to reflect the changes
- Adjusted the use of mutex in RC drivers to use GRAND
- Updated from reviewer comments
- Link to v2: https://lore.kernel.org/r/20250715034320.2553837-1-jacky_chou@aspeedtech.com/

Changes in v2:
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
- Link to v1: https://lore.kernel.org/r/20250613033001.3153637-1-jacky_chou@aspeedtech.com/

---
Jacky Chou (8):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      dt-bindings: PCI: Add ASPEED PCIe RC support
      dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
      ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
      PHY: aspeed: Add ASPEED PCIe PHY driver
      PCI: Add FMT, TYPE and CPL status definition for TLP header
      PCI: aspeed: Add ASPEED PCIe RC driver
      MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml          |  149 +++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |   42 +
 .../bindings/pinctrl/aspeed,ast2600-pinctrl.yaml   |    2 +
 MAINTAINERS                                        |   12 +
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   50 +
 drivers/pci/controller/Kconfig                     |   16 +
 drivers/pci/controller/Makefile                    |    1 +
 drivers/pci/controller/pcie-aspeed.c               | 1117 ++++++++++++++++++++
 drivers/pci/pci.h                                  |   15 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/aspeed/Kconfig                         |   15 +
 drivers/phy/aspeed/Makefile                        |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               |  209 ++++
 15 files changed, 1637 insertions(+)
---
base-commit: 6a23ae0a96a600d1d12557add110e0bb6e32730c
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


