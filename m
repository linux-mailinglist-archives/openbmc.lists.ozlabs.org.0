Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EC97DD87
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 16:12:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zsgb1bBgzDqtN
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 00:12:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zsW76Dn7zDqVD
 for <openbmc@lists.ozlabs.org>; Fri,  2 Aug 2019 00:05:05 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x71E4LrY012596;
 Thu, 1 Aug 2019 17:04:21 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id 279DB62A2E; Thu,  1 Aug 2019 17:04:21 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 vigneshr@ti.com, bbrezillon@kernel.org, avifishman70@gmail.com,
 tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
 benjaminfair@google.com
Subject: [PATCH v1 0/2] spi: add NPCM FIU controller driver 
Date: Thu,  1 Aug 2019 17:04:17 +0300
Message-Id: <20190801140419.58029-1-tmaimon77@gmail.com>
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
 Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Flash Interface Unit(FIU) SPI 
master support for the Nuvoton NPCM Baseboard 
Management Controller (BMC).

The FIU supports single, dual or quad communication interface.

the FIU controller can operate in following modes:
- User Mode Access(UMA): provides flash access by using an
  indirect address/data mechanism.
- direct rd/wr mode: maps the flash memory into the core
  address space.
- SPI-X mode: used for an expansion bus to an ASIC or CPLD.

The NPCM750/730/715/710 supports up to three FIU devices:
- FIU0 supports two chip select.
- FIU3 supports four chip select.
- FIUX supports two chip select.

The NPCM FIU driver tested on NPCM750 evaluation board. 

The FIU controller driver using direct map API SPI-MEM
interface and tested with the latest m25p80 driver patch
https://www.spinics.net/lists/linux-mtd/msg07358.html

According a conversion about direct SPI-MEM API
https://www.spinics.net/lists/linux-mtd/msg08225.html

The m25p80 driver will merge to the spi-nor driver we
need to make sure the m25p80 direct SPI-MEM will merge
as well.

Tomer Maimon (2):
  dt-binding: spi: add NPCM FIU controller
  spi: npcm-fiu: add NPCM FIU controller driver

 .../bindings/spi/nuvoton,npcm-fiu.txt         |  47 ++
 drivers/spi/Kconfig                           |  10 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-npcm-fiu.c                    | 760 ++++++++++++++++++
 4 files changed, 818 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,npcm-fiu.txt
 create mode 100644 drivers/spi/spi-npcm-fiu.c

-- 
2.18.0

