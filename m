Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F3A20B1
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 18:22:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K7DQ1jkhzDrg3
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 02:22:14 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="PE8COMKH"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K7Ck1zDtzDrVb
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 02:21:36 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id x15so1838552pgg.8
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mD37pj3KwE4GquhvEd6WLgB+uLkwJ3VOQGoC7CsEHVg=;
 b=PE8COMKHh6yLPVIfAkgr17ADHqN3v6v7bTyj1SyJKlNq2kkbTb1WwFnub3xwXflkZ/
 X+DwnowLI7oruyNa9e6SQhl0yqkyzz7tlbvOnMxuQoUFXhIv+/oLBQsFp7UKAQbjEqdl
 YBoZV1/QN9QRxX4y3CH78h9NPKId7OMElagDqWR3y91EwGdV3BS9nZHCIphYneSnvCk1
 icpyQ+0ztQH1BOHszDTMUoSN2xSDLCC+v8CrVue20ZZyaHHGnIbYroKQr8npicRuAw9W
 VCcSDf1Y3nV6cRGQdBGJhMLXdALzmPxJCLRyH4YnkWr3ArEJM7azGmMPMLujXSERtfwN
 3JaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mD37pj3KwE4GquhvEd6WLgB+uLkwJ3VOQGoC7CsEHVg=;
 b=dKnmB/I/GOtb0Qq1tyAxFFSp9MaYwDviCuKRv9R/Zcy7jdTpLnKVH4vdVkw7tCG2jt
 RHK3ryN/6sm0HNxYuPTeJQ2H3bIzJ6pgp48TKIM8JjeeWlvv/1bV9lJE0YhxC0yKH2dm
 AhRJa3KPo9qngiUbgNlkuw+Fcffc/205TA9x/r6RddjH7kznyD0nEWDE6F893z+XK+0p
 0Yfi3qvtNuLttv7UcppMj58M0FQAAPJswcAYtm2+6hhvkPZNvlxa1eyYO6XDUgHXTEJI
 R3p8V9/o0EHBKbK7gKM2CRDNIg6v6Xr/uNlajo827CZYJGTckjUjiy1xum7UVVOv7GxT
 W4UQ==
X-Gm-Message-State: APjAAAV9ZVxS2ZwfnGCy3bNBlI3pFR5h/8hVZhGsiibR7B0kPAcCKVCB
 FuCb0l8jY/7r+ZI/IsqY9g7ZoITklSSesNQ7ZQEUBw==
X-Google-Smtp-Source: APXvYqznJbk0dFBl5lJGGgtGaFM7PVlfjEZB0iob8mWLAfljU8BWPVf3A9cvrw+1z0dfJZpEC5nnRyb4bmIBQ0rt91E=
X-Received: by 2002:a17:90a:23d0:: with SMTP id
 g74mr11115463pje.115.1567095694463; 
 Thu, 29 Aug 2019 09:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
 <CAO=notyhKih1XaCZEVOOjPUtpQ_y4nnicH+L5ZLEoKWCTvv07Q@mail.gmail.com>
 <580839e8-3185-35e7-7e49-b34cd4981b08@linux.intel.com>
In-Reply-To: <580839e8-3185-35e7-7e49-b34cd4981b08@linux.intel.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Aug 2019 09:21:23 -0700
Message-ID: <CAO=notwk4LgPee=_NjMgyxJseQW5GYHt2juNtzQJ7Gv9m4vHNA@mail.gmail.com>
Subject: Re: [phosphor-pid-control] scaling issue
To: James Feist <james.feist@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Aug 29, 2019 at 9:14 AM James Feist <james.feist@linux.intel.com> w=
rote:
>
> On 8/29/19 7:24 AM, Patrick Venture wrote:
> > On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0=
) <Hank.Liou@quantatw.com> wrote:
> >>
> >> Hi Patrick,
> >>
> >> I think it's OK to parse the config min&max for temp sensors.
> >
> > So, iirc, the min/max in the  json is only for sensors that write, and
> > not read.  Sorry, I'm ramping up on a new team and slower to catch up
> > to emails.
> >
> > Yeah, the min/max in the json are for basically converting a
> > percentage value to a PWM values -- that's its initial goal.
> > Temperature sensors typically don't have minimum and maximum values in
> > the code's use-cases.  I added James to this because they use the
> > daemon for other cases -- where perhaps that'll make sense.
>
> I believe the history of min/max being removed for passive sensors was
> here:
> https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-pid-control/+/23470
>
> The only other use case we have for min / max is for fan RPM so that we
> can create a PID based on Tach %, so that the same PID can be reused on
> multiple platforms with different sized fans.
>
> -James
>
> >
> >>
> >> Any suggestion?
> >>
> >> Thanks,
> >> Hank
> >>
> >>> -----Original Message-----
> >>> From: openbmc [mailto:openbmc-
> >>> bounces+hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf Of Hank =
Liou
> >>> (=E5=8A=89=E6=99=89=E7=BF=B0)
> >>> Sent: Friday, August 23, 2019 4:31 PM
> >>> To: Patrick Venture <venture@google.com>; James Feist
> >>> <james.feist@linux.intel.com>
> >>> Cc: openbmc@lists.ozlabs.org
> >>> Subject: RE: [phosphor-pid-control] scaling issue
> >>>
> >>> Hi Patrick,
> >>>
> >>>> -----Original Message-----
> >>>> From: Patrick Venture [mailto:venture@google.com]
> >>>> Sent: Wednesday, August 21, 2019 10:32 PM
> >>>> To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Hank.Liou@quantatw.com>=
; James Feist
> >>>> <james.feist@linux.intel.com>
> >>>> Cc: openbmc@lists.ozlabs.org
> >>>> Subject: Re: [phosphor-pid-control] scaling issue
> >>>>
> >>>> On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=
=B0)
> >>>> <Hank.Liou@quantatw.com> wrote:
> >>>>>
> >>>>> Hi All,
> >>>>>
> >>>>>
> >>>>> After commit [1], I found my temp sensor reading would be re-scaled
> >>>>> by
> >>>> multiplying 1 over 255, making temperature into unfamiliar unit. Als=
o
> >>>> the fan rpm reading would lie in [0,1] interval, letting the fan inp=
ut
> >>>> to be 0 (since the input value of fan is from an integer array [2]).=
 Are these
> >>> normal behaviors?
> >>>> Or do I miss something?
> >>>>
> >>>> Are you using dbus configuration or json?  If json, can you attach y=
our config.
> >>>> Since you're saying it was working and now isn't, I'm assuming there=
's
> >>>> something about the config being treated differently with the code
> >>>> changes in an unexpected way.
> >>>
> >>> I found pid control will first read min and max from dbus and then (b=
efore
> >>> commit [1]) revise them if
> >>>
> >>> info->min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
> >>>
> >>> After value initialization, the min and max would be the ones in json=
 file (Json
> >>> file [3]). However, after commit [1] the min and max values of config=
 would
> >>> not be fed into the fan control process. The scaling issue is origina=
ted from
> >>> commit [4] with the aim to treat fan rpm as percentage. It seems that=
 commit
> >>> [1] unexpectedly affects temp sensors in the sense that the temp is t=
he
> >>> integer reading not percentage. Before commit [1], it would not re-sc=
ale the
> >>> temp reading since my min and max are 0 [6].
> >>>
> >>>
> >>>
> >>> There is another issue with commit [1]. Now the fan rpm would be some=
thing
> >>> like
> >>>
> >>> 1500 / 20000 =3D 0.075
> >>>
> >>> where rpm max 20000 is from dbus. However the fan input function woul=
d
> >>> transfer double into int, which is 0 for 0.075 (see [5]). Hence the f=
an input is 0
> >>> not percentage. Is there something wrong?
> >>>
> >>> [1] https://github.com/openbmc/phosphor-pid-
> >>> control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
> >>> [2] https://github.com/openbmc/phosphor-pid-
> >>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontroll=
e
> >>> r.cpp#L86
> >>> [3]
> >>>        {
> >>>             "name": "fan1",
> >>>             "type": "fan",
> >>>             "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
> >>>             "writePath": "/sys/class/hwmon/hwmon1/pwm1",
> >>>             "min": 0,
> >>>             "max": 255
> >>>         },
> >>>         {
> >>>             "name": "temp1",
> >>>             "type": "temp",
> >>>             "readPath": "/xyz/openbmc_project/sensors/temperature/tem=
p1",
> >>>             "writePath": "",
> >>>             "min": 0,
> >>>             "max": 0
> >>>         }
> >>> [4] https://github.com/openbmc/phosphor-pid-
> >>> control/commit/75eb769d351434547899186f73ff70ae00d7934a
> >>> [5] https://github.com/openbmc/phosphor-pid-
> >>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontroll=
e
> >>> r.cpp#L64
> >>> [6] https://github.com/openbmc/phosphor-pid-
> >>> control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspassi
> >>> ve.cpp#L158
> >>>
> >>>>
> >>>>>
> >>>>>
> >>>>> [1]
> >>>>> https://github.com/openbmc/phosphor-pid-
> >>>> control/commit/fc2e803f5d92569
> >>>>> 44e18c7c878a441606b1f121c
> >>>>>
> >>>>> [2]
> >>>>> https://github.com/openbmc/phosphor-pid-
> >>>> control/blob/a7ec8350d17b70153
> >>>>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
> >>>>>
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>
> >>>>> Hank Liou
> >>>>>
> >>>>> Quanta Computer Inc.
> >>>>>
> >>>>>
> >>>
> >>> Sincerely,
> >>> Hank

Hank, do you need to use the min/max on the temperature sensors?  Try
your build with those entries deleted from the json file (they're
optional).

James, I think I should add a warning and ignore those fields in that
case.  What do you think?  (I honestly thought they were already
ignored for temperature sensors -- have to look at the code to
verify).
