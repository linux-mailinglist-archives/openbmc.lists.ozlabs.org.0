Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9C4BF4C3
	for <lists+openbmc@lfdr.de>; Thu, 26 Sep 2019 16:12:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fH1c6mXQzDqX9
	for <lists+openbmc@lfdr.de>; Fri, 27 Sep 2019 00:12:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.39.154; helo=5.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 5.mo177.mail-out.ovh.net (5.mo177.mail-out.ovh.net
 [46.105.39.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fGV164c7zDqsN
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 23:48:23 +1000 (AEST)
Received: from player756.ha.ovh.net (unknown [10.108.57.141])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 926551093AE
 for <openbmc@lists.ozlabs.org>; Thu, 26 Sep 2019 15:48:15 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player756.ha.ovh.net (Postfix) with ESMTPSA id A28899736BA3;
 Thu, 26 Sep 2019 13:48:13 +0000 (UTC)
Subject: Re: [PATCH linux dev-5.3] ARM: dts: aspeed: tacoma: Disable CS1 as it
 is broken
To: Joel Stanley <joel@jms.id.au>, openbmc@lists.ozlabs.org
References: <20190926093324.16892-1-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fba50110-9a04-3097-29b4-37ef1eee3766@kaod.org>
Date: Thu, 26 Sep 2019 15:48:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190926093324.16892-1-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13951870173595339522
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfeeggdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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

On 26/09/2019 11:33, Joel Stanley wrote:
> We currently hang when attempting to probe the second flash chip on the
> FMC. Disable it until this issue is resolved.


Reviewed-by: Cédric Le Goater <clg@kaod.org>


Below is a fix. It's worth a try.

Thanks,

C. 

From cb1237b2fdf8f5a55254ac066d8ab3c4924c93b6 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Thu, 26 Sep 2019 15:45:37 +0200
Subject: [PATCH] mtd: spi-nor: aspeed: fix training of multiple CS on the
 AST2600
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Each CE has its own read timing compensation register.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/aspeed-smc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
index e9bc89755912..9873824eb381 100644
--- a/drivers/mtd/spi-nor/aspeed-smc.c
+++ b/drivers/mtd/spi-nor/aspeed-smc.c
@@ -1133,7 +1133,7 @@ static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32
 		fread_timing_val |= hcycle << shift;
 
 		/* no DI input delay first  */
-		writel(fread_timing_val, controller->regs + info->timing);
+		writel(fread_timing_val, controller->regs + info->timing + chip->cs);
 		pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
 		dev_dbg(chip->nor.dev,
 			"  * [%08x] %d HCLK delay, DI delay none : %s",
@@ -1149,7 +1149,8 @@ static int aspeed_smc_calibrate_reads_ast2600(struct aspeed_smc_chip *chip, u32
 			fread_timing_val &= ~(0xf << (4 + shift));
 			fread_timing_val |= delay_ns << (4 + shift);
 
-			writel(fread_timing_val, controller->regs + info->timing);
+			writel(fread_timing_val,
+			       controller->regs + info->timing + chip->cs);
 			pass = aspeed_smc_check_reads(chip, golden_buf, test_buf);
 			dev_dbg(chip->nor.dev,
 				"  * [%08x] %d HCLK delay, DI delay %d.%dns : %s",
-- 
2.21.0
