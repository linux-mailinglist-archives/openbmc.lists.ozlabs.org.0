Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C990CD8157
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 22:53:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t7262vkGzDr6Z
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 07:53:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="VkP/gTPq"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t71J5BK8zDr1q
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 07:53:06 +1100 (AEDT)
Received: by mail-lj1-x244.google.com with SMTP id f5so21699316ljg.8
 for <openbmc@lists.ozlabs.org>; Tue, 15 Oct 2019 13:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W/Q4BV8+Nkj0F43Ti9EL7cOOXQ4oiu7/0/+utHndwP8=;
 b=VkP/gTPqni4OaFtyjQAXLooQb9T4gdEj7kK/Em8PvM/z/zIa2SDx9GGP4a5X0sFn/z
 nHDZ3qydK1a91ECjYWjN4kamVxTAenJ3OkLOkMEeBYaEznR2PRFuGquE++VJc6aDQNHN
 Z9M8LzyKoRd8XomRMwHufvqQ4G0iF9a0tweMNuc0IXi3YRso54+byv0wd904zCTeFWCE
 6B18yy4haSGAbUUe/PeiPsWG82EhYaIuhR42O+zbOPwxMAtNurNUWkHOh7oX11oqXh3i
 cBtNSkmYxds8Ru3VthKKvUV8yakL/prO+y4RAFKMXJgvsC1VFvVcHsGefxO47CUCx8PD
 CdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W/Q4BV8+Nkj0F43Ti9EL7cOOXQ4oiu7/0/+utHndwP8=;
 b=hhMWOngsDDXrCu5gpjyufsDrtFPpJBuU2RM5ocAMvqC6CVtCcnqO9wjg8Jn7d2tCcs
 tpscFZMJ4SuM522DgqPh+fCyQSarpCzEKn6dGlFvLB3xIr+zVl+gPfmBwtSgOzMcXE7V
 vrL+TLn6Su4JyW0iQ8fpmHeUgMN9sLMUNyBfALDU6kc3dYyzSohdvcrSwFfHShUQ160w
 wkFBTJAljpsLSLvPbzNSRWnumVckWul6pitB5iwM/9McLs2ZnrAqipnwJuInxA0Lj6SD
 55YCb7fnRyjJsdx3BMBLDjfE5YmKMIzTlokFxQtid3Wc5fcYLp8gxsLA9lQYDeXT5Tka
 Tbfg==
X-Gm-Message-State: APjAAAUa/sQp87GPiELFvbMP0FezS3MeEZM3Url6xmL7TSxwXwYXdkJ4
 7xLevUZ+SCMjBjnJjO55/4KzdqPdaYP/sXjZWk9jVw==
X-Google-Smtp-Source: APXvYqw8Ke3TvgSkO+b55/rXhXqN2l7DQL+ubncknUYLfHO+SnX+TkRvfJjo095oKOww1Jtrh87W3D58Q7e8K/MybT0=
X-Received: by 2002:a2e:b163:: with SMTP id a3mr22391864ljm.187.1571172780282; 
 Tue, 15 Oct 2019 13:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <CALzeG+8HyS2xuBAoe4LN0XCC1+eW7D8uQnG9MKK=KGFN7jodZw@mail.gmail.com>
 <CAO=notynD0EtN77y+UDqETUCo1BGixKFhaJJ3KfnQjVsv2=wTA@mail.gmail.com>
 <de3911ab-f416-cc87-3d48-b70ce5e57612@intel.com>
 <E19C0FD2-2F95-4943-B3CC-D4447D2FABE8@fuzziesquirrel.com>
 <b8ab145d-384d-d03e-8ace-36251fd38ed3@linux.intel.com>
In-Reply-To: <b8ab145d-384d-d03e-8ace-36251fd38ed3@linux.intel.com>
From: Kun Yi <kunyi@google.com>
Date: Tue, 15 Oct 2019 13:52:32 -0700
Message-ID: <CAGMNF6X=DpKNXfbRd3Y1eXimVPXoQb1KBCCP1d-TjQf_CuSrFw@mail.gmail.com>
Subject: Re: The type of sensor value in redfish should be double or int64?
To: James Feist <james.feist@linux.intel.com>
Content-Type: multipart/alternative; boundary="00000000000073a8050594f92b09"
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
Cc: Ed Tanous <ed.tanous@intel.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Carol Wang <karo33bug@gmail.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, gmills@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000073a8050594f92b09
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 15, 2019 at 1:32 PM James Feist <james.feist@linux.intel.com>
wrote:

> On 10/15/19 12:21 PM, Brad Bishop wrote:
> > at 1:07 PM, Ed Tanous <ed.tanous@intel.com> wrote:
> >
> >> On 10/15/19 8:17 AM, Patrick Venture wrote:
> >>> On Mon, Oct 14, 2019 at 7:57 PM Carol Wang <karo33bug@gmail.com>
> wrote:
> >>>> Hi,
> >>>>
> >>>> I tried to override sensor values with redfish Patch, referring to
> >>>> the Voltages example of
> >>>> https://github.com/openbmc/bmcweb/search?q=3D413961de&type=3DCommits=
,
> >>>> but met an error "Invalid argument". Comparing the code
> >>>>
> https://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hp=
p#L2192
> >>>> and the doc
> >>>>
> https://github.com/openbmc/phosphor-dbus-interfaces/blob/master/xyz/openb=
mc_project/Sensor/Value.interface.yaml#L21,
>
> >>>> the current code uses double type, but the doc says the value type
> >>>> should be int64. It seems a scale difference. Why the code uses
> >>>> double here?
> >>
> >> To my understanding, the phosphor-hwmon sensor system doesn't support
> >> overriding sensor values at runtime, regardless of whether or not you
> >> resolved the type issues with the arguments.
> >
> > I=E2=80=99m just curious=E2=80=A6what is the use-case for writing a vol=
tage sensor=E2=80=A6or
> > any sensor for that matter?  What do you do with the user-supplied valu=
e
> > when the sensor is a piece of hardware that does not comprehend setting
> > a value?  This is probably my lack of Redfish-fu showing.
>
> We mostly use it for our test suite.. I'm not aware of many other usages
> at this time.
>

We write to margin sensors to control the PID fan loop. Under Redfish they
could be different typed resources.

>
> >
> > FWIW when I originally defined the Sensor.Value interface, it was meant
> > to be read only.  In fact the documentation says this, even if it is no=
t
> > enforced anywhere:
> >
> >      All Sensor.Value properties are read-only.
> >
> > If a device provides some kind of control mechanism there are other
> > interfaces for expressing/modeling those, typically/ideally in the
> > control namespace.
> >
> >> If your goal is just "get
> >> it to work", I'd recommend switching to dbus-sensors (which I realize =
is
> >> non-trivial for some systems).  With that said, it would be great to g=
et
> >> this int64 to double conversion going again.
> >>
> >>
> >>> The short answer is, code generally authored by Intel uses doubles fo=
r
> >>> the sensor values, whereas the original OpenBMC sensor models used
> >>> int64.
> >>>
> >>> A while back there was a bit of a debate about this, and it looks lik=
e
> >>> we never truly resolved it.  Brad, perhaps this is a good time to?
> >>> The idea is, that with the int64 storage, we store the raw value and
> >>> we also store the scaling factor, so that one can scale the number if
> >>> they choose to.  Sort of keeping the values as they are -- instead of
> >>> operating on them before publishing them to dbus.  We do notably
> >>> however, modify values in phosphor-hwmon before publishing them as
> >>> often there are scaling factors and offsets, beyond the conversion
> >>> from mC to C.
> >>>
> >>> phosphor-host-ipmid's sensor YAML requires the type to be specified
> >>> for the sensor value interface already, and does validly support both
> >>> types: int64_t and double (I tested it when I briefly had a mixed
> >>> environment).
> >>> phosphor-hwmon reports values without applying the scaling factor, bu=
t
> >>> it is aware of the scaling factor, so it could.
> >>> phosphor-pid-control works with both types correctly.
> >>
> >> bmcweb also works with both types for everything but the PATCH
> interface.
> >>
> >>> I'm not sure about the phosphor-fan stuff, but I imagine we'll find
> >>> some arithmetic we can drop where it ingests values.
> >>>
> >>> This change from int64 to double is big enough though that many
> >>> configuration files would need to be adjusted, which is non-trivial.
> >>> I argue however that having code that doesn't have a common interface
> >>> or interfaces for sensors is less than ideal.  Having multiple option=
s
> >>> for talking to sensors is fine, but in my opinion this is only true i=
f
> >>> they implement different interfaces, or the same interface.  In this
> >>> case, we have dbus-sensors and phosphor-hwmon which both implement th=
e
> >>> same interface, but differently: int64 vs double.
> >>>
> >>> I think using doubles makes sense at the dbus level because generally
> >>> one wants that version of the value.  Therefore you end up with code
> >>> in each daemon that reads the sensor value and the scale so that it
> >>> can perform the same operation that another daemon is also going to
> >>> perform, etc.  Instead of just doing it once.
> >>>
> >>> I'll climb off my debate box now and climb onto my voting box and say=
,
> >>> I'd like to make phosphor-hwmon report the value as double and I'm
> >>> willing to review incoming patches that address other aspects of the
> >>> codebase to bring it all together -- since they'll need to be in a
> >>> locked step-forward.
> >>
> >> Another vote for moving to double.  The systems I work on don't use
> >> phosphor-hwmon, so there's not a lot of ways to test the other
> >> components.  The pieces that I use (dbus-sensors, phosphor-pid-control=
,
> >> bmcweb) all work correctly with double.
> >>
> >> The reviews to move to double are still open, unresolved, and James ha=
s
> >> patches to several daemons that need to be converted.
> >>
> https://gerrit.openbmc-project.xyz/q/topic:%22double-sensor%22+(status:op=
en%20OR%20status:merged)
> >>
> >
>


--=20
Regards,
Kun

--00000000000073a8050594f92b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 15, 2019 at 1:32 PM James=
 Feist &lt;<a href=3D"mailto:james.feist@linux.intel.com">james.feist@linux=
.intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 10/15/19 12:21 PM, Brad Bishop wrote:<br>
&gt; at 1:07 PM, Ed Tanous &lt;<a href=3D"mailto:ed.tanous@intel.com" targe=
t=3D"_blank">ed.tanous@intel.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; On 10/15/19 8:17 AM, Patrick Venture wrote:<br>
&gt;&gt;&gt; On Mon, Oct 14, 2019 at 7:57 PM Carol Wang &lt;<a href=3D"mail=
to:karo33bug@gmail.com" target=3D"_blank">karo33bug@gmail.com</a>&gt; wrote=
:<br>
&gt;&gt;&gt;&gt; Hi,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; I tried to override sensor values with redfish Patch, refe=
rring to <br>
&gt;&gt;&gt;&gt; the Voltages example of <br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/search?q=3D41=
3961de&amp;type=3DCommits" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/openbmc/bmcweb/search?q=3D413961de&amp;type=3DCommits</a>, <br>
&gt;&gt;&gt;&gt; but met an error &quot;Invalid argument&quot;. Comparing t=
he code <br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/bmcweb/blob/master/r=
edfish-core/lib/sensors.hpp#L2192" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openbmc/bmcweb/blob/master/redfish-core/lib/sensors.hpp#L21=
92</a> <br>
&gt;&gt;&gt;&gt; and the doc <br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-dbus-interf=
aces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L21" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-dbus-=
interfaces/blob/master/xyz/openbmc_project/Sensor/Value.interface.yaml#L21<=
/a>, <br>
&gt;&gt;&gt;&gt; the current code uses double type, but the doc says the va=
lue type <br>
&gt;&gt;&gt;&gt; should be int64. It seems a scale difference. Why the code=
 uses <br>
&gt;&gt;&gt;&gt; double here?<br>
&gt;&gt;<br>
&gt;&gt; To my understanding, the phosphor-hwmon sensor system doesn&#39;t =
support<br>
&gt;&gt; overriding sensor values at runtime, regardless of whether or not =
you<br>
&gt;&gt; resolved the type issues with the arguments.<br>
&gt; <br>
&gt; I=E2=80=99m just curious=E2=80=A6what is the use-case for writing a vo=
ltage sensor=E2=80=A6or <br>
&gt; any sensor for that matter?=C2=A0 What do you do with the user-supplie=
d value <br>
&gt; when the sensor is a piece of hardware that does not comprehend settin=
g <br>
&gt; a value?=C2=A0 This is probably my lack of Redfish-fu showing.<br>
<br>
We mostly use it for our test suite.. I&#39;m not aware of many other usage=
s <br>
at this time.<br></blockquote><div><br></div><div>We write to margin sensor=
s to control the PID fan loop. Under Redfish they could be different typed =
resources.</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; FWIW when I originally defined the Sensor.Value interface, it was mean=
t <br>
&gt; to be read only.=C2=A0 In fact the documentation says this, even if it=
 is not <br>
&gt; enforced anywhere:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0 All Sensor.Value properties are read-only.<br=
>
&gt; <br>
&gt; If a device provides some kind of control mechanism there are other <b=
r>
&gt; interfaces for expressing/modeling those, typically/ideally in the <br=
>
&gt; control namespace.<br>
&gt; <br>
&gt;&gt; If your goal is just &quot;get<br>
&gt;&gt; it to work&quot;, I&#39;d recommend switching to dbus-sensors (whi=
ch I realize is<br>
&gt;&gt; non-trivial for some systems).=C2=A0 With that said, it would be g=
reat to get<br>
&gt;&gt; this int64 to double conversion going again.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; The short answer is, code generally authored by Intel uses dou=
bles for<br>
&gt;&gt;&gt; the sensor values, whereas the original OpenBMC sensor models =
used<br>
&gt;&gt;&gt; int64.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; A while back there was a bit of a debate about this, and it lo=
oks like<br>
&gt;&gt;&gt; we never truly resolved it.=C2=A0 Brad, perhaps this is a good=
 time to?<br>
&gt;&gt;&gt; The idea is, that with the int64 storage, we store the raw val=
ue and<br>
&gt;&gt;&gt; we also store the scaling factor, so that one can scale the nu=
mber if<br>
&gt;&gt;&gt; they choose to.=C2=A0 Sort of keeping the values as they are -=
- instead of<br>
&gt;&gt;&gt; operating on them before publishing them to dbus.=C2=A0 We do =
notably<br>
&gt;&gt;&gt; however, modify values in phosphor-hwmon before publishing the=
m as<br>
&gt;&gt;&gt; often there are scaling factors and offsets, beyond the conver=
sion<br>
&gt;&gt;&gt; from mC to C.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; phosphor-host-ipmid&#39;s sensor YAML requires the type to be =
specified<br>
&gt;&gt;&gt; for the sensor value interface already, and does validly suppo=
rt both<br>
&gt;&gt;&gt; types: int64_t and double (I tested it when I briefly had a mi=
xed<br>
&gt;&gt;&gt; environment).<br>
&gt;&gt;&gt; phosphor-hwmon reports values without applying the scaling fac=
tor, but<br>
&gt;&gt;&gt; it is aware of the scaling factor, so it could.<br>
&gt;&gt;&gt; phosphor-pid-control works with both types correctly.<br>
&gt;&gt;<br>
&gt;&gt; bmcweb also works with both types for everything but the PATCH int=
erface.<br>
&gt;&gt;<br>
&gt;&gt;&gt; I&#39;m not sure about the phosphor-fan stuff, but I imagine w=
e&#39;ll find<br>
&gt;&gt;&gt; some arithmetic we can drop where it ingests values.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This change from int64 to double is big enough though that man=
y<br>
&gt;&gt;&gt; configuration files would need to be adjusted, which is non-tr=
ivial.<br>
&gt;&gt;&gt; I argue however that having code that doesn&#39;t have a commo=
n interface<br>
&gt;&gt;&gt; or interfaces for sensors is less than ideal.=C2=A0 Having mul=
tiple options<br>
&gt;&gt;&gt; for talking to sensors is fine, but in my opinion this is only=
 true if<br>
&gt;&gt;&gt; they implement different interfaces, or the same interface.=C2=
=A0 In this<br>
&gt;&gt;&gt; case, we have dbus-sensors and phosphor-hwmon which both imple=
ment the<br>
&gt;&gt;&gt; same interface, but differently: int64 vs double.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think using doubles makes sense at the dbus level because ge=
nerally<br>
&gt;&gt;&gt; one wants that version of the value.=C2=A0 Therefore you end u=
p with code<br>
&gt;&gt;&gt; in each daemon that reads the sensor value and the scale so th=
at it<br>
&gt;&gt;&gt; can perform the same operation that another daemon is also goi=
ng to<br>
&gt;&gt;&gt; perform, etc.=C2=A0 Instead of just doing it once.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;ll climb off my debate box now and climb onto my voting =
box and say,<br>
&gt;&gt;&gt; I&#39;d like to make phosphor-hwmon report the value as double=
 and I&#39;m<br>
&gt;&gt;&gt; willing to review incoming patches that address other aspects =
of the<br>
&gt;&gt;&gt; codebase to bring it all together -- since they&#39;ll need to=
 be in a<br>
&gt;&gt;&gt; locked step-forward.<br>
&gt;&gt;<br>
&gt;&gt; Another vote for moving to double.=C2=A0 The systems I work on don=
&#39;t use<br>
&gt;&gt; phosphor-hwmon, so there&#39;s not a lot of ways to test the other=
<br>
&gt;&gt; components.=C2=A0 The pieces that I use (dbus-sensors, phosphor-pi=
d-control,<br>
&gt;&gt; bmcweb) all work correctly with double.<br>
&gt;&gt;<br>
&gt;&gt; The reviews to move to double are still open, unresolved, and Jame=
s has<br>
&gt;&gt; patches to several daemons that need to be converted.<br>
&gt;&gt; <a href=3D"https://gerrit.openbmc-project.xyz/q/topic:%22double-se=
nsor%22+(status:open%20OR%20status:merged)" rel=3D"noreferrer" target=3D"_b=
lank">https://gerrit.openbmc-project.xyz/q/topic:%22double-sensor%22+(statu=
s:open%20OR%20status:merged)</a> <br>
&gt;&gt;<br>
&gt; <br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv></div>

--00000000000073a8050594f92b09--
