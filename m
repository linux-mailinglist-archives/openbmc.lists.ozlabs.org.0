Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2343B614
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 15:34:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MvHW3TZYzDqPb
	for <lists+openbmc@lfdr.de>; Mon, 10 Jun 2019 23:34:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MvGV747jzDqPP
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jun 2019 23:33:19 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x5ADWkmM029719;
 Mon, 10 Jun 2019 16:32:46 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 5E7F361FCC; Mon, 10 Jun 2019 16:32:46 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: olof@lixom.net, gregkh@linuxfoundation.org, arnd@arndb.de,
 robh+dt@kernel.org, mark.rutland@arm.com, avifishman70@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 joel@jms.id.au
Subject: [PATCH v1 0/2] soc: add NPCM LPC BPC driver support 
Date: Mon, 10 Jun 2019 16:32:43 +0300
Message-Id: <20190610133245.306812-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.18.0
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds LPC BIOS Post code (BPC) support for the
Nuvoton NPCM Baseboard Management Controller (BMC).

Nuvoton BMC NPCM LPC BIOS Post Code (BPC) monitoring two
configurable I/O addresses written by the host on the
Low Pin Count (LPC) bus, the capture data stored in 128-word FIFO.

NPCM BPC can support capture double words.

The NPCM7xx BPC driver tested on NPCM750 evaluation board.

NPCM BPC driver upstream process start few months ago on misc folder
http://lkml.iu.edu/hypermail/linux/kernel/1904.2/00412.html

The NPCM LPC BPC is similar to Aspeed LPC snoop, last 
kernel 5.0.2 Aspeed LPC snoop driver moved from misc folder to 
soc folder, so it seems NPCM BPC dirver should upstream to soc 
as well.
https://lkml.org/lkml/2019/4/22/377

I have created common lpc-snoop documentation for both 
Nuvoton and Aspeed drivers as Andrew suggested.
Andrew Jeffery: https://patchwork.kernel.org/patch/10506269/ 

I add Andrew and Rob reviewed signature because they already reviewed 
and signed  the lpc-snoop documentation in the misc folder
https://lkml.org/lkml/2019/4/29/998 

Tomer Maimon (2):
  dt-binding: soc: Add common LPC snoop documentation
  soc: nuvoton: add NPCM LPC BPC driver

 .../devicetree/bindings/soc/lpc/lpc-snoop.txt |  27 ++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/nuvoton/Kconfig                   |  16 +
 drivers/soc/nuvoton/Makefile                  |   2 +
 drivers/soc/nuvoton/npcm-lpc-bpc-snoop.c      | 387 ++++++++++++++++++
 6 files changed, 434 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/lpc/lpc-snoop.txt
 create mode 100644 drivers/soc/nuvoton/Kconfig
 create mode 100644 drivers/soc/nuvoton/Makefile
 create mode 100644 drivers/soc/nuvoton/npcm-lpc-bpc-snoop.c

-- 
2.18.0

