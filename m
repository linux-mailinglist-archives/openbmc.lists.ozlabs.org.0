Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1C377900
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 15:43:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wnGj3mfhzDqK5
	for <lists+openbmc@lfdr.de>; Sat, 27 Jul 2019 23:43:41 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (mailfrom)
 smtp.mailfrom=flex--osk.bounces.google.com (client-ip=2607:f8b0:4864:20::84a;
 helo=mail-qt1-x84a.google.com;
 envelope-from=31vq8xqmkb2amqiemmejc.amkmncl9kajgqrq.mxj89q.mpe@flex--osk.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="cPxvUeg2"; 
 dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wnFs4MGjzDq75
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jul 2019 23:42:48 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id s9so50219411qtn.14
 for <openbmc@lists.ozlabs.org>; Sat, 27 Jul 2019 06:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=ymvuXtYVyAeoSM229fRKSMujJvzD8jiyBkagF0beL30=;
 b=cPxvUeg2rmbb+ciZPrlIW3cqjM8M7aek4RnGcN+7TCE77K3iOFeVsuf8d1fW3Mx+kQ
 Bz+if+U7MBxI1QhIn2Dvc+tIl3uFAtBG5jerBjksYBTRBnSmNZHhx1iY9PmsClQPikk0
 k56+NgHPQEVPidzO0tYghcUTedctvgo8WB11ZgXXGoJiuiynAGjzA70/inV4xLcuykUI
 XOCqgk7xxZj01ow5ve3wPfA90lGrwWLJMALru/U+I6h/OyPQrD6oD+ItgriLUjBChYk0
 tWSER6dgrExS8mM95QoarmPrsTddK95bP9FR2xolsddZXs4fnWQJBxwLHDu4KyfaSXf0
 e7sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=ymvuXtYVyAeoSM229fRKSMujJvzD8jiyBkagF0beL30=;
 b=ia4cZEDVLYLZbQfaYFzkvu9ehRTbwtYlgeYBxr7bvEJXlncOjKjnownoS4i/9mcABy
 xOibBjZ7JMBwqaaF6zI+UZFV/0mXiC5uGJHVW/tKZXc58Y3PSulDmMNIqCmkNuulZJB7
 wgEWZttmtiKTcxHT+J7qtUVrCsJ6KyFe6xA8Hzc9grW2JWEkEqMfHW+4rTC0N/IpWcJC
 56uR/WFGoQcyBucX9/iGG+z2wfkUzyRvCZiwb0KomVRImzkH5lVEtu3C2FwzXKvZuUNL
 B6CcFBMhyy+ad6Pa6fds9xZ1yKPiDhyWox13nAw6BkQucHw1wVTe/+jKqH4VkZ5tqiCS
 fCdw==
X-Gm-Message-State: APjAAAXXi7HNaMox6qlfaAlTlPZD/kBZGK+aLrJ/ojSUpte75vu4z5I2
 QkV9leK9PeT6a9oU1Ivio8hl/u8=
X-Google-Smtp-Source: APXvYqyw0cYe/eB+h5vbkCOW06axIGup1wJt8vcrMsbtvu3UyeJ3ZXAKUlCvBgZY7al58EDTHoE2ScI=
X-Received: by 2002:a37:b381:: with SMTP id
 c123mr68205028qkf.349.1564234965253; 
 Sat, 27 Jul 2019 06:42:45 -0700 (PDT)
Date: Sat, 27 Jul 2019 09:42:42 -0400
Message-Id: <20190727134242.49847-1-osk@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
Subject: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
From: Oskar Senft <osk@google.com>
To: joel@jms.id.au, andrew@aj.id.au
Content-Type: text/plain; charset="UTF-8"
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
Cc: openbmc@lists.ozlabs.org, Oskar Senft <osk@google.com>,
 linux-aspeed@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Make the SIRQ polarity for Aspeed 24xx/25xx VUART configurable via
sysfs. It is required on some host platforms (e.g. TYAN S7106) to
reconfigure this setting from the default to enable the host to receive
interrupts from the VUART.

The setting is configurable via sysfs rather than device-tree to stay in
line with other related configurable settings.

Tested: Verified on TYAN S7106 mainboard.
Signed-off-by: Oskar Senft <osk@google.com>
---
 .../ABI/stable/sysfs-driver-aspeed-vuart      | 10 ++++-
 drivers/tty/serial/8250/8250_aspeed_vuart.c   | 39 +++++++++++++++++++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
index 8062953ce77b..64fad87ad964 100644
--- a/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
+++ b/Documentation/ABI/stable/sysfs-driver-aspeed-vuart
@@ -6,10 +6,18 @@ Description:	Configures which IO port the host side of the UART
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
 
-What:		/sys/bus/platform/drivers/aspeed-vuart*/sirq
+What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq
 Date:		April 2017
 Contact:	Jeremy Kerr <jk@ozlabs.org>
 Description:	Configures which interrupt number the host side of
 		the UART will appear on the host <-> BMC LPC bus.
 Users:		OpenBMC.  Proposed changes should be mailed to
 		openbmc@lists.ozlabs.org
+
+What:		/sys/bus/platform/drivers/aspeed-vuart/*/sirq_polarity
+Date:		July 2019
+Contact:	Oskar Senft <osk@google.com>
+Description:	Configures the polarity of the serial interrupt to the
+		host via the BMC LPC bus.
+Users:		OpenBMC.  Proposed changes should be mailed to
+		openbmc@lists.ozlabs.org
diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 0438d9a905ce..ef0a6ff69841 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -22,6 +22,7 @@
 
 #define ASPEED_VUART_GCRA		0x20
 #define ASPEED_VUART_GCRA_VUART_EN		BIT(0)
+#define ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY	BIT(1)
 #define ASPEED_VUART_GCRA_DISABLE_HOST_TX_DISCARD BIT(5)
 #define ASPEED_VUART_GCRB		0x24
 #define ASPEED_VUART_GCRB_HOST_SIRQ_MASK	GENMASK(7, 4)
@@ -131,8 +132,46 @@ static ssize_t sirq_store(struct device *dev, struct device_attribute *attr,
 
 static DEVICE_ATTR_RW(sirq);
 
+static ssize_t sirq_polarity_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	u8 reg;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	reg &= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+
+	return snprintf(buf, PAGE_SIZE - 1, "%u\n", reg ? 1 : 0);
+}
+
+static ssize_t sirq_polarity_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	struct aspeed_vuart *vuart = dev_get_drvdata(dev);
+	unsigned long val;
+	int err;
+	u8 reg;
+
+	err = kstrtoul(buf, 0, &val);
+	if (err)
+		return err;
+
+	reg = readb(vuart->regs + ASPEED_VUART_GCRA);
+	if (val != 0)
+		reg |= ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+	else
+		reg &= ~ASPEED_VUART_GCRA_HOST_SIRQ_POLARITY;
+	writeb(reg, vuart->regs + ASPEED_VUART_GCRA);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(sirq_polarity);
+
 static struct attribute *aspeed_vuart_attrs[] = {
 	&dev_attr_sirq.attr,
+	&dev_attr_sirq_polarity.attr,
 	&dev_attr_lpc_address.attr,
 	NULL,
 };
-- 
2.22.0.709.g102302147b-goog

