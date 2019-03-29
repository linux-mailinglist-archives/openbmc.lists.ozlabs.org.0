Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36A41852F
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:13:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45032815zhzDqN6
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:13:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=codeaurora.org
 (client-ip=198.145.29.96; helo=smtp.codeaurora.org;
 envelope-from=mojha@codeaurora.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=codeaurora.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="FTQr6Kw4"; 
 dkim=pass (1024-bit key) header.d=codeaurora.org header.i=@codeaurora.org
 header.b="FTQr6Kw4"; dkim-atps=neutral
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44WDld67fxzDqX9
 for <openbmc@lists.ozlabs.org>; Sat, 30 Mar 2019 08:05:17 +1100 (AEDT)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id F0A9E60790; Fri, 29 Mar 2019 21:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553893514;
 bh=Bm+FhgcWpIOxRWZE783xh+grrAzGVTZ46mPn0ETr6Eg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FTQr6Kw4PEkGKhKQjiXqbt+EFixyNyzCr5goqfjpMQbtaeZOvJDnERHpr/x+4dhC8
 efBq8miCtuK8hLoez4sqwE9ks/ALxxEGMgLowqNsk1WfGBCKRN20EftdRtAaEjUQ8V
 l67avATSmU4p9KYZM/oS0jVpBpx84fWxhpMUvbkA=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from [10.79.168.116]
 (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: mojha@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 79C40602FC;
 Fri, 29 Mar 2019 21:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1553893514;
 bh=Bm+FhgcWpIOxRWZE783xh+grrAzGVTZ46mPn0ETr6Eg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FTQr6Kw4PEkGKhKQjiXqbt+EFixyNyzCr5goqfjpMQbtaeZOvJDnERHpr/x+4dhC8
 efBq8miCtuK8hLoez4sqwE9ks/ALxxEGMgLowqNsk1WfGBCKRN20EftdRtAaEjUQ8V
 l67avATSmU4p9KYZM/oS0jVpBpx84fWxhpMUvbkA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79C40602FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH v2 2/2] MAINTAINERS: Add maintainer and replacing reviewer
 ARM/NUVOTON NPCM
To: Benjamin Fair <benjaminfair@google.com>, Tomer Maimon <tmaimon77@gmail.com>
References: <20190328235752.334462-1-tmaimon77@gmail.com>
 <20190328235752.334462-2-tmaimon77@gmail.com>
 <CADKL2t5VuWA=Cx9q9Ddx+rZGbe1YoRKMWwfdFOCyxuGiMCOiPg@mail.gmail.com>
From: Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <3fbe0a4e-bb9f-3a20-32e4-6ea0d3155a04@codeaurora.org>
Date: Sat, 30 Mar 2019 02:35:03 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CADKL2t5VuWA=Cx9q9Ddx+rZGbe1YoRKMWwfdFOCyxuGiMCOiPg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:01 +1000
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
Cc: avifishman70@gmail.com, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>, gregkh@linuxfoundation.org,
 joe@perches.com, akpm@linux-foundation.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


On 3/29/2019 11:02 PM, Benjamin Fair wrote:
> On Thu, Mar 28, 2019 at 4:58 PM Tomer Maimon <tmaimon77@gmail.com> wrote:
>> Adding Tali Perry as Nuvoton NPCM maintainer
>> Replacing Brendan Higgins Nuvoton NPCM reviewer with
>> Benjamin Fair.
>>
>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Benjamin Fair <benjaminfair@google.com>


Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>

>
>> ---
>>   MAINTAINERS | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 8b305d2f2a8a..4ece87fcc166 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1893,9 +1893,10 @@ T:       git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
>>   ARM/NUVOTON NPCM ARCHITECTURE
>>   M:     Avi Fishman <avifishman70@gmail.com>
>>   M:     Tomer Maimon <tmaimon77@gmail.com>
>> +M:     Tali Perry <tali.perry1@gmail.com>
>>   R:     Patrick Venture <venture@google.com>
>>   R:     Nancy Yuen <yuenn@google.com>
>> -R:     Brendan Higgins <brendanhiggins@google.com>
>> +R:     Benjamin Fair <benjaminfair@google.com>
>>   L:     openbmc@lists.ozlabs.org (moderated for non-subscribers)
>>   S:     Supported
>>   F:     arch/arm/mach-npcm/
>> --
>> 2.14.1
>>
