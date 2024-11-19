Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6576F9D300E
	for <lists+openbmc@lfdr.de>; Tue, 19 Nov 2024 22:32:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtHkt3vThz3c7R
	for <lists+openbmc@lfdr.de>; Wed, 20 Nov 2024 08:32:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=80.12.242.27
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732051922;
	cv=none; b=Flwy0RDDc+7k4iPaqFI69S2fbj8lMjin/6NiqH285UZpJ15QbJbhjCeBEKAPbmJKq0ivS2p7410dYHL3t+VMzOjEvHG1nwmvfjm+f6it8q24vrI9bVhQJSGlUNsUUIJyLy4X0ndJH0H8GAXJNCrusNERKXpGQVQTK3mjEDsD2RMuIDXrUyAIojYuxsnX1O+SiGzeSobX0v2fbal7ilI5hNyt3vpKxICLcdiF9Pomo+Cnsl/54nhtw2rQPo9zb8RfhhH8i7+qB5xcRpdiMNz+Zwod+VyyfH0HewuMQK/x34/tIJMDLZigLZ34hSxUY4eyGmdhacAQf0NvivEGQSnDgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732051922; c=relaxed/relaxed;
	bh=EjYh1cknlZ7PMy6sRG187xTDVC5FFJcX/Odw6mzP5bM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ntv5iQ/WmBYrUhKfcYAYy6Z3xpRggPr3rBwDTVUhFA+dhppDvin2YTlKMZdnUMIPDu+5SN+ZMOcZveQHqbeGTmPdlH6XyYTb/YtMUknG+gOXI+WgXSTW/39jInLq8Gf8/Eqm+QBP6KYfAXEecDMSpPqKAyHCQiapLU+8MjgYMa1TTRQck8ub5AM5/PgrzlYDN2vzT4GaMrhmbRLeeFQOZpRpuddTpRBCnEmcNyUd1vHVSSZ855uEqa8Z0qcRkqJRFykM0jkF5A7ZurTWQtyKvm6ehsY3noOD9KLAiHofomz5UMulKgFdcqcsKVFApg9XyCgTDi2AC/qXUoGbDHePzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=fs6XKAXK; dkim-atps=neutral; spf=pass (client-ip=80.12.242.27; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org) smtp.mailfrom=wanadoo.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=fs6XKAXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.27; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=lists.ozlabs.org)
Received: from smtp.smtpout.orange.fr (smtp-27.smtpout.orange.fr [80.12.242.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtHkl5nHpz2xrC
	for <openbmc@lists.ozlabs.org>; Wed, 20 Nov 2024 08:31:56 +1100 (AEDT)
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id DVo0tZBgMlMRCDVo0teyUl; Tue, 19 Nov 2024 22:30:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1732051849;
	bh=EjYh1cknlZ7PMy6sRG187xTDVC5FFJcX/Odw6mzP5bM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=fs6XKAXKEa7OiGdYVIxWxoX52NB9X9sFNwHavWtknoVS7Z1y0i9KjA7T5Hcz2N04G
	 oGU7ylyi7JaqkPL4uNOf8Qk/bK7w/mBi0klb3GdO73sCvx76Qx4AGs7GAZjXMWs0N3
	 uX/cFd2bZHVehren5fcaR5tkVEH+EmLU1QCfrLU9crfmdQO+ck55e3SvNxfM1ycuM3
	 0dZbgx1nxMHEae/5hr54Un7Ta4Y1f49V21pB9poCOHlOuJMQ2pHfL21MvriwpNQM+w
	 eWKSG3bJhYwZT1m1VrxKdg4OqVRgIQpGTtElsaT46/a3uXEqkcMPWrNN1N57pXeVyT
	 QqRSxYCfY4y1g==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 19 Nov 2024 22:30:49 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mark Brown <broonie@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH] spi: aspeed: Fix an error handling path in aspeed_spi_[read|write]_user()
Date: Tue, 19 Nov 2024 22:30:29 +0100
Message-ID: <4052aa2f9a9ea342fa6af83fa991b55ce5d5819e.1732051814.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

A aspeed_spi_start_user() is not balanced by a corresponding
aspeed_spi_stop_user().
Add the missing call.

Fixes: e3228ed92893 ("spi: spi-mem: Convert Aspeed SMC driver to spi-mem")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.


This patch is completely speculative, review with care!

It is only based on naming where a _start() function if not followed by a
_stop() in some paths but is in other paths.
---
 drivers/spi/spi-aspeed-smc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index 8eb843ddb25f..e9beae95dded 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -239,7 +239,7 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
 
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, offset, op->cmd.opcode);
 	if (ret < 0)
-		return ret;
+		goto stop_user;
 
 	if (op->dummy.buswidth && op->dummy.nbytes) {
 		for (i = 0; i < op->dummy.nbytes / op->dummy.buswidth; i++)
@@ -249,8 +249,9 @@ static ssize_t aspeed_spi_read_user(struct aspeed_spi_chip *chip,
 	aspeed_spi_set_io_mode(chip, io_mode);
 
 	aspeed_spi_read_from_ahb(buf, chip->ahb_base, len);
+stop_user:
 	aspeed_spi_stop_user(chip);
-	return 0;
+	return ret;
 }
 
 static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
@@ -261,10 +262,11 @@ static ssize_t aspeed_spi_write_user(struct aspeed_spi_chip *chip,
 	aspeed_spi_start_user(chip);
 	ret = aspeed_spi_send_cmd_addr(chip, op->addr.nbytes, op->addr.val, op->cmd.opcode);
 	if (ret < 0)
-		return ret;
+		goto stop_user;
 	aspeed_spi_write_to_ahb(chip->ahb_base, op->data.buf.out, op->data.nbytes);
+stop_user:
 	aspeed_spi_stop_user(chip);
-	return 0;
+	return ret;
 }
 
 /* support for 1-1-1, 1-1-2 or 1-1-4 */
-- 
2.47.0

