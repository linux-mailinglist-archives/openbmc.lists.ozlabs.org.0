Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B071A1EC25F
	for <lists+openbmc@lfdr.de>; Tue,  2 Jun 2020 21:09:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49c1mx1bQqzDqRX
	for <lists+openbmc@lfdr.de>; Wed,  3 Jun 2020 05:09:21 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=kurt.r.taylor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HO0mUnh5; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49c1lB2BprzDqPk
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jun 2020 05:07:49 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id m67so13011174oif.4
 for <openbmc@lists.ozlabs.org>; Tue, 02 Jun 2020 12:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=At4MN+cb3VZfM9P6Pxyn/+T0K+TgdHSSJ51Bwdy3DRw=;
 b=HO0mUnh5bTPnyKrZEWrf2J7zrrIu8D+ieQ8NFsnNL8fX0fw8JZGWZcZ+gnrkLplKGj
 VKthM9+f4JHH9Z1bgBJ66WkhRnQHUHdTlnnAH1UFtcsQ69M//YvBtoPqpry7N1x+W7hl
 qnAdWKZqgY04w78c1or5T7guM5F3GcZdt5M9ltfcIarhGHn5StSwGnGxAoB20XPK9mjW
 WoEXsVyozFh2zJszCj7VE4R7uu9HIxje0OQ6oAsBvLxhW673uyf79v1j5pZBlmsDhxrz
 ErV4zsuBlycKTxOLIGe8L2TUMmeAfp6W7iARDEcIHI3Y8O/oqMm2D2yZef/nhhEJs3i8
 zDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=At4MN+cb3VZfM9P6Pxyn/+T0K+TgdHSSJ51Bwdy3DRw=;
 b=r0OQQFiLIpC8iVo0JjTW/655gH1lrNGOBM0uUYBTE6Ou2y83AYz4Bo7h4+To31Ai/L
 t+KgsfxcTF6EvUxBULYr3ySlr2A9+QueXuFteIryViPVq5WDfrD1TMqrvTyz2ps8bqig
 MpcV2kxOuuh8zjh5tK9K1ynk2vN0n8lY/uF4p6tyJ2k02FinLlig/a16aXYcQ7DaU4Q6
 61TGfPPmqQJkEU7l0Fxohdz1mDwuekdL8yaKm/4THu7I280LWWtxxN6luvN5i4/G/Ujx
 7HDOarxlROlgIwzqzC5yl8ye4WCtfco00v+w3ELj90jncuFZvhELQyx8cupOWeliRPy7
 2i8Q==
X-Gm-Message-State: AOAM533NSyMKGErepyJrkIQhd+ZTVB5jY/hZ19juW9vvoA2sobNpwCjb
 3vC5QyKc+/htY+bf2JbgQMy6/QzaxUw=
X-Google-Smtp-Source: ABdhPJwz4oVMD1V+zayAXHJI0BeXUpnbKJCd9F0L1VUIuMOApJsMRWtAA3xlXbzDn3EJKOnKHDdCKQ==
X-Received: by 2002:aca:51ca:: with SMTP id f193mr4048896oib.170.1591124865724; 
 Tue, 02 Jun 2020 12:07:45 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id t6sm837330otb.27.2020.06.02.12.07.44
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 12:07:44 -0700 (PDT)
Subject: Re: OpenBMC 2.8 Release
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
References: <CAG5Oiwj+-OnkPMc+dfeo0P=MfREPz_7E+zBaMaYy6AHMLO+BxA@mail.gmail.com>
 <f44ba049-2678-c34e-4906-5ce0b9d416d3@linux.vnet.ibm.com>
 <6458b8d3-d460-40c0-9573-fa970cc8fd47@www.fastmail.com>
 <588ffcf2-f766-952c-1ab3-da271d84516f@linux.vnet.ibm.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <93bd7bd1-6402-bf7e-850f-22dfa68b8164@gmail.com>
Date: Tue, 2 Jun 2020 14:07:43 -0500
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

