Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EF186003E
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 19:00:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqdlPSpU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggsf4Hzjz3dXL
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 05:00:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bqdlPSpU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tggr90H3rz3dSL
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 04:59:03 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d240d8baf6so522491fa.3
        for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 09:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624738; x=1709229538; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOW9you0b0342rsDJpYsth5h/RvQ0i1KuZysF40tbO0=;
        b=bqdlPSpUIvf5SjwzfpBbu9CxjpRMB3DVQoVCwX/qjvrsKCFV26tBEPZl4drJv0QG1y
         zNmZ+gt74W7bs9hvlkF4K2CRkAWc1d4K34NciQF4/wSxDF70hGNCOBV74FzSbdYzX5FK
         TJ4l6xyeHqm/59hnM+bnf9h5LTarJQir3aqGuhxrvOGYgow7M5ijYI7tdWAVK9cR9rUx
         elNzEFPrWbpujQJIV96kBhL16tiJ2eV3c1FyMRhbaDq9WDdq00I5gZVZwdt4k6iGqVFI
         Tm7ojJeRjd2xtn5XTeaB3fYxHgkzFONzYRLkkV+M60ZJ56uQx6PFb0olhu78XK4oxCzi
         KqVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624738; x=1709229538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOW9you0b0342rsDJpYsth5h/RvQ0i1KuZysF40tbO0=;
        b=dm4ed3FPlEU0JOgUnfOqSXOBNhnB3d6iDd2+7x5Sdf7dfjSP9TsJDYYuJqvbkxkfr9
         UiUgdUqBxQ47ePn8RpLIVj9aXOizYdOqVqw0GwCfd6CC0SAeRt8OKROPGZ8R4QF523B6
         p1v9q03L+YaxRAbm2SWV7xb6h3h1RqIqQ/aUUnCaThTqWL67bUwDWEMfylfdf7MVm6Uh
         7mfh6wB0ilGFyLlS3ZXLm3/YilfuTzF7LoLeCl+EKB02St7pyT0q1nIxSE/CGY8/5Fng
         J0VdZ1+Nt83OxKK10BJpWvjuHbmQeTTOeZGzWeEtt6o8woq2i8pRRQKDsQvYncI0CQWs
         VqiA==
X-Forwarded-Encrypted: i=1; AJvYcCUYLPuh9R3Vjh2QReX9GNU2CUgmT5Qf/t8eBV6h8skQ59zCHtAJMr9KVAbqXp2z8/oRbr+fhM64y+nzIS1lTxFB7+8W2cSDaG8=
X-Gm-Message-State: AOJu0YxFCAzjojGlEHdPMsLSHpyiNZPgudZNLaP1u1EnWAwBjK6CgJoA
	XAz3x4Z8NI+X/O/PmKsvP4bApKeoD2wkc1+y8YtrSFJ25vfrx/7R
X-Google-Smtp-Source: AGHT+IGt49I5Sptvj945xk8GlYDZxwnj9/17uQP/A9B3F9aGMdn0iFrkB8SHmAKNpN7pw6Mp/sGMXA==
X-Received: by 2002:a05:651c:b0f:b0:2d2:64c8:49a6 with SMTP id b15-20020a05651c0b0f00b002d264c849a6mr1360670ljr.21.1708624738266;
        Thu, 22 Feb 2024 09:58:58 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id z33-20020a2ebe21000000b002d230f2e808sm2011743ljq.48.2024.02.22.09.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:58:57 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 1/4] net: pcs: xpcs: Drop sentinel entry from 2500basex ifaces list
Date: Thu, 22 Feb 2024 20:58:20 +0300
Message-ID: <20240222175843.26919-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222175843.26919-1-fancer.lancer@gmail.com>
References: <20240222175843.26919-1-fancer.lancer@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, Mengyuan Lou <mengyuanlou@net-swift.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

There are currently only two methods (xpcs_find_compat() and
xpcs_get_interfaces()) defined in the driver which loop over the available
interfaces. All of them rely on the xpcs_compat::num_interfaces field
value to get the total number of supported interfaces. Thus the interface
arrays are supposed to be filled with actual interface IDs and there is no
need in the dummy terminating ID placed at the end of the arrays.

Based on the above drop the PHY_INTERFACE_MODE_MAX entry from the
xpcs_2500basex_interfaces array and the PHY_INTERFACE_MODE_MAX-based
conditional statement from the xpcs_get_interfaces() method as redundant.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/pcs/pcs-xpcs.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 31f0beba638a..dc7c374da495 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -130,7 +130,6 @@ static const phy_interface_t xpcs_1000basex_interfaces[] = {
 
 static const phy_interface_t xpcs_2500basex_interfaces[] = {
 	PHY_INTERFACE_MODE_2500BASEX,
-	PHY_INTERFACE_MODE_MAX,
 };
 
 enum {
@@ -636,8 +635,7 @@ void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
 		const struct xpcs_compat *compat = &xpcs->id->compat[i];
 
 		for (j = 0; j < compat->num_interfaces; j++)
-			if (compat->interface[j] < PHY_INTERFACE_MODE_MAX)
-				__set_bit(compat->interface[j], interfaces);
+			__set_bit(compat->interface[j], interfaces);
 	}
 }
 EXPORT_SYMBOL_GPL(xpcs_get_interfaces);
-- 
2.43.0

