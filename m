Return-Path: <openbmc+bounces-1028-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B67CC07F8
	for <lists+openbmc@lfdr.de>; Tue, 16 Dec 2025 02:50:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVfyP0bvYz2xqj;
	Tue, 16 Dec 2025 12:50:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765849820;
	cv=none; b=FnoXBaQMUUxBMuYkdNkXa3pzHXIVFUS3Wu7SC+o69fMMOvmgPuSz1pF01rtD15OYRkaF7qGpxRRNfx11rXi00zLvWs53/mtKqvnf4JDVMX41oD0Ewp0diPyx/twOrRLq6020kgT9NOgFBNxc6O0q9Mcx9AoyrWnXxxNF2AWZr4mJ4JfNqJIdZSzPGzJF4wZ8wLzNI6GKyiGklpW/bJjhVomDFo2jpIrjPIwZKVlJz+anDsRcT7stxQAS9jhoRCgDq5XPWTZAFMYekuf/easopcPyjSfMw6jwkuGHOJOT4v6NhWEUcIanKeGAsVJy+XorRFqFjjj/mKwB/6sBzf3b6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765849820; c=relaxed/relaxed;
	bh=fssCcI19H+WqqSDfL3u3ldJamQB7JD+WzWFsgBpyp54=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=S6F40XuDH5OScQAo8T7WMHqoj9DcM/Adhwn7XBGtVK4OZnyaYXFb+xM0Iwlfnh9IopnwOh7PL82nTAQ0Zz+SAjuOmaC82N+dBB93H1qkSSA1p1O8fifvuqB5U1K/c2ZxLBgEMavFTt9Jn1TjibqhKRewTEerlmfb5N8GByqRXbIOZyS5lPI0UZfEHxO7SGoVT25IFJrWaMzHVQamCY2RkR1ZEr5kGVTvyFqcXurHYlpYFBhFxWI5EMm6SAqFYGUlKEOQPUPUDW0rRvX90UYt1yyoLo/p5My3h4vMf70LiCITaBUypsgsevgrN5TGmbvSPpWCuTU4rr2NmVRHe8L3yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVfyM2sT8z2xJ6;
	Tue, 16 Dec 2025 12:50:18 +1100 (AEDT)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 16 Dec
 2025 09:50:00 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 16 Dec 2025 09:50:00 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Subject: [PATCH v7 0/7] Add ASPEED PCIe Root Complex support
Date: Tue, 16 Dec 2025 09:49:59 +0800
Message-ID: <20251216-upstream_pcie_rc-v7-0-4aeb0f53c4ce@aspeedtech.com>
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
X-B4-Tracking: v=1; b=H4sIAMe6QGkC/43QQWrDMBCF4asErSszo/FIcle9RylGlpVaLYmN5
 JiG4LtXyaJeJJAun+D7B3QROaQYsnjdXUQKS8xxPJZhXnbCD+74GWTsyxYKFCMCydOU5xTcoZ1
 8DG3y0tY1G276ziKJwqYU9vHnlnz/KHuIeR7T+XZhwevrLQYaCYgAsCJk0mQkyi/nv8+tH8bTm
 8tTCP0c/FD58SCupUVt2iAD1aSgUsxk/6Np0w0gMDdKVVg0MzzX9Z9GUAYatoortIgan2PeMKK
 5/8OFJciudthYNtr5/cOK3ioK8EFFl4r11gJ41h3qu8q6rr+L85hu8gEAAA==
X-Change-ID: 20251103-upstream_pcie_rc-8445759db813
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765849800; l=5397;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=cJwhKYW1mmF+nLh+Mx/yy2wJXAjZzNw2SxwR3VWI+Sw=;
 b=3J44svCb+SFxYbW4PGjsRszZw90/97HE2keEtgn1pIzkD+ujyFhSIgcg+p2up1Vuciv7OLd2Y
 uay+YUp3FkDCJG+wnPwpHVxGTrNYfjgGn6NCLm0JVtlr7kyfCUZcrfz
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
- Add device tree binding documents for ASPEED PCIe PHY and PCIe RC
- Update MAINTAINERS for new bindings and driver
- Implement ASPEED PCIe PHY driver
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
Changes in v7:
- Add PCIe port into aspeed,ast2600-pci.yaml.
- Remove aspeed_pcie_init_ports() and merge aspeed_pcie_port_init() to
  aspeed_pcie_parse_port()
- Refactor aspeed remap pcie addr to aspeed_pcie_map_ranges()
- Link to v6: https://lore.kernel.org/r/20251201-upstream_pcie_rc-v6-0-8c8800c56b16@aspeedtech.com

Changes in v6:
- Refer to pci-cpi-bridge.yaml to update aspeed,ast2600-pcie.yaml and
  the pcie node of aspeed-g6.dtsi.
- 'dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST#
  group' have applied, remove it from this version.
- Adjust the defnitions in pci.h. 
- Link to v5: https://lore.kernel.org/r/20251117-upstream_pcie_rc-v5-0-b4a198576acf@aspeedtech.com

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
Jacky Chou (7):
      dt-bindings: phy: aspeed: Add ASPEED PCIe PHY
      dt-bindings: PCI: Add ASPEED PCIe RC support
      ARM: dts: aspeed-g6: Add PCIe RC and PCIe PHY node
      PHY: aspeed: Add ASPEED PCIe PHY driver
      PCI: Add FMT, TYPE and CPL status definition for TLP header
      PCI: aspeed: Add ASPEED PCIe RC driver
      MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml          |  182 ++++
 .../bindings/phy/aspeed,ast2600-pcie-phy.yaml      |   42 +
 MAINTAINERS                                        |   12 +
 arch/arm/boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi            |   51 +
 drivers/pci/controller/Kconfig                     |   16 +
 drivers/pci/controller/Makefile                    |    1 +
 drivers/pci/controller/pcie-aspeed.c               | 1111 ++++++++++++++++++++
 drivers/pci/pci.h                                  |   15 +
 drivers/phy/Kconfig                                |    1 +
 drivers/phy/Makefile                               |    1 +
 drivers/phy/aspeed/Kconfig                         |   15 +
 drivers/phy/aspeed/Makefile                        |    2 +
 drivers/phy/aspeed/phy-aspeed-pcie.c               |  209 ++++
 14 files changed, 1663 insertions(+)
---
base-commit: 50455515d2364d7f4397b9db98515a1028558295
change-id: 20251103-upstream_pcie_rc-8445759db813

Best regards,
-- 
Jacky Chou <jacky_chou@aspeedtech.com>


