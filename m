Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3980C36F194
	for <lists+openbmc@lfdr.de>; Thu, 29 Apr 2021 23:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWSnr15Bkz302G
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 07:10:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rxAOhxnw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rxAOhxnw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWSnZ0BMfz2y6C
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 07:10:09 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TL3Prt157357; Thu, 29 Apr 2021 17:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Ubz2tOlTaYeIRlngbVqDuTf2r7CsaNVy89ZNPixitfg=;
 b=rxAOhxnwNt6iT0hLe9R9Gvvm/yZUN788FSduwL92Ca/aU6j/AEaNdpYrF//KvhdlzBz/
 XrtmU9cey6OKiqgRR4e93s4t+Otuz+gxJmhIfAY+HwzM7w+9DP5EjBm3JHEUAa7s7Bww
 6xoCtEqeVA1UQ7nRTIxvQqy/E5SQbHTKlSC84juDsNJifhqq8Z0gm6NzIaSH7KizMxmA
 36RtFEG3YfjLzfEgjoWGVr0TamrDBuduyrHGJvoqcUY//vobTDBBPet3louGmHyzk4Pg
 AoLeR670RR/F4Ve5t+6dxPJDEi3W7l8KfhF0Dy9W7zhcgWxoLNngGGo+/9EI5uCYuZz6 Tg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3882613naj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 17:10:02 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TL7HgA026583;
 Thu, 29 Apr 2021 21:10:01 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma04dal.us.ibm.com with ESMTP id 384aya8sdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 21:10:01 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TLA0Re30540088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 21:10:00 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9CE9B2067;
 Thu, 29 Apr 2021 21:10:00 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0648CB205F;
 Thu, 29 Apr 2021 21:09:59 +0000 (GMT)
Received: from demeter.local (unknown [9.160.58.169])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 29 Apr 2021 21:09:59 +0000 (GMT)
Subject: Re: Request new repo for IBM-specific code
To: Patrick Williams <patrick@stwcx.xyz>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <b8af3438-f85a-cb82-c88c-9c4e120399e9@linux.ibm.com>
 <YEKDY6+zfW5Uuqkl@heinlein>
 <dc7eb87e-c13f-dcb7-7b98-dbeb382d7caa@linux.ibm.com>
 <YEZwz6C5uGk8Vobs@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <2b7c9c78-37c5-5964-5f4c-d07fadf3590a@linux.ibm.com>
Date: Thu, 29 Apr 2021 16:09:58 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YEZwz6C5uGk8Vobs@heinlein>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zx05rLDDQY3RFtbwBhXCs4U8gtPuYJBO
X-Proofpoint-GUID: Zx05rLDDQY3RFtbwBhXCs4U8gtPuYJBO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_11:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290135
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

On 3/8/21 12:45 PM, Patrick Williams wrote:
> On Sat, Mar 06, 2021 at 10:09:36PM -0600, Joseph Reynolds wrote:
>> On 3/5/21 1:15 PM, Patrick Williams wrote:
>>> On Thu, Mar 04, 2021 at 09:14:47PM -0600, Joseph Reynolds wrote:
>>> My first reading of what is there, I'm not sure why typical certificate
>>> based authentication couldn't solve your needs (but I'm just guessing
>>> what your needs are).  It seems like you have a root-authority (IBM), a
>>> a daily expiring certificate, and some fields in the certificate you
>>> want to confirm (ex. serial number).  I've seen other production-level
>>> systems doing similar for SSH/HTTPS without additional PAM modules.
>> Our service team requires password based authentication.  Period. And
>> they don't like the idea of having to generate a certificate/password
>> pair for each service call.  But certificates offer the best technology
>> we have to solve the access problem.  And we are not yet prepared to go
>> to a certificate-only solution. ... So this is where we are at.
>>
>>>> Note the [pam-ipmi modules][] are scoped to the OpenBMC project because
>>>> the IPMI implementation is shared by all of OpenBMC.  By comparison, the
>>>> proposed ibm-pam-acf module is intended only for IBM Enterprise
>>>> systems.  The intended implementation is based on standard cryptography
>>>> techniques and could be developed into a general authentication
>>>> solution, but the ACF is specific to IBM in terms of its exact format
>>>> and content, and I expect it will only be used by IBM and its partners.
>>> Are you planning to open up the tools necessary to create these ACFs?
>> No, I hadn't been, but good idea!  We have prototype tools to generate
>> and read the ACF.  They should be useful to our test team.
>> There should be nothing secret in the code.  ("The only secret is the
>> private key.")  I'll check with my security team.
> My two concerns about hosting a repository for this are:
>     1. Is it actually a secure method?
>     2. Is it [potentially] useful to anyone else?
>
> WRT, #1, I think we need more details to make an assessment.
>
> For #2 I think there is some unsettled debate around "what do we do
> about code that is only ever going to be useful to one company"?
> Opening up the tools would at least make it possible that someone else
> could find this useful.  I think the proposed "Repository Review Board"
> might work on better guidance otherwise.
>
> Beyond that, I just have the normal "is this the right way to be doing
> this" questions.  You've answered that somewhat with the Certs.  I may
> disagree with it, but you obviously know your support team better than I
> do.
>
> I recommended some SSH support for certificates before.  Based on your
> ask for password-based authentiation, I would suggest looking into
> pam_2fa[1] as a potential implementation as well.
...snip...

Let's restart this thread from where we left off.  I am working on an 
IBM-specific design to explain the BMC portions of the IBM ACF design to 
the OpenBMC community.

For item 1 ("is the ACF design a secure method"), we discussed an 
abbreviated threat model in this email thread.  From the service 
organizations point of view, it only allows authorized service reps into 
the service account.  And from the BMC admin's point of view, they can 
either lock out or authorize the service user via how they handle the 
ACFm but they don't know the password so they cannot login to the 
service account.
The ACF features including its digital signature, matching system serial 
number, and expiration date -- all of these limit which ACFs a BMC will 
accept.  The new Linux-PAM module login is a straightforward decoding 
and validation of the ACF, and then checking the password hash.  We 
discussed using pam_2fa in this email thread, and I believe it only 
trades the complexity of a PAM module (which I regard as 
straightforward) for the complexity of a REST server.

For item 2 ("is it useful to anyone else"), the answer is no.  This will 
ever only be useful to IBM and to vendors who clone OpenPOWER systems 
including IBM's approach to service account access.

So ... does the GitHub OpenBMC organization host vendor specific repos 
(perhaps github.com/openbmc/ibm-misc), or does the source code go 
somewhere else (such as IBM's public fork in 
github.com/ibm-openbmc/pam-ibm-acf)?

- Joseph

