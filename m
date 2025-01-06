Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A77A02EBB
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 18:16:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgnP2071z3fvg
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 04:16:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736183759;
	cv=none; b=f2CTj/Dd/IseVOwcbhpYKGGHuXLhwIlEYPOK67USHfLrkdGTT9tv8q7H0Cy/zSPC/3iNzKY0d7sjPQTnuynmn7YNvwQxaBqhaKqki2DDKrDwWvvcrvYyn7dDK/OMaCNVqtFnPLyr/xTgbKST9V4xnntkXom6L7NRDqXsXlpoqrjzTEpeqgnX+TAk0hZ63JXP37CHQaY6/10N4aao5XUUOkeJaA3fiZLIG7UWpxmwJ/tXA2hgCBmsIBLeOuqztYLrOoU741uHWSCGX+vb6AhlFVEcxo7oCHn4EcLtXER864tbs9F/G8I4kNYcP6pDjp4Hx4aAEPQCSkmM84hdheGJZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736183759; c=relaxed/relaxed;
	bh=8aqA7G69P6Ty9SEbGPz9AS02J8CAWVJONhnFmmYEs28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OpCa+Z+ghMngDXmImZlBM5K7OhEToZ07LF2c1PgS/4eJr7h7ofNqakFYKbUhtSNChkkl+L8y4hAzQUzcY00L+dsYxRgg/he3TIxlYz/6rOStJBVfBqqb1p+kqh0Pv19sR1PzedRNedtq0cz7vyslrsCcW9wqXAH+E/1O2VYlQWc4uLYT9WcRaZ1Sgsw8dJ6x4sYc8Ht7hwfr02bSFVRXr8j1LnwlVgLUd3ATuSLsQRuI5/57PN/f5lAPRNCG6peA4EA4pATaDwP9BYqTLtxWOyUBvyb2ZZvm2wWXk9AWnZCJPW+XBpmWzVHuWDMztjTPKwo1ZI2n3/niZrm6Nm1Hgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0UBm7Pg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b0UBm7Pg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRgn94hyyz30fd
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 04:15:57 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506BbmbX006672;
	Mon, 6 Jan 2025 17:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8aqA7G69P6Ty9SEbG
	Pz9AS02J8CAWVJONhnFmmYEs28=; b=b0UBm7PgwiHtPfLBK+phxX2v8Lw/abezT
	5jPhmVlxlQhFTtCW2pTkdG/mgLtFBNT0MmoFQ5p49k7PSZXMA/GSXpn8k3jjwm1N
	OPv4cQopbbjXdhMLcNMoXMTwmLVaAl2jpCt6jggfvhyESNCfvnhl6jN9Xx+l/Y1p
	m8PU+fw1JORIh4CrEtSor1Y1c1h6F8fZ7KMY6VGnMILGf4bV9GVM7nn7/ph//dQ8
	Ma6jQipISIwuQQuXpPlQiexkiWNwc3gLJ1Vq5+tb9bhu7MjeABtYN22S+6H1Jpkx
	DyQ/3fZZ5td8GVxaF/Kj5Osnmthl2JIpTqQQkC/v3XmtXBdYtQy/A==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4403wakpst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506GX4av026171;
	Mon, 6 Jan 2025 17:15:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj11xbjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:42 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506HFfT553805544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 17:15:41 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 755C35805D;
	Mon,  6 Jan 2025 17:15:41 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171145805A;
	Mon,  6 Jan 2025 17:15:41 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 17:15:41 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v1 4/4] ARM: dts: aspeed: system1: Use crps PSU driver
Date: Mon,  6 Jan 2025 11:15:28 -0600
Message-ID: <20250106171530.1063148-5-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106171530.1063148-1-ninad@linux.ibm.com>
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2yv9DTq_YLr5IC2hX9IFpx31N6N1AWgf
X-Proofpoint-ORIG-GUID: 2yv9DTq_YLr5IC2hX9IFpx31N6N1AWgf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=832
 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060150
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: Ninad Palsule <ninad@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The system1 uses Intel common redundant (crps185) power supplies so move
to correct new crps driver.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
index c8597dcded31..c00b189daeaf 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dts
@@ -681,22 +681,22 @@ &i2c2 {
 	status = "okay";
 
 	power-supply@58 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x58>;
 	};
 
 	power-supply@59 {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x59>;
 	};
 
 	power-supply@5a {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5a>;
 	};
 
 	power-supply@5b {
-		compatible = "ibm,cffps";
+		compatible = "intel,crps185";
 		reg = <0x5b>;
 	};
 };
-- 
2.43.0

