Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF23F30F072
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 11:24:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWZQt6v3NzDwwJ
	for <lists+openbmc@lfdr.de>; Thu,  4 Feb 2021 21:24:06 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=manojkiran.eda@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VB6HkJAj; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWZPt25mtzDwsD
 for <openbmc@lists.ozlabs.org>; Thu,  4 Feb 2021 21:23:08 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id e9so1527444pjj.0
 for <openbmc@lists.ozlabs.org>; Thu, 04 Feb 2021 02:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding:content-disposition;
 bh=UdlYILzlqFgJ+f6glQ4npVAxLa0HVTT6MhOE1E/46b8=;
 b=VB6HkJAje4i2dxiNBO/x5D2BeC/MbHnL2jR9hBnOz6ePS5peXn2f+o7AfA8bq9qAh0
 yY4Tw6rw9MawfcXAhHgfIhFzh2SvRNecrGe+3W6LPzyKCcfyZbyjYzzl5Y3jI/RAcwT4
 A1w5FVuez5r3TyOAKkBaul5DcJSJ1L9rKeOw42bsj3oNvkErhORHFd2TErbKxFn9+I/a
 1tHMRL4lzqTcJO/Ci2eeLD1Jp6243Pf4Jb7AG00ZCjIhdqmJpOXUhAXWsOyA3OhZYdqw
 2j2EcTQBkzsPGWanqFOdE4fqO1U4tQeulDMDaRvA+Yl61KtqAF6G9NXPYoS7EFf+BwcB
 eSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding
 :content-disposition;
 bh=UdlYILzlqFgJ+f6glQ4npVAxLa0HVTT6MhOE1E/46b8=;
 b=Ve6mXQmahgfIJTt9dgVjQmTIzAY7dLxhlMCWjEqdRqKi9G/e9zSLCSWDHXTuibvYXz
 eW5uIyHlaQwatL7DE37Ve1vB0xBhMPV8JVftzVfAX6Gd9Jr4j0jwYVjXqxVqHQxb0F0S
 HTg0lFYmMzSfua0PiDEKktvirH6Y/v8u1BKwVLvUtheyBwsi7rFtJ3PhtCdc5uAI6bS6
 5Fp/6uxU2i602ePPKoXZGXXxFohvQ+1oj5QO9hWCHXqFG1OLRg48Dm3u5N9zwhmPzLJn
 oNh9X7x0e3yqPBzSA74c8m2SYnnIzJupH/hsu6GT3I59UQJhdsQ+GUYpvNGRuySfzmUy
 TE3Q==
X-Gm-Message-State: AOAM533ggFb2XQ/E0L3PQY3Ik2Sh9F2GYDivaVFvntFHomJWp3EQiYCG
 8YNAjA/Slue+zyyTJRLJWdA=
X-Google-Smtp-Source: ABdhPJxXf9zhiL1oTKpujpwE8LCoMa9usNvXrQELWgGx6Bh9SFvMsmWvhiiGydsX8iUdxzTu7LEU4w==
X-Received: by 2002:a17:902:b189:b029:dc:4102:4edf with SMTP id
 s9-20020a170902b189b02900dc41024edfmr7505894plr.80.1612434183478; 
 Thu, 04 Feb 2021 02:23:03 -0800 (PST)
Received: from juliet ([183.82.158.140])
 by smtp.gmail.com with ESMTPSA id 24sm5700962pgt.14.2021.02.04.02.22.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 02:23:01 -0800 (PST)
Date: Thu, 4 Feb 2021 15:52:54 +0530
From: manoj kiran <manojkiran.eda@gmail.com>
To: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Message-ID: <48BA3AB4-40C7-4A0D-A370-06B8C9B94235@getmailspring.com>
In-Reply-To: <CAM=TmwXhvPaVfrugd__e8gmgaRw8YBuO9DwhAiRKm+iAUP=KbQ@mail.gmail.com>
References: <CAM=TmwXhvPaVfrugd__e8gmgaRw8YBuO9DwhAiRKm+iAUP=KbQ@mail.gmail.com>
Subject: Re: Progress Codes in BMC
X-Mailer: Mailspring
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Cc: "=?utf-8?Q?kunyi731=40gmail.com?=" <kunyi731@gmail.com>,
 "=?utf-8?Q?ed=40tanous.net?=" <ed@tanous.net>,
 "=?utf-8?Q?benjaminfair=40google.com?=" <benjaminfair@google.com>,
 "=?utf-8?Q?openbmc=40lists.ozlabs.org?=" <openbmc@lists.ozlabs.org>,
 "=?utf-8?Q?anoo=40us.ibm.com?=" <anoo@us.ibm.com>,
 "=?utf-8?Q?gmills=40linux.ibm.com?=" <gmills@linux.ibm.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>,
 "=?utf-8?Q?vishwa=40linux.ibm.com?=" <vishwa@linux.ibm.com>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 "=?utf-8?Q?jason.m.bills=40linux.intel.com?=" <jason.m.bills@linux.intel.com>,
 "=?utf-8?Q?vijaykhemka=40fb.com?=" <vijaykhemka@fb.com>,
 "=?utf-8?Q?wak=40google.com?=" <wak@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Deepak,

On Feb 4 2021, at 3:04 pm, Deepak Kodihalli
<deepak.kodihalli.83@gmail.com> wrote:

> Hi Manoj,
> 
> On Thu, Feb 4, 2021 at 2:17 PM manoj kiran <manojkiran.eda@gmail.com> wrote:
>> 
>> Hi All,
>> 
>> Thanks to everyone for all the implementation ideas on this thread.
>> 
>> After understanding all the inputs from the community , we were
>> planning to proceed forward with using the existing infrastructure
>> provided by phosphor-host-postd, phosphor-post-code-manager repo's &
>> leverage the BIOS POSTCode Log service to do the job.
>> 
>> The plan is to start with minimal working pieces. On the first go we
>> are planning to come up with patchsets that will do the following:
>> 
>> 1.Come up with a compilation flag & make sure phosphor-host-postd
>> still hosts the dbus interface even if it does not see the snoop port.
> 
> Is there a benefit of using phosphor-host-postd as opposed to pldmd
> implementing the Boot.Raw interface (i.e if you take out the snoop
> part, does it do anything else than just hosting a D-Bus object)?
> Post-code-manager should still work as-is. If you use host-postd for
> this and if pldmd makes a D-Bus call to write Boot.Raw as a client,
> that seems like one additional D-Bus call to get a code out via
> Redfish.

Agree, as far as i understood there is no added benefit as such in using
the host-postd. We are just using it for hosting the dbus object.

But in IBM systems, its not just the host firmware but we also have
couple of applications in BMC that would want to send these progress
codes during the early boot sequence. In that case, would pldm be a
right place to host this interface ?

And also, post-code-manager logic can become complex if it had to watch
out for both the interfaces instead of a single interface right ?


Thanks,
Manoj

> 
> Thanks,
> Deepak
> 
>> 2.PLDM will receive the 72bytes of progress code from the hypervisor
>> via File I/O, and then just send the first 8 bytes(discard everything
>> else) to the existing Raw Property & use the existing redfish BIOS
>> Post Code log service to check if things are working.
>> 
>> In the next iteration :
>> 1. We will try to modify the existing dbus property (Boot.Raw) to
>> array[byte] & the piece of code that uses this property in other
>> repos including the post-code-manager.
>> 2. There might be a need to Modify/Add new interfaces used by
>> post-code-manager to parse the buffer & host the dbus objects to such
>> an extent that an AdditionalDataURI can be given to clients(base64
>> encoded buffer) apart from filling the existing redfish message registry.
>> 
>> Does the community foresee any issues/problems if we stick to the
>> above-mentioned plan?
>> 
>> Thanks,
>> Manoj
>> 
>> On Feb 2 2021, at 8:15 am, Patrick Williams <patrick@stwcx.xyz> wrote:
>> 
>> On Mon, Feb 01, 2021 at 07:21:39PM -0500, Brad Bishop wrote:
>> > On Sat, Jan 30, 2021 at 08:31:26AM -0600, Patrick Williams wrote:
>> > >On Wed, Jan 27, 2021 at 08:05:26PM -0500, Brad Bishop wrote:
>> > >>
>> > >> There are multiple sources of the codes - on Power the power sequencing
>> > >> is done on the BMC and that is considered part of the server
>> boot so we
>> > >> have both those applications indicating their progress along
>> with the
>> > >> more traditional progress flowing down from system firmware.
>> > >
>> > >The `xyz.openbmc_project.State.Boot.Raw` is the interface to use here.
>> > >You just write the `Value` property.
>> >
>> > Ok. Do I have it right - on any application that wants to post a
>> > "progress code" you would just implement this interface on a single
>> > (arbitrary?) path and continually write to the Value property?
>> 
>> I think it is even simpler than that. You just need to make a dbus
>> client call to write to the Boot.Raw value. This might happen from your
>> boot sequence on the BMC-side or from PLDM for the Host-side.
>> 
>> You will want the phosphor-post-code-manager application running,
>> which will
>> listen to the PropertyChanged signals from Boot.Raw and keep the running
>> history for you.
>> 
>> There is also phosphor-host-postd. Currently it has an implementation
>> that looks at LPC to get the post codes. There was a proposed
>> implementation [1] that added multi-host support and I think support to
>> get the value directly from dbus client writes to Boot.Raw instead of
>> the lpc-snoop method. Then there is code in fb-ipmi-oem that writes the
>> results of some IPMB messages into the Boot.Raw value[2]. Looking at
>> this I'm not positive that all the pieces are all there, but I think it
>> is mostly there. Maybe check with the author on 1 to see where it is
>> at.
>> 
>> This design doc might be useful too [3].
>> 
>> 1. https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-host-postd/+/36509
>> 2. https://github.com/openbmc/fb-ipmi-oem/blob/master/src/biccommands.cpp#L76
>> 3. https://github.com/openbmc/docs/blob/master/designs/multi-host-postcode.md
>> 
>> --
>> Patrick Williams
>  
