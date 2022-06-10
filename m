Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6013B545E19
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:03:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKD3r1N8kz3c8p
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:03:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyD4TxQz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JyD4TxQz;
	dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKD1Z572mz30Lk
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:01:22 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id e66so24065692pgc.8
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PTOrXvR8al75cebbXzwt+0SU+d9UFvmeDXRcexGPv6A=;
        b=JyD4TxQzDBDU6LJUrDgsO7MlwG7Ig6AnlFPXuQqK5e52Q1LAIKYb/WSfoA9B72BlVL
         FLnNYGqv5hY5HVCzVKZCwkLcUjLfF8/JoM5M6BO9xUSQS6SI+uboQrEFi9szXj4fs181
         zATycr0hkIufd/mRh/OTCOaisj2CdqhNL9q05Xmp/lW4r4QECaa2XmE/V/TQ2dw4p4Kl
         YiVEPClVRQ5+2vcQuFdM1kgPwq+mgubjaW808qMUn6wAMndgAb/FYblqM7gze62KC3od
         kqHQzfUC8oOq017SD+DSgyt+Ku8iR8hIwCJFIuGaWeyvHRxFR8k9BxA19QT7OOoq2f18
         ONow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=PTOrXvR8al75cebbXzwt+0SU+d9UFvmeDXRcexGPv6A=;
        b=vwrdyo4FqPB4bpXQTp/vkyYsWWcT4BnxVGTg7F+kq1X9xUK01A9OVaVoqNTJqCpC8u
         +CpV8eZlxcCjD+JxAGkBt+nMFN8hGo+lxY4dhCll+VQKiF2VJ+GByjdLjxeJsyDzM6fM
         BC1SNSKbNGDmavWKZ6p0NUeGyySTodtfv0lnYC5vt3AvGAYaHyQnbm0JCHw9Z+DjjkpP
         n0k6Fhcq3OUrcPpBTGUiTSNSogVu4vmxbFn6fY5T63VOuczKg/gUrOHNfHaSREIbG0YV
         dkTli1e3iDEhW0kUzMFELKLm0Q6yZv3S5ncQzIUDd4TUTD1lilBFeeJqLBbIRAuovFNf
         5vFQ==
X-Gm-Message-State: AOAM532DXXJXcdT7Sye4oSqB5miE0DApqGg3zt8boqPid7vaUcgXtGpA
	cuW6A0GvKCYhdM4jWJCzkai8fkQ1n9E=
X-Google-Smtp-Source: ABdhPJx4U/RzD+HwkJVGlmmMbFIaKqJS7SeUPJjEaXRcSGhMJdYEAtf5y5FRujvLMUGSgp6P9+D+yA==
X-Received: by 2002:a65:6d87:0:b0:3fd:a62e:dc0a with SMTP id bc7-20020a656d87000000b003fda62edc0amr23295145pgb.286.1654848079794;
        Fri, 10 Jun 2022 01:01:19 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b0050dc7628162sm18830661pfp.60.2022.06.10.01.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:01:18 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 3/4] ftgmac100: Simplify NCSI detection
Date: Fri, 10 Jun 2022 17:30:58 +0930
Message-Id: <20220610080059.2333501-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610080059.2333501-1-joel@jms.id.au>
References: <20220610080059.2333501-1-joel@jms.id.au>
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
Cc: BMC-SW@aspeedtech.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

We don't need priv->ncsi_mode as we already have priv->phy_mode.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ftgmac100.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index aa1d63880c8c..92170f52434e 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -18,7 +18,6 @@
 #include <wait_bit.h>
 #include <linux/io.h>
 #include <linux/iopoll.h>
-#include <net/ncsi.h>
 
 #include "ftgmac100.h"
 #include "aspeed_mdio.h"
@@ -85,7 +84,6 @@ struct ftgmac100_data {
 	struct mii_dev *bus;
 	u32 phy_mode;
 	u32 max_speed;
-	bool ncsi_mode;
 
 	struct clk_bulk clks;
 
@@ -192,7 +190,7 @@ static int ftgmac100_phy_adjust_link(struct ftgmac100_data *priv)
 	struct phy_device *phydev = priv->phydev;
 	u32 maccr;
 
-	if (!phydev->link && !priv->ncsi_mode) {
+	if (!phydev->link && priv->phy_mode != PHY_INTERFACE_MODE_NCSI) {
 		dev_err(phydev->dev, "No link\n");
 		return -EREMOTEIO;
 	}
@@ -228,7 +226,7 @@ static int ftgmac100_phy_init(struct udevice *dev)
 	if (!phydev)
 		return -ENODEV;
 
-	if (!priv->ncsi_mode)
+	if (priv->phy_mode != PHY_INTERFACE_MODE_NCSI)
 		phydev->supported &= PHY_GBIT_FEATURES;
 	if (priv->max_speed) {
 		ret = phy_set_supported(phydev, priv->max_speed);
@@ -287,7 +285,7 @@ static void ftgmac100_stop(struct udevice *dev)
 
 	writel(0, &ftgmac100->maccr);
 
-	if (!priv->ncsi_mode)
+	if (priv->phy_mode != PHY_INTERFACE_MODE_NCSI)
 		phy_shutdown(priv->phydev);
 }
 
@@ -581,13 +579,8 @@ static int ftgmac100_probe(struct udevice *dev)
 {
 	struct eth_pdata *pdata = dev_get_platdata(dev);
 	struct ftgmac100_data *priv = dev_get_priv(dev);
-	const char *phy_mode;
 	int ret;
 
-	phy_mode = dev_read_string(dev, "phy-mode");
-	priv->ncsi_mode = dev_read_bool(dev, "use-ncsi") ||
-		(phy_mode && strcmp(phy_mode, "NC-SI") == 0);
-
 	priv->iobase = (struct ftgmac100 *)pdata->iobase;
 	priv->phy_mode = pdata->phy_interface;
 	priv->max_speed = pdata->max_speed;
@@ -596,7 +589,7 @@ static int ftgmac100_probe(struct udevice *dev)
 	if (ret)
 		goto out;
 
-	if (priv->ncsi_mode) {
+	if (priv->phy_mode == PHY_INTERFACE_MODE_NCSI) {
 		printf("%s - NCSI detected\n", __func__);
 	} else {
 		ret = ftgmac100_mdio_init(dev);
@@ -624,7 +617,7 @@ static int ftgmac100_remove(struct udevice *dev)
 {
 	struct ftgmac100_data *priv = dev_get_priv(dev);
 
-	if (!priv->ncsi_mode) {
+	if (priv->phy_mode != PHY_INTERFACE_MODE_NCSI) {
 		free(priv->phydev);
 		mdio_unregister(priv->bus);
 		mdio_free(priv->bus);
-- 
2.35.1

