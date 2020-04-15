Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B3D1AB28A
	for <lists+openbmc@lfdr.de>; Wed, 15 Apr 2020 22:33:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492YwY4MbnzDqfW
	for <lists+openbmc@lfdr.de>; Thu, 16 Apr 2020 06:33:49 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492YvN3GXjzDqHK
 for <openbmc@lists.ozlabs.org>; Thu, 16 Apr 2020 06:32:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03FK3rR6013015; Wed, 15 Apr 2020 16:32:40 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30dnmb1rmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 16:32:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03FKUINX004472;
 Wed, 15 Apr 2020 20:32:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 30b5h75rmk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Apr 2020 20:32:39 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03FKWcUi61538704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Apr 2020 20:32:38 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22A7C6A04F;
 Wed, 15 Apr 2020 20:32:38 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 772566A047;
 Wed, 15 Apr 2020 20:32:37 +0000 (GMT)
Received: from demeter.roc.mn.charter.com (unknown [9.85.154.32])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 15 Apr 2020 20:32:37 +0000 (GMT)
Subject: Re: ipmi password storage
From: Joseph Reynolds <jrey@linux.ibm.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20200413230015.GB9295@mauery.jf.intel.com>
 <cbe4d40f-7d3f-b448-af98-8d680b41bc2b@linux.intel.com>
 <20200414191106.GD9295@mauery.jf.intel.com>
 <aee8d5c8-b5cf-32d8-b80d-36443182ab58@linux.ibm.com>
 <20200414224419.GG9295@mauery.jf.intel.com>
 <9b0b9c1f-f7ec-9b6c-3ded-340d65881c5c@linux.ibm.com>
Message-ID: <ba8c6fbe-e304-51a6-93ba-b057853fa7d5@linux.ibm.com>
Date: Wed, 15 Apr 2020 15:32:36 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9b0b9c1f-f7ec-9b6c-3ded-340d65881c5c@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-15_07:2020-04-14,
 2020-04-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004150149
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
Cc: openbmc@lists.ozlabs.org, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/14/20 5:48 PM, Joseph Reynolds wrote:
>
>
> On 4/14/20 5:44 PM, Vernon Mauery wrote:
>> On 14-Apr-2020 05:18 PM, Joseph Reynolds wrote:
>>> On 4/14/20 2:11 PM, Vernon Mauery wrote:
>>>> On 14-Apr-2020 06:27 PM, Alexander Tereschenko wrote:
>>>>> To be more specific, I'm considering two attack scenarios in the 
>>>>> below comments:
>>>>> 1) The attacker gets into BMC and is able to copy off the data 
>>>>> files, including ipmi_pass. This IMHO is a more realistic scenario 
>>>>> in this case.
>>>>> 2) The attacker gets ipmi_pass file/contents only, without being 
>>>>> able to retrieve anything else.
>>>>>
>>>>> Which ones do *you* have in mind? For the sake of discussion, it 
>>>>> would be helpful to specify them all and see how potential 
>>>>> solutions address them.
>>>>
>>>> Attack one is the most likely, since if you can read one file, you 
>>>> can probably get any/all of them.
>>>
>>> An alternate solution is to make those file readable only by root, 
>>> restricting root logins, and restricting SSH access in general.  See 
>>> https://github.com/ibm-openbmc/dev/issues/1528
>>
>> Changes have been made already to restrict permissions to 0600. The 
>> problem is that currently that is not much of protection at all 
>> because all the processes run as root right now anyway.
>
> Understood.  An attacker who gets control of any process will have 
> read access to this file, etc.
> The issue that all processes run as root is documented here 
> https://github.com/openbmc/openbmc/issues/3383
> and was recently discussed in the security working group, 2020-04-01 - 
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
>
>
> - Joseph

We discussed this in the OpenBMC security working group meeting 
2020-04-15 - 
https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI

My summary:

There is a patch to fix the file permissions so only root can read the 
files.  It addresses the most severe aspect of the vulnerability.  With 
the patch, only the root user can exploit the vulnerability.

But even with the fix, the underlying problem remains that encrypted 
passwords are stored on the BMC's file system that the root user can 
decrypt.  The root user should be trustworthy, but also should not have 
such access to user passwords.  Also, some other user can become root, 
making it a priority to restrict root access (including access to SSH 
and to the su and sudo commands).  Also, the fact that most OpenBMC 
processes run as the root user id (userid=0) makes escalation more likely.

Additional attempts were made to secure the ipmi_pass file, but the 
cost/benefit is unclear:

1. Encrypting the file differently was considered, but provides little 
benefit because the decryption credentials are still available to root.  
And we don't have a TPM and are not using ARM TrustZone to help isolate 
access to the key.  And changes like this cause upgrade and downgrade 
complications.

2. Abandoning RMCP+ would mean the ipmi_pass file is no longer needed, 
so the problem goes away.  We would need to create a new way for 
ipmitool to authenticate with the ipmi network daemon, thus creating a 
de-facto standard.  That would be a bunch of work and may extend the 
lifetime of IPMI.

So the answer for now is to fix the file permissions, pending coming up 
with a better solution.

- Joseph

... snip...

