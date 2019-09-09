Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2500ADDAA
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 18:58:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RvWQ28fdzDqNF
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 02:58:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="mwUpynXy"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RvVp6L3qzDqMG
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 02:58:10 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id x20so1169880plm.9
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 09:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CxskZYDqoSJ5Ov0MOA/ZIC3LR8Rt+T1pDr+qYw/j/jw=;
 b=mwUpynXyCwOLw7lS0YyQ8dy1ddKgYnpLJB7ethfkR1fhdhPW0uE83grR5CpacmH1nN
 c+AjMhP0B05rQuU0wYOQlkcv39Ccl5BPS1SwLimmoPA+m0OOSgGl7ziRVy30piXqViBw
 I3i5jRspQnwowv8Zhtf3UHPIKPQEL/H5AAcjEexVjN0v7Kn723ji7MkFFq4mQ8ks7n/h
 PkT8AzU6g14klq1qwwoG0sU0rCGTiVmeFR+/KnUc+vfQ5w1jrWlFnw5+8KpYLbU/Ru/U
 HZpju0SaaFhC7MCAObtlY5IS2NFQ02ub8XkqS8/zRgHna7iLdeLv7IvdOOJotXNyU/e1
 zSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CxskZYDqoSJ5Ov0MOA/ZIC3LR8Rt+T1pDr+qYw/j/jw=;
 b=RGBBDRHYlhQtD4AarOL3iP86vJLUJZxI7nLprL1NTAfbpxlG7V3y/8sQ/+4aqOrXUc
 uAOko1ycgZLDH9hVy+h9XVVmMU7YYZs9FLBtfJbWjH/zd1MHIq7BsGEu/gUH/alka18o
 WWPUXb7H2MYjs58xj7oOoKLkH/HnOk6qTizEKnYp0tumaaTKoUT9YUpdmdAjs5ZD0g4b
 SnGaf6NpJdnjs7Xh93+en0BpLp29MS5NBADzLTwVF4mQ4nyKfr1VirgVi2bb2jD+Qnjd
 Hfzp28KL1EcL4NygNOwxk9+KZtEXL7FBOVm8nxiNx1RPWCo/BrHUOjYe2Ge6zdpi5KEk
 BzcA==
X-Gm-Message-State: APjAAAVOHbt79ZmnbXs1jiYgjT2cb3THIjxPQ/kGosh7Aqk54wJ3laEg
 BQittvJRkxy9el3vRW47erM/4G14bQfegB+lLghugA==
X-Google-Smtp-Source: APXvYqxGgksIYLN1EByXcpeNdta6Z8gtPxeCPxIHZzWmmFsvEvfAjWlOpJN5d8nKP5uUTKRDHzwhtI9bVuX/pGPWVjc=
X-Received: by 2002:a17:902:7296:: with SMTP id
 d22mr25000996pll.179.1568048287171; 
 Mon, 09 Sep 2019 09:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
 <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
 <02128993d3064b53ac289500746666ab@quantatw.com>
 <dbd75be40e2f4d41a5b621a5dc3b3df7@quantatw.com>
In-Reply-To: <dbd75be40e2f4d41a5b621a5dc3b3df7@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 9 Sep 2019 09:57:56 -0700
Message-ID: <CAO=notzTM-VLV14VdXWSukftABB1Tz4i-ixPOY5qn5cs_0-1Ng@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: =?UTF-8?B?SGFuayBMaW91ICjlionmmYnnv7Ap?= <Hank.Liou@quantatw.com>
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

On Thu, Sep 5, 2019 at 12:25 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Ha=
nk.Liou@quantatw.com> wrote:
>
> Hi Patrick,
>
>
> Sorry for not clearly stating our problem. We have the following issue:
>
>
> temp sensor gets 31(C) -> 31 / 0.255 =3D 121.57 -> pid uses 127.57 as inp=
ut for temp sensor ->
>
> stepwise fan table output 100 duty -> full speed fan

Ok, so you're getting a dbus-based min/max value and you want to
ignore it?  In the json configuration, if you set the values to 0,
they are set to the default (0), so there'd be no clean way to know to
ignore dbus in this case, without adding a small check to only
consider min/max from dbus when sensor is not temp/margin.  Basically,
only care about min/max on dbus if type is "fan"

If that's right, James do you have a cycle to look at this one-liner?

>
>
> As a result, fan will be at full speed while temp is low. Before the comm=
it fc2e803 [1], this won't happen. The root cause is that, before fc2e803, =
pid will use config min/max, which is 0 in our case. This would not trigger=
 scaling function, namely scaleSensorReading, in util.cpp. However, after s=
uch commit, min/max would be non-zero (-128/127 from DBus). This will trigg=
er scaling function.
>
>
> [1] https://github.com/openbmc/phosphor-pid-control/commit/fc2e803f5d9256=
944e18c7c878a441606b1f121c
>
>
> Hank
>
>
> ________________________________
> From: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> Sent: Monday, September 2, 2019 4:52 PM
> To: Patrick Venture
> Cc: James Feist; openbmc@lists.ozlabs.org
> Subject: Re: [phosphor-pid-control] scaling issue
>
>
> Hi Patrick,
>
>
> Since we use phosphor-sel-logger [1] at the same time, we do assign min a=
nd max of temp sensors to Dbus (max: 127, min: -128). So in the present cas=
e, our temp value will be divided by 0.255 (also due to exponent is -3 here=
). This will cause re-scaling problem. Therefore there should be an stateme=
nt to distinguish sensor types. If it is "temp", then one assigns 0 to the =
min and max from Dbus.
>
>
> [1] https://github.com/openbmc/phosphor-sel-logger/blob/3d300fca24b30864b=
3e9a4f5768cfe5e769458ae/include/sensorutils.hpp#L59
>
>
> Hank
>
>
> ________________________________
> From: Patrick Venture <venture@google.com>
> Sent: Friday, August 30, 2019 1:47 AM
> To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> Cc: James Feist; openbmc@lists.ozlabs.org
> Subject: Re: [phosphor-pid-control] scaling issue
>
> PTAL - https://gerrit.openbmc-project.xyz/24827 - this is merged, and
> the srcrev bump should propagate into openbmc/openbmc in a day or two.
>
> On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) =
<Hank.Liou@quantatw.com> wrote:
> >
> > Hi Patrick,
> >
> > I think it's OK to parse the config min&max for temp sensors.
> >
> > Any suggestion?
> >
> > Thanks,
> > Hank
> >
> > >-----Original Message-----
> > >From: openbmc [mailto:openbmc-
> > >bounces+hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf Of Hank L=
iou
> > >(=E5=8A=89=E6=99=89=E7=BF=B0)
> > >Sent: Friday, August 23, 2019 4:31 PM
> > >To: Patrick Venture <venture@google.com>; James Feist
> > ><james.feist@linux.intel.com>
> > >Cc: openbmc@lists.ozlabs.org
> > >Subject: RE: [phosphor-pid-control] scaling issue
> > >
> > >Hi Patrick,
> > >
> > >>-----Original Message-----
> > >>From: Patrick Venture [mailto:venture@google.com]
> > >>Sent: Wednesday, August 21, 2019 10:32 PM
> > >>To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Hank.Liou@quantatw.com>;=
 James Feist
> > >><james.feist@linux.intel.com>
> > >>Cc: openbmc@lists.ozlabs.org
> > >>Subject: Re: [phosphor-pid-control] scaling issue
> > >>
> > >>On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=
=B0)
> > >><Hank.Liou@quantatw.com> wrote:
> > >>>
> > >>> Hi All,
> > >>>
> > >>>
> > >>> After commit [1], I found my temp sensor reading would be re-scaled
> > >>> by
> > >>multiplying 1 over 255, making temperature into unfamiliar unit. Also
> > >>the fan rpm reading would lie in [0,1] interval, letting the fan inpu=
t
> > >>to be 0 (since the input value of fan is from an integer array [2]). =
Are these
> > >normal behaviors?
> > >>Or do I miss something?
> > >>
> > >>Are you using dbus configuration or json?  If json, can you attach yo=
ur config.
> > >>Since you're saying it was working and now isn't, I'm assuming there'=
s
> > >>something about the config being treated differently with the code
> > >>changes in an unexpected way.
> > >
> > >I found pid control will first read min and max from dbus and then (be=
fore
> > >commit [1]) revise them if
> > >
> > >info->min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
> > >
> > >After value initialization, the min and max would be the ones in json =
file (Json
> > >file [3]). However, after commit [1] the min and max values of config =
would
> > >not be fed into the fan control process. The scaling issue is originat=
ed from
> > >commit [4] with the aim to treat fan rpm as percentage. It seems that =
commit
> > >[1] unexpectedly affects temp sensors in the sense that the temp is th=
e
> > >integer reading not percentage. Before commit [1], it would not re-sca=
le the
> > >temp reading since my min and max are 0 [6].
> > >
> > >
> > >
> > >There is another issue with commit [1]. Now the fan rpm would be somet=
hing
> > >like
> > >
> > >1500 / 20000 =3D 0.075
> > >
> > >where rpm max 20000 is from dbus. However the fan input function would
> > >transfer double into int, which is 0 for 0.075 (see [5]). Hence the fa=
n input is 0
> > >not percentage. Is there something wrong?
> > >
> > >[1] https://github.com/openbmc/phosphor-pid-
> > >control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
> > >[2] https://github.com/openbmc/phosphor-pid-
> > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
> > >r.cpp#L86
> > >[3]
> > >       {
> > >            "name": "fan1",
> > >            "type": "fan",
> > >            "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
> > >            "writePath": "/sys/class/hwmon/hwmon1/pwm1",
> > >            "min": 0,
> > >            "max": 255
> > >        },
> > >        {
> > >            "name": "temp1",
> > >            "type": "temp",
> > >            "readPath": "/xyz/openbmc_project/sensors/temperature/temp=
1",
> > >            "writePath": "",
> > >            "min": 0,
> > >            "max": 0
> > >        }
> > >[4] https://github.com/openbmc/phosphor-pid-
> > >control/commit/75eb769d351434547899186f73ff70ae00d7934a
> > >[5] https://github.com/openbmc/phosphor-pid-
> > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
> > >r.cpp#L64
> > >[6] https://github.com/openbmc/phosphor-pid-
> > >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspassi
> > >ve.cpp#L158
> > >
> > >>
> > >>>
> > >>>
> > >>> [1]
> > >>> https://github.com/openbmc/phosphor-pid-
> > >>control/commit/fc2e803f5d92569
> > >>> 44e18c7c878a441606b1f121c
> > >>>
> > >>> [2]
> > >>> https://github.com/openbmc/phosphor-pid-
> > >>control/blob/a7ec8350d17b70153
> > >>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
> > >>>
> > >>>
> > >>> Thanks,
> > >>>
> > >>>
> > >>> Hank Liou
> > >>>
> > >>> Quanta Computer Inc.
> > >>>
> > >>>
> > >
> > >Sincerely,
> > >Hank
