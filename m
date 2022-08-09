Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F458E50A
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 05:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2ZTM07w0z2xGY
	for <lists+openbmc@lfdr.de>; Wed, 10 Aug 2022 13:01:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M2FJT35wtz2ypH
	for <openbmc@lists.ozlabs.org>; Wed, 10 Aug 2022 00:07:36 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 279E7TfH006490
	for <openbmc@lists.ozlabs.org>; Tue, 9 Aug 2022 17:07:29 +0300
Received: from NTHCML01A.nuvoton.com (10.1.8.177) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 9 Aug
 2022 17:07:28 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCML01A.nuvoton.com
 (10.1.8.177) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 9 Aug 2022
 22:07:26 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Tue, 9 Aug 2022 22:07:26 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 2C6AA62EFD; Tue,  9 Aug 2022 17:07:25 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/2] misc: npcm7xx-pci-mbox: add Arbel NPCM8XX support 
Date: Tue, 9 Aug 2022 17:07:19 +0300
Message-ID: <20220809140721.28958-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 10 Aug 2022 13:00:00 +1000
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX PCI Mail Box support to PCI MBOX NPCM
driver.

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

Tomer Maimon (2):
  dt-binding: bmc: npcm7xx-pci-mbox: Add npcm845 compatible
  misc: npcm7xx-pci-mbox: Add NPCM845 PCI MBOX support

 .../devicetree/bindings/bmc/npcm7xx-pci-mbox.txt       |  5 +++--
 drivers/misc/Kconfig                                   | 10 +++++-----
 drivers/misc/Makefile                                  |  2 +-
 3 files changed, 9 insertions(+), 8 deletions(-)

-- 
2.33.0

