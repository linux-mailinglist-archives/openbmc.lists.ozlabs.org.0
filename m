Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7BEA02EBC
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 18:17:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgnR5ycSz3g5K
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 04:16:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736183761;
	cv=none; b=EeQ8enZ0VqOmIP669EkvUiN+HrRxcvnSExTFQoXO8RVkslauCFTvcwFOSwhfBe2X+n/Ysz4oNPofkmdUQcgAeBK9uhmPB8mgyCjQykCAJxTGhvZW1eVBx7OcM1GlJ2fweW6DWqx5gh3wCfZERhPAl8u08DkjhvrTAuNk21lx1GlnVEVXosakeK5K8bew1vHX/a11+RfSbdDm/tZtnfWBDQE3PU5S7E/zKExXn1cbOrN2WgE16zSqXCfVDrd4tXFmimmtaHhSJUrq4vJOnkWRS3rVJOTJZvHdSupd2XxNyrhC9myEqaFjLW4di5KkSwNDRsCXwYhywKeJ3ngfTTpS4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736183761; c=relaxed/relaxed;
	bh=c8zQSa6MDxRz9PVPq0hIzSmnaOy0rYU3LE5TWy7jUkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNdMyfzVcm63Gw7bN4Gkm/s+DhtgY3M+uv/2VR8Fl7d7pyc/ueKarw42ZQtzge7p0tBwsh/xBAuNBqj4zvS97XNKtlV/judfdibO+iWWohFSU4QzPmYLjIFmQ6PiWV4bn0cp/dw7WbBXR0vf6i3akkJY0l2WBW2eHcCt0qlfX6jpUcygrZHXMq6tslxT7WduT/r14PeHX/NZYHaya09ULR1OET3hEwS1iXhWj21fsdFextm6Sj+wjeYbtO/JccY9MsspOqlS/7qVI41dIr83DQhvg88/vFmrnH+E/dcEUr6NgxA4P2Hg8LZ9aCnORVYeXcEHWjZOnFauqv/cgS+09g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KkWPtBQI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KkWPtBQI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRgn95bnDz30gd
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 04:15:57 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50685onC025560;
	Mon, 6 Jan 2025 17:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=c8zQSa6MDxRz9PVPq
	0hIzSmnaOy0rYU3LE5TWy7jUkM=; b=KkWPtBQI1bT14Fd5rI0//Wlbp8tNhAgYL
	qN2fB2GUzAISlLNcEozP5Za6bA8OujqHWn0EC0saeUNSU3Q9JbuPtql32XQgcylD
	exIEAfPBluqJS81co6LAwVlkOEGYN3sZXkDtROLDciB+7QmJTu+/8h+WXIZm+pEe
	mgWZQADKIP2Blqc8r2g9vH5M8UaVS3kAvqZ4st+GT+4tPU/i9OSjvwWkBbUq4KXh
	1iPJsK/HSm/Co5cSeZk+38plnumhlM6x7yAUK2h2VRnIBjjqin6BalI/O5d4zvkN
	3sF7NS4ouIsGwHoXnQbCvDViaBbrfXvIKf83+/E77pL4EXNgOPLzw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440bc2j80n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:43 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506GPQqL026167;
	Mon, 6 Jan 2025 17:15:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yj11xbjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:42 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506HFf9M29622646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 17:15:41 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F40B858068;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95C215805D;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v1 3/4] dt-bindings: hwmon: intel,crps185: Add to trivial
Date: Mon,  6 Jan 2025 11:15:27 -0600
Message-ID: <20250106171530.1063148-4-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106171530.1063148-1-ninad@linux.ibm.com>
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JkzHE2g61GCHo4gtHSayFKHQ6uAca3r0
X-Proofpoint-ORIG-GUID: JkzHE2g61GCHo4gtHSayFKHQ6uAca3r0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 clxscore=1011 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060145
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

Add INTEL Common Redundant Power Supply Versions crps185 bindings as
trivial. The hardware does not have any resources like clocks which are
required to be included in the device tree.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 0f9b8e71ba30..643ad7dde993 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -185,6 +185,8 @@ properties:
           - injoinic,ip5209
             # Inspur Power System power supply unit version 1
           - inspur,ipsps1
+            # Intel common redudant power supply crps185
+          - intel,crps185
             # Intersil ISL29028 Ambient Light and Proximity Sensor
           - isil,isl29028
             # Intersil ISL29030 Ambient Light and Proximity Sensor
-- 
2.43.0

