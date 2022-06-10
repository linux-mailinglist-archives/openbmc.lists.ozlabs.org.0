Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5A0545E0E
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 10:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKD2Q71mKz3bwZ
	for <lists+openbmc@lfdr.de>; Fri, 10 Jun 2022 18:02:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i8PDjNhs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i8PDjNhs;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKD1T71jGz3bwp
	for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 18:01:17 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so2926896pjb.1
        for <openbmc@lists.ozlabs.org>; Fri, 10 Jun 2022 01:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BR/rF4beoNY514Ihi92I0x/Ov90m1dHVU/UqsOCo8Sw=;
        b=i8PDjNhsx5KQvspskxMeyGoxaJxjuljNm/GpU/drE+MXLwuEu4rhZwWC6CREqa/B1/
         0M8F9CjrNx1C+yDbD2O8iAN+0fH5F+tELAN6p/ashAatzXTebgqK0kBJcQh6lS7ndVsi
         VvuB2fzvLLJEN7fD0tooe3WOSJ0XHt5prP9LKgS6c/iKQA3bMZQ8k8M9uBlRIYWrg6PE
         kD09wvv8I5fxOxM+oG6MyLYQkGsT0qkUjX8bqkhmiNt+qzMXqPp2QuJDLkomS2SfZ9T0
         hQ1u85KjErpiOLJmBq3d3QU2vl7uY2eEljtTG6Rg2RBA0gVyHEqaO2qnO1uYUvY4wVlY
         N7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BR/rF4beoNY514Ihi92I0x/Ov90m1dHVU/UqsOCo8Sw=;
        b=iIi4lzqCEC3C8YupGwHJypolw3UzyFvhoOgwfoUFdp6i03cRqZtvEweg3FmWOI40IN
         AxHZbD16TGDIkKKuTP7KjsiQC87EtyhZOPYZwkFce53/IqkRrOxbaRSn0k78VIfNvEYJ
         iHsguvxjjVeGXhWV/p86yJRcPeFdh++Mfv+Jb87tQNpi1sdtI07HHvYGVgHrzrDVxhhQ
         fpl9fJ5/GabE+L008FcNBvKAUAHYJS6/adI2JV8vbm+izH0jcK04eMcVXKc83fciDFqG
         JZnH7LERGOQV0I6WjKl0ySS0tPQsw3ec+2PAjjhEDVowO+QXVmLZ4wbPSD+/OucZOUKs
         VZSg==
X-Gm-Message-State: AOAM532D1jgrSDxxE3kbneRwWjVuN5zCUBfcg1D2GsyNV7e2US10tIru
	ND0tV5C6fjDo+i/PeXI7I+JFglpH92M=
X-Google-Smtp-Source: ABdhPJzkVCeH7+CdkYY1lmzOrJf3rVdAIVXYD1kjBr4Vjg7udoceThL5K3zOKvno3zqS+4JAk+HHlQ==
X-Received: by 2002:a17:902:f647:b0:161:67af:6bf0 with SMTP id m7-20020a170902f64700b0016167af6bf0mr42684061plg.100.1654848073398;
        Fri, 10 Jun 2022 01:01:13 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b0050dc7628162sm18830661pfp.60.2022.06.10.01.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 01:01:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/4] net: phy: ncsi: Add phy_interface_is_ncsi() helper
Date: Fri, 10 Jun 2022 17:30:56 +0930
Message-Id: <20220610080059.2333501-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220610080059.2333501-1-joel@jms.id.au>
References: <20220610080059.2333501-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Cédric Le Goater <clg@kaod.org>

and use it to avoid configuring NCSI in net_loop() when the DT has no
support for it.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 include/phy.h         | 2 ++
 drivers/net/phy/phy.c | 7 +++++++
 net/net.c             | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/phy.h b/include/phy.h
index ed21775f3bbc..a759d04038a3 100644
--- a/include/phy.h
+++ b/include/phy.h
@@ -287,6 +287,8 @@ static inline bool phy_interface_is_sgmii(struct phy_device *phydev)
 		phydev->interface <= PHY_INTERFACE_MODE_QSGMII;
 }
 
+bool phy_interface_is_ncsi(void);
+
 /* PHY UIDs for various PHYs that are referenced in external code */
 #define PHY_UID_CS4340  	0x13e51002
 #define PHY_UID_CS4223  	0x03e57003
diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index daea26c451fe..a0f7b7964464 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -988,3 +988,10 @@ int phy_get_interface_by_name(const char *str)
 
 	return -1;
 }
+
+bool phy_interface_is_ncsi(void)
+{
+	struct eth_pdata *pdata = dev_get_platdata(eth_get_dev());
+
+	return pdata->phy_interface == PHY_INTERFACE_MODE_NCSI;
+}
diff --git a/net/net.c b/net/net.c
index f0f9cd4d946b..8449445bf65c 100644
--- a/net/net.c
+++ b/net/net.c
@@ -409,7 +409,7 @@ int net_loop(enum proto_t protocol)
 	debug_cond(DEBUG_INT_STATE, "--- net_loop Entry\n");
 
 #ifdef CONFIG_PHY_NCSI
-	if (protocol != NCSI && !ncsi_active()) {
+	if (phy_interface_is_ncsi() && protocol != NCSI && !ncsi_active()) {
 		printf("Configuring NCSI\n");
 		if (net_loop(NCSI) < 0)
 			return ret;
-- 
2.35.1

