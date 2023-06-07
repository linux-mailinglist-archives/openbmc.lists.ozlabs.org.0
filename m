Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 837B57263FD
	for <lists+openbmc@lfdr.de>; Wed,  7 Jun 2023 17:18:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbrZs1y7Gz3dwL
	for <lists+openbmc@lfdr.de>; Thu,  8 Jun 2023 01:18:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KrwvjCyi;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=KrwvjCyi;
	dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbrZG04tyz3dsC
	for <openbmc@lists.ozlabs.org>; Thu,  8 Jun 2023 01:17:56 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b1fe3a1a73so10759861fa.1
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jun 2023 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686151073; x=1688743073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8z7m82/KC/ogG5KfzFtCE/IZsx2I1+lo+fvkMs3lVI=;
        b=KrwvjCyiuKy8NElczUTdWM72YCTiuNzc2TfkZIhtCx9OpD58l6lBL7PfxF0+3gUyn5
         EAimbPNqcKNRR9Ap/k9H1sPF3+vdNwcdaySGuch3nwmMkAXBhMy7JbQGIsL7+1jEQQDf
         wB/w286Yp0Am7V40DuFH1QFFRE2/B7CxS/2DQtKZLil7CKWULxUZNAxtVRRav5UNZgVs
         OlQ49nCEou+8ftugLgkCdfm09Pmg6J5bgYMJaprDysYEFhcD5sc7ToZjY1VO0u5FbKTh
         uE1q/yQZr86BRZuKLrSemZJ6dmv6zTnjQhymVYHWp+q3gsx1qZH38TWicV2pn277yYRT
         Jawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686151073; x=1688743073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8z7m82/KC/ogG5KfzFtCE/IZsx2I1+lo+fvkMs3lVI=;
        b=KvNNCH209x0BlgA20917Oz1nXRjY4K6AN1YHEXeYd1vLT0Vz7q7+/v/EvN1/I8qelt
         KJg5ipB6QC0XnMFiKv/q/URt6jY3vbNsc3oOPPpgIFEBWBlFg2WZGq2I7nrcSu+hkn92
         h5LoC+nLrXqgU9FBMsFrLqZYr5Ot0rs/b24ifEVIlle65wNThS4Z82IOxhiSpLGEg4AP
         GzQ97zeWZmr03WxIqVRmDq7S9OZNCFgnoDpWT9AUmqwUIXTt9PwknjcsEh5G9YwMZ1aS
         Y5ehsyKzH40Z9C1CcP0RK9Ona28ivILsXqwIIVyJVqAGnFT8ExjNPDnbT2V0FVp6bbc1
         WnYA==
X-Gm-Message-State: AC+VfDyxMRtI3br7a3GwSSzxzbZfu5KdMzQbgLWO++5SNQjyEpn8yPML
	hb4SqzxuZ68W2D1KwSmfjZU=
X-Google-Smtp-Source: ACHHUZ6QGxxYUzCRHlhXMM8I3iHl94QfBfhqNXsd+jEeJhRo7X1ZrG+LPXO6l6uY8qCfI8JWJpPyAg==
X-Received: by 2002:a2e:9c55:0:b0:2ac:78d5:fd60 with SMTP id t21-20020a2e9c55000000b002ac78d5fd60mr2388472ljj.9.1686151072769;
        Wed, 07 Jun 2023 08:17:52 -0700 (PDT)
Received: from localhost.localdomain (95-31-191-227.broadband.corbina.ru. [95.31.191.227])
        by smtp.googlemail.com with ESMTPSA id v5-20020a2e87c5000000b002ad9a1bfa8esm2302014ljj.1.2023.06.07.08.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:17:52 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vijay Khemka <vijaykhemka@fb.com>
Subject: [PATCH v3 2/2] net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
Date: Wed,  7 Jun 2023 18:17:42 +0300
Message-Id: <20230607151742.6699-3-fr0st61te@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607151742.6699-1-fr0st61te@gmail.com>
References: <20230607151742.6699-1-fr0st61te@gmail.com>
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
Cc: Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change ndo_set_mac_address to dev_set_mac_address because
dev_set_mac_address provides a way to notify network layer about MAC
change. In other case, services may not aware about MAC change and keep
using old one which set from network adapter driver.

As example, DHCP client from systemd do not update MAC address without
notification from net subsystem which leads to the problem with acquiring
the right address from DHCP server.

Fixes: cb10c7c0dfd9e ("net/ncsi: Add NCSI Broadcom OEM command")
Cc: stable@vger.kernel.org # v6.0+ 2f38e84 net/ncsi: make one oem_gma function for all mfr id
Signed-off-by: Paul Fertser <fercerpav@gmail.com>
Signed-off-by: Ivan Mikhaylov <fr0st61te@gmail.com>
---
 net/ncsi/ncsi-rsp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 91c42253a711..069c2659074b 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -616,7 +616,6 @@ static int ncsi_rsp_handler_oem_gma(struct ncsi_request *nr, int mfr_id)
 {
 	struct ncsi_dev_priv *ndp = nr->ndp;
 	struct net_device *ndev = ndp->ndev.dev;
-	const struct net_device_ops *ops = ndev->netdev_ops;
 	struct ncsi_rsp_oem_pkt *rsp;
 	struct sockaddr saddr;
 	u32 mac_addr_off = 0;
@@ -643,7 +642,9 @@ static int ncsi_rsp_handler_oem_gma(struct ncsi_request *nr, int mfr_id)
 	/* Set the flag for GMA command which should only be called once */
 	ndp->gma_flag = 1;
 
-	ret = ops->ndo_set_mac_address(ndev, &saddr);
+	rtnl_lock();
+	ret = dev_set_mac_address(ndev, &saddr, NULL);
+	rtnl_unlock();
 	if (ret < 0)
 		netdev_warn(ndev, "NCSI: 'Writing mac address to device failed\n");
 
-- 
2.40.1

