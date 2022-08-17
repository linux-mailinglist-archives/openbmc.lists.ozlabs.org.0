Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5945967A8
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 05:08:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6tJ91hYSz3blV
	for <lists+openbmc@lfdr.de>; Wed, 17 Aug 2022 13:08:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cI+A9WaX;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cI+A9WaX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6tHf2LwMz2xHw
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 13:07:57 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H2H0uL003204
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date : to :
 from : subject : content-type : content-transfer-encoding : mime-version;
 s=pp1; bh=WQHvckD182y6fxMVgEuHO6u09kjvI0B+COyfSXOmOvA=;
 b=cI+A9WaXKgwJ7wW5URhyEk3AkXnbbkpiVi6UN++XlpEkP5U3qZ35Fuby9t/uXTXcDgxX
 JD5j9kGTAItJt7gAE5TOJPPr/mvCLPz+6YH0HiCdQlx1Wr0wsp0yww1g6cEHMaSpxegc
 NV+7FB1YQq83LZn0H4Dktz2mtVIYwwAsLKZ8J044jwDZ5S3Dk79Hrz/PglU7eLVdnL24
 0obTOo+L0ymHezBO6GqZF8xYnug638pImjtpA+B1JRSybvaa8y+L0VI3Rc/tFgRxwV2X
 eiKvsW6SZ8kH2rXasEhv7MhV2JRvvNmr5+RrAXnffg9Od9N4qVfNMLhYuq6N1MmLgm/p 4g== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0pxask8c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:54 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27H36ePR001798
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:54 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by ppma04wdc.us.ibm.com with ESMTP id 3hx3k9ny6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27H37raw55574920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 885C27805F
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C66078063
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:53 +0000 (GMT)
Received: from [9.160.40.68] (unknown [9.160.40.68])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS
	for <openbmc@lists.ozlabs.org>; Wed, 17 Aug 2022 03:07:53 +0000 (GMT)
Message-ID: <772c9b0d-c06e-e4bc-b114-45a413926092@linux.ibm.com>
Date: Tue, 16 Aug 2022 22:07:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Content-Language: en-US
To: openbmc <openbmc@lists.ozlabs.org>
From: Joseph Reynolds <jrey@linux.ibm.com>
Subject: Security Working Group meeting - Wednesday August 17
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tLLg8Ntya1B5ymgPMaa5_fZ0KxGtMMrE
X-Proofpoint-GUID: tLLg8Ntya1B5ymgPMaa5_fZ0KxGtMMrE
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_02,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=742 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2208170011
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
scheduled for this Wednesday August 17 at 10:00am PDT.

We'll discuss the following items on the agenda 
<https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
and anything else that comes up:
1. Continue discussing Measured Boot.

2. Continue discussing CVE response.

3. BMC FIPS compliance.

4. Add guidance to 
https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md 
<https://github.com/openbmc/docs/blob/master/security/how-to-report-a-security-vulnerability.md>for 
submitting proof-of-concept exploits.



Access, agenda and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/Security-working-group 
<https://github.com/openbmc/openbmc/wiki/Security-working-group>

- Joseph
