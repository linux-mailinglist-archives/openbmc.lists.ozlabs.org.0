Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 254102583EB
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 00:09:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgPWg3s80zDqW9
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 08:09:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::336;
 helo=mail-ot1-x336.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=p8rOk8rP; dkim-atps=neutral
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgPVq5HVvzDqTY
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 08:09:05 +1000 (AEST)
Received: by mail-ot1-x336.google.com with SMTP id n23so6747053otq.11
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 15:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cfwtC8jt7MX8j77xqprqZeRO3yMIdE0rdRJ1uvjwIkA=;
 b=p8rOk8rPUieZuZh5XyikjGSIzc1ctPtiRq6iD12ZzwwADJbkHPP8jZbqk7LQq6P1it
 hUds8eBlt/WjBqTB4bz+E8IoF85zzyWAj0LF3k1zfXYOaMbNChHxxjLsOY9211EFJjaq
 Aa3O5NMwiOayw9dbuyNNR4UzvK5Uws3ahNKuD11M+58A5UUEdpp2uNBHCIQoziW5wNHd
 vhrWKaja8o+yyGTd5qvu5ksMJYLX+uh8lCYomX7dJBiUJpR537m6Uvaw0lvo/J0t3fE2
 kbLwZSxdWcFnJZIBgbQGo1n7IhEHokFeoOueSjAi5O71QVl+0ABORNXPujnmwl/Xa+xe
 Xrrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfwtC8jt7MX8j77xqprqZeRO3yMIdE0rdRJ1uvjwIkA=;
 b=rRW7ZhIcoOOURYI8eyKl8ckQjWBnJuyyhYjc7KX7CHa7zaWaIB1AAPZF61TGczHCPV
 9tVM0PGXxhAwM20IkdBaYfXozwSXh3usyEkh6K1jQGVFNf0CkccJo0CNhupvuPOTO1mz
 vRY9R5QPqvei+9dbI8giLOLTmrFyGeU//cCOq716S0d0gt0JAwpeA/gmPltMMb6eeUt3
 EQxUxUsGbymuKmDOxt5GPel9I8jhwTmxvne/18ar08YArLiH4bBCNdTHQo6in2cQ43oo
 2Weo9+O+j/UcrKUmGJq3N1O3KykNtMJbNtpTw6IvVPGECJ3gjmzaGVsb6iS4e4khz30S
 9i3w==
X-Gm-Message-State: AOAM530GokX6Zn4GWA53/t+1WysmmRohMl0p+kygliBPINL3jzbWAG2i
 YWMPVub0Lq6smwHf7ZqGAsLje2M0eBK9/k89NRjtWg==
X-Google-Smtp-Source: ABdhPJzXZ3pZJ9B2yck4Y/WHX9gQN8xmBxU1bjatBbX8S4K2qZxck5eXq2//IUvCyX0N+kNmpCtMMDyYGM9fqmaAjo4=
X-Received: by 2002:a9d:7f06:: with SMTP id j6mr2297517otq.274.1598911741819; 
 Mon, 31 Aug 2020 15:09:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
In-Reply-To: <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 31 Aug 2020 15:08:50 -0700
Message-ID: <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: James Feist <james.feist@linux.intel.com>,
 Guenter Roeck <groeck@google.com>
Content-Type: multipart/alternative; boundary="00000000000066646905ae33a631"
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
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Josh Lehan <krellan@google.com>, Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000066646905ae33a631
Content-Type: text/plain; charset="UTF-8"

Hi James,

I just came through this doc (
https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
Looks like that it's a terrible idea for hwmon driver to return EAGAIN for
dbus-sensors. With that, I think the proper fix is also to use other errno
instead in our driver, and this caveat should be probably documented
somewhere.

Hi Guenter,

Is it reasonable for hwmon drivers to return EAGAIN? Is it something that
has special meaning and should be avoided in hwmon drivers?

Thank you!

- Alex Qiu


On Mon, Aug 31, 2020 at 2:32 PM Alex Qiu <xqiu@google.com> wrote:

> Hi James,
>
> I think BiosPist power state might not suffice, because the host needs to
> load firmware onto the device in order to enable the sensors at a certain
> stage in the OS boot, which is very close to boot completion.
>
> However, we can tolerate the fan being noisy before boot completion, and I
> believe the root cause the issue is the HwmonTempSensor freezes once the
> control flow hitting boost::asio::async_read_until (
> https://github.com/openbmc/dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92).
> Do you know if this function has something special to do with a file that
> can have errno EAGAIN? Based on that, replacing the errno in the driver
> with sth other than EAGAIN also seems to be a viable fix.
>
> Thanks!
>
> - Alex Qiu
>
>
>
> - Alex Qiu
>
>
> On Fri, Aug 28, 2020 at 10:54 AM James Feist <james.feist@linux.intel.com>
> wrote:
>
>> On 8/28/2020 9:43 AM, Alex Qiu wrote:
>> > Hi James,
>> >
>> > Thx for the reply! So right now, one thing is that the sensor is not
>> > dependent on the power state of the host solely, but also dependent on
>> > the boot progress of the host.
>>
>> Would the BiosPost power state not suffice?
>>
>> > And the more serious issue is that
>> > returning EAGAIN from the driver freezes the sensor, which is what I'm
>> > debugging right now. Do we have special treatment on errno returned by
>> > the driver? Thx.
>>
>> I ran into a similar issue with the CPUSensor and this was my fix:
>>
>> https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0
>>
>> I haven't hit this issue with hwmon sensor though.
>>
>> >
>> > - Alex Qiu
>> >
>> >
>> > On Fri, Aug 28, 2020 at 9:38 AM James Feist <
>> james.feist@linux.intel.com
>> > <mailto:james.feist@linux.intel.com>> wrote:
>> >
>> >     On 8/27/2020 2:49 PM, Alex Qiu wrote:
>> >      > Hi James,
>> >      >
>> >      > After some debugging, I realized that the code I pointed out
>> earlier
>> >      > wasn't the root cause. Update is that, the HwmonTempSensor stops
>> >      > updating after the hwmon driver returns EAGAIN as errno. I'll
>> keep
>> >      > debugging...
>> >      >
>> >      > - Alex Qiu
>> >      >
>> >      >
>> >      > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
>> >     <mailto:xqiu@google.com>
>> >      > <mailto:xqiu@google.com <mailto:xqiu@google.com>>> wrote:
>> >      >
>> >      >     Hi James and OpenBMC community,
>> >      >
>> >      >     We have a sensor for HwmonTempSensor which doesn't have a
>> valid
>> >      >     reading until the host is fully booted. Before it's becoming
>> >     alive
>> >      >     and useful, it's getting disabled in code
>> >      >
>> >       (
>> https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266
>> )
>> >      >     because of errors thrown up by the hwmon driver. Ideally, the
>> >      >     thermal control loop should kick the fan to fail safe mode
>> >     until no
>> >      >     more errors are observed.
>> >      >
>> >      >     Any suggestions on how we should handle this kind of sensor
>> >     properly?
>> >
>> >     For what its worth we use the PowerState property that has options
>> of
>> >     power on or BiosPost to disable scanning when the state is invalid:
>> >
>> https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
>> >
>> >
>> >      >
>> >      >     Thank you!
>> >      >
>> >      >     - Alex Qiu
>> >      >
>> >
>>
>

--00000000000066646905ae33a631
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi James,<div><br></div><div>I just came through this doc =
(<a href=3D"https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overv=
iew/posix/stream_descriptor.html">https://www.boost.org/doc/libs/1_74_0/doc=
/html/boost_asio/overview/posix/stream_descriptor.html</a>). Looks like tha=
t it&#39;s a terrible idea for hwmon driver to return EAGAIN for dbus-senso=
rs. With that, I think the proper fix is also to use other errno instead in=
 our driver, and this=C2=A0caveat should be probably documented somewhere.<=
/div><div><br></div><div>Hi Guenter,</div><div><br></div><div>Is it reasona=
ble for hwmon drivers to return EAGAIN? Is it something that has special me=
aning and should be avoided in hwmon drivers?</div><div><br></div><div>Than=
k you!<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div>- Alex Qiu<=
/div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Aug 31, 2020 at 2:32 PM Alex Qiu &lt;<a =
href=3D"mailto:xqiu@google.com">xqiu@google.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi James,<d=
iv><br></div><div>I think BiosPist power state might not suffice, because t=
he host needs to load firmware onto the device in order to enable the senso=
rs at a certain stage in the OS boot, which is very close to boot completio=
n.</div><div><br></div><div>However, we can tolerate the fan being noisy be=
fore boot completion, and I believe the root cause the issue is the HwmonTe=
mpSensor freezes once the control flow hitting boost::asio::async_read_unti=
l (<a href=3D"https://github.com/openbmc/dbus-sensors/blob/master/src/Hwmon=
TempSensor.cpp#L92" target=3D"_blank">https://github.com/openbmc/dbus-senso=
rs/blob/master/src/HwmonTempSensor.cpp#L92</a>). Do you know if this functi=
on has something special to do with a file that can have errno EAGAIN? Base=
d=C2=A0on that, replacing the errno in the driver with sth other than EAGAI=
N also seems to be a viable fix.</div><div><br></div><div>Thanks!</div><div=
><br>- Alex Qiu<br><br></div></div><br clear=3D"all"><div><div dir=3D"ltr">=
<div dir=3D"ltr"><div><br></div>- Alex Qiu</div></div></div><br><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 28, 2=
020 at 10:54 AM James Feist &lt;<a href=3D"mailto:james.feist@linux.intel.c=
om" target=3D"_blank">james.feist@linux.intel.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On 8/28/2020 9:43 AM, Alex=
 Qiu wrote:<br>
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
</blockquote></div>

--00000000000066646905ae33a631--
