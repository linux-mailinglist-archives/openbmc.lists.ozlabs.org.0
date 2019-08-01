Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5232C7D64B
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 09:28:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zhjk33tXzDqq8
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2019 17:28:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=avi.fishman@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zhhx6ltXzDqpq
 for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2019 17:27:59 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x717R6Nr004914;
 Thu, 1 Aug 2019 10:27:06 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 8441)
 id 3EDC262A2E; Thu,  1 Aug 2019 10:27:06 +0300 (IDT)
From: Avi Fishman <avifishman70@gmail.com>
To: venture@google.com, yuenn@google.com, benjaminfair@google.com,
 davem@davemloft.net, robh+dt@kernel.org, mark.rutland@arm.com,
 gregkh@linuxfoundation.org
Subject: [PATCH v1 0/2] add NPCM7xx EMC 10/100 Ethernet driver
Date: Thu,  1 Aug 2019 10:26:09 +0300
Message-Id: <20190801072611.27935-1-avifishman70@gmail.com>
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
Cc: devicetree@vger.kernel.org, tmaimon77@gmail.com, avifishman70@gmail.com,
 netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 tali.perry1@gmail.com, tglx@linutronix.de
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

EMC Ethernet Media Access Controller supports 10/100 Mbps and RMII.
This driver has been working on Nuvoton BMC NPCM7xx.

Avi Fishman (2):
  dt-binding: net: document NPCM7xx EMC 10/100 DT bindings
  net: npcm: add NPCM7xx EMC 10/100 Ethernet driver

 .../bindings/net/nuvoton,npcm7xx-emc.txt      |   38 +
 drivers/net/ethernet/nuvoton/Kconfig          |   21 +-
 drivers/net/ethernet/nuvoton/Makefile         |    2 +
 drivers/net/ethernet/nuvoton/npcm7xx_emc.c    | 2073 +++++++++++++++++
 4 files changed, 2131 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/nuvoton,npcm7xx-emc.txt
 create mode 100644 drivers/net/ethernet/nuvoton/npcm7xx_emc.c

-- 
2.18.0

