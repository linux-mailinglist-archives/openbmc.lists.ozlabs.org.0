Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A77FADDDD
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 19:13:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rvqv4H5fzDqRq
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 03:12:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="hmgdIhSt"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RvqB3LfbzDqPg
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:12:19 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id d17so8576646ios.13
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 10:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5WVz1ceNHy1+bGN8a0abpGAxXaKxBcTgUxPLwZ56Owk=;
 b=hmgdIhStQ8l9kwc9L+2I5dKyS3D7M6I0UydEi+a3DTHKyfD+F1bviQ81Sz56JLuM3y
 iV2ZawQAxsldO0Mlj5ux/bISmDwl9bkxXeAg2VkY8mz6zypz+tJMVWnsf5oNRMNchUpX
 RUuA3//hbGR17ssLwyaIKAu+ZwXHDgvxXd1qgCrWRp6ZiwxsYPMYnEy38U2imQORNDdI
 awkwGNGiaHqlNpBYLdq8Vma71PBD3srJ6LIiicrj5VH+hSzQ2kQLd+NTTz/aeejvyExL
 5UzM040TIgYBwsxyDu4gEC+RrIRQ0tFL86eUNBBD7clS7AS5qoZxQeI5OIpE9XlwF0rx
 RC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5WVz1ceNHy1+bGN8a0abpGAxXaKxBcTgUxPLwZ56Owk=;
 b=NoX+1CsooolN91zMvhTrvQC/S+PDYCKr/1D9/PrCKNyFnYYFZFJpa5RMaBVbsLnyrg
 0PWbs87QV+ogHz8hE6j8PtpmUjyAHimf9V/gstnbSSQ53+3in6KBOqs3mzns7M6CY9se
 xH3RhS8msupN6qf5L0q5sfF7Y2Ri9KFJ8XXx9FzBLFP4Uw60B1mZ0Wg/C37RgkZ31fe7
 eZcGtmvBzWXXhtLwiP3jfzhJJLVwILBN5+66+HmLTvVcL29sHDQieHpry0ZmVWWlXuJF
 y7seHKY48juIEtxOrq5cGlBk7QVG/oyUtT5yLGUX8cV3rghUOwpeUnZVbNy1MPc+nB6+
 5fhQ==
X-Gm-Message-State: APjAAAWcop3JSJIjl/RAKLXgqFHB1noznyqeffYVdubFmU/eDDnMbShl
 ridFdc4T1L/UEv0CnXbZsnREaRWwtj9L/nre4rbz3A==
X-Google-Smtp-Source: APXvYqy3bngDcU23a5GSocE96e3Nqt2aIVyzrt/SM8O82eQ52/lK5qBNLbNh908WvJd9ey/wEpaSsyntRppRrmOR0oI=
X-Received: by 2002:a5e:8d14:: with SMTP id m20mr28185770ioj.52.1568049135734; 
 Mon, 09 Sep 2019 10:12:15 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
 <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
 <02128993d3064b53ac289500746666ab@quantatw.com>
 <dbd75be40e2f4d41a5b621a5dc3b3df7@quantatw.com>
 <CAO=notzTM-VLV14VdXWSukftABB1Tz4i-ixPOY5qn5cs_0-1Ng@mail.gmail.com>
In-Reply-To: <CAO=notzTM-VLV14VdXWSukftABB1Tz4i-ixPOY5qn5cs_0-1Ng@mail.gmail.com>
From: Kun Yi <kunyi@google.com>
Date: Mon, 9 Sep 2019 10:11:47 -0700
Message-ID: <CAGMNF6X57Z8HXBLWjUS_dUY-uZ4dWyj5XevGzD+D5Z1RoDKyVA@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="000000000000ba553f059221e327"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000ba553f059221e327
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry about the regression issue, Hank.
IIRC I proposed to have separate groups of min/max values in D-Bus and json
files since they convey different semantics.
At the end the min/max value was merged in the current way, because the
assumption that min/max values in json is only used for fan pwm and nothing
else -- which obviously is not true now.
Should we revisit the approach? Having something like 'fanPwmScale' as a
separate config param is a cleaner approach in my opinion.

On Mon, Sep 9, 2019 at 9:59 AM Patrick Venture <venture@google.com> wrote:

> On Thu, Sep 5, 2019 at 12:25 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <=
Hank.Liou@quantatw.com>
> wrote:
> >
> > Hi Patrick,
> >
> >
> > Sorry for not clearly stating our problem. We have the following issue:
> >
> >
> > temp sensor gets 31(C) -> 31 / 0.255 =3D 121.57 -> pid uses 127.57 as
> input for temp sensor ->
> >
> > stepwise fan table output 100 duty -> full speed fan
>
> Ok, so you're getting a dbus-based min/max value and you want to
> ignore it?  In the json configuration, if you set the values to 0,
> they are set to the default (0), so there'd be no clean way to know to
> ignore dbus in this case, without adding a small check to only
> consider min/max from dbus when sensor is not temp/margin.  Basically,
> only care about min/max on dbus if type is "fan"
>
> If that's right, James do you have a cycle to look at this one-liner?
>
> >
> >
> > As a result, fan will be at full speed while temp is low. Before the
> commit fc2e803 [1], this won't happen. The root cause is that, before
> fc2e803, pid will use config min/max, which is 0 in our case. This would
> not trigger scaling function, namely scaleSensorReading, in util.cpp.
> However, after such commit, min/max would be non-zero (-128/127 from DBus=
).
> This will trigger scaling function.
> >
> >
> > [1]
> https://github.com/openbmc/phosphor-pid-control/commit/fc2e803f5d9256944e=
18c7c878a441606b1f121c
> >
> >
> > Hank
> >
> >
> > ________________________________
> > From: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> > Sent: Monday, September 2, 2019 4:52 PM
> > To: Patrick Venture
> > Cc: James Feist; openbmc@lists.ozlabs.org
> > Subject: Re: [phosphor-pid-control] scaling issue
> >
> >
> > Hi Patrick,
> >
> >
> > Since we use phosphor-sel-logger [1] at the same time, we do assign min
> and max of temp sensors to Dbus (max: 127, min: -128). So in the present
> case, our temp value will be divided by 0.255 (also due to exponent is -3
> here). This will cause re-scaling problem. Therefore there should be an
> statement to distinguish sensor types. If it is "temp", then one assigns =
0
> to the min and max from Dbus.
> >
> >
> > [1]
> https://github.com/openbmc/phosphor-sel-logger/blob/3d300fca24b30864b3e9a=
4f5768cfe5e769458ae/include/sensorutils.hpp#L59
> >
> >
> > Hank
> >
> >
> > ________________________________
> > From: Patrick Venture <venture@google.com>
> > Sent: Friday, August 30, 2019 1:47 AM
> > To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> > Cc: James Feist; openbmc@lists.ozlabs.org
> > Subject: Re: [phosphor-pid-control] scaling issue
> >
> > PTAL - https://gerrit.openbmc-project.xyz/24827 - this is merged, and
> > the srcrev bump should propagate into openbmc/openbmc in a day or two.
> >
> > On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0=
) <Hank.Liou@quantatw.com>
> wrote:
> > >
> > > Hi Patrick,
> > >
> > > I think it's OK to parse the config min&max for temp sensors.
> > >
> > > Any suggestion?
> > >
> > > Thanks,
> > > Hank
> > >
> > > >-----Original Message-----
> > > >From: openbmc [mailto:openbmc-
> > > >bounces+hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf Of Hank
> Liou
> > > >(=E5=8A=89=E6=99=89=E7=BF=B0)
> > > >Sent: Friday, August 23, 2019 4:31 PM
> > > >To: Patrick Venture <venture@google.com>; James Feist
> > > ><james.feist@linux.intel.com>
> > > >Cc: openbmc@lists.ozlabs.org
> > > >Subject: RE: [phosphor-pid-control] scaling issue
> > > >
> > > >Hi Patrick,
> > > >
> > > >>-----Original Message-----
> > > >>From: Patrick Venture [mailto:venture@google.com]
> > > >>Sent: Wednesday, August 21, 2019 10:32 PM
> > > >>To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Hank.Liou@quantatw.com=
>; James Feist
> > > >><james.feist@linux.intel.com>
> > > >>Cc: openbmc@lists.ozlabs.org
> > > >>Subject: Re: [phosphor-pid-control] scaling issue
> > > >>
> > > >>On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=
=B0)
> > > >><Hank.Liou@quantatw.com> wrote:
> > > >>>
> > > >>> Hi All,
> > > >>>
> > > >>>
> > > >>> After commit [1], I found my temp sensor reading would be re-scal=
ed
> > > >>> by
> > > >>multiplying 1 over 255, making temperature into unfamiliar unit. Al=
so
> > > >>the fan rpm reading would lie in [0,1] interval, letting the fan
> input
> > > >>to be 0 (since the input value of fan is from an integer array [2])=
.
> Are these
> > > >normal behaviors?
> > > >>Or do I miss something?
> > > >>
> > > >>Are you using dbus configuration or json?  If json, can you attach
> your config.
> > > >>Since you're saying it was working and now isn't, I'm assuming
> there's
> > > >>something about the config being treated differently with the code
> > > >>changes in an unexpected way.
> > > >
> > > >I found pid control will first read min and max from dbus and then
> (before
> > > >commit [1]) revise them if
> > > >
> > > >info->min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
> > > >
> > > >After value initialization, the min and max would be the ones in jso=
n
> file (Json
> > > >file [3]). However, after commit [1] the min and max values of confi=
g
> would
> > > >not be fed into the fan control process. The scaling issue is
> originated from
> > > >commit [4] with the aim to treat fan rpm as percentage. It seems tha=
t
> commit
> > > >[1] unexpectedly affects temp sensors in the sense that the temp is
> the
> > > >integer reading not percentage. Before commit [1], it would not
> re-scale the
> > > >temp reading since my min and max are 0 [6].
> > > >
> > > >
> > > >
> > > >There is another issue with commit [1]. Now the fan rpm would be
> something
> > > >like
> > > >
> > > >1500 / 20000 =3D 0.075
> > > >
> > > >where rpm max 20000 is from dbus. However the fan input function wou=
ld
> > > >transfer double into int, which is 0 for 0.075 (see [5]). Hence the
> fan input is 0
> > > >not percentage. Is there something wrong?
> > > >
> > > >[1] https://github.com/openbmc/phosphor-pid-
> > > >control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
> > > >[2] https://github.com/openbmc/phosphor-pid-
> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrol=
le
> > > >r.cpp#L86
> > > >[3]
> > > >       {
> > > >            "name": "fan1",
> > > >            "type": "fan",
> > > >            "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
> > > >            "writePath": "/sys/class/hwmon/hwmon1/pwm1",
> > > >            "min": 0,
> > > >            "max": 255
> > > >        },
> > > >        {
> > > >            "name": "temp1",
> > > >            "type": "temp",
> > > >            "readPath":
> "/xyz/openbmc_project/sensors/temperature/temp1",
> > > >            "writePath": "",
> > > >            "min": 0,
> > > >            "max": 0
> > > >        }
> > > >[4] https://github.com/openbmc/phosphor-pid-
> > > >control/commit/75eb769d351434547899186f73ff70ae00d7934a
> > > >[5] https://github.com/openbmc/phosphor-pid-
> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrol=
le
> > > >r.cpp#L64
> > > >[6] https://github.com/openbmc/phosphor-pid-
> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspassi
> > > >ve.cpp#L158
> > > >
> > > >>
> > > >>>
> > > >>>
> > > >>> [1]
> > > >>> https://github.com/openbmc/phosphor-pid-
> > > >>control/commit/fc2e803f5d92569
> > > >>> 44e18c7c878a441606b1f121c
> > > >>>
> > > >>> [2]
> > > >>> https://github.com/openbmc/phosphor-pid-
> > > >>control/blob/a7ec8350d17b70153
> > > >>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
> > > >>>
> > > >>>
> > > >>> Thanks,
> > > >>>
> > > >>>
> > > >>> Hank Liou
> > > >>>
> > > >>> Quanta Computer Inc.
> > > >>>
> > > >>>
> > > >
> > > >Sincerely,
> > > >Hank
>


--=20
Regards,
Kun

--000000000000ba553f059221e327
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Sorry about the regression issue, Hank.</div>IIRC I p=
roposed to have separate groups of min/max values in D-Bus and json files s=
ince they convey different semantics.<div>At the end the min/max value <fon=
t color=3D"#000000"><span style=3D"">was merged in the current way,</span><=
/font>=C2=A0because the assumption that min/max values in json is only used=
 for fan pwm and nothing else -- which obviously is not true now.<br>Should=
 we revisit the approach? Having something like &#39;fanPwmScale&#39; as a =
separate config param is a cleaner approach in my=C2=A0opinion.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Sep 9, 2019 at 9:59 AM Patrick Venture &lt;<a href=3D"mailto:venture@goog=
le.com">venture@google.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Thu, Sep 5, 2019 at 12:25 AM Hank Liou (=E5=8A=
=89=E6=99=89=E7=BF=B0) &lt;<a href=3D"mailto:Hank.Liou@quantatw.com" target=
=3D"_blank">Hank.Liou@quantatw.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Patrick,<br>
&gt;<br>
&gt;<br>
&gt; Sorry for not clearly stating our problem. We have the following issue=
:<br>
&gt;<br>
&gt;<br>
&gt; temp sensor gets 31(C) -&gt; 31 / 0.255 =3D 121.57 -&gt; pid uses 127.=
57 as input for temp sensor -&gt;<br>
&gt;<br>
&gt; stepwise fan table output 100 duty -&gt; full speed fan<br>
<br>
Ok, so you&#39;re getting a dbus-based min/max value and you want to<br>
ignore it?=C2=A0 In the json configuration, if you set the values to 0,<br>
they are set to the default (0), so there&#39;d be no clean way to know to<=
br>
ignore dbus in this case, without adding a small check to only<br>
consider min/max from dbus when sensor is not temp/margin.=C2=A0 Basically,=
<br>
only care about min/max on dbus if type is &quot;fan&quot;<br>
<br>
If that&#39;s right, James do you have a cycle to look at this one-liner?<b=
r>
<br>
&gt;<br>
&gt;<br>
&gt; As a result, fan will be at full speed while temp is low. Before the c=
ommit fc2e803 [1], this won&#39;t happen. The root cause is that, before fc=
2e803, pid will use config min/max, which is 0 in our case. This would not =
trigger scaling function, namely scaleSensorReading, in util.cpp. However, =
after such commit, min/max would be non-zero (-128/127 from DBus). This wil=
l trigger scaling function.<br>
&gt;<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openbmc/phosphor-pid-control/commit/=
fc2e803f5d9256944e18c7c878a441606b1f121c" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/openbmc/phosphor-pid-control/commit/fc2e803f5d925694=
4e18c7c878a441606b1f121c</a><br>
&gt;<br>
&gt;<br>
&gt; Hank<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)<br>
&gt; Sent: Monday, September 2, 2019 4:52 PM<br>
&gt; To: Patrick Venture<br>
&gt; Cc: James Feist; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D=
"_blank">openbmc@lists.ozlabs.org</a><br>
&gt; Subject: Re: [phosphor-pid-control] scaling issue<br>
&gt;<br>
&gt;<br>
&gt; Hi Patrick,<br>
&gt;<br>
&gt;<br>
&gt; Since we use phosphor-sel-logger [1] at the same time, we do assign mi=
n and max of temp sensors to Dbus (max: 127, min: -128). So in the present =
case, our temp value will be divided by 0.255 (also due to exponent is -3 h=
ere). This will cause re-scaling problem. Therefore there should be an stat=
ement to distinguish sensor types. If it is &quot;temp&quot;, then one assi=
gns 0 to the min and max from Dbus.<br>
&gt;<br>
&gt;<br>
&gt; [1] <a href=3D"https://github.com/openbmc/phosphor-sel-logger/blob/3d3=
00fca24b30864b3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-sel-logger=
/blob/3d300fca24b30864b3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59<=
/a><br>
&gt;<br>
&gt;<br>
&gt; Hank<br>
&gt;<br>
&gt;<br>
&gt; ________________________________<br>
&gt; From: Patrick Venture &lt;<a href=3D"mailto:venture@google.com" target=
=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Sent: Friday, August 30, 2019 1:47 AM<br>
&gt; To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)<br>
&gt; Cc: James Feist; <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D=
"_blank">openbmc@lists.ozlabs.org</a><br>
&gt; Subject: Re: [phosphor-pid-control] scaling issue<br>
&gt;<br>
&gt; PTAL - <a href=3D"https://gerrit.openbmc-project.xyz/24827" rel=3D"nor=
eferrer" target=3D"_blank">https://gerrit.openbmc-project.xyz/24827</a> - t=
his is merged, and<br>
&gt; the srcrev bump should propagate into openbmc/openbmc in a day or two.=
<br>
&gt;<br>
&gt; On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=
=B0) &lt;<a href=3D"mailto:Hank.Liou@quantatw.com" target=3D"_blank">Hank.L=
iou@quantatw.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Patrick,<br>
&gt; &gt;<br>
&gt; &gt; I think it&#39;s OK to parse the config min&amp;max for temp sens=
ors.<br>
&gt; &gt;<br>
&gt; &gt; Any suggestion?<br>
&gt; &gt;<br>
&gt; &gt; Thanks,<br>
&gt; &gt; Hank<br>
&gt; &gt;<br>
&gt; &gt; &gt;-----Original Message-----<br>
&gt; &gt; &gt;From: openbmc [mailto:<a href=3D"mailto:openbmc-" target=3D"_=
blank">openbmc-</a><br>
&gt; &gt; &gt;bounces+hank.liou=3D<a href=3D"mailto:quantatw.com@lists.ozla=
bs.org" target=3D"_blank">quantatw.com@lists.ozlabs.org</a>] On Behalf Of H=
ank Liou<br>
&gt; &gt; &gt;(=E5=8A=89=E6=99=89=E7=BF=B0)<br>
&gt; &gt; &gt;Sent: Friday, August 23, 2019 4:31 PM<br>
&gt; &gt; &gt;To: Patrick Venture &lt;<a href=3D"mailto:venture@google.com"=
 target=3D"_blank">venture@google.com</a>&gt;; James Feist<br>
&gt; &gt; &gt;&lt;<a href=3D"mailto:james.feist@linux.intel.com" target=3D"=
_blank">james.feist@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt;Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bl=
ank">openbmc@lists.ozlabs.org</a><br>
&gt; &gt; &gt;Subject: RE: [phosphor-pid-control] scaling issue<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;Hi Patrick,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;-----Original Message-----<br>
&gt; &gt; &gt;&gt;From: Patrick Venture [mailto:<a href=3D"mailto:venture@g=
oogle.com" target=3D"_blank">venture@google.com</a>]<br>
&gt; &gt; &gt;&gt;Sent: Wednesday, August 21, 2019 10:32 PM<br>
&gt; &gt; &gt;&gt;To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) &lt;<a href=
=3D"mailto:Hank.Liou@quantatw.com" target=3D"_blank">Hank.Liou@quantatw.com=
</a>&gt;; James Feist<br>
&gt; &gt; &gt;&gt;&lt;<a href=3D"mailto:james.feist@linux.intel.com" target=
=3D"_blank">james.feist@linux.intel.com</a>&gt;<br>
&gt; &gt; &gt;&gt;Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D=
"_blank">openbmc@lists.ozlabs.org</a><br>
&gt; &gt; &gt;&gt;Subject: Re: [phosphor-pid-control] scaling issue<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=
=99=89=E7=BF=B0)<br>
&gt; &gt; &gt;&gt;&lt;<a href=3D"mailto:Hank.Liou@quantatw.com" target=3D"_=
blank">Hank.Liou@quantatw.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Hi All,<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; After commit [1], I found my temp sensor reading wou=
ld be re-scaled<br>
&gt; &gt; &gt;&gt;&gt; by<br>
&gt; &gt; &gt;&gt;multiplying 1 over 255, making temperature into unfamilia=
r unit. Also<br>
&gt; &gt; &gt;&gt;the fan rpm reading would lie in [0,1] interval, letting =
the fan input<br>
&gt; &gt; &gt;&gt;to be 0 (since the input value of fan is from an integer =
array [2]). Are these<br>
&gt; &gt; &gt;normal behaviors?<br>
&gt; &gt; &gt;&gt;Or do I miss something?<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;Are you using dbus configuration or json?=C2=A0 If json, =
can you attach your config.<br>
&gt; &gt; &gt;&gt;Since you&#39;re saying it was working and now isn&#39;t,=
 I&#39;m assuming there&#39;s<br>
&gt; &gt; &gt;&gt;something about the config being treated differently with=
 the code<br>
&gt; &gt; &gt;&gt;changes in an unexpected way.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;I found pid control will first read min and max from dbus and=
 then (before<br>
&gt; &gt; &gt;commit [1]) revise them if<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;info-&gt;min !=3D conf::inheritValueFromDbus (in dbus/dbuspas=
sive.cpp)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;After value initialization, the min and max would be the ones=
 in json file (Json<br>
&gt; &gt; &gt;file [3]). However, after commit [1] the min and max values o=
f config would<br>
&gt; &gt; &gt;not be fed into the fan control process. The scaling issue is=
 originated from<br>
&gt; &gt; &gt;commit [4] with the aim to treat fan rpm as percentage. It se=
ems that commit<br>
&gt; &gt; &gt;[1] unexpectedly affects temp sensors in the sense that the t=
emp is the<br>
&gt; &gt; &gt;integer reading not percentage. Before commit [1], it would n=
ot re-scale the<br>
&gt; &gt; &gt;temp reading since my min and max are 0 [6].<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;There is another issue with commit [1]. Now the fan rpm would=
 be something<br>
&gt; &gt; &gt;like<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;1500 / 20000 =3D 0.075<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;where rpm max 20000 is from dbus. However the fan input funct=
ion would<br>
&gt; &gt; &gt;transfer double into int, which is 0 for 0.075 (see [5]). Hen=
ce the fan input is 0<br>
&gt; &gt; &gt;not percentage. Is there something wrong?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;[1] <a href=3D"https://github.com/openbmc/phosphor-pid-" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-<=
/a><br>
&gt; &gt; &gt;control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c<br>
&gt; &gt; &gt;[2] <a href=3D"https://github.com/openbmc/phosphor-pid-" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-<=
/a><br>
&gt; &gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fan=
controlle<br>
&gt; &gt; &gt;r.cpp#L86<br>
&gt; &gt; &gt;[3]<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &=
quot;fan1&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &=
quot;fan&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;readPath&quot=
;: &quot;/sys/class/hwmon/hwmon1/fan1_input&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;writePath&quo=
t;: &quot;/sys/class/hwmon/hwmon1/pwm1&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;min&quot;: 0,=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;max&quot;: 25=
5<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &=
quot;temp1&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &=
quot;temp&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;readPath&quot=
;: &quot;/xyz/openbmc_project/sensors/temperature/temp1&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;writePath&quo=
t;: &quot;&quot;,<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;min&quot;: 0,=
<br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;max&quot;: 0<=
br>
&gt; &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; &gt;[4] <a href=3D"https://github.com/openbmc/phosphor-pid-" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-<=
/a><br>
&gt; &gt; &gt;control/commit/75eb769d351434547899186f73ff70ae00d7934a<br>
&gt; &gt; &gt;[5] <a href=3D"https://github.com/openbmc/phosphor-pid-" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-<=
/a><br>
&gt; &gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fan=
controlle<br>
&gt; &gt; &gt;r.cpp#L64<br>
&gt; &gt; &gt;[6] <a href=3D"https://github.com/openbmc/phosphor-pid-" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-pid-<=
/a><br>
&gt; &gt; &gt;control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/db=
uspassi<br>
&gt; &gt; &gt;ve.cpp#L158<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; [1]<br>
&gt; &gt; &gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-pid-"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-p=
id-</a><br>
&gt; &gt; &gt;&gt;control/commit/fc2e803f5d92569<br>
&gt; &gt; &gt;&gt;&gt; 44e18c7c878a441606b1f121c<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; [2]<br>
&gt; &gt; &gt;&gt;&gt; <a href=3D"https://github.com/openbmc/phosphor-pid-"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/openbmc/phosphor-p=
id-</a><br>
&gt; &gt; &gt;&gt;control/blob/a7ec8350d17b70153<br>
&gt; &gt; &gt;&gt;&gt; cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86<br=
>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Thanks,<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Hank Liou<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Quanta Computer Inc.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt;Sincerely,<br>
&gt; &gt; &gt;Hank<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Kun</div></div></d=
iv>

--000000000000ba553f059221e327--
