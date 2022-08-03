Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A9588BE4
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 14:21:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyWFB4RYYz3bXg
	for <lists+openbmc@lfdr.de>; Wed,  3 Aug 2022 22:21:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqJYTuq/;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EqJYTuq/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyWDl1r0Lz2xHv
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 22:21:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 273CE8s0031315
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 12:21:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=k7nhvuIL1/Pxr7SSt5EaGOe10Ov6S+sTopM5H8P2OGE=;
 b=EqJYTuq/3x6mNHivwNPrFK2rdj6/lUw9buQAT5ukZHp3nZLxZ/Klf83oRgFa+VASX6AV
 Hxa7Kp6HTNLOlj4oRUpnxppq+e5aeyxigLZTgwvEUsnm3RdOemVJvyFPAnjY25QH7AQS
 GTz19aP5kF/xKEgN/uYLN3zCZ9VIMXNH496jINoC2A2gepPiQ5xmdiBL/DFx9WX2YvAS
 08ZpK4yzMT5F+lr14tRXT+DX70DREyMKEPO1xwEmCeO2RlNxLEsSVYzayu7lOAcciqPo
 CouhQhCc6vEJqo70iBpbulnjznmcLl0hv4iH9RIPc9DkPJpKKfgZcJyMbBBwkjKI66dS Ow== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqrevsbd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 12:21:23 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 273CKimG019526
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 12:21:23 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma04wdc.us.ibm.com with ESMTP id 3hmv99r18v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 12:21:23 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 273CLMew42336592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 3 Aug 2022 12:21:22 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C45E028066
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 12:21:22 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 985C528059
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 12:21:22 +0000 (GMT)
Received: from [9.65.221.58] (unknown [9.65.221.58])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed,  3 Aug 2022 12:21:22 +0000 (GMT)
Message-ID: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
Date: Wed, 3 Aug 2022 07:21:21 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday August 3
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qDC0DdkC7ch_SoFEah-SMPmZTfmVKuJo
X-Proofpoint-ORIG-GUID: qDC0DdkC7ch_SoFEah-SMPmZTfmVKuJo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=825 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208030052
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

This is a reminder of the OpenBMC Security Working Group meeting 
scheduled for this Wednesday August 3 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:

1. Continue discussing CVE response, SELinux, and Measured Boot

2. Recommend http header values per email dated 2022-07-22 with subject: 
BMCWeb support new HTTP headers Referrer-Policy and Feature-Policy 
renamed to Permissions-Policy

3. Consider increasing the TLS DH keysize from 1024 to 2048 bits per 
best practice (reference needed).

4. Consider migrating this meeting access to Discord > Voice channels >  
Security.



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
