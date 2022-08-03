Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DCE58A465
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 03:13:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzSJr64Jwz3blw
	for <lists+openbmc@lfdr.de>; Fri,  5 Aug 2022 11:13:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyZrb5vBrz2xkh
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 01:04:12 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 273F41du020237
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 18:04:01 +0300
Received: from NTHCCAS03.nuvoton.com (10.1.20.28) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 3 Aug
 2022 18:04:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS03.nuvoton.com
 (10.1.20.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Wed, 3 Aug 2022
 23:03:59 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 3 Aug 2022 23:03:59 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 4055760365; Wed,  3 Aug 2022 18:03:58 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/2] spi: npcm-pspi: add Arbel NPCM8XX support 
Date: Wed, 3 Aug 2022 18:03:52 +0300
Message-ID: <20220803150354.91111-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 05 Aug 2022 11:13:04 +1000
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

This patch set adds Arbel NPCM8XX Peripheral SPI (PSPI) support to PSPI NPCM
driver.

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

This patchset is based on the Arbel NPCM8XX BMC 5.19 kernel patchsets
https://lore.kernel.org/lkml/20220722114136.251415-1-tmaimon77@gmail.com/T/

Tomer Maimon (2):
  dt-binding: spi: npcm-pspi: Add npcm845 compatible
  spi: npcm-pspi: Add NPCM845 peripheral SPI support

 Documentation/devicetree/bindings/spi/nuvoton,npcm-pspi.txt | 3 ++-
 drivers/spi/spi-npcm-pspi.c                                 | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.33.0

