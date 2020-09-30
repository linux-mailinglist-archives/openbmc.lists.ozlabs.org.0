Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 063BD27F1BE
	for <lists+openbmc@lfdr.de>; Wed, 30 Sep 2020 20:58:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C1lrN65fKzDqVR
	for <lists+openbmc@lfdr.de>; Thu,  1 Oct 2020 04:57:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GZrGBiCR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C1lpP4xCDzDqQC
 for <openbmc@lists.ozlabs.org>; Thu,  1 Oct 2020 04:56:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08UIXTjD149889
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 14:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=U+vKF+9x7CydU8BYjo9UL2BgJq4v6C9Ddrvv+ysqF0g=;
 b=GZrGBiCRoq36DSW22EF3pDsbIaw92ldSNokjOHq/BYFMGK0PKyMCmFlBJl8dBsTsIKGt
 a/WJlaXo5z3c2serFci6PdBcAu9ZICR5wrlnDJs+WQ5ElJiUWXy+uki0DtMvU/jIav84
 7fKExzlBvvDZzuK0Nt2szf3EVpu0HC3dCjc9glvFgXO6CVdqZbsvLHj3SKSoge27iI3m
 /gAnZaB7HBJYZk+zJ3vdqczQbormXl/xJsZ0gdPwnxzaxeX3JwIVZN1Pf8iHVd2fFY5R
 jVcOA0sXsqpRESoENODDw3HJqDPhm8ZGgNCB2thzhNHXzUQQ0MmXcuApQm+7EwJiaYk6 lA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33vw7vmrhp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 14:56:08 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08UIr1E6007092
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:08 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 33sw99ftqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08UIu7ee10617560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:07 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A03E3124053
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:07 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73738124052
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:07 +0000 (GMT)
Received: from [9.85.190.196] (unknown [9.85.190.196])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS
 for <openbmc@lists.ozlabs.org>; Wed, 30 Sep 2020 18:56:07 +0000 (GMT)
Subject: Re: Security Working Group Meeting - Wed 30 September - results
To: openbmc@lists.ozlabs.org
References: <CAC1Cx+sLnCCWG3UVqaO0ohpsy4ggTQvzQhZHJQBV+EUYb33cQw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <b08bd188-9a9b-c0a1-fbf4-ce96ca98b400@linux.ibm.com>
Date: Wed, 30 Sep 2020 13:56:06 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAC1Cx+sLnCCWG3UVqaO0ohpsy4ggTQvzQhZHJQBV+EUYb33cQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-30_10:2020-09-30,
 2020-09-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 mlxscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009300148
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



On 9/29/20 12:52 PM, Parth Shukla wrote:
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this...
> This Message Is From an External Sender
> This message came from outside your organization.
>
> This is a reminder of the OpenBMC Security Working Group meeting 
> scheduled for this Wednesday September 30 at 10:00am PDT.
>
> There are currently no items on the agenda 
> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>. 
> Assuming no items are added before the meeting then we have the option 
> of 1) cancelling or 2) joining to see if anyone wants to bring up any 
> topics for discussion. What are people's preferences?

Thanks Parth.  We added 4 agenda items and discussed them, as summarized 
below.

- Joseph


1 Call for “Additional Topics for Learning Series” includes a security 
topic: how project report/handle CVEs, designing for security, secure 
boot, privileges etc.  What topics should this cover?

ANSWER:

Joseph will email an outline for the talk.


2 Do we want to look at items from our “security assurance workflow” 
linked above?  For example, what items from the CSIS paper are high 
priority for OpenBMC?

DISCUSSION:

Which processes should the OpenBMC project prioritize? Example:

  *

    Follow the code review process to prevent malicious code being inserted.

  *

    Inadequate project docs.

  *

    Use interface docs to move toward threat modeling.

  *

    What will OpenBMC do if github fails and loses the source code?  How
    do we implement secure disaster recovery?  (Ideas discussed were to
    establish a secure server and then collaborate to merge our private
    copies into the “official” source.)

NEXT Step: Joseph to send email.


3 Getting mTLS-only option to be supported by Redfish standard: 
https://redfishforum.com/thread/375/mtls-enforcement-openbmcs-redfish-implementation

ANSWER:

There is interest in OpenBMC supporting mTLS-only use case.  This is a 
good example of disabling interfaces that are not needed (specifically, 
password authentication).

Please contribute to the Redfish thread.  Attend the private Redfish 
forum meeting to push this forward.


4 Short update on privilege separation progress

ANSWER:

Anton walked us through his progress, including:

  *

    D-bus broker has support for ACLs.

  *

    Enable systemd-nss - Use supplementary groups for dynamic users.

  *

    Working on net ipmid privileges, next is bmcweb.

Start a wiki to track daemons capabilities needed, sandboxing models, 
file access, etc.


>
> I'll assume option 2 as the default and dial in unless we get some 
> consensus on this thread to cancel the meeting instead.
>
> Access, and notes are in the wiki:
> https://github.com/openbmc/openbmc/wiki/Security-working-group
>
> Regards,
> Parth

