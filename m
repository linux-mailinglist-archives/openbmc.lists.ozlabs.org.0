Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CC79D51
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 02:32:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yHYr4pHmzDqSn
	for <lists+openbmc@lfdr.de>; Tue, 30 Jul 2019 10:32:00 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.145.42; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=3114af11f6=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="MAgX4qlq"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com
 [67.231.145.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yHYC1vrkzDqPS
 for <openbmc@lists.ozlabs.org>; Tue, 30 Jul 2019 10:31:22 +1000 (AEST)
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6U0UAZj013040
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 17:31:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=4GY7F1vpqYxiKs4jmp928h1cbKPlrm/Nla4BNpcZ09E=;
 b=MAgX4qlqbzv6c7pjkSf8Cb3wwMNcTYsqq++0rtZZyOYgSBBBerdtql9i1qTYr5qQEcLq
 2OsMZhLeNjWdtZEwlRjiPP5qO10QpEifkbeROdXeC0J6NLcgxjsb8nrJxaYg/sVS/GLC
 7ghN7JzgbTmfp3TVExKNXwydxvRy6ALo5eI= 
Received: from mail.thefacebook.com (mailout.thefacebook.com [199.201.64.23])
 by mx0a-00082601.pphosted.com with ESMTP id 2u24pcj0jx-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Mon, 29 Jul 2019 17:31:18 -0700
Received: from mx-out.facebook.com (2620:10d:c081:10::13) by
 mail.thefacebook.com (2620:10d:c081:35::130) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5;
 Mon, 29 Jul 2019 17:31:17 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id D6271184F3652; Mon, 29 Jul 2019 17:25:42 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
 <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net-next 1/2] net: phy: broadcom: set features explicitly for
 BCM54616S
Date: Mon, 29 Jul 2019 17:25:32 -0700
Message-ID: <20190730002532.85509-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-29_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=735 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300002
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

BCM54616S feature "PHY_GBIT_FEATURES" was removed by commit dcdecdcfe1fc
("net: phy: switch drivers to use dynamic feature detection"). As dynamic
feature detection doesn't work when BCM54616S is working in RGMII-Fiber
mode (different sets of MII Control/Status registers being used), let's
set "PHY_GBIT_FEATURES" for BCM54616S explicitly.

Signed-off-by: Tao Ren <taoren@fb.com>
---
 drivers/net/phy/broadcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/broadcom.c b/drivers/net/phy/broadcom.c
index 937d0059e8ac..2b4e41a9d35a 100644
--- a/drivers/net/phy/broadcom.c
+++ b/drivers/net/phy/broadcom.c
@@ -650,7 +650,7 @@ static struct phy_driver broadcom_drivers[] = {
 	.phy_id		= PHY_ID_BCM54616S,
 	.phy_id_mask	= 0xfffffff0,
 	.name		= "Broadcom BCM54616S",
-	/* PHY_GBIT_FEATURES */
+	.features       = PHY_GBIT_FEATURES,
 	.config_init	= bcm54xx_config_init,
 	.config_aneg	= bcm54616s_config_aneg,
 	.ack_interrupt	= bcm_phy_ack_intr,
-- 
2.17.1

