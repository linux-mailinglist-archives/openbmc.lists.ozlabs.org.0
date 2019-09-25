Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2157FBDEC3
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 15:17:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ddrl25XlzDqWS
	for <lists+openbmc@lfdr.de>; Wed, 25 Sep 2019 23:17:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.34.219; helo=4.mo173.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
Received: from 4.mo173.mail-out.ovh.net (4.mo173.mail-out.ovh.net
 [46.105.34.219])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ddSG5zwszDqn4
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 22:59:41 +1000 (AEST)
Received: from player698.ha.ovh.net (unknown [10.108.35.122])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id 3098311ABF3
 for <openbmc@lists.ozlabs.org>; Wed, 25 Sep 2019 14:43:21 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player698.ha.ovh.net (Postfix) with ESMTPSA id 7C047A33DF06;
 Wed, 25 Sep 2019 12:43:17 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.3 05/13] mtd: spi-nor: Add support for w25q512jv
Date: Wed, 25 Sep 2019 14:42:31 +0200
Message-Id: <20190925124239.27897-6-clg@kaod.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925124239.27897-1-clg@kaod.org>
References: <20190925124239.27897-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6983112699535330050
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 drivers/mtd/spi-nor/spi-nor.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 0034e7751239..ff6b719fd267 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -2151,6 +2151,8 @@ static const struct flash_info spi_nor_ids[] = {
 	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
 	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
 	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
+	{ "w25q512jv", INFO(0xef4020, 0, 64 * 1024, 1024, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ |
+			SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB) },
 	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
 			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
 
-- 
2.21.0

