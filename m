Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029038325
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 05:31:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Kp2r5ssRzDqkT
	for <lists+openbmc@lfdr.de>; Fri,  7 Jun 2019 13:31:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ami.com
 (client-ip=63.147.10.42; helo=atlmailgw2.ami.com;
 envelope-from=hongweiz@ami.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ami.com
Received: from atlmailgw2.ami.com (atlmailgw2.ami.com [63.147.10.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45K1G931jlzDqX3
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 06:53:03 +1000 (AEST)
X-AuditID: ac10606f-bbfff70000003de9-e1-5cf82bac9c0c
Received: from atlms1.us.megatrends.com (atlms1.us.megatrends.com
 [172.16.96.144])
 (using TLS with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by atlmailgw2.ami.com (Symantec Messaging Gateway) with SMTP id
 4E.88.15849.CAB28FC5; Wed,  5 Jun 2019 16:53:00 -0400 (EDT)
Received: from hongweiz-Ubuntu-AMI.us.megatrends.com (172.16.98.93) by
 atlms1.us.megatrends.com (172.16.96.144) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Wed, 5 Jun 2019 16:52:59 -0400
From: Hongwei Zhang <hongweiz@ami.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [u-boot,
 v2016.07-aspeed-openbmc v1] aspeed/flash: add winbond SPI support
Date: Wed, 5 Jun 2019 16:52:45 -0400
Message-ID: <1559767965-21037-1-git-send-email-hongweiz@ami.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.16.98.93]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkluLIzCtJLcpLzFFi42JZI5AwQXeN9o8Yg6W9Uha7LnNY/D7/l9ni
 VMsLFgdmj6vtu9g9Ln48xuxxfsZCxgDmKC6blNSczLLUIn27BK6MW8tesRZc5ayYu+AvWwPj
 VfYuRk4OCQETiRX3PzJ1MXJxCAnsYpL4PnsRO4RziFGif+J3NpAqNgE1ib2b5zCB2CICzhJz
 V5xkBrGZBRwkPu/aC2YLCwRJ9LzoZwWxWQRUJDad3ckCYvMC1dw7uZEJYpucxM1zncwQcUGJ
 kzOfsEDMkZA4+OIFWFxIQFbi1qHHUPUKEs/7HrNMYOSbhaRlFpKWBYxMqxiFEktychMzc9LL
 jfQSczP1kvNzNzFCgit/B+PHj+aHGJk4GIEe4mBWEuFNvP0lRog3JbGyKrUoP76oNCe1+BCj
 NAeLkjjvqjXfYoQE0hNLUrNTUwtSi2CyTBycUg2Msz2876w5KLWIT0r4ph73nUW7lXadXXV8
 S6rrBjWd4ilZ/jNzFA2VrM4L+m+se93orPnhyv6nUxIzQ81/r0m4aDPr41c2x3eTDNht1dJb
 WM1WBoSsOHt4Ubjt6kaDN3rBWRI3jYPYTe5curdwa0uv97sJ0hGvquZN4fz4IVPokFTfkkPX
 3y7SV2Ipzkg01GIuKk4EACJR8PgcAgAA
X-Mailman-Approved-At: Fri, 07 Jun 2019 13:30:27 +1000
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
Cc: openbmc@lists.ozlabs.org, Hongwei Zhang <hongweiz@ami.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Winbond SPI flash W25M512JV support to u-boot.

Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
---
 a/arch/arm/mach-aspeed/flash.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/mach-aspeed/flash.c b/arch/arm/mach-aspeed/flash.c
index db69d51..eefa6cd 100644
--- a/arch/arm/mach-aspeed/flash.c
+++ b/arch/arm/mach-aspeed/flash.c
@@ -84,6 +84,7 @@ flash_info_t flash_info[CONFIG_SYS_MAX_FLASH_BANKS];		/* FLASH chips info */
 #define AT25DF161		0x02461F
 #define AT25DF321		0x01471F
 #define MT25QL01GB		0x21ba20
+#define W25M512JV		0x1971ef
 
 /* SPI Define */
 #define CS0_CTRL			0x10
@@ -1156,6 +1157,20 @@ static ulong flash_get_size (ulong base, flash_info_t *info)
 			info->address32 = 1;
 			break;
 
+		case W25M512JV:
+			info->sector_count = 512;
+			info->size = 0x2000000;
+			erase_region_size  = 0x10000;
+			info->readcmd = 0x0b;
+			info->dualport = 1;
+			info->dummybyte = 1;
+			info->buffersize = 256;
+			WriteClk = 50;
+			EraseClk = 20;
+			ReadClk  = 50;
+			info->address32 = 1;
+			break;
+
 		default:	/* use JEDEC ID */
 			printf("Unsupported SPI Flash!! 0x%08lx\n", info->flash_id);
 			erase_region_size  = 0x10000;
-- 
2.7.4

