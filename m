Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0CF501D01
	for <lists+openbmc@lfdr.de>; Thu, 14 Apr 2022 23:00:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfX0n6pGTz2yw9
	for <lists+openbmc@lfdr.de>; Fri, 15 Apr 2022 07:00:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=ni51RCDV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=ni51RCDV; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KfX0N2Sr8z2xmS
 for <openbmc@lists.ozlabs.org>; Fri, 15 Apr 2022 07:00:04 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-187-98.tukw.qwest.net
 [174.21.187.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 8804C32E;
 Thu, 14 Apr 2022 14:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1649970001;
 bh=MiFrFSyYQfXgHO5nfBObvq6ih+FK0+ooPGl9PAdHu9o=;
 h=From:To:Cc:Subject:Date:From;
 b=ni51RCDVzCQMuWR12VnAztbLYMsYuvwpXDO41dj1XVnsQcMoDuMt+3geLIZtNV5EY
 vbz2wtw1xFfNhYLHPxpaBjnsmkKmV7z1WbevG6els0xPDab9UAaijoaI++Qo3Fduqj
 IADQUqC5cI/BThkbGwZYj0XhgSzD/al3zhUKsr1U=
From: Zev Weiss <zev@bewilderbeest.net>
To: Joel Stanley <joel@jms.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add support
 for RGMII2
Date: Thu, 14 Apr 2022 13:59:50 -0700
Message-Id: <20220414205950.26406-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.35.1
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

The bits configured by this pinctrl group are set to the same values
as their reset defaults, so RGMII2 functionality would likely work
anyway, but it seems good to make it explicit instead of relying on
that.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/pinctrl/aspeed/pinctrl_ast2400.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
index a8a5ff517108..debe6b83d553 100644
--- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
@@ -133,6 +133,10 @@ static struct aspeed_sig_desc rxd3_link[] = {
 	{ 0x80, BIT(23), 0},
 };
 
+static struct aspeed_sig_desc rgmii2_link[] = {
+	{ 0xa0, GENMASK(23, 18) | GENMASK(11, 6), 1 },
+};
+
 static const struct aspeed_group_config ast2400_groups[] = {
 	{ "MAC1LINK", 1, mac1_link },
 	{ "MAC2LINK", 1, mac2_link },
@@ -156,6 +160,7 @@ static const struct aspeed_group_config ast2400_groups[] = {
 	{ "SPI1CS1", 1, spi1cs1_link},
 	{ "TXD3", 1, txd3_link },
 	{ "RXD3", 1, rxd3_link },
+	{ "RGMII2", 1, rgmii2_link },
 };
 
 static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
-- 
2.35.1

