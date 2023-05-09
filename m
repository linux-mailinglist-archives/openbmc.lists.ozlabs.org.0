Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D317043D5
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1P65pkQz3fHF
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:07:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GsClSg+9;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GsClSg+9;
	dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFx0r6H35z3c8f
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:35:24 +1000 (AEST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so6375233e87.0
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632121; x=1686224121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zWM9Ku4QEF1MXGuje7rt5LFZjeiu0mnfAywbxjklTg=;
        b=GsClSg+96jqtWjYLPTKM5pAJI4Eo2Ah8uaXlBAjQknewgiD5RpDgLbDOeUHrrdfrQj
         WuJ0Y6pxTynTReP5smOZrhhjFAN7AVjy0gOR/IKJNhvNZClw6ASSuIfokJ9+WvofxOfM
         9aiSdbQK+suvq1C0Pe2xoy/YOi1G5c2WKReuwgQnwIZzkeM7IQe3cyRksKtFDaOGZUtP
         8DIdgFxhvFepNFy7jRPo+Ql7m1jw76sq13DjFpna9nCCeyHhYRiio1PUxHCQV5R1mK0y
         BKnop1iVJlY7vVgXY4M91QeAEczd+kz22dym4iKCDv7/g5OAC4QJ0cZ1hyOiQUyv/PPn
         emdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632121; x=1686224121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zWM9Ku4QEF1MXGuje7rt5LFZjeiu0mnfAywbxjklTg=;
        b=Ss3TPQNaAuP+Ti7rrdkolx8QM1B8FWML7kJyBtC2UF2qkZX7LuhUCKUy8tbvl2kRkS
         EE5L2DvkPG7uEWMnSwMJcE5dPp/iECcLmp4IVKRzfdoQEUKW7FbAMJCe0KRXsnFymhMR
         CWn2CQCzBhL2noy1q1kwEiUhzzmBZVbC39kkObLmR+tPQFxPNQbR1JmjFgN2hSt51iDS
         y7ndHauGS6FaGbRIJp0eeQYrzlwa2lfr8xM+/lDsjkbYuWMty7dZUjhY0IkaANyx/O+1
         j7CYuBczpCZVJHDlqw0dFI03/wolyBxjQflVF31n3UVC0Js6ikIPuQI6A1sVWlS7pCA0
         TSKA==
X-Gm-Message-State: AC+VfDw+Bv64yD14oxqJ6ENUmnnlXIetZbMOK3J8uLp6HlT0b+M0vkKm
	NVboj2bfKT1PdZHwXBlj1UM=
X-Google-Smtp-Source: ACHHUZ4rSmlvz0jORkDZiqRrHk7JyLuRrDC5VraFbgQQXsHmS+H1SxrFJ8w8Mx2ICmrN1/BOlrRVRQ==
X-Received: by 2002:ac2:46f8:0:b0:4ef:fe49:e14f with SMTP id q24-20020ac246f8000000b004effe49e14fmr647454lfo.20.1683632121311;
        Tue, 09 May 2023 04:35:21 -0700 (PDT)
Received: from localhost.localdomain (93-80-66-133.broadband.corbina.ru. [93.80.66.133])
        by smtp.googlemail.com with ESMTPSA id k16-20020ac24570000000b004f25ccac240sm108940lfm.74.2023.05.09.04.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:35:21 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 4/5] net/ncsi: add shift MAC address property
Date: Tue,  9 May 2023 14:35:03 +0000
Message-Id: <20230509143504.30382-5-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509143504.30382-1-fr0st61te@gmail.com>
References: <20230509143504.30382-1-fr0st61te@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 May 2023 13:02:57 +1000
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Ivan Mikhaylov <fr0st61te@gmail.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Add the shift MAC address property for GMA command which provides which
shift should be used but keep old one values for backward compatability.

Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 net/ncsi/ncsi-rsp.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 069c2659074b..1f108db34d85 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -9,6 +9,8 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/skbuff.h>
+#include <linux/platform_device.h>
+#include <linux/of.h>
 
 #include <net/ncsi.h>
 #include <net/net_namespace.h>
@@ -616,9 +618,12 @@ static int ncsi_rsp_handler_oem_gma(struct ncsi_request *nr, int mfr_id)
 {
 	struct ncsi_dev_priv *ndp = nr->ndp;
 	struct net_device *ndev = ndp->ndev.dev;
+	struct platform_device *pdev;
 	struct ncsi_rsp_oem_pkt *rsp;
 	struct sockaddr saddr;
 	u32 mac_addr_off = 0;
+	s32 shift_mac_addr = 0;
+	u64 mac_addr;
 	int ret = 0;
 
 	/* Get the response header */
@@ -635,7 +640,17 @@ static int ncsi_rsp_handler_oem_gma(struct ncsi_request *nr, int mfr_id)
 
 	memcpy(saddr.sa_data, &rsp->data[mac_addr_off], ETH_ALEN);
 	if (mfr_id == NCSI_OEM_MFR_BCM_ID || mfr_id == NCSI_OEM_MFR_INTEL_ID)
-		eth_addr_inc((u8 *)saddr.sa_data);
+		shift_mac_addr = 1;
+
+	pdev = to_platform_device(ndev->dev.parent);
+	if (pdev)
+		of_property_read_s32(pdev->dev.of_node,
+				     "mac-address-increment", &shift_mac_addr);
+
+	/* Increase mac address by shift value for BMC's address */
+	mac_addr = ether_addr_to_u64((u8 *)saddr.sa_data);
+	mac_addr += shift_mac_addr;
+	u64_to_ether_addr(mac_addr, (u8 *)saddr.sa_data);
 	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
 		return -ENXIO;
 
-- 
2.40.1

