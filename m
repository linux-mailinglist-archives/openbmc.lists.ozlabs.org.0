Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 258B74C24FD
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 09:12:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45Gp3VPWz3035
	for <lists+openbmc@lfdr.de>; Thu, 24 Feb 2022 19:12:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aspeedtech.com (client-ip=211.20.114.71;
 helo=twspam01.aspeedtech.com; envelope-from=jamin_lin@aspeedtech.com;
 receiver=<UNKNOWN>)
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com
 [211.20.114.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45GW2LgPz2x9Q
 for <openbmc@lists.ozlabs.org>; Thu, 24 Feb 2022 19:11:46 +1100 (AEDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 21O82Mlu023166;
 Thu, 24 Feb 2022 16:02:22 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from localhost.localdomain (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 24 Feb
 2022 16:11:22 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: <openbmc@lists.ozlabs.org>, <joel@jms.id.au>, <andrew@aj.id.au>
Subject: [u-boot,
 v2019.04-aspeed-openbmc 1/1] fix compiling warnings for AST2600 A1 SPL
Date: Thu, 24 Feb 2022 16:11:21 +0800
Message-ID: <20220224081121.10389-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220224081121.10389-1-jamin_lin@aspeedtech.com>
References: <20220224081121.10389-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 21O82Mlu023166
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
Cc: troy_lee@aspeedtech.com, steven_lee@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

remove duplicated define

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 include/configs/evb_ast2600a1_spl.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/configs/evb_ast2600a1_spl.h b/include/configs/evb_ast2600a1_spl.h
index 655896b237..006cc4345b 100644
--- a/include/configs/evb_ast2600a1_spl.h
+++ b/include/configs/evb_ast2600a1_spl.h
@@ -42,13 +42,6 @@
 #endif
 #endif
 
-/* SPL */
-#define CONFIG_SPL_TEXT_BASE		0x00000000
-#define CONFIG_SPL_MAX_SIZE		0x0000E800
-#define CONFIG_SPL_STACK		0x10010000
-#define CONFIG_SPL_BSS_START_ADDR	0x90000000
-#define CONFIG_SPL_BSS_MAX_SIZE		0x00100000
-
 #define CONFIG_SUPPORT_EMMC_BOOT
 
 #endif	/* __CONFIG_H */
-- 
2.17.1

