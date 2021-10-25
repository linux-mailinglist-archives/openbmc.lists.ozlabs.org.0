Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3907F438EEE
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 07:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd3f60prtz2xg3
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 16:38:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Te2l8WbC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f34;
 helo=mail-qv1-xf34.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Te2l8WbC; dkim-atps=neutral
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd3dj2vXhz2xDg
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 16:38:15 +1100 (AEDT)
Received: by mail-qv1-xf34.google.com with SMTP id v10so6501336qvb.10
 for <openbmc@lists.ozlabs.org>; Sun, 24 Oct 2021 22:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yghFMz392uOcuB4Z/ZyQL4CAW2XIY00a8fp/sEUunw8=;
 b=Te2l8WbCdIy0NPNic3cx1mKh9kL346a9mF/exTlIRE515c+WwjvHk/ctAwzDCgl71k
 AZg8hkj/Fukk1IZOXz31L61DDMgWVIIaXoJLk9HKRY8YvROVTewUtMVuBlaoCTzw7TiX
 g3TS4TtCX7bMp8UNTKq5HW+nU3MRtyiGtJtP/4YnJOLQ3DKtbUg+WTbcp1TfUBqVm+0v
 Zgn1p/uvUtE5a034x38TKdA8BlkXeIH2Irn3+fXeGUChnhSyXYy0DlwhRqYqUZJIs2zY
 6kkf4OKf12rANFTUEemCFHndImyXXy+pq284JyGvbzKGaxdSwdizqlbX7N/runeFZc5l
 uJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yghFMz392uOcuB4Z/ZyQL4CAW2XIY00a8fp/sEUunw8=;
 b=IybxcZ1kNI0RNheBh9vNSQxyuQjS077vyMcd/qCtbWE3tNhE1E4FvHe6BJ5IgHoU6i
 Q6s9tArtJ9/j8Wi6F9Mwv6eyHOENhwOFttiFK7Z8bhaEm2XuKYMsrZDUysEai345Zx7Z
 5H7wWmfxEA5Uq1crZdaeOLMbBNJZNxCe8aQHp05NAjvd/kk9nHxcaa0jlVCyI5cBHwaJ
 IJYBJY0e54Ntc6AlXz8K79kwlb6i3itxXw1rZ6W3fyyQ5aUtZN8Sh/Q3v8334NyG1J70
 ujx9QBjHVNjB3HN3uKgqnp22EEMLTdG+4nE0P0XlBMebsbHlK3TtHIF6HliKOLEJTOGg
 QcTQ==
X-Gm-Message-State: AOAM531V5byGjaAmjFxg3QIhPxEbzs06Y+PEjA/jTujwbFkBFokQgzif
 dg4SQUlaGUiHZlXFkNbjHrg=
X-Google-Smtp-Source: ABdhPJzl+miwIXTdiRHRuM4tlyWv6vNT13hdYme3hmhR1GHzMk6+5mhO28hj7H/y0qwKQ00JLZVZRg==
X-Received: by 2002:ad4:4144:: with SMTP id z4mr13433062qvp.22.1635140290153; 
 Sun, 24 Oct 2021 22:38:10 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id c7sm7913544qke.78.2021.10.24.22.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 22:38:09 -0700 (PDT)
Subject: Re: [PATCH 4/5] driver core: inhibit automatic driver binding on
 reserved devices
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Patrick Williams <patrick@stwcx.xyz>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <20211022020032.26980-5-zev@bewilderbeest.net> <YXJeYCFJ5DnBB63R@kroah.com>
 <YXJ3IPPkoLxqXiD3@hatter.bewilderbeest.net> <YXJ88eARBE3vU1aA@kroah.com>
 <YXLWMyleiTFDDZgm@heinlein> <YXPOSZPA41f+EUvM@kroah.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <627101ee-7414-57d1-9952-6e023b8db317@gmail.com>
Date: Mon, 25 Oct 2021 00:38:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXPOSZPA41f+EUvM@kroah.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Zev Weiss <zev@bewilderbeest.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, Jeremy Kerr <jk@codeconstruct.com.au>,
 Rajat Jain <rajatja@google.com>, Jianxiong Gao <jxgao@google.com>,
 Dave Jiang <dave.jiang@intel.com>, kvm@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, openbmc@lists.ozlabs.org,
 devicetree@vger.kernel.org, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/23/21 3:56 AM, Greg Kroah-Hartman wrote:
> On Fri, Oct 22, 2021 at 10:18:11AM -0500, Patrick Williams wrote:
>> Hi Greg,
>>
>> On Fri, Oct 22, 2021 at 10:57:21AM +0200, Greg Kroah-Hartman wrote:
>>> On Fri, Oct 22, 2021 at 01:32:32AM -0700, Zev Weiss wrote:
>>>> On Thu, Oct 21, 2021 at 11:46:56PM PDT, Greg Kroah-Hartman wrote:
>>>>> On Thu, Oct 21, 2021 at 07:00:31PM -0700, Zev Weiss wrote:
>>
>>>> So we want the kernel to be aware of the device's existence (so that we
>>>> *can* bind a driver to it when needed), but we don't want it touching the
>>>> device unless we really ask for it.
>>>>
>>>> Does that help clarify the motivation for wanting this functionality?
>>>
>>> Sure, then just do this type of thing in the driver itself.  Do not have
>>> any matching "ids" for this hardware it so that the bus will never call
>>> the probe function for this hardware _until_ a manual write happens to
>>> the driver's "bind" sysfs file.
>>
>> It sounds like you're suggesting a change to one particular driver to satisfy
>> this one particular case (and maybe I'm just not understanding your suggestion).
>> For a BMC, this is a pretty regular situation and not just as one-off as Zev's
>> example.
>>
>> Another good example is where a system can have optional riser cards with a
>> whole tree of devices that might be on that riser card (and there might be
>> different variants of a riser card that could go in the same slot).  Usually
>> there is an EEPROM of some sort at a well-known address that can be parsed to
>> identify which kind of riser card it is and then the appropriate sub-devices can
>> be enumerated.  That EEPROM parsing is something that is currently done in
>> userspace due to the complexity and often vendor-specific nature of it.
>>
>> Many of these devices require quite a bit more configuration information than
>> can be passed along a `bind` call.  I believe it has been suggested previously
>> that this riser-card scenario could also be solved with dynamic loading of DT
>> snippets, but that support seems simple pretty far from being merged.
> 
> Then work to get the DT code merged!  Do not try to create
> yet-another-way of doing things here if DT overlays is the correct
> solution here (and it seems like it is.)

I don't think this is a case that fits the overlay model.

We know what the description of the device is (which is what devicetree
is all about), but the device is to be shared between the Linux kernel
and some other entity, such as the firmware or another OS.  The issue
to be resolved is how to describe that the device is to be shared (in
this case exclusively by the kernel _or_ by the other entity at any
given moment), and how to move ownership of the device between the
Linux kernel and the other entity.

In the scenario presented by Zev, it is suggested that a user space
agent will be involved in deciding which entity owns the device and
to tell the Linux kernel when to take ownership of the device (and
presumably when to relinquish ownership, although we haven't seen
the implementation of relinquishing ownership yet).  One could
imagine direct communication between the driver and the other
entity to mediate ownership.  That seems like a driver specific
defined choice to me, though if there are enough different drivers
facing this situation then eventually a shared framework would
make sense.

So to step back and think architecture, it seems to me that the
devicetree needs to specify in the node describing the shared
device that the device must be (1) owned exclusively by either
the Linux kernel or some other entity, with a signalling method
between the Linux kernel and the other entity being defined
(possibly by information in the node or possibly by the definition
of the driver) or (2) actively shared by both the Linux
kernel and the other entity.  Actively shared may or may not be
possible, based on the specific hardware.  For example, if a single
contains some bits controlled by the Linux kernel and other bits
controlled by the other entity, then it can be difficult for one
of the two entities to atomically modify the register in coordination
with the other entity.  Obviously case 1 is much simpler than case 2,
I'm just trying to create a picture of the potential cases.  In a
simpler version of case 2, each entity would have control of their
own set of registers.

Diverging away from the overlay question, to comment on the
"status" property mentioned elsewhere in this thread, I do not
think that a status value of "reserved" is an adequate method
of conveying all of the information needed by the above range
of scenarios.

-Frank

> 
> thanks,
> 
> greg k-h
> 

