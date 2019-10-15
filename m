Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 937DBD801E
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 21:23:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t5281FwbzDqfq
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 06:23:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com;
 envelope-from=prvs=5191125d25=taoren@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=fb.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.b="WGYQ2rsN"; 
 dkim-atps=neutral
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t4vm3MvHzDr7D
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 06:18:12 +1100 (AEDT)
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.16.0.42/8.16.0.42) with SMTP id x9FJI0rJ012287
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 12:18:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type; s=facebook;
 bh=BEV6lvATpI0k9dhTpbuX7FaHFq1khqxoje3kdOWOeUw=;
 b=WGYQ2rsNFvzpenVqeeM4aTytIEBisF8sMx0oJpHpuWn810PpRLbC1F171W/xk7CkQ/nl
 252RIgQPVKRcfzImjRdR35y7UDdCWhIcLTIRn/QFU/PtYXBfF09e/9ijzqvBJGtlc/ZR
 R/LdTUBBUEjzUCKbqAOmabt3rgRrrXJ1rnk= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by m0001303.ppops.net with ESMTP id 2vn6m8bp25-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 12:18:09 -0700
Received: from 2401:db00:2120:81ca:face:0:31:0 (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:82::e) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 15 Oct 2019 12:17:52 -0700
Received: by devvm1794.vll1.facebook.com (Postfix, from userid 150176)
 id 76D0E5C979D5; Tue, 15 Oct 2019 12:12:39 -0700 (PDT)
Smtp-Origin-Hostprefix: devvm
From: Tao Ren <taoren@fb.com>
Smtp-Origin-Hostname: devvm1794.vll1.facebook.com
To: "David S . Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, Arun
 Parameswaran <arun.parameswaran@broadcom.com>, Justin Chen
 <justinpopo6@gmail.com>,
 Russell King <linux@armlinux.org.uk>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <openbmc@lists.ozlabs.org>
Smtp-Origin-Cluster: vll1c12
Subject: [PATCH net-next v9 0/3] net: phy: support 1000Base-X auto-negotiation
 for BCM54616S
Date: Tue, 15 Oct 2019 12:12:10 -0700
Message-ID: <20191015191213.4028603-1-taoren@fb.com>
X-Mailer: git-send-email 2.17.1
X-FB-Internal: Safe
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-15_06:2019-10-15,2019-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 phishscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=588 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910150163
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

This patch series aims at supporting auto negotiation when BCM54616S is
running in 1000Base-X mode: without the patch series, BCM54616S PHY driver
would report incorrect link speed in 1000Base-X mode.

Patch #1 (of 3) modifies assignment to OR when dealing with dev_flags in
phy_attach_direct function, so that dev_flags updated in BCM54616S PHY's
probe callback won't be lost.

Patch #2 (of 3) adds several genphy_c37_* functions to support clause 37
1000Base-X auto-negotiation, and these functions are called in BCM54616S
PHY driver.

Patch #3 (of 3) detects BCM54616S PHY's operation mode and calls according
genphy_c37_* functions to configure auto-negotiation and parse link
attributes (speed, duplex, and etc.) in 1000Base-X mode.

Heiner Kallweit (1):
  net: phy: add support for clause 37 auto-negotiation

Tao Ren (2):
  net: phy: modify assignment to OR for dev_flags in phy_attach_direct
  net: phy: broadcom: add 1000Base-X support for BCM54616S

 drivers/net/phy/broadcom.c   |  57 +++++++++++++-
 drivers/net/phy/phy_device.c | 141 ++++++++++++++++++++++++++++++++++-
 include/linux/brcmphy.h      |  10 ++-
 include/linux/phy.h          |   4 +
 4 files changed, 205 insertions(+), 7 deletions(-)

-- 
2.17.1

