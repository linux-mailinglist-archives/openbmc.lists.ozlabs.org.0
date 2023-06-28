Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C12740BCC
	for <lists+openbmc@lfdr.de>; Wed, 28 Jun 2023 10:44:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Y9TP19DN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrZr25Hmkz30GX
	for <lists+openbmc@lfdr.de>; Wed, 28 Jun 2023 18:44:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=Y9TP19DN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=2605:2700:0:5::4713:9cab; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 328 seconds by postgrey-1.37 at boromir; Wed, 28 Jun 2023 18:43:28 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QrZqN5NnVz30K8;
	Wed, 28 Jun 2023 18:43:28 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 44A4B31E;
	Wed, 28 Jun 2023 01:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1687941472;
	bh=rOzvsgROD/f26mzOAzvMUcVNNF4sR/rHxdezjOWfqto=;
	h=From:To:Cc:Subject:Date:From;
	b=Y9TP19DNIpS58C1xU+PXyja7lpGsJHv/rWufUqAu1Dy5pWUE0Cx8FhMUMIb9uM9z4
	 gG3VdzvIgNFNW053bC2RVxS3b5BpZM9aAhA1W+f0ovQ7M2UB4O/Tw0uRl97/5Y9CMb
	 s2xjM0PkvW+JSP4XxtYyKQgSHq2PHFjQ5kQ7lkYg=
From: Zev Weiss <zev@bewilderbeest.net>
To: Andrew Jeffery <andrew@aj.id.au>,
	Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org
Subject: [PATCH] soc: aspeed: uart-routing: Use __sysfs_match_string
Date: Wed, 28 Jun 2023 01:37:36 -0700
Message-ID: <20230628083735.19946-2-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.41.0
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
Cc: Zev Weiss <zev@bewilderbeest.net>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Oskar Senft <osk@google.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The existing use of match_string() caused it to reject 'echo foo' due
to the implicitly appended newline, which was somewhat ergonomically
awkward and inconsistent with typical sysfs behavior.  Using the
__sysfs_* variant instead provides more convenient and consistent
linefeed-agnostic behavior.

Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
---
 drivers/soc/aspeed/aspeed-uart-routing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-uart-routing.c b/drivers/soc/aspeed/aspeed-uart-routing.c
index ef8b24fd1851..59123e1f27ac 100644
--- a/drivers/soc/aspeed/aspeed-uart-routing.c
+++ b/drivers/soc/aspeed/aspeed-uart-routing.c
@@ -524,7 +524,7 @@ static ssize_t aspeed_uart_routing_store(struct device *dev,
 	struct aspeed_uart_routing_selector *sel = to_routing_selector(attr);
 	int val;
 
-	val = match_string(sel->options, -1, buf);
+	val = __sysfs_match_string(sel->options, -1, buf);
 	if (val < 0) {
 		dev_err(dev, "invalid value \"%s\"\n", buf);
 		return -EINVAL;
-- 
2.40.0.5.gf6e3b97ba6d2.dirty

