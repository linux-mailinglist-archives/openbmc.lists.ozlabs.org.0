Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9675E36F33F
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 02:48:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWYdK3npBz2yxn
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 10:48:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lk7gBnxF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lk7gBnxF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWYd36z0Cz2xfy
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 10:48:07 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13U0XZZV106187; Thu, 29 Apr 2021 20:47:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=2y35qB9MICKANpZWmi1ENNMnj5PtJLgTf+b73YYIutw=;
 b=lk7gBnxFcwMa1B4npyb95OLIuWFcSU0rxKSRbZZ9rzHAX9+p2rLGnSE4PU/xGimNpFLP
 oesIJMCpvdqHmaUazoOIEqlP54gbyunVZ1k+vypD7EFu2zNuw0o5ODlEBPvfth7CGuka
 wBKHEPdPPgRv6IiekLh9PAUWvw+gMU/J2cvtuA8Sw4o2GLdfmwwUxwK2w08EhP7YeS+v
 ORCXA5u2NcShYuPGN47x0DJMZDE0V+WgbeVdnYrmbldHDqJGSnWrQUIfVW8338Rauh2f
 tB2zsF6KUt85Nwr53bzQjlg7IIV18S5NV68OcsCno6ld42obeE7RmmtIRQqazjAXcAIY 4Q== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3885uet73p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 20:47:56 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13U0YQxD020814;
 Fri, 30 Apr 2021 00:47:55 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 3882p7hrdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Apr 2021 00:47:55 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13U0lsmM17367298
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Apr 2021 00:47:54 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5F66B2067;
 Fri, 30 Apr 2021 00:47:54 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34109B2065;
 Fri, 30 Apr 2021 00:47:54 +0000 (GMT)
Received: from demeter.local (unknown [9.160.58.169])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 30 Apr 2021 00:47:54 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code
To: Ed Tanous <ed@tanous.net>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
 <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
 <CACWQX831PF901VVN3-j_6Mh-R3CgQ=uzHmVUvtPsUJFruhGqgw@mail.gmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <a4b74719-d19a-b3f4-3f5f-8447510a8a4a@linux.ibm.com>
Date: Thu, 29 Apr 2021 19:47:53 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CACWQX831PF901VVN3-j_6Mh-R3CgQ=uzHmVUvtPsUJFruhGqgw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0Yk95G26jIGCtOuomZ5AS4pBQvI8XFxu
X-Proofpoint-GUID: 0Yk95G26jIGCtOuomZ5AS4pBQvI8XFxu
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_13:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1011 spamscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104300001
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
Cc: openbmc <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 4/29/21 4:24 PM, Ed Tanous wrote:
> On Thu, Apr 29, 2021 at 2:10 PM Joseph Reynolds <jrey@linux.ibm.com> wrote:
>> On 3/8/21 12:45 PM, Patrick Williams wrote:
>>> On Sat, Mar 06, 2021 at 10:09:36PM -0600, Joseph Reynolds wrote:
>>>> On 3/5/21 1:15 PM, Patrick Williams wrote:
>>>>> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
>>>>> My first reading of what is there, I'm not sure why typical certificate
>>>>> based authentication couldn't solve your needs (but I'm just guessing
>>>>> what your needs are).  It seems like you have a root-authority (IBM), a
>>>>> a daily expiring certificate, and some fields in the certificate you
>>>>> want to confirm (ex. serial number).  I've seen other production-level
>>>>> systems doing similar for SSH/HTTPS without additional PAM modules.
>>>> Our service team requires password based authentication.  Period. And
>>>> they don't like the idea of having to generate a certificate/password
>>>> pair for each service call.  But certificates offer the best technology
>>>> we have to solve the access problem.  And we are not yet prepared to go
>>>> to a certificate-only solution. ... So this is where we are at.
>>>>
>>>>>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
>>>>>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
>>>>>> proposed ibm-pam-acf module is intended only for IBM Enterprise
>>>>>> systems.  The intended implementation is based on standard cryptography
>>>>>> techniques and could be developed into a general authentication
>>>>>> solution, but the ACF is specific to IBM in terms of its exact format
>>>>>> and content, and I expect it will only be used by IBM and its partners.
>>>>> Are you planning to open up the tools necessary to create these ACFs?
>>>> No, I hadn't been, but good idea!  We have prototype tools to generate
>>>> and read the ACF.  They should be useful to our test team.
>>>> There should be nothing secret in the code.  ("The only secret is the
>>>> private key.")  I'll check with my security team.
>>> My two concerns about hosting a repository for this are:
>>>      1. Is it actually a secure method?
>>>      2. Is it [potentially] useful to anyone else?
>>>
>>> WRT, #1, I think we need more details to make an assessment.
>>>
>>> For #2 I think there is some unsettled debate around "what do we do
>>> about code that is only ever going to be useful to one company"?
>>> Opening up the tools would at least make it possible that someone else
>>> could find this useful.  I think the proposed "Repository Review Board"
>>> might work on better guidance otherwise.
>>>
>>> Beyond that, I just have the normal "is this the right way to be doing
>>> this" questions.  You've answered that somewhat with the Certs.  I may
>>> disagree with it, but you obviously know your support team better than I
>>> do.
>>>
>>> I recommended some SSH support for certificates before.  Based on your
>>> ask for password-based authentiation, I would suggest looking into
>>> pam_2fa[1] as a potential implementation as well.
>> ...snip...
>>
>> Let's restart this thread from where we left off.
...snip
>>
>> So ... does the GitHub OpenBMC organization host vendor specific repos
>> (perhaps github.com/openbmc/ibm-misc), or does the source code go
>> somewhere else (such as IBM's public fork in
>> github.com/ibm-openbmc/pam-ibm-acf)?
> FYI, both of these return 404.  I'm assuming the permissions don't
> make them public yet.

I provided those URLs as concrete suggestions for where to host 
vendor-specific code.  They do not exist.  Sorry about the confusion.  
It is late in the day....:)
I have a weak preference to host ibm-specific code on 
github.com/openbmc/meta-ibm (maybe in subdirectory pam-ibmacf).  I 
realize this will set a precedent for the OpenBMC project, and can work 
either way.

-Joseph

>
>> - Joseph
>>

