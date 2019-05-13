Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D44811B135
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 09:34:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452Xd518ZvzDqFm
	for <lists+openbmc@lfdr.de>; Mon, 13 May 2019 17:34:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 452XcJ4fR4zDqD9
 for <openbmc@lists.ozlabs.org>; Mon, 13 May 2019 17:33:33 +1000 (AEST)
Received: from taln60.nuvoton.co.il (ntil-fw [212.199.177.25])
 by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id x4D7XFQt003913;
 Mon, 13 May 2019 10:33:15 +0300
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
 id ADA7462E79; Mon, 13 May 2019 10:33:15 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: [dev-5.1 v1] dts: npcm750: modify SPI partition label names
Date: Mon, 13 May 2019 10:33:13 +0300
Message-Id: <20190513073313.379024-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.14.1
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
Cc: openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Modify NPCM750 evaluation board SPI's
partition label names to use different partition
labels names in all SPI's partition label names.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm/boot/dts/nuvoton-npcm750-evb.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
index 7728f7b69d13..de9c668c6e9a 100644
--- a/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
+++ b/arch/arm/boot/dts/nuvoton-npcm750-evb.dts
@@ -515,11 +515,11 @@
 					#size-cells = <1>;
 					spi-max-frequency = <5000000>;
 					partition@0 {
-						label = "spi_spare1";
+						label = "spi0_spare1";
 						reg = <0x0000000 0x800000>;
 					};
 					partition@1 {
-						label = "spi_spare2";
+						label = "spi0_spare2";
 						reg = <0x800000 0x0>;
 					};
 				};
@@ -536,11 +536,11 @@
 					#size-cells = <1>;
 					spi-max-frequency = <5000000>;
 					partition@0 {
-						label = "spi_spare1";
+						label = "spi1_spare1";
 						reg = <0x0000000 0x800000>;
 					};
 					partition@1 {
-						label = "spi_spare2";
+						label = "spi1_spare2";
 						reg = <0x800000 0x0>;
 					};
 				};
-- 
2.14.1

