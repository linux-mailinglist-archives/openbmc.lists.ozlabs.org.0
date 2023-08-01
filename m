Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D59C76B2EF
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 13:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFXfc74zcz3c3c
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 21:18:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFXdg6KRRz2ys8
	for <openbmc@lists.ozlabs.org>; Tue,  1 Aug 2023 21:17:43 +1000 (AEST)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 371BHT1D007117
	for <openbmc@lists.ozlabs.org>; Tue, 1 Aug 2023 14:17:29 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Aug
 2023 14:17:17 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 1 Aug
 2023 19:17:15 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 1 Aug 2023 19:17:14 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 29A8C6473F; Tue,  1 Aug 2023 14:17:14 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <linus.walleij@linaro.org>, <j.neuschaefer@gmx.net>,
        <zhengbin13@huawei.com>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>
Subject: [PATCH v5 0/2] pinctrl: nuvoton: add pinmux and GPIO driver for NPCM8XX
Date: Tue, 1 Aug 2023 14:17:10 +0300
Message-ID: <20230801111712.45653-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds pinmux and GPIO controller for the Arbel NPCM8XX 
Baseboard Management Controller (BMC).

Arbel BMC NPCM8XX pinctrl driver based on Poleg NPCM7XX, except the
pin mux mapping difference the NPCM8XX GPIO supports adjust debounce
period time.

Arbel BMC NPCM8XX Pinmux functions accessible only for pin groups 
and pin configuration parameters available only for individual pins.

Arbel BMC NPCM8XX has eight identical GPIO modules,
each module has 32 GPIO ports.

Most of the GPIO ports are multiplexed with other system functions.

The NPCM8XX pinctrl and GPIO driver were tested on NPCM845 evaluation board.

Addressed comments from:
 - Rob Herring: https://www.spinics.net/lists/kernel/msg4881522.html
 - Kernel test robot

Changes since version 4:
- Pin controller driver
	- Modify DS definition.

- Pin controller dt-binding
	- Modify -mux pattern.
	- Remove tabs.

Changes since version 3:
- Pin controller driver
	- Remove unused line in Kconfig.
	- Add GPIO 183-189 GPIO support.
	- Add SPI1 CS pins.
	- Modify SMB23b pin list.
	- Remove unused module pins.
	- Fix PIN-CONFIG_OUTPUT setting.

- Pin controller dt-binding
        - Modify pin and function items.
        - Use consistent quotes.
        - drop unneseccary quote.
        - pincrtl node name modify to pinctrl@f0800260 since
          the pin controller handling was done in 0xf0800260 
          offset.

Changes since version 2:
- Pin controller driver
        - Modify kernel configuration.
        - Adding and removing include files.
        - Using the same register format size.
        - Reducing lines by command combination.
        - Remove unnecessary parentheses use.
        - Use GENMASK and BIT macros.
        - Using traditional patterns.

 - Pin controller dt-binding
        - Modify GPIO description.
        - pintcrtl node name, Sorry, I know we have a long discussion about it.
          Still, I think the best header pinctrl node name is pinctrl@f0800000. 
          because the pin mux is handled through the GCR.
	  BTW, same pinctrl header name is used in the NPCM7XX pinctrl version.
	  https://elixir.bootlin.com/linux/v6.0-rc6/source/arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi#L560

Changes since version 1:
 - Pin controller driver
	- Remove unnecessary debug prints and comments.
	- Use fwnode functions.
	- Remove Redundant 'else'.
	- Use switch case instead of else if.
	- Use GENMASK and BIT macros.
	- Use dev_err_probe in probe error.
	- Use callback GPIO range.
	- Add GCR phandle property.
	- Parameter order in reversed xmas

 - Pin controller dt-binding
	- Modify name from pin to mux.
	- Add phandle property.


Tomer Maimon (2):
  dt-binding: pinctrl: Add NPCM8XX pinctrl and GPIO documentation
  pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver

 .../pinctrl/nuvoton,npcm845-pinctrl.yaml      |  215 ++
 drivers/pinctrl/nuvoton/Kconfig               |   14 +
 drivers/pinctrl/nuvoton/Makefile              |    1 +
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c     | 2491 +++++++++++++++++
 4 files changed, 2721 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/nuvoton,npcm845-pinctrl.yaml
 create mode 100644 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

-- 
2.33.0

