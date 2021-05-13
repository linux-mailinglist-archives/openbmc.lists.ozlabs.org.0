Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399B37FEEB
	for <lists+openbmc@lfdr.de>; Thu, 13 May 2021 22:23:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fh34y1Stnz303x
	for <lists+openbmc@lfdr.de>; Fri, 14 May 2021 06:23:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=e4pquWtu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235;
 helo=mail-oi1-x235.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=e4pquWtu; dkim-atps=neutral
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fh34f0nPnz2yXt
 for <openbmc@lists.ozlabs.org>; Fri, 14 May 2021 06:22:57 +1000 (AEST)
Received: by mail-oi1-x235.google.com with SMTP id u11so5341570oiv.1
 for <openbmc@lists.ozlabs.org>; Thu, 13 May 2021 13:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fjQBvH5cABBs4Cu4WjWgZ7aB3GNA4v70JEU26Ca6P0U=;
 b=e4pquWtuV7MrqKnxmym7pFnSMUDYE7XibRlFkQlaBWpLzWXV16tvK6F3cxYD1Vywgo
 vlyyYkySjMHY15yddmTxqKarkg9cUoT3i90jwtkExcKc7OrWrMHHfMUWyRud6wzZ7C3R
 xXSuS8CAp13s3tkuDUAuJsZfRhk6B9+uPLbxtjGk3+GDqLw+trUUUJWP8m0CCpkL0eZ1
 1hqYM0vArh4pS0lYRacTOn94FT0n23kQrADZJIyyFc2SleS60ZdUsOs81xZDoORcYGNc
 JGf4ueJseyHjycJgfFNVYxsi1CjZYr4eKI8xUm9drgCr+Kq4T9Ug46fh8UiWoHarV+pE
 kd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=fjQBvH5cABBs4Cu4WjWgZ7aB3GNA4v70JEU26Ca6P0U=;
 b=i3iGSXZyg7PyVFyBEW3Jrudd5wccxgjlkGkaA8/ECy+WfUiVc0pJsf8nmpwtWAsTvf
 720p7JYjYUTrCGOpNIV3pj8ghyGuPMNcIQixaXDFL8dDRYZJbFgpcIt5uHEj6iVdLq8Q
 8kAzwbqXKZiQhdbK1BxzML0GrNia5UyiozSVHJMcKqsQXwQmAQQYEpV/hBowshmsb5oB
 aUi9QKXecToy3rYWqeW+Jkr4T9Olj4Dp0jPqcZvSTGovQ8IVOKfs/da4+gE1NZfve8Wr
 Zfmfk8/tzi41EnfoFQqvIs2gkh4fE6omWs75bzNkwnr2QRVUqppzuEAG3tBF+PHNIgA/
 rIxA==
X-Gm-Message-State: AOAM5311CYb3yWH/llwxnJRMaxBZD0kfCGkjb5OX60C0dxS2toNpjL1t
 Y8am0y/MXtbaNdrOWXn/Oqw=
X-Google-Smtp-Source: ABdhPJxaT39xFo2usxk6PhLoWFSaurmhDepiYbpXSJK6a0k1cs9obfB3l30Zwel5vkJDRO2YDrBM0w==
X-Received: by 2002:aca:dc07:: with SMTP id t7mr4374094oig.164.1620937372488; 
 Thu, 13 May 2021 13:22:52 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:19e0:3310:bccf:81b3:4d4d:3a26])
 by smtp.gmail.com with ESMTPSA id w20sm764655otk.33.2021.05.13.13.22.51
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 May 2021 13:22:52 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.80.0.2.43\))
Subject: Re: CI build for quanta/gbs
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <HK0PR04MB23395928C8737F4177DEFA238F519@HK0PR04MB2339.apcprd04.prod.outlook.com>
Date: Thu, 13 May 2021 15:22:51 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <91B367A6-A92B-4712-8F7A-B12FB6475BFC@gmail.com>
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
 <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
 <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <7DAD0FAA-E02E-4666-846C-1363B45871FD@gmail.com>
 <CALGRKGNyJ3WMd1CO36xD2+o8n3ACqaPpu7XwrnJfF83foFZDPg@mail.gmail.com>
 <EF3FAEED-549A-426B-8236-79CFAE728411@gmail.com>
 <CALGRKGM26N+vUdjahXR0L671M2CZGE8o2ochTy7=69vMGDnM0w@mail.gmail.com>
 <HK0PR04MB23395928C8737F4177DEFA238F519@HK0PR04MB2339.apcprd04.prod.outlook.com>
To: =?utf-8?B?Ikdlb3JnZSBIdW5nICjmtKrlv6DmlawpIg==?= <George.Hung@quantatw.com>
X-Mailer: Apple Mail (2.3654.80.0.2.43)
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
Cc: Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 =?utf-8?B?IkZyYW4gSHN1ICjlvpDoqozorJkpIg==?= <Fran.Hsu@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On May 13, 2021, at 7:47 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) =
<George.Hung@quantatw.com> wrote:
>=20
> Hi Andrew,
> =20
> Sorry to make your inconvenience, we already fix all CI build errors =
and also run CI build locally to make sure it can work fine.

Looks good, I added it to https://jenkins.openbmc.org/job/ci-openbmc/

Andrew

> =20
> Could you help to merge gbs to CI build ?
> =20
> =20
> Thanks a lot.
> =20
> Best Regards
> George Hung
>=20
> =20
> Apologies, one of my old patch that Quanta seemed to have been using =
was finally merged =
(https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337/) =
and it seems like that caused the patch failure you see here.
> =20
> Here is the fix that should fix the problem: =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43046
> =20
> Thanks,
> Brandon
> =20
> On Mon, May 10, 2021 at 8:55 AM Andrew Geissler =
<geissonator@gmail.com> wrote:
>=20
>=20
> > On May 7, 2021, at 7:19 PM, Brandon Kim <brandonkim@google.com> =
wrote:
> >=20
> > Hi Andrew,
> >=20
> > Do you mind kicking off the docker build again for gbs? It looks =
like sslh bump may have  been needed from meta-google =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015
>=20
> The job runs daily (when new code is available), looks like we=E2=80=99r=
e on to something new now?
>=20
> =
https://jenkins.openbmc.org/job/latest-master/label=3Ddocker-builder,targe=
t=3Dgbs/234/console
>=20
> 3 out of 5 hunks FAILED -- rejects in file sensor.hpp
> Patch 0001-sensor-Implement-sensor-ASYNC_READ_TIMEOUT.patch does not =
apply (enforce with -f)
>=20
> stderr:=20
> ERROR: Logfile of failure stored in: =
/data0/jenkins/workspace/latest-master/label/docker-builder/target/gbs/bui=
ld/work/armv7a-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+6d50c3e=
9e1-r1/temp/log.do_patch.19118
>=20
>=20
> >=20
> > Thanks,
> > Brandon
> >=20
> > On Fri, May 7, 2021 at 11:26 AM Andrew Geissler =
<geissonator@gmail.com> wrote:
> >=20
> >=20
> >> On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)=
 <George.Hung@quantatw.com> wrote:
> >>=20
> >> Hi Andrew,
> >> =20
> >> We already fix the patch error for phosphor-hwmon, could you help =
proceed to join the quanta/gbs to CI build ?
> >=20
> > Hey George, I=E2=80=99ve added it to our daily build, it=E2=80=99s =
still not passing for gbs though. Please take a look at =
https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,t=
arget=3Dgbs/=20
> >=20
> > Once I see that daily job pass I=E2=80=99ll add it to our official =
CI job.
> >=20
> >> =20
> >> Thanks a lot.
> >> =20
> >> Best Regards
> >> George Hung
> >>=20
> >> =20
> >> Hi Andrew,
> >> =20
> >> It looks like it's due to my patch to phosphor-hwmon (which, the =
repo is going through some overhaul and is causing conflicts with). The =
patch in question is in the process of getting upstreamed and the repo =
is settling down, so I'll ping you on Discord once it looks ready to be =
tried again (hopefully by end of the week).
> >> =20
> >> Thanks,
> >> Brandon
> >> =20
> >> On Thu, May 6, 2021 at 6:38 AM Andrew Geissler =
<geissonator@gmail.com> wrote:
> >> =20
> >>=20
> >>=20
> >> On May 5, 2021, at 2:37 PM, Brandon Kim <brandonkim@google.com> =
wrote:
> >> =20
> >> Hi Andrew,
> >> =20
> >> `gbs` machine will provide meta-google coverage, so it would be =
great if `gbs` could be added in addition to `gsj` instead of as a =
replacement.
> >> =20
> >> Is there a shortage of OpenBMC CI nodes by any chance? Google has =
been providing 2 of the OpenBMC CI nodes, so it would be great if adding =
`gbs` could count towards one of those CI nodes.
> >> =20
> >> Yep, google donates two servers so sounds good. I added it to our =
daily build of master and it looks like it hit a build issue. We can =
coordinate in discord if you like but once we get this figured out, =
I=E2=80=99ll add it to the main openbmc/openbmc CI job.
> >> =20
> >> =
https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,t=
arget=3Dgbs/console
> >>=20
> >>=20
> >> =20
> >> Thank you,
> >> Brandon
> >> =20
> >> On Wed, May 5, 2021 at 10:54 AM Patrick Venture =
<venture@google.com> wrote:
> >> On Wed, May 5, 2021 at 6:25 AM Andrew Geissler =
<geissonator@gmail.com> wrote:
> >> >
> >> >
> >> >
> >> > > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) <George.Hung@quantatw.com> wrote:
> >> > >
> >> > > Hi Andrew Geissler,
> >> > >
> >> > > We have ported many OpenBMC features to quanta/gbs machine =
(Nuvoton BMC platform) and hope it could be added to CI build, could you =
help add quanta/gbs machine to CI build verification ? (I'm not familiar =
with this, if there's anything we need to do first, please let us know)
> >> >
> >> > Hey George,
> >> >
> >> > Getting a new system into CI doesn=E2=80=99t have the most =
defined process but
> >> > I think in general it has to fall under one of these due to our =
constraints
> >> > in compute power for CI:
> >> >
> >> > 1) Propose an existing system in CI to replace (and the benefits =
of that)
> >> > 2) Donate a jenkins compute node to openbmc CI
> >> > 3) Convince the community that your system provides additional =
meta-*
> >> >     layer coverage (or some other critical benefit) that would be =
worth
> >> >     the additional hit to the existing CI infrastructure.
> >> >
> >> > We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it =
make sense to replace
> >> > it with this new =E2=80=9Cgbs=E2=80=9D machine?
> >>=20
> >> Jumping on this thread to say that I'm hoping to have quanta-gbs
> >> support in upstream qemu shortly --- so we could also enable this =
as a
> >> Qemu CI machine.
> >>=20
> >> >
> >> >
> >> > >
> >> > >
> >> > > Thanks a lot.
> >> > >
> >> > > Best Regards
> >> > > George Hung
> >> > >
> >> >
> >=20
>=20

