Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A64CC42861C
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 07:07:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSRcV20d9z2yPK
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 16:07:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KZoMDjct;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=KZoMDjct; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQzC33Ml1z2ywX;
 Sat,  9 Oct 2021 06:43:41 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id m26so10629981qtn.1;
 Fri, 08 Oct 2021 12:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=txtnvg7blPU7HQRh6QW4CdbKgSFFsV7Icy1mQ2ZPblw=;
 b=KZoMDjctnN+693gxmSWUzBBC1g3g41UHZuWf7wrLuslXZt5a4DWN4yOXKuYwHJ1J7x
 X9HFxVuBs1moHaihl0fByuwtKEaVwKq+s3qa648SNhURZj2aUTOxbBQq1YMu8bWjXLG5
 Bzvcmxjl8JBiwWqedO/M1Gt5hRC8gcHpiuSBAU5j882P1MHIRcur2ZbXPVi7R9n/9+PK
 gwyMp8q8sQpnDg+/X/IUrg0X4kzxb2Ic/S+QZv+0nqqlciuNXY5sAxH5/ztxjMi+ywxN
 WZa/XZogOqEGQP+Lgev5E5CbBKNFCp4VCRwah19rIiGQn5DqOVirLxfLOFnd9HyRdafS
 z3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=txtnvg7blPU7HQRh6QW4CdbKgSFFsV7Icy1mQ2ZPblw=;
 b=U/MXY6a28oVg01Cqrb/2gNp7FElIOhITZQzU5v3slAavWjByeurGHqpH6fd5tL4MPj
 zXPorcdktPzsDPVDx8Ct4rwZVsY1dXA1fKuAFfgLsQB47SwbAQ00mJ8yz7iA/0hXpqDT
 BHQqhEUKIDhSyR/e1GQAdc992EgJL1TpaNE8EF6KlkVAliJBggd5pN1oEMF62LAMraud
 xijMvhRRT2TvDyh85LshQsJHooEiWlFqRFGrtB3JPYpJB0U8EyGLtfQ5z3PimVHsaUpT
 IckMO+6Wlc2F7iah4ANRYI54rLYI/aG67Rg//fqkqsZBByS+EhEWMov0/prZBMAGV29P
 7jyg==
X-Gm-Message-State: AOAM530BOHcsHkN1Ekp5ebUWR/5htW2fIqp4F8Xg+ZiD+TQ1b7BjY/Cg
 oFsM8Qy7emg4n6hR+U8hWnk=
X-Google-Smtp-Source: ABdhPJxW8C59Jq0Pei+jZgoEB1O83v6o+W3HERrHg0pzeXv7bQKu2fYbCfGPFy/xFLqdAnsi84VdUw==
X-Received: by 2002:ac8:5a:: with SMTP id i26mr244744qtg.269.1633722219005;
 Fri, 08 Oct 2021 12:43:39 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.ky.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id a17sm164016qtn.86.2021.10.08.12.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 12:43:38 -0700 (PDT)
Subject: Re: [PATCH 0/9] Dynamic DT device nodes
To: Rob Herring <robh+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211007000954.30621-1-zev@bewilderbeest.net>
 <CAHp75VdYBB_FaMr-uKswdvDBdobTYZkiE6ncoALuG+YYVoMwyw@mail.gmail.com>
 <YV64ZbcsHvBObH2j@hatter.bewilderbeest.net> <YV7Miz9RMMx/17A0@kroah.com>
 <YV8VGeMreR6NJad4@hatter.bewilderbeest.net>
 <CAL_JsqLk-CqKVgWp3=XccHrCdQgdGoezB6=HAXMDe1Q5R4-0HA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <662f6ff3-61b9-e1e6-5059-699edbb2ab1c@gmail.com>
Date: Fri, 8 Oct 2021 14:43:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqLk-CqKVgWp3=XccHrCdQgdGoezB6=HAXMDe1Q5R4-0HA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 11 Oct 2021 16:05:05 +1100
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-aspeed@lists.ozlabs.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Francis Laniel <laniel_francis@privacyrequired.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Alexey Dobriyan <adobriyan@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Andy Shevchenko <andy@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/7/21 3:03 PM, Rob Herring wrote:
> On Thu, Oct 7, 2021 at 10:41 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>>
>> On Thu, Oct 07, 2021 at 03:31:39AM PDT, Greg Kroah-Hartman wrote:
>>> On Thu, Oct 07, 2021 at 02:05:41AM -0700, Zev Weiss wrote:
>>>> On Thu, Oct 07, 2021 at 12:04:41AM PDT, Andy Shevchenko wrote:
>>>>> On Thu, Oct 7, 2021 at 3:10 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>>>>>> This patch series is in some ways kind of a v2 for the "Dynamic
>>>>>> aspeed-smc flash chips via 'reserved' DT status" series I posted
>>>>>> previously [0], but takes a fairly different approach suggested by Rob
>>>>>> Herring [1] and doesn't actually touch the aspeed-smc driver or
>>>>>> anything in the MTD subsystem, so I haven't marked it as such.
>>>>>>
>>>>>> To recap a bit of the context from that series, in OpenBMC there's a
>>>>>> need for certain devices (described by device-tree nodes) to be able
>>>>>> to be attached and detached at runtime (for example the SPI flash for
>>>>>> the host's firmware, which is shared between the BMC and the host but
>>>>>> can only be accessed by one or the other at a time).
>>>>>
>>>>> This seems quite dangerous. Why do you need that?
>>>>
>>>> Sometimes the host needs access to the flash (it's the host's firmware,
>>>> after all), sometimes the BMC needs access to it (e.g. to perform an
>>>> out-of-band update to the host's firmware).  To achieve the latter, the
>>>> flash needs to be attached to the BMC, but that requires some careful
>>>> coordination with the host to arbitrate which one actually has access to it
>>>> (that coordination is handled by userspace, which then tells the kernel
>>>> explicitly when the flash should be attached and detached).
>>>>
>>>> What seems dangerous?
>>>>
>>>>> Why can't device tree overlays be used?
>>>>
>>>> I'm hoping to stay closer to mainline.  The OpenBMC kernel has a documented
>>>> policy strongly encouraging upstream-first development:
>>>> https://github.com/openbmc/docs/blob/master/kernel-development.md
>>>>
>>>> I doubt Joel (the OpenBMC kernel maintainer) would be eager to start
>>>> carrying the DT overlay patches; I'd likewise strongly prefer to avoid
>>>> carrying them myself as additional downstream patches.  Hence the attempt at
>>>> getting a solution to the problem upstream.
>>>
>>> Then why not work to get device tree overlays to be merged properly?
> 
> TBC, it's 'just' the general purpose userspace interface to apply
> overlays that's missing.

A fuller view of what is missing is at:

https://elinux.org/Frank%27s_Evolving_Overlay_Thoughts#issues_and_what_needs_to_be_completed_--_Not_an_exhaustive_list


> 
> I did suggest what's done here as overlays are kind of an overkill for
> this usecase. Much easier to write to a sysfs file than write an
> overlay, compile it with dtc, and provide it to the kernel all just to
> enable a device.
> 
> Perhaps this could also be supported in the driver model directly.
> Given the "what about ACPI question", that is probably what should be
> done unless the answer is we don't care. I think we'd just need a flag
> to create devices, but not bind automatically. Or maybe abusing
> driver_override can accomplish that.
> 
>>> Don't work on a half-of-a-solution when the real solution is already
>>> here.
>>>
>>
>> I had been under the impression that the overlay patches had very dim
>> prospects of ever being accepted and that this might be a more tractable
>> alternative, but apparently was mistaken -- I'll look into what the
>> outstanding issues were with that and perhaps take a stab at addressing
>> them.
> 

> What's dim is the patches allowing any modification to any part of the
> DT. Any changes to a DT need to work (i.e. have some effect). For
> example, randomly changing/adding/removing properties wouldn't have
> any effect because they've probably already be read and used.

Yes, that is a good description.

> 
> What I've suggested before is some sort of registration of nodes
> allowed to apply child nodes and properties to. That would serve the
> add-on board usecases which have been the main driver of this to date.
> That also got hung up on defining interface nodes to add-on boards.
> Your scope is more limited and can be limited to that scope while
> using the same configfs interface.
> 
> Rob
> 

