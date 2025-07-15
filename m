Return-Path: <openbmc+bounces-355-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5903B06A2C
	for <lists+openbmc@lfdr.de>; Wed, 16 Jul 2025 01:57:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhbgz0c9Nz3bmC;
	Wed, 16 Jul 2025 09:56:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752551021;
	cv=none; b=ZaZzUwE4UGxM07nb5BScRbqtESZbWjJClw4CPBV63KjLMgglDGhyjO/mcPW8tdcC7dCvCWP0VAzVUlEZc9YARM78LQcDAC62K1j7s6BY6nefLDA8ejcwrOdy0FCK7a2NvoG/osa7ONZUppZozYprI4PMqKL1t581bAZveqZcMtASpsjPSB2RlTPtahwyKpYxJbffCr3kZem+gGnzR0sUjWsolKGPz1TALUyotw6dOl1bAuZhUcYR1wgNQAYHqfDhp4qM1QKYZdlEZsW9tQU8PILm5kquT/ri0xmP0lyu8DiMYj8Y2EW1GsKh4llwKlcKDw/C1j4+LuqT6+jIJaziFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752551021; c=relaxed/relaxed;
	bh=Q9yxueNIc+k7Eb1uC5SYdYsXuc+n34gPCF/CSAr9Fgo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NAhCmev2G4K+yIoHjvCzLHyoTG9q16fv2elnZDaj6vi23Yhj53DReTDHMzpN0NKJB7IKqMwMltxhq+YDVUU+jWJjSs8DsV3hTrpTkSUCCY8HctcHMUum2g6UNZHHjZJbcSXUXUG9IcDkh75ocIs9ail32y6k6ve8M0+fdpHSo9pGVbbEbTqXjxZZQUip3W+3vlxs9J0RQSXvt3Qb2oBWGqfuVVGnALbjjTUXcKLZRclhOLLy1zb2u+olqbpuFcm1yFKU5GXVeF+tIamAO3dW/CKrvq3UZgTnsLioqPEhbiG0wlcTAeimOoL8mgShMeMQ3pCu/DVxEtbQSlFBbniIwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org) smtp.mailfrom=aspeedtech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.72; helo=twmbx01.aspeed.com; envelope-from=jacky_chou@aspeedtech.com; receiver=lists.ozlabs.org)
Received: from TWMBX01.aspeed.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bh4m96G7qz3bmY;
	Tue, 15 Jul 2025 13:43:37 +1000 (AEST)
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 15 Jul
 2025 11:43:20 +0800
Received: from mail.aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 15 Jul 2025 11:43:20 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: <bhelgaas@google.com>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
	<mani@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<linux-aspeed@lists.ozlabs.org>, <linux-pci@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <openbmc@lists.ozlabs.org>, <linux-gpio@vger.kernel.org>,
	<linus.walleij@linaro.org>, <p.zabel@pengutronix.de>, <BMC-SW@aspeedtech.com>
Subject: [PATCH v2 00/10] Add ASPEED PCIe Root Complex support
Date: Tue, 15 Jul 2025 11:43:10 +0800
Message-ID: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
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
- Add PCIe RC PERST pin group to aspeed-g6 pinctrl
- Implement ASPEED PCIe Root Complex host controller driver

This series has been tested on AST2600/AST2700 platforms and enables PCIe device
enumeration and operation.

Jacky Chou (10):
  dt-bindings: soc: aspeed: Add ASPEED PCIe Config support
  dt-bindings: soc: aspeed: Add ASPEED PCIe PHY support
  dt-bindings: PCI: Add ASPEED PCIe RC support
  dt-bindings: pinctrl: aspeed,ast2600-pinctrl: Add PCIe RC PERST# group
  ARM: dts: aspeed-g6: Add AST2600 PCIe RC PERST#
  ARM: dts: aspeed-g6: Add PCIe RC node
  pinctrl: aspeed-g6: Add PCIe RC PERST pin group
  PCI: Add FMT and TYPE definition for TLP header
  PCI: aspeed: Add ASPEED PCIe RC driver
  MAINTAINERS: Add ASPEED PCIe RC driver

 .../bindings/pci/aspeed,ast2600-pcie.yaml     |  198 +++
 .../pinctrl/aspeed,ast2600-pinctrl.yaml       |    2 +
 .../bindings/soc/aspeed/aspeed,pcie-cfg.yaml  |   41 +
 .../bindings/soc/aspeed/aspeed,pcie-phy.yaml  |   44 +
 MAINTAINERS                                   |   10 +
 .../boot/dts/aspeed/aspeed-g6-pinctrl.dtsi    |    5 +
 arch/arm/boot/dts/aspeed/aspeed-g6.dtsi       |   61 +
 drivers/pci/controller/Kconfig                |   13 +
 drivers/pci/controller/Makefile               |    1 +
 drivers/pci/controller/pcie-aspeed.c          | 1137 +++++++++++++++++
 drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c    |   12 +-
 include/uapi/linux/pci_regs.h                 |   32 +
 12 files changed, 1555 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/aspeed,ast2600-pcie.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/aspeed/aspeed,pcie-phy.yaml
 create mode 100644 drivers/pci/controller/pcie-aspeed.c

---
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


