Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C6F82706A
	for <lists+openbmc@lfdr.de>; Mon,  8 Jan 2024 14:56:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T7wZw3xcSz3cXr
	for <lists+openbmc@lfdr.de>; Tue,  9 Jan 2024 00:56:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=taln60.nuvoton.co.il (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon@taln60.nuvoton.co.il; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T7wXx0q08z2xWJ
	for <openbmc@lists.ozlabs.org>; Tue,  9 Jan 2024 00:54:40 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 408DsRp8028564
	for <openbmc@lists.ozlabs.org>; Mon, 8 Jan 2024 15:54:28 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 8 Jan
 2024 15:54:27 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 8 Jan
 2024 21:54:24 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 8 Jan 2024 21:54:24 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 6E51D5F5D2;
	Mon,  8 Jan 2024 15:54:23 +0200 (IST)
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 65106DC0047; Mon,  8 Jan 2024 15:54:23 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>
Subject: [PATCH v22 0/8] Introduce Nuvoton Arbel NPCM8XX BMC SoC
Date: Mon, 8 Jan 2024 15:54:13 +0200
Message-ID: <20240108135421.684263-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-NotSetDelaration: True
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patchset adds clock support for the Nuvoton 
Arbel NPCM8XX Board Management controller (BMC) SoC family.

This patchset cover letter is based from the initial support for NPCM8xx BMC to
keep tracking the version history.

all the other initial support patches had been applied to Linux kernel 6.0.

This patchset was tested on the Arbel NPCM8XX evaluation board.

Addressed comments from:
 - Stephen Boyd: https://www.spinics.net/lists/linux-clk/msg93838.html

Changes since version 21:
 - Since using regmap instead of ioremap replace reg to syscon 
   property in dt-bindings and dts.
 - Add reference clock property to the dt-bindings and dts.
 - Using .index instead of .name in clk_parent_data structures.
 - Using string where any macros are used once.

Changes since version 20:
 - Using regmap instead of ioremap.
   the clock and reset modules are sharing the same memory region 
   and cause failure when using devm_platform_ioremap_resource
   function, this version uses regmap to handle shared 
   reset and clock memory region, in case it is approved I will
   modify the reset driver to use the regmap as well.
 - Using clk_hw instead of clk_parent_data structre.
 - Divider clock definition to one line

Changes since version 19:
 - Remove unnecessary free command.
 - Defining pr_fmt().
 - Using dev_err_probe.
 - Return zero in the end of the probe function.

Changes since version 18:
 - NPCM8XX clock driver did not changed from version 18 only build and tested under kernel 6.6-rc1.

Changes since version 17:
 - NPCM8XX clock driver did not changed from version 17 only build and tested under kernel 6.5-rc3.

Changes since version 16:
 - NPCM8XX clock driver
	- Using devm_kzalloc instead kzalloc.
	- Remove unnecessary parenthesis.
	- Modify incorrect spelling.

Changes since version 15:
 - NPCM8XX clock driver
	- Remove unused regs parameter from npcm8xx_pll_data structure.
	- Using index and clk_hw parameters to set the clock parent in the clock structures.

Changes since version 14:
 - NPCM8XX clock driver
	- Remove unnecessary register definitions.
	- Remove the internal reference clock, instead use the external DT reference clock.
	- rearrange the driver.
	- using .names parameter in DT to define clock (refclk).

Changes since version 13:
 - NPCM8XX clock driver
	- Remove unnecessary definitions and add module.h define
	- Use in clk_parent_data struct.fw_name and .name.
	- Add module_exit function.
	- Add const to divider clock names.
	- Add MODULE_DESCRIPTION and MODULE_LICENSE

Changes since version 12:
 - NPCM8XX clock driver
	- Use clk_parent_data in mux and div clock structure.
	- Add const to mux tables.
	- Using devm_clk_hw_register_fixed_rate function.
	- use only .name clk_parent_data instead .name and .fw_name.
	- Modify mask values in mux clocks. 

Changes since version 11:
 - NPCM8XX clock driver
	- Modify Kconfig help.
	- Modify loop variable to unsigned int.

Changes since version 11:
 - NPCM8XX clock driver
	- Modify Kconfig help.
	- Modify loop variable to unsigned int.

Changes since version 10:
 - NPCM8XX clock driver
	- Fix const warning.

Changes since version 9:
 - NPCM8XX clock driver
	- Move configuration place.
	- Using clk_parent_data instead of parent_name
	- using devm_ioremap instead of ioremap. deeply sorry, I know we had
	 a long discussion on what should the driver use, from other examples 
	 (also in other clock drivers) I see the combination of 
	 platform_get_resource and devm_ioremap are commonly used and it answer
	 the reset and clock needs.

Changes since version 8:
 - NPCM8XX clock driver
	- Move configuration place.
	- Add space before and aftre '{' '}'.
	- Handle devm_of_clk_add_hw_provider function error.

Changes since version 7:
 - NPCM8XX clock driver
	- The clock and reset registers using the same memory region, 
	  due to it the clock driver should claim the ioremap directly 
	  without checking the memory region.

Changes since version 5:
 - NPCM8XX clock driver
	- Remove refclk if devm_of_clk_add_hw_provider function failed.

Changes since version 4:
 - NPCM8XX clock driver
	- Use the same quote in the dt-binding file.

Changes since version 3:
 - NPCM8XX clock driver
	- Rename NPCM8xx clock dt-binding header file.
	- Remove unused structures.
	- Improve Handling the clocks registration.

Changes since version 2:
 - NPCM8XX clock driver
	- Add debug new line.
	- Add 25M fixed rate clock.
	- Remove unused clocks and clock name from dt-binding.

Changes since version 1:
 - NPCM8XX clock driver
	- Modify dt-binding.
	- Remove unsed definition and include.
	- Include alphabetically.
	- Use clock devm.


Tomer Maimon (8):
  dt-bindings: clock: npcm845: Add reference 25m clock  property
  arm64: dts: nuvoton: npcm8xx: add refernace clock
  arm: dts: nuvoton: npcm7xx: modify rst syscon node
  dt-bindings: soc: nuvoton: add binding for clock and reset registers
  arm64: dts: nuvoton: npcm8xx: add clock reset syscon node
  dt-bindings: clock: npcm845: replace reg with syscon property
  arm64: dts: nuvoton: npcm8xx: replace reg with syscon property
  clk: npcm8xx: add clock controller

 .../bindings/clock/nuvoton,npcm845-clk.yaml   |  38 +-
 .../soc/nuvoton/nuvoton,npcm-clk-rst.yaml     |  40 ++
 .../dts/nuvoton/nuvoton-common-npcm7xx.dtsi   |   4 +-
 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   |  19 +-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  |   6 +
 drivers/clk/clk-npcm8xx.c                     | 510 ++++++++++++++++++
 6 files changed, 597 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-clk-rst.yaml
 create mode 100644 drivers/clk/clk-npcm8xx.c

-- 
2.34.1

