Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0778728F637
	for <lists+openbmc@lfdr.de>; Thu, 15 Oct 2020 17:54:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBv3d73j6zDqbs
	for <lists+openbmc@lfdr.de>; Fri, 16 Oct 2020 02:54:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2e;
 helo=mail-oo1-xc2e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vGCPhQeB; dkim-atps=neutral
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBv2n3MLHzDqRR
 for <openbmc@lists.ozlabs.org>; Fri, 16 Oct 2020 02:53:36 +1100 (AEDT)
Received: by mail-oo1-xc2e.google.com with SMTP id l18so822061ooa.9
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2020 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OTzRw9/5HSwTWgocpymKpwK/2AGFfFqNPpM1rO9LvBw=;
 b=vGCPhQeB5qo4YNg/J89rICBru7fZ072zf8/LBKTEQTLizAaSIzaRZL/k5rUs8SvEjB
 eKxfesUXzcoIc+IyA6KeAyO97UBslNLps5BfNwUCnBRczh5zyOXMnfNQ317wQgqxdxgX
 EiL9h9mDJcKdw20cajOVwKDeeiD+XY1eO25E+Ugfp3aR2eSCVVxzolMqdsEngbCEZxi6
 5UT8Y1amZqnw0GZjvXi0oIPZUREPDptRHVzYebmPuk6VXei66n0Ep4Ts/1qZScgCdZNZ
 LDVCpOZ3pE5VlZtzIscCC1uhFU30DxEiXk7OGDuUL9uqGoIHxySiq9YAJTeYRocY1H/P
 jAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTzRw9/5HSwTWgocpymKpwK/2AGFfFqNPpM1rO9LvBw=;
 b=ShOtRppbQviy3SwYqsYFhJKvgABnGN8i2ayc+YmXG1IRjzSONVpmmvHIo5V4qbkIu6
 OhYPfQLzjb5PltgP9OUxqfNVwMiJA5ArT7Ipe189i2pysYjec1FQX2isKe4eOgccnLSR
 NAc4Es03xLIS2yQBrwAsnRPU1KhY5CM1K79Au5KTTjxbk9nBwOuVz4BKY+SMkGgJ59Sh
 RsgYTagnICUvL8Jtgqss1VEhvpNPVZAs2QgWG8v9+7CWzHG9shYlHHhi4C8dBjfT7itl
 oqFI4hNojc1yJa8Z89yIXEI4SjJ0kQRR73Bbp+emAN3rnsMtXCqYN8ab360cE/ub9C62
 V+3g==
X-Gm-Message-State: AOAM530oziFuM52YF7K01n5kEfgd3I9GtU7U1bT/W1FFUpTgZevJHLQB
 5mZlqUO0+0QZQJfvyBMDVuW+v23eDbIHKg==
X-Google-Smtp-Source: ABdhPJyG5zsCYt6cPROerMOTG3+S9xOVsS/Ux1+BEplyHZg/HTZcfn1/SoHD4+xwsVe5u0iT00PzuQ==
X-Received: by 2002:a4a:d104:: with SMTP id k4mr1765535oor.0.1602777212254;
 Thu, 15 Oct 2020 08:53:32 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id v17sm1230905ote.40.2020.10.15.08.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 08:53:31 -0700 (PDT)
Subject: Re: Security Working Group Meeting - Wed 14 October - request for
 security bug tracker
To: Joseph Reynolds <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org
References: <CAC1Cx+sq1RM4YBnbbiKq1uJ-1bjdETj2u116cSzsd2vhSo2K7Q@mail.gmail.com>
 <0c8a7bd5-e437-6460-b309-c9146477e120@linux.ibm.com>
 <d29bfcde-bf3f-b739-20b3-c63686f3f746@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <5166ecdc-aac6-38a4-9fd2-466132032f0f@gmail.com>
Date: Thu, 15 Oct 2020 10:53:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <d29bfcde-bf3f-b739-20b3-c63686f3f746@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 10/15/20 9:22 AM, Joseph Reynolds wrote:
> On 10/15/20 9:14 AM, Joseph Reynolds wrote:
>> On 10/13/20 2:06 PM, Parth Shukla wrote:
>>> This is a reminder of the OpenBMC Security Working Group meeting 
>>> scheduled for this...
>>> This Message Is From an External Sender
>>> This message came from outside your organization.
>>>
>>> This is a reminder of the OpenBMC Security Working Group meeting 
>>> scheduled for this Wednesday October 14 at 10:00am PDT.
>>>
>>> We'll discuss the following items on the agenda 
>>> <https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI/edit>, 
>>> and anything else that comes up:
>>>
> ...snip...
>>
>> Two subtopics were discussed:
>>
>> 2A. We reviewed the security reporting and bug fixing process. 
>> Specifically:
>>
>>  * The OpenBMC security response team:
>> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
>>
>>
>>  * This is what github advocates using:
>>    https://github.com/openbmc/openbmc/security/advisories
>>
>>  * What tools do we use to:
>>
>>     * Identify which open source pkgs are used in an openbmc build,
>>
>>     * Identify security bugs in those packages, and
>>
>>     * Ensure that we pull in fixes or otherwise mitigate the problem.
>>
>>
>> 2B. Given that OpenBMC is a Linux Foundation project, what resources 
>> does the Linux Foundation offer?  Specifically, we want a private 
>> secure bug tracker for the OpenBMC security response team to use.
> 
> Kurt,

Again, PLEASE cc me directly, I don't read every email on the list. It 
was another happy coincidence that I read this and saw my name. :)

> The OpenBMC security response team could benefit from a bug tracker to 
> track security vulnerabilities that were reported to the project and not 
> yet disclosed.  This is to support [1] and would have to be private and 
> secure.
> What is commonly used for this?  Can we do it at the project level? Can 
> LF help?

Just brainstorming here...

What about a github repo like openbmc/security_tracking or similar with 
its own team? We'd have to experiment with that and make sure it was 
private.

Otherwise, we could do something with hosting with the LF (bugzilla 
instance?), but it would surely cost $$$. Another reason for project 
owned, independent assets, but I digress.

Let's see what we can do with the tools we have now (github) especially 
since we may be moving that way anyway.

Kurt Taylor (krtaylor)

> - Joseph
> 
> [1]: 
> https://github.com/openbmc/docs/blob/master/security/obmc-security-response-team.md 
> 
> 
> 
> ...snip...
>>> Access, agenda and notes are in the wiki:
>>> https://github.com/openbmc/openbmc/wiki/Security-working-group
>>>
>>> Regards,
>>> Parth
>>
> 

