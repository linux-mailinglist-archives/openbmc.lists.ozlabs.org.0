Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03111510A
	for <lists+openbmc@lfdr.de>; Fri,  6 Dec 2019 14:34:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47TtqP1FhPzDqfB
	for <lists+openbmc@lfdr.de>; Sat,  7 Dec 2019 00:34:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ym8iLZCN"; 
 dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Ttp43yHmzDqWt
 for <openbmc@lists.ozlabs.org>; Sat,  7 Dec 2019 00:33:31 +1100 (AEDT)
Received: by mail-ot1-x342.google.com with SMTP id o9so5803995ote.2
 for <openbmc@lists.ozlabs.org>; Fri, 06 Dec 2019 05:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=IPgGzei+gBfhw2d2JLMEo8x3oC/Ekif34XGpzPDNxjk=;
 b=Ym8iLZCNURER+Z6cr0wsfkKjNBf84Rle0QcsIO07mNOiBRoORZHQQf//icmKH8NmaT
 1DawabUgiiWlICl5xD4kKkAB2POCNBTSP3VKHKUEDFUQXVSzy7Pko8X1wE5op1+UclPj
 CDFNRR3ItyxOT7SUzZpu5gPvNWwlNcWRtgpbp/MXxFZtA7Sw1WFkuvXxeTTW56CmWzv2
 evZhwylajovL/bMfiPpdEjfzojWZg4jDsaR5AOCk264LBFVjvSXIRMXSTjNXFX5tRFTL
 68vanL14o6txDUXWyxrCBFdiWH5qiQxRaTjir1BPOHeITGQ1iSc9pmQMoOPG/U7NnhAp
 JNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IPgGzei+gBfhw2d2JLMEo8x3oC/Ekif34XGpzPDNxjk=;
 b=SrKIGUDhHPKyf6IfxnJh2TIbH21Mw2AdYpBNVJHuqRs+3vaCO/B3/E3IqDpJV8d5jY
 Aa9SnRBoCOdWsSjJQ1RU2k2JKKn6+4x9dZiaO6RrP4lDxjWgN5u/OcY5Pn2kL5mXZvm8
 KjuOdO1jITDgBNa9S6027hiMYuuNEOJ9ivTZqJ6gDCEz5ThbRfEo0Mj49vRxmjsHjzMd
 PFnAYD1bbr+0wgJgb6lTn5Po8MvVSWIsBka9LA8V1b90QoYvuoT83rEH919L36PVayuM
 rxZEIgeAFSVMMTkQS4ZJHTrRWi1Ua/T68KT0ya4lLNBpe2aUiso9u8Piu8eaeA2aTcsj
 7+1w==
X-Gm-Message-State: APjAAAWocotECaImM5PmiWV6tX3llQHCdB6f951z49++IDiZVNnzggSY
 +o+uch3bazIzBcDJz9f6ibXM7hUc
X-Google-Smtp-Source: APXvYqxeEmxTCh4SBvir6j3gAk44/uaGL8rcx/uCQeXlmql/ht6JXyjWMPSpIFJx3fY7CWT2wDBAKQ==
X-Received: by 2002:a9d:6c8:: with SMTP id 66mr10733985otx.271.1575639209142; 
 Fri, 06 Dec 2019 05:33:29 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id l7sm470010oie.36.2019.12.06.05.33.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Dec 2019 05:33:28 -0800 (PST)
Subject: Re: OpenBMC Project metrics
To: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG5OiwjaiBnGw17NZdW4=XDmiWpuEM=z5_jsTcJ8ws=p1umeRQ@mail.gmail.com>
 <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <477d3fbb-5aa8-d4e8-958c-62fb94e2acc7@gmail.com>
Date: Fri, 6 Dec 2019 07:33:26 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1fdc7be1-71f7-4926-83aa-a531de6d5b81@www.fastmail.com>
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

On 12/4/19 4:33 PM, Andrew Jeffery wrote:
> 
> 
> On Thu, 5 Dec 2019, at 05:14, Kurt Taylor wrote:
>> All, I just posted the project merge metrics for September and
>> October. I will be updating the company/developer lists for November
>> and posting those shortly. Enjoy.
>>
>> https://github.com/openbmc/openbmc/wiki/Project-Metrics
>>
>> NOTE: these metrics should be used *very carefully*. They do not
>> represent the total contributions to the project. We value
>> contributions many that do not show up in these charts, including
>> reviews, mail list involvement, IRC involvement, etc.
> 
> Given all the caveats and the lopsided view the graphs display, what
> are we trying to achieve by graphing the metric of commits per company?

"What gets measured, gets managed" I am a firm believer of this simple 
quote. Measuring a project always improves it. That, and I have been 
asked to start gathering metrics from several of our contributing 
companies. They appreciate it.

> It's also not clear to me what the inputs to these graphs are, for instance
> whether changes to Linux, u-boot, qemu or other major projects that we
> consume and contribute to are included or whether it's just repositories
> under the openbmc org on github. If we're excluding upstream projects,
> why?

It is only for contributions under openbmc. Other projects have been 
excluded simply because they have their own project metrics. For example:

Linux: 
https://www.linuxfoundation.org/blog/2016/08/the-top-10-developers-and-companies-contributing-to-the-linux-kernel-in-2015-2016/

uboot: 
https://osfc.io/uploads/talk/paper/31/2019_State_U-Boot_development_report.pdf

*Really nice* interactive openstack stats gui: https://www.stackalytics.com/

> Where are the scripts to reproduce the graphs? Can you contribute them
> to openbmc-tools?

Eventually yes, if my employer will let me do more upstream. :) But, the 
data is publicly available, you can get it yourself from gerrit. Simply 
go to our gerrit dashboard and search something like: " status:merged 
AND after:<date> AND before:<date> AND NOT topic:autobump AND 
owner:<gerrit id> "

I appreciate your feedback, I will make the specifics of what is 
measured and how it is done more clear on the project metrics wiki page.

Kurt Taylor (krtaylor)

> Andrew
> 

