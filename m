Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E631FFDB0
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 00:06:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nwxW3XvBzDrNL
	for <lists+openbmc@lfdr.de>; Fri, 19 Jun 2020 08:06:07 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GjGtbt9Q; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nwwd64MKzDr8L
 for <openbmc@lists.ozlabs.org>; Fri, 19 Jun 2020 08:05:21 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id y17so3049731plb.8
 for <openbmc@lists.ozlabs.org>; Thu, 18 Jun 2020 15:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DFuspUBCAWSfBUM7wRuDqizerOunF3nyVfYMWAoB1Xs=;
 b=GjGtbt9QqhdRWSt3FcrN78a+L3SHC7LX0DBNavohIshzAV2OHy3+0MM/pYHX/38FNA
 e2vPso9zBRbVRuyAlJZWeR0PsFXKtRrFTbyy4W4NxYU8AjOH1l5de+yZg2uA/v7L0Zlm
 AOd8sjwNbVJAKiaPDMub3MtZ2i8rUAyT27qt4oXkGEjOdZQArug5CykTOpYWiD7oqOXU
 H+arEG5mMRyBtMIj7NBfoj9yXIlbv8To1pb8kxBNxkH6v8DZzJmhL0AkTP2gJCFvuQQq
 u05bvhp3V8luYWKfKEQ+A0P4WxSjlfl7hkNVsUedQ4dVl1NyiWtKUT2aMOXRBQS8KKAN
 F1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DFuspUBCAWSfBUM7wRuDqizerOunF3nyVfYMWAoB1Xs=;
 b=UrWaQRDdxTcUK/PgVRqoSUBG/SnjXLLiNHtsr/356sOpSQj/gs9JSceLGND7VyV8WO
 O7eJK3WoOJhIpZUjiMRzthA6pZ5vwuQoVufrMJofPNvKXpwvSL1igRspYwoEOZ56RWNd
 zOa9O6svA4xGsZzAmxHMl664g/ALNLOm200IdoJlkhdltUqiSmHD3fJ4iW+ES8G68A5g
 S6W2BIeXtozZOWZs0spHWg+Kz7sNB4fw0l9HCOvpURvrC1gwlV0v0VhAbaPQck7wSHBe
 /Yx6+KrH5VssIqFeXZJsEY4xP3Ej3+2e49qJtkQ8eX5RNAAqWN8B4ptqeu6xU2zHEsqw
 Ol+g==
X-Gm-Message-State: AOAM530+VKl1VvfS4xRzZ411Atk4fFp/i8TvV+KODZB0NjkmoBEdDzUF
 dByYI2AfWFjqt1B6MKMc3nY=
X-Google-Smtp-Source: ABdhPJz0a7CgPcnqPMHYsXarirAvcaspBT3OSoe0R1KuP1eYrpJDTy8RtpiAEign488GX9+rwiHsAA==
X-Received: by 2002:a17:902:6a89:: with SMTP id
 n9mr5289437plk.337.1592517917384; 
 Thu, 18 Jun 2020 15:05:17 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 (c-73-252-146-110.hsd1.ca.comcast.net. [73.252.146.110])
 by smtp.gmail.com with ESMTPSA id k18sm3765999pfp.208.2020.06.18.15.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jun 2020 15:05:16 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, taoren@fb.com
Subject: [PATCH net-next] of: mdio: preserve phy dev_flags in of_phy_connect()
Date: Thu, 18 Jun 2020 15:04:44 -0700
Message-Id: <20200618220444.5064-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Tao Ren <rentao.bupt@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <rentao.bupt@gmail.com>

Replace assignment "=" with OR "|=" for "phy->dev_flags" so "dev_flags"
configured in phy probe() function can be preserved.

The idea is similar to commit e7312efbd5de ("net: phy: modify assignment
to OR for dev_flags in phy_attach_direct").

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 drivers/of/of_mdio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_mdio.c b/drivers/of/of_mdio.c
index a04afe79529c..f5c46c72f4d3 100644
--- a/drivers/of/of_mdio.c
+++ b/drivers/of/of_mdio.c
@@ -380,7 +380,7 @@ struct phy_device *of_phy_connect(struct net_device *dev,
 	if (!phy)
 		return NULL;
 
-	phy->dev_flags = flags;
+	phy->dev_flags |= flags;
 
 	ret = phy_connect_direct(dev, phy, hndlr, iface);
 
-- 
2.17.1

