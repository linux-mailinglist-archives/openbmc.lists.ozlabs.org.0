Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D5B919BE4
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 02:42:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e9FOqDr4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8fsw6xzgz3cb6
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 10:42:28 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e9FOqDr4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8fsN4Zv1z2ypm
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 10:42:00 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52cd80e55efso9975180e87.0
        for <openbmc@lists.ozlabs.org>; Wed, 26 Jun 2024 17:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719448917; x=1720053717; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riZO9gpWg+72DwRvoZciAprxyAK6Sq4iImVOkfuj2k8=;
        b=e9FOqDr4utrm2ReQr8feauescW9y+Mv/7WEpGIiouFeM3Z1pWLe6TLR48WcrJfAj7a
         63/bXlb/wta5QjBMRPabBIlMkoEm1nbQiXajYA5HpmBGFYpGhhLI47Mh5bBgRLBLpX4D
         aPI+fDJU5z5K4Wj6dZJ82Lngle8rLw+mKL1b8TxKu76cOewtUNyAn7MWo0TS5r/OYnwm
         uJEyr0IcKq7zb7ob/qj70E6DgY42ZvVPCg8biy64JdNafY0lGum+kJ7fYD61Wogojcta
         Akshv9zYCe+/qKi9rbjng72UDG/qQEr4NvjTgoCX1mxjWLEbgQi2jIO0G2/AVpShfN5v
         r3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719448917; x=1720053717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riZO9gpWg+72DwRvoZciAprxyAK6Sq4iImVOkfuj2k8=;
        b=nsQzgbgDPOi/fy9ncRE/lkWGjzTlMS2M/AlyhJ/qA4IXkgcPitc4gTbS6uO831cPVp
         Nw+JeeiRFd8pGrzkGDVvgFtxoie8m48W+jwYXbs/2eKe5XEDA5lzpFFXJriI7Kvv5SWV
         +ueSGAvYvP9ATWQtUyujMor1zCMNZ6D9BM3ERxPyZK7TygasXw8ROPF4+tuX5XuA85/b
         fOlb2Ud/BaUrp6LECgYBJUCqRRwxu8nZtK4yeLKP2wWeVWVS4H2QZzsrSoTwCQDKthbt
         LmL+Rw6UuXSQphXrXG/lajcJLmKEmC3jEONUDWtMzggTdNsJywOph0csjQBTn++FLFr+
         cpNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO1TaEFRvBddS6fUPTFcFegvBRHSLWQYFbFb9JwHHDdv2R86HKNL/Fw9wHGHMRolSAA7XFZq3OPKZslS4XDI/YAvge3Z8e0iw=
X-Gm-Message-State: AOJu0YxSzB7+Hbx9TubvSeC7gr//DfECCXzQoOOnkQOSmPBb2rrVMnfp
	v8FB/R4nyUgSTHJBv3E6hcV0zrj/JV3SBcDto2FQ0V+HhsZJ2g2l
X-Google-Smtp-Source: AGHT+IG9xWPw91sL+7geI8Yw5mhFbwzbfnCv10lu3eKdnkF87T5urspemd32cPB+C/RlkO+fzeL6Bw==
X-Received: by 2002:a05:6512:39ca:b0:521:cc8a:46dd with SMTP id 2adb3069b0e04-52ce182bcd5mr11611361e87.11.1719448915879;
        Wed, 26 Jun 2024 17:41:55 -0700 (PDT)
Received: from localhost ([89.113.147.248])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e712a7ba7sm20161e87.56.2024.06.26.17.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 17:41:55 -0700 (PDT)
From: Serge Semin <fancer.lancer@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v3 01/10] net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
Date: Thu, 27 Jun 2024 03:41:21 +0300
Message-ID: <20240627004142.8106-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627004142.8106-1-fancer.lancer@gmail.com>
References: <20240627004142.8106-1-fancer.lancer@gmail.com>
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>, Jiawen Wu <jiawenwu@trustnetic.com>, Abhishek Chauhan <quic_abchauha@quicinc.com>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, Andrew Halaney <ahalaney@redhat.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

One of the next commits will alter the DW XPCS driver to support setting a
custom device ID for the particular MDIO-device detected on the platform.
The generic DW XPCS ID can be used as a custom ID as well in case if the
DW XPCS-device was erroneously synthesized with no or some undefined ID.
In addition to that having all supported DW XPCS device IDs defined in a
single place will improve the code maintainability and readability.

Note while at it rename the macros to being shorter and looking alike to
the already defined NXP XPCS ID macro.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>

---

Changelog v2:
- Alter the commit log so one would refer to the DW XPCS driver change and
  would describe the change clearer. (@Russell)
- s/sinle/single (@Vladimir)
---
 drivers/net/pcs/pcs-xpcs.c   | 8 ++++----
 drivers/net/pcs/pcs-xpcs.h   | 3 ---
 include/linux/pcs/pcs-xpcs.h | 2 ++
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 31525fe9c32e..99adbf15ab36 100644
--- a/drivers/net/pcs/pcs-xpcs.c
+++ b/drivers/net/pcs/pcs-xpcs.c
@@ -1343,16 +1343,16 @@ static const struct xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] =
 
 static const struct xpcs_id xpcs_id_list[] = {
 	{
-		.id = SYNOPSYS_XPCS_ID,
-		.mask = SYNOPSYS_XPCS_MASK,
+		.id = DW_XPCS_ID,
+		.mask = DW_XPCS_ID_MASK,
 		.compat = synopsys_xpcs_compat,
 	}, {
 		.id = NXP_SJA1105_XPCS_ID,
-		.mask = SYNOPSYS_XPCS_MASK,
+		.mask = DW_XPCS_ID_MASK,
 		.compat = nxp_sja1105_xpcs_compat,
 	}, {
 		.id = NXP_SJA1110_XPCS_ID,
-		.mask = SYNOPSYS_XPCS_MASK,
+		.mask = DW_XPCS_ID_MASK,
 		.compat = nxp_sja1110_xpcs_compat,
 	},
 };
diff --git a/drivers/net/pcs/pcs-xpcs.h b/drivers/net/pcs/pcs-xpcs.h
index 96c36b32ca99..369e9196f45a 100644
--- a/drivers/net/pcs/pcs-xpcs.h
+++ b/drivers/net/pcs/pcs-xpcs.h
@@ -6,9 +6,6 @@
  * Author: Jose Abreu <Jose.Abreu@synopsys.com>
  */
 
-#define SYNOPSYS_XPCS_ID		0x7996ced0
-#define SYNOPSYS_XPCS_MASK		0xffffffff
-
 /* Vendor regs access */
 #define DW_VENDOR			BIT(15)
 
diff --git a/include/linux/pcs/pcs-xpcs.h b/include/linux/pcs/pcs-xpcs.h
index da3a6c30f6d2..8dfe90295f12 100644
--- a/include/linux/pcs/pcs-xpcs.h
+++ b/include/linux/pcs/pcs-xpcs.h
@@ -12,6 +12,8 @@
 
 #define NXP_SJA1105_XPCS_ID		0x00000010
 #define NXP_SJA1110_XPCS_ID		0x00000020
+#define DW_XPCS_ID			0x7996ced0
+#define DW_XPCS_ID_MASK			0xffffffff
 
 /* AN mode */
 #define DW_AN_C73			1
-- 
2.43.0

