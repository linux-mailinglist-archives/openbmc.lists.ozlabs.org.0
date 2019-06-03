Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AF32830
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 07:57:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HPV849BxzDqPT
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2019 15:57:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QrWERqpJ"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HPTk54ndzDqC9
 for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2019 15:57:30 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id n2so7615411pgp.11
 for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2019 22:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TqWxIIMl2imKkIUaU9tYJuWTnBc7/KebMofBHf5Rw3k=;
 b=QrWERqpJMnPE+sMO7GO2F1rmwUzkTzfzK2/YhRc90RQlw50qZ5q7N5xzBJrzqn4F5w
 xT8cAJuTkGJ4hjGvEbY/NhFZHhPrY0KPcIJw5VqxVmXT3s6+BoB2pu1/uSs5R/nweN6W
 LyiHDcihtXTlC0Yxs8kTveZ4cvC6foT/FCpIeaWeagdBBT0XPZ9MBFt0dStUUMFoDzzM
 rVnhdlNDBPajyOYqEXroaPvCdziXKG7nJcmZoeyfYYAylboqhtePvk4wLY62gr1+M5N/
 OzJBNV3dZl3noKDbFXCiifjgt9YACIwoh1xzuGwPSj9CcmsixGFEmtXnXZrtXllJg5nC
 OG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TqWxIIMl2imKkIUaU9tYJuWTnBc7/KebMofBHf5Rw3k=;
 b=dejH69E+xR77hPgqWCahKd1cAK9nz16g9BrP75pDA+6xUPPWB7tqIUqkadVp5mA9aQ
 I+jydmrTrDbRYq3zLjPKyVl6R/n1z5LQyhmrQw7aNo8Zq8b6B6vQZNWvs3b2i+vVC1fZ
 A0ExllvY6xjIr4Eda4cnBNOo7etENK7GsqHqgVBY76cIXSXVQi9FTMHTW1RAIa4Y5aRA
 PzetDgv3jghQf19fGw2u5YjVObWyornI89N7PYSUrLnAEn8yqVrNQ1RMb+G9hkaJtkQm
 SEPaN8jombwQbnvcnlq4VJHUDEd16f3t4BreeEUr7/yNhKPINDiqHyfYnPi+rbq6qyuJ
 m+4Q==
X-Gm-Message-State: APjAAAV4t9p803k1DfqakpdpcPJ8+6AJmD+Lx8CklzYDsXXXB8KSs0CC
 fxeKFU9ZXTKGxBjz4WLymEM=
X-Google-Smtp-Source: APXvYqzTw1ecjQ7ICNu+PMgPyRYmmPKDBy/eOh3AH8ZvW7mg8I58HTUd2/84AatDqozaS8cP+QtHcw==
X-Received: by 2002:a63:7e43:: with SMTP id o3mr1173687pgn.450.1559541446803; 
 Sun, 02 Jun 2019 22:57:26 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n7sm4320211pgi.54.2019.06.02.22.57.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Jun 2019 22:57:26 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: fsi: Create busses for all ports
Date: Mon,  3 Jun 2019 15:57:14 +1000
Message-Id: <20190603055714.7203-1-oohall@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: openbmc@lists.ozlabs.org, Eddie James <eajames@linux.vnet.ibm.com>
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
 drivers/i2c/busses/i2c-fsi.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
index 1e2be2219a60..59a76c6e31ad 100644
--- a/drivers/i2c/busses/i2c-fsi.c
+++ b/drivers/i2c/busses/i2c-fsi.c
@@ -658,13 +658,27 @@ static const struct i2c_algorithm fsi_i2c_algorithm = {
 	.functionality = fsi_i2c_functionality,
 };
 
+static device_node *fsi_i2c_find_port_of_node(struct device_node *master,
+					      int port)
+{
+	struct device_node *np;
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
@@ -678,10 +692,16 @@ static int fsi_i2c_probe(struct device *dev)
 	if (rc)
 		return rc;
 
-	/* Add adapter for each i2c port of the master. */
-	for_each_available_child_of_node(dev->of_node, np) {
-		rc = of_property_read_u32(np, "reg", &port_no);
-		if (rc || port_no > USHRT_MAX)
+	rc = fsi_i2c_read_reg(i2c->fsi, I2C_FSI_STAT, &state);
+	if (rc)
+		return rc;
+
+	ports = FIELD_GET(I2C_STAT_MAX_PORT, stat);
+	dev_dbg(dev, "I2C master has %d ports\n", ports);
+
+	for (port_no = 0; port_no < ports; port_no++) {
+		np = fsi_i2c_find_port_of_node(dev.of_node, port_no);
+		if (np && !of_device_is_available(np))
 			continue;
 
 		port = kzalloc(sizeof(*port), GFP_KERNEL);
-- 
2.20.1

