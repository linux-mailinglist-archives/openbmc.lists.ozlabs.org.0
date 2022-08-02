Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2937587CF7
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 15:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxwbM5MXNz3cB8
	for <lists+openbmc@lfdr.de>; Tue,  2 Aug 2022 23:20:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxwXp4gcgz304J
	for <openbmc@lists.ozlabs.org>; Tue,  2 Aug 2022 23:18:18 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 272DI4iZ021466
	for <openbmc@lists.ozlabs.org>; Tue, 2 Aug 2022 16:18:04 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTILML01.nuvoton.com
 (10.190.1.56) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 2 Aug
 2022 16:18:03 +0300
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 2 Aug
 2022 21:18:00 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS04.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2176.2 via Frontend
 Transport; Tue, 2 Aug 2022 21:18:00 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id F3E8462EFD; Tue,  2 Aug 2022 16:17:59 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 0/5] drivers: add NPCM8XX support to RNG and USB Host drivers
Date: Tue, 2 Aug 2022 16:17:52 +0300
Message-ID: <20220802131757.234026-1-tmaimon77@gmail.com>
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Arbel NPCM8XX support to RNG and USB Host drivers. 

This patchset was tested on the Arbel NPCM8XX evaluation board that running 
Arbel OpenBMC.

The USB Host patchset is based on the Arbel NPCM8XX BMC 5.19 kernel patchsets
https://lore.kernel.org/all/20220718122922.9396-1-tmaimon77@gmail.com/

Tomer Maimon (5):
  usb: host: npcm7xx: remove USB EHCI host reset sequence
  dt-bindings: usb: npcm7xx: Add npcm845 compatible
  USB: host: npcm: Add NPCM8XX support
  dt-bindings: rng: nuvoton,npcm-rng: Add npcm845 compatible
  char: hwrng: npcm: Add NPCM8XX support

 .../bindings/rng/nuvoton,npcm-rng.txt         |  2 +
 .../devicetree/bindings/usb/npcm7xx-usb.txt   |  4 +-
 drivers/char/hw_random/npcm-rng.c             | 13 +++--
 drivers/usb/host/Kconfig                      |  8 +--
 drivers/usb/host/ehci-npcm7xx.c               | 50 -------------------
 5 files changed, 19 insertions(+), 58 deletions(-)

-- 
2.33.0

