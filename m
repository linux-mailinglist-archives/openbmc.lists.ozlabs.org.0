Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD691E785
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2024 20:31:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BfcJfUXN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCZP071p4z3fTl
	for <lists+openbmc@lfdr.de>; Tue,  2 Jul 2024 04:31:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BfcJfUXN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCZM72rFTz3cR1
	for <openbmc@lists.ozlabs.org>; Tue,  2 Jul 2024 04:29:23 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52cdb0d816bso3317194e87.1
        for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2024 11:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719858559; x=1720463359; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJ6aCZ+zqC/bzroX6nSJ0EOSQTXAboCcbqfSGo7u8OA=;
        b=BfcJfUXNHwdWVkeziAl/hodA7RFsc+qolRY2/b/QAwEwBE0C7yQltXz7+PoatNzcOI
         TAyv/p3eFO2Za1QPDfcZS2ENuK5dYHQGPlsnT+hIu8AvJXHZpb/LipGv4nlezHhqX5va
         FOoCHMKpEm+rhLdbPEs1KPBK4uyIBlir1SQIRNtafudRi9iTaL7eGQDCuOAozLcVxYeg
         xvhOhz/RAUdn9ouA4ne2WgLuocBm9HkYHQJOSf8qSjsYiN5qWilXGozYwqR6qjP8QtFY
         XccDf/+w1xSrnUL7Emo8FzNFs63JVyPqnI3Ahvh4Kp1onkI2SQCLyPd+xHkhc2KEwaaL
         vuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719858559; x=1720463359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJ6aCZ+zqC/bzroX6nSJ0EOSQTXAboCcbqfSGo7u8OA=;
        b=Ql+aLTVFuLjz6exn5hUCBEJBJdGMAqwg6J+5odw6o3HZFn3JyaEKwdtD4L8YZL+Jot
         ilILEkAwZqJOFpzaeC08xfTrVhHioX1VXGYgy9MoIC5upVLbI4fT7tzEYyIURXhhraDP
         TRUYWBHWqLthNkSdtjG+zA+PbvNU19Sq0LJLDIlCiF12ytf+OqJVzohxIPbryEoPWwoW
         rNGNKDPRrdPD7hHqbvI33b1aHEcxFGOdCI2MObEXM8sS65DRdMiiPx+dt8AEcxRygnmY
         dK27FgE0KUQdmzIHhLTobFgPs4B4aW+zcEFjdZZAgx1Vs//HGzUaL1tlXXLrbefcKNw1
         VFCA==
X-Forwarded-Encrypted: i=1; AJvYcCViUgYyqxKZNQ9c1eR9ir0IWJQNDwgmKRY98R2vzK+dePce9CxItx8tGK8brEPulWMNjblXtEHSoZFFjsYAQWXdGnJAN+gwtNo=
X-Gm-Message-State: AOJu0YwMuY6RCfprMVeRegnU8nLC2c1DqOTFjYS9cCxvpMHL/gijdBD+
	7VOHiQlLJEnWP0uTr+uTEl29PQuNugkk4DG2CoouvvaYvxZh/TdH
X-Google-Smtp-Source: AGHT+IFLXQ1G/8tFNvYxI7EXzXU18ZbNW2pwP6myGFGGsl8sAi9kR+tdHtHLzDyd4+qqc+EqkLVjkw==
X-Received: by 2002:a05:6512:3d88:b0:52c:89b3:6d74 with SMTP id 2adb3069b0e04-52e7b8df4c4mr3115552e87.6.1719858557253;
        Mon, 01 Jul 2024 11:29:17 -0700 (PDT)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52e7ab0b809sm1528753e87.37.2024.07.01.11.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:29:16 -0700 (PDT)
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
Subject: [PATCH net-next v4 01/10] net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
Date: Mon,  1 Jul 2024 21:28:32 +0300
Message-ID: <20240701182900.13402-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240701182900.13402-1-fancer.lancer@gmail.com>
References: <20240701182900.13402-1-fancer.lancer@gmail.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>

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

