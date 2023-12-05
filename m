Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E988050A9
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:39:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPuRqTBy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxqF1NT1z3d9B
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:39:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gPuRqTBy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::130; helo=mail-lf1-x130.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxld5hqDz3c5j
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:12 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50c0bd61d21so399452e87.3
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772567; x=1702377367; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U54qqy6N0N2c+9OxOcQWdVdaen6MX6mbtv2CDF+JdLE=;
        b=gPuRqTBy/OcSJGQjJZ+YlscJeP/lzhFAIxXV4xMplKhophzd05Q4YH6swgARwi0n99
         VU7emxMVVidJtIpCJBshUn0r6DE3YdcTYSISL92F4r+OYlcPVsDv8inG/vCOoZt695Hv
         VSLTZaX6emPaHUZmMECPmw65yNT7L9K52Md5RKxcrtKv4VEMvIUgyD6q7jL9T3KOcyIE
         SnpSdqqZFf1/jCLwEXSEHq15pY32ZdaWD7u6i6gEgYwcsFVJTzMqkcQng0a9yEs803Et
         rzIatVWHWqoB9NySXVrehkrevUBdWhj2kMf5aUTmLg6z0SNvZkzLY5XdrE61D4LJDsHm
         T/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772567; x=1702377367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U54qqy6N0N2c+9OxOcQWdVdaen6MX6mbtv2CDF+JdLE=;
        b=Ethn5gy6WSHTRqHGCtHd7IxQVIz1FcNb0XY03AFR3s81dgpZp/cJ6QPnreScyv27Ky
         rzeQ0rj1gqI7KHG8ZozGeREYppeR7bZkqZBJ5rXyLJNsL7FwscITQD/Y1H0UV4a7CW47
         h3pi/0MyZ2ZdV3lsBGaOX6yfX0KVin20tAWFnoBrgDrkLCWujwIKHCAkeogPbKtOK9Es
         GS2dYMthaMrdphNsB1AYcWh2/mpCCToqxpH0gWPrh820ggYWuzI0Gx9hSUG39EL0XybH
         QdG8TCEdH6yUCWBiBCWPuQQzepOW1R3PQypmWMQlDTdY6bKujKyp/2EYbprW5/i77LQH
         nn9g==
X-Gm-Message-State: AOJu0Yxv4VD7Vba9MkIy4Aeq1JFZOxlZCFUuP8y6LK2Essw4ilJTXouy
	iNyLVsJVcFj1nyHTVyQwQe8=
X-Google-Smtp-Source: AGHT+IFEi6gEzVmRxQZn6LenJ7+2db8n7eaJ31ccEDBnMQFSlfYTfUEXX/pYGky6DeUkP1qWbJfG3g==
X-Received: by 2002:a05:6512:e89:b0:50b:e384:2c5c with SMTP id bi9-20020a0565120e8900b0050be3842c5cmr3164864lfb.136.1701772567319;
        Tue, 05 Dec 2023 02:36:07 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id d10-20020ac241ca000000b0050be6252444sm991214lfi.133.2023.12.05.02.36.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:06 -0800 (PST)
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
Subject: [PATCH net-next 03/16] net: pcs: xpcs: Return EINVAL in the internal methods
Date: Tue,  5 Dec 2023 13:35:24 +0300
Message-ID: <20231205103559.9605-4-fancer.lancer@gmail.com>
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

In particular the xpcs_soft_reset() and xpcs_do_config() functions
currently return -1 if invalid auto-negotiation mode is specified. That
value can be then passed to the generic kernel subsystems which require a
standard kernel errno value. Even though the error conditions are very
specific (memory corruption or buggy implementation) using a hard-coded -1
literal doesn't seem correct anyway.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
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
2.42.1

