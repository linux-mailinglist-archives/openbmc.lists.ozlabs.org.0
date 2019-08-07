Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662583E3E
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 02:21:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463ByY0CjGzDr4M
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 10:21:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=31220e4898=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="fRpmoOPe"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Bxy3LwSzDqvd
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 10:21:24 +1000 (AEST)
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7707rqQ007591
 for <openbmc@lists.ozlabs.org>; Tue, 6 Aug 2019 17:21:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=he/2Z0ENIriYPhFo9YJ+fTiLFe2HN0KKpsDTYLP2IlE=;
 b=fRpmoOPe2fDK3434gxhp9ipnXgFCXPsxdQKdWA3RTYtIfXvtsXpx9MCVgiQS5zglI30K
 etZS05UrYZpXprpa9IbXeew6qgWV4bLoZFdy+0aLQEuOtOTpU6viCZUqAZh8vC8O+y1r
 qiJ75OwnA4rWw3VKs+NXFo8cDdxWyORuQc8= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u7dfs1jh2-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Aug 2019 17:21:22 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::127) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Tue, 6 Aug 2019 17:21:21 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id 8FFE818C66019; Tue,  6 Aug 2019 17:21:19 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, "David S . Miller"
 <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>, William
 Kennington <wak@google.com>, Joel Stanley <joel@jms.id.au>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net-next] net/ncsi: allow to customize BMC MAC Address offset
Date: Tue, 6 Aug 2019 17:21:18 -0700
Message-ID: <20190807002118.164360-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=673 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908070000
X-FB-Internal: deliver
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
Cc: Tao Ren <taoren@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Currently BMC's MAC address is calculated by adding 1 to NCSI NIC's base
MAC address when CONFIG_NCSI_OEM_CMD_GET_MAC option is enabled. The logic
doesn't work for platforms with different BMC MAC offset: for example,
Facebook Yamp BMC's MAC address is calculated by adding 2 to NIC's base
MAC address ("BaseMAC + 1" is reserved for Host use).

This patch adds NET_NCSI_MC_MAC_OFFSET config option to customize offset
between NIC's Base MAC address and BMC's MAC address. Its default value is
set to 1 to avoid breaking existing users.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 net/ncsi/Kconfig    |  8 ++++++++
 net/ncsi/ncsi-rsp.c | 15 +++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/net/ncsi/Kconfig b/net/ncsi/Kconfig
index 2f1e5756c03a..be8efe1ed99e 100644
--- a/net/ncsi/Kconfig
+++ b/net/ncsi/Kconfig
@@ -17,3 +17,11 @@ config NCSI_OEM_CMD_GET_MAC
 	---help---
 	  This allows to get MAC address from NCSI firmware and set them back to
 		controller.
+config NET_NCSI_MC_MAC_OFFSET
+	int
+	prompt "Offset of Management Controller's MAC Address"
+	depends on NCSI_OEM_CMD_GET_MAC
+	default 1
+	help
+	  This defines the offset between Network Controller's (base) MAC
+	  address and Management Controller's MAC address.
diff --git a/net/ncsi/ncsi-rsp.c b/net/ncsi/ncsi-rsp.c
index 7581bf919885..24a791f9ebf5 100644
--- a/net/ncsi/ncsi-rsp.c
+++ b/net/ncsi/ncsi-rsp.c
@@ -656,6 +656,11 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	struct ncsi_rsp_oem_pkt *rsp;
 	struct sockaddr saddr;
 	int ret = 0;
+#ifdef CONFIG_NET_NCSI_MC_MAC_OFFSET
+	int mac_offset = CONFIG_NET_NCSI_MC_MAC_OFFSET;
+#else
+	int mac_offset = 1;
+#endif
 
 	/* Get the response header */
 	rsp = (struct ncsi_rsp_oem_pkt *)skb_network_header(nr->rsp);
@@ -663,8 +668,14 @@ static int ncsi_rsp_handler_oem_bcm_gma(struct ncsi_request *nr)
 	saddr.sa_family = ndev->type;
 	ndev->priv_flags |= IFF_LIVE_ADDR_CHANGE;
 	memcpy(saddr.sa_data, &rsp->data[BCM_MAC_ADDR_OFFSET], ETH_ALEN);
-	/* Increase mac address by 1 for BMC's address */
-	eth_addr_inc((u8 *)saddr.sa_data);
+
+	/* Management Controller's MAC address is calculated by adding
+	 * the offset to Network Controller's (base) MAC address.
+	 * Note: negative offset is "ignored", and BMC will use the Base
+	 * MAC address in this case.
+	 */
+	while (mac_offset-- > 0)
+		eth_addr_inc((u8 *)saddr.sa_data);
 	if (!is_valid_ether_addr((const u8 *)saddr.sa_data))
 		return -ENXIO;
 
-- 
2.17.1

