Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C098A8D7645
	for <lists+openbmc@lfdr.de>; Sun,  2 Jun 2024 16:37:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ipP4Yr8W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VsfZp0j5Zz3cTd
	for <lists+openbmc@lfdr.de>; Mon,  3 Jun 2024 00:37:22 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ipP4Yr8W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VsfZC4sQGz3bdV
	for <openbmc@lists.ozlabs.org>; Mon,  3 Jun 2024 00:36:50 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2eaafda3b5cso2107141fa.3
        for <openbmc@lists.ozlabs.org>; Sun, 02 Jun 2024 07:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717339003; x=1717943803; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=riZO9gpWg+72DwRvoZciAprxyAK6Sq4iImVOkfuj2k8=;
        b=ipP4Yr8WMU5+QP3+7c2dCnKS0gu60/D5dubceobb19dnM3wM2A1BTzsDj3j+OP1KUS
         dJeH5oMid661hyyq9necO6T/jPwH3yxaV3R+KzkKdYqxOg5K5P+zniMgeCT3k4ZqOsF6
         1nIr78rD7LE/kjgHdyTZwtarDZUVoOiVBKldGOolxHBvOUXOwDCT9ZQ6PX0xeMVFMJgz
         pRp3IMOqeNHG/nRKjFuMEnmUTZaTvm2ygiKCYDo8bOJyShLT485uCm1T5ZJzgxSGI/FQ
         KuNudYyPCESzmjHu2cZb3GkA8MnZKhW27vNyWSVxUkfwSDXLZH8B7a1m5dRjwsGDfSJ2
         6tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717339003; x=1717943803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riZO9gpWg+72DwRvoZciAprxyAK6Sq4iImVOkfuj2k8=;
        b=HVtbFISc03T6tbAiaYwrI9zc6vLbWfZaEvV0DDMyNgbzE9GpBtafrC7nbGH30FQ0+x
         QKnNGkhIwAk5nAYJqaVcAJ9egSLbdvRoBeZJPtL1F6SHZUzPnJD1jQe997sPMOubHh8D
         YXjn9EkjP9N4pYSXMM7348c/E3VeK8Et4NJQ+XM3YvSSY+fq8G2i/iyzF4YeGNd3+UPP
         NxnFZVaYQEt/CYhPgES37HS6mAsszu4OIljgVwe/sV5Ui1z1n/Z/mG5rY3IWXE4CpzUO
         3FB8Lni9k/9of+N9TYXv6XAs0I9tDswHgWS1e4AmnIsach3En/OKT+87LtiHYMBJRwO4
         +AGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxuEisAHRIFlZOTHYgLjsFx1r97C1wcIUx4/cAKue3d5pT9k/lZw3mk2ZJ2VmtM12bKm3OZhTlA1lNSLna6uLq+44M0BdnFf8=
X-Gm-Message-State: AOJu0YxtbiNkBs7Ybj5aLF98sX8tINJicP4J5GtO+Y9cmHWA3Ew3AJHh
	RLhRyoAaG92Fo+hkpYApr6wVNXViQxztIg+kT96Mi1O8sokG0hnQ
X-Google-Smtp-Source: AGHT+IG/nqO6KddNLN4fpmEQxGgs5n8RHQTH8IjsI3YbjSKU5j1KmcjSR/VTeLrOiH7DXm32Jlu6Mw==
X-Received: by 2002:a2e:9141:0:b0:2e5:1dae:1789 with SMTP id 38308e7fff4ca-2ea9512f6d0mr48251181fa.22.1717339002935;
        Sun, 02 Jun 2024 07:36:42 -0700 (PDT)
Received: from localhost ([178.178.142.64])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cefc4fsm9282471fa.118.2024.06.02.07.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 07:36:42 -0700 (PDT)
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
Subject: [PATCH net-next v2 01/10] net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
Date: Sun,  2 Jun 2024 17:36:15 +0300
Message-ID: <20240602143636.5839-2-fancer.lancer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240602143636.5839-1-fancer.lancer@gmail.com>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
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

