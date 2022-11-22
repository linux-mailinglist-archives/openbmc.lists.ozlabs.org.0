Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28996634772
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 21:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGwS00xCTz3cV8
	for <lists+openbmc@lfdr.de>; Wed, 23 Nov 2022 07:13:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGwRT4K8Jz3cKv
	for <openbmc@lists.ozlabs.org>; Wed, 23 Nov 2022 07:12:49 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 2AMKCcTL009107
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 22:12:38 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 22 Nov
 2022 22:12:38 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 23 Nov
 2022 04:12:36 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 23 Nov 2022 04:12:35 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 2301663A0A; Tue, 22 Nov 2022 22:12:35 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <arnd@arndb.de>, <hasegawa-hitomi@fujitsu.com>, <marcan@marcan.st>,
        <nicolas.ferre@microchip.com>, <conor.dooley@microchip.com>,
        <heiko@sntech.de>, <sven@svenpeter.dev>, <briannorris@chromium.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v1 0/2] soc: add NPCM LPC BPC driver support 
Date: Tue, 22 Nov 2022 22:12:30 +0200
Message-ID: <20221122201232.107065-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds LPC BIOS Post code (BPC) support for the
Nuvoton NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM LPC BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capture data stored in 128-word FIFO.

NPCM BPC can support capture double words.

The NPCM LPC BPC driver tested on NPCM750 Olympus board and NPCM845 EVB.

Tomer Maimon (2):
  dt-binding: soc: nuvoton: Add NPCM BPC LPC documentation
  soc: nuvoton: add NPCM LPC BPC driver

 .../bindings/soc/nuvoton/npcm-lpc-bpc.yaml    | 112 +++++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/nuvoton/Kconfig                   |  24 ++
 drivers/soc/nuvoton/Makefile                  |   3 +
 drivers/soc/nuvoton/npcm-lpc-bpc.c            | 396 ++++++++++++++++++
 6 files changed, 537 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/npcm-lpc-bpc.yaml
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile
 create mode 100644 drivers/soc/nuvoton/npcm-lpc-bpc.c

-- 
2.33.0

