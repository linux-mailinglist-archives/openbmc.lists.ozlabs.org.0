Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945F1A4777
	for <lists+openbmc@lfdr.de>; Fri, 10 Apr 2020 16:32:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48zL80037YzDrL2
	for <lists+openbmc@lfdr.de>; Sat, 11 Apr 2020 00:32:32 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32b;
 helo=mail-ot1-x32b.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=exdvYD46; dkim-atps=neutral
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48zL6d3W8MzDr9v
 for <openbmc@lists.ozlabs.org>; Sat, 11 Apr 2020 00:31:19 +1000 (AEST)
Received: by mail-ot1-x32b.google.com with SMTP id x11so1989919otp.6
 for <openbmc@lists.ozlabs.org>; Fri, 10 Apr 2020 07:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0mBQcwPP/W7a4zf2D1lMjYnuGgtsm07fRTGE6lU2wQA=;
 b=exdvYD46NW5Pw2GUV82xPGrTHtzKXpWNMkxnA9RvlNrSrj0sX5541J2z7X3MK6AZEM
 wpe8Nhee8r7l1Ga2QxjMvw3lJs9nNuOFAo0ZfAniWydyuasTrBk4Vjje8dvUFxu04sO4
 eaOb2l9+96JJRwnrpDjJvom701bs30ZP2cHPiTYWIKppPKwMhZ7ot2klH4oUBWo9J1ma
 bouliGBS/T2M8ruWwdJrWwepry7wMGxzNl0ltEKp/atj0XofrEA0AVda/DqPJ/gjpOTp
 xwyNFIPCbUFS3icbBEHEvAFhrRE+5NoxFoP443F40KCi+v6yGo8+PbjQ+b9zHkyCEzFx
 FagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0mBQcwPP/W7a4zf2D1lMjYnuGgtsm07fRTGE6lU2wQA=;
 b=Se8FlE33EazfkH8oQbC6iWBIeU6Gylbdy0iEHfiQuSOxxNiyT1/4YZgTONUunljbU8
 W0yw9uSxPRxRBZG1GVHfrEGdgCQ44PE3KS1mpscKoAu43CfRT0jG3c/wPaVuYm2SgR0b
 uIw/0zf5rH+UIT0k5TbwSUdHxJha6Il1RQdfkbrRZaGp2FBzc2edkbktxsWstbbejLNK
 N6kzwJZ+yc/ETD3hIhdDGk3carToCLvKI8oYw+ZrHy5+jlt5loKrJUSOPko7Oyo3HHWm
 1SpikdyoESS5nFCVTh2FnopexmeEg13fXGkn3hTzVTzilnYZP3Ha7Uzf9+KjQhwfPyVW
 yW7Q==
X-Gm-Message-State: AGi0PuYhrUUm7r+dJ/XMsvmB6Ik2VoRs5XaK1777Q6Nc36GALacrekkd
 nrU7udagbB6ODZV4XcpPZqyDLiol
X-Google-Smtp-Source: APiQypLtaT8zVKQwRDxBisDDvoFICvu3qLRDqwDJAkp34ifm2DI4j+0jXEgzHakuPc71Z7yRfDXdCg==
X-Received: by 2002:a4a:a11a:: with SMTP id i26mr4304593ool.87.1586529074844; 
 Fri, 10 Apr 2020 07:31:14 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id u205sm1292921oia.37.2020.04.10.07.31.13
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Apr 2020 07:31:13 -0700 (PDT)
Subject: Re: Call for Gardening Tasks
To: openbmc@lists.ozlabs.org
References: <CAH1kD+bqZfeO8ezvwbmjx_PZ4vaKyhxGgvirVz13P3FK9UDBWQ@mail.gmail.com>
 <CAH1kD+b3ij5KiZn+-N0O+BnbB-XONmbWtYSRA2feKNb+zw6kjw@mail.gmail.com>
 <521FD3E2-3AFE-4E56-A6CF-B0ABA7E9C8E3@fb.com>
 <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <d3eac624-f1a2-fd2d-6639-3290c8085abd@gmail.com>
Date: Fri, 10 Apr 2020 09:30:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <e42cef9e-1760-d3ee-4396-61cd1d141983@linux.ibm.com>
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

On 4/10/20 9:23 AM, Joseph Reynolds wrote:
> On 4/9/20 5:19 PM, Vijay Khemka wrote:
>>
>> I can see following small tasks which need refactoring
>>
>> IPMID:
>>
>> Some of standard commands are incomplete here like “restore power 
>> policies”, some of sensors  sdrs etc.
>>
>> Dbus interface:
>>
>> Define more dbus interfaces being used in common code. I see multiple 
>> repos has these interfaces hard coded. And I agree for client side 
>> code would really be helpful.
>>
>> Phosphor package clean up:
>>
>> There are many phosphor packages in image which are added by default 
>> and lots of systemd unit are running irrespective of platform 
>> requirements.
>>
>> Documentation:
>>
>> Many repos doesn’t have proper documentations and it will be really 
>> good to add and a root level documents giving an idea about different 
>> features and mapped to multiple available repos.
>>
> 
> Can we flesh out the list of features?
> https://github.com/openbmc/docs/blob/master/features.md

Heck, can we start by simply fleshing out what devs (companies) are/have 
worked on for this release?  ;-)
https://github.com/openbmc/openbmc/wiki/Current-Release-Content

- krtaylor

> 
> The openbmc/docs repo has good stuff for developers.  Can we take it the 
> next level by adding:
> - Guide for system integrators - source and build config, signing keys, 
> etc.
> - Guide for initial BMC setup - genesis boot, discovery, configure IP, 
> certs, users, etc.
> - Guide for system admins - ongoing tasks like auditing logs, firmware 
> updates, etc.
> - Security technical implementation guide (STIG).
> 
> We've discussed these in the OpenBMC security working group, and I've 
> collected some details here:
> https://github.com/ibm-openbmc/dev/issues/1531
> 
> I would be happy to contribute to these ... just looking for someone to 
> collaborate with.  :-)
> 
>> I will add more once I remember back.
>>
>> Regards
>>
>> -Vijay
>>
>> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> 
>> on behalf of Richard Hanley <rhanley@google.com>
>> *Date: *Thursday, April 9, 2020 at 2:57 PM
>> *To: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
>> *Subject: *Re: Call for Gardening Tasks
>>
>> Here are some ideas I have as a wishlist for gardening/improvements.
>>
>> *Client Models for DBus*
>>
>> Right now sdbusplus does a pretty good job of making server 
>> development easy.  However, I wish we had some more tooling on the 
>> client side. I see a decent amount of repeated code around ObjectMapper.
>>
>> One way to separate concerns and cut down on boilerplate is to have a 
>> model library. A call to a model would spin off an async method call 
>> to manage the data marshalling, which would then call a lambda with a 
>> fully reified object.  This is similar in concept to the way models 
>> work in web development.
>>
>> *Unit Testing in bmcweb*
>>
>> This is pretty easy to say, and harder to do. I've been thinking a bit 
>> about how to add in unit tests without them being too fragile. (This 
>> was also something that geissonator mentioned).
>>
>> *DBus Virtualization and Playback*
>>
>> One thing that I think makes unit testing in some modules hard is that 
>> there is a high barrier around mocking DBus.  I'm not sure the best 
>> way to build this sustainably, but it would help improve our CI testing.
>>
>> *OpenAPI for Redfish*
>>
>> So far the general impression I've seen with this is that the Swagger 
>> output for OpenAPI isn't really good for C++.  Either the ergonomics 
>> aren't really good, or there is a lot of code bloat.  I'd love to have 
>> some OpenAPI bindings that work well in OpenBMC.
>>
>> *RUST!?!?*
>>
>> I'm betting a lot of people have thought about Rust. I'd love to hear 
>> what people have tried and what are the sticking points.  Any thoughts 
>> on what module/functionality could be a decent candidate for breaking 
>> ground here?
>>
> 
> We discussed the rust language in the OpenBMC security working group 
> meetings 2019-10-02
> OpenBMC security working group minutes:
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI 
> 
> 
>> -Richard
>>
>> On Thu, Apr 9, 2020 at 2:54 PM Richard Hanley <rhanley@google.com 
>> <mailto:rhanley@google.com>> wrote:
>>
>>     Hi everyone,
>>
>>     Last week I started a thread on Open BMC Gardening
>>     
>> <https://urldefense.proofpoint.com/v2/url?u=https-3A__lists.ozlabs.org_pipermail_openbmc_2020-2DApril_021100.html&d=DwMFaQ&c=5VD0RTtNlTh3ycd41b3MUw&r=v9MU0Ki9pWnTXCWwjHPVgpnCR80vXkkcrIaqU7USl5g&m=fAZZtmWl4g8Vngk56_Rs09hgS96TYQMeyRsyZKGHzAo&s=HXdHl56jq4p5eXbhyUHUkkmoF_hGh5tJWMUaVKQ68VM&e=>, 
>>
>>     and I wanted to kick off the process.
>>
>>     The basic idea here is to get a survey of various
>>     improvement tasks throughout OpenBMC.  Some things might be small
>>     refactoring or changes that can be done incrementally (i.e.
>>     weeding the garden). Other tasks might be more research or
>>     structural (i.e. excavating the garden).
>>
>>     Just getting these in writing can be helpful for others to gauge
>>     what they should focus on. It also helps leave breadcrumbs for any
>>     new developer interested in the subject.
>>
> 
> Richard,
> 
> Thanks for your efforts to move this forward.
> 
> Security wish list here: 
> https://github.com/openbmc/openbmc/wiki/Security-working-group#security-feature-wish-list 
> 
> 
> - Joseph
> 
>>     So here's how I see this working. Anyone who has some ideas can
>>     reply to this thread with a short to medium description.  Try to
>>     avoid new features, and instead look at ways we could improve the
>>     status quo. Think about changes and tools that would make your day
>>     to day life better.
>>
>>     From there we can do a write up about what we know about the
>>     issue.  This can function as an early stage design doc that gives
>>     a broad overview on where the dev's head is at right now.
>>
>>     Finally, we can do a quarterly review to keep the garden
>>     refreshed. Obviously, things can change between that time, but
>>     having a semi-regular cadence will hopefully give us a better
>>     chance of keeping this up to date.
>>
>>     - Richard
>>
> 

