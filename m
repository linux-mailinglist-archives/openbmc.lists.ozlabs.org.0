Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 397A94397F6
	for <lists+openbmc@lfdr.de>; Mon, 25 Oct 2021 15:58:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdGkf0yxLz2y7X
	for <lists+openbmc@lfdr.de>; Tue, 26 Oct 2021 00:58:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eZ7BFSwk;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=frowand.list@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eZ7BFSwk; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdGkB2sKSz2xYL
 for <openbmc@lists.ozlabs.org>; Tue, 26 Oct 2021 00:57:53 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id d205so11845034qke.3
 for <openbmc@lists.ozlabs.org>; Mon, 25 Oct 2021 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7rxdYqIO+JK237h1leH+bsExljsO5Y3Ycz3/IBgPYvU=;
 b=eZ7BFSwkN97rU+KuOwXK41Ezbmjb1zO1EQQfTqES8rc4l6I6gaf2NlET/tJkMoA1+N
 Bxnr1CkIIGs5iKbE6Xo5MZlCChvaZUESb1vwhUZ7YGmF/yxJBPkWOlIG8rXpa4V9wyYb
 9GWUvUtdPIRl9QDTIS+dHoa16SiuRkDAbO+N/NbK3FRHTXIs53iAYMd4ZPqMxVD8m/hf
 Md/5XiEMe6x4fFsDnaMquFen7nxsvv5Yrwe7FLlovDKY1K4CIsaAODZGZYEZ2cIo2Ml8
 VFgVMgMTZCK53gS4zuWrq66TGd1qsxc4BUrErUft7zlzoqyFS5T+Mg01bH7IhS/4GkKP
 0Mew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7rxdYqIO+JK237h1leH+bsExljsO5Y3Ycz3/IBgPYvU=;
 b=rtxb2xHHB3JwdQevUa0xexPpB/YoRUb6Bzx/Hsc+SWEynVlfA20VRIqnHJWdqFIUzV
 8q3+fk37QOF4Z3BEPAw1O/IKMxH/fYuGy5wLeXiGbcDQOFzC8qIs3GX8J2cKCIzS6h6l
 4BToSwNJV6Iy+/vGcOPpTXX3wtmiwFDpfEgEu3MBOYshYw7r7Pcha9S6zv+lltCabZ/j
 ezcNVghxLw5X8AiigcejK7BzgOyvQjC4b1ROiLq8L2TzCSquK65ZM4LlJu6Dkhxh/1NO
 aEl/+J/1TVvyzg5X7R+Zngq2TDrKebYVjHCLF19JekE+0SQn1n/NPX9jBOQwBHnFaILj
 wi2Q==
X-Gm-Message-State: AOAM533ZTLGPGfd4BENBrYJGl/jDa3G19Pi4DD23eReWqY9olfCqlf34
 KO7i7Q7U3D3VnlNhGY2PBqg=
X-Google-Smtp-Source: ABdhPJx7RB7JYMETqkdl2lDe/tLc/PmA59WParAYFcWHyJw9NE116RVhX5z3h21h20znsAvGdfjeDg==
X-Received: by 2002:a05:620a:31a2:: with SMTP id
 bi34mr13385245qkb.331.1635170270173; 
 Mon, 25 Oct 2021 06:57:50 -0700 (PDT)
Received: from [192.168.1.49] (c-67-187-90-124.hsd1.tn.comcast.net.
 [67.187.90.124])
 by smtp.gmail.com with ESMTPSA id r23sm8453413qtm.80.2021.10.25.06.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 06:57:49 -0700 (PDT)
Subject: Re: [PATCH 0/5] driver core, of: support for reserved devices
From: Frank Rowand <frowand.list@gmail.com>
To: Zev Weiss <zev@bewilderbeest.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211022020032.26980-1-zev@bewilderbeest.net>
 <YXJfHwzIdksUKPIe@kroah.com> <YXJ9yR6b5vI3NwF7@hatter.bewilderbeest.net>
 <3a5e271d-d977-7eca-21c5-fd75a2366920@gmail.com>
Message-ID: <ad2b0169-a8c1-f94b-9bf5-11bc1e17f843@gmail.com>
Date: Mon, 25 Oct 2021 08:57:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3a5e271d-d977-7eca-21c5-fd75a2366920@gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: devicetree@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jeremy Kerr <jk@codeconstruct.com.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On 10/25/21 12:53 AM, Frank Rowand wrote:
> On 10/22/21 4:00 AM, Zev Weiss wrote:
>> On Thu, Oct 21, 2021 at 11:50:07PM PDT, Greg Kroah-Hartman wrote:
>>> On Thu, Oct 21, 2021 at 07:00:27PM -0700, Zev Weiss wrote:
>>>> Hello all,
>>>>
>>>> This series is another incarnation of a couple other patchsets I've
>>>> posted recently [0, 1], but again different enough in overall
>>>> structure that I'm not sure it's exactly a v2 (or v3).
>>>>
>>>> As compared to [1], it abandons the writable binary sysfs files and at
>>>> Frank's suggestion returns to an approach more akin to [0], though
>>>> without any driver-specific (aspeed-smc) changes, which I figure might
>>>> as well be done later in a separate series once appropriate
>>>> infrastructure is in place.
>>>>
>>>> The basic idea is to implement support for a status property value
>>>> that's documented in the DT spec [2], but thus far not used at all in
>>>> the kernel (or anywhere else I'm aware of): "reserved".  According to
>>>> the spec (section 2.3.4, Table 2.4), this status:
>>>>
>>>>   Indicates that the device is operational, but should not be used.
>>>>   Typically this is used for devices that are controlled by another
>>>>   software component, such as platform firmware.
>>>>
>>>> With these changes, devices marked as reserved are (at least in some
>>>> cases, more on this later) instantiated, but will not have drivers
>>>> bound to them unless and until userspace explicitly requests it by
>>>> writing the device's name to the driver's sysfs 'bind' file.  This
>>>> enables appropriate handling of hardware arrangements that can arise
>>>> in contexts like OpenBMC, where a device may be shared with another
>>>> external controller not under the kernel's control (for example, the
>>>> flash chip storing the host CPU's firmware, shared by the BMC and the
>>>> host CPU and exclusively under the control of the latter by default).
>>>> Such a device can be marked as reserved so that the kernel refrains
>>>> from touching it until appropriate preparatory steps have been taken
>>>> (e.g. BMC userspace coordinating with the host CPU to arbitrate which
>>>> processor has control of the firmware flash).
>>>>
>>>> Patches 1-3 provide some basic plumbing for checking the "reserved"
>>>> status of a device, patch 4 is the main driver-core change, and patch
>>>> 5 tweaks the OF platform code to not skip reserved devices so that
>>>> they can actually be instantiated.
>>>
>>> Again, the driver core should not care about this, that is up to the bus
>>> that wants to read these "reserved" values and do something with them or
>>> not (remember the bus is the thing that does the binding, not the driver
>>> core).
>>>
>>> But are you sure you are using the "reserved" field properly?
>>
>> Well, thus far both Rob Herring and Oliver O'Halloran (originator of the "reserved" status in the DT spec, whom I probably should have CCed earlier, sorry) have seemed receptive to this interpretation of it, which I'd hope would lend it some credence.
> 
> I am not on board with this interpretation.  To me, if the value of
> status is "reserved", then the Linux kernel should _never_ use the
> device described by the node.
> 
> If a "reserved" node is usable by the Linux kernel, then the specification
> should be updated to allow this.  And the specification should probably
> be expanded to either discuss how to describe the coordination between
> multiple entities or state that the coordination is outside of the
> specification and will be implemention dependent.

Maybe a value of "reserved-sharable" should be added to the standard.
This would indicate that the node is operational and controlled by
another software component, but is available to the operating system
after requesting permission or being granted permission from the other
software component.

The exact method of requesting permission or being granted permission
could either be driver specific, or the driver binding could
include one or more additional properties to describe the method.

One thing that I am wary of is the possibility of a proliferation of
status checks changing from "okay" to "okay" || ("reserved" and the
state of the driver is that permission has been granted).

From a simplicity of coding view, it is really tempting to dynamically
change the value of the status property from "reserved-sharable"
to "okay" when the other software component grants permission to
use the device, so that status checks will magically allow use
instead of blocking use.  I do not like changing the value of the
status property dynamically because the devicetree is supposed to
describe hardware (and communicate information from the firmware
to the operating system), not to actively maintain state.

-Frank

> 
> I am wary of the complexity of the operating system treating a node as
> reserved at initial boot, then at some point via coordination with
> some other entity starting to use the node.  It is not too complex if
> the node is a leaf node with no links (phandles) to or from any other node,
> but as soon as links to or from other nodes exist, then other drivers or
> subsystems may need to be aware of when the node is available to the
> operating system or given back to the other entity then any part of the
> operating system has to coordinate in that state transition.  This is
> driving a lot of my caution that we be careful to create architecture
> and not an ad hoc hack.
> 
> -Frank
> 
>>
>>> You are
>>> wanting to do "something" to the device to later on be able to then have
>>> the kernel touch the device, while it seems that the reason for this
>>> field is for the kernel to NEVER touch the device at all.  What will
>>> break if you change this logic?
>>
>> Given that there's no existing usage of or support for this status value anywhere I can see in the kernel, and that Oliver has indicated that it should be compatible with usage in OpenPower platform firmware, my expectation would certainly be that nothing would break, but if there are examples of things that could I'd be interested to see them.
>>
>>
>> Thanks,
>> Zev
>>
> 

