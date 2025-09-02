Return-Path: <openbmc+bounces-559-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2408B40D30
	for <lists+openbmc@lfdr.de>; Tue,  2 Sep 2025 20:32:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGZ8z1w7pz2yN1;
	Wed,  3 Sep 2025 04:32:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756837939;
	cv=none; b=lUmhEP9ggCi0lX66gxZKaGtczfJC6CfaJZNNR1h9Rm/zNjY/Z4s2gT7Rx09fu2Z6nBTWmWezTHnjBULdbdABSf/Muf8BRN29TVk80K5G0Gr523ZszaGSPmLcytjTclZXro7/u5cldPBkbTHKZEYel6W6aKSw71iDp9/Qn0CFXr5OfV2hfOh0K1zVg1jv/XApLJKje2Z68xMjhr3m93FpY7qb2WohS9mT50Hq5ILQFZqTYRFCxxdNLtQMYKu8k6kFJnEa7cLHt8ecrs7Uny5dMt/jJ3ZcAmaq9uEH+8jHROBmI65Ky3tV3bYSoZgqKnvneZjOJd3OMIT3gUSqQp9MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756837939; c=relaxed/relaxed;
	bh=HHswQvTmiSiR5r0HMVf+7vzjqUbGvAAP7pqkNxqoj/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JuoEPG/fiQq0O6T+J+z098Dr48h8/cpEZdrvKCyNoXFBcHH3BDuonohm7xszk4ojWzBNPIBdX5SvH4XSzVwJ9Wg9q+gssX0lDQSH0MWwyY8Tq/VmMcx05eHpdHbNZaHLWfIwW1lPn3WHcYzqUpIcsEk98kPA+T1oYwiwyf0ypbkCLHsyJIaegbLYf17cHtvs/F33j174YQBBu6tXg20c7baDEcxJua/IkL2ZdVSpx8wRClD4aCl8745EzRbBxov0SOJ/0uJkBKDHIFvue7TOlUXamTfKUpiqRv2iC0TRk3ZUeQcMqQ7gEMKh5ca6iMA3Yjp59Ys7NtI+uHJVRCeSlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Md0Ba64d; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Md0Ba64d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ninad@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGZ8y08YTz2xpn
	for <openbmc@lists.ozlabs.org>; Wed,  3 Sep 2025 04:32:17 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582H1nGa006504;
	Tue, 2 Sep 2025 18:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=HHswQvTmiSiR5r0HMVf+7vzjqUbGvAAP7pqkNxqoj
	/M=; b=Md0Ba64ddrv3xlz7WxSbQ8zEpxZe67liWEjj+kxl5+XHcZCGd+EJOWtP/
	nVVNOuABIilaANYANay3ABYuDCahA1P8tCOnjB2lz5KNNitngBaJxA2eAxK8MGJS
	MfSYktXEqxJ72z33m1WiPl0ltA+eRDJQojBhXLcjfr/YCyd3uj9a+/UAC6uRRuvb
	CBQ27fovwVkPEn9UgfQYFcmhHiwV1wGggatnwfgtrjuPy056oazfh0lSUzhMnxpT
	pQnjd+vGx/fMRKwMf4JDWnJGTe1SZ3mHCFqCe6521ibEF9EEoJgI1gH1ab+j4o2x
	PiUmntPbtb4jqkJUmzCFL67rqYlzg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48usvfqwds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:03 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 582GLAMw021222;
	Tue, 2 Sep 2025 18:32:03 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48vcmpkxpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 18:32:03 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 582IVq1i2622202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Sep 2025 18:31:52 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EE1FB58050;
	Tue,  2 Sep 2025 18:32:01 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8740958045;
	Tue,  2 Sep 2025 18:32:01 +0000 (GMT)
Received: from gfwa153.aus.stglabs.ibm.com (unknown [9.3.84.127])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  2 Sep 2025 18:32:01 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: openbmc@lists.ozlabs.org, andrew@codeconstruct.com.au, joel@jms.id.au,
        eajames@linux.ibm.com
Cc: Ninad Palsule <ninad@linux.ibm.com>
Subject: [PATCH linux dev-6.12 v1 0/6] Port linux fixes from dev-6.6
Date: Tue,  2 Sep 2025 13:31:41 -0500
Message-ID: <20250902183155.2988560-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=behrUPPB c=1 sm=1 tr=0 ts=68b73823 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=yJojWOMRYYMA:10 a=TE8Eiz4wc1mXMh57oLIA:9
X-Proofpoint-ORIG-GUID: IB6O_JjADeffCLcXb51wzuRNcCDDN_KX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzNCBTYWx0ZWRfX4rSHP96jRpdD
 c1u+AeWoRDN1SJ3Z4SoXgR6HgpGour/Vui/AZuNUqEzhkcRv1qkwD1bT6Iw/CjTzC/+4vCPHPQ6
 lU5dFhpb4lnMuO4Qy96aQR9MXp5c6lI74Uad/VnE92tdwvspqhgg5etH2VhZWSAPIYDmKdbH1HY
 NJ24uc/qHivpxjIUtQG66p4NL29QzpxnxRXIc2JSapd8lbwDiOoQ71YnsfDtg71sYbyNQrYt4XJ
 k4bpNP0cvK3NkYtjR46MOMFLqbSAY7kA4+3GHjxocQp22yMTmud3RbX7aRsFjHbj4+t/si/+UVi
 vlP269vc4PnLQNk6pOyL9uebexYFNYqSEA1NesxlkIKCAu4oNM4osNMuImyteohveW125V87TII
 fRQICj04
X-Proofpoint-GUID: IB6O_JjADeffCLcXb51wzuRNcCDDN_KX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300034
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patchset forward port fixes from dev-6.6 to dev-6.12 branch.
The conflicts were seen only in one patch listed below.
- soc: aspeed: Add XDMA Engine Driver

Eddie James (6):
  soc: aspeed: Add XDMA Engine Driver
  soc: aspeed: xdma: Add user interface
  soc: aspeed: xdma: Add reset ioctl
  soc: aspeed: xdma: Add trace events
  i2c: core: Add mux root adapter operations
  iio: si7020: Lock root adapter to wait for reset

 MAINTAINERS                      |    2 +
 drivers/i2c/i2c-core-base.c      |   38 +
 drivers/i2c/i2c-mux.c            |   50 ++
 drivers/iio/humidity/si7020.c    |   16 +-
 drivers/soc/aspeed/Kconfig       |   10 +
 drivers/soc/aspeed/Makefile      |    1 +
 drivers/soc/aspeed/aspeed-xdma.c | 1224 ++++++++++++++++++++++++++++++
 include/linux/i2c.h              |   42 +
 include/trace/events/xdma.h      |  139 ++++
 include/uapi/linux/aspeed-xdma.h |   42 +
 10 files changed, 1562 insertions(+), 2 deletions(-)
 create mode 100644 drivers/soc/aspeed/aspeed-xdma.c
 create mode 100644 include/trace/events/xdma.h
 create mode 100644 include/uapi/linux/aspeed-xdma.h

-- 
2.48.1


