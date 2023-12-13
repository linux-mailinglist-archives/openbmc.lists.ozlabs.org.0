Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC0811E1E
	for <lists+openbmc@lfdr.de>; Wed, 13 Dec 2023 20:07:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr4jN56zMz3cWF
	for <lists+openbmc@lfdr.de>; Thu, 14 Dec 2023 06:07:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=gmail.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr4gq3n9Rz3bfK
	for <openbmc@lists.ozlabs.org>; Thu, 14 Dec 2023 06:05:42 +1100 (AEDT)
Received: from NTILML01.nuvoton.com (212.199.177.18.static.012.net.il [212.199.177.18])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 3BDJ5Ybt012932
	for <openbmc@lists.ozlabs.org>; Wed, 13 Dec 2023 21:05:34 +0200
Received: from NTHCML01B.nuvoton.com (10.1.8.178) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 13 Dec
 2023 21:05:33 +0200
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01B.nuvoton.com
 (10.1.8.178) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 14 Dec
 2023 03:05:32 +0800
Received: from taln58.nuvoton.co.il (10.191.1.178) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 14 Dec 2023 03:05:31 +0800
Received: from taln60.nuvoton.co.il (taln60 [10.191.1.180])
	by taln58.nuvoton.co.il (Postfix) with ESMTP id 07A3E5F5AC;
	Wed, 13 Dec 2023 21:05:31 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <arnd@arndb.de>, <pmenzel@molgen.mpg.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <avifishman70@gmail.com>, <tali.perry1@gmail.com>, <joel@jms.id.au>,
        <venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
        <j.neuschaefer@gmx.net>
Subject: [PATCH v3 0/3] soc: add NPCM BPC driver support 
Date: Wed, 13 Dec 2023 21:05:25 +0200
Message-ID: <20231213190528.3751583-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds BIOS Post code (BPC) support for the Nuvoton 
NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM BIOS Post Code (BPC) monitoring two configurable 
I/O addresses written by the host on the bus, the capture data 
stored in 128-word FIFO.

NPCM BPC can support capture double words.

The NPCM BPC driver tested on NPCM750 Olympus board.

Addressed comments from:
 - Krzysztof Kozlowski : https://www.spinics.net/lists/kernel/msg5035188.html
 - Conor Dooley : https://www.spinics.net/lists/kernel/msg5034239.html
 - kernel test robot : https://www.spinics.net/lists/kernel/msg5034970.html

Changes since version 2:
 - Modify compatible bindings.
 - Add more details to nuvoton,bpc-en-dwcapture parameter. 
 - Using _is_visible() function to support NPCM8XX.
 - add __poll_t custom.

Changes since version 1:
 - Remove LPC present from the BPC driver.
 - Modify dt-bindings message header.
 - Add vendor to the file name.
 - Modify incorrect spelling.
 
Tomer Maimon (3):
  dt-bindings: soc: nuvoton: Add NPCM BPC
  soc: nuvoton: add configuration menu
  soc: nuvoton: add NPCM BPC driver

 .../soc/nuvoton/nuvoton,npcm-bpc.yaml         |  65 +++
 drivers/soc/nuvoton/Kconfig                   |  16 +-
 drivers/soc/nuvoton/Makefile                  |   1 +
 drivers/soc/nuvoton/npcm-bpc.c                | 387 ++++++++++++++++++
 4 files changed, 468 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/nuvoton/nuvoton,npcm-bpc.yaml
 create mode 100644 drivers/soc/nuvoton/npcm-bpc.c

-- 
2.34.1

