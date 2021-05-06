Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAF375C79
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 22:55:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbm6y1kPQz30DW
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 06:55:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=UqSiwV1T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171;
 helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net
 header.a=rsa-sha256 header.s=thorn header.b=UqSiwV1T; 
 dkim-atps=neutral
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net
 [71.19.156.171])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbm6b5MpWz2yj1;
 Fri,  7 May 2021 06:54:46 +1000 (AEST)
Received: from hatter.bewilderbeest.net (unknown [IPv6:2600:6c44:7f:ba20::7c6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: zev)
 by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 0ADC7475;
 Thu,  6 May 2021 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
 s=thorn; t=1620334482;
 bh=vNoReDMKLGxtVQ/HUO76L61RXlajosDXB81QNCQh3t4=;
 h=From:To:Cc:Subject:Date:From;
 b=UqSiwV1TYfmc9tMThAqiUf57dvCOYSLJQ72d9rXD293X2le3KSui72Bi7EaXgth+F
 SZ3XSRkNJD1pRIK+AEvFsuLzpDYNjYAnAYEXHbh12wL+eLVM/m8BzDMiJetd+iLt/k
 HtvwZnY/7/g/PsZBOupIujs+EK+8ymakCOnzKruE=
From: Zev Weiss <zev@bewilderbeest.net>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: [PATCH v2] i2c: aspeed: disable additional device addresses on
 ast2[56]xx
Date: Thu,  6 May 2021 15:54:19 -0500
Message-Id: <20210506205419.26294-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.31.1
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
Cc: linux-aspeed@lists.ozlabs.org, Zev Weiss <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The ast25xx and ast26xx have, respectively, two and three configurable
slave device addresses to the ast24xx's one.  We only support using
one at a time, but the others may come up in an indeterminate state
depending on hardware/bootloader behavior, so we need to make sure we
disable them so as to avoid ending up with phantom devices on the bus.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---

Changes since v1 [0]:
 - reduced to simplified approach suggested by Joel

[0] https://lore.kernel.org/linux-arm-kernel/20200915184525.29665-1-zev@bewilderbeest.net/

 drivers/i2c/busses/i2c-aspeed.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 724bf30600d6..67e8b97c0c95 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -727,10 +727,14 @@ static void __aspeed_i2c_reg_slave(struct aspeed_i2c_bus *bus, u16 slave_addr)
 {
 	u32 addr_reg_val, func_ctrl_reg_val;
 
-	/* Set slave addr. */
-	addr_reg_val = readl(bus->base + ASPEED_I2C_DEV_ADDR_REG);
-	addr_reg_val &= ~ASPEED_I2CD_DEV_ADDR_MASK;
-	addr_reg_val |= slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
+	/*
+	 * Set slave addr.  Reserved bits can all safely be written with zeros
+	 * on all of ast2[456]00, so zero everything else to ensure we only
+	 * enable a single slave address (ast2500 has two, ast2600 has three,
+	 * the enable bits for which are also in this register) so that we don't
+	 * end up with additional phantom devices responding on the bus.
+	 */
+	addr_reg_val = slave_addr & ASPEED_I2CD_DEV_ADDR_MASK;
 	writel(addr_reg_val, bus->base + ASPEED_I2C_DEV_ADDR_REG);
 
 	/* Turn on slave mode. */
-- 
2.31.1

