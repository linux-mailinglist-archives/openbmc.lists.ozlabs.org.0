Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67621117478
	for <lists+openbmc@lfdr.de>; Mon,  9 Dec 2019 19:42:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WsVh4NrZzDqQV
	for <lists+openbmc@lfdr.de>; Tue, 10 Dec 2019 05:42:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332;
 helo=mail-ot1-x332.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="et9mCBay"; 
 dkim-atps=neutral
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WsTt3fGzzDqGv
 for <openbmc@lists.ozlabs.org>; Tue, 10 Dec 2019 05:41:20 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 77so13117717oty.6
 for <openbmc@lists.ozlabs.org>; Mon, 09 Dec 2019 10:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3wIbB9xInJdZEC1uDAarCwObHPcSrr6che07uv3z3xE=;
 b=et9mCBay0x1x+DjiaHbncDoDvQTbTXQQ+wss1EV+piZc8TTr9bD+krYwG6STqYPc6N
 3FLfQF5sxA4p0j6iozJt2vsjsSS78LFByvkHNzhLRWdSK+jiPqeQUN5+DEDT1+oruE2h
 rhorBWtyyEYu56GfNqyzhX4+yjS+pqarcxtqraEt/5H5rXO+SLUX8JQTOdCpdkhFpbjW
 OjYyZEr5WWmxSwYKU8nyFfhHYo7wpcUJlcbhaUhU6kmmdEqdH0kx1Gb39+6wyrqd//mN
 MD5AjkB3o0JlG6Hvyz6EBY2ay9A+n9hFQ3tIwkJLaTsxhGRKkV6ttHoGiWb43beXbrfH
 b4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3wIbB9xInJdZEC1uDAarCwObHPcSrr6che07uv3z3xE=;
 b=RO0oaXdMCHQuURVGWtYej1apw4Zn2g6vamwTwhxP+TYXEfPTLYf8Ra70sR7TbWWZvh
 PvaJc0CrXX/UKjD8w4LqB+5xy5FcSfcQBvTYJs73uxnrqFF0gQaRlsXlwMqv06eagUq4
 Mm2asH01Fx1Y8hI9DJWAaD+n6DpxBYf0bgDROlr2QwkdeMjxbleX0qcjzDj+wyY2Yu/T
 jUkCYhV1TJWut8xrWye+/A5xMTK+OzWrXV8lWIU8upDbrKRmgiSaFWzbmX0dQDYoDM2F
 3Hagj8esCAeWB2g5xOQiBj5zriW3zDFsQaTF0B/1YC8kFoyicohNqptxXB6R92+d+cVK
 okWA==
X-Gm-Message-State: APjAAAWe+3boi8glcfCAKU4l3l1EYm+rA7FbV3li34CYGLZMU61a7zh5
 m2uRum/NCgnj0qnhz1B3aq3rZ/Sj
X-Google-Smtp-Source: APXvYqztShblfub2PtJZ1Ki7jUagoAIbK/TSsKAz+isAOdm9TVKJxlVhYdqEXH4LEoynwphT+yAgaQ==
X-Received: by 2002:a9d:245:: with SMTP id 63mr9502788otb.229.1575916876747;
 Mon, 09 Dec 2019 10:41:16 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id r3sm239291otp.15.2019.12.09.10.41.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Dec 2019 10:41:15 -0800 (PST)
Subject: Re: OpenBMC Project metrics
To: Patrick Williams <patrick@stwcx.xyz>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
 <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
 <20191206165144.GA48825@patrickw3-mbp>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <c8172655-7ba4-0c7e-a52b-7d7eb08858f3@gmail.com>
Date: Mon, 9 Dec 2019 12:41:14 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191206165144.GA48825@patrickw3-mbp>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 12/6/19 10:51 AM, Patrick Williams wrote:
> On Fri, Dec 06, 2019 at 07:33:26AM -0600, krtaylor wrote:
>> On 12/4/19 4:33 PM, Andrew Jeffery wrote:
>>> On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
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
>> quote. Measuring a project always improves it. That, and I have been asked
>> to start gathering metrics from several of our contributing companies. They
>> appreciate it.
> 
> I recognize some other projects publish statistics like this and it is
> all publicly available information but I personally have slight
> apprehension about this data.  This project is no where as mature as the
> Linux kernel and the data is highly skewed towards one company.  I have
> some concern that this data could be used for political purposes, both
> externally in community interaction and internally to member companies
> w.r.t. their decisions on future involvement.
> 
> The data is public (from Gerrit), no doubt about it, but I think it is
> reasonable to question if it is a net-positive or net-negative for the
> community to gather the data and put it on Github, to put it on Github
> and advertise it, or to put it on Github and the advertisement coming from
> the Community Manager.  (ie. there is a spectrum of possible ways to
> deal with this data with different pros/cons)
> 
>> "Measuring a project always improves it."
> 
> Maybe a first step here is answering what is the desired change by
> publishing this data?  And who's desire is it?  That isn't obvious to me.

Thanks again for the comments! See the previous reply to Andrew where I 
address some of these points.

> 
>>> It's also not clear to me what the inputs to these graphs are, for instance
>>> whether changes to Linux, u-boot, qemu or other major projects that we
>>> consume and contribute to are included or whether it's just repositories
>>> under the openbmc org on github. If we're excluding upstream projects,
>>> why?
>>
>> It is only for contributions under openbmc. Other projects have been
>> excluded simply because they have their own project metrics. For example:
> 
> The commit-count-from-Gerrit approach is slightly disappointing to me for
> two reasons:
> 
>      1. Commit count does little to assess the impact of the
>         contribution.  Ex. a one-line recipe update to add a dependency
>         counts the same as a feature.
> 
>      2. There are significant contributions on the kernel side done by
>         and pretty much exclusively for this project.  The effort
>         involved with getting kernel patches upstream is at least an
>         order of magnitude higher than userspace changes (see also
>         "impact").
> 
>>> Where are the scripts to reproduce the graphs? Can you contribute them
>>> to openbmc-tools?
>>
>> Eventually yes, if my employer will let me do more upstream. :) But, the
>> data is publicly available, you can get it yourself from gerrit. Simply go
>> to our gerrit dashboard and search something like: " status:merged AND
>> after:<date> AND before:<date> AND NOT topic:autobump AND owner:<gerrit id>
>> "
> 
> One aspect that isn't immediately obvious, since it isn't available via
> source code, is how you've done the company assignment.  I suspect the
> ones for your employer are correct but for other companies there might be
> mistakes or oversights when people are using personal email addresses.

I have been using the lists of developers that have access to run tests 
(ci-authorized) maintained per company, and do not use the email address 
(error prone) instead using the gerrit id. You are right that it may not 
be a complete or accurate list, but its all we have at the moment. The 
groups are listed here:

https://gerrit.openbmc-project.xyz/admin/groups

As you can see, some contributors listed don't even have email addresses 
in their gerrit profile.

> I think this concern also ties into the ask a month ago with the
> "computer readable CLA database."  If we had a CLA database and this
> tool used it, we would have one place to audit for correctness.

Absolutely! I have been working with the LF for a tool, but found out 
that the tool they have developed costs money and requires a LF Id. It 
is an option for the future for us to use this system and have 
CLA/CCLA/Id/Developer ACLs all in one place, but that will require 
"member" companies and monetary contributions to the project. That, or 
develop our own. All good topics for discussion.

Thanks again!
Kurt Taylor (krtaylor)




