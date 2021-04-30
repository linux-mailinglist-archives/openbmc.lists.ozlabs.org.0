Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE536FE1A
	for <lists+openbmc@lfdr.de>; Fri, 30 Apr 2021 17:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWxkl62wBz302f
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 01:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=cpULndKv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29;
 helo=mail-yb1-xb29.google.com; envelope-from=jasonling@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=cpULndKv; dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWxkW0XBLz2xxv
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 01:54:08 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id z1so83669041ybf.6
 for <openbmc@lists.ozlabs.org>; Fri, 30 Apr 2021 08:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eKYvOzjpvZqtfsOwFu8P+T0H3EhJUylMX6hPbhDG33c=;
 b=cpULndKvK9aN03Br51LsuEDBR4x/BKVctC2wTZQNzyMwUHi5/amvQYsjut3hYPo3aB
 tdcvYAkJ1ViGLUDNkTfBMx1fU23qhQIs4EhdMz2yRinO2pLbgHPgkQrfnCpPVP3P5Kq8
 V1oC9po2cwJBP/3AqXI9u4JXuPjnWqrdPTmRMkbmhCmxe4vftT6eDMhjLRCMYvXpGGtm
 XyeHGS0OTQSxYH0oR+oGaKEyiVv3w210Gx9YzB6uktwgfhLf1RV8IMfmSkqKnhCTCDdM
 3oArxHnk7mdhn1ec34u8yWNaAgXqaAb2shj9/lvCJmd7+wEUgV7FeUIdtU5+lqzPjS+x
 ftJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eKYvOzjpvZqtfsOwFu8P+T0H3EhJUylMX6hPbhDG33c=;
 b=rWXuXgnceeawGeVPf0QVA/jQREWRqv6OrgqbTBt+JCRw+/JkiHRaDHd6IHafUEnKhI
 wSoQo7KxcUiC9+q5cBmzAGCNOYuUhmEA+IA29Bsnd0KDcTpl0U6a1BQZbWV/UIRef12W
 h/IHElKdPmFk/kPgqcnHNF+OeBHOrIPQ1QKDERPgEUdah6eSAxKq231KBcwP4MqrPEoN
 C140La4h4alIdHHQx19wJMPCZPFSEQlZQEmbL2MYMMEbQ0QcyO/mWEzKT9SBsT3YZToG
 W59vOPV3OzvH9UZo1ktPWb+asLfp6OCJuRGKu0rSy37T89DlmvggQT4o7uEV2/Y2WwjZ
 jTLA==
X-Gm-Message-State: AOAM5333ChYNV0f7cb32vB5D0AjZbRe2/FfRxOYVMbYbdhwHDLxKPVAg
 NjA4jjciPdxwYPbdwcJQbLe9IdIEEUeuaK7tLbNrohqjADiLVA==
X-Google-Smtp-Source: ABdhPJxS4lwbBsXb0b4/8h2OJcjHaXt2jLENp8spuB1m4VdCxdehxNlsjIKz1waOgpqRM17quvAOsdX6BrFDVEstlGs=
X-Received: by 2002:a25:ab0e:: with SMTP id u14mr7882317ybi.513.1619798044181; 
 Fri, 30 Apr 2021 08:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHBbfcXj57K66ARd2_SQMCdNTPVtWk8Xrq0jn_k+WghjRcT-CA@mail.gmail.com>
 <YIwRqzb/50Yk9hZa@heinlein>
 <CAHBbfcVPYZyUaMH9eJYs49RkTJ8aeXg5LMHGJGD0Ftqqx9Skew@mail.gmail.com>
 <YIwd4CukDfVrOqQs@heinlein>
 <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
In-Reply-To: <CAHBbfcWK3nRA3j96EQW38FYJ3gBtn2rkEZLrgGrrwTCaU=Reng@mail.gmail.com>
From: Jason Ling <jasonling@google.com>
Date: Fri, 30 Apr 2021 08:53:27 -0700
Message-ID: <CAHBbfcVBH803ADi0+Xm-0MT5TfOtDPD1TLU0rXzdKmz-=-5Uuw@mail.gmail.com>
Subject: Re: [pmbusplus] userspace i2c, pmbus interactions
To: Patrick Williams <patrick@stwcx.xyz>
Content-Type: multipart/alternative; boundary="00000000000008816405c1329fc6"
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

--00000000000008816405c1329fc6
Content-Type: text/plain; charset="UTF-8"

>
> > >       What is it that makes you want to write your code using low-level
> > >        i2c and PMBus APIs directly in userspace instead of writing or
> > >        updating drivers and using the various high-level user APIs
> > >        provided by kernel subsystems?
> >
> > I speak in the context of hwmon/pmbus but these patches were simply
> > rejected. A lot of times the device you want to upgrade is also the
> device
> > you're gathering telemetry from.
> I think the "is also" is the part that gives me concern.  Generally this
> means binding/unbinding the kernel side of it, which isn't pleasant.


Yup, this definitely isn't pleasant but it's doable. Have you had
experiences where unbinding/binding caused lots of pain? The only pain that
I've seen is that telemetry daemons generally don't take well to having
hwmon sysfs attributes yanked from underneath them.
Just spitballing.. but for devices that need to be upgradeable *and* need
to report telemetry, that such things should be done in a single service
and perhaps it makes the most sense to do it all in userspace (to avoid
ugly unbinding/binding).


>
> >        I see you mentioned "pmbus device upgrades" and I know the PMBus
> > >        subsystem doesn't currently support firmware upgrade paths.
> But,
> > >        there has been LKML threads about it and what I recollect was
> > >        that it wasn't "not allowed" but just "not implemented".
> > >        Shouldn't we be focusing our efforts on enhancing features for
> > >        the whole OSS community rather than building our own different
> > >        library?
> >
> > Fair point but I don't see them as mutually exclusive, use hwmon/pmbus
> > drivers where they make sense and work for you. Switch to userspace for
> > stuff that gets strong pushback from hwmon/pmbus maintainer or stuff that
> > just doesn't make sense to put into a driver.
> My feeling is that we need more definition on what that boundary is.  As
> long as we are really only doing stuff from userspace when there is no
> other path forward, I don't have much concern.  But, I've seen too many
> cases where someone has tried to write an i2c-driver-in-userspace
> because they "didn't like working with the kernel" or some similar
> excuse.
> What is something that doesn't make sense to put into a driver and why?


Firmware/config upgrades and the reason is that your patch will get
rejected.
The feeling is that "dangerous" i2c things that could brick the system or
damage it shouldn't be put into the kernel and that the preference is to
have this done in userspace via i2c-dev. This statement was made about
sequencer config and firmware upgrades.
I suspect it would extend to arbitrarily adjusting voltages, putting
devices into special states, sending control commands to a device's non
pmbus standard i2c interface (vendor specific stuff, like indirect register
accesses).

On Fri, Apr 30, 2021 at 8:45 AM Jason Ling <jasonling@google.com> wrote:

> On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
> >
> >     2. How does the availability (and potential recommendation of usage
> > >        by our community) affect the effort to ensure that all i2c and
> > >        pmbus drivers are upstreamed?
> >
> > Well, this library is meant for userspace usage. So i2c (hwmon?) and
> pmbus
> > drivers would continue to be upstreamed as per usual.
> > Motivating use case for userspace i2c transactions are pmbus firmware
> > updates. With adm1266 we tried to upstream sequencer configuration update
> > via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
> > userspace.
>
> Do you have pointers to the discussion?
>
> Whew...took a lot longer to find the thread but here is the explicit
> rejection of firmware and configuration upgrade from within the kernel
>
> https://lkml.org/lkml/2020/8/7/565
>
> other things like don't put in ioctls
>
> https://lkml.org/lkml/2020/6/24/830
>
> This is the strongest use-case as it's been explicitly rejected by the
> subsystem maintainer.
>
> I suspect that things like adjusting voltages would similarly be rejected
> but honestly we haven't gone down that path yet.
>
>
> On Fri, Apr 30, 2021 at 8:10 AM Patrick Williams <patrick@stwcx.xyz>
> wrote:
>
>> On Fri, Apr 30, 2021 at 07:52:36AM -0700, Jason Ling wrote:
>> >
>> >     2. How does the availability (and potential recommendation of usage
>> > >        by our community) affect the effort to ensure that all i2c and
>> > >        pmbus drivers are upstreamed?
>> >
>> > Well, this library is meant for userspace usage. So i2c (hwmon?) and
>> pmbus
>> > drivers would continue to be upstreamed as per usual.
>> > Motivating use case for userspace i2c transactions are pmbus firmware
>> > updates. With adm1266 we tried to upstream sequencer configuration
>> update
>> > via the hwmon/pmbus driver, it failed spectacularly. So we have to do it
>> > userspace.
>>
>> Do you have pointers to the discussion?
>>
>> > >       What is it that makes you want to write your code using
>> low-level
>> > >        i2c and PMBus APIs directly in userspace instead of writing or
>> > >        updating drivers and using the various high-level user APIs
>> > >        provided by kernel subsystems?
>> >
>> > I speak in the context of hwmon/pmbus but these patches were simply
>> > rejected. A lot of times the device you want to upgrade is also the
>> device
>> > you're gathering telemetry from.
>>
>> I think the "is also" is the part that gives me concern.  Generally this
>> means binding/unbinding the kernel side of it, which isn't pleasant.
>>
>> >
>> >        I see you mentioned "pmbus device upgrades" and I know the PMBus
>> > >        subsystem doesn't currently support firmware upgrade paths.
>> But,
>> > >        there has been LKML threads about it and what I recollect was
>> > >        that it wasn't "not allowed" but just "not implemented".
>> > >        Shouldn't we be focusing our efforts on enhancing features for
>> > >        the whole OSS community rather than building our own different
>> > >        library?
>> >
>> > Fair point but I don't see them as mutually exclusive, use hwmon/pmbus
>> > drivers where they make sense and work for you. Switch to userspace for
>> > stuff that gets strong pushback from hwmon/pmbus maintainer or stuff
>> that
>> > just doesn't make sense to put into a driver.
>>
>> My feeling is that we need more definition on what that boundary is.  As
>> long as we are really only doing stuff from userspace when there is no
>> other path forward, I don't have much concern.  But, I've seen too many
>> cases where someone has tried to write an i2c-driver-in-userspace
>> because they "didn't like working with the kernel" or some similar
>> excuse.
>>
>> What is something that doesn't make sense to put into a driver and why?
>>
>> --
>> Patrick Williams
>>
>

--00000000000008816405c1329fc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span cl=
ass=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0What is it that makes you want to write your code using low-level<br=
></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 i2c and PMBus APIs directly in userspace instead o=
f writing or<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)=
">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 updating drivers and using the vario=
us high-level user APIs<br></span><span class=3D"gmail-im" style=3D"color:r=
gb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 provided by kernel subsys=
tems?<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;<=
br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; I spea=
k in the context of hwmon/pmbus but these patches were simply<br></span><sp=
an class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; rejected. A lot of =
times the device you want to upgrade is also the device<br></span><span cla=
ss=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; you&#39;re gathering tele=
metry from.</span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)"><br=
></span>I think the &quot;is also&quot; is the part that gives me concern.=
=C2=A0 Generally this<br>means binding/unbinding the kernel side of it, whi=
ch isn&#39;t pleasant.</blockquote><div><br></div><div>Yup, this definitely=
 isn&#39;t pleasant but it&#39;s doable. Have you had experiences where unb=
inding/binding caused lots of pain? The only pain that I&#39;ve seen is tha=
t telemetry daemons generally don&#39;t take well to having hwmon sysfs att=
ributes yanked from underneath them.</div><div>Just spitballing.. but for d=
evices that need to be upgradeable <b>and</b>=C2=A0need to report telemetry=
, that such things should be done in a single service and perhaps it makes =
the most sense to do it all in userspace (to avoid ugly unbinding/binding).=
=C2=A0</div><div><br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=
<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 I see you mentioned &quot;pmbus device upgrades&quot;=
 and I know the PMBus<br></span><span class=3D"gmail-im" style=3D"color:rgb=
(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 subsystem doesn&#39;t curre=
ntly support firmware upgrade paths.=C2=A0 But,<br></span><span class=3D"gm=
ail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 t=
here has been LKML threads about it and what I recollect was<br></span><spa=
n class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 that it wasn&#39;t &quot;not allowed&quot; but just &quot;not=
 implemented&quot;.<br></span><span class=3D"gmail-im" style=3D"color:rgb(8=
0,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Shouldn&#39;t we be focusing =
our efforts on enhancing features for<br></span><span class=3D"gmail-im" st=
yle=3D"color:rgb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the whole O=
SS community rather than building our own different<br></span><span class=
=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 library?<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,=
80)">&gt;<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&=
gt; Fair point but I don&#39;t see them as mutually exclusive, use hwmon/pm=
bus<br></span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; dr=
ivers where they make sense and work for you. Switch to userspace for<br></=
span><span class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; stuff that =
gets strong pushback from hwmon/pmbus maintainer or stuff that<br></span><s=
pan class=3D"gmail-im" style=3D"color:rgb(80,0,80)">&gt; just doesn&#39;t m=
ake sense to put into a driver.</span><span class=3D"gmail-im" style=3D"col=
or:rgb(80,0,80)"><br></span>My feeling is that we need more definition on w=
hat that boundary is.=C2=A0 As<br>long as we are really only doing stuff fr=
om userspace when there is no<br>other path forward, I don&#39;t have much =
concern.=C2=A0 But, I&#39;ve seen too many<br>cases where someone has tried=
 to write an i2c-driver-in-userspace<br>because they &quot;didn&#39;t like =
working with the kernel&quot; or some similar<br>excuse.<br>What is somethi=
ng that doesn&#39;t make sense to put into a driver and why?</blockquote><d=
iv><br></div><div>Firmware/config upgrades and the reason is that your patc=
h will get rejected.</div><div>The feeling is that &quot;dangerous&quot; i2=
c things that could brick the system or damage it shouldn&#39;t be put into=
 the kernel and that the preference is to have this done in userspace via i=
2c-dev. This statement was made about sequencer config and firmware upgrade=
s.=C2=A0</div><div>I suspect it would extend to arbitrarily adjusting volta=
ges, putting devices into special states, sending control commands to a dev=
ice&#39;s non pmbus standard i2c interface (vendor specific stuff, like ind=
irect register accesses).<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 8:45 AM Jason Li=
ng &lt;<a href=3D"mailto:jasonling@google.com">jasonling@google.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><span style=3D"color:rgb(80,0,80)">On Fri, Apr 30, 2021 at 07:52:3=
6AM -0700, Jason Ling wrote:<br>&gt;<br>&gt;=C2=A0 =C2=A0 =C2=A02. How does=
 the availability (and potential recommendation of usage<br>&gt; &gt;=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 by our community) affect the effort to ensure that al=
l i2c and<br>&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmbus drivers are upstrea=
med?<br>&gt;<br>&gt; Well, this library is meant for userspace usage. So i2=
c (hwmon?) and pmbus<br>&gt; drivers would continue to be upstreamed as per=
 usual.<br>&gt; Motivating use case for userspace i2c transactions are pmbu=
s firmware<br>&gt; updates. With adm1266 we tried to upstream sequencer con=
figuration update<br>&gt; via the hwmon/pmbus driver, it failed spectacular=
ly. So we have to do it<br>&gt; userspace.<br><br></span>Do you have pointe=
rs to the discussion?<div><br></div><div>Whew...took a lot longer to find t=
he thread but here is the explicit rejection of firmware and configuration =
upgrade from within the kernel</div><div><br></div><div><a href=3D"https://=
lkml.org/lkml/2020/8/7/565" target=3D"_blank">https://lkml.org/lkml/2020/8/=
7/565</a><br><div><br></div><div>other things like don&#39;t put in ioctls<=
/div><div><br></div><div><a href=3D"https://lkml.org/lkml/2020/6/24/830" ta=
rget=3D"_blank">https://lkml.org/lkml/2020/6/24/830</a><br></div></div><div=
><br></div><div>This is the strongest use-case as it&#39;s been explicitly =
rejected by the subsystem maintainer.</div><div><br></div><div>I suspect th=
at things like adjusting voltages would similarly be rejected but honestly =
we haven&#39;t gone down that path yet.</div><div><br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30,=
 2021 at 8:10 AM Patrick Williams &lt;<a href=3D"mailto:patrick@stwcx.xyz" =
target=3D"_blank">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Fri, Apr 30, 2021 at 07:52:36AM -0700=
, Jason Ling wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A02. How does the availability (and potential recomme=
ndation of usage<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 by our community) affect the effort to=
 ensure that all i2c and<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 pmbus drivers are upstreamed?<br>
&gt; <br>
&gt; Well, this library is meant for userspace usage. So i2c (hwmon?) and p=
mbus<br>
&gt; drivers would continue to be upstreamed as per usual.<br>
&gt; Motivating use case for userspace i2c transactions are pmbus firmware<=
br>
&gt; updates. With adm1266 we tried to upstream sequencer configuration upd=
ate<br>
&gt; via the hwmon/pmbus driver, it failed spectacularly. So we have to do =
it<br>
&gt; userspace.<br>
<br>
Do you have pointers to the discussion?<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0What is it that makes you want to write=
 your code using low-level<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 i2c and PMBus APIs directly in userspa=
ce instead of writing or<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 updating drivers and using the various=
 high-level user APIs<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 provided by kernel subsystems?<br>
&gt; <br>
&gt; I speak in the context of hwmon/pmbus but these patches were simply<br=
>
&gt; rejected. A lot of times the device you want to upgrade is also the de=
vice<br>
&gt; you&#39;re gathering telemetry from.<br>
<br>
I think the &quot;is also&quot; is the part that gives me concern.=C2=A0 Ge=
nerally this<br>
means binding/unbinding the kernel side of it, which isn&#39;t pleasant.<br=
>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 I see you mentioned &quot;pmbus device upgr=
ades&quot; and I know the PMBus<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 subsystem doesn&#39;t currently suppor=
t firmware upgrade paths.=C2=A0 But,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 there has been LKML threads about it a=
nd what I recollect was<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 that it wasn&#39;t &quot;not allowed&q=
uot; but just &quot;not implemented&quot;.<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Shouldn&#39;t we be focusing our effor=
ts on enhancing features for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 the whole OSS community rather than bu=
ilding our own different<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 library?<br>
&gt; <br>
&gt; Fair point but I don&#39;t see them as mutually exclusive, use hwmon/p=
mbus<br>
&gt; drivers where they make sense and work for you. Switch to userspace fo=
r<br>
&gt; stuff that gets strong pushback from hwmon/pmbus maintainer or stuff t=
hat<br>
&gt; just doesn&#39;t make sense to put into a driver.<br>
<br>
My feeling is that we need more definition on what that boundary is.=C2=A0 =
As<br>
long as we are really only doing stuff from userspace when there is no<br>
other path forward, I don&#39;t have much concern.=C2=A0 But, I&#39;ve seen=
 too many<br>
cases where someone has tried to write an i2c-driver-in-userspace<br>
because they &quot;didn&#39;t like working with the kernel&quot; or some si=
milar<br>
excuse.<br>
<br>
What is something that doesn&#39;t make sense to put into a driver and why?=
<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>
</blockquote></div>

--00000000000008816405c1329fc6--
