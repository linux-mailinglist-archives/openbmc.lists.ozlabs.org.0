Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCD3523FF0
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 00:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kz89P4zWQz3c7J
	for <lists+openbmc@lfdr.de>; Thu, 12 May 2022 08:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=inK4FK0I;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=inK4FK0I; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kz88z4FDsz2yK6
 for <openbmc@lists.ozlabs.org>; Thu, 12 May 2022 08:05:07 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-163-222.tukw.qwest.net
 [174.21.163.222])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id EF6DE56;
 Wed, 11 May 2022 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1652306703;
 bh=LRBQA9f7mq9xvT6kfKdeHpdWQ/DbESuXPls5kusIcT4=;
 h=From:To:Cc:Subject:Date:From;
 b=inK4FK0IihguTlnSnwKHbgFHp9fctj+U3cFsFGiJk+OdyBxolhR17BhCqNpjpCNB0
 pgGAPHThcKvEqiN3Z73FNe2/1Pts7iIVB8W5GCxN9r5Esxc6sNG08fVsPB5No8an2T
 9dSz5OfMc3pPUnrctsqZN+sEUHvVoH/YX/mBsJck=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2] pinctrl: ast2400: add
 support for RGMII1 and RGMII2
Date: Wed, 11 May 2022 15:04:52 -0700
Message-Id: <20220511220452.4320-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Ryan Chen <ryan_chen@aspeedtech.com>,
 Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The bits configured by these pinctrl groups are set to the same values
as their reset defaults, so RGMII functionality would likely work
anyway, but it seems good to make it explicit instead of relying on
that.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v1 [0]:
 - Added RGMII1 group [Joel]

[0] https://lore.kernel.org/openbmc/20220414205950.26406-1-zev@bewilderbeest.net/

 drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
index a8a5ff517108..531e116c7967 100644
--- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
@@ -133,6 +133,14 @@ static struct aspeed_sig_desc rxd3_link[] = {
 	{ 0x80, BIT(23), 0},
 };
 
+static struct aspeed_sig_desc rgmii1_link[] = {
+	{ 0xa0, GENMASK(17, 12) | GENMASK(5, 0), 1 },
+};
+
+static struct aspeed_sig_desc rgmii2_link[] = {
+	{ 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
+};
+
 static const struct aspeed_group_config ast2400_groups[] = {
 	{ "MAC1LINK", 1, mac1_link },
 	{ "MAC2LINK", 1, mac2_link },
@@ -156,6 +164,8 @@ static const struct aspeed_group_config ast2400_groups[] = {
 	{ "SPI1CS1", 1, spi1cs1_link},
 	{ "TXD3", 1, txd3_link },
 	{ "RXD3", 1, rxd3_link },
+	{ "RGMII1", 1, rgmii1_link },
+	{ "RGMII2", 1, rgmii2_link },
 };
 
 static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
-- 
2.35.3

