Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9E3931B3
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 17:05:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrWMX3yvVz2ysq
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 01:05:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hb1LlKBD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hb1LlKBD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrWM76Z56z2yjL
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 01:04:51 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14RF4a5U014795; Thu, 27 May 2021 11:04:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=UQfn8uI8rXdvIehMp+He+3hrLIC5onfrMHoQul4UE1E=;
 b=hb1LlKBDkkLvrV/lx8vpJUfdTMp+KJwDsxqFxJVsufCVGflwCdY+MqPq3CL5yHCpJ+Ew
 OO8g+yLEDekVw8g3kc0QtogiJFzMSUyJs4qyWmp+eV9KtrUEG293Ivh4P9j2ap2NC7sj
 fSHJsvf1eUdJ9Fm09iPYQzA/FKWwNmHN2ea4Dn1B2HF8JGJDZFsnncgqkZWYK49jhvcz
 hEZpA6oJgRi5jfDh7Z1zoOYF6KiOlZDJFDzXcE7tu9hKJ5r15pchYa5idt4KAd4XrqPW
 0zZPFQ5cZfvKVeh3AhhUobh2yDeJj/94FXh/zcStVsIaA13IBRNsuDhuhFvHcGo/+rr9 DA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38td9as1mu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 11:04:45 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14RF4Y5c016156;
 Thu, 27 May 2021 15:04:45 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 38s1vadtc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 May 2021 15:04:44 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14RF4EBT8126904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 May 2021 15:04:14 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81A3C13606E;
 Thu, 27 May 2021 15:04:14 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2BF3C136076;
 Thu, 27 May 2021 15:04:14 +0000 (GMT)
Received: from demeter.local (unknown [9.65.217.22])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 27 May 2021 15:04:13 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 26 - results
To: Patrick Williams <patrick@stwcx.xyz>
References: <8b3c88c2-cc9f-3ebe-2e4d-61974ae27519@linux.ibm.com>
 <30dde28a-38ff-6c59-57f4-23ed3fb46130@linux.ibm.com>
 <YK+XA0umnkj1EveY@heinlein>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <dba5a6b8-3873-422b-a36a-32b39b2d560b@linux.ibm.com>
Date: Thu, 27 May 2021 10:04:12 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <YK+XA0umnkj1EveY@heinlein>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dVT5hhxmdAGUsm8M3rOSDCdU7lXFNIvo
X-Proofpoint-ORIG-GUID: dVT5hhxmdAGUsm8M3rOSDCdU7lXFNIvo
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-27_07:2021-05-27,
 2021-05-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105270099
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

On 5/27/21 7:56 AM, Patrick Williams wrote:
> On Wed, May 26, 2021 at 01:59:57PM -0500, Joseph Reynolds wrote:
>> On 5/26/21 8:43 AM, Joseph Reynolds wrote:
>   
>>> 1. Followup from last meeting re uboot, kexec, sysrq-trigger on ARM
>>> architecture.
>> We re-hashed the discussion, added new information, and added new concerns.
> Could you paste the minutes here when you reply to these?  It is kind of
> hard to have any discussion with the rest of the community when you have
> 2-3 levels of indirection to get at the words.

Thanks for your email!

Yes, I've waffled between cut/paste of the minutes and summarizing 
them.  I prefer to cut/paste, so I'll do that consistently from now on.

>> We think there are cultural differences between Linux and open source
>> with respect to how we handle security items (but we didn't get into any
>> details).
> It is really hard to know what this is referring to or means or how it
> might impact us.  There is no such thing as "open source" as something
> different and separate from "Linux".  Certainly many sub-communities
> within the OSS world have different priorities and approaches when it
> comes to security.  This sounds like it was just idle chatter.


I wasn't sure what this meant when it was said.  It believe it refers to 
my floundering interactions with 
https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/42948
Nobody at the meeting followed up on that statement. I've since address 
the comment in the review.

>> Kernel's modules expect BMC hardware to be in a particular state. Kernel
>> kexec’ing might lead to undefined behavior for such modules.
> I think we're just talking about normal bugs here.  Those would be
> caught and fixed in testing, wouldn't they?
>
>> Worried about interactions with secure boot.
>> Scenario: kernel 1 boots, then the BMC gets compromised, then kernel 2
>> is kexec’d.
> What is the "worry" here?  This isn't an unsolved problem as servers
> have to deal with this all the time.
>
> This is why secureboot itself isn't really all that useful without
> attestation.  There are going to be compromised images.  You put them in
> a block list.  When you kexec, since you haven't gone through a reset,
> the TPM still contains the measurements from the compromised / blocked
> image (which have now been extende with the kexec measurements as well).
> So any system running code that is in your block list is still blocked
> because you can't trust that it wasn't compromised.

The worry is that security boot is not a complete solution, as you 
pointed out.

>> Kexec does not significantly improve the boot time of BMC.
> And?  Was someone suggesting it would?  Not sure the context.
>
> It seems like whoever is involved in these discussions is missing the
> purpose of enabling kexec.  I don't think anyone is talking about using
> kexec as a way to make some minor improvement in a once-in-a-while
> OpenBMC upgrade + reboot path.
>
> Kexec is being talked about because it is *the way you get kernel debug*
> now.  Kdump requires kexec.  When the kernel crashes, you kexec to the
> kdump kernel, it garthers a bunch of data, hopefully stores it in flash,
> and then you can do a proper reboot back to your buggy-crashing kernel.

I get the same feeling.  Using kexec was brought up in the context of 
kernel debug, and the conversation wandered off. :-(

- Joseph

