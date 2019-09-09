Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C33ADDFB
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 19:24:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Rw5c2xWDzDqQZ
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 03:24:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="CXkyuZwN"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Rw4t0t51zDqLW
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 03:24:13 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y22so9587709pfr.3
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 10:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rib0SP+APdhS5qIqKziiYhd2VqEDI1oDOSZrK15+mlY=;
 b=CXkyuZwNjw9IY/qOnfKDbcp9p6iqAYaXgFuYYAvwftxLnEMYFsg/4ZCh+7UyqkvVuE
 +x4i2yV+MHVFM1omocdrxzz3qnNHsEOFATiJuRH+tO1BAKRb3/9c69OUZIkTGM08L6vd
 DBWo894xfHX312bGdd5VOfD5sDqSm8A1STopnNNK/PYUBvasEj+qxKf2uB2glnbAA1AC
 bzguBEJuKI6prOU5Mav4f4QGZ2k24viwmPy/yKSG2prZuHdwKieUV9HXcXkyaZrp/m1p
 vQ3vYAZq9Qx92r8t8/sd41oZzoCE3HDGDxI3KXsexN0yOfL/lq67ljsyJAcDiu78WZMk
 5pLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rib0SP+APdhS5qIqKziiYhd2VqEDI1oDOSZrK15+mlY=;
 b=LUsljnUHql+LKGX8861GFIJPkHA9wEJ7/fq5SRx6ntEs3ptl2mPGT7FnRg4PEOqj+8
 TTqdRjeI6TWxzILcudSipkRFHC/0qy8PKO03TDT3nUflgGzRbsuz8IfoSamgM37p8rNS
 dY/nIuXPwU7NoocFsUFw1cwFhRLk/7oJ3zkgKGOcK1sOM0JCWZi9l70Rgulccydl51F/
 DQSQ9fInf94ILHlg7BX/7CjoKA+mR0SsTD/WTSqPWBA2VcPr5AI9mYlEOp/x+CqvCAw4
 wJy9qu2DpPz7+2ZAYpnmdO2IVFbP/fAed3xwWbSHzaP1sDnz+p2XCOYLBDTB31pyVqlC
 G0og==
X-Gm-Message-State: APjAAAWfQmIFQVuaV7P4IiHiPrG4OSban1901qbbYVW1jcy9TdFy2n4N
 f14F0TI8A6pF6yMjWxl3BTOyLjxQhQdwQm7DIKDcoQ==
X-Google-Smtp-Source: APXvYqzV5EtF4/4tKSyXEvFoYZMrAeiFNvT42hqwA4yN1zCqsj/c8Igp/9iUSMX9GZCik7tJzT0b1o2vN1lejZGvM68=
X-Received: by 2002:a65:6288:: with SMTP id f8mr22325125pgv.292.1568049850608; 
 Mon, 09 Sep 2019 10:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
 <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
 <02128993d3064b53ac289500746666ab@quantatw.com>
 <dbd75be40e2f4d41a5b621a5dc3b3df7@quantatw.com>
 <CAO=notzTM-VLV14VdXWSukftABB1Tz4i-ixPOY5qn5cs_0-1Ng@mail.gmail.com>
 <CAGMNF6X57Z8HXBLWjUS_dUY-uZ4dWyj5XevGzD+D5Z1RoDKyVA@mail.gmail.com>
In-Reply-To: <CAGMNF6X57Z8HXBLWjUS_dUY-uZ4dWyj5XevGzD+D5Z1RoDKyVA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 10:23:59 -0700
Message-ID: <CAO=notwmC37grf5-OmgGrT5LBza4uoA-QGerRYbpxR1-VdoKbQ@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: Kun Yi <kunyi@google.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Sep 9, 2019 at 10:12 AM Kun Yi <kunyi@google.com> wrote:
>
> Sorry about the regression issue, Hank.
> IIRC I proposed to have separate groups of min/max values in D-Bus and js=
on files since they convey different semantics.
> At the end the min/max value was merged in the current way, because the a=
ssumption that min/max values in json is only used for fan pwm and nothing =
else -- which obviously is not true now.
> Should we revisit the approach? Having something like 'fanPwmScale' as a =
separate config param is a cleaner approach in my opinion.

Kun, it was my understanding that the issue they're seeing is that
they're reading min/max from dbus.  But maybe I have if flipped.

I disagree that fanPwmScale is cleaner because it's now specific to
fan pwm.  In theory, using min/max could have some future purpose.
Perhaps minWrite/maxWrite would be more ... separate.  However, I
think the issue seen is unrelated.

>
> On Mon, Sep 9, 2019 at 9:59 AM Patrick Venture <venture@google.com> wrote=
:
>>
>> On Thu, Sep 5, 2019 at 12:25 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) =
<Hank.Liou@quantatw.com> wrote:
>> >
>> > Hi Patrick,
>> >
>> >
>> > Sorry for not clearly stating our problem. We have the following issue=
:
>> >
>> >
>> > temp sensor gets 31(C) -> 31 / 0.255 =3D 121.57 -> pid uses 127.57 as =
input for temp sensor ->
>> >
>> > stepwise fan table output 100 duty -> full speed fan
>>
>> Ok, so you're getting a dbus-based min/max value and you want to
>> ignore it?  In the json configuration, if you set the values to 0,
>> they are set to the default (0), so there'd be no clean way to know to
>> ignore dbus in this case, without adding a small check to only
>> consider min/max from dbus when sensor is not temp/margin.  Basically,
>> only care about min/max on dbus if type is "fan"
>>
>> If that's right, James do you have a cycle to look at this one-liner?
>>
>> >
>> >
>> > As a result, fan will be at full speed while temp is low. Before the c=
ommit fc2e803 [1], this won't happen. The root cause is that, before fc2e80=
3, pid will use config min/max, which is 0 in our case. This would not trig=
ger scaling function, namely scaleSensorReading, in util.cpp. However, afte=
r such commit, min/max would be non-zero (-128/127 from DBus). This will tr=
igger scaling function.
>> >
>> >
>> > [1] https://github.com/openbmc/phosphor-pid-control/commit/fc2e803f5d9=
256944e18c7c878a441606b1f121c
>> >
>> >
>> > Hank
>> >
>> >
>> > ________________________________
>> > From: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
>> > Sent: Monday, September 2, 2019 4:52 PM
>> > To: Patrick Venture
>> > Cc: James Feist; openbmc@lists.ozlabs.org
>> > Subject: Re: [phosphor-pid-control] scaling issue
>> >
>> >
>> > Hi Patrick,
>> >
>> >
>> > Since we use phosphor-sel-logger [1] at the same time, we do assign mi=
n and max of temp sensors to Dbus (max: 127, min: -128). So in the present =
case, our temp value will be divided by 0.255 (also due to exponent is -3 h=
ere). This will cause re-scaling problem. Therefore there should be an stat=
ement to distinguish sensor types. If it is "temp", then one assigns 0 to t=
he min and max from Dbus.
>> >
>> >
>> > [1] https://github.com/openbmc/phosphor-sel-logger/blob/3d300fca24b308=
64b3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59
>> >
>> >
>> > Hank
>> >
>> >
>> > ________________________________
>> > From: Patrick Venture <venture@google.com>
>> > Sent: Friday, August 30, 2019 1:47 AM
>> > To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
>> > Cc: James Feist; openbmc@lists.ozlabs.org
>> > Subject: Re: [phosphor-pid-control] scaling issue
>> >
>> > PTAL - https://gerrit.openbmc-project.xyz/24827 - this is merged, and
>> > the srcrev bump should propagate into openbmc/openbmc in a day or two.
>> >
>> > On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=
=B0) <Hank.Liou@quantatw.com> wrote:
>> > >
>> > > Hi Patrick,
>> > >
>> > > I think it's OK to parse the config min&max for temp sensors.
>> > >
>> > > Any suggestion?
>> > >
>> > > Thanks,
>> > > Hank
>> > >
>> > > >-----Original Message-----
>> > > >From: openbmc [mailto:openbmc-
>> > > >bounces+hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf Of Han=
k Liou
>> > > >(=E5=8A=89=E6=99=89=E7=BF=B0)
>> > > >Sent: Friday, August 23, 2019 4:31 PM
>> > > >To: Patrick Venture <venture@google.com>; James Feist
>> > > ><james.feist@linux.intel.com>
>> > > >Cc: openbmc@lists.ozlabs.org
>> > > >Subject: RE: [phosphor-pid-control] scaling issue
>> > > >
>> > > >Hi Patrick,
>> > > >
>> > > >>-----Original Message-----
>> > > >>From: Patrick Venture [mailto:venture@google.com]
>> > > >>Sent: Wednesday, August 21, 2019 10:32 PM
>> > > >>To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Hank.Liou@quantatw.co=
m>; James Feist
>> > > >><james.feist@linux.intel.com>
>> > > >>Cc: openbmc@lists.ozlabs.org
>> > > >>Subject: Re: [phosphor-pid-control] scaling issue
>> > > >>
>> > > >>On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=
=BF=B0)
>> > > >><Hank.Liou@quantatw.com> wrote:
>> > > >>>
>> > > >>> Hi All,
>> > > >>>
>> > > >>>
>> > > >>> After commit [1], I found my temp sensor reading would be re-sca=
led
>> > > >>> by
>> > > >>multiplying 1 over 255, making temperature into unfamiliar unit. A=
lso
>> > > >>the fan rpm reading would lie in [0,1] interval, letting the fan i=
nput
>> > > >>to be 0 (since the input value of fan is from an integer array [2]=
). Are these
>> > > >normal behaviors?
>> > > >>Or do I miss something?
>> > > >>
>> > > >>Are you using dbus configuration or json?  If json, can you attach=
 your config.
>> > > >>Since you're saying it was working and now isn't, I'm assuming the=
re's
>> > > >>something about the config being treated differently with the code
>> > > >>changes in an unexpected way.
>> > > >
>> > > >I found pid control will first read min and max from dbus and then =
(before
>> > > >commit [1]) revise them if
>> > > >
>> > > >info->min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
>> > > >
>> > > >After value initialization, the min and max would be the ones in js=
on file (Json
>> > > >file [3]). However, after commit [1] the min and max values of conf=
ig would
>> > > >not be fed into the fan control process. The scaling issue is origi=
nated from
>> > > >commit [4] with the aim to treat fan rpm as percentage. It seems th=
at commit
>> > > >[1] unexpectedly affects temp sensors in the sense that the temp is=
 the
>> > > >integer reading not percentage. Before commit [1], it would not re-=
scale the
>> > > >temp reading since my min and max are 0 [6].
>> > > >
>> > > >
>> > > >
>> > > >There is another issue with commit [1]. Now the fan rpm would be so=
mething
>> > > >like
>> > > >
>> > > >1500 / 20000 =3D 0.075
>> > > >
>> > > >where rpm max 20000 is from dbus. However the fan input function wo=
uld
>> > > >transfer double into int, which is 0 for 0.075 (see [5]). Hence the=
 fan input is 0
>> > > >not percentage. Is there something wrong?
>> > > >
>> > > >[1] https://github.com/openbmc/phosphor-pid-
>> > > >control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
>> > > >[2] https://github.com/openbmc/phosphor-pid-
>> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontro=
lle
>> > > >r.cpp#L86
>> > > >[3]
>> > > >       {
>> > > >            "name": "fan1",
>> > > >            "type": "fan",
>> > > >            "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
>> > > >            "writePath": "/sys/class/hwmon/hwmon1/pwm1",
>> > > >            "min": 0,
>> > > >            "max": 255
>> > > >        },
>> > > >        {
>> > > >            "name": "temp1",
>> > > >            "type": "temp",
>> > > >            "readPath": "/xyz/openbmc_project/sensors/temperature/t=
emp1",
>> > > >            "writePath": "",
>> > > >            "min": 0,
>> > > >            "max": 0
>> > > >        }
>> > > >[4] https://github.com/openbmc/phosphor-pid-
>> > > >control/commit/75eb769d351434547899186f73ff70ae00d7934a
>> > > >[5] https://github.com/openbmc/phosphor-pid-
>> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontro=
lle
>> > > >r.cpp#L64
>> > > >[6] https://github.com/openbmc/phosphor-pid-
>> > > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspass=
i
>> > > >ve.cpp#L158
>> > > >
>> > > >>
>> > > >>>
>> > > >>>
>> > > >>> [1]
>> > > >>> https://github.com/openbmc/phosphor-pid-
>> > > >>control/commit/fc2e803f5d92569
>> > > >>> 44e18c7c878a441606b1f121c
>> > > >>>
>> > > >>> [2]
>> > > >>> https://github.com/openbmc/phosphor-pid-
>> > > >>control/blob/a7ec8350d17b70153
>> > > >>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
>> > > >>>
>> > > >>>
>> > > >>> Thanks,
>> > > >>>
>> > > >>>
>> > > >>> Hank Liou
>> > > >>>
>> > > >>> Quanta Computer Inc.
>> > > >>>
>> > > >>>
>> > > >
>> > > >Sincerely,
>> > > >Hank
>
>
>
> --
> Regards,
> Kun
