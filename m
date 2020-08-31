Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B62BE258499
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 01:59:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgRxf47pFzDqW6
	for <lists+openbmc@lfdr.de>; Tue,  1 Sep 2020 09:59:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Yk2uaCPi; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgRwv4dyYzDqRG
 for <openbmc@lists.ozlabs.org>; Tue,  1 Sep 2020 09:58:21 +1000 (AEST)
Received: by mail-ot1-x32e.google.com with SMTP id k20so6991775otr.1
 for <openbmc@lists.ozlabs.org>; Mon, 31 Aug 2020 16:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zWeALq85D+Th52H5L2FN41cYOqExy6JWTv+2Xh37164=;
 b=Yk2uaCPiRwcoWcYReMlhHAXcbrkfiFxgGrypN0+4M0Gu0Y3zFN7KWNCIlyMgU8a011
 vX1cK9D4gy1tVF5H3k8PQjWnC7XVPkWd+bsCU3BzVgphpjUrJvKnXBHg1M58sEIpojeO
 LL69e5zFLKt8U0kX89CMzOoxkTciWqXpmvpaYQP8RFZRDzdSifBQdaOmM2iL0yM/zcfW
 xjQI+DVIX+mzd2x5pFgFOO38/jrlqztkMK1hSiksRhmMQX22bWQu17d8iqi5W53d+vIg
 XH0nO20xCLyyXu1U5wt+fhsp7sBQfRykwVVIGbqIBh447uWA4gQ7VgG9kfNFQA0K6a3P
 oqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zWeALq85D+Th52H5L2FN41cYOqExy6JWTv+2Xh37164=;
 b=uLw6dVVkbE91N0xheYuLzhgLZeeS6dHKnWmbYHVr1n9G8nRwAh0ivBFoATu/1MkfzQ
 JKlQJqxKvO/mnuohY1VHxYoifFlkQ8Rj5rjiwxS3r/RSmCBgrDvvky5N0bV186zZnse/
 Z21dpd5W/r7MKOPvmF9luNu506n/sgoihkkQFUTtjzwkrKYOGNojuE/ml3+NbaKUvRRV
 enapZByxPzeYJ4TRTBjAqtafRAeCIsiPnsoEhHRBjFIQSKfeHTGnIJKo4yBFMYfXJyy4
 sDLCGj091zIODSEl3IeGTcyCD+s2jQkz9tW55d89z7eBqpRrEy7mnxQeHumVJyi834gv
 Ohbg==
X-Gm-Message-State: AOAM531NMZ4QG538KdnoG9s6c6W7U6bqOwEZ7jz4VuGnYaHT5aQ2UNJD
 HjO+eUfZ/i/a3CZcf3KbceG4G1wtRPRUqBw5vYa8hQ==
X-Google-Smtp-Source: ABdhPJxR9+tYNAHldaIaH8wXJ572TR56OdmYIgmvobN2AD+Y8O8buMFh8SnIot6WlCad+25O6W0s8YJ03/rR50GJBIU=
X-Received: by 2002:a05:6830:30a1:: with SMTP id
 g1mr2528660ots.302.1598918299494; 
 Mon, 31 Aug 2020 16:58:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAA_a9xLk5JhUjEkiWka6LSXJ1gD-BcH0PqgENqroisDKEUyztA@mail.gmail.com>
 <CAA_a9xJ54rpnKm0y+hrEG2YjuFzzhqKBEJbStsu4Q126APgbVg@mail.gmail.com>
 <9129e6cf-76a8-deea-7e8c-1ac17cf45b4b@linux.intel.com>
 <CAA_a9x+A+OkbdTW_M4KT=6eV982Lg_0PoWaYvW47c0Aoh676-w@mail.gmail.com>
 <9679c401-28ce-3197-f871-2cccd2940885@linux.intel.com>
 <CAA_a9xLXDPP-4SodzEnnASupm7GTtB_My+6GbPrtR9A0S23KLg@mail.gmail.com>
 <CAA_a9x+dyj+K7Zr-3nPUoOp35WjVRjHDo7L0AJ2BSp6sV9M_bA@mail.gmail.com>
 <CABXOdTdZiUT23eU6fgFZ7DMh7LFEaWhKzXZF2hrFahj0m2vN=A@mail.gmail.com>
In-Reply-To: <CABXOdTdZiUT23eU6fgFZ7DMh7LFEaWhKzXZF2hrFahj0m2vN=A@mail.gmail.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 31 Aug 2020 16:58:08 -0700
Message-ID: <CAA_a9xLWYLyMVp0xCQdzC6wCwvJvDTsr1wV109tCLZVe=hSRGg@mail.gmail.com>
Subject: Re: Dealing with a sensor which doesn't have valid reading until host
 is powered up
To: Guenter Roeck <groeck@google.com>
Content-Type: multipart/alternative; boundary="0000000000004490b105ae352d6a"
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
 Josh Lehan <krellan@google.com>, James Feist <james.feist@linux.intel.com>,
 Jason Ling <jasonling@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004490b105ae352d6a
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

FYI, the boot_asio call freezes on EAGAIN, even the driver later recovers
to a normal state, which can be verified by reading the hwmon file directly.

I'm switching to ENODATA and ENOMSG. Thanks!

- Alex Qiu


On Mon, Aug 31, 2020 at 4:54 PM Guenter Roeck <groeck@google.com> wrote:

> On Mon, Aug 31, 2020 at 3:09 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > Hi James,
> >
> > I just came through this doc (
> https://www.boost.org/doc/libs/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html).
> Looks like that it's a terrible idea for hwmon driver to return EAGAIN for
> dbus-sensors. With that, I think the proper fix is also to use other errno
> instead in our driver, and this caveat should be probably documented
> somewhere.
> >
> > Hi Guenter,
> >
> > Is it reasonable for hwmon drivers to return EAGAIN? Is it something
> that has special meaning and should be avoided in hwmon drivers?
> >
>
> Not sure how to relate the link above with -EAGAIN, but ... -EAGAIN
> might trigger userspace to try again immediately, which would
> potentially be quite bad. We had seen that effect at a previous
> company, where it ended up overwhelming userspace. So I am not
> entirely in favor of it. How about -ENODATA ? that might make more
> sense unless the problem is known to be a short term glitch.
>
> Thanks,
> Guenter
>
> > Thank you!
> >
> > - Alex Qiu
> >
> >
> > On Mon, Aug 31, 2020 at 2:32 PM Alex Qiu <xqiu@google.com> wrote:
> >>
> >> Hi James,
> >>
> >> I think BiosPist power state might not suffice, because the host needs
> to load firmware onto the device in order to enable the sensors at a
> certain stage in the OS boot, which is very close to boot completion.
> >>
> >> However, we can tolerate the fan being noisy before boot completion,
> and I believe the root cause the issue is the HwmonTempSensor freezes once
> the control flow hitting boost::asio::async_read_until (
> https://github.com/openbmc/dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92).
> Do you know if this function has something special to do with a file that
> can have errno EAGAIN? Based on that, replacing the errno in the driver
> with sth other than EAGAIN also seems to be a viable fix.
> >>
> >> Thanks!
> >>
> >> - Alex Qiu
> >>
> >>
> >>
> >> - Alex Qiu
> >>
> >>
> >> On Fri, Aug 28, 2020 at 10:54 AM James Feist <
> james.feist@linux.intel.com> wrote:
> >>>
> >>> On 8/28/2020 9:43 AM, Alex Qiu wrote:
> >>> > Hi James,
> >>> >
> >>> > Thx for the reply! So right now, one thing is that the sensor is not
> >>> > dependent on the power state of the host solely, but also dependent
> on
> >>> > the boot progress of the host.
> >>>
> >>> Would the BiosPost power state not suffice?
> >>>
> >>> > And the more serious issue is that
> >>> > returning EAGAIN from the driver freezes the sensor, which is what
> I'm
> >>> > debugging right now. Do we have special treatment on errno returned
> by
> >>> > the driver? Thx.
> >>>
> >>> I ran into a similar issue with the CPUSensor and this was my fix:
> >>>
> https://github.com/openbmc/dbus-sensors/commit/c22b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0
> >>>
> >>> I haven't hit this issue with hwmon sensor though.
> >>>
> >>> >
> >>> > - Alex Qiu
> >>> >
> >>> >
> >>> > On Fri, Aug 28, 2020 at 9:38 AM James Feist <
> james.feist@linux.intel.com
> >>> > <mailto:james.feist@linux.intel.com>> wrote:
> >>> >
> >>> >     On 8/27/2020 2:49 PM, Alex Qiu wrote:
> >>> >      > Hi James,
> >>> >      >
> >>> >      > After some debugging, I realized that the code I pointed out
> earlier
> >>> >      > wasn't the root cause. Update is that, the HwmonTempSensor
> stops
> >>> >      > updating after the hwmon driver returns EAGAIN as errno. I'll
> keep
> >>> >      > debugging...
> >>> >      >
> >>> >      > - Alex Qiu
> >>> >      >
> >>> >      >
> >>> >      > On Tue, Aug 25, 2020 at 5:49 PM Alex Qiu <xqiu@google.com
> >>> >     <mailto:xqiu@google.com>
> >>> >      > <mailto:xqiu@google.com <mailto:xqiu@google.com>>> wrote:
> >>> >      >
> >>> >      >     Hi James and OpenBMC community,
> >>> >      >
> >>> >      >     We have a sensor for HwmonTempSensor which doesn't have a
> valid
> >>> >      >     reading until the host is fully booted. Before it's
> becoming
> >>> >     alive
> >>> >      >     and useful, it's getting disabled in code
> >>> >      >
> >>> >       (
> https://github.com/openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266
> )
> >>> >      >     because of errors thrown up by the hwmon driver. Ideally,
> the
> >>> >      >     thermal control loop should kick the fan to fail safe mode
> >>> >     until no
> >>> >      >     more errors are observed.
> >>> >      >
> >>> >      >     Any suggestions on how we should handle this kind of
> sensor
> >>> >     properly?
> >>> >
> >>> >     For what its worth we use the PowerState property that has
> options of
> >>> >     power on or BiosPost to disable scanning when the state is
> invalid:
> >>> >
> https://github.com/openbmc/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMain.cpp#L208
> >>> >
> >>> >
> >>> >      >
> >>> >      >     Thank you!
> >>> >      >
> >>> >      >     - Alex Qiu
> >>> >      >
> >>> >
>

--0000000000004490b105ae352d6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Guenter,<div><br></div><div>FYI, the boot_asio call fre=
ezes on EAGAIN, even the driver later recovers to a normal state, which can=
 be verified by reading the hwmon file directly.</div><div><br></div><div>I=
&#39;m switching to ENODATA and ENOMSG. Thanks!<br clear=3D"all"><div><div =
dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><br></div>- Alex Qiu</div></div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon,=
 Aug 31, 2020 at 4:54 PM Guenter Roeck &lt;<a href=3D"mailto:groeck@google.=
com">groeck@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Mon, Aug 31, 2020 at 3:09 PM Alex Qiu &lt;<a href=
=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@google.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt; Hi James,<br>
&gt;<br>
&gt; I just came through this doc (<a href=3D"https://www.boost.org/doc/lib=
s/1_74_0/doc/html/boost_asio/overview/posix/stream_descriptor.html" rel=3D"=
noreferrer" target=3D"_blank">https://www.boost.org/doc/libs/1_74_0/doc/htm=
l/boost_asio/overview/posix/stream_descriptor.html</a>). Looks like that it=
&#39;s a terrible idea for hwmon driver to return EAGAIN for dbus-sensors. =
With that, I think the proper fix is also to use other errno instead in our=
 driver, and this caveat should be probably documented somewhere.<br>
&gt;<br>
&gt; Hi Guenter,<br>
&gt;<br>
&gt; Is it reasonable for hwmon drivers to return EAGAIN? Is it something t=
hat has special meaning and should be avoided in hwmon drivers?<br>
&gt;<br>
<br>
Not sure how to relate the link above with -EAGAIN, but ... -EAGAIN<br>
might trigger userspace to try again immediately, which would<br>
potentially be quite bad. We had seen that effect at a previous<br>
company, where it ended up overwhelming userspace. So I am not<br>
entirely in favor of it. How about -ENODATA ? that might make more<br>
sense unless the problem is known to be a short term glitch.<br>
<br>
Thanks,<br>
Guenter<br>
<br>
&gt; Thank you!<br>
&gt;<br>
&gt; - Alex Qiu<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Aug 31, 2020 at 2:32 PM Alex Qiu &lt;<a href=3D"mailto:xqiu@go=
ogle.com" target=3D"_blank">xqiu@google.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi James,<br>
&gt;&gt;<br>
&gt;&gt; I think BiosPist power state might not suffice, because the host n=
eeds to load firmware onto the device in order to enable the sensors at a c=
ertain stage in the OS boot, which is very close to boot completion.<br>
&gt;&gt;<br>
&gt;&gt; However, we can tolerate the fan being noisy before boot completio=
n, and I believe the root cause the issue is the HwmonTempSensor freezes on=
ce the control flow hitting boost::asio::async_read_until (<a href=3D"https=
://github.com/openbmc/dbus-sensors/blob/master/src/HwmonTempSensor.cpp#L92"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/dbus-senso=
rs/blob/master/src/HwmonTempSensor.cpp#L92</a>). Do you know if this functi=
on has something special to do with a file that can have errno EAGAIN? Base=
d on that, replacing the errno in the driver with sth other than EAGAIN als=
o seems to be a viable fix.<br>
&gt;&gt;<br>
&gt;&gt; Thanks!<br>
&gt;&gt;<br>
&gt;&gt; - Alex Qiu<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; - Alex Qiu<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Aug 28, 2020 at 10:54 AM James Feist &lt;<a href=3D"mailto=
:james.feist@linux.intel.com" target=3D"_blank">james.feist@linux.intel.com=
</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 8/28/2020 9:43 AM, Alex Qiu wrote:<br>
&gt;&gt;&gt; &gt; Hi James,<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; Thx for the reply! So right now, one thing is that the se=
nsor is not<br>
&gt;&gt;&gt; &gt; dependent on the power state of the host solely, but also=
 dependent on<br>
&gt;&gt;&gt; &gt; the boot progress of the host.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Would the BiosPost power state not suffice?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt; And the more serious issue is that<br>
&gt;&gt;&gt; &gt; returning EAGAIN from the driver freezes the sensor, whic=
h is what I&#39;m<br>
&gt;&gt;&gt; &gt; debugging right now. Do we have special treatment on errn=
o returned by<br>
&gt;&gt;&gt; &gt; the driver? Thx.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I ran into a similar issue with the CPUSensor and this was my =
fix:<br>
&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/dbus-sensors/commit/c22b=
842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1c42d967a02ea0"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/dbus-senso=
rs/commit/c22b842bfa8cfe798d83f99fa7aa9f142278c21d#diff-ccbe0562fe1d501b4c1=
c42d967a02ea0</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I haven&#39;t hit this issue with hwmon sensor though.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; - Alex Qiu<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt; On Fri, Aug 28, 2020 at 9:38 AM James Feist &lt;<a href=
=3D"mailto:james.feist@linux.intel.com" target=3D"_blank">james.feist@linux=
.intel.com</a><br>
&gt;&gt;&gt; &gt; &lt;mailto:<a href=3D"mailto:james.feist@linux.intel.com"=
 target=3D"_blank">james.feist@linux.intel.com</a>&gt;&gt; wrote:<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 8/27/2020 2:49 PM, Alex Qiu wrote:<=
br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi James,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; After some debugging, I realized=
 that the code I pointed out earlier<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; wasn&#39;t the root cause. Updat=
e is that, the HwmonTempSensor stops<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; updating after the hwmon driver =
returns EAGAIN as errno. I&#39;ll keep<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; debugging...<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; - Alex Qiu<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, Aug 25, 2020 at 5:49 PM =
Alex Qiu &lt;<a href=3D"mailto:xqiu@google.com" target=3D"_blank">xqiu@goog=
le.com</a><br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:xqiu@goog=
le.com" target=3D"_blank">xqiu@google.com</a>&gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt; &lt;mailto:<a href=3D"mailto:xqi=
u@google.com" target=3D"_blank">xqiu@google.com</a> &lt;mailto:<a href=3D"m=
ailto:xqiu@google.com" target=3D"_blank">xqiu@google.com</a>&gt;&gt;&gt; wr=
ote:<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Hi James and =
OpenBMC community,<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0We have a sen=
sor for HwmonTempSensor which doesn&#39;t have a valid<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0reading until=
 the host is fully booted. Before it&#39;s becoming<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0alive<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0and useful, i=
t&#39;s getting disabled in code<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(<a href=3D"https://github.com/=
openbmc/dbus-sensors/blob/master/include/sensor.hpp#L266" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/openbmc/dbus-sensors/blob/master/inc=
lude/sensor.hpp#L266</a>)<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0because of er=
rors thrown up by the hwmon driver. Ideally, the<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0thermal contr=
ol loop should kick the fan to fail safe mode<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0until no<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0more errors a=
re observed.<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Any suggestio=
ns on how we should handle this kind of sensor<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0properly?<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0For what its worth we use the PowerSta=
te property that has options of<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0power on or BiosPost to disable scanni=
ng when the state is invalid:<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/openbmc/=
dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMai=
n.cpp#L208" rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc=
/dbus-sensors/blob/f27a55c775383a3fb1ac655f3eda785f6845f214/src/HwmonTempMa=
in.cpp#L208</a><br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0Thank you!<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0- Alex Qiu<br=
>
&gt;&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;&gt;&gt; &gt;<br>
</blockquote></div>

--0000000000004490b105ae352d6a--
