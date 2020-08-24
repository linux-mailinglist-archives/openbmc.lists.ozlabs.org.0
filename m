Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04C250B7E
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 00:16:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb60N2h4yzDqQs
	for <lists+openbmc@lfdr.de>; Tue, 25 Aug 2020 08:16:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dVliwuc3; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb5tG6LL7zDqPS
 for <openbmc@lists.ozlabs.org>; Tue, 25 Aug 2020 08:11:02 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07OM1NJm100328; Mon, 24 Aug 2020 18:10:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zef+KDqhzJKvisO9bp5rclp/C9AZMd2U1mxLHxjJdWg=;
 b=dVliwuc3ELqbrBI9y/cW3SX+a7qTkkOz7JsNK43LffxLN55wjpn+Aust9KFUQnEGUvga
 C2UYRBZnM/LMZcApJutlyPEJqtNjJv9NKTjY/9+hrTyuMnWa9lpR8TjR5DYcU7r1OHj2
 GG2IFEhMkB8F8UGUxTDzyJEhSYdz6kXoNFjmupNnWpkFiDq3G0TewzkrQUL9/3JYY7Qf
 56swq+BCsAiCYe9UAxa//lG2CyrVw16KmsHhNceE8+8dnvGP9LjwDf6+TsCXSYuiS15g
 A0ohosrW1jwYqWJSyPAoHJAKYvAR+znQTBthEI5S8oqLa9t8QW87QLjTMIXVLaO+Fjat MQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 334n2hhvg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 18:10:55 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07OM3nwa018280;
 Mon, 24 Aug 2020 22:10:55 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 332utu1u1b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Aug 2020 22:10:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07OMAs8V52363602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Aug 2020 22:10:54 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 352DD12408C;
 Mon, 24 Aug 2020 22:10:54 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE428124088;
 Mon, 24 Aug 2020 22:10:53 +0000 (GMT)
Received: from SHADE6A.ibmmodules.com (unknown [9.211.49.145])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 Aug 2020 22:10:53 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.8 2/4] dt-bindings: fsi: Aspeed master: Add
 clock-frequency property
Date: Mon, 24 Aug 2020 17:10:49 -0500
Message-Id: <20200824221051.47972-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200824221051.47972-1-eajames@linux.ibm.com>
References: <20200824221051.47972-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-24_12:2020-08-24,
 2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 mlxlogscore=958 mlxscore=0 impostorscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008240170
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
Cc: andrew@aj.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Document the clock-frequency property.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
index a513e65ec0c9..f10abef837e6 100644
--- a/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
+++ b/Documentation/devicetree/bindings/fsi/fsi-master-aspeed.txt
@@ -17,6 +17,7 @@ Optional properties:
 
  - fsi-routing-gpios: GPIO for setting the FSI mux (internal or cabled)
  - fsi-mux-gpios: GPIO for detecting the desired FSI mux state
+ - clock-frequency: the frequency of the FSI clock
 
 
 Examples:
-- 
2.26.2

