Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF320ECA
	for <lists+openbmc@lfdr.de>; Thu, 16 May 2019 20:37:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454gCH0sYhzDqHn
	for <lists+openbmc@lfdr.de>; Fri, 17 May 2019 04:37:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=178.32.96.204; helo=9.mo5.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 7800 seconds by postgrey-1.36 at bilbo;
 Fri, 17 May 2019 04:37:18 AEST
Received: from 9.mo5.mail-out.ovh.net (9.mo5.mail-out.ovh.net [178.32.96.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454gBk5zXFzDqF3
 for <openbmc@lists.ozlabs.org>; Fri, 17 May 2019 04:37:14 +1000 (AEST)
Received: from player716.ha.ovh.net (unknown [10.108.35.122])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id 537E822D09A
 for <openbmc@lists.ozlabs.org>; Thu, 16 May 2019 18:11:59 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
 (Authenticated sender: clg@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id F0FEB5C88A91;
 Thu, 16 May 2019 16:11:53 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH qemu] aspeed: add support for a witherspoon-bmc board with
 128MB flash chip
Date: Thu, 16 May 2019 18:11:48 +0200
Message-Id: <20190516161148.31062-1-clg@kaod.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10073989417936456450
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddgleehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some Witherspoon boards are shipped with a mt25ql01g flash chip
holding the BMC firmware.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---

 It helps in tracking https://github.com/openbmc/u-boot/issues/18

 hw/arm/aspeed.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index efc97df00de0..f26215ab5524 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -441,6 +441,17 @@ static const AspeedBoardConfig aspeed_boards[] = {
         .i2c_init  = witherspoon_bmc_i2c_init,
         .ram       = 512 * MiB,
         .num_cpus  = 1,
+     }, {
+        .name      = MACHINE_TYPE_NAME("witherspoon128-bmc"),
+        .desc      = "OpenPOWER Witherspoon128 BMC (ARM1176)",
+        .soc_name  = "ast2500-a1",
+        .hw_strap1 = WITHERSPOON_BMC_HW_STRAP1,
+        .fmc_model = "mt25ql01g",
+        .spi_model = "mx66l1g45g",
+        .num_cs    = 2,
+        .i2c_init  = witherspoon_bmc_i2c_init,
+        .ram       = 512 * MiB,
+        .num_cpus  = 1,
     }, {
         .name      = MACHINE_TYPE_NAME("ast2600-evb"),
         .desc      = "Aspeed AST2600 EVB (Cortex A7)",
-- 
2.20.1

