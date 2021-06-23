Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F073B1288
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 05:58:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8qJ1191zz30BG
	for <lists+openbmc@lfdr.de>; Wed, 23 Jun 2021 13:58:41 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8qHW4CHtz2yYG
 for <openbmc@lists.ozlabs.org>; Wed, 23 Jun 2021 13:58:15 +1000 (AEST)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 15N3hIWd051146;
 Wed, 23 Jun 2021 11:43:18 +0800 (GMT-8)
 (envelope-from troy_lee@aspeedtech.com)
Received: from localhost.localdomain (192.168.10.9) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 23 Jun
 2021 11:58:01 +0800
From: Troy Lee <troy_lee@aspeedtech.com>
To: <leetroy@gmail.com>, <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v1 2/2] ast2600: Provide u-boot
 FIT image boot from RAM offset
Date: Wed, 23 Jun 2021 11:57:55 +0800
Message-ID: <20210623035755.32742-2-troy_lee@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210623035755.32742-1-troy_lee@aspeedtech.com>
References: <20210623035755.32742-1-troy_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.10.9]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 15N3hIWd051146
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

If BOOT_DEVICE_RAM is selected, CONFIG_SPL_LOAD_FIT_ADDRESS will be
required in loader spl/spl_ram.c, and the offset is 64KiB.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
---
 include/configs/evb_ast2600_spl.h   | 1 +
 include/configs/evb_ast2600a1_spl.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/configs/evb_ast2600_spl.h b/include/configs/evb_ast2600_spl.h
index a39988820a..f4f1b46d89 100644
--- a/include/configs/evb_ast2600_spl.h
+++ b/include/configs/evb_ast2600_spl.h
@@ -29,6 +29,7 @@
 #define CONFIG_SPL_STACK		0x10016000
 #define CONFIG_SPL_BSS_START_ADDR	0x90000000
 #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
+#define CONFIG_SPL_LOAD_FIT_ADDRESS     0x00010000
 
 #define CONFIG_SUPPORT_EMMC_BOOT
 
diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index a39988820a..f4f1b46d89 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -29,6 +29,7 @@
 #define CONFIG_SPL_STACK		0x10016000
 #define CONFIG_SPL_BSS_START_ADDR	0x90000000
 #define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
+#define CONFIG_SPL_LOAD_FIT_ADDRESS     0x00010000
 
 #define CONFIG_SUPPORT_EMMC_BOOT
 
-- 
2.17.1

