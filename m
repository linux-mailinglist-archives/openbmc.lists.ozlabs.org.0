Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CE6860048
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 19:02:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oe/Wji9A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TggvZ2Bg1z3dWk
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 05:02:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Oe/Wji9A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TggrB2mG6z3ccV
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 04:59:06 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-512bce554a5so62865e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 09:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624742; x=1709229542; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp1g5lResVomu+V7VdkXdGM8kiQtYo+auuikQ/uSWZI=;
        b=Oe/Wji9A1/NS5bxlzLyFwVsALRO2WfsAeMPt3in7r8uyNpetgzWGNCqMvOkAdnjpPF
         8tXU+3VFUplPNVAYXQIZ4BeGsghMUKjxXd0G2/CviGy5i9EId72FZFLSvVGfbBi5+ExK
         Muq5mwLJE8gz+4HJY8S3+ExdH2VzdgVj54Qzwgc/gGMux9DHPgwXJRmh0GN90sSSw6NE
         YcCbHGLpGmLNfmVeWsWDiutNn6WNspLMonzjL0tYd1Ri6daW1mLxRWe9QQ4A+EAg4vSk
         o0YaZaf4ruIpqUpNW/dCLHB70CN3M//439kXbGGxGfJ1kUB2qeb0Dtg+ceWMoNJmiIhl
         xt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624742; x=1709229542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp1g5lResVomu+V7VdkXdGM8kiQtYo+auuikQ/uSWZI=;
        b=M3z2itGdgB/uj7BZNeDURyJ0xSlivkTnXmPsBfup1gnEFcyVc6RTMe87/rlLcZa29C
         haQrh0ArmJYzBy4yS/QRkcqcqbIO0Xj2sUMQUxiawL9sk0iGHpcEPX34zMw2XrWnFxUr
         ZPObWkqWB2bab4wLdsqOO/n/4+ub7MZKpSsWTEQ1v6v9/TrIr9owlrs8mqDqtjKTIuF0
         /pMU2sP21TM4rytaKaaV09KKgtk6u3EkUPTumbAWT3HbZlcSitlRzXyqXJTcXfRnXzKb
         ajXBLIwUo8wpiGki/VbOvKS0eiR1iTjIDWv5YjNW1zmUY6aq6eIBwVJCLNsUldNQ2Mq/
         l6xg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIOr7tcPnmOm7ACFcEReoNyiaR3YZxCUxY8L3gjwKVfnWuS0YWgM6pVOMFW2W0o9tsDfApg1XGK8a8LFzGukbhZw4EqVCsSU=
X-Gm-Message-State: AOJu0YwaZvK34ZfBZ5uNHa8axWqxtcC72CUz7D9C3FaOAC6naBu7hEAw
	BqYBkbg8GN77cJmy6RmQ66WMiwhPuJOZqGFlh0634Rj8c+3q+LTO
X-Google-Smtp-Source: AGHT+IGRpEI2oSqtm9dYNcKLyivAzdy3gMDPODH0h2w+FofbgIArs+mWBkkBVw4dyzhAIdDfbP1Bew==
X-Received: by 2002:ac2:5e25:0:b0:512:bed4:dfc8 with SMTP id o5-20020ac25e25000000b00512bed4dfc8mr6182428lfg.3.1708624741750;
        Thu, 22 Feb 2024 09:59:01 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id k13-20020a0565123d8d00b00512d47a6459sm694644lfv.148.2024.02.22.09.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:59:01 -0800 (PST)
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
Subject: [PATCH net-next v2 3/4] net: pcs: xpcs: Return EINVAL in the internal methods
Date: Thu, 22 Feb 2024 20:58:22 +0300
Message-ID: <20240222175843.26919-4-fancer.lancer@gmail.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

In particular the xpcs_soft_reset() and xpcs_do_config() functions
currently return -1 if invalid auto-negotiation mode is specified. That
value might be then passed to the generic kernel subsystems which require
a standard kernel errno value. Even though the erroneous conditions are
very specific (memory corruption or buggy driver implementation) using a
hard-coded -1 literal doesn't seem correct anyway especially when it comes
to passing it higher to the network subsystem or printing to the system
log.  Convert the hard-coded error values to -EINVAL then.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
Tested-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/pcs/pcs-xpcs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 7f8c63922a4b..92c47da61db4 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -292,7 +292,7 @@ static int xpcs_soft_reset(struct dw_xpcs *xpcs,
 		dev = MDIO_MMD_VEND2;
 		break;
 	default:
-		return -1;
+		return -EINVAL;
 	}
 
 	ret = xpcs_write(xpcs, dev, MDIO_CTRL1, MDIO_CTRL1_RESET);
@@ -889,7 +889,7 @@ int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
 			return ret;
 		break;
 	default:
-		return -1;
+		return -EINVAL;
 	}
 
 	if (compat->pma_config) {
-- 
2.43.0

