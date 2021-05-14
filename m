Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C40381036
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 21:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhdFK2QgSz302g
	for <lists+openbmc@lfdr.de>; Sat, 15 May 2021 05:02:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NbbRzI43;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jrey@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NbbRzI43; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhdF10w7Kz2xyG
 for <openbmc@lists.ozlabs.org>; Sat, 15 May 2021 05:02:12 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EIWndi191584; Fri, 14 May 2021 15:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=k5txx9sfWERqIY4RE/wTdzQ8EOmRwGswNUjjkbnJk3o=;
 b=NbbRzI43W1Hf6o2z/EIWZzhYPruTiNTQgA2fdZ+oClInBcfHngcrtLc5aZ8S/bvqUXYW
 X40wsMYjlONAQT1SxZfTksWWCLvUE4lbQhykoOEnuyz5zytMYbZLnW8iJl0zy3wLn5bU
 kFGIFY/Coiioo48sioJDDq/nVQnwaj7uffTvoV2c5u8wENlSH0I13nmEjYtZBwpgFr9D
 Gj1gRzGNzvmzhsS7ng/HFnZXZ7bhrehiiA6Bu2o34CsRKBHT20PmthwipWQ7ukAvjQE+
 OOkB3lDwQ8MHcID34JgiHw8278mimUCeUYD8JZDo6EdbMe83EgXpiH/WE3snWPAbsAMk fg== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38hw3u2sg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 15:02:06 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14EIuFJr009216;
 Fri, 14 May 2021 19:02:06 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 38hc75x7u7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 May 2021 19:02:06 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14EJ25hV6553998
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 19:02:05 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D27EBE051;
 Fri, 14 May 2021 19:02:05 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1ABE9BE053;
 Fri, 14 May 2021 19:02:05 +0000 (GMT)
Received: from demeter.local (unknown [9.160.6.19])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 14 May 2021 19:02:04 +0000 (GMT)
Subject: Re: Security Working Group - Wednesday May 12 - results
To: Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org
References: <35156c27-e195-c238-1bb9-d20a30db3c63@linux.ibm.com>
 <8febdc9d-08bb-4094-9cad-7e6035c5bd71@linux.ibm.com>
 <99f4fa9d-9fc2-4092-be1f-d3246379206a@www.fastmail.com>
From: Joseph Reynolds <jrey@linux.ibm.com>
Message-ID: <9f59a396-7a97-71b1-8cba-210545b0b023@linux.ibm.com>
Date: Fri, 14 May 2021 14:02:03 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
In-Reply-To: <99f4fa9d-9fc2-4092-be1f-d3246379206a@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OtoomdwWqj6BSFfVmGh3QpYpDS6rJz5W
X-Proofpoint-ORIG-GUID: OtoomdwWqj6BSFfVmGh3QpYpDS6rJz5W
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-14_08:2021-05-12,
 2021-05-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105140144
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



On 5/12/21 7:25 PM, Andrew Jeffery wrote:
> Hi Joseph,
>
> It tends to be useful to Cc the developers doing the work. Posting to
> the list without Cc'ing relevant people leaves discovery of your
> discussion to chance, where as adding them on To: or Cc: does two
> things:
>
> 1. Raises the chance that they'll pay attention to your discussion
> 2. Removes the impression that you're intentionally talking past them
>
> Please try to engage the relevant people directly in the discussion by
> adding them in To: or Cc.

Andrew,

Good advice, thanks!  This was not my topic.  I was simply recording the 
conversation and did not have a chance to follow up.  I am glad it got 
your attention.  In general, it is hard to know who to contact.  Note 
that I am following up on this item privately through other channels.  
Finally, during the meeting, I encouraged attendees to make comments in 
the relevant gerrit review process.

- Joseph

>
> On Thu, 13 May 2021, at 03:48, Joseph Reynolds wrote:
>> On 5/11/21 8:59 PM, Joseph Reynolds wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting
>>> scheduled for this Wednesday May 12 at 10:00am PDT.
>>>
>>> We'll discuss the following items on the agenda
>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>,
>>> and anything else that comes up:
>>>
>> Three items were discussed.  You might want to start with item 3 first
>> to introduce the first two.  Summary:
>>
>> 1. Security impacts of enabling kexec (load and optionally execute new
>> kernel) in the BMC's production kernel.  How does this work and play
>> with secure boot and with IMA?
> Have you engaged with OpenBMC's kernel developers? They might be are
> interested in this problem. I'm vaguely aware of some work-in-progress
> patches that allows kexec to load FIT images, which can be signed and
> validated. This would mitigate execution of arbitrary kernels and also
> helps avoid the problem of shipping multiple kernel binaries or
> extracting artefacts from a FIT to pass to kexec.
>
>> 2. What are the security impacts of having the proc file system file
>> /proc/sysrq-triggerwhich can cause kernel panics which can cause the BMC
>> to terminate processing?
>>
>> 3. In general, how can you (an operator or the BMC's host system)
>> recover a BMC which has become unresponsive, for example, because its
>> kernel processing has failed.  A design introduces using
>> /proc/sysrq-triggertogether with a recovery kernel installed by kexec.
> To be clear, the use of /proc/sysrq-trigger is a temporary hack to
> reboot the BMC in the absence of kexec/kdump. Once those features are
> merged the application implementing this behaviour can invoke kexec
> directly. The slight advantage of /proc/sysrq-trigger is that with or
> without kexec/kdump enabled the BMC will reboot, and if kexec/kdump are
> enabled then it will automatically take advantage of them.
>
> In the specific case p10bmc platforms the host has access to a GPIO
> tied to the BMC's EXTRST line, so with or without this software feature
> the host can mount denial of service attacks of arbitrary length. This
> hardware design places the BMC and host firmware in the same trust
> domain.
>
> Andrew

