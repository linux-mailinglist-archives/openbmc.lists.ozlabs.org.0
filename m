Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72F23F1D0
	for <lists+openbmc@lfdr.de>; Fri,  7 Aug 2020 19:19:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNXC53MzQzDqhY
	for <lists+openbmc@lfdr.de>; Sat,  8 Aug 2020 03:18:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vsb5e3b5; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXBK4J13zDqHj
 for <openbmc@lists.ozlabs.org>; Sat,  8 Aug 2020 03:18:16 +1000 (AEST)
Received: by mail-ot1-x330.google.com with SMTP id t7so2175829otp.0
 for <openbmc@lists.ozlabs.org>; Fri, 07 Aug 2020 10:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9B7gfMtjx21JRiDv0CXvxfueiv9zs84z+T/6+kan0lo=;
 b=vsb5e3b5i9hyw5nNLo0oBIA+jCmMdPUTdVTYMEIZjnCAvxgExyAKLeh0GDrm7QHZi6
 Z2FDSM5BdxOknnNcXQ4m91LW+N0BdFIFfTc1XVU8K9IGic33/yLke3I2ey4g3gNgh4rJ
 DxbBosYYobkfHpPupY2EvhD6AVXJ6e4w+CcDAhh81Eu2waGSTlNGBXJxoy5/pPH1FpRK
 THujFO1slGe5kE1c+zGvhS5hPq361zy4r+k/F9U7UdCdW5r40TmHiWqGRxKHsZmTe7dl
 MH+rx+4JnXIkLYvP5wDodYNjmxU+DVQ/bI/oxVpex3DmFe11+QYroNv+rLQO3admlxXi
 yu4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9B7gfMtjx21JRiDv0CXvxfueiv9zs84z+T/6+kan0lo=;
 b=bb1McF0m7TlSPkqNiy5I+ORfODTa4HCja3L2BRwbUTC79nr6vRcTd11w4giGWmjQDd
 YUELlzjjBFTG1qdI0oeVIFqE7wNRkRNyJNsVJWVxphZX3QcVwwdiJ0vZkpDLAxp9d+o/
 fF7qlwDdB7+renGwrpFuyTCdwHfPr8evgrugENZxmatwypFQn4RbBTSsHXPlecftVxST
 0W73mY+dsm1YTdKd6Jvxvo1M+moytfApBp+IjYlpgLTsoxIrVDphNWHf8L8ZoCE54ddu
 eIMqudmkWaIbzQ9bnxuShZYUeJFAvidOgMWEyzsC2/dN1eKntCN7d0CY9K7bpeRxKsWg
 yiGg==
X-Gm-Message-State: AOAM533LENHGryekaYeDBs3Z9StMv/4iqUbB6yd7MyzPAMmif6oY0jJl
 6Ns1eN24Po7fCEIb73ngw3kT2V6R5A/O8JkLIwdXVw==
X-Google-Smtp-Source: ABdhPJweADpfcoPYVc22kuMk4ME0bPi2H1JbLUMR5RRwfCC8lvfeAEDvRbuibVu1ZDMCrStzWIO3XMSTptm/d+/LjuA=
X-Received: by 2002:a05:6830:4dc:: with SMTP id
 s28mr12200552otd.237.1596820692303; 
 Fri, 07 Aug 2020 10:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcUoAB_nmsaCh2-vAEAjE7Fuu3MNydHLUwBS7zkt7pcPkw@mail.gmail.com>
 <f1b0300f-06ac-c350-8fcc-24eae806cdb2@linux.intel.com>
 <CAHBbfcUXLueZ3MZAP9b38B-fXyrNCMAeZcC7uk8uPrR5gw=3xQ@mail.gmail.com>
 <2bb88ede-4d35-8b9c-936f-be8dc9a453e5@linux.intel.com>
 <CAHBbfcUDMOZjxSvy8wVW_F9f3+NaX-WU3G5PF1oUoRx5VP7ZoQ@mail.gmail.com>
 <CACWQX82KAhmRbg-CYa8+Yjd8mE7qCM_vG_Q1_hYZVR77c3gdtw@mail.gmail.com>
 <CAHBbfcUJGnsW_dxONwjsT=w3ZM453-o0Ubc7DE7oOJQ8u28=ww@mail.gmail.com>
 <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
In-Reply-To: <5a59238b-7653-b11f-701b-039d57dd5b98@linux.intel.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 7 Aug 2020 10:17:36 -0700
Message-ID: <CAHBbfcXRO5ZB3S0T6SyRkWkLLAruKPdS8UhUkyG3qssU5YkHNw@mail.gmail.com>
Subject: Re: dbus-sensors:hwmontemp: additional attribute proposal
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="000000000000230e5d05ac4ccaee"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000230e5d05ac4ccaee
Content-Type: text/plain; charset="UTF-8"

>
>  feel like this approach already isn't optimal as in reality most
> systems aren't going to have half of those sensors, and you're then
> creating useless matches for things that don't matter to your platform.
>
I'm assuming that you're referring to the general approach of PSUSensors
and not referring to extending the list using a config file?
If so then I agree.
I'm also a bit confused about scanning every hwmon attribute on the system
and seeing if has a name that is in the permit list..then seeing if it has
an appropriate configuration. Why not just grab the configuration and using
that information navigate to the appropriate hwmon path and take what is
there? (Why even bother with validating the driver name?) . Any context
would be helpful; I'm trying to grok the design.

> Maybe something like allowing a device to be exported with a different
> keyword other then 'type' in Entity Manager would allow us to just use
> one PSUSensor config type, then your export could be hidden in your EM
> config?

Sure, or maybe a catchall type for something PSUSensor can consume (and
bypass the name check?)


On Fri, Aug 7, 2020 at 10:06 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/7/2020 9:54 AM, Jason Ling wrote:
> >> What about making the device/type lists in PSUSensors extendable using
> JSON?
> >
> >     Say more about what you're wanting to do here.....
> >
> >   Take
> >
> https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L43 and
>
> >
> https://github.com/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59 and
>
> > make it so those can be extended using (for example) without an upstream
> > code change. I picked JSON as the easiest example.
> > IIRC PSUSensors does validity checks to make sure that the device emits
> > a name in its 'permit list' (hwmontempsensor is less picky) so tricking
> > PSUSensors into gathering telemetry for a non-public device is tricky.
>
> I feel like this approach already isn't optimal as in reality most
> systems aren't going to have half of those sensors, and you're then
> creating useless matches for things that don't matter to your platform.
> Maybe something like allowing a device to be exported with a different
> keyword other then 'type' in Entity Manager would allow us to just use
> one PSUSensor config type, then your export could be hidden in your EM
> config?
>
>
> >
> >     Can you give an
> >     example of what you would use it for?
> >
> > Sure, the primary use case would be
> > It's a non public device. Would rather not broadcast information about
> > it or have to obfuscate the device name. Really would rather not
> > maintain patches until the device is made public.
> >
> >
> >
> > On Fri, Aug 7, 2020 at 9:39 AM Ed Tanous <ed@tanous.net
> > <mailto:ed@tanous.net>> wrote:
> >
> >     On Fri, Aug 7, 2020 at 9:36 AM Jason Ling <jasonling@google.com
> >     <mailto:jasonling@google.com>> wrote:
> >      >
> >      > Slightly different topic:
> >      > What about making the device/type lists in PSUSensors extendable
> >     using JSON?
> >      >
> >
> >     Say more about what you're wanting to do here.....  Can you give an
> >     example of what you would use it for?
> >
>

--000000000000230e5d05ac4ccaee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0fe=
el like this approach already isn&#39;t optimal as in reality most<br>syste=
ms aren&#39;t going to have half of those sensors, and you&#39;re then<br>c=
reating useless matches for things that don&#39;t matter to your platform.<=
br></blockquote><div>I&#39;m assuming that you&#39;re referring to the gene=
ral approach of PSUSensors and not referring to extending the list using a =
config file?<br>If so then I agree.<br>I&#39;m also a bit confused about sc=
anning every hwmon attribute on the system and seeing if has a name that is=
 in the permit list..then seeing if it has an appropriate configuration. Wh=
y not just grab the configuration and using that information navigate to th=
e appropriate hwmon path and take what is there? (Why even bother with vali=
dating the driver name?) . Any context would be helpful; I&#39;m trying to =
grok the design.<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Maybe something like allowing a device to be exported with a different<br>=
keyword other then &#39;type&#39; in Entity Manager would allow us to just =
use<br>one PSUSensor config type, then your export could be hidden in your =
EM<br>config?</blockquote><div>Sure, or maybe a catchall type for something=
 PSUSensor can consume (and bypass the name check?)</div><div>=C2=A0</div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Fri, Aug 7, 2020 at 10:06 AM James Feist &lt;<a href=3D"mailto:james.feis=
t@linux.intel.com">james.feist@linux.intel.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On 8/7/2020 9:54 AM, Jason Li=
ng wrote:<br>
&gt;&gt; What about making the device/type lists in PSUSensors extendable u=
sing JSON?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Say more about what you&#39;re wanting to do here..=
... <br>
&gt; <br>
&gt;=C2=A0 =C2=A0Take <br>
&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/PSU=
SensorMain.cpp#L43" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L43</a>=C2=A0and <b=
r>
&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/PSU=
SensorMain.cpp#L59" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/openbmc/dbus-sensors/blob/master/src/PSUSensorMain.cpp#L59</a>=C2=A0and <b=
r>
&gt; make it so those can be extended using (for example) without an upstre=
am <br>
&gt; code change. I picked JSON as the easiest example.<br>
&gt; IIRC PSUSensors does validity checks to make sure that the device emit=
s <br>
&gt; a name in its &#39;permit list&#39; (hwmontempsensor is less picky) so=
 tricking <br>
&gt; PSUSensors into gathering telemetry for a non-public device is tricky.=
<br>
<br>
I feel like this approach already isn&#39;t optimal as in reality most <br>
systems aren&#39;t going to have half of those sensors, and you&#39;re then=
 <br>
creating useless matches for things that don&#39;t matter to your platform.=
 <br>
Maybe something like allowing a device to be exported with a different <br>
keyword other then &#39;type&#39; in Entity Manager would allow us to just =
use <br>
one PSUSensor config type, then your export could be hidden in your EM <br>
config?<br>
<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Can you give an<br>
&gt;=C2=A0 =C2=A0 =C2=A0example of what you would use it for?<br>
&gt; <br>
&gt; Sure, the primary use case would be<br>
&gt; It&#39;s a non public device. Would rather not broadcast information a=
bout <br>
&gt; it or have to obfuscate the device name. Really would rather not <br>
&gt; maintain patches until the device is made public.<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 7, 2020 at 9:39 AM Ed Tanous &lt;<a href=3D"mailto:ed@tano=
us.net" target=3D"_blank">ed@tanous.net</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:ed@tanous.net" target=3D"_blank">ed@tanou=
s.net</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, Aug 7, 2020 at 9:36 AM Jason Ling &lt;<a hr=
ef=3D"mailto:jasonling@google.com" target=3D"_blank">jasonling@google.com</=
a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jasonling@google.com" =
target=3D"_blank">jasonling@google.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Slightly different topic:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; What about making the device/type lists in PS=
USensors extendable<br>
&gt;=C2=A0 =C2=A0 =C2=A0using JSON?<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Say more about what you&#39;re wanting to do here..=
...=C2=A0 Can you give an<br>
&gt;=C2=A0 =C2=A0 =C2=A0example of what you would use it for?<br>
&gt; <br>
</blockquote></div>

--000000000000230e5d05ac4ccaee--
