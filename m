Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B26E21988B
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 08:21:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2R0D30kYzDqxk
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 16:21:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=HPplTPZ9; dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2QzT6rWFzDqwm
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 16:21:07 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id y13so511620ybj.10
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2020 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=er/4NX7Vv8STNF9sCkfBQB4b6Lj5jImhyfJhdgnjkTA=;
 b=HPplTPZ9px/4EEnid8c/Qn43eNRHgMHne5QNDByolKTlU/5yge2VvHblBCu8yEuZZh
 K1xrb2wkHssU7+b07JOifDtDp2z3nBKFMo8tbR7S8lgzZgGFAuEI/Y23RppCMDSdPwQy
 703C1lUX+p5pqKdHIq6ta4tEZQsmIIKOvsWDsbTK7QpBjxnuZdXQCXjXApQhy32QHPWU
 d8DyWBtLyKdy3PUz3E0FBaJmH5fg8Rd/mdae/6QJvRO4oS5naNZgkDBUkyzjIgRgBf63
 9gNOFidOc5sRc0dXn9oKz2mb91LYDcZFI+kwQ6Gic4GGAsIAbXi4dEcZs7Qam46A0MtB
 GNJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=er/4NX7Vv8STNF9sCkfBQB4b6Lj5jImhyfJhdgnjkTA=;
 b=OMnQzRC9tAL3C8Z4oIZ6rSrJkUherQQ6OSl6jerj9cWtrSBeCZOmPLzNlrKVRtPX9d
 ij7Tj0EFgAkg0F7kZxx1xD+9Hb2Rg7RwWgY4OcvTBs8EBNYK2JgVo1ON+bRe2z797u2b
 pRn29/D43gIEYuG54uEqQYgTP9ZcF9QuaF4q2oV0ZX5Lma1C0qJ7cOCflcUJz7HfBkld
 pKEpIZ+8MHxuXUnAH+THWQoXGttwlT7lG0xJOSLUd1qp/ZM/o3WW9q7vstVidgohfKg1
 22arlTDG8/lnF2wOb6usXVd0TnCOdl9rqZuYnbIFKwY8azpFIfxp1FBB5NcdiDvhNRpm
 OGBw==
X-Gm-Message-State: AOAM530xoP5D1w8bGN0N1ItnJTS3oMH+CEYRMshFRey/ae/ZsHbEEfiw
 tFgo8Z3b8g9FmgfEIPvgdaW2GRwmqlq+l+lvqMMk0g==
X-Google-Smtp-Source: ABdhPJzVEsCtwR26IPRV9aOVt+IaohukpT/v+5PtIcZy/kb+1WVrQPSJK3niMqgNqp3RhpLe/hrWcpLOq0NOpkfAyUM=
X-Received: by 2002:a25:cc12:: with SMTP id l18mr33232483ybf.480.1594275663308; 
 Wed, 08 Jul 2020 23:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
 <CAO=notxk6prforcTO02_P-5VkcmpP-Qk2zhfH8sU5Q0YksusFQ@mail.gmail.com>
 <CACWQX83PR=XWon0ws7GmTA2S_RoWEVC7s5i+=ps2r2qSYe4f1A@mail.gmail.com>
 <CAHBbfcWBJOm=eD=_B2gmb-GQd_wAKHCbc=42GphywcL4-Qvdeg@mail.gmail.com>
In-Reply-To: <CAHBbfcWBJOm=eD=_B2gmb-GQd_wAKHCbc=42GphywcL4-Qvdeg@mail.gmail.com>
From: Ed Tanous <ed@tanous.net>
Date: Wed, 8 Jul 2020 23:20:52 -0700
Message-ID: <CACWQX80ELryTPOk6io96RNpo_AJUqCQeeZTVckDsSCC31Y0AvA@mail.gmail.com>
Subject: Re: phosphor-pid-control: dbus tuning interface
To: Jason Ling <jasonling@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Jul 8, 2020 at 11:03 AM Jason Ling <jasonling@google.com> wrote:
>>
>>
>> This capability already exists if you're using phosphor-pid-control
>>
>> with entity manager
>>
>> ..
>>
>> Entity manager essentially will trigger a reconfigure of
>> phosphor-pid-control on every change, so new parameters can be tested.
>
>
> I see. Let me make sure my mental model is correct.
> You can modify PID configuration parameters published by entity-manager v=
ia dbus (is this a separate dbus path/interface than the pid-configuration =
interface?).
Yes, to the first part, no to the second.  Because entity manager
configurations can change over time, at runtime, the dbus config
interface is expected to change, so entity manager is simply
simulating as if you had unplugged the hardware, then replugged in a
nearly identical device, with the parameters changed.

> Entity-manager detects the property change/method call and then updates i=
ts pid-configuration on dbus.
> phosphor-pid-control is listening on a signal/event and then essentially =
restarts itself and picks up the new configuration?

You have that exactly right.

>
>>
>> I'm guessing you didn't know that existed, and clearly Patrick didn't
>> either.  So the next question is, where did you go to look for this
>> kind of thing (ie, where should we document this)?  There might not be
>> a perfect place, but hopefully we can make this more clear in the
>> future when people have these needs.
>
>
> I sure didn't, thanks for pointing this out.  As far as documentation imp=
rovements:
> How to configure phosphor-pid-control should probably mention something a=
bout the capability of configuring phosphor-pid-control via dbus.
The reason we didn't put it there is that phosphor-pid-control isn't
really the one doing the configuration change, it's entity manager,
but I suspect we could add a pointer to "If you're trying to modify
parameters at runtime, look at this doc in entity manager/main docs
repo".   Now that I type that, it might be worth an architecture doc
in the main docs repo as well.  There's a lot of machinery going on
under the hood there that was under-documented (my fault for that).

> As far as dbus pid-tuning goes, I suppose there should be some mention of=
 it in https://github.com/openbmc/phosphor-pid-control/blob/master/tuning.m=
d .. I guess something along the lines of "...dbus configuration changes wi=
ll be reflected in the operation of phosphor-pid-control.".
> Intentionally left a bit vague because it doesn't HAVE to be entity-manag=
er providing this configuration interface. It could be some other service t=
hat reads a config.json and publishes this information to dbus...
> Which brings me to my next question
> "Is the PID configuration interface formally defined as part of phosphor-=
dbus-interfaces?"

That is an excellent point, and is probably a miss on our part.  I
imagine that would be a good place to start in getting them
documented.

>
>
> Thanks for the brain-dump Ed, it's making me rethink my approach. Adding =
yet another tuning interface has a clear potential to bloat and over compli=
cate phosphor-pid-control. It seems like even if a system was using phospho=
r-hwmon for sensor telemetry monitoring, you could still use entity-manager=
 just to publish and modify PID configurations.
>
Today, phosphor-hwmon doesn't have compatibility with the Entity
Manager config data structures.  When we looked last, it was a pretty
major effort to support it, as it somewhat conflicts with the way it
was built originally.  Nothing against phosphor-hwmon, it does what it
was built to do, but runtime modification wasn't really it.
