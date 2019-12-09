Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B6D117415
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 19:25:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Ws7Q6PFWzDqPC
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 05:25:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bYAHX1qF"; 
 dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ws6b4YwZzDqP4
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 05:24:37 +1100 (AEDT)
Received: by mail-ot1-x336.google.com with SMTP id i4so13088302otr.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 10:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1h4A97IiaWBtqO3S38g2p+BOOtD0zcMI1n95RzjDVQ8=;
 b=bYAHX1qFaWgB0EqQW6eu3Qwt7hcOz90af7QIMC72grG3LO1hi46jy27cGhne6NbO+I
 dpIAjMVpnCPTTRBX2/htRxFYlablFESVfqsWtsJPiM+MsJjvgGJb9cP+jf+Lf4iBXDld
 ubHvHzwb31mtARmREVw0HskHekfCnZC/0ee++DzE6D7mlzAND72EmhXzS8KGtj4YjWED
 MIHDj/pcbKfEuhhZNegtRLa4Rr10WiGK9HeTgmp3qp2yM14mHtSy3p8dLETtLkgK5nFu
 hn/TbzORrrP1cq80rvaSTxKdWbdwK73t6un1z3CTDVBojretLKbgbM4h+EakasKdxOp3
 54hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1h4A97IiaWBtqO3S38g2p+BOOtD0zcMI1n95RzjDVQ8=;
 b=ZVsmbn1foSGnMKbfmpA8Hb1M/UHded1qgmDrmnMMdw4QTXpsYIFzZBuNKmH7ji2Cpi
 qdTW4phb7YdtCfPqFAQuic54DHWhvpn6k71TZCJBfNu0OGlSxXHzvQHS4XdGrk/sLisn
 217yYHlJ8IGevs9nXjMzjq5FSc7xn0vJS7Guz9hSY7BWaoPs5Tve6UaC5xJKTr95jmj1
 BEp5KwoY3IJvZi696M8ogoWYjUoeWG/LMO37lTWO2rAXhn3SLoy+fKEBPAZCwffDfJo8
 oHf/n8XXKtaCVTnWlSJSHxA/9t+GNJjLdrOwUYgu3VYwSNW6UTu+hRh0yCuH0Dx6XfMa
 sRNw==
X-Gm-Message-State: APjAAAWqntYdrfKCmsxlKvj+9rgRj4jaVLACUk7uXJOmLYjybIl5kNXz
 VIhwVm1IPfM2Ljyei35Lz4/unk1R
X-Google-Smtp-Source: APXvYqwv/QoiWMMwVrJbnuY0NThmW0gvuLDMT8vGUec3bLNBhCizQvKCswkP09EGK9IAC9gEo61oOA==
X-Received: by 2002:a9d:7a8f:: with SMTP id l15mr21444168otn.109.1575915872828; 
 Mon, 09 Dec 2019 10:24:32 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id r25sm221889otk.22.2019.12.09.10.24.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 10:24:32 -0800 (PST)
Subject: Re: OpenBMC Project metrics
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
 <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <391eaabe-6ade-e23d-97ef-a0c1d6630f8c@gmail.com>
Date: Mon, 9 Dec 2019 12:24:31 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <b9ef7897-f4a7-445d-a79b-289b399528ee@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 12/8/19 6:06 PM, Andrew Jeffery wrote:
> 
> 
> On Sat, 7 Dec 2019, at 00:03, krtaylor wrote:
>> On 12/4/19 4:33 PM, Andrew Jeffery wrote:
>>>
>>>
>>> On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
>>>> All, I just posted the project merge metrics for September and
>>>> October. I will be updating the company/developer lists for November
>>>> and posting those shortly. Enjoy.
>>>>
>>>> https://github.com/openbmc/openbmc/wiki/Project-Metrics
>>>>
>>>> NOTE: these metrics should be used *very carefully*. They do not
>>>> represent the total contributions to the project. We value
>>>> contributions many that do not show up in these charts, including
>>>> reviews, mail list involvement, IRC involvement, etc.
>>>
>>> Given all the caveats and the lopsided view the graphs display, what
>>> are we trying to achieve by graphing the metric of commits per company?
>>
>> "What gets measured, gets managed" I am a firm believer of this simple
>> quote.
> 
> Okay, but my concern is the lack of context. I think we're putting the cart
> before the horse in that we as a project need to decide what we want
> to manage, determine the appropriate metrics and then perform the
> measurements rather than cherry-pick things to measure and present

Thanks for your opinions! As I have said, this is the first in several 
data points that will be gathered and presented, hence the caveats. I 
had to start somewhere.

> the data without context. We need to know what questions we're trying to
> answer and there is no context available for your data as far as I'm aware,
> certainly not at the current revision of the wiki page:
> 
> https://github.com/openbmc/openbmc/wiki/Project-Metrics/f15759a7ff5c61fa6713b5602dd0f40820b84d0e
> 
>> Measuring a project always improves it. That, and I have been
>> asked to start gathering metrics from several of our contributing
>> companies.
> 
> Where did this discussion occur? Can you provide a link?

The conversations have happen many times over the last 2 years.

At TSC and community meetings (not recorded in the meeting minutes that 
I could find, but it was discussed)

At release planning meetings (see minutes):
https://github.com/openbmc/openbmc/wiki/Release-Planning

I would rather not disclose email (without consent) that I have received 
privately from several companies supporting this work.

No one has ever had any objection to gathering this information (until 
now). Remember, anyone can go see this information any time they want.

> 
>> They appreciate it.
>>
>>> It's also not clear to me what the inputs to these graphs are, for instance
>>> whether changes to Linux, u-boot, qemu or other major projects that we
>>> consume and contribute to are included or whether it's just repositories
>>> under the openbmc org on github. If we're excluding upstream projects,
>>> why?
>>
>> It is only for contributions under openbmc. Other projects have been
>> excluded simply because they have their own project metrics. For example:
>>
>> Linux:
>> https://www.linuxfoundation.org/blog/2016/08/the-top-10-developers-and-companies-contributing-to-the-linux-kernel-in-2015-2016/
>>
>> uboot:
>> https://osfc.io/uploads/talk/paper/31/2019_State_U-Boot_development_report.pdf
> 
> Sure, but delegating to the upstream projects' statistics buries the
> contributions that some are making that are driven by working on OpenBMC.
> Often contribution to OpenBMC is by way of improving the kernel. Disregarding
> this contributes to the lopsided view that your graphs present.

Exactly my point. See carefully wording.
> 
> I'm concerned that we're trying to create a stick to beat contributing companies with
> rather than working to find ways increase contributions for mutual benefit. Competition
> works as a motivator when community members feel safe to take it on but I'm not sure
> the community is mature enough for that to be true. Adding the context for your
> statistics might help remove my concerns.

Honestly I'm surprised at this reaction to a *potential* situation I 
have never witnessed, but, I am willing to add any wording that you feel 
is necessary to create a safe development environment. I have 
participated in open source projects for 20+ years and personally was 
very motivated by contribution metrics, it made it really fun to see if 
I could do better in the community next month!

I value your feedback. When do you feel we as a community are mature 
enough to start monitoring reviews, commits, and other project data? 
Should we hide this "early" data until some future time when it 
represents everyone equally? Personally, I don't feel like we will ever 
get to that place. There will always be people that contribute more in 
one particular area than others and they just can't be upset that they 
may have done less. Open Source requires thick skin. Again, I've never 
seen project metrics reduce productivity/contributions.

Eventually, I'd like to break this data down by project and individual, 
not just company. And, also show data on other extremely valuable 
project contributions such as reviews, IRC meeting participation, 
testing/results, bug reports, maillist involvement and more. Its all 
valuable!

Thanks again!
Kurt Taylor (krtaylor)

>>
>> *Really nice* interactive openstack stats gui: https://www.stackalytics.com/
>>
>>> Where are the scripts to reproduce the graphs? Can you contribute them
>>> to openbmc-tools?
>>
>> Eventually yes, if my employer will let me do more upstream. :) But, the
>> data is publicly available, you can get it yourself from gerrit. Simply
>> go to our gerrit dashboard and search something like: " status:merged
>> AND after:<date> AND before:<date> AND NOT topic:autobump AND
>> owner:<gerrit id> "
>>
>> I appreciate your feedback, I will make the specifics of what is
>> measured and how it is done more clear on the project metrics wiki page.
> 
> Thanks, but please make sure to address the critical issue: What is the
> question whose answer the data from these metrics supports > Andrew
> 

