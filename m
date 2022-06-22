Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29659556DCD
	for <lists+openbmc@lfdr.de>; Wed, 22 Jun 2022 23:24:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSxGP067rz3bqW
	for <lists+openbmc@lfdr.de>; Thu, 23 Jun 2022 07:24:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ak8yiOiV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ak8yiOiV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSxFw1B0Gz302d
	for <openbmc@lists.ozlabs.org>; Thu, 23 Jun 2022 07:23:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MKnnrt011168;
	Wed, 22 Jun 2022 21:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZgLS3j7oi2y8+p6osvuBuiNlaehspbsR2gyZHCUcC7Q=;
 b=ak8yiOiVIL4S3Gxtk5jI++llT6ei7jWhQbliLSaibUfexn2UiDksV98ma2HAhU4KKwTS
 NlrnycNE+xF2WbYRZIIPVANq2fmj4eG1tBcifRIV6Eb40v9XlqEqDeNUB5bNlztENYXA
 vEEUhI2EJa0B6ci4uwmcJA2oamLRStD0VqZgMQZdo/HwqE3vLol/s5WrnCQCDlg8COY3
 6wUGH2ET7IlXUdGPSf361qLAoUEEtfKAGF4eUFkLmfZ2kTz20l0iMlWOKaBwaGEH5DQU
 FFDl+TqfvZsTBUgupBJ4FVeLUZYJM8zVx5PZEbM0lPDEynDEd3tUlMMVqJ8e0xZESyKW LA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gvafa92gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 21:23:44 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25MLKQde014747;
	Wed, 22 Jun 2022 21:23:43 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma04wdc.us.ibm.com with ESMTP id 3gs6b9w6se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jun 2022 21:23:43 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25MLNh8g34341178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jun 2022 21:23:43 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E90CC124053;
	Wed, 22 Jun 2022 21:23:42 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2A98124052;
	Wed, 22 Jun 2022 21:23:42 +0000 (GMT)
Received: from [9.77.148.104] (unknown [9.77.148.104])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Jun 2022 21:23:42 +0000 (GMT)
Message-ID: <cd907039-8b9e-51b3-a672-c079f3e49233@linux.ibm.com>
Date: Wed, 22 Jun 2022 16:23:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: Security Working Group meeting - Wednesday June 22 - results -
 BMC-attached TPM
Content-Language: en-US
To: Patrick Williams <patrick@stwcx.xyz>
References: <4ca4257d-58f1-abc7-a85e-34e9904d4602@linux.ibm.com>
 <bda71881-1a64-ad19-6fb1-fbb328975935@linux.ibm.com>
 <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
From: Joseph Reynolds <jrey@linux.ibm.com>
In-Reply-To: <YrN6lkOgNMNCoJdM@heinlein.stwcx.org.github.beta.tailscale.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7js5PNZXIo8RGstZGbf-ENTbuDL1L7Pz
X-Proofpoint-ORIG-GUID: 7js5PNZXIo8RGstZGbf-ENTbuDL1L7Pz
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-22_08,2022-06-22_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 mlxlogscore=634 spamscore=0 clxscore=1011 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206220096
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 6/22/22 3:24 PM, Patrick Williams wrote:
> On Wed, Jun 22, 2022 at 01:20:48PM -0500, Joseph Reynolds wrote:
>> On 6/22/22 10:19 AM, Joseph Reynolds wrote:
>> 3 Measured boot
>>      Enable network agents (like keylime server, possibly the host
>>      system) to get measurements from TPM.  Note the measurements are
>>      digitally signed by the TPM to ensure their integrity.
> Is there any work going on to define some kind of measurement schema in
> Redfish?  Last I knew this was absent.

Thanks for the reminder.  I started a thread for this: 
https://redfishforum.com/thread/685/support-bmc-attached-tpm

-Joseph

