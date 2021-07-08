Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D923BFA1E
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 14:28:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GLFvP2ttmz30Pq
	for <lists+openbmc@lfdr.de>; Thu,  8 Jul 2021 22:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=t7Jwd2X0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=t7Jwd2X0; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GLFtk1F9Nz300S
 for <openbmc@lists.ozlabs.org>; Thu,  8 Jul 2021 22:27:57 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3051F49E44;
 Thu,  8 Jul 2021 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:date:subject
 :subject:from:from:received:received:received; s=mta-01; t=
 1625747273; x=1627561674; bh=vK96Sc7MNGUkW8R4Eq+yIewGLHOFKMnjDyv
 qwGbS51s=; b=t7Jwd2X0qcTmF6cEfkt+UCjbb6s4kg16gqeDEe9e1BeWzKutVR4
 frTxLgvoFAhWvUEu1Vx7XbGWlEfQvWXjAY0Qn1c7a+ED6JbBA8e+FvvWLJoN3JzE
 42nZ02t515wPkjxfBpVViN0xrY/s/B26Fy1rYxOyH4nL0jO37Z10EDbM=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2flJR5XKGTo4; Thu,  8 Jul 2021 15:27:53 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0089D49F48;
 Thu,  8 Jul 2021 15:18:27 +0300 (MSK)
Received: from fedora.mshome.net (10.199.0.196) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 8 Jul
 2021 15:18:25 +0300
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Subject: [PATCH v2 1/3] net/ncsi: fix restricted cast warning of sparse
Date: Thu, 8 Jul 2021 15:27:52 +0300
Message-ID: <20210708122754.555846-2-i.mikhaylov@yadro.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210708122754.555846-1-i.mikhaylov@yadro.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.199.0.196]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Ivan Mikhaylov <i.mikhaylov@yadro.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Sparse reports:
net/ncsi/ncsi-rsp.c:406:24: warning: cast to restricted __be32
net/ncsi/ncsi-manage.c:732:33: warning: cast to restricted __be32
net/ncsi/ncsi-manage.c:756:25: warning: cast to restricted __be32
net/ncsi/ncsi-manage.c:779:25: warning: cast to restricted __be32

Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
---
 net/ncsi/ncsi-manage.c | 6 +++---
 net/ncsi/ncsi-rsp.c    | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
index ca04b6df1341..42b54a3da2e6 100644
--- a/net/ncsi/ncsi-manage.c
+++ b/net/ncsi/ncsi-manage.c
@@ -700,7 +700,7 @@ static int ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg *nca)
 	nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
 
 	memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
-	*(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
+	*(unsigned int *)data = ntohl((__force __be32)NCSI_OEM_MFR_BCM_ID);
 	data[5] = NCSI_OEM_BCM_CMD_GMA;
 
 	nca->data = data;
@@ -724,7 +724,7 @@ static int ncsi_oem_gma_handler_mlx(struct ncsi_cmd_arg *nca)
 	nca->payload = NCSI_OEM_MLX_CMD_GMA_LEN;
 
 	memset(&u, 0, sizeof(u));
-	u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
+	u.data_u32[0] = ntohl((__force __be32)NCSI_OEM_MFR_MLX_ID);
 	u.data_u8[5] = NCSI_OEM_MLX_CMD_GMA;
 	u.data_u8[6] = NCSI_OEM_MLX_CMD_GMA_PARAM;
 
@@ -747,7 +747,7 @@ static int ncsi_oem_smaf_mlx(struct ncsi_cmd_arg *nca)
 	int ret = 0;
 
 	memset(&u, 0, sizeof(u));
-	u.data_u32[0] = ntohl(NCSI_OEM_MFR_MLX_ID);
+	u.data_u32[0] = ntohl((__force __be32)NCSI_OEM_MFR_MLX_ID);
 	u.data_u8[5] = NCSI_OEM_MLX_CMD_SMAF;
 	u.data_u8[6] = NCSI_OEM_MLX_CMD_SMAF_PARAM;
 	memcpy(&u.data_u8[MLX_SMAF_MAC_ADDR_OFFSET],
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 888ccc2d4e34..04bc50be5c01 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -403,7 +403,7 @@ static int ncsi_rsp_handler_ev(struct ncsi_request *nr)
 	/* Update to VLAN mode */
 	cmd = (struct ncsi_cmd_ev_pkt *)skb_network_header(nr->cmd);
 	ncm->enable = 1;
-	ncm->data[0] = ntohl(cmd->mode);
+	ncm->data[0] = ntohl((__force __be32)cmd->mode);
 
 	return 0;
 }
-- 
2.31.1

