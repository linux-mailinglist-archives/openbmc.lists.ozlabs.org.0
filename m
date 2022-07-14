Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4C057443E
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 07:08:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk2Zw6N3xz3c5D
	for <lists+openbmc@lfdr.de>; Thu, 14 Jul 2022 15:08:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DCiolo+M;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DCiolo+M;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk2Yw08cjz3c3D
	for <openbmc@lists.ozlabs.org>; Thu, 14 Jul 2022 15:08:03 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id i8-20020a17090a4b8800b001ef8a65bfbdso1566749pjh.1
        for <openbmc@lists.ozlabs.org>; Wed, 13 Jul 2022 22:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fsuLQTQl1DvEkteGdB9YP9ZMhsXUPm0usoBXO1vLBi0=;
        b=DCiolo+MdMWAMlr5czMiddQVWYhhO0VTuLeOe0WT5T/xpfJj+oOxLyE+nIq9pUl+8/
         v2xv4iVj/EWOv0iYeiscux8pYb1znIx6+gIee+OZH5m1nLDk12zYV++sJsCilrDKOXBi
         9LosHBqlTCIi+lPJLb5UZfwDAG9hN0LHN2u/6bC6vHKXO/nyrdHY0cvBGJKG9dlyrjhZ
         CqAZPa/8acgnk3qDxsSHEaW7CWHC1uGjkQH/d6+NGASZsKtBbigBxrV7wpblyJDXqYbt
         nzjIf8d+AYkvLdsMazmiNKjJY3hWqypl8HKL1guPh5c3pAxCNsP3CpI2IXzhcsqjV7yd
         90Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=fsuLQTQl1DvEkteGdB9YP9ZMhsXUPm0usoBXO1vLBi0=;
        b=Rp+FSAZl9/wGyIixKTPM6hClXKeLDLbd8qK/5k3rOTLPkT7coA1RQPTDGQxA18Mr6R
         yy8BSZYgUd5c+cVpc1N4VQSYlklqAjFQWGlbmtLiGYCj+QHBwkvlCPrHwESBgBvh6YwY
         zqw7FyGGKb7VyNcVBapjiTlHz32wChuH6+dDLZzjXjXqH6JB5a1OojWutZ6h6HlDIF4h
         Ocs0Uy2UaTzVvRp9/qgO3UoXKdvWBtuhHlRzG/pXkog1PtNT4nbhc7M2lRn6vDKsAV6Y
         D2ZBh/vqdc2/2vqZ3Wl6q5JwtMRUriYII2+vkhK1KLm4wA/OpYVHhzkm8oaIiR9jLOJ/
         FM+A==
X-Gm-Message-State: AJIora93ktMQXolMAV3XlMa0SSiT93ln19ztLVN2QNKDryOgGZ2EfwhL
	zfxDro3J4hMuniJrve10wZKH1bRshJU=
X-Google-Smtp-Source: AGRyM1s2n8uGBspgy4Q+WxkT+4jUapX1SOWx3B3QMctiCoUjlwN8LX4W+I/DqKdUmj/HPaTSfGMYOw==
X-Received: by 2002:a17:90b:3b82:b0:1f0:73e1:8426 with SMTP id pc2-20020a17090b3b8200b001f073e18426mr9565801pjb.209.1657775278937;
        Wed, 13 Jul 2022 22:07:58 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b0015e8d4eb26esm356059pla.184.2022.07.13.22.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 22:07:58 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: openbmc@lists.ozlabs.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 1/2] ftgmac100: Fail probe when NCSI selected but not enabled
Date: Thu, 14 Jul 2022 14:37:43 +0930
Message-Id: <20220714050744.572275-2-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714050744.572275-1-joel@jms.id.au>
References: <20220714050744.572275-1-joel@jms.id.au>
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

When NCSI has been selected by the device tree we will skip allocating a
phy bus in ftgmac100_mdio_init, resulting in a null pointer dereference
when calling phy_connect (in phy_find_by_mask).

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/net/ftgmac100.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/ftgmac100.c b/drivers/net/ftgmac100.c
index aa1d63880c8c..16bab9705025 100644
--- a/drivers/net/ftgmac100.c
+++ b/drivers/net/ftgmac100.c
@@ -597,6 +597,12 @@ static int ftgmac100_probe(struct udevice *dev)
 		goto out;
 
 	if (priv->ncsi_mode) {
+		if (!IS_ENABLED(CONFIG_PHY_NCSI)) {
+			dev_err(dev,
+				"ftgmac100: NCSI in dts but CONFIG_PHY_NCSI missing. Please fix config\n");
+			return -EINVAL;
+		}
+
 		printf("%s - NCSI detected\n", __func__);
 	} else {
 		ret = ftgmac100_mdio_init(dev);
-- 
2.35.1

