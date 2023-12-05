Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 736C88050C6
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 11:41:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UKtWyGET;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkxsG6dqmz3cnK
	for <lists+openbmc@lfdr.de>; Tue,  5 Dec 2023 21:41:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UKtWyGET;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Skxlg2tRnz3c3g
	for <openbmc@lists.ozlabs.org>; Tue,  5 Dec 2023 21:36:15 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c9f099cf3aso43246771fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 05 Dec 2023 02:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701772571; x=1702377371; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFMu8yHYAxfVLVvDj+B8IqaslSN1vZ5XWG3YsW0hTQA=;
        b=UKtWyGET3JjGcneD8x8K/af6VmXNNsNssOHKi+317nKdLz/mZiQluCfGbCTJlpYBaH
         ti6EkfCUkSO9tmVXMyIxfgBJjAX6TTy3g24RRcDK03J4ShGTnOLZZzf0pb7WN2mxvehZ
         X+7kJzYcMlsZ3Xmj0flWTFEtFN6huPJCu9EY9olqGl7CoTdn2QvCHea3pdlGL1DNwanC
         yHBZQ7CbLtRZZSJ0QdpJI4E7Z12z5JuAZwnAoej6ZPWYCEVwSi1fLuyzT2JDzxWtbL8d
         pSGJhA59pJsT/kuPtbmWWwP/dX8OTWhPodlUYe6LSJBLcpDrjaY1ioYQVdiBHDPCBtJv
         6D4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701772571; x=1702377371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dFMu8yHYAxfVLVvDj+B8IqaslSN1vZ5XWG3YsW0hTQA=;
        b=oTO3t/wU3XR/H7FLXiLyCkxfALX8ymdl2/uiFq1BxUuF01xkfsIJpsLiwxYomgizA5
         C+OErSFNtEwlqKczKeqmXzsgz7gaYrmMcbpLsZn7bhGue7infCYExC6+C73kwfmyL0VH
         Mn1P3kvKBsxP0hTP177KJmv1vkdAiLH0DEV8JsMQTC0Zpr9q94y10AoH7aqpqG3FlSES
         NfagB68PM1YmR0nAggmJ6inDO7H07htWQkafeETTrYKmzuxIJe78mMJD10nMKt7JbZaq
         f2/zeqNAwU6NJqg+DvsvsHwIgv6K8A5B+mskIXOvGIOzOsZbmMRM7+jHH74+Dtx11uDm
         0zgA==
X-Gm-Message-State: AOJu0YyXEP/uXvp8n1TglPkFQU/xW4xMrNn9MexIkxxSEw27and/tzb5
	G+hrLos9LruOcanD2ROA1/c=
X-Google-Smtp-Source: AGHT+IH0HyLEqm5MstBhJhll+ilWNbLcAbUlRzT66sgkeFhmYOZXWSY29xW02fWBkRMGmVcZxYa/xQ==
X-Received: by 2002:a2e:994c:0:b0:2c9:f3b6:522 with SMTP id r12-20020a2e994c000000b002c9f3b60522mr2596361ljj.57.1701772571048;
        Tue, 05 Dec 2023 02:36:11 -0800 (PST)
Received: from localhost ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id l21-20020a2e3e15000000b002ca0689190fsm548139lja.31.2023.12.05.02.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 02:36:10 -0800 (PST)
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
Subject: [PATCH net-next 05/16] net: pcs: xpcs: Move native device ID macro to linux/pcs/pcs-xpcs.h
Date: Tue,  5 Dec 2023 13:35:26 +0300
Message-ID: <20231205103559.9605-6-fancer.lancer@gmail.com>
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

Generic MDIO-device driver will support setting a custom device ID for the
particular MDIO-device. Generic DW XPCS ID can be used for that as well
just in case if the DW XPCS-device was erroneously synthesized with no or
some undefined ID. In addition to that having all supported DW XPCS device
IDs defined in a sinle place will improve the code maintainability and
readability.

Note while at it rename the macros to be shorter and looking alike to the
already defined NXP XPCS ID macro.

Signed-off-by: Serge Semin <fancer.lancer@gmail.com>
---
 drivers/net/pcs/pcs-xpcs.c   | 8 ++++----
 drivers/net/pcs/pcs-xpcs.h   | 3 ---
 include/linux/pcs/pcs-xpcs.h | 2 ++
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
index 46afeb5510c0..2850122f354a 100644
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
2.42.1

