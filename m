Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4ACE0DF9
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 00:00:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yS9G0w4zzDqJq
	for <lists+openbmc@lfdr.de>; Wed, 23 Oct 2019 09:00:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ba1l/6Dw"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46yMXs3ldQzDqLx
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 05:31:41 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id t10so8733831plr.8
 for <openbmc@lists.ozlabs.org>; Tue, 22 Oct 2019 11:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PqWdmEQdcmjmFLWvTGjLwPx6VnrOcgWy0kGCVc8BpHs=;
 b=Ba1l/6Dw6t1lnoMAIkJiOq+J0wvmYQt3HrbWxfkZZwJqmgte9pw5puY+Tt/hFyYnuO
 p/RQ20eiVf7492Lv/978INFbuTskGlqwP7+9Lyq5GtztSi6+eC9GIH4a04jB9s8sx7av
 7ZLc0U5W7DySJHpAGeycaVi+yHVUTf88KO7+KGWVE6yRb3On9IWmoZK6mw6/QyQHx/6O
 W5vJppKgGSEbO6Yxq7kENXFnBw+kVNqRqmMUQapgHHd6HRKRuIVV2aTcsoItxhmaiWvJ
 hLVUw1UTXOXT+z1Kk5qTpqTppFVW91Ks6qqPcLPhCJu76FG50wVK/Rb6wmywAZjDi+z/
 C8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PqWdmEQdcmjmFLWvTGjLwPx6VnrOcgWy0kGCVc8BpHs=;
 b=ET3vI6TIiGoV+rDGYVAQcTt7fsrnpdXjR7svbbhX3zB7WaXpb2L11W7QKTvcMjB7al
 03Pid90qCEaOCLdQnLogDH+lCwvobPsZUwUVcYq+iUwPLc4jjHEJnm1+KTRNoYOurxvZ
 nRsu6lkp5Hi+kqNVkv9W81PZg8uA+uyYOvViIQCk7Z8t7NLlU/iWvBngxSIEgI5L0bBN
 qEr0X8XgXyTk/hLxdYcE0ibYxRx1aEtF7EGa/iDxJ+4CGWPuSBSpQBy21aqvZe0C3Iay
 i8QKJQHoZdANyByHD0lpaaRiwTuBL82xgUL7EDOGkIVl0WixfkwXp7ggWufBgdLd1SI7
 G4lg==
X-Gm-Message-State: APjAAAULn8yewVlixUEiLLpfdW0DFKh/4HxsNchj7bbL7Ir+LIT/bS0B
 ug6TSeDHUrj62x0uaf+veP0=
X-Google-Smtp-Source: APXvYqx+EjDcV+i7mxpvdqEU3QZ476yYSpRSo4mPRljkGHInUZyuVnDAxjXmAnuvXtfLdgE96vfwlw==
X-Received: by 2002:a17:902:9a93:: with SMTP id
 w19mr5033569plp.316.1571769098674; 
 Tue, 22 Oct 2019 11:31:38 -0700 (PDT)
Received: from taoren-ubuntu-R90MNF91.thefacebook.com
 ([2620:10d:c090:200::2398])
 by smtp.gmail.com with ESMTPSA id m19sm16787947pjl.28.2019.10.22.11.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 11:31:38 -0700 (PDT)
From: rentao.bupt@gmail.com
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Vladimir Oltean <olteanv@gmail.com>,
 Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: [PATCH net-next v10 1/3] net: phy: modify assignment to OR for
 dev_flags in phy_attach_direct
Date: Tue, 22 Oct 2019 11:31:06 -0700
Message-Id: <20191022183108.14029-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191022183108.14029-1-rentao.bupt@gmail.com>
References: <20191022183108.14029-1-rentao.bupt@gmail.com>
X-Mailman-Approved-At: Wed, 23 Oct 2019 08:55:44 +1100
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <taoren@fb.com>

Modify the assignment to OR when dealing with phydev->dev_flags in
phy_attach_direct function, and this is to make sure dev_flags set in
driver's probe callback won't be lost.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Tao Ren <taoren@fb.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Changes:
  - nothing is changed in v1-v9: it's given v10 to align with the version
    of patch series.

 drivers/net/phy/phy_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index adb66a2fae18..f1f60bd4865a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1270,7 +1270,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			phydev_err(phydev, "error creating 'phy_standalone' sysfs entry\n");
 	}
 
-	phydev->dev_flags = flags;
+	phydev->dev_flags |= flags;
 
 	phydev->interface = interface;
 
-- 
2.17.1

