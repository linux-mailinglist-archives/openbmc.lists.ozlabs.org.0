Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D0A47353B
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 20:47:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCX9J6nStz301k
	for <lists+openbmc@lfdr.de>; Tue, 14 Dec 2021 06:47:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=M4qbUB4c;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=M4qbUB4c; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [IPv6:2605:2700:0:5::4713:9cab])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCX8x11Lcz2yZh
 for <openbmc@lists.ozlabs.org>; Tue, 14 Dec 2021 06:47:28 +1100 (AEDT)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net
 [174.21.184.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 9437882;
 Mon, 13 Dec 2021 11:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1639424843;
 bh=LRxZhkkyYc5shGKM00WnK2JwfyyO7RjCK6rPNlArHXM=;
 h=From:To:Cc:Subject:Date:From;
 b=M4qbUB4cruvFBXKlFzT1N75EJldLcgmbNyfa1HXzYXXs15WML3xit9pU8NW2mA9CB
 Ne9kSljpJ/w8bmAVj5q9yiz58qQp+HvatIBq/kIPRMinsFKhqUZRzu5armd5EzsY3C
 B/7vG/TP9eKeYuoXIWj0nYN9nq7WespCzgrqSc1U=
From: Zev Weiss <zev@bewilderbeest.net>
To: openbmc@lists.ozlabs.org,
	Joel Stanley <joel@jms.id.au>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc] pinctrl: ast2400: add support
 for TXD3/RXD3 pins
Date: Mon, 13 Dec 2021 11:47:03 -0800
Message-Id: <20211213194703.24060-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Zev Weiss <zev@bewilderbeest.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In order to support putting the u-boot console on UART3 of the
ast2400, this commit adds support for setting bits 22 and 23 of SCU80
to enable TXD3 and RXD3 on pins C14 and B14, respectively.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/pinctrl/aspeed/pinctrl_ast2400.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/aspeed/pinctrl_ast2400.c b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
index 7a6c2892f469..a8a5ff517108 100644
--- a/drivers/pinctrl/aspeed/pinctrl_ast2400.c
+++ b/drivers/pinctrl/aspeed/pinctrl_ast2400.c
@@ -125,6 +125,14 @@ static struct aspeed_sig_desc spi1_link[] = {
 	{ 0x70, BIT(12), 0},
 };
 
+static struct aspeed_sig_desc txd3_link[] = {
+	{ 0x80, BIT(22), 0},
+};
+
+static struct aspeed_sig_desc rxd3_link[] = {
+	{ 0x80, BIT(23), 0},
+};
+
 static const struct aspeed_group_config ast2400_groups[] = {
 	{ "MAC1LINK", 1, mac1_link },
 	{ "MAC2LINK", 1, mac2_link },
@@ -146,6 +154,8 @@ static const struct aspeed_group_config ast2400_groups[] = {
 	{ "SD1", 1, sdio1_link },
 	{ "SPI1", 1, spi1_link},
 	{ "SPI1CS1", 1, spi1cs1_link},
+	{ "TXD3", 1, txd3_link },
+	{ "RXD3", 1, rxd3_link },
 };
 
 static int ast2400_pinctrl_get_groups_count(struct udevice *dev)
-- 
2.34.1

