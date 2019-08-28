Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F5BA0767
	for <lists+openbmc@lfdr.de>; Wed, 28 Aug 2019 18:30:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JWST5VltzDr97
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 02:30:33 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JWNt5LSKzDr8H
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 02:27:22 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x7SGQIxP004238;
 Wed, 28 Aug 2019 19:26:19 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id D77DF628F1; Wed, 28 Aug 2019 19:26:18 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: mpm@selenic.com, herbert@gondor.apana.org.au, arnd@arndb.de,
 gregkh@linuxfoundation.org, robh+dt@kernel.org, mark.rutland@arm.com,
 avifishman70@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, sumit.garg@linaro.org,
 jens.wiklander@linaro.org, vkoul@kernel.org, tglx@linutronix.de,
 joel@jms.id.au
Subject: [PATCH v1 0/2] hwrng: npcm: add NPCM RNG driver support
Date: Wed, 28 Aug 2019 19:26:15 +0300
Message-Id: <20190828162617.237398-1-tmaimon77@gmail.com>
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
 linux-crypto@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This patch set adds Randon Number Generator (RNG) support 
for the Nuvoton NPCM Baseboard Management Controller (BMC).

The RNG driver we use power consumption when the RNG 
is not required.

The NPCM RNG driver tested on NPCM750 evaluation board.

Tomer Maimon (2):
  dt-binding: hwrng: add NPCM RNG documentation
  hwrng: npcm: add NPCM RNG driver

 .../bindings/rng/nuvoton,npcm-rng.txt         |  17 ++
 drivers/char/hw_random/Kconfig                |  13 ++
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/npcm-rng.c             | 207 ++++++++++++++++++
 4 files changed, 238 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/nuvoton,npcm-rng.txt
 create mode 100644 drivers/char/hw_random/npcm-rng.c

-- 
2.18.0

