Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DE545E11
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKD383Nxyz3by6
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=evRHAcs4;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=evRHAcs4;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKD1W4yJZz3by8
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:01:19 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id j6so23172715pfe.13
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vttBxePmONKKupD1XU9HSeMdwh+ke+ksEYzGzzG8VQQ=;
        b=evRHAcs4+pZpkahXNgwc1MpyDYPRzq51OA9TlgN00OuBBNZ/mc4Zbn6I2zwLbaltVX
         OztJONCIrYiDMAYQRsXasZdmgzUqNOUzs47UpQzeLQtFhZJ519PvfZO6ZAnomMWROhWK
         joykaOQ8Htyft/7GOBrT6MjRllV600U14Sb9iS1Ae66R43LT79NngYC/AyIZ2xVmUMPO
         rvM+6hoHYqS7C3yucqPTZhT5c8ZcXkgAcPR612mBmHdkbYENDrNby/39qFBTyeqJeftA
         S2Ac0iUCARlfyTWmv/5aVrEFYY2zVVgYmreNonLVJqV5fWFpil7sw9uid3XXrZBKTBTO
         3Dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=vttBxePmONKKupD1XU9HSeMdwh+ke+ksEYzGzzG8VQQ=;
        b=MLbjh0ak5bkNrz8KlglBOiqhKqFLbRNFnbxaA8XAK9zZJ8MTkzppyaiZCCa5AXA6ud
         B2jFp2ev7eKSOffVbcLe1zb97InBci6EcfiYkPnLCj2xzPI2v/KV7nMP43p910V/W+ab
         9yajm2HS9fwZAWMW53E3BdXHCLVKCuePZiDG2eZmmxlBuTz55d4eJ1+7hoy0YA+ztd7D
         sdcKqL689mnBrzuKDjMobgJWW5KfmWFiCY3gxlSuMx9RCJAwGCMyFbKE57T4vro9H3Gr
         5gOkXx9cLt547EizP7B4DfGv5GyaTd3xVXem3AuoxiXtmhIRfaaNHa0C2km5vYapiYmu
         Xg1g==
X-Gm-Message-State: AOAM531Uo3Y4gfi3ocR+M+eqGVcUhFYMX51JwXunDg6SqToyNdl8voNz
	vkBxVHIa33RMymvYexC6kS41941hHTY=
X-Google-Smtp-Source: ABdhPJwH1YSfpbTa7Xe6QjfkhtyMdJsvmk1hlsDmBBnezCXLkVj9HiHex5h2eoqpY5xkMFgSvDtO7Q==
X-Received: by 2002:a65:6c07:0:b0:3f2:5efb:6c7 with SMTP id y7-20020a656c07000000b003f25efb06c7mr38956884pgu.496.1654848076635;
        Fri, 10 Jun 2022 01:01:16 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b0050dc7628162sm18830661pfp.60.2022.06.10.01.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:01:15 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 2/4] phy: Only create NCSI PHY when it's present
Date: Fri, 10 Jun 2022 17:30:57 +0930
Message-Id: <20220610080059.2333501-3-joel@jms.id.au>
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

phy_connect would unconditionally create a NCSI PHY device if the driver
was configured.

By detecting what the phy type is at runtime we can support NCSI and
non-NCSI system with the same defconfig,

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/phy/phy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index a0f7b7964464..8e70746a1e76 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -932,7 +932,8 @@ struct phy_device *phy_connect(struct mii_dev *bus, int addr,
 #endif
 
 #ifdef CONFIG_PHY_NCSI
-	phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
+	if (interface == PHY_INTERFACE_MODE_NCSI)
+		phydev = phy_device_create(bus, 0, PHY_NCSI_ID, false, interface);
 #endif
 
 	if (!phydev)
-- 
2.35.1

