Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A88F25839C
	for <lists+openbmc@lfdr.de>; Mon, 31 Aug 2020 23:33:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgNjw4z0xzDqN9
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 07:33:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=FXlyNp/s; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgNj93vvRzDqJS
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 07:32:59 +1000 (AEST)
Received: by mail-oi1-x230.google.com with SMTP id d189so2275003oig.12
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 14:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QJ207ezI1hYox/7x8ue/6IMozUxpP6Wl3TCwxgxgNGk=;
 b=FXlyNp/ssVeZ8CgjwJ1ztXUUvl/SawpAvsiqegyS0IGDYDaTAA3vEJTJjn+xuluU0w
 I2ur+AIL0oLXENLgp4EODIkoBageAAtuSQFUyOAlJwfCmpxM+d6drxhjRPNl8SEESNL0
 mHKEMTXl//iRAHFhD3ybClO5vLSaYhGMOnc5fMf03p1Pxfoevu9t2DxpeH81wfCWMmAp
 hRmFqenDTszPYnV34FqvxxYvBXFgmlAKIyE9rGUkl2K7vY/aONfoXT2mugJYTrFUlfrO
 XFY2h8B79Wb0O9QcrkxPXPXvTND7LrMjA+y6puPOy74RWGFNjpwjS3WQZp7sVAV5vSJj
 sicg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QJ207ezI1hYox/7x8ue/6IMozUxpP6Wl3TCwxgxgNGk=;
 b=SJv2C2oZYllgeyVUZRotyASklm4+Npr6go6jWyRVS5Ercnfa+Em/dS06V9H3Np3V5T
 sCv1hBucXJufwOIopGZA2eSsZxBFP7z3rjiVOJQJhwB/tQ485CJlSl2SBhuKXdgVy9pB
 SSgKEp8JEFkegcIFFuLZBy4n6MF4ARc1tGyvFbuBv8gzgz/Fiz5V32fvimI7CfQDpw1X
 iDRXnT5mI1TeGJZgACT4JC4lezyLwgBuShNd5iGLxFdyOEk+ZjxuYIqH6yjT0GxB98pc
 0Dgxy0CweIg8tSe9aiRDs+mTdEWZrNLo8N4K012lXaEY3MJu06Q82YEIMP+3XjmgQPMi
 ln0w==
X-Gm-Message-State: AOAM530HB2876TNWatNj/r0AjEVIydNxqJ2C1EhWFdQsi6NqJVT4X/ol
 xMk+xrMTx9yv7q50UZDJe4ajjTUaPcuGl1oXj1ugYg==
X-Google-Smtp-Source: ABdhPJw8+lag9wJFtEmeH36+590YKB8f6jhj/mEtGYyA3Hrx+N2vvtqnJrm0egtqOxQd5vgziwcuWROxIH+7MDWQkDg=
X-Received: by 2002:aca:abc2:: with SMTP id u185mr841618oie.62.1598909575352; 
 Mon, 31 Aug 2020 14:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
In-Reply-To: <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 31 Aug 2020 14:32:44 -0700
Message-ID: <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000044ac6b05ae332590"
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
Cc: Peter Lundgren <peterlundgren@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jason Ling <jasonling@google.com>,
 Ed Tanous <ed@tanous.net>, Josh Lehan <krellan@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000044ac6b05ae332590
Content-Type: text/plain; charset="UTF-8"

Hi James,

I think BiosPist power state might not suffice, because the host needs to
load firmware onto the device in order to enable the sensors at a certain
stage in the OS boot, which is very close to boot completion.

However, we can tolerate the fan being noisy before boot completion, and I
believe the root cause the issue is the HwmonTempSensor freezes once the
control flow hitting boost::asio::async_read_until (
https://github.com/openbmc/dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92).
Do you know if this function has something special to do with a file that
can have errno EAGAIN? Based on that, replacing the errno in the driver
with sth other than EAGAIN also seems to be a viable fix.

Thanks!

- Alex Qiu



- Alex Qiu


On Fri, Aug 28, 2020 at 10:54 AM James Feist <james.feist@linux.intel.com>
wrote:

> On 8/28/2020 9:43 AM, Alex Qiu wrote:
> > Hi James,
> >
> > Thx for the reply! So right now, one thing is that the sensor is not
> > dependent on the power state of the host solely, but also dependent on
> > the boot progress of the host.
>
> Would the BiosPost power state not suffice?
>
> > And the more serious issue is that
> > returning EAGAIN from the driver freezes the sensor, which is what I'm
> > debugging right now. Do we have special treatment on errno returned by
> > the driver? Thx.
>
> I ran into a similar issue with the CPUSensor and this was my fix:
>
> https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0
>
> I haven't hit this issue with hwmon sensor though.
>
> >
> > - Alex Qiu
> >
> >
> > On Fri, Aug 28, 2020 at 9:38 AM James Feist <james.feist@linux.intel.com
> > <mailto:james.feist@linux.intel.com>> wrote:
> >
> >     On 8/27/2020 2:49 PM, Alex Qiu wrote:
> >      > Hi James,
> >      >
> >      > After some debugging, I realized that the code I pointed out
> earlier
> >      > wasn't the root cause. Update is that, the HwmonTempSensor stops
> >      > updating after the hwmon driver returns EAGAIN as errno. I'll keep
> >      > debugging...
> >      >
> >      > - Alex Qiu
> >      >
> >      >
> >      > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
> >     <mailto:xqiu@google.com>
> >      > <mailto:xqiu@google.com <mailto:xqiu@google.com>>> wrote:
> >      >
> >      >     Hi James and OpenBMC community,
> >      >
> >      >     We have a sensor for HwmonTempSensor which doesn't have a
> valid
> >      >     reading until the host is fully booted. Before it's becoming
> >     alive
> >      >     and useful, it's getting disabled in code
> >      >
> >       (
> https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266
> )
> >      >     because of errors thrown up by the hwmon driver. Ideally, the
> >      >     thermal control loop should kick the fan to fail safe mode
> >     until no
> >      >     more errors are observed.
> >      >
> >      >     Any suggestions on how we should handle this kind of sensor
> >     properly?
> >
> >     For what its worth we use the PowerState property that has options of
> >     power on or BiosPost to disable scanning when the state is invalid:
> >
> https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
> >
> >
> >      >
> >      >     Thank you!
> >      >
> >      >     - Alex Qiu
> >      >
> >
>

--00000000000044ac6b05ae332590
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>I think BiosPist power state =
might not suffice, because the host needs to load firmware onto the device =
in order to enable the sensors at a certain stage in the OS boot, which is =
very close to boot completion.</div><div><br></div><div>However, we can tol=
erate the fan being noisy before boot completion, and I believe the root ca=
use the issue is the HwmonTempSensor freezes once the control flow hitting =
boost::asio::async_read_until (<a href=3D"https://github.com/openbmc/dbus-s=
ensors/blob/master/src/HwmonTempSensor.cpp#L92">https://github.com/openbmc/=
dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92</a>). Do you know if t=
his function has something special to do with a file that can have errno EA=
GAIN? Based=C2=A0on that, replacing the errno in the driver with sth other =
than EAGAIN also seems to be a viable fix.</div><div><br></div><div>Thanks!=
</div><div><br>- Alex Qiu<br><br></div></div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><br></div>- Alex =
Qiu</div></div></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Aug 28, 2020 at 10:54 AM James Feist &lt;<a href=
=3D"mailto:james.feist@linux.intel.com">james.feist@linux.intel.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 8/28/=
2020 9:43 AM, Alex Qiu wrote:<br>
&gt; Hi James,<br>
&gt; <br>
&gt; Thx for the reply! So right=C2=A0now, one thing is that the sensor is =
not <br>
&gt; dependent on the power state of the host solely, but also dependent on=
 <br>
&gt; the boot progress of the host.<br>
<br>
Would the BiosPost power state not suffice?<br>
<br>
&gt; And the more serious issue is that <br>
&gt; returning EAGAIN from the driver freezes the sensor, which is what I&#=
39;m <br>
&gt; debugging right now. Do we have special treatment on errno returned by=
 <br>
&gt; the driver? Thx.<br>
<br>
I ran into a similar issue with the CPUSensor and this was my fix:<br>
<a href=3D"https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798=
d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0" rel=3D"noref=
errer" target=3D"_blank">https://github.com/openbmc/dbus-sensors/commit/c22=
b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0=
</a><br>
<br>
I haven&#39;t hit this issue with hwmon sensor though.<br>
<br>
&gt; <br>
&gt; - Alex Qiu<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 28, 2020 at 9:38 AM James Feist &lt;<a href=3D"mailto:jame=
s.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com</a> =
<br>
&gt; &lt;mailto:<a href=3D"mailto:james.feist@linux.intel.com" target=3D"_b=
lank">james.feist@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 8/27/2020 2:49 PM, Alex Qiu wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi James,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; After some debugging, I realized that the cod=
e I pointed out earlier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; wasn&#39;t the root cause. Update is that, th=
e HwmonTempSensor stops<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; updating after the hwmon driver returns EAGAI=
N as errno. I&#39;ll keep<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; debugging...<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Alex Qiu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu &lt;=
<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@google.com</a><br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:xqiu@google.com" targe=
t=3D"_blank">xqiu@google.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:xqiu@google.com"=
 target=3D"_blank">xqiu@google.com</a> &lt;mailto:<a href=3D"mailto:xqiu@go=
ogle.com" target=3D"_blank">xqiu@google.com</a>&gt;&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Hi James and OpenBMC commu=
nity,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0We have a sensor for Hwmon=
TempSensor which doesn&#39;t have a valid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0reading until the host is =
fully booted. Before it&#39;s becoming<br>
&gt;=C2=A0 =C2=A0 =C2=A0alive<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0and useful, it&#39;s getti=
ng disabled in code<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(<a href=3D"https://github.com/openbmc/dbus-=
sensors/blob/master/include/sensor.hpp#L266" rel=3D"noreferrer" target=3D"_=
blank">https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.h=
pp#L266</a>)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0because of errors thrown u=
p by the hwmon driver. Ideally, the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0thermal control loop shoul=
d kick the fan to fail safe mode<br>
&gt;=C2=A0 =C2=A0 =C2=A0until no<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0more=C2=A0errors are obser=
ved.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Any suggestions on how we =
should handle this kind of sensor<br>
&gt;=C2=A0 =C2=A0 =C2=A0properly?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0For what its worth we use the PowerState property t=
hat has options of<br>
&gt;=C2=A0 =C2=A0 =C2=A0power on or BiosPost to disable scanning when the s=
tate is invalid:<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/dbus-sensors/=
blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/dbus-sensors=
/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208</=
a><br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Thank you!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0- Alex Qiu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt; <br>
</blockquote></div>

--00000000000044ac6b05ae332590--
