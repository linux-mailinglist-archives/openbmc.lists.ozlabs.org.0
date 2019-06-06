Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C46C37379
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 13:53:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KPDn2qB1zDqdw
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2019 21:53:13 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jfHAGPy/"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KPDB4PNHzDqZm
 for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2019 21:52:42 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id c5so822762pll.11
 for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2019 04:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blH/ADtjzK9YsJSTsS01CxxSyUBPkBx6oUfeUl/QPQc=;
 b=jfHAGPy/xgbVnb2fL5ba+FB6dY6KjRLp5L69Ylblsc8MtRtd0GXcVGm3oOqPN2vZJT
 uUdugxOa0MSi/rBAQAaXbIkntRdj0ZoR9e3dyGZxfnnKh3JDaDtgDQGMwZslHX2sYkoD
 wiBEx0b316YXKK6gXHwk5YD/jCH4MtVmx4G2WeMcdk3zyOLCzkCirpzQz5KpuKwd/zeC
 Og7V/fc9hY73h7EQ22rYvn01hEOFSLD4HjbORQrUK9W6XsfP1WxWkOSieKE4Id6v0z7R
 xPm1sIimTiHGqfc1agRU+2cHa4rvm0zI5qO5fqHdhdO30eLZtJ/OZMP86AtR2XhskfOl
 uQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=blH/ADtjzK9YsJSTsS01CxxSyUBPkBx6oUfeUl/QPQc=;
 b=pM1kNwI7ME7RP2W762mi7Gf8MeKF/DFfeG+5zUYGlQc8Vcpg7Ifdjf69rUoW9Rwt1R
 hoduQgL13EfY1Yk+whztg/kGwIEXPSvkHKHbwOqcXYEKlxZ3oBM2voDWJ2aK/IiWhrAi
 JBWkxGSNeZQ7/67nysp5DoJYzS1cFgPe3AbYX1yi0E2r7ZsA5s0qK8MadDFSJd2+yW2w
 Zsyi9l0/A+bsJSco0VLp+VIDUxFbKkcpXVdYIWU6j2Hx27kegqRoL0vzxnEqrWcGdEh8
 U158ygyjhAvGEC/xqMrRh0eaTIcXWt3rPxnTvxJhQTmLjhT+3Rb/o29u3SOzBZ0YPzSx
 sgOQ==
X-Gm-Message-State: APjAAAVUrKo6L85ifMM3TZfEwRVGWDZoAnSjhEUiqxddReabYvuSqQ5d
 bNcSw0ebn+e0fnuDd59FgaDZQGdB
X-Google-Smtp-Source: APXvYqykYMhmOhk7r5PxJ427J0KH7jiTrLQ0MHpt52OthS8P+XWhVXxwCzGgKFZHWcfW74eUUAmOAw==
X-Received: by 2002:a17:902:2aa8:: with SMTP id
 j37mr9979051plb.316.1559821958629; 
 Thu, 06 Jun 2019 04:52:38 -0700 (PDT)
Received: from 192-168-1-2.tpgi.com.au (14-200-200-125.tpgi.com.au.
 [14.200.200.125])
 by smtp.gmail.com with ESMTPSA id c142sm3878241pfb.171.2019.06.06.04.52.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Jun 2019 04:52:37 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH v2] i2c: fsi: Create busses for all ports
Date: Thu,  6 Jun 2019 21:52:20 +1000
Message-Id: <20190606115220.9888-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
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
Cc: Eddie James <eajames@linux.vnet.ibm.com>, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently we only create an I2C bus for the ports listed in the
device-tree for that master. There's no real reason for this since
we can discover the number of ports the master supports by looking
at the port_max field of the status register.

This patch re-works the bus add logic so that we always create buses
for each port, unless the bus is marked as unavailable in the DT. This
is useful since it ensures that all the buses provided by the CFAM I2C
master are accessible to debug tools.

Cc: Eddie James <eajames@linux.vnet.ibm.com>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
v2: Fixed off-by-one when calulating the number of ports.
    Compile fixes.
---
 drivers/i2c/busses/i2c-fsi.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..da5eb3960def 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -658,13 +658,29 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
 	.functionality = fsi_i2c_functionality,
 };
 
+static struct device_node *fsi_i2c_find_port_of_node(struct device_node *fsi,
+						     int port)
+{
+	struct device_node *np;
+	u32 port_no;
+	int rc;
+
+	for_each_child_of_node(fsi, np) {
+		rc = of_property_read_u32(np, "reg", &port_no);
+		if (!rc && port_no == port)
+			return np;
+	}
+
+	return NULL;
+}
+
 static int fsi_i2c_probe(struct device *dev)
 {
 	struct fsi_i2c_master *i2c;
 	struct fsi_i2c_port *port;
 	struct device_node *np;
+	u32 port_no, ports, stat;
 	int rc;
-	u32 port_no;
 
 	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
@@ -678,10 +694,16 @@ static int fsi_i2c_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	/* Add adapter for each i2c port of the master. */
-	for_each_available_child_of_node(dev->of_node, np) {
-		rc = of_property_read_u32(np, "reg", &port_no);
-		if (rc || port_no > USHRT_MAX)
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &stat);
+	if (rc)
+		return rc;
+
+	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat) + 1;
+	dev_dbg(dev, "I2C master has %d ports\n", ports);
+
+	for (port_no = 0; port_no < ports; port_no++) {
+		np = fsi_i2c_find_port_of_node(dev->of_node, port_no);
+		if (np && !of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.21.0

