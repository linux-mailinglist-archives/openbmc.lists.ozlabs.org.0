Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9913B13B3
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 08:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8t9Q4SkSz3bsN
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 16:08:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8t9D3Mw2z2yWt
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 16:07:58 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15N5r0FJ062139;
 Wed, 23 Jun 2021 13:53:00 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Jun
 2021 14:07:44 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <leetroy@gmail.com>, <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v1 1/2] ast2600: spl: Fixes
 boot from RAM device
Date: Wed, 23 Jun 2021 14:07:41 +0800
Message-ID: <20210623060742.22158-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15N5r0FJ062139
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Reporting a BOOT_DEVICE_RAM can leverage common/spl/spl_ram.c
to bring up u-boot.bin by memory offset 0x00010000.

Fixes: 13dd0b0f7273 ("ast2600: spl: Support common boot loader features")
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 arch/arm/mach-aspeed/ast2600/spl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/ast2600/spl.c b/arch/arm/mach-aspeed/ast2600/spl.c
index 778b326755..c759a7575d 100644
--- a/arch/arm/mach-aspeed/ast2600/spl.c
+++ b/arch/arm/mach-aspeed/ast2600/spl.c
@@ -66,7 +66,7 @@ u32 spl_boot_device(void)
 	case AST_BOOTMODE_EMMC:
 		return BOOT_DEVICE_MMC1;
 	case AST_BOOTMODE_SPI:
-		return BOOT_DEVICE_SPI;
+		return BOOT_DEVICE_RAM;
 	case AST_BOOTMODE_UART:
 		return BOOT_DEVICE_UART;
 	}
-- 
2.17.1

