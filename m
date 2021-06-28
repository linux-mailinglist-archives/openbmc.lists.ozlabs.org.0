Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE5D3B5C90
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 12:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GD3xL4B6Lz309k
	for <lists+openbmc@lfdr.de>; Mon, 28 Jun 2021 20:38:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=sWjI8cxV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=sWjI8cxV; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GD3x50pNSz2yX0
 for <openbmc@lists.ozlabs.org>; Mon, 28 Jun 2021 20:38:33 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 58398412C8;
 Mon, 28 Jun 2021 10:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1624876709; x=1626691110; bh=xJw
 nYv+XmIjt+pXG5WQGIPrJgnNMutTRPcZFAWE9PBk=; b=sWjI8cxV1QxAToQrfjU
 SRjEwdMWGE94/bHGGN4nFW1PJ5wKn7G7yxbKW4K4EcJy5c7d5KgzzKnrMJ4VD8si
 RT265xR7IMt2DJSbURo28wLyA1klkpy+BzM+bmIxhNjxNc/HlZtrxiJVGUfvRJq6
 SVl3M3zPKVxUu88xQSjA3OeI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K8o-tHXwefH4; Mon, 28 Jun 2021 13:38:29 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 82EE6411F9;
 Mon, 28 Jun 2021 13:38:28 +0300 (MSK)
Received: from [10.199.0.61] (10.199.0.61) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 28
 Jun 2021 13:38:28 +0300
Subject: Re: [PATCH 2/6] usb:gadget:mass-storage: refactoring the SCSI command
 handling
To: Alan Stern <stern@rowland.harvard.edu>
References: <20210626211820.107310-1-i.kononenko@yadro.com>
 <20210626211820.107310-3-i.kononenko@yadro.com>
 <20210627142355.GD624763@rowland.harvard.edu>
 <bc8059b1-0f56-fc3b-6ec8-0bf1043fc9e5@yadro.com>
 <20210628010641.GB638648@rowland.harvard.edu>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <914d457c-2d4a-808b-352c-8acadcecc53a@yadro.com>
Date: Mon, 28 Jun 2021 13:38:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628010641.GB638648@rowland.harvard.edu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.61]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: Felipe Balbi <balbi@kernel.org>, openbmc@lists.ozlabs.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 28.06.2021 04:06, Alan Stern wrote:
> On Sun, Jun 27, 2021 at 08:14:48PM +0300, i.kononenko wrote:
>>
>>
>> On 27.06.2021 17:23, Alan Stern wrote:
>>> On Sun, Jun 27, 2021 at 12:18:15AM +0300, Igor Kononenko wrote:
>>>> Implements a universal way to define SCSI commands and configure
>>>> precheck handlers.
>>>
>>> What is the reason for doing this?
>>
>> I have started implementing a way to specify a backend-file of 
>> mass-storage images greater than 2.1Gb for cdrom-like mediums. 
>> I notice the implementation of each scsi-command handler uses too 
>> many magic-constant, hardcoded indexes and shifts. I decided to 
>> define structures that contained appropriate SCSI-defined fields 
>> and constant-values to clarify the code.
>>
>> Additionally, I noticed, many kernel subsystems use the 'separate
>> data and logic' approach, making a code more explicit and readable.
>> This looks reasonable to me, and a code looks more clearly, at 
>> least - we don't need to examine each magic constant and its purpose. 
>>
>>>
>>> At first glance, it appears you have added a great deal of complexity
>>> to the driver.  The patch replaces a large amount of easily understood
>>> (albeit rather repetitious) code with an approximately equal amount
>>> of rather complicated code.  This does not seem like an improvement.
>>
>> The SCSI-commands table is defined as unifying a way to specify the 
>> SCSI-command handler, with corresponding required data instead pass 
>> it to each repeatedly switch-case block, which makes code more readable
>> to me. If there isn't, I can keep the definition of SCSI-handlers as is,
>> but the SCSI-data structures with their constant-values are still 
>> required, in my opinion.
>>
>>>
>>> Furthermore, the code you removed is flexible; it easily allows for
>>> small variations as neede by some command handlers.  But the code you
>>> added is all table-driven, which does not easily permit arbitrary
>>> variations.
>>>
>>
>> I don't think that the SCSI-command handlers table is an obstacle to 
>> define variation into a specific handler because the current patch has 
>> helper macros, which can specify a behavior for each requirement of 
>> handler.
>>
>> Anyway, the definition of the scsi-command handlers table may be discarded,
>> because this work done to helping developers who will work the 
>> 'usb:gadget:mass-storage' subsystem in the future.
> 
> Can you submit a patch that adds only the data structures without the
> commands table?

Yes, I will remove the mentioned SCSI-handlers table. Thank you!

> 
> Alan Stern
> 

-- 
Best regards,

Igor Kononenko
