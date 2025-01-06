Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2A2A02EB2
	for <lists+openbmc@lfdr.de>; Mon,  6 Jan 2025 18:16:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRgnC1HB7z3cCn
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2025 04:15:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736183755;
	cv=none; b=B1DVbr6QpK2z7IHXlij/MFEpZ4Oabw3uKkkrJaVGQ0xdEUhujtIN5UGSrZo2ZrXDTDIDvNJQ1t1s03V2pB+cZ7BdHY3IusuKAdeYbfPGqpbA1oKiGMaNgmb+zMTqPcLW1mhZ4Q0tzA19tUSwepSOobDYcHFHQI/yDwQHK21146/vT/y5nRaUyLyGTtclp5Xscnw3nr3ZlAjSGsI35NfF532bzN8NyHvu2KIb192BLJSePqj5qt+/bw1Y2ro7DK9f7Y1Ki3Owpc2i4ZWNIBW77oS9Aw3TNS7oc9yMMENj+83sVIL9RkCPmFnRNm5wO+JrQnBh+hIyXvIO6x0+qee/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736183755; c=relaxed/relaxed;
	bh=6L4ysaHqo0HLmXGhkPnO3HUb18lrbZ5bBLHS1UB79xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i2aVFFVsYw6tlfeM4emqkyGK1/0mybI8rfHIG46NbOddmrmjUjk+AI0dI3BGmO/vf5pS0R5f8n2okFwthg0D3oeXLSOlQSOuplJ0hBlO3Dfa6UxymFn/J0V4Q4VTtdpvu60xKry/du7Pxzaw+JVBVDtRT0iMDBjgrt7djDhGAr12DooMbAWChFUASci1AcupnoR1uK/3xHP1sqaVXMmfTjS1l04NmRV9sk3w4mWYRVWKN58z3SvIVHyNqnJPCqr5jnCzztRLeDgOXfNwssAx3CkmyuVdJkyIDso7whfZu9Wz7LKuW+xaeCDkGdjNG4r7imHBu3g9CyEd3i2eB9RqEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SU3sgFbP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SU3sgFbP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRgn65Kfjz30VM
	for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2025 04:15:54 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506GSX06003159;
	Mon, 6 Jan 2025 17:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=6L4ysaHqo0HLmXGhk
	PnO3HUb18lrbZ5bBLHS1UB79xk=; b=SU3sgFbPDBY6g7AR/v7JEPSdd6XCdQufA
	Hfgq+sG5sqj8XT5/dwi+f0H5aysM5EJ0z3A4UbiKsgXa63ko9FSpJ/nsSPzRsA2C
	6B5ONVYKSJFgQi+ZxXmMKH1FjSfb+piqcJm8YN5DE3qNyQDKiODNxpIF+fGqByzV
	vwqrujCBpBlMj8XyJyRv+mK9Fu3s2Qdk0KC4loV91QVfLDNTGIPSYtO0+wZXMK7+
	RpRoCvQNfLec3hKYUdTFJdfvcTOgo/RmlUh+bEFjy7X77n+L/c6ilknTp+/4lcPk
	zKZZdxRozXZMKfSbr7QM+tNQTxWa3TzNXUunHr8OtEK+zTZStTpBw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4407nbk7wt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:41 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506DnGHc003601;
	Mon, 6 Jan 2025 17:15:41 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yfasxurx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 17:15:41 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506HFeJB12190294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 17:15:40 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 087F358054;
	Mon,  6 Jan 2025 17:15:40 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A761A5805F;
	Mon,  6 Jan 2025 17:15:39 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jan 2025 17:15:39 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Subject: [PATCH linux dev-6.6 v1 1/4] hwmon: (pmbus/core) Add PMBUS_REVISION in debugfs
Date: Mon,  6 Jan 2025 11:15:25 -0600
Message-ID: <20250106171530.1063148-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250106171530.1063148-1-ninad@linux.ibm.com>
References: <20250106171530.1063148-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: axogfRzxNd0e-WcEnDeQPhIxkspnsrGV
X-Proofpoint-GUID: axogfRzxNd0e-WcEnDeQPhIxkspnsrGV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 adultscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add debugfs file for the PMBUS_REVISION command. This command provides
information about PMBus protocol revision number.

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 3fe89a3f5f58..ff3271104305 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3397,11 +3397,11 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 
 	/*
 	 * Allocate the max possible entries we need.
-	 * 6 entries device-specific
+	 * 7 entries device-specific
 	 * 10 entries page-specific
 	 */
 	entries = devm_kcalloc(data->dev,
-			       6 + data->info->pages * 10, sizeof(*entries),
+			       7 + data->info->pages * 10, sizeof(*entries),
 			       GFP_KERNEL);
 	if (!entries)
 		return -ENOMEM;
@@ -3414,6 +3414,15 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * assume that values of the following registers are the same for all
 	 * pages and report values only for page 0.
 	 */
+	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
+		entries[idx].client = client;
+		entries[idx].page = 0;
+		entries[idx].reg = PMBUS_REVISION;
+		debugfs_create_file("revision", 0444, data->debugfs,
+				    &entries[idx++],
+				    &pmbus_debugfs_ops);
+	}
+
 	if (pmbus_check_block_register(client, 0, PMBUS_MFR_ID)) {
 		entries[idx].client = client;
 		entries[idx].page = 0;
-- 
2.43.0

