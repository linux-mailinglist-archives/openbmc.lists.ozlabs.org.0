Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DF1EC278
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 21:13:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c1sd1pxzzDqRy
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 05:13:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e;
 helo=mail-oi1-x22e.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YtoOM5H7; dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c1lL6y2fzDqTl
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 05:07:58 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id m67so13011968oif.4
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 12:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=At4MN+cb3VZfM9P6Pxyn/+T0K+TgdHSSJ51Bwdy3DRw=;
 b=YtoOM5H7XzLFTpfaV4r/DRxbVUkcMbtBcMltsZzX7Fo6E78y98k0ToDSwkUd8W6WFB
 T1b45NhYkxMzqy9lrPlTjx53adfRxsugSSRrrkDeprew+3aTynZsU3ywh7kzT+ukHNU8
 brOpEC44D5jZYGQJr4agsP8E0NWp2UrEndAO8/nAnHHChlKtspM9F6znN5M6DpwJkz51
 Yrb9o3nQs7STWXuS1MbfIVdW8rddoCrJQP/D7mQEtSDviwZ6oCuXtjaUOfrQE4x2R/3+
 k6UzQB7iAflYM7N8dki0mPrfa5gDAzxJLfdKXKArlQdAgteASYYyRIeaf6/syzAYyDwq
 T69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=At4MN+cb3VZfM9P6Pxyn/+T0K+TgdHSSJ51Bwdy3DRw=;
 b=BwwIrskwdvjUww1jcidtfOoqPeSYw/+J1ZLkW8OQHEuUmoKtx6pIxBYUeMMxRif81s
 YTDhlokgkCevfbHb5C5WcIkGRhOqM5DFASuNpJFS0lGccO70CO8D/Bg+VAFdvgbAquks
 nlZU7Z+acXSGImp9DUep+VIxoPKFzpIrTwSnduXTQFcIjXLkP5N3z01uz44qKOxn+Avq
 s4BQ0HsLqSzY+NXlKVridFQNZbeAjIr/arHTHayJDuxj7KlcrjKlOetQuIR4pfG2yZX1
 NzKVKQns+C6wy3+F/P87ETS+pvXP1EW/Y6Enncw9vpz1BhE+I9wkfSLkC6qr8ZtafyRs
 96mw==
X-Gm-Message-State: AOAM530ou1Z8WGWKN7ey/giAyFv3jqIm+e9LurZl3EX8e3uxkW/8fdEK
 gnWpxp9KEoLxfS42Bim2Cf49kiA06Jk=
X-Google-Smtp-Source: ABdhPJyHwmDOwYXUS4x7ucQgbbfwGz/rO/gVzLR8UW7xIQeBTHH6Ybxqy5w2vcvy5SrZ2zX0oh86RQ==
X-Received: by 2002:aca:d58d:: with SMTP id m135mr3815309oig.102.1591124876195; 
 Tue, 02 Jun 2020 12:07:56 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id c9sm891034oov.35.2020.06.02.12.07.55
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 12:07:55 -0700 (PDT)
Subject: Re: OpenBMC 2.8 Release
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
 <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
 <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <7075cca2-eaf0-786b-6ebc-1dad163c5d0c@gmail.com>
Date: Tue, 2 Jun 2020 14:07:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
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

On 5/4/20 1:29 AM, Deepak Kodihalli wrote:
> On 04/05/20 10:43 am, Andrew Jeffery wrote:
>>
>>
>> On Thu, 30 Apr 2020, at 02:30, Gunnar Mills wrote:
>>> On 4/29/2020 10:48 AM, Kurt Taylor wrote:
>>>> just add it directly here:
>>>> https://github.com/openbmc/openbmc/wiki/Current-Release-Content
>>> Added:
>>>   * Yocto refresh to "Dunfell" version 3.1
>>>   * Redfish support for: full certificate management, complete LDAP
>>> management, full sensor support, event service schema, task schema
>>>   * Move to Redfish Specification 1.9.0
>>>   * Redfish support for 2019.4 Schemas
>>>   * GUI enhancements: LDAP, certificate management

We are targeting this Friday, June 5th for release 2.8. I'm not seeing 
much (or any) discussion on testing. If you have tested the release tag 
please post the results for your platform. Any blockers?

https://github.com/openbmc/openbmc/releases

Also, please review and add content to the release notes here:

https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/32440

Thanks everyone!

Kurt Taylor (krtaylor)

>>>
>>> And removed "`Redfish configuration backup and restore function`".
>>> James, Jason are you okay with the Redfish list above? Should we add
>>> something about Storage & Drives? Anything else?
>>>
>>> Should we add something about the Kernel? "Move to 5.4"?
>>>
>>> Anything for PLDM / MCTP? For the 2.7 release it says "Partial PLDM
>>> Support" and "Partial MCTP Support".
>>
>> Certainly MCTP support is still "Partial". Slowly progressing with 
>> help from
>> Intel.
> 
> Same goes for PLDM. There's definitely more PLDM specs and commands 
> implemented in libpldm since the 2.7 release though.
> 
>> Andrew
>>
> 

