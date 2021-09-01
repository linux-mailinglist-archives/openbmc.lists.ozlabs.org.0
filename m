Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B83B3FE500
	for <lists+openbmc@lfdr.de>; Wed,  1 Sep 2021 23:34:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0HQD0sHWz2yNK
	for <lists+openbmc@lfdr.de>; Thu,  2 Sep 2021 07:34:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PexZZTNj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PexZZTNj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0HPj4XBPz2xr7
 for <openbmc@lists.ozlabs.org>; Thu,  2 Sep 2021 07:34:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181LWiAw125383
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 17:34:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to :
 references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aRLJF7f0MRm9ubcYqfqBkMB1mwil417hTfeDzV0DJP4=;
 b=PexZZTNjzBvimlBHlKz57KBG2+phx2jbeBMs/pDL+ZBub5MfoCSVQJDAAbbWQ/W/yTYi
 I7RmcZO/gHTeEzcdruvXXTCVw+B+uSSnlCFkX6QwZzc8oCgX331j/uZI5AnmeQiWVEkp
 7sb+GgwRZENdugWtaWR2WVJpudK5DWlEEqyKFAnYQxJQiCQdh8c3rtfCAmeWDqs64dRl
 3nZTNpbyb/h1qekSj/Lyamo5DjilL4b+Z0adKlTRMrgZvHNSEFHp9WbxwPdHCwFLUoOa
 uKV7DjoaTbVW0811f4GB0trKPdjYW9ny6924ix5hImYZbO46BGEFdNQud5RFvM5KugmA GA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3atg5m9qn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 17:34:12 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181LWiUV006828
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 21:34:11 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma02wdc.us.ibm.com with ESMTP id 3atdxbmg7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 01 Sep 2021 21:34:11 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181LYA9D35127574
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 1 Sep 2021 21:34:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D112C6075
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 21:34:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4754AC6055
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 21:34:10 +0000 (GMT)
Received: from demeter.local (unknown [9.65.120.200])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed,  1 Sep 2021 21:34:10 +0000 (GMT)
Subject: Re: Security Working Group meeting - Wednesday September 1 - results
From: Joseph Reynolds <jrey@linux.ibm.com>
To: openbmc <openbmc@lists.ozlabs.org>
References: <08874286-b3d3-74a1-f20f-973fd0a4e17d@linux.ibm.com>
 <f0cee41f-51d8-1ef5-18f7-4ea12b3c9212@linux.ibm.com>
Message-ID: <ed8cad7f-e275-1544-8183-e05b6f884f22@linux.ibm.com>
Date: Wed, 1 Sep 2021 16:34:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <f0cee41f-51d8-1ef5-18f7-4ea12b3c9212@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LrkCdPVYv7qFXb63zslGf6xgAnOKeeSn
X-Proofpoint-GUID: LrkCdPVYv7qFXb63zslGf6xgAnOKeeSn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_05:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109010125
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



On 9/1/21 9:22 AM, Joseph Reynolds wrote:
> On 8/31/21 10:19 PM, Joseph Reynolds wrote:
>> This is a reminder of the OpenBMC Security Working Group meeting 
>> scheduled for this Wednesday September 1 at 10:00am PDT.
>>
>> We'll discuss the following items on the agenda 
>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
>> and anything else that comes up:

Attended: Joseph Reynolds, Milton Miller (attended first half: IPMI over 
DTLS topic), James Mihm, Ratan Gupta, Andrei Kartashev, Daniil Engranov, 
Dhananjay MSFT, Dick [Phoenix], Jiang Zhang

>>
>> 1.
>>
>>   Ratan Gupta wants to join the Security Response Team for NVIDIA.
>>   See
>> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance 
>>
>> <https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team-guidelines.md#team-composition-and-email-maintenance> 
>>
>>
DISCUSSION:

We discussed some criteria for SRT membership:

  *

    Although individuals join the SRT, it is really organizations which
    join as represented by their SRT members.  The SRT member candidate
    should be able to affirm that they  participate in their company’s SRT.

  *

    The organization should have a “vested interest” in OpenBMC security
    response.  Here are some examples to consider:

      o

        Organizations which use OpenBMC to produce products or services
        which are publicly available, and disclose security bugs to
        their users.  For example, any org which produces systems which
        use OpenBMC and have a sufficiently mature SRT.

      o

        Downstream organizations, for example, who aggregate BMC-based
        systems into larger systems.

      o

        Security research orgs, open source SRTs, etc. which have a
        significant interest in BMCs.

  *

    The default stance should be to deny membership in the SRT.  This is
    to support the requirement to limit membership so as to not
    prematurely disclose security vulnerabilities.


History: The initial SRT membership was the TSC members plus their 
delegates.


In UEFI Forum, the founder companies formed the initial SRT, and then 
explicitly invited select organizations to join, such as OS orgs like 
RedHat and Debian.  Call for more orgs who use OpenBMC who fit these 
criteria to join the SRT.

> Additional agenda item:
> 2.(gerrit review) 
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
> <https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>IPMI over 
> DTLS - questions about basic direction and sharing of private keys
>

2 (gerrit review) 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548 
<https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/31548>IPMI over 
DTLS - questions about use of OpenSSL and sharing of private keys

DISCUSSION:

Structure: The IPMI server and the BMCWeb server belong to the same 
BMC.  So should they share the same certificate?  Or should they have 
different certificates because they are different services?

Opinion: Have separate certificates for each service.  The BMC admin can 
install the same certificate for both, if they wish.

Items to add to the design:

  *

    Describe certificate management.

  *

    If DTLS and Redfish share a cert, what happens when the cert changes
    because of a Redfish API operation?

  *

    Talk about how DTLS will configure or consume OpenSSL.


Call to action: please comment in the review.

Let’s invite Ed and Vernon next time if open questions remain from the 
gerrit review.


>>
>> Access, agenda and notes are in the wiki:
>> https://github.com/openbmc/openbmc/wiki/Security-working-group 
>> <https://github.com/openbmc/openbmc/wiki/Security-working-group>
>>
>> - Joseph
>

