Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8314F0D5
	for <lists+openbmc@lfdr.de>; Fri, 31 Jan 2020 17:46:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488NRK4YY1zDqgb
	for <lists+openbmc@lfdr.de>; Sat,  1 Feb 2020 03:46:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=la+lhIs0; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488NQX5Jd1zDqfJ
 for <openbmc@lists.ozlabs.org>; Sat,  1 Feb 2020 03:46:10 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id a142so7848806oii.7
 for <openbmc@lists.ozlabs.org>; Fri, 31 Jan 2020 08:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=1xIvBg1A22TciGIt5oBhYmyOSR+7fp6pE/Nz3elabQg=;
 b=la+lhIs0T/QVXLGZsv8tUcHe8sLP156FZ9zpu81RW8+Fas2s658142dfyuqaDS5bPr
 IKcTgFyQhKApkX2EN+/e3fDB7w89J49ltDGR6WFT4oZZgPqVDfq7kMKeYXWCFb8KzQsA
 9J3Jmeax64Ovbk/T7DrF1jzhT/D2vXjmTA0anE9tBrYNNYPsLL3++XT40tpiGmjqEhoh
 56HMowd2RCeaxkH0cqSQZkUI2Wf5K74epozOT39q7MrY5OYdBHnZZVC/jHxr3zrNQV4A
 7+jDGN8rHY67ofOCAJ+mwiGjyPY6ZX2BowQyIbJ4ia6AVfYd5yZRHX8mXfA1sqs6rsax
 yT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1xIvBg1A22TciGIt5oBhYmyOSR+7fp6pE/Nz3elabQg=;
 b=I7coUzwt6Y3QR02OvKAwO/EOKwPH6eXXduS/4tsNe+LyF4VX5DnWs+2jIMchfqlwNy
 hpsXAuh4/GgKXdxAEpjAR/tyA2yNv8Os+M9NiS6bDDqnHkbdP4U5ZpGuec4hYLnY1iee
 sMnVLHDOxUr+aa4nHdc3zx68lOeDISKkFGgeV7qNpvw2SuWdqy+ruB8ScEqVEaq1SVSP
 VLtNlwMxR3NqrrzHNHFIF/UdyQGvMvDvMV6M28FTmIrgS2555K1W0ztM1DmXGTUx8mDk
 yX2/klXkfB1TPnIF9Q7tO00sk8rzJNGrdaXDkSHtL10shexiD4I2cO/tN6+KgQx8ieOU
 yIwA==
X-Gm-Message-State: APjAAAVRjg6U2WU6LaIfnEqQHd71I02hf7nUkHy/gYYObVaTv3L9di8v
 aysPZ+ifwGnKAEHJbK9OP5AjM2Vu
X-Google-Smtp-Source: APXvYqxGxOvD/j7L4gtb7/qX6eNbU9B/3a2gSXuf1eMKGpO9wE3RhhHBd7mvwRym1ZPWyONor1tX7w==
X-Received: by 2002:a54:4595:: with SMTP id z21mr7057586oib.136.1580489166774; 
 Fri, 31 Jan 2020 08:46:06 -0800 (PST)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id f3sm3185497otl.38.2020.01.31.08.46.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 31 Jan 2020 08:46:05 -0800 (PST)
Subject: Re: Farewell & Best Wishes
To: Emily Shaffer <emilyshaffer@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <c2c7447f-fc31-362c-2586-1c3e8f155ac2@gmail.com>
Date: Fri, 31 Jan 2020 10:46:04 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAJoAoZm41PYLana6j99ZvBgzkB+T-Ww4_gJC24=esecA48HV3Q@mail.gmail.com>
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

On 1/27/20 8:37 PM, Emily Shaffer wrote:
> All,
> 
> While I've very much enjoyed my time working with this community, it's 
> time for me to step down as comaintainer on the various IPMI projects. 
> I'll be fully devoting my time to hacking Git, these days. :)
> 
> Sometime this week I'll be sending changes to remove me from the 
> appropriate MAINTAINERS files. If there is something that you still need 
> from me - a review, an opinion, whatever - please let me know and I can 
> take care of it. I'll continue to peek into my review queue this week 
> and next week; after that, I won't be gone forever, but I won't be able 
> to grant approvals on Gerrit.

Our loss. Thank you for all your contributions, but also your wit! The 
project is better today because of it.

Best of luck in your new endeavors.

Kurt Taylor (krtaylor)

> 
> I expect I'll still be reachable all the usual ways - this email, 
> Freenode, LinkedIn, whatever - I won't be disappearing or changing 
> employers, just focusing my time elsewhere.
> 
> Thank you all very much for the extraordinary learning experience I've 
> had working with this project and incredible group of people. I wish 
> everyone success in the future and look forward to OpenBMC as the norm 
> in datacenters and home workstations.
> 
> Yours,
> Emily

