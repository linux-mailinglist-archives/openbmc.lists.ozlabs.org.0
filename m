Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB42392398
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 02:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fr7Ss0171z2ymD
	for <lists+openbmc@lfdr.de>; Thu, 27 May 2021 10:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=SirD8XzA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=wltu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SirD8XzA; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fr7SX5YCYz2xv8
 for <openbmc@lists.ozlabs.org>; Thu, 27 May 2021 10:08:10 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id g24so1714585pji.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 May 2021 17:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PE1yocEwX1rmGGFrlTHunp28Zre2Wkcmr0RAY9+8UhY=;
 b=SirD8XzAIju7KFCwN0T4bYeeIQFt8mFySAAYSHMTKLjNHAWKjxK1hVflnXGFEGTayD
 oZBJniYfe94tyVuVWj3UQqhiMwzQHp/bsiW3FLqkAdQhuQigIo8IBrldEO1GR3Z7a8y5
 +Ubnz5uQf+z77hrubMje6ahoQVsTqLGddHUgUHz3TwKVIbzBgLyjzr0uqNGHUQ+NG6Ig
 0l2Y56cjeBpSML4Yt5FHmcU6Xb5SDGVeKS/+OyjnGoo3WP/hGIEtYokyq2zVHx4cNU45
 bL9n7Ckc3hvWRga0ukTJIZrS8ycRqklheQU7Cpfi3gXhGqvGXZd07n5ZWSphegdgSORg
 ukbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PE1yocEwX1rmGGFrlTHunp28Zre2Wkcmr0RAY9+8UhY=;
 b=Z3QY9gu8XQznk/3J5c5Nhc5eyQNX3VOCY5ya/UpXykQ3MLZ1rGGALtuXONYPAxlAQa
 nEbPpf+3/HWKfC92lhaiQiw+2kBmi6aUfnAILxns2mGpGT1bD3zrrspkHooi6jviIzaR
 Hb/fGLV4JxrX6UwY0Jj5r3X8/8MEuM+7oy2rDWHAjZYoysuk6VnXjlUadEhgrOQvxmeb
 KbMqxVkulOf+kWCFMX+3UxxsgQV4cwUjDE2QyBocixn+vcIvfzpZ9Wu9uH9haQaNwwiv
 Btd/ow/8OIThFOhKyVyP2VXlJQG/qQKCkxAEVZkFKMFFfnMEjCzZaAtsIqU9OMyWJx/p
 xUhg==
X-Gm-Message-State: AOAM530/nx+K5hfZkuZFxH32GCgSto9/lC5dpbqahxeFJZVhGkfAVjLM
 6+KOeYhhJES94av+MZEg/NNZqt+67VeRUdeOniJgizzhm6QMCw==
X-Google-Smtp-Source: ABdhPJzZ2kfkMmFPkUdmq/0G9HxAa8udUH4igELH4WmcUy5J8Ly0M2R4LyAowKr9rTYPxR1KOg1y3pWchBm555it/ME=
X-Received: by 2002:a17:902:c104:b029:ef:836e:15d6 with SMTP id
 4-20020a170902c104b02900ef836e15d6mr666893pli.39.1622074086535; Wed, 26 May
 2021 17:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwn2XnqABuyc3uMQDs+YgwYJL+yKLwCYn1myOVdZ=gkhw3L-A@mail.gmail.com>
 <dc3b9f0f-70d1-e403-9ab5-2c3734260240@linux.intel.com>
In-Reply-To: <dc3b9f0f-70d1-e403-9ab5-2c3734260240@linux.intel.com>
From: Willy Tu <wltu@google.com>
Date: Wed, 26 May 2021 17:07:55 -0700
Message-ID: <CAHwn2X=go70JBihiTfd0tSO0JFdPxLPiDuZf820-RypdbwCbDg@mail.gmail.com>
Subject: Re: [bmcweb] Device Level Logging Services
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000ba9e0005c3448de7"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ba9e0005c3448de7
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 3:13 PM Bills, Jason M <
jason.m.bills@linux.intel.com> wrote:

> On 5/26/2021 1:50 PM, Willy Tu wrote:
> > Hi all,
> >
> > Main discussion:
> >
> https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/ (a
>
> > bit outdated)
> >
> > This will be a sub-thread about logging services that will be used to
> > support Drive (and could support others).
> >
> > For bmcweb, I am wondering if we can support custom logging services
> > other than the static ones that we have in
> >
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp
> .
> >

> I am thinking about supporting custom log service at a device level that
> > can be exported by different hardwares log entries that are more
> > specific. Then at each device resource can link  the Status.Condition to
> > the LogEntries.
> >
> > Initial Idea,
> >
> > For example, I want to have log entries for Drive devices.
> >
> > ComputerSystemId could still be system or bmc and the Redfish
> > endpoint will be something like.
> >
> > ```
> > /redfish/v1/Systems/system/LogServices/Drive0LogService/Entries
> > ```
> Specifically regarding the endpoint, we have considered a similar
> approach for publishing a LogService for a memory device.  I don't know
> if we have finalized our proposal to the DMTF yet, but we were thinking
> it would be better to add a LogService to the individual resource rather
> than keep everything under Systems/system.
>
> If the same idea is applied for your drive devices, each drive resource
> in Redfish would also contain its own LogService.


I was thinking of adding this without new Redfish changes. What changes are
you suggesting for Redfish?

The Drive0LogService -> {LogServiceId} can be different for each device
resource. Is this what you were thinking?
I think we have to keep it under one System and System/system is already
used for pretty much all paths under System.

Yeah, I was thinking of the same idea. Each drive resource will have its
own LogService.

I was thinking about having the new log service as an EntryType of OEM.

Maybe need to add a new property in
https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml
for OemRecordFormat.


>
>
>
> > On the D-bus side, the service exporting the log can add log entry
> > <
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml
> > under.
> >
> > We can have
> > ```
> > /xyz/openbmc_project/logging/device/drive_0
> > |__/xyz/openbmc_project/logging/device/drive_0/entry/...
> > ```
> >
> > We can parse the `xyz.openbmc_project.ObjectMapper` at
> > `/xyz/openbmc_project/logging/device` with depth of 1 to get all the new
> > device log services and so on.
> >
> > Please let me know if there are any questions about it. If no one is
> > against it, I'll work on implementing it.
> >
> > Best,
> >
> > Willy Tu
> >
> >
> >
> >
> > Best,
> >> Willy Tu
>

Willy Tu

--000000000000ba9e0005c3448de7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 26, 2021 at 3:13 PM Bills, Ja=
son M &lt;<a href=3D"mailto:jason.m.bills@linux.intel.com">jason.m.bills@li=
nux.intel.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
On 5/26/2021 1:50 PM, Willy Tu wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; Main discussion: <br>
&gt; <a href=3D"https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rH=
KZRFoEJgUuZUmMj6uZb584JQ@mail.gmail.com/" rel=3D"noreferrer" target=3D"_bla=
nk">https://lore.kernel.org/openbmc/CAHwn2XknKWyv6Bsq48tkvA52rHKZRFoEJgUuZU=
mMj6uZb584JQ@mail.gmail.com/</a>=C2=A0(a <br>
&gt; bit outdated)<br>
&gt; <br>
&gt; This will be a sub-thread about logging services that=C2=A0will be use=
d to <br>
&gt; support Drive (and could support others).<br>
&gt; <br>
&gt; For bmcweb, I am wondering if we can support custom logging services <=
br>
&gt; other than the=C2=A0static ones that we have in <br>
&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/redfish-core/=
lib/log_services.hpp" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/bmcweb/blob/master/redfish-core/lib/log_services.hpp</a>.<br>
&gt;=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; I am thinking about supporting custom log=C2=A0service at a device lev=
el that <br>
&gt; can be exported by different hardwares log=C2=A0entries that are more =
<br>
&gt; specific. Then at each device resource can link=C2=A0 the Status.Condi=
tion to <br>
&gt; the=C2=A0LogEntries.<br>
&gt; <br>
&gt; Initial Idea,<br>
&gt; <br>
&gt; For=C2=A0example, I want to have log entries for Drive devices.<br>
&gt; <br>
&gt; ComputerSystemId could still be system or bmc and the Redfish <br>
&gt; endpoint=C2=A0will be something like.<br>
&gt; <br>
&gt; ```<br>
&gt; /redfish/v1/Systems/system/LogServices/Drive0LogService/Entries<br>
&gt; ```<br>
Specifically regarding the endpoint, we have considered a similar <br>
approach for publishing a LogService for a memory device.=C2=A0 I don&#39;t=
 know <br>
if we have finalized our proposal to the DMTF yet, but we were thinking <br=
>
it would be better to add a LogService to the individual resource rather <b=
r>
than keep everything under Systems/system.<br>
<br>
If the same idea is applied for your drive devices, each drive resource <br=
>
in Redfish would also contain its own LogService.</blockquote><div><br></di=
v><div>I was thinking of adding this without new Redfish changes. What chan=
ges are you suggesting for Redfish?</div><div><br></div><div>The=C2=A0Drive=
0LogService -&gt; {LogServiceId} can be different for each device resource.=
 Is this what you were thinking?</div><div>I think we have to keep it under=
 one System and System/system is already used for pretty much all paths und=
er System.</div><div><br></div><div>Yeah, I was thinking of the same idea. =
Each drive resource will=C2=A0have its own=C2=A0LogService.</div><div><br><=
/div><div>I was thinking about having the new log service as an EntryType o=
f OEM.=C2=A0</div><div><br></div><div>Maybe need to add a new property in=
=C2=A0</div><div><a href=3D"https://github.com/openbmc/phosphor-dbus-interf=
aces/blob/master/xyz/openbmc_project/Logging/Entry.interface.yaml">https://=
github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openbmc_project=
/Logging/Entry.interface.yaml</a></div><div>for OemRecordFormat.<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0<br=
></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; On the D-bus side, the service exporting the log can add log entry <br=
>
&gt; &lt;<a href=3D"https://github.com/openbmc/phosphor-dbus-interfaces/blo=
b/master/xyz/openbmc_project/Logging/Entry.interface.yaml" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-interfaces/bl=
ob/master/xyz/openbmc_project/Logging/Entry.interface.yaml</a>&gt;=C2=A0und=
er.<br>
&gt; <br>
&gt; We can have<br>
&gt; ```<br>
&gt; /xyz/openbmc_project/logging/device/drive_0<br>
&gt; |__/xyz/openbmc_project/logging/device/drive_0/entry/...<br>
&gt; ```<br>
&gt; <br>
&gt; We can parse the `xyz.openbmc_project.ObjectMapper` at <br>
&gt; `/xyz/openbmc_project/logging/device` with depth of 1 to get all the n=
ew <br>
&gt; device log services and so on.<br>
&gt; <br>
&gt; Please let me know if there are any questions about it. If no one is <=
br>
&gt; against it, I&#39;ll work on implementing it.<br>
&gt; <br>
&gt; Best,<br>
&gt; <br>
&gt; Willy Tu<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Best,<br>
&gt;&gt; Willy Tu<br></blockquote><div><br></div><div>Willy Tu=C2=A0</div><=
/div></div>

--000000000000ba9e0005c3448de7--
