Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87686004C
	for <lists+openbmc@lfdr.de>; Thu, 22 Feb 2024 19:02:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QMt3cBWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TggwY1Tfdz3dVp
	for <lists+openbmc@lfdr.de>; Fri, 23 Feb 2024 05:02:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QMt3cBWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TggrC50z4z3ccV
	for <openbmc@lists.ozlabs.org>; Fri, 23 Feb 2024 04:59:07 +1100 (AEDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2d0cd9871b3so11623341fa.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Feb 2024 09:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708624743; x=1709229543; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bTqyc5eLl00Lab2XpbFjSYvN/btOw7kIcPOi9K55pg=;
        b=QMt3cBWeG0dY6EZHS9bqLPVSf+JQHTkAnHIdpzzIt89PWjT4PVUqULsWLvkdHCAkJt
         H3RqI2KhIxWPNS8rdNvoTroxHFVXmgkvOCXdnmtzJ008ZeCWXRsCQlUMKigBGiI4sfhb
         tW9u/62Q8yPI7t+KTC6u7TM6d3/mLpeucXcLfhRb0qKyEn8q3f9b+sqCBBAHV1BLEXgu
         KFjhSxBEN9Y6XfPQ1TjA2qI/eLOBdK0cifU8LBppF+wuoHb/MCiMhTLIAxX3geWc/gdz
         QJXyHjmSyX383Ric/QYRJ9pl84lnoMSG9fHJaLTnmLaVbO/K1aW9KP4hHwrYuaf/f5wx
         /rTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708624743; x=1709229543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5bTqyc5eLl00Lab2XpbFjSYvN/btOw7kIcPOi9K55pg=;
        b=OLPfWhMkmy+Vc3JZot9CmAyk3HcCrE1CE/fVH46vaylMfRciRzkmKiwcZuik5hrGuo
         /bkmwNPEqNLcojJQ9RCdsP6GLfLeCQhDz09Zvf9e0tnI2U497qpzVp73MU89p2YPKoep
         orcYYMWYMbFiUnis/bxEbRUym1mx+vAZ9MGZnJKYLOlWuXcgYeexqkxSLA13BrCnFOXG
         SNmzPjwXlDNybUrsj9I/aZ6V7YVHK+/nEirgA3YARu2rlmorGrjaRzPbuwO9n9Yv9tGE
         2xDPaVnyHyo7o3SR3R+unYX7OhbZVnTigV7aHH5GaFoDt9+UPJa5YB30GAG3d4GT/4+P
         WOKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9M65b9jKScVCUelmWTBmVXp6aZBDKUBSIXRpMN9KAaZ2ZuTaGb7L3f3rRWci9XwPewkaMiuslGlPb0FtiWYL5DMi542bZ1TY=
X-Gm-Message-State: AOJu0YyExC6la1VV6jxIGBUi/lhEXwg5FrXwgALeazHUt3Ifv6k9LU6/
	F1qkmwXFal5SoPKC3MZcB3hb8AOEs2YrN8IW7F2fHdVPmfaNKP6W
X-Google-Smtp-Source: AGHT+IHuasSgIqN4mYlSs8rVhcBwid+S/k+ba5GORgBQig/kQBDhwbuCR6H37k2jc6Uam3ZK+g908A==
X-Received: by 2002:a2e:904d:0:b0:2d2:31a8:cb1a with SMTP id n13-20020a2e904d000000b002d231a8cb1amr1275872ljg.13.1708624743579;
        Thu, 22 Feb 2024 09:59:03 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002d221041b59sm2296052lji.51.2024.02.22.09.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:59:03 -0800 (PST)
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
Subject: [PATCH net-next v2 4/4] net: pcs: xpcs: Explicitly return error on caps validation
Date: Thu, 22 Feb 2024 20:58:23 +0300
Message-ID: <20240222175843.26919-5-fancer.lancer@gmail.com>
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

If an unsupported interface is passed to the PCS validation callback there
is no need in further link-modes calculations since the resultant array
will be initialized with zeros which will be perceived by the phylink
subsystem as error anyway (see phylink_validate_mac_and_pcs()). Instead
let's explicitly return the -EINVAL error to inform the caller about the
unsupported interface as it's done in the rest of the pcs_validate
callbacks.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 92c47da61db4..46afeb5510c0 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -613,14 +613,15 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
 
 	xpcs = phylink_pcs_to_xpcs(pcs);
 	compat = xpcs_find_compat(xpcs->id, state->interface);
+	if (!compat)
+		return -EINVAL;
 
 	/* Populate the supported link modes for this PHY interface type.
 	 * FIXME: what about the port modes and autoneg bit? This masks
 	 * all those away.
 	 */
-	if (compat)
-		for (i = 0; compat->supported[i] != __ETHTOOL_LINK_MODE_MASK_NBITS; i++)
-			set_bit(compat->supported[i], xpcs_supported);
+	for (i = 0; compat->supported[i] != __ETHTOOL_LINK_MODE_MASK_NBITS; i++)
+		set_bit(compat->supported[i], xpcs_supported);
 
 	linkmode_and(supported, supported, xpcs_supported);
 
-- 
2.43.0

