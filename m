Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2057B44CABD
	for <lists+openbmc@lfdr.de>; Wed, 10 Nov 2021 21:41:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqGww06KDz2ym7
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 07:41:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nGxnx3QA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nGxnx3QA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqGwV2VnYz2yMs
 for <openbmc@lists.ozlabs.org>; Thu, 11 Nov 2021 07:41:29 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AAJI7iC023008
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : from : to : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=azWt+tCLF02HP4sUdkCKkoNi939jCjS3DkZayOvEf7A=;
 b=nGxnx3QAiUuGNLdz8IPcocT+6z9K3UqR/mSz6B5i/fdbAo2XmTu4TDNTFvMv+jgtl29A
 AXLJd2m1CPAsWW5nJXT962CxtaF3qcdA8VYVm6zbBvgufVzJ83QdpzZF9ZSdwpXg9c5F
 2/yfs6heUcfQdRd0mRvimRAYqF3ZDSPrppuVzhICrxJ3VrtPwMyGBHtneq7S2AC0RUJ4
 frKy8A4ZJwllVw1onl9sza9oq8PzRukuYeQcFukLeTzV/4D6heK7jZL4B700twHtnZgQ
 2InoDtb+i28VmSM9IRuNHEgaGcUABFs1fwqNP5Q/shlNH5Bf8SAYcRU7zYeRyZ5MWZPn rw== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c8m4b9r99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:27 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AAKcu6S016963
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:26 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3c5hbcf7us-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AAKfOTT46727502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53F93C605D
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 040F3C605A
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:23 +0000 (GMT)
Received: from [9.65.237.168] (unknown [9.65.237.168])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 10 Nov 2021 20:41:23 +0000 (GMT)
Message-ID: <0dd84546-a444-3581-0b68-82027203edd9@linux.ibm.com>
Date: Wed, 10 Nov 2021 14:41:22 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Security Working Group - OpenBMC working to become a CVE numbering
 authority (CNA)
Content-Language: en-US
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <4ea0015b-3280-c5b3-9f9f-c424046f23c9@linux.ibm.com>
 <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
In-Reply-To: <ba328007-7ade-c21f-8962-3da0c5112d16@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7iyfs4-MMVvwkEQsQ1t5omZ6JxK1LQqx
X-Proofpoint-ORIG-GUID: 7iyfs4-MMVvwkEQsQ1t5omZ6JxK1LQqx
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-10_12,2021-11-08_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=420 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111100098
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

On 11/10/21 2:35 PM, Joseph Reynolds wrote:
> On 11/10/21 8:38 AM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday November 10 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda 
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI>, 
>> and anything else that comes up:
>>
>
> Attended: Joseph, Bruce, Vernon, James, Caci, Jiang, Dick, Ratan, 
> Dhananjay
>
>
> Agenda items discussed:

...snip...

> 2 Should OpenBMC become a CVE Numbering Authority (CNA).
>
> Ref: https://www.cve.org/ResourcesSupport/AllResources/CNARules 
> <https://www.cve.org/ResourcesSupport/AllResources/CNARules>
>
> This would better integrate the CVE process with github.
>
> OpenBMC looked into become a CNA years ago.  See the old review: 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621 
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/15621>
>
> Is it worthwhile for openBMC to become a CNA?  Yes, we have had 
> multiple CVEs per year and believe this will continue.  We have filled 
> out the form (at cve.mitre.org) to create CVEs and have become 
> familiar with writing CVE language.
>
> We agreed to pursue becoming a CNA.  No objections.  James will follow 
> up.

The OpenBMC security response team is working to become a CVE Numbering 
Authority (CNA).

