Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3393EA22B2
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 19:48:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46K97b40HlzDrpw
	for <lists+openbmc@lfdr.de>; Fri, 30 Aug 2019 03:48:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="V+N+Y6oV"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46K96v1mJ8zDrjG
 for <openbmc@lists.ozlabs.org>; Fri, 30 Aug 2019 03:47:34 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id c81so2543648pfc.11
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NVXTXEKY9Cx+/XycugBexjYav7Rqmn4wNrVct93I0oc=;
 b=V+N+Y6oVxC+3DsgcwdmHTA34pomCAfNJ/OiUPfG8uDk1Ia4UO5qICjGTpNQkPAY/1Z
 Dromj2jsWndeTxe/HAgrpSb6r5UuwoYK2r0Vh0kSlFCaY7Tp1rA6Rm8ltN9Jii1/Bx6p
 V+9yqLLaGaVKUAl3XSjseyN4cecI1pQ1V6tGlo55B0SplidDngOp6oDciASFQSkTEHdx
 7lApnK5pnJDYxYbVLomHn58vqA973lvXcZS6patnb6AcO2MaRYLjylllaj19eLXI0Nv4
 Ha9lt75Y/LDahi4cX/LKmpYpnAMgjHOLfD9Whu+8vbmulHO99HbulxP7arBdwDWuCy0k
 RKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NVXTXEKY9Cx+/XycugBexjYav7Rqmn4wNrVct93I0oc=;
 b=WKMsNsUmmJH/a71TzabXoLAAbJhx6+3L/6FmuAgLoxd+HvM5895dnkIpT6214WQ7Ix
 n+KZMegexuu9vSho1Qgc2Cu5EJF+boH2c7SBH22puSCDcZ6XFI2C8weiNRo5YSvbS0JL
 gyjj/Eu/yeRG7HULqjDZLkI03HX80ePlo1WAjXdlH2pLF4EyBmHj6wTA5jO3eYanlp1I
 IAqzIPXxoL8OxEW1K2wwE6glyCuA+xYWpTjKmWwVOWfYyoXuG5oKBwznkpiWTFZmDyJD
 xiNI9JrerrYfuepPJyTai7XvS0Rl3b7ySWORgPunrp8oGkHLV1nUGh4VrUfhY2JCakUa
 ngdw==
X-Gm-Message-State: APjAAAVBmVTNLcOcQVYpo7NGgloOPtof1BkGLb2Hme9iMbQRCNLg9fKE
 mP9i6l+D28GxZs9iqhLcwltyZOu1YO8u1822MBbUKA==
X-Google-Smtp-Source: APXvYqwVjUcbtDJRj8YQMRNRxGqJD5jOuFd4sjr2FD0mUfjhbciHvunSMS0b8vTwTFbEHQvDv2JIsKQsGs+XJIVI7D4=
X-Received: by 2002:a63:1f1f:: with SMTP id f31mr7041505pgf.353.1567100851074; 
 Thu, 29 Aug 2019 10:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <ce541dfc04cd4b879648c214efc74635@quantatw.com>
 <CAO=notz7XMi0i1TWM1t4H3GL1PC=H24wKY0_smJin1CAYVYSaQ@mail.gmail.com>
 <369926533c3e448c9d1a0d28391fd688@quantatw.com>
 <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
In-Reply-To: <af485fc0d2c44f3e8927290ff6c95ea0@quantatw.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Aug 2019 10:47:19 -0700
Message-ID: <CAO=notwuxuWKeKMY8mnse1wY1Nt6GNx4rcxHDokqXtkzyoLYYQ@mail.gmail.com>
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

PTAL - https://gerrit.openbmc-project.xyz/24827 - this is merged, and
the srcrev bump should propagate into openbmc/openbmc in a day or two.

On Wed, Aug 28, 2019 at 11:00 PM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <H=
ank.Liou@quantatw.com> wrote:
>
> Hi Patrick,
>
> I think it's OK to parse the config min&max for temp sensors.
>
> Any suggestion?
>
> Thanks,
> Hank
>
> >-----Original Message-----
> >From: openbmc [mailto:openbmc-
> >bounces+hank.liou=3Dquantatw.com@lists.ozlabs.org] On Behalf Of Hank Lio=
u
> >(=E5=8A=89=E6=99=89=E7=BF=B0)
> >Sent: Friday, August 23, 2019 4:31 PM
> >To: Patrick Venture <venture@google.com>; James Feist
> ><james.feist@linux.intel.com>
> >Cc: openbmc@lists.ozlabs.org
> >Subject: RE: [phosphor-pid-control] scaling issue
> >
> >Hi Patrick,
> >
> >>-----Original Message-----
> >>From: Patrick Venture [mailto:venture@google.com]
> >>Sent: Wednesday, August 21, 2019 10:32 PM
> >>To: Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0) <Hank.Liou@quantatw.com>; J=
ames Feist
> >><james.feist@linux.intel.com>
> >>Cc: openbmc@lists.ozlabs.org
> >>Subject: Re: [phosphor-pid-control] scaling issue
> >>
> >>On Wed, Aug 21, 2019 at 1:11 AM Hank Liou (=E5=8A=89=E6=99=89=E7=BF=B0)
> >><Hank.Liou@quantatw.com> wrote:
> >>>
> >>> Hi All,
> >>>
> >>>
> >>> After commit [1], I found my temp sensor reading would be re-scaled
> >>> by
> >>multiplying 1 over 255, making temperature into unfamiliar unit. Also
> >>the fan rpm reading would lie in [0,1] interval, letting the fan input
> >>to be 0 (since the input value of fan is from an integer array [2]). Ar=
e these
> >normal behaviors?
> >>Or do I miss something?
> >>
> >>Are you using dbus configuration or json?  If json, can you attach your=
 config.
> >>Since you're saying it was working and now isn't, I'm assuming there's
> >>something about the config being treated differently with the code
> >>changes in an unexpected way.
> >
> >I found pid control will first read min and max from dbus and then (befo=
re
> >commit [1]) revise them if
> >
> >info->min !=3D conf::inheritValueFromDbus (in dbus/dbuspassive.cpp)
> >
> >After value initialization, the min and max would be the ones in json fi=
le (Json
> >file [3]). However, after commit [1] the min and max values of config wo=
uld
> >not be fed into the fan control process. The scaling issue is originated=
 from
> >commit [4] with the aim to treat fan rpm as percentage. It seems that co=
mmit
> >[1] unexpectedly affects temp sensors in the sense that the temp is the
> >integer reading not percentage. Before commit [1], it would not re-scale=
 the
> >temp reading since my min and max are 0 [6].
> >
> >
> >
> >There is another issue with commit [1]. Now the fan rpm would be somethi=
ng
> >like
> >
> >1500 / 20000 =3D 0.075
> >
> >where rpm max 20000 is from dbus. However the fan input function would
> >transfer double into int, which is 0 for 0.075 (see [5]). Hence the fan =
input is 0
> >not percentage. Is there something wrong?
> >
> >[1] https://github.com/openbmc/phosphor-pid-
> >control/commit/fc2e803f5d9256944e18c7c878a441606b1f121c
> >[2] https://github.com/openbmc/phosphor-pid-
> >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
> >r.cpp#L86
> >[3]
> >       {
> >            "name": "fan1",
> >            "type": "fan",
> >            "readPath": "/sys/class/hwmon/hwmon1/fan1_input",
> >            "writePath": "/sys/class/hwmon/hwmon1/pwm1",
> >            "min": 0,
> >            "max": 255
> >        },
> >        {
> >            "name": "temp1",
> >            "type": "temp",
> >            "readPath": "/xyz/openbmc_project/sensors/temperature/temp1"=
,
> >            "writePath": "",
> >            "min": 0,
> >            "max": 0
> >        }
> >[4] https://github.com/openbmc/phosphor-pid-
> >control/commit/75eb769d351434547899186f73ff70ae00d7934a
> >[5] https://github.com/openbmc/phosphor-pid-
> >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/pid/fancontrolle
> >r.cpp#L64
> >[6] https://github.com/openbmc/phosphor-pid-
> >control/blob/a7ec8350d17b70153cebe666d3fbe88bddd02a1a/dbus/dbuspassi
> >ve.cpp#L158
> >
> >>
> >>>
> >>>
> >>> [1]
> >>> https://github.com/openbmc/phosphor-pid-
> >>control/commit/fc2e803f5d92569
> >>> 44e18c7c878a441606b1f121c
> >>>
> >>> [2]
> >>> https://github.com/openbmc/phosphor-pid-
> >>control/blob/a7ec8350d17b70153
> >>> cebe666d3fbe88bddd02a1a/pid/fancontroller.cpp#L86
> >>>
> >>>
> >>> Thanks,
> >>>
> >>>
> >>> Hank Liou
> >>>
> >>> Quanta Computer Inc.
> >>>
> >>>
> >
> >Sincerely,
> >Hank
