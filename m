Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58437588F11
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 17:04:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyZsP2MPJz3c3N
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 01:04:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized) smtp.mailfrom=nuvoton.com (client-ip=212.199.177.27; helo=herzl.nuvoton.co.il; envelope-from=tomer.maimon@nuvoton.com; receiver=<UNKNOWN>)
Received: from herzl.nuvoton.co.il (unknown [212.199.177.27])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyZrb6dP6z2xrM
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 01:04:12 +1000 (AEST)
Received: from NTILML01.nuvoton.com (ntil-fw [212.199.177.25])
	by herzl.nuvoton.co.il (8.13.8/8.13.8) with ESMTP id 273F41dw020237
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 18:04:02 +0300
Received: from NTHCCAS02.nuvoton.com (10.1.9.121) by NTILML01.nuvoton.com
 (10.190.1.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 3 Aug
 2022 18:04:01 +0300
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS02.nuvoton.com
 (10.1.9.121) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 3 Aug 2022
 23:03:59 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Wed, 3 Aug 2022 23:03:59 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
	id 5201B63A0A; Wed,  3 Aug 2022 18:03:58 +0300 (IDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: <openbmc@lists.ozlabs.org>
Subject: [PATCH linux dev-5.15 v1 2/2] spi: npcm-pspi: Add NPCM845 peripheral SPI support
Date: Wed, 3 Aug 2022 18:03:54 +0300
Message-ID: <20220803150354.91111-3-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220803150354.91111-1-tmaimon77@gmail.com>
References: <20220803150354.91111-1-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: andrew@aj.id.au, joel@jms.id.au, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add Nuvoton BMC NPCM845 NPCM Peripheral SPI (PSPI) support.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/spi/spi-npcm-pspi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-npcm-pspi.c b/drivers/spi/spi-npcm-pspi.c
index 02f0fcceaf19..6de9bb566cac 100644
--- a/drivers/spi/spi-npcm-pspi.c
+++ b/drivers/spi/spi-npcm-pspi.c
@@ -428,6 +428,7 @@ static int npcm_pspi_remove(struct platform_device *pdev)
 
 static const struct of_device_id npcm_pspi_match[] = {
 	{ .compatible = "nuvoton,npcm750-pspi", .data = NULL },
+	{ .compatible = "nuvoton,npcm845-pspi", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, npcm_pspi_match);
-- 
2.33.0

