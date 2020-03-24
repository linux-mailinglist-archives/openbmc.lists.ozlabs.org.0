Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BB7190C8D
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 12:33:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mpz21hX7zDqvV
	for <lists+openbmc@lfdr.de>; Tue, 24 Mar 2020 22:33:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LO1m2cf2; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mppS0nnkzDqp7
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 22:25:52 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id h8so8864419pgs.9
 for <openbmc@lists.ozlabs.org>; Tue, 24 Mar 2020 04:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ol/I46MgZTFZi1fcwEbXoK0Las05cL6UraxkrOkOba8=;
 b=LO1m2cf2gt6oM5oBt4EfeUV9eOMy9gQwfZoKFS62fbS5IEAbi7DsZhE3UK12SQ8iqP
 FVlqZk9E/vfHz7hrH6ddvva3pFGRW1hmGwx8aVxlO75oF3dA+ApfZoOUH9VOY3b96EDb
 IyAp7GyQd1HO7HfXu85E9NNvOd6gfSLV9egI04bdelYStQFsEmk/80pUeN/G0g/1p/7i
 es90w3rBiIC83VniYaLS8xTclNfbvysbPBtSxvX4khVWmNZPGQKvlAzhIz5ypbWKYgXY
 U06swOyUgXOzMyqtKUqeCGicHX/96GfXAY3ucjoim3p0J0N4R8oBFwACCV04Z9gIgtLS
 HiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ol/I46MgZTFZi1fcwEbXoK0Las05cL6UraxkrOkOba8=;
 b=NS6aD1dtrQbUyE6JVdgUGxhZZMBE+U1/cvn5jz47eJJOqKV/JE69eSkgnkEepTZL9i
 swlNnIRFGhHeJzlV+l7miTySCbC+0lBZwARCp3wOjV5CboUdwiSmhPOJnfHPYUmWJ4x3
 kea/LdtH0/2KXFvA8d5U6RCJ0b3x9lVnu8yBvErWkmrMDTz61i/Jd8Z1rZGNaDhiiF61
 E1BDimzyVsVjvl8/Gax7V0ha0tCPoD0mtNT8fhO3qcL6qqLEv1LPbP6XWnmNjc4/R+0Z
 Ta3OMSRAoyUes4dD98l3tWbTOMGkWoC5wUZ/FwTAC7j+2dIrdIjpdeV5D1py1Q+WBkBW
 YnoQ==
X-Gm-Message-State: ANhLgQ0DAUzHZ9C6kT/5rknUPnrWsE43YBpMgRVGDCqPqkLlGPLTyDEv
 2p4kBLTDIL8et1NVBq9LCNJ+HlN/nlU=
X-Google-Smtp-Source: ADFU+vswXCK+kkUUDbEeaqlonNcHU408iNdJZtebOnQI3kHwTQCykR8QZm66hwjyOyQ3DBEyJicaag==
X-Received: by 2002:a63:24c6:: with SMTP id
 k189mr26722627pgk.436.1585049148473; 
 Tue, 24 Mar 2020 04:25:48 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id v26sm2824004pfn.51.2020.03.24.04.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 04:25:48 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>, Andrew Geissler <geissonator@gmail.com>,
 openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 2/2] fsi: aspeed: Support cabled FSI
Date: Tue, 24 Mar 2020 21:55:29 +1030
Message-Id: <20200324112530.293386-3-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200324112530.293386-1-joel@jms.id.au>
References: <20200324112530.293386-1-joel@jms.id.au>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Some FSI development systems have internally routed FSI signals, and
some have external cabled FSI. Software can detect which machine this is
by reading a jumper GPIO, and also control which pins the signals are
routed to through a mux GPIO.

This attempts to find the GPIOs at probe time. If they are not present
in the device tree the driver will not error and continue as before.

The mux GPIO is owned by the FSI driver to ensure it is not modified at
runtime. The jumper is freed to allow other software to inspect it's
state.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 45 +++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f49742b310c2..3436805d590a 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
+#include <linux/gpio/consumer.h>
 
 #include "fsi-master.h"
 
@@ -419,6 +420,44 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static int tacoma_cabled_fsi_fixup(struct device *dev)
+{
+	struct gpio_desc *routing_gpio, *mux_gpio;
+	int gpio;
+
+	/*
+	 * The routing GPIO is a jumper indicating we should mux for the
+	 * externally routed FSI cable.
+	 */
+	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing", GPIOD_IN);
+	if (IS_ERR(routing_gpio))
+		return PTR_ERR(routing_gpio);
+	if (!routing_gpio)
+		return 0;
+
+	mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_IN);
+	if (IS_ERR(mux_gpio))
+		return PTR_ERR(mux_gpio);
+	if (!mux_gpio)
+		return 0;
+
+	gpio = gpiod_get_value(routing_gpio);
+	if (gpio < 0)
+		return 0;
+
+	/* If the routing GPIO is low we should set the mux to low. */
+	if (gpio == 0) {
+		gpiod_set_value(mux_gpio, 0);
+		dev_info(dev, "FSI configured for external cable\n");
+	}
+
+	/* Free the cabled mux GPIO for other users to sample */
+	devm_gpiod_put(dev, routing_gpio);
+
+	return 0;
+}
+
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -426,6 +465,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 	int rc, links, reg;
 	__be32 raw;
 
+	rc = tacoma_cabled_fsi_fixup(&pdev->dev);
+	if (rc) {
+		dev_err(&pdev->dev, "Tacoma FSI cable fixup failed\n");
+		return rc;
+	}
+
 	aspeed = devm_kzalloc(&pdev->dev, sizeof(*aspeed), GFP_KERNEL);
 	if (!aspeed)
 		return -ENOMEM;
-- 
2.25.1

