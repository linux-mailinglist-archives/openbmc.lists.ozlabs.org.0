Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8BF83ADD
	for <lists+openbmc@lfdr.de>; Tue,  6 Aug 2019 23:12:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4636mC0c7bzDr19
	for <lists+openbmc@lfdr.de>; Wed,  7 Aug 2019 07:12:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=312172077b=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="Rlh/PYjp"; 
 dkim-atps=neutral
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4636lL6KhlzDqrj
 for <openbmc@lists.ozlabs.org>; Wed,  7 Aug 2019 07:11:57 +1000 (AEST)
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x76L4get029555
 for <openbmc@lists.ozlabs.org>; Tue, 6 Aug 2019 14:11:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=f13IO85jl9Vu83Wg4MpoupSf6Pne2xh7V/ZR08MQRjw=;
 b=Rlh/PYjpWulTTG322iPWpErrv8+mSOvNN7ZmuFeN9l54x5C48HlntpESLYLLgbno9/W5
 5TQ9UyVdZEPW6cHUM2zPRN9imhM7vP4nKeMDwjdEa6EJY/vCw2tWuRqfdS8oEtM+Iw6u
 B+fYVAI6ZQZApHu+10ulVTI4vS1fHNdmbyo= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 2u7axu9pdn-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 06 Aug 2019 14:11:53 -0700
Received: from mx-out.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 6 Aug 2019 14:11:52 -0700
Received: by devvm24792.prn1.facebook.com (Postfix, from userid 150176)
 id EE36C18C5041C; Tue,  6 Aug 2019 14:09:24 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm24792.prn1.facebook.com
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Arun Parameswaran <arun.parameswaran@broadcom.com>,
 Justin Chen <justinpopo6@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: prn1c35
Subject: [PATCH net-next v4 1/2] net: phy: modify assignment to OR for
 dev_flags in phy_attach_direct
Date: Tue, 6 Aug 2019 14:09:23 -0700
Message-ID: <20190806210923.3722864-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=707 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908060182
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

Modify the assignment to OR when dealing with phydev->dev_flags in
phy_attach_direct function, and this is to make sure dev_flags set in
driver's probe callback won't be lost.

Suggested-by: Andrew Lunn <andrew@lunn.ch>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Tao Ren <taoren@fb.com>
---
 Changes:
  - nothing is changed in v1/v2/v3: it's given v4 to align with v4 of the
    2nd patch in the series.

 drivers/net/phy/phy_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 6b5cb87f3866..9259eb45c794 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1270,7 +1270,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 			phydev_err(phydev, "error creating 'phy_standalone' sysfs entry\n");
 	}
 
-	phydev->dev_flags = flags;
+	phydev->dev_flags |= flags;
 
 	phydev->interface = interface;
 
-- 
2.17.1

