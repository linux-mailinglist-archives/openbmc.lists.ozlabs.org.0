Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE5E197245
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 03:54:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rFrV2PcVzDqYK
	for <lists+openbmc@lfdr.de>; Mon, 30 Mar 2020 12:54:34 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cmk0b7Ou; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rFnT6lLfzDqYq
 for <openbmc@lists.ozlabs.org>; Mon, 30 Mar 2020 12:51:57 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id u12so7927079pgb.10
 for <openbmc@lists.ozlabs.org>; Sun, 29 Mar 2020 18:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ko6YYqdciCHKWQVjR2jPOvKajtfGuYF4VUfbMLtyUcQ=;
 b=cmk0b7Ou2ibSvvCBUtrvKHPlV42IGiGKe+sV+lwy8URVut+Atg+8YgUcaboN9oOWT6
 L7Ep+5hAhu33dPEd6uAr+6QNB/1rzqD892T9L+fhefT6LN8VMbtN3mhQhj5Of/oujAsB
 WHLQv4ZFcb9UsnmRak9jfy5UiFIdPiDOeD8klIYUq6eVg7pbBLhErsB9562zcJGo6nwv
 g2ECk0rk3Wyv9JnhUEXvxQFb6mui6ykQTrnULXNqD6xIIKPstVpkdKwcOzhNIYqLhTTO
 fLtcgf4lAqDqJYHJYI92XD7cdUALqGnbHyFjJBmJvhDNcvC5+iz6fxy95NmQYA95e42V
 frQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ko6YYqdciCHKWQVjR2jPOvKajtfGuYF4VUfbMLtyUcQ=;
 b=pyWZDG/9k81AbZdcEUfGjzYJgIzno+Tx7V/vLUZWYsplxHA2Na7M8RG7E9A/WGdUYZ
 MldIj6Kt6gXXcvbQ7QAryX6ake8NQwo4Gdy3ZimJ0jAa8jWi6AtfX17vJNBqdxP7KGEF
 uSzpYZmYL7oargidhAra0Rk85TaPUrXYhUg1sw7nR9knITzX9VOGz2wYOmAii5kcDHLd
 xoTzQVAeVzdd5R3c6FVuS9Ul4A+lpgjE7dc3bmdnajsdHW1mvw55p769M355Z+p4w0Qs
 QVIru2X1R7+NuTyjkynEoxSCOU5kp6r1zjKfMZMgKQiWkCYZYFs8LdqhJ5bh59sUyCAi
 nf9Q==
X-Gm-Message-State: ANhLgQ37n6Z7I5BsVj1tabN+mFwRyzQix+cIL8t2/ZLKQqVM0Yds+JOX
 JrEdPFPE2NdRyMV6XdvvcB0=
X-Google-Smtp-Source: ADFU+vsnwgc+vxc9lajVw6rb3qmTJ2JcUtXjkGYgvqpHa+blhPnZ05FRDf/Ubi1PpBjlOplM5B0IEg==
X-Received: by 2002:a63:a746:: with SMTP id w6mr10835866pgo.76.1585533115288; 
 Sun, 29 Mar 2020 18:51:55 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
 by smtp.gmail.com with ESMTPSA id y17sm8897327pfl.104.2020.03.29.18.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:51:54 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
	openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.4 v2 2/2] fsi: aspeed: Support cabled FSI
Date: Mon, 30 Mar 2020 12:21:42 +1030
Message-Id: <20200330015142.132779-3-joel@jms.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330015142.132779-1-joel@jms.id.au>
References: <20200330015142.132779-1-joel@jms.id.au>
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

Some FSI development systems have internal FSI signals, and some have
external cabled FSI. Software can detect which machine this is by
reading a jumper GPIO, and also control which pins the signals are
routed to through a mux GPIO.

This attempts to find the GPIOs at probe time. If they are not present
in the device tree the driver will not error and continue as before.

The mux GPIO is owned by the FSI driver to ensure it is not modified at
runtime. The routing jumper obtained as non-exclusive to allow other
software to inspect it's state.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c | 47 +++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index f49742b310c2..374e158ccdc7 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -13,6 +13,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/iopoll.h>
+#include <linux/gpio/consumer.h>
 
 #include "fsi-master.h"
 
@@ -419,6 +420,46 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static int tacoma_cabled_fsi_fixup(struct device *dev)
+{
+	struct gpio_desc *routing_gpio, *mux_gpio;
+	int gpio;
+
+	/*
+	 * The routing GPIO is a jumper indicating we should mux for the
+	 * externally connected FSI cable.
+	 */
+	routing_gpio = devm_gpiod_get_optional(dev, "fsi-routing",
+			GPIOD_IN | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	if (IS_ERR(routing_gpio))
+		return PTR_ERR(routing_gpio);
+	if (!routing_gpio)
+		return 0;
+
+	mux_gpio = devm_gpiod_get_optional(dev, "fsi-mux", GPIOD_ASIS);
+	if (IS_ERR(mux_gpio))
+		return PTR_ERR(mux_gpio);
+	if (!mux_gpio)
+		return 0;
+
+	gpio = gpiod_get_value(routing_gpio);
+	if (gpio < 0)
+		return 0;
+
+	/* If the routing GPIO is high we should set the mux to low. */
+	if (gpio) {
+		gpiod_direction_output(mux_gpio, 0);
+		dev_info(dev, "FSI configured for external cable\n");
+	} else {
+		gpiod_direction_output(mux_gpio, 1);
+	}
+
+	devm_gpiod_put(dev, routing_gpio);
+
+	return 0;
+}
+
+
 static int fsi_master_aspeed_probe(struct platform_device *pdev)
 {
 	struct fsi_master_aspeed *aspeed;
@@ -426,6 +467,12 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
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

