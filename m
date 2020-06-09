Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DB51F379C
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 12:07:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49h5Qb1lklzDqc7
	for <lists+openbmc@lfdr.de>; Tue,  9 Jun 2020 20:07:35 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=nuvoton.com
 (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il;
 envelope-from=tali.perry@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=gmail.com
Received: from herzl.nuvoton.co.il (212.199.177.27.static.012.net.il
 [212.199.177.27])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49h5Pm5c24zDqb1
 for <openbmc@lists.ozlabs.org>; Tue,  9 Jun 2020 20:06:46 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 059A61L0028296;
 Tue, 9 Jun 2020 13:06:02 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 20088)
 id 99A1E639BE; Tue,  9 Jun 2020 13:06:01 +0300 (IDT)
From: Tali Perry <tali.perry1@gmail.com>
To: mchehab+huawei@kernel.org, davem@davemloft.net, robh@kernel.org,
 gregkh@linuxfoundation.org, avifishman70@gmail.com,
 tmaimon77@gmail.com, wsa@the-dreams.de
Subject: [PATCH v1] MAINTAINERS: npcm7xx: Add maintainer for Nuvoton NPCM BMC
Date: Tue,  9 Jun 2020 13:05:18 +0300
Message-Id: <20200609100518.239570-1-tali.perry1@gmail.com>
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
Cc: openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add maintainer for Nuvoton NPCM BMC
I2C controller driver.

Signed-off-by: Tali Perry <tali.perry1@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b..3a7365664676 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2143,6 +2143,7 @@ F:	arch/arm/boot/dts/nuvoton-npcm*
 F:	arch/arm/mach-npcm/
 F:	drivers/*/*npcm*
 F:	include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
+F:	drivers/i2c/busses/*npcm*
 
 ARM/OPENMOKO NEO FREERUNNER (GTA02) MACHINE SUPPORT
 L:	openmoko-kernel@lists.openmoko.org (subscribers-only)

base-commit: 9cb1fd0efd195590b828b9b865421ad345a4a145
-- 
2.22.0

