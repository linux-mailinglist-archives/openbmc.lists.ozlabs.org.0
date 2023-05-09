Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C657043D3
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 05:05:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QL1M221tgz3fBP
	for <lists+openbmc@lfdr.de>; Tue, 16 May 2023 13:05:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iw0rSsRo;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=fr0st61te@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=iw0rSsRo;
	dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFx0p6tHPz3cLT
	for <openbmc@lists.ozlabs.org>; Tue,  9 May 2023 21:35:22 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so6467660e87.1
        for <openbmc@lists.ozlabs.org>; Tue, 09 May 2023 04:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683632119; x=1686224119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbkI5NmwcrpI7Tje+0YGtVpuM20p51DDt0R9mEUMkGo=;
        b=iw0rSsRolEB5fcb1p+xNJhOEdDLAJa+ATnHCa0O+77TWWDGr1x5ufaNs08BChkoQ7K
         udgVvcX8F+R0B4ebCJ7cW/focSGQS71wUJnkipeT1bX/Dmec/pE8n0UazwgSEHM9ZRif
         omj3c0fwoBOb5oGvNVMACVBpWIpW8j29jEsHka/8ortL4cXCwl7tMrKTbVfE6brnBu4L
         2AVxfipHGS57Q9OXuuUOxMIbmiMiB8c0zGTtsvi1CQTxVdNjaaWn0mU9LaGURYcMa/yA
         EK25ji2YBaZSGG27mArhQGyHIxXX0yl53DIFefFZee1flg6Rp9MMHLKUwiWBW8OczDvN
         THTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683632119; x=1686224119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbkI5NmwcrpI7Tje+0YGtVpuM20p51DDt0R9mEUMkGo=;
        b=LQGKak3xz44ap/N4sGfo+y1uxOFTKQ2iyY9Id6+R+KmgURrYpxGwQPL0hLM9bNBviD
         YHZS5/+UgReaqckjDBMmWItVSbgiUmESSwlNSom7/b62ad+22Hq1RAbfSRURG2lKgCSz
         ZunBzFt9N7y8egTYB1gXtdhYCJnD903/cBH6ptFZ/493KCkEWUe3Nm2uKL26x66mbJuc
         qLxfDBzr1Xdp1Igm14kmg6yODmrLr42JB+NVDCksFAbUoQV+D6FP7L5IGqRwoW/bjSbx
         QBgVvLbBOXrp5TXfJPxBFUmYDFNhFNuFT3F1oEi1OVjnKfQwK0RGCSD86pGB1g2QaYny
         FRaw==
X-Gm-Message-State: AC+VfDxfl5WWNJEqSrADVLY6WCKBJRjjMlHaCw28WzwOg1C5brR6oCcG
	869LRqpMut5+YZEaQhrzfIw=
X-Google-Smtp-Source: ACHHUZ7SGF4LClRs/QE8T9m+zaDb2DYiF6XKALpXn5c53WZ7SBsib2YNkQAZnuDJ6RG/0PZqo56rdg==
X-Received: by 2002:ac2:562f:0:b0:4f1:3d6c:d89b with SMTP id b15-20020ac2562f000000b004f13d6cd89bmr607190lff.42.1683632119511;
        Tue, 09 May 2023 04:35:19 -0700 (PDT)
Received: from localhost.localdomain (93-80-66-133.broadband.corbina.ru. [93.80.66.133])
        by smtp.googlemail.com with ESMTPSA id k16-20020ac24570000000b004f25ccac240sm108940lfm.74.2023.05.09.04.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 04:35:18 -0700 (PDT)
From: Ivan Mikhaylov <fr0st61te@gmail.com>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 2/5] net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
Date: Tue,  9 May 2023 14:35:01 +0000
Message-Id: <20230509143504.30382-3-fr0st61te@gmail.com>
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
Cc: devicetree@vger.kernel.org, Paul Fertser <fercerpav@gmail.com>, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Ivan Mikhaylov <fr0st61te@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Change ndo_set_mac_address to dev_set_mac_address because
dev_set_mac_address provides a way to notify network layer about MAC
change. In other case, services may not aware about MAC change and keep
using old one which set from network adapter driver.

As example, DHCP client from systemd do not update MAC address without
notification from net subsystem which leads to the problem with acquiring
the right address from DHCP server.

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

