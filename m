Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B577B5267EC
	for <lists+openbmc@lfdr.de>; Fri, 13 May 2022 19:10:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0FWx4mhgz3c8y
	for <lists+openbmc@lfdr.de>; Sat, 14 May 2022 03:10:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h5QzKOxK;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h5QzKOxK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L0FSX5PTfz3brM
 for <openbmc@lists.ozlabs.org>; Sat, 14 May 2022 03:07:24 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24DFjWWH002559;
 Fri, 13 May 2022 17:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KbZJ5JUANetDuVWVNY6aGwNzWeNVuNXqJ5k20EQqerY=;
 b=h5QzKOxKo1rx610wF6k6E1g+Ic7PPm7GTcImiLDHhcp/Waq77K6wHAt74jT6n5coQYlm
 Zr7EbW2qxCcn9Aj1ykU6r0dbSHrzr4PciaznQJsnfgAYY0jyZTHsQo1TUkhBwYFdp0fU
 +C+koFJMfoHkkLf6vQkO/JQjIluTXLV51QA1m/DU1GML0DnU/llbEm3xJla8IIK+yv/2
 gEi/zm3WHLMHO7o7HhkhIM9muSQd8tZjGfyKNkU88QMCGBDZ6+FmXsnJ6dxO547eS5cq
 +nPiXzMHhmkfKopRKCP3YvMf1V1kt9DSMskE6BhTUenxtMNES5QMPc/GbftvzsaXbJEk 2g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g1t8p1j6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:21 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24DGhvQQ025064;
 Fri, 13 May 2022 17:07:20 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3fwgdabq75-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 May 2022 17:07:20 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24DH7JVq8782302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 May 2022 17:07:19 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6ADBFAC060;
 Fri, 13 May 2022 17:07:19 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA98EAC059;
 Fri, 13 May 2022 17:07:18 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.1.123])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 13 May 2022 17:07:18 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc v2 5/9] tpm: core: Set timeouts
 before requesting locality
Date: Fri, 13 May 2022 12:07:11 -0500
Message-Id: <20220513170715.43475-6-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220513170715.43475-1-eajames@linux.ibm.com>
References: <20220513170715.43475-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OhZCvALOQtezirp66-CLz7qQo0XCunRm
X-Proofpoint-ORIG-GUID: OhZCvALOQtezirp66-CLz7qQo0XCunRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-13_09,2022-05-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=886 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130073
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
Cc: cjengel@us.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Requesting the locality uses the timeout values, so they need
to be set beforehand.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/tpm/tpm2_tis_core.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/tpm/tpm2_tis_core.c b/drivers/tpm/tpm2_tis_core.c
index 51392c4584..985a816219 100644
--- a/drivers/tpm/tpm2_tis_core.c
+++ b/drivers/tpm/tpm2_tis_core.c
@@ -433,15 +433,16 @@ int tpm_tis_init(struct udevice *dev)
 		log_err("Driver bug. No bus ops defined\n");
 		return -1;
 	}
-	ret = tpm_tis_request_locality(dev, 0);
-	if (ret)
-		return ret;
 
 	chip->timeout_a = TIS_SHORT_TIMEOUT_MS;
 	chip->timeout_b = TIS_LONG_TIMEOUT_MS;
 	chip->timeout_c = TIS_SHORT_TIMEOUT_MS;
 	chip->timeout_d = TIS_SHORT_TIMEOUT_MS;
 
+	ret = tpm_tis_request_locality(dev, 0);
+	if (ret)
+		return ret;
+
 	/* Disable interrupts */
 	phy_ops->read32(dev, TPM_INT_ENABLE(chip->locality), &tmp);
 	tmp |= TPM_INTF_CMD_READY_INT | TPM_INTF_LOCALITY_CHANGE_INT |
-- 
2.27.0

