Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D25283CB7FE
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 15:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRC5t54jwz3068
	for <lists+openbmc@lfdr.de>; Fri, 16 Jul 2021 23:39:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VkYJB2m2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VkYJB2m2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRC5Y59ydz2ydS
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jul 2021 23:39:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16GDXT5d169632; Fri, 16 Jul 2021 09:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=G7xR0UkTlt4DxDG1uLnHNASS4R8Bl3dF6j6aZ38n9vo=;
 b=VkYJB2m2lCM5k34wsfNR00uVr0X1Yy7ByD2ks25PzRMKndjEePYirRplwV+EEqcEbyYs
 p3zwGKL37mlLTQUpxlNhb6WLD5V5cDOrK4ZYrXioRK17KSFEG22TfyySCaErUj2wFcBl
 pTSco8UvF+B+WjMzseRJsMbLMOVSMlVVIPPysgDTfQ6oiVFAoeb5x59kKOwP8sFkYSXU
 705eHeoq5D1qtDEX/i4XMGkkmVyU7SRpHmRyQV7F06FF0fqoeq8sfArOu+pDl6kYJNak
 bQoI6fJem7cHVbBe3XVbgdVp+uBQdNz/jfnpstoXqBsbpCmSCUVE8Lr34N+hTVxV6WUq qg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39u8bvwe9v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 09:39:24 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GDXgIl015997;
 Fri, 16 Jul 2021 13:39:22 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 39q36f49yd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Jul 2021 13:39:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16GDdL8850004384
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Jul 2021 13:39:21 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6C266E053;
 Fri, 16 Jul 2021 13:39:21 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 465CD6E04E;
 Fri, 16 Jul 2021 13:39:21 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 16 Jul 2021 13:39:21 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 0/2] spi: fsi: Reduce max transfer size to 8 bytes
Date: Fri, 16 Jul 2021 08:39:13 -0500
Message-Id: <20210716133915.14697-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0I2MU2yPyw5_GN2utrm0UNo4jKhHkX90
X-Proofpoint-ORIG-GUID: 0I2MU2yPyw5_GN2utrm0UNo4jKhHkX90
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-16_04:2021-07-16,
 2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=723 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160082
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
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org,
 Eddie James <eajames@linux.ibm.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, broonie@kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

The security restrictions on the FSI-attached SPI controllers have
been applied universally to all controllers, so the controller can no
longer transfer more than 8 bytes for one transfer. Refactor the driver
to remove the looping and support for larger transfers, and remove the
"restricted" compatible string, as all the controllers are now
considered restricted.

Eddie James (2):
  spi: fsi: Reduce max transfer size to 8 bytes
  dt-bindings: fsi: Remove ibm,fsi2spi-restricted compatible

 .../devicetree/bindings/fsi/ibm,fsi2spi.yaml  |   1 -
 drivers/spi/spi-fsi.c                         | 125 +++---------------
 2 files changed, 22 insertions(+), 104 deletions(-)

-- 
2.27.0

