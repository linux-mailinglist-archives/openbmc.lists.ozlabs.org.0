Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463C162640
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 13:38:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48ML4t6L6fzDqB5
	for <lists+openbmc@lfdr.de>; Tue, 18 Feb 2020 23:38:54 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48MKxK029yzDqXL
 for <openbmc@lists.ozlabs.org>; Tue, 18 Feb 2020 23:32:16 +1100 (AEDT)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 01ICVcXO007989;
 Tue, 18 Feb 2020 14:31:39 +0200
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id C1E586032E; Tue, 18 Feb 2020 14:31:38 +0200 (IST)
From: Tomer Maimon <tmaimon77@gmail.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, joel@jms.id.au,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/3] arm: dts: add and modify device node in NPCM7xx device
 tree
Date: Tue, 18 Feb 2020 14:31:25 +0200
Message-Id: <20200218123128.17990-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch set adds and modify device tree nodes in the NPCM7xx
Baseboard Management Controller (BMC) device tree.

The following device node add:
        - NPCM7xx Pin controller and GPIO
        - NPCM7xx PWM and FAN.
        - NPCM7xx EHCI USB.
        - NPCM7xx KCS.
        - NPCM Reset.
        - NPCM Peripheral SPI.
        - NPCM FIU SPI.
        - NPCM HWRNG.
        - NPCM I2C.
        - STMicro STMMAC.

The following device node modified:
        - NPCM7xx timer.
        - NPCM7xx clock constants parameters.

NPCM7xx device tree tested on NPCM750 evaluation board.

Changes since version 3:
 - Tested patches in Linux kernel 5.6.

Changes since version 2:
 - Remove unnecessary ouput-enable flags.

Changes since version 1:
 - Add NPCM reset device node.
 - Add reset parameters to NPCM driver device nodes.

Tomer Maimon (3):
  arm: dts: modify NPCM7xx device tree clock parameter to clock constant
  arm: dts: modify NPCM7xx device tree timer register size
  arm: dts: add new device nodes to NPCM750 device tree

 arch/arm/boot/dts/nuvoton-common-npcm7xx.dtsi | 958 +++++++++++++++++-
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts     | 444 +++++++-
 .../boot/dts/nuvoton-npcm750-pincfg-evb.dtsi  | 157 +++
 arch/arm/boot/dts/nuvoton-npcm750.dtsi        |  24 +-
 4 files changed, 1549 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm/boot/dts/nuvoton-npcm750-pincfg-evb.dtsi

-- 
2.22.0

