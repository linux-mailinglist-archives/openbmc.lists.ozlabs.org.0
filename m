Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B055805061
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:36:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GXGU7MuA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxmB5tgPz3cTN
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:36:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GXGU7MuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxld5WLDz3c4s
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:12 +1100 (AEDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9f166581dso37155591fa.2
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772569; x=1702377369; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7nbPSVfDOj9VhJDoGLXG/VirsAsAqdDlwTrxuDOen8=;
        b=GXGU7MuAsmvpuPqfF8bV8uTnont+wQGQCKpewfNY3JhBCJekJ15rf6YWM4xuKNQVun
         40nmePuHTxILF+mO/ZQ1wp94Mj41+9WH/Q/STgJBC4OEg2E4SKnYdRIsIZfx5/42uABP
         XHIHS3NlbDuEebXHfRzyWJhwymjOxvz9uWN081FdtX41ISM6xCGGUaRDQDmQg5Y+g6OL
         ClmO2y4iMB+HgKJnA2J0g8JKlrUGXP8fBJ3Yytqgz7i3oRgg/ouTZdZgeU2n796Dq2j0
         ikSos/pwyiprcHAZRL+XcSOwz5jv2KrEpCl1Q08seo732yQEPg+BIN2hNckugqZNPEgc
         a4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772569; x=1702377369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U7nbPSVfDOj9VhJDoGLXG/VirsAsAqdDlwTrxuDOen8=;
        b=XTt3XkatxjgTm/eiVEYspjwoA58yrOBElUSTefqPhxGRAB/85J6sd6Zu+kprok76Jv
         YJqExB/iLAzKQDReR7/TuVPhAfbwPQzixdiO+uLokzxPLbbLX0qft0zqe0Lm32zmM4B1
         hiIyBvrbzdgeWjpK+CGzOweYMIlaYPIZqkkktKltmdQfqB468GYWZ3RWNEQipGfgqiYz
         bxlE9cdldPOyqv3uyI3pwmh3KlqVerElCwlmDQTHvqySS9gTi/BowsEdWIVvsyWQBm/+
         amyXU2ZCLv9kLcoZM9U+bDzinYURxYx60NkepsSvPCF8FW9vEn6Xaa2rdjjjraKk+Rbl
         LT/g==
X-Gm-Message-State: AOJu0Yw2a3/xZZeVd/mKNE/1BDOrmQcpdZ7abQhqYnPSSb9QtL16A3xu
	8hjwalZ6Fqs4B1BEeQz7l20=
X-Google-Smtp-Source: AGHT+IEbTWXqnS6pqxWsiTO7y9txYu3nwyDInKx5fND8GB0zHKszkEr00SZIdi7cH2zlataH173Zeg==
X-Received: by 2002:a2e:7c0a:0:b0:2c9:f564:b414 with SMTP id x10-20020a2e7c0a000000b002c9f564b414mr2095991ljc.24.1701772569144;
        Tue, 05 Dec 2023 02:36:09 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id s22-20020a2e98d6000000b002c9b899c449sm809872ljj.59.2023.12.05.02.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:08 -0800 (PST)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 04/16] net: pcs: xpcs: Explicitly return error on caps validation
Date: Tue,  5 Dec 2023 13:35:25 +0300
Message-ID: <20231205103559.9605-5-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231205103559.9605-1-fancer.lancer@gmail.com>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

If an unsupported interface is requested to be validated then there is no
need in further capabilities and-ing since the local array will be left
initialized with zeros. Let's explicitly return EINVAL error in that case
in order to inform the caller about invalid link-state interface. In any
case the phylink_validate_mac_and_pcs() would terminate with error further
link-state validation so the suggested update won't change the validation
procedure semantics.

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
2.42.1

