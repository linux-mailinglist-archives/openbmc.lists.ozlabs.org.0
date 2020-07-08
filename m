Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA55E218F74
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 20:04:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B26dt0wV4zDqgV
	for <lists+openbmc@lfdr.de>; Thu,  9 Jul 2020 04:04:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::22d;
 helo=mail-oi1-x22d.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SZAxndSX; dkim-atps=neutral
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B26cy3lQszDqJW
 for <openbmc@lists.ozlabs.org>; Thu,  9 Jul 2020 04:04:01 +1000 (AEST)
Received: by mail-oi1-x22d.google.com with SMTP id y22so25937299oie.8
 for <openbmc@lists.ozlabs.org>; Wed, 08 Jul 2020 11:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uXB8sE10pmG+J6IW9euCvOdv7N10AgZrrBrZPtuN65E=;
 b=SZAxndSXmWq87OQGdrWkTIFgxSGfgpaqtY1DCS7EHGQMZUBN7GeN1X57Av4v93BtT3
 78KgNJO6HjO96fhmAJ2CAxQfbzMnkTgfNQMRchiOmvEijSdMmP8bMgg39QoH4f8xuZnM
 6nOclQRr2jiCct9+b3L8OwCBZVTKrWkukzA0A2s4OKy1eeBWjoRPRfADqbBOjP7SsVKs
 Fd9Tv/XejECRwvCAFZJm+Ems6DTXe/x3TZM0dhdwmBuXIeWOZSdnd8EiwMmPIXbPDLCq
 abEGfxNL0x213lQQKeTYGPbxq0EOKxbjzh5d+I6zorRe/K7UZMrLKTwTTRGcUu7dhYpY
 Cvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uXB8sE10pmG+J6IW9euCvOdv7N10AgZrrBrZPtuN65E=;
 b=FUeWb2PICEA5iqiCfiOaj96BuRw5RT1Bm15j86VZwHgAg14yafGgl9ylV631oSR1qF
 D5MROyGx90nXDaq75/7yRWOrXMrBCSGPISkdspmdAnby3tYwPDhUgPeNYKmB3d9L4lya
 PpnJIsSQ3G/AwlvTDBJ8j/+EGTKZv7m3ssmSMtK7O3rF4NJbS9mXs+kgUbScD16MWntL
 3D7RdwVgHLZ8EENon43BiwlSiK4kA4SQDBLxWOWkD94o1OwVNVjEu+/FpKtfaBX8q3LI
 fhyAjspOuLdtTqVhPbuvNO2bQbLxPciiWvQ8R/FpPC8aTivu8nbXzmFTEwgD6SsNUz+V
 hNew==
X-Gm-Message-State: AOAM532mqfQ55UKjyuySRPOXHXJF6YrPpORgVsfjULlxipP9t35YnaTO
 Kr8CLLE3cl4hT/cK5rmw2LwIenzFNJhDld4lS7U6+w==
X-Google-Smtp-Source: ABdhPJzScBVx0jgUZiDApEIt2uPChGgwYHv05bMXh0u64EXs48umU4YAr2NpIlHWMYZZct28cnekdn6jnn6/M99wy7A=
X-Received: by 2002:aca:fc87:: with SMTP id a129mr8430083oii.28.1594231437526; 
 Wed, 08 Jul 2020 11:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXKcxdbDG3c1hE6nFOs9kxejzWEPDw2J1xYo5emoxcr9A@mail.gmail.com>
 <CAO=notxk6prforcTO02_P-5VkcmpP-Qk2zhfH8sU5Q0YksusFQ@mail.gmail.com>
 <CACWQX83PR=XWon0ws7GmTA2S_RoWEVC7s5i+=ps2r2qSYe4f1A@mail.gmail.com>
In-Reply-To: <CACWQX83PR=XWon0ws7GmTA2S_RoWEVC7s5i+=ps2r2qSYe4f1A@mail.gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Wed, 8 Jul 2020 11:03:21 -0700
Message-ID: <CAHBbfcWBJOm=eD=_B2gmb-GQd_wAKHCbc=42GphywcL4-Qvdeg@mail.gmail.com>
Subject: Re: phosphor-pid-control: dbus tuning interface
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="0000000000008675df05a9f1ee21"
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

--0000000000008675df05a9f1ee21
Content-Type: text/plain; charset="UTF-8"

>
>
> This capability already exists if you're using phosphor-pid-control
>
>> with entity manager
>
>> ..
>
>> Entity manager essentially will trigger a reconfigure of
> phosphor-pid-control on every change, so new parameters can be tested.


I see. Let me make sure my mental model is correct.
You can modify PID configuration parameters published by entity-manager via
dbus (is this a separate dbus path/interface than the pid-configuration
interface?).
Entity-manager detects the property change/method call and then updates its
pid-configuration on dbus.
phosphor-pid-control is listening on a signal/event and then essentially
restarts itself and picks up the new configuration?


> I'm guessing you didn't know that existed, and clearly Patrick didn't
> either.  So the next question is, where did you go to look for this
> kind of thing (ie, where should we document this)?  There might not be
> a perfect place, but hopefully we can make this more clear in the
> future when people have these needs.


I sure didn't, thanks for pointing this out.  As far as documentation
improvements:
How to configure phosphor-pid-control
<https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md>
should
probably mention something about the capability of configuring
phosphor-pid-control via dbus.
As far as dbus pid-tuning goes, I suppose there should be some mention of
it in https://github.com/openbmc/phosphor-pid-control/blob/master/tuning.md ..
I guess something along the lines of "...dbus configuration changes will be
reflected in the operation of phosphor-pid-control.".
Intentionally left a bit vague because it doesn't HAVE to be entity-manager
providing this configuration interface. It could be some other service that
reads a config.json and publishes this information to dbus...
Which brings me to my next question
"Is the PID configuration interface formally defined as part of
phosphor-dbus-interfaces?"


Thanks for the brain-dump Ed, it's making me rethink my approach. Adding
yet another tuning interface has a clear potential to bloat and over
complicate phosphor-pid-control. It seems like even if a system was using
phosphor-hwmon for sensor telemetry monitoring, you could still use
entity-manager just to publish and modify PID configurations.

--0000000000008675df05a9f1ee21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"></blockquote><br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"></blockquote>This capability already exis=
ts if you&#39;re using phosphor-pid-control<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0.8ex;border-left:1px solid rgb(204,204,204);bord=
er-right:1px solid rgb(204,204,204);padding-left:1ex;padding-right:1ex"></b=
lockquote>with entity manager<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0.8ex;border-left:1px solid rgb(204,204,204);border-right:1px s=
olid rgb(204,204,204);padding-left:1ex;padding-right:1ex"></blockquote>..<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0px 0.8ex;border-left:1=
px solid rgb(204,204,204);border-right:1px solid rgb(204,204,204);padding-l=
eft:1ex;padding-right:1ex"></blockquote>Entity manager essentially will tri=
gger a reconfigure of<br>phosphor-pid-control on every change, so new param=
eters can be tested.=C2=A0</blockquote><div>=C2=A0</div><div>I see. Let me =
make sure my mental model is correct.</div><div>You can modify PID configur=
ation parameters published by entity-manager via dbus (is this a separate d=
bus path/interface than the pid-configuration interface?).</div><div>Entity=
-manager detects the=C2=A0property change/method call and then updates its =
pid-configuration on dbus.</div><div>phosphor-pid-control is listening on a=
 signal/event and then essentially restarts itself and picks up the new con=
figuration?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I&#39;m guessing you didn&#39;t know that existed, and clearly=
 Patrick didn&#39;t<br>either.=C2=A0 So the next question is, where did you=
 go to look for this<br>kind of thing (ie, where should we document this)?=
=C2=A0 There might not be<br>a perfect place, but hopefully we can make thi=
s more clear in the<br>future when people have these needs.</blockquote><di=
v><br></div><div>I sure didn&#39;t, thanks for pointing this out.=C2=A0 As =
far as documentation improvements:</div><div><a href=3D"https://github.com/=
openbmc/phosphor-pid-control/blob/master/configure.md">How to configure pho=
sphor-pid-control</a>=C2=A0should probably mention something about the capa=
bility of configuring phosphor-pid-control via dbus.</div><div>As far as db=
us pid-tuning goes, I suppose there should be some mention of it in=C2=A0<a=
 href=3D"https://github.com/openbmc/phosphor-pid-control/blob/master/tuning=
.md">https://github.com/openbmc/phosphor-pid-control/blob/master/tuning.md<=
/a>=C2=A0.. I guess something along the lines of &quot;...dbus configuratio=
n changes will be reflected in the operation of phosphor-pid-control.&quot;=
.</div><div>Intentionally left a bit vague because it doesn&#39;t HAVE to b=
e entity-manager providing this configuration interface. It could be some o=
ther service that reads a config.json and publishes this information to dbu=
s...</div><div>Which brings me to my next question</div><div>&quot;Is the P=
ID configuration interface formally defined as part of phosphor-dbus-interf=
aces?&quot;</div><div><br></div><div><br></div><div>Thanks for the brain-du=
mp Ed, it&#39;s making me rethink my approach. Adding yet another tuning in=
terface has a clear potential to bloat and over complicate phosphor-pid-con=
trol. It seems like even if a system was using phosphor-hwmon for sensor te=
lemetry monitoring, you could still use entity-manager just to publish and =
modify PID configurations.</div><div><br></div><div><br></div></div>

--0000000000008675df05a9f1ee21--
