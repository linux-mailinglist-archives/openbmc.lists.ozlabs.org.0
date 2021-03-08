Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAEEB331A94
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 00:00:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvYj65tRgz3cP1
	for <lists+openbmc@lfdr.de>; Tue,  9 Mar 2021 10:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ahQUmiCz;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ahQUmiCz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvYYx2tTjz3cLN
 for <openbmc@lists.ozlabs.org>; Tue,  9 Mar 2021 09:54:28 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 128MYSCR072192; Mon, 8 Mar 2021 17:54:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=U5n7MbEPpQG9aqizr8IpQL2Lej4LRcg3dR4tDd+ONBg=;
 b=ahQUmiCz3tOXjDMJ2j9kHBGLcaFuHujzEnVDzy/Gpqjgi/3KjIOYDCfOjVAqkJYBcmIL
 nKDP7PY98I5aFGzcUtT0oPBhQfC9K2dmj66MDZH+XIDyV4sE+uxhB8HwcjrdvhC+gRqC
 H0J5FzwXOvKeQ93jNE13dkoQ/sfgAl1rxFGtPF/Mx4ABylN2+lKQlaxPNdaDiIKNml1G
 zsAcKSk0jVRowXLfks+KtlCZ/qjWBORSH5AtnSiXaa9DQscwJYAuhgGx+t+QZRkZ4ov9
 fYBRnSbMXUhnS3pvt6d/A5JXROh/9vXcfTowKOboQndFIxIqxBcN1uTdsd8lnBFd+Ppf 8A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 375uun9rvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 17:54:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 128Mqq80018059;
 Mon, 8 Mar 2021 22:54:25 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02dal.us.ibm.com with ESMTP id 3741c96etx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Mar 2021 22:54:25 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 128MsN3o26280302
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Mar 2021 22:54:23 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB908C605A;
 Mon,  8 Mar 2021 22:54:23 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8137CC605D;
 Mon,  8 Mar 2021 22:54:23 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.41.147])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  8 Mar 2021 22:54:23 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-5.10 12/35] ARM: dts: aspeed: rainier 4U: Fix fan
 configuration
Date: Mon,  8 Mar 2021 16:53:56 -0600
Message-Id: <20210308225419.46530-13-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210308225419.46530-1-eajames@linux.ibm.com>
References: <20210308225419.46530-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-08_20:2021-03-08,
 2021-03-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103080118
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

The 4U fans didn't have the correct properties since the fan nodes
were redefined. Fix this by referencing each fan individually and
adding the differences to the 4U fans.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
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
2.27.0

