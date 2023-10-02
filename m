Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECBC7B5B70
	for <lists+openbmc@lfdr.de>; Mon,  2 Oct 2023 21:42:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rzrvv3Kjcz3vcD
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 06:42:51 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rzrtr2y8jz3cF4
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 06:41:51 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 392Jfhpx022218
	for <openbmc@lists.ozlabs.org>; Mon, 2 Oct 2023 22:41:44 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 2 Oct
 2023 22:41:43 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 3 Oct
 2023 03:41:40 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 3 Oct 2023 03:41:40 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id C31006473F; Mon,  2 Oct 2023 22:41:39 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <ulf.hansson@linaro.org>, <avifishman70@gmail.com>,
        <tali.perry1@gmail.com>, <joel@jms.id.au>, <venture@google.com>,
        <yuenn@google.com>, <benjaminfair@google.com>,
        <adrian.hunter@intel.com>, <skhan@linuxfoundation.org>,
        <davidgow@google.com>, <pbrobinson@gmail.com>, <gsomlo@gmail.com>,
        <briannorris@chromium.org>, <arnd@arndb.de>, <krakoczy@antmicro.com>,
        <andy.shevchenko@gmail.com>
Subject: [PATCH v4 0/2] add NPCM SDHCI driver support
Date: Mon, 2 Oct 2023 22:41:36 +0300
Message-ID: <20231002194138.125349-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds SDHCI support for the Nuvoton NPCM Baseboard 
Management Controller (BMC).

Deeply sorry it took that long until sending version three, promise to try
to do better on the next versions (if needed) :-),

The NPCM SDHCI driver tested on NPCM750 and NPCM845 EVB.

Addressed comments from:
 - Andy Shevchenko : https://www.spinics.net/lists/devicetree/msg637946.html

Changes since version 3:
 - Use devm_clk_get_optional_enabled function.
 - Add mod_devicetable.h.
 - Modify copyright year.

Changes since version 2:
 - Add data to handle architecture-specific SDHCI parameters.
 - Change config place in make and kconfig files.
 - Calling sdhci_pltfm_free to to avoid a memory leak on error.

Changes since version 1:
 - Use correct spaces in the dt-bindings.
 - Drop unused labels from dt-bindings.
 - Order by module name in the make a configuration.
 - Remove unnecessary blank lines.
 - Using devm_clk_get_optional instead of devm_clk_get.

Tomer Maimon (2):
  dt-bindings: mmc: npcm,sdhci: Document NPCM SDHCI controller
  mmc: sdhci-npcm: Add NPCM SDHCI driver

 .../devicetree/bindings/mmc/npcm,sdhci.yaml   | 45 +++++++++
 drivers/mmc/host/Kconfig                      |  8 ++
 drivers/mmc/host/Makefile                     |  1 +
 drivers/mmc/host/sdhci-npcm.c                 | 96 +++++++++++++++++++
 4 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mmc/npcm,sdhci.yaml
 create mode 100644 drivers/mmc/host/sdhci-npcm.c

-- 
2.33.0

