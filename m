Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A167B8A1
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 18:32:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P29rN3Dzmz2xHK
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 04:32:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VDYlnPEf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VDYlnPEf;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P29pg3j8gz2xHJ
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 04:30:35 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PHAmtY024723;
	Wed, 25 Jan 2023 17:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=TNV1DISRm6we+4Ba/N6sfYBB03DUk6sohrbLctv3iB0=;
 b=VDYlnPEfNpro4MeETX7T45BEbjN8M18NBOWAOxYKgJCal+EFKXPx1nvvFRXTtqy1YID4
 xyKFAJjS2ksJ3n8bKsE6qeWZjReXQmWrqxQ3zTPTDjQ1t2D8MogQdNiFavGh2/41t0Yg
 ljdQTsPsgIIMelcWANVHbgNIYRCMkSs88NGxVYtw7SXNqBQULjmAnBY6Q2MJY0SEqJys
 6rz/yLlT1QWXrDD0YvtbXGC3+gPQf/aFjvstVsTWiDDRwlfnon8KCQHVRpQYkNupUWhC
 GTHRc0bl741MkM8aVvXnzmwHkfl3voks/MzkXk7Zp0NHT1wPUptWpTbV18VS1ePmz81j eA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nac96bgpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:28 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30PHAALs007349;
	Wed, 25 Jan 2023 17:30:27 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3n87p7h27m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 17:30:27 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30PHUQOn61735250
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 17:30:27 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE40758058;
	Wed, 25 Jan 2023 17:30:26 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 171735805F;
	Wed, 25 Jan 2023 17:30:26 +0000 (GMT)
Received: from slate16.aus.stglabs.ibm.com (unknown [9.77.150.21])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 17:30:25 +0000 (GMT)
From: Eddie James <eajames@linux.ibm.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH u-boot v2019.04-aspeed-openbmc 0/4] tpm: Support boot measurements
Date: Wed, 25 Jan 2023 11:30:21 -0600
Message-Id: <20230125173025.3725606-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UtE2Afu8qIE6pAzRZ1j9OmQ4Q8qCXCXk
X-Proofpoint-ORIG-GUID: UtE2Afu8qIE6pAzRZ1j9OmQ4Q8qCXCXk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_10,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=743 bulkscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250147
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
Cc: joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This series adds support for measuring the boot images. The series
includes optional measurement from the bootm command, and selection of
that option for the AST2600 openbmc configuration.

Upstream series: https://patchwork.ozlabs.org/project/uboot/list/?series=338453

Eddie James (4):
  tpm: Pull in upstream changes
  tpm: Support boot measurements
  bootm: Support boot measurement
  ast2600: Measure the boot

 arch/arm/dts/ast2600-p10bmc.dts            |  22 +
 board/aspeed/ast2600_ibm/ibm.c             |  34 -
 cmd/booti.c                                |   1 +
 cmd/bootm.c                                |   1 +
 cmd/bootz.c                                |   1 +
 cmd/tpm-v1.c                               |  16 +-
 cmd/tpm-v2.c                               |  10 +-
 common/Kconfig                             |  23 +
 common/bootm.c                             |  64 ++
 configs/ast2600_openbmc_spl_emmc_defconfig |   1 +
 include/bootm.h                            |   2 +
 include/image.h                            |   1 +
 include/tpm-common.h                       |   3 +
 include/tpm-v2.h                           | 442 ++++++++++-
 lib/tpm-v2.c                               | 838 ++++++++++++++++++++-
 15 files changed, 1400 insertions(+), 59 deletions(-)

-- 
2.31.1

