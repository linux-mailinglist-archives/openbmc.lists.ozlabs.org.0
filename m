Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D603445AC09
	for <lists+openbmc@lfdr.de>; Tue, 23 Nov 2021 20:09:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzDGX5QYqz2ywt
	for <lists+openbmc@lfdr.de>; Wed, 24 Nov 2021 06:09:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=HBqF5qWJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=HBqF5qWJ; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzDG51Q46z2ymc
 for <openbmc@lists.ozlabs.org>; Wed, 24 Nov 2021 06:09:16 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6E5BB43C92;
 Tue, 23 Nov 2021 19:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1637694552; x=
 1639508953; bh=7Yk7oVLcmbcE2sDaCkU8CW/PVHH7ldqQhThXLNIgTf8=; b=H
 BqF5qWJ4XPlOoSFUODom3TgNnhE8jAV6y2/1CosXyGyTcALRfj/pJOrU/BniqLQ6
 T6LeuUISFWsd7jpcllUhcqpr2BKCSQSnhnWhIa7nDaohtvpHG9d2y51o9miiBlmF
 bvP7+GX5/xjRO6CDsK2MtAA3BV1HWJ1qndPnmWyROE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7T4wlw0JXNv; Tue, 23 Nov 2021 22:09:12 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B8F6F41493;
 Tue, 23 Nov 2021 22:09:11 +0300 (MSK)
Received: from nb-511.yadro.com (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 23
 Nov 2021 22:09:10 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <u-boot@lists.denx.de>, <openbmc@lists.ozlabs.org>, <joel@jms.id.au>
Subject: [PATCH] board: ast2500/ast2600: initialize LEDs
Date: Tue, 23 Nov 2021 22:08:47 +0300
Message-ID: <20211123190847.14943-1-a.kartashev@yadro.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.10.105]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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

Add option to initialize LEDs in board_init stage for aspeed-based
boards.

Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
---
 board/aspeed/evb_ast2500/evb_ast2500.c | 8 ++++++++
 board/aspeed/evb_ast2600/evb_ast2600.c | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/board/aspeed/evb_ast2500/evb_ast2500.c b/board/aspeed/evb_ast2500/evb_ast2500.c
index ed162c4095..9612513bfc 100644
--- a/board/aspeed/evb_ast2500/evb_ast2500.c
+++ b/board/aspeed/evb_ast2500/evb_ast2500.c
@@ -3,3 +3,11 @@
  * Copyright (c) 2016 Google, Inc
  */
 #include <common.h>
+
+int board_init(void)
+{
+	if (IS_ENABLED(CONFIG_LED))
+		led_default_state();
+
+	return 0;
+}
diff --git a/board/aspeed/evb_ast2600/evb_ast2600.c b/board/aspeed/evb_ast2600/evb_ast2600.c
index e6dc8c7952..9041798896 100644
--- a/board/aspeed/evb_ast2600/evb_ast2600.c
+++ b/board/aspeed/evb_ast2600/evb_ast2600.c
@@ -3,3 +3,11 @@
  * Copyright (c) Aspeed Technology Inc.
  */
 #include <common.h>
+
+int board_init(void)
+{
+	if (IS_ENABLED(CONFIG_LED))
+		led_default_state();
+
+	return 0;
+}
-- 
2.32.0

