Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFA046E6D7
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 11:42:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8rFb1zg0z3bXP
	for <lists+openbmc@lfdr.de>; Thu,  9 Dec 2021 21:42:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=cIyALKII;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.kononenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=cIyALKII; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8rF827ntz2yp2
 for <openbmc@lists.ozlabs.org>; Thu,  9 Dec 2021 21:41:48 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 29BD243802;
 Thu,  9 Dec 2021 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1639046501; x=1640860902; bh=V0m
 3ybUwfOFj+vkz87laqbxFvBMZoeg1++YQ1ATZbnQ=; b=cIyALKIIGImQ0ZAQFtk
 kWyE8L6gQMscDNcgF4oRYQpTE1RRycaHp/iiotGh6bw/F433BA7qfzzmej/rv8AR
 h3XRhbak2uRmcUAP3QLytuBHmLJ7p8zl4oHf7shOI+qSsZ5R/ljtCINLXSN5U+QL
 BRk2ebNQqbIo58RpcjwerenQ=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zbg7vCFscDLj; Thu,  9 Dec 2021 13:41:41 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2201C42E30;
 Thu,  9 Dec 2021 13:41:41 +0300 (MSK)
Received: from [10.199.18.103] (10.199.18.103) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 9 Dec
 2021 13:41:40 +0300
Subject: Re: Virtual Media repository request
To: "Czarnowski, Przemyslaw"
 <przemyslaw.hawrylewicz.czarnowski@linux.intel.com>, Patrick Williams
 <patrick@stwcx.xyz>
References: <DM4PR11MB52476717C6A134B92BD62061B96E9@DM4PR11MB5247.namprd11.prod.outlook.com>
 <YbDjsxZYYtnNPsCK@heinlein>
 <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
From: i.kononenko <i.kononenko@yadro.com>
Message-ID: <012fbafd-dc98-0f59-51d6-4d09f45d5412@yadro.com>
Date: Thu, 9 Dec 2021 13:41:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <475ba120-3734-8bf1-868f-83f48f10ccac@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.18.103]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello!

Here I have some points about the Virtual Media feature.
Some time ago I have worked to improve virtual media, in the YADRO we implement 
the feature based on the `Intel-BMC/provingground/virtual-media` implementation.

Since the project was not be upstreamed, that was our private changes. 
Today we have the good news, the project will be published and I guess our changes
could be provided too.

On 09.12.2021 11:56, Czarnowski, Przemyslaw wrote:
> On 08.12.2021 17:56, Patrick Williams wrote:
>> On Tue, Dec 07, 2021 at 03:50:47PM +0000, Hawrylewicz Czarnowski, Przemyslaw wrote:
>>
>> Hello Przemyslaw,
>>
>> Thank you for wanting to work at getting this code mainlined.  I know there has
>> been quite a bit of interest from various people outside Intel.
>>
>>> I would like to request for new Virtual Media service repository (based on the design document located here: https://github.com/openbmc/docs/blob/master/designs/virtual-media.md).
>>
>> I know you've got a pending commit to update some pieces of this design.  Since
>> none of the code has been submitted since the design was originally written, do
>> we need anyone to re-read it and see if anything has changed in the rest of the
>> codebase that needs design updates?
> 
> The code base for VM is "live" at the moment and besides asynchronousness nothing needs to be updated at the moment.
> 
> There is a limitation for DVD iso's which lies in USB gadget and how it is implemented, so maybe there could be some kind of note about that.
> 

Some months ago I published changes for the kernel:usb-gadget:mass-storage that aims
to support CD/DVD/BD media types (based on the image size).
The work has not been completed, the changes require to be properly formed. Looks 
like the publishing virtual media repository is a good point to actualize that patch
series.

Please, feel free to suggest helpful notes to improve a VM consumer interface; e.g. 
I still don't know how to better determine VM-image type - by the image size, how I 
did, or by sysfs interface(like the `cdrom` is specified).

>>
>>> The service itself is a reworked Virtual Media which early stage is available here: https://github.com/Intel-BMC/provingground.
>>>
>>
>> What did you have in mind for maintainer structure on this?  I'd ideally like to
>> see someone outside of Intel be a co-maintainer with you since:
>>
>>    - This code was initially written as experimental Intel-only repository
>>      without any community feedback and
>>    - The current code hasn't been touched in 2 years and best practices have
>>      likely changed.
>>    - You're not currently a maintainer on any other repositories.
> 
> The code base exposed in provingground was under the development at that moment and actually shouldn't be submitted. The code is updated now (still needs some polishing I suppose) but I am ready to push updated sources and ask the community to review it.
> 
> Right now I am the main person for VM in Intel, but actually I was thinking about some co-maintainership in case there are other parties willing to have contribution in the code. This could be worked out during review process.

Since I have some work to support VM and have examined the virtual-media implementation
by Intel I could contribute them.

> 
>>
>>> And additional question: is there anything to do in order to enable CI for this repo?
>>
>> Once the repository is set up, Andrew G can enable CI on it fairly quickly.
>>
> 
> Glad to hear that.
> 
> 

-- 
Best regards,

Igor Kononenko
