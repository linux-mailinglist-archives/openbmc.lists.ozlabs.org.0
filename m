Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5871730E62E
	for <lists+openbmc@lfdr.de>; Wed,  3 Feb 2021 23:42:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWGry3010zDwqD
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 09:42:10 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=47.88.44.36;
 helo=out4436.biz.mail.alibaba.com; envelope-from=snowyang@linux.alibaba.com;
 receiver=<UNKNOWN>)
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVxQt1DmxzDwpN
 for <openbmc@lists.ozlabs.org>; Wed,  3 Feb 2021 20:36:53 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R701e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=alimailimapcm10staff010182156082;
 MF=snowyang@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
 TI=SMTPD_---0UNlK4U0_1612344974; 
Received: from B-265GMD6R-1838.local(mailfrom:SnowYang@linux.alibaba.com
 fp:SMTPD_---0UNlK4U0_1612344974) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 03 Feb 2021 17:36:14 +0800
Subject: Re: Change in ...meta-alibaba[master]: thor: initial machine creation
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <gerrit.1605682495000.I03f07f9e29b4ec19b5b169f14489e8d7ed786600@gerrit.openbmc-project.xyz>
 <4ufnKrB2SUu3u1SbJu709Q@ismtpd0004p1sjc2.sendgrid.net>
 <94c8af34-dcae-e33d-a0f0-a5540ef518fd@linux.alibaba.com>
 <YAneI7zHQx217lmu@heinlein>
 <5841da60f00cade13d87d5b8795f8a25021c2e44.camel@fuzziesquirrel.com>
 <f8678061-4662-4445-a4d0-016040f00979@linux.alibaba.com>
 <0008fa42-2a5c-b092-8da6-7eaa91e775f7@linux.alibaba.com>
 <0FC93EA6-AE09-46A6-9BF2-36471B85755B@fuzziesquirrel.com>
 <fe3fef11-56c7-85a4-b3fc-35ab29e99f60@linux.alibaba.com>
 <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
From: snowyang <SnowYang@linux.alibaba.com>
Message-ID: <e1552f02-439a-13b0-f8e7-b9e19b5e2849@linux.alibaba.com>
Date: Wed, 3 Feb 2021 17:36:14 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:85.0)
 Gecko/20100101 Thunderbird/85.0
MIME-Version: 1.0
In-Reply-To: <20210202135122.kbvdfnq6ed2onuhi@thinkpad.fuzziesquirrel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Thu, 04 Feb 2021 09:39:52 +1100
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

Hi Brad,

     Cool， it is ok. thank you very much.

Thanks,
Moyan

On 2021/2/2 21:51, Brad Bishop wrote:
> On Tue, Feb 02, 2021 at 09:43:05PM +0800, snowyang wrote:
>>
>>     Thank you very much. I have just tried to push the code to 
>> openbmc/openbmc with the name of moyan-yyb, and i found there are too 
>> many branchs and  i don't know which one i should choose(Or maybe 
>> should i create a new branch used to save the code?).Then i try to 
>> push it to the branch of master 
>
> ^ this is the correct branch.
>
> Hi - can you share the command you used to push?  It should look 
> approximately like:
>   git push <gerrit-remote> HEAD:refs/for/master
>
> It should _not_ look like this:
>   git push <gerrit-remote> HEAD:master
>
> thx - brad
