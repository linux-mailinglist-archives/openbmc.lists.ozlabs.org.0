Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6466C2C1D2A
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 05:56:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgBYZ1JYFzDqLc
	for <lists+openbmc@lfdr.de>; Tue, 24 Nov 2020 15:56:02 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=msbarth@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ol2QXr2n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgBXm2fhwzDqJ2
 for <openbmc@lists.ozlabs.org>; Tue, 24 Nov 2020 15:55:19 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AO4WKTM103742; Mon, 23 Nov 2020 23:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=calfUZAkFZYWMOql5/FZsR6EY9PgrLoZPbDqWLHlzy0=;
 b=ol2QXr2nt4m1QnBVEaO1YHvUqZkk8/351y0tNH+hI5MFmHNSdtuqmNZ63EgMuzuDPJP/
 cUKUSu5lWrdlE8YSkdUwhxerJ1XvCsj9lo/iyyiWm9yh8G1t5oCMk/lhMg8OFxrQyzNc
 7kZfzG7RIn5lVFJR+zpXlpUZHHajo2nG5N+a9t2Kj3JFb4UugErJlFXcA+1P0MJomZ1M
 vG19+pclx2g7KK5AT9UzFFkV0KlMXyS0IuBi3bKN4c3Z2jENKPf3hJ3lOaI9BBdYqawT
 DvZRJIfX5IM+TOX2SX2mQW8J0FO0syHjmb+R+w/55pJCo/EnQ4CteB1SMLcN92Ke+eaZ SA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34yghrrqe6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Nov 2020 23:55:17 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AO4bSbK022963;
 Tue, 24 Nov 2020 04:55:15 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma05wdc.us.ibm.com with ESMTP id 34xth8vh5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 04:55:15 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AO4tFgc4129506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Nov 2020 04:55:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D0DA112062;
 Tue, 24 Nov 2020 04:55:15 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C3FB112063;
 Tue, 24 Nov 2020 04:55:14 +0000 (GMT)
Received: from MSBARTH-P50.lan (unknown [9.211.40.249])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 24 Nov 2020 04:55:14 +0000 (GMT)
From: Matthew Barth <msbarth@linux.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8] ARM: dts: aspeed: rainier-4u: Update fan config
Date: Mon, 23 Nov 2020 22:55:12 -0600
Message-Id: <20201124045512.2008095-1-msbarth@linux.ibm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-23_19:2020-11-23,
 2020-11-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011240022
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Rainier 4U systems has single rotor fans with a tach pulse of 4.

Signed-off-by: Matthew Barth <msbarth@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
index 291f7d6c9979..f7fd3b3c90d0 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-4u.dts
@@ -22,16 +22,30 @@ power-supply@6b {
 
 &fan0 {
 	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
 };
 
 &fan1 {
 	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
 };
 
 &fan2 {
 	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
 };
 
 &fan3 {
 	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan4 {
+	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
+};
+
+&fan5 {
+	tach-pulses = <4>;
+	/delete-property/ maxim,fan-dual-tach;
 };
-- 
2.28.0

