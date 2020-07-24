Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F275322BC03
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 04:34:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCYDh2F18zDrDr
	for <lists+openbmc@lfdr.de>; Fri, 24 Jul 2020 12:34:12 +1000 (AEST)
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
 header.s=20161025 header.b=TGSIQovg; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCY9D3qqTzDrgF
 for <openbmc@lists.ozlabs.org>; Fri, 24 Jul 2020 12:31:12 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id j19so4367406pgm.11
 for <openbmc@lists.ozlabs.org>; Thu, 23 Jul 2020 19:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgt1XMNUkp84RfxFGzAvZiXnEiWrl3ucf8rg7LDxYkQ=;
 b=TGSIQovg3/FXYiB85FvN2iAdH4f6gpK5p/Ak7SzlF00DBGDPDLClw6Qk3JxZyAfZkb
 18gT+zi2QXwHXhIc7exeL1p655YdgEIHk7rqA3vo4iIp+ln03P1Mkd49ZmbcOFzTkN6o
 /skzecJyfip6eMklw4XRinWmeZCWdCUwaO6rIiLECpLLsXlmYzKv4xF6rUjPMKFE9fMS
 j1n2xr/5TyWw5D21bpuV7Xdt5BSln09uhK+7o3WWW18C+n9bgK9Td9/S00LF+J89ZUHN
 noCxlVGW8GecspjFom2e9qOwgaetURAkYJ3sYSGFF5zngYiEzWE5SrE9BuPOvUKY+/3P
 vMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tgt1XMNUkp84RfxFGzAvZiXnEiWrl3ucf8rg7LDxYkQ=;
 b=Pb0pdIdgKxxg8A87r23kGa4tFlY6AbiRkj5UoZjUsHHUrnAIHrZEVRunAtRVtNSqhO
 dQlQawlXw5pGblEcIaK1byEjcU7i2kUuq7hl9zKXSZQzHxygcFuRMTp+zSbuxMQ0nVEo
 xJokN8kzRJP8AyfqmfPeWFOS4eCmDm05I7qVUaCKBVv9s4mljti9Bz8kQpQeifTN22vm
 HcgA5UA1WJ3fxSMVapaCAARWdezIpHGtoLpgLpoZdMnHWeHNSfhuHxxihqFroeM+tpBO
 Urx/nqEU9Vud+wrSDeh8uGMwn5NRZhnoRx5FbHZLkT1iw/RCmWYeB88ImZcwBrqaGmfA
 0WmA==
X-Gm-Message-State: AOAM531lyrYFjFFHO5ExzVJeZ4bj7gLZrwgGjTNfzt70stiqdqcZnexG
 ZDaBtqK+4qpZISmy9thy38phi5Hc2d8=
X-Google-Smtp-Source: ABdhPJzfhvWRir1hLWtsFCubvmhmYuZKPre2bGG7jO3vwfKFnKVOZxU3PB3gDx19A5qZ6HgtazScNg==
X-Received: by 2002:a63:380d:: with SMTP id f13mr6588498pga.16.1595557869190; 
 Thu, 23 Jul 2020 19:31:09 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id w9sm3880239pfq.178.2020.07.23.19.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 19:31:07 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH linux dev-5.4 1/3] fsi: aspeed: Support CFAM reset GPIO
Date: Fri, 24 Jul 2020 12:00:34 +0930
Message-Id: <20200724023036.354310-2-joel@jms.id.au>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724023036.354310-1-joel@jms.id.au>
References: <20200724023036.354310-1-joel@jms.id.au>
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

Systems have a line for restting the remote CFAM. This is not part of
the FSI master, but is associated with it, so it makes sense to include
it in the master driver.

This exposes a sysfs interface to reset the cfam, abstracting away the
direction and polarity of the GPIO, as well as the timing of the reset
pulse. Userspace will be blocked until the reset pulse is finished.

The reset is hard coded to be in the range of (900, 1000) us. It was
observed with a scope to regularly be just over 1ms.

If the device tree property is not preset the driver will silently
continue.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Releasing the reset should set it to 0
---
 drivers/fsi/fsi-master-aspeed.c | 43 +++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index b44f71f1f0a8..ef21362095f8 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -22,6 +22,7 @@ struct fsi_master_aspeed {
 	struct device		*dev;
 	void __iomem		*base;
 	struct clk		*clk;
+	struct gpio_desc	*cfam_reset_gpio;
 };
 
 #define to_fsi_master_aspeed(m) \
@@ -429,6 +430,43 @@ static int aspeed_master_init(struct fsi_master_aspeed *aspeed)
 	return 0;
 }
 
+static ssize_t cfam_reset_store(struct device *dev, struct device_attribute *attr,
+				const char *buf, size_t count)
+{
+	struct fsi_master_aspeed *aspeed = dev_get_drvdata(dev);
+
+	gpiod_set_value(aspeed->cfam_reset_gpio, 1);
+	usleep_range(900, 1000);
+	gpiod_set_value(aspeed->cfam_reset_gpio, 0);
+
+	return count;
+}
+
+static DEVICE_ATTR(cfam_reset, 0200, NULL, cfam_reset_store);
+
+static int setup_cfam_reset(struct fsi_master_aspeed *aspeed)
+{
+	struct device *dev = aspeed->dev;
+	struct gpio_desc *gpio;
+	int rc;
+
+	gpio = devm_gpiod_get_optional(dev, "cfam-reset", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio))
+		return PTR_ERR(gpio);
+	if (!gpio)
+		return 0;
+
+	aspeed->cfam_reset_gpio = gpio;
+
+	rc = device_create_file(dev, &dev_attr_cfam_reset);
+	if (rc) {
+		devm_gpiod_put(dev, gpio);
+		return rc;
+	}
+
+	return 0;
+}
+
 static int tacoma_cabled_fsi_fixup(struct device *dev)
 {
 	struct gpio_desc *routing_gpio, *mux_gpio;
@@ -511,6 +549,11 @@ static int fsi_master_aspeed_probe(struct platform_device *pdev)
 		return rc;
 	}
 
+	rc = setup_cfam_reset(aspeed);
+	if (rc) {
+		dev_err(&pdev->dev, "CFAM reset GPIO setup failed\n");
+	}
+
 	writel(0x1, aspeed->base + OPB_CLK_SYNC);
 	writel(OPB1_XFER_ACK_EN | OPB0_XFER_ACK_EN,
 			aspeed->base + OPB_IRQ_MASK);
-- 
2.27.0

