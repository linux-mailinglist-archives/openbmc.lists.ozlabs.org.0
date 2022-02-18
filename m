Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 974604BB60B
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 11:01:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0Rzx0rX9z3cRn
	for <lists+openbmc@lfdr.de>; Fri, 18 Feb 2022 21:01:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=troy_lee@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Rzh005Xz3bc6
 for <openbmc@lists.ozlabs.org>; Fri, 18 Feb 2022 21:01:17 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21I9qQ7o040301;
 Fri, 18 Feb 2022 17:52:26 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 18 Feb
 2022 18:01:05 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] configs: increasing SPL stack
 size
Date: Fri, 18 Feb 2022 18:01:04 +0800
Message-ID: <20220218100104.1380598-1-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [192.168.10.10]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21I9qQ7o040301
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
Cc: leetroy@gmail.com, jamin_lin@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

With commit 5e8cacaa7096 ("Support UART1/2/3/4 as booting console"),
the SPL requires more memory. Without this patch, the machine will stop
execution right after "Trying to boot from RAM".

Tested with AST2600-A1 and AST2600-A3 evaluation board.

Fixes: 5e8cacaa7096 ("Support UART1/2/3/4 as booting console")
Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 configs/ast2600_openbmc_spl_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ast2600_openbmc_spl_defconfig b/configs/ast2600_openbmc_spl_defconfig
index c1ed4f54d5..98aa3f160e 100644
--- a/configs/ast2600_openbmc_spl_defconfig
+++ b/configs/ast2600_openbmc_spl_defconfig
@@ -22,14 +22,14 @@ CONFIG_ASPEED_KERNEL_FIT_DRAM_BASE=0x83000000
 CONFIG_TARGET_EVB_AST2600A1=y
 CONFIG_SPL_LIBCOMMON_SUPPORT=y
 CONFIG_SPL_LIBGENERIC_SUPPORT=y
-CONFIG_SYS_MALLOC_F_LEN=0x800
+CONFIG_SYS_MALLOC_F_LEN=0x2000
 CONFIG_SPL_MMC_SUPPORT=y
 CONFIG_SPL_SERIAL_SUPPORT=y
 CONFIG_SPL_DRIVERS_MISC_SUPPORT=y
 CONFIG_ENV_SIZE=0x10000
 CONFIG_ENV_OFFSET=0xE0000
 CONFIG_SPL=y
-CONFIG_SPL_STACK_R_ADDR=0x90300000
+CONFIG_SPL_STACK_R_ADDR=0x93000000
 CONFIG_ARMV7_BOOT_SEC_DEFAULT=y
 CONFIG_ARMV7_PSCI_NR_CPUS=2
 CONFIG_NR_DRAM_BANKS=1
-- 
2.25.1

