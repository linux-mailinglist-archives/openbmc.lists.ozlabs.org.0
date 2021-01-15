Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8C32F7F21
	for <lists+openbmc@lfdr.de>; Fri, 15 Jan 2021 16:13:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHPnX553QzDsh4
	for <lists+openbmc@lfdr.de>; Sat, 16 Jan 2021 02:13:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=klaus@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=q5R7uL+6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHPlj698FzDsgJ
 for <openbmc@lists.ozlabs.org>; Sat, 16 Jan 2021 02:11:28 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10FF40eB069817; Fri, 15 Jan 2021 10:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id; s=pp1; bh=bfneg1uuX7eZSIxc7Ag14xm9Leopa3qyjekmMtWDuPA=;
 b=q5R7uL+6lLpz1GzRhauBsSaBy5x8o8gkwZf8FPcs+C2hKkWM7tY5A+2YxspHaEvAFXn1
 e16YSyusHFMvQ8yzWnMfI04jjRAAe26hvnYJGpAQlAVv3XVLl4I26QBZIJEb6nMapH//
 MjUJGssQgMBZ3HXJ8jgv5MtWNdM2AnXXeDhWEGOqzF2ifafe7u0jnXFxhRDTcIn14fuo
 pO9sYZOkbo96C656OMZMT8KmNRD9jYhaRDxDgEbKOU9LIOz/0OYixfQhsmfgvFIiMKsW
 A1RerA/CkC/Dvzp0SLd+XqDXAWQwpRLp3aEju+MUOkSokguffiYQEnIUcLweWdt10mx4 KA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 363cqv1emb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 10:11:24 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10FF7PNt005187;
 Fri, 15 Jan 2021 15:11:23 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 35y449ngf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jan 2021 15:11:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10FFBMfN35389878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Jan 2021 15:11:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7466BE054;
 Fri, 15 Jan 2021 15:11:21 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8F4DBE056;
 Fri, 15 Jan 2021 15:11:20 +0000 (GMT)
Received: from klaus-virtual-ubuntu.aus.stglabs.ibm.com (unknown [9.80.230.10])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 15 Jan 2021 15:11:20 +0000 (GMT)
From: Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
To: openbmc@lists.ozlabs.org, joel@jms.id.au
Subject: [PATCH linux dev-5.8 0/9] Add TPM i2C TIS device
Date: Fri, 15 Jan 2021 12:10:39 -0300
Message-Id: <20210115151048.15965-1-klaus@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-15_08:2021-01-15,
 2021-01-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 mlxlogscore=956 bulkscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101150095
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

Add the tpm_tis_i2c driver, which was submitted / discussed here[1] but
not yet accepted. I decided to not include '[v12,7/9] tpm: tpm_tis:
verify TPM_STS register is valid after locality request' since I don't
think it's correct or necessary (and it breaks compilation).

Additionally, add the Nuvoton NPCT750A device (which uses the
aforementioned driver) to IBM's Rainier's Device-Tree (opted to not send
this upstream yet until we have the actual driver merged)

Tested on an Rainier (probes ok) + ibm tpm2 tss packages (used for
sanity test only).

 -Klaus

[1] - https://patchwork.kernel.org/project/linux-integrity/cover/20200625144650.269719-1-amirmizi6@gmail.com/


