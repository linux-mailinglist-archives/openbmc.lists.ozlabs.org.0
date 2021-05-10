Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52258379486
	for <lists+openbmc@lfdr.de>; Mon, 10 May 2021 18:47:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ff6RL1xg7z2yy4
	for <lists+openbmc@lfdr.de>; Tue, 11 May 2021 02:47:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=sHxuLwsC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=sHxuLwsC; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ff6R25t3lz2y0C
 for <openbmc@lists.ozlabs.org>; Tue, 11 May 2021 02:47:08 +1000 (AEST)
Received: by mail-oi1-x231.google.com with SMTP id n184so16318309oia.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 May 2021 09:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RRTqVlCRHj83KptTdDk63Dn3EIKJt+HiTL6S2e3gxDw=;
 b=sHxuLwsClbeVhPl/Tk2G22D9IIC9My2LAGUuFq9tQGxy0GsXRxiOeqZyCbbm7wx8FD
 N0BEEAFdjo6Lqix8ZjC+u/Z10zrrmUUH8t/6wdUvdTNux93WXd6bsnL+RpxgXe6xkDIQ
 iZlCZ3/Sw6CE4a/9VNI+fiVIXI311nAPgWi+AMK3V/sua8UZsVUtC0NV4E1rhUxO1Sk1
 +kFFy4ZfNldXSFRPRAtqfcuFHb05V/MyE2Bh27sJqkawFubNO9x9xQ+SDmbZgDaOMgMJ
 7loZa+MRH8gSvGIqa9qU2T67sXdPzNrw2F/rSzNEeuaUkvD2RZw76JswMm+TfbknIMH3
 k4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RRTqVlCRHj83KptTdDk63Dn3EIKJt+HiTL6S2e3gxDw=;
 b=oQB4TMntT2LgyYzFIui/KzAK5xG+f8mYnR7DqOmrbPXPV0PSCG5zZzeYtyYXDEQpEu
 RGj90ORBn5YPePlXciGiJsrfZJy0KGmm7epM3ecog+qO8GWH4gP+QiovRf1WgTyUj70p
 fSxKUXRB3Rn4qsdOpeJA7QJWGf0pZOjA3i1f4ChoVzItmjFSDDQ1qRzMcJG/PtSHatlU
 qubMVnkTB3/s8ZaUDZrjg0NhJdqdB0AF6lH1SAt+bXdVFDTnm196EnSla+NX+/0Syaco
 0KYewX/AyrIiFdL0q49rDAFaNk218QlKRMhM1sUSzf7FHtbZCIUJPJCBRyxQtcMaIJq/
 1Ufw==
X-Gm-Message-State: AOAM533xwtjkz+5cuVQgJKGoGdcdLhq7+CMeKBKozUaMlAsZgYjZeW11
 ysHJk9rmyMBiT6K4f4jA9w45EXZ077ozDr0stMY5/w==
X-Google-Smtp-Source: ABdhPJwZu4ydYR37E4QtW4qUeljFGlTD7ZYYuL4umvleogiP14/VpCLphlCzc1qwbP/sRvF4A/l/W08eCZ/v0o9AJXM=
X-Received: by 2002:aca:5c44:: with SMTP id q65mr18219527oib.12.1620665224705; 
 Mon, 10 May 2021 09:47:04 -0700 (PDT)
MIME-Version: 1.0
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
In-Reply-To: <EF3FAEED-549A-426B-8236-79CFAE728411@gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Mon, 10 May 2021 09:46:53 -0700
Message-ID: <CALGRKGM26N+vUdjahXR0L671M2CZGE8o2ochTy7=69vMGDnM0w@mail.gmail.com>
Subject: Re: CI build for quanta/gbs
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000542aa05c1fc87c4"
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>,
 Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000542aa05c1fc87c4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies, one of my old patch that Quanta seemed to have been using was
finally merged (
https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-hwmon/+/24337/) and
it seems like that caused the patch failure you see here.

Here is the fix that should fix the problem:
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43046

Thanks,
Brandon

On Mon, May 10, 2021 at 8:55 AM Andrew Geissler <geissonator@gmail.com>
wrote:

>
>
> > On May 7, 2021, at 7:19 PM, Brandon Kim <brandonkim@google.com> wrote:
> >
> > Hi Andrew,
> >
> > Do you mind kicking off the docker build again for gbs? It looks like
> sslh bump may have  been needed from meta-google
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015
>
> The job runs daily (when new code is available), looks like we=E2=80=99re=
 on to
> something new now?
>
>
> https://jenkins.openbmc.org/job/latest-master/label=3Ddocker-builder,targ=
et=3Dgbs/234/console
>
> 3 out of 5 hunks FAILED -- rejects in file sensor.hpp
> Patch 0001-sensor-Implement-sensor-ASYNC_READ_TIMEOUT.patch does not appl=
y
> (enforce with -f)
>
> stderr:
> ERROR: Logfile of failure stored in:
> /data0/jenkins/workspace/latest-master/label/docker-builder/target/gbs/bu=
ild/work/armv7a-openbmc-linux-gnueabi/phosphor-hwmon/1.0+gitAUTOINC+6d50c3e=
9e1-r1/temp/log.do_patch.19118
>
>
> >
> > Thanks,
> > Brandon
> >
> > On Fri, May 7, 2021 at 11:26 AM Andrew Geissler <geissonator@gmail.com>
> wrote:
> >
> >
> >> On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) =
<George.Hung@quantatw.com>
> wrote:
> >>
> >> Hi Andrew,
> >>
> >> We already fix the patch error for phosphor-hwmon, could you help
> proceed to join the quanta/gbs to CI build ?
> >
> > Hey George, I=E2=80=99ve added it to our daily build, it=E2=80=99s stil=
l not passing for
> gbs though. Please take a look at
> https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,=
target=3Dgbs/
> >
> > Once I see that daily job pass I=E2=80=99ll add it to our official CI j=
ob.
> >
> >>
> >> Thanks a lot.
> >>
> >> Best Regards
> >> George Hung
> >>
> >>
> >> Hi Andrew,
> >>
> >> It looks like it's due to my patch to phosphor-hwmon (which, the repo
> is going through some overhaul and is causing conflicts with). The patch =
in
> question is in the process of getting upstreamed and the repo is settling
> down, so I'll ping you on Discord once it looks ready to be tried again
> (hopefully by end of the week).
> >>
> >> Thanks,
> >> Brandon
> >>
> >> On Thu, May 6, 2021 at 6:38 AM Andrew Geissler <geissonator@gmail.com>
> wrote:
> >>
> >>
> >>
> >> On May 5, 2021, at 2:37 PM, Brandon Kim <brandonkim@google.com> wrote:
> >>
> >> Hi Andrew,
> >>
> >> `gbs` machine will provide meta-google coverage, so it would be great
> if `gbs` could be added in addition to `gsj` instead of as a replacement.
> >>
> >> Is there a shortage of OpenBMC CI nodes by any chance? Google has been
> providing 2 of the OpenBMC CI nodes, so it would be great if adding `gbs`
> could count towards one of those CI nodes.
> >>
> >> Yep, google donates two servers so sounds good. I added it to our dail=
y
> build of master and it looks like it hit a build issue. We can coordinate
> in discord if you like but once we get this figured out, I=E2=80=99ll add=
 it to the
> main openbmc/openbmc CI job.
> >>
> >>
> https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,=
target=3Dgbs/console
> >>
> >>
> >>
> >> Thank you,
> >> Brandon
> >>
> >> On Wed, May 5, 2021 at 10:54 AM Patrick Venture <venture@google.com>
> wrote:
> >> On Wed, May 5, 2021 at 6:25 AM Andrew Geissler <geissonator@gmail.com>
> wrote:
> >> >
> >> >
> >> >
> >> > > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) <
> George.Hung@quantatw.com> wrote:
> >> > >
> >> > > Hi Andrew Geissler,
> >> > >
> >> > > We have ported many OpenBMC features to quanta/gbs machine (Nuvoto=
n
> BMC platform) and hope it could be added to CI build, could you help add
> quanta/gbs machine to CI build verification ? (I'm not familiar with this=
,
> if there's anything we need to do first, please let us know)
> >> >
> >> > Hey George,
> >> >
> >> > Getting a new system into CI doesn=E2=80=99t have the most defined p=
rocess but
> >> > I think in general it has to fall under one of these due to our
> constraints
> >> > in compute power for CI:
> >> >
> >> > 1) Propose an existing system in CI to replace (and the benefits of
> that)
> >> > 2) Donate a jenkins compute node to openbmc CI
> >> > 3) Convince the community that your system provides additional meta-=
*
> >> >     layer coverage (or some other critical benefit) that would be
> worth
> >> >     the additional hit to the existing CI infrastructure.
> >> >
> >> > We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it mak=
e sense to replace
> >> > it with this new =E2=80=9Cgbs=E2=80=9D machine?
> >>
> >> Jumping on this thread to say that I'm hoping to have quanta-gbs
> >> support in upstream qemu shortly --- so we could also enable this as a
> >> Qemu CI machine.
> >>
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
> >
>
>

--0000000000000542aa05c1fc87c4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Apologies, one of my old patch that Quanta seemed to have =
been using was finally merged (<a href=3D"https://gerrit.openbmc-project.xy=
z/c/openbmc/phosphor-hwmon/+/24337/">https://gerrit.openbmc-project.xyz/c/o=
penbmc/phosphor-hwmon/+/24337/</a>) and it seems like that caused the patch=
 failure you see here.<div><br></div><div>Here is the fix that should fix t=
he=C2=A0problem:=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/openb=
mc/openbmc/+/43046">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/=
43046</a></div><div><br></div><div>Thanks,</div><div>Brandon</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, M=
ay 10, 2021 at 8:55 AM Andrew Geissler &lt;<a href=3D"mailto:geissonator@gm=
ail.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><br>
<br>
&gt; On May 7, 2021, at 7:19 PM, Brandon Kim &lt;<a href=3D"mailto:brandonk=
im@google.com" target=3D"_blank">brandonkim@google.com</a>&gt; wrote:<br>
&gt; <br>
&gt; Hi Andrew,<br>
&gt; <br>
&gt; Do you mind kicking off the docker build again for gbs? It looks like =
sslh bump may have=C2=A0 been needed from meta-google <a href=3D"https://ge=
rrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015" rel=3D"noreferrer" targ=
et=3D"_blank">https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015<=
/a><br>
<br>
The job runs daily (when new code is available), looks like we=E2=80=99re o=
n to something new now?<br>
<br>
<a href=3D"https://jenkins.openbmc.org/job/latest-master/label=3Ddocker-bui=
lder,target=3Dgbs/234/console" rel=3D"noreferrer" target=3D"_blank">https:/=
/jenkins.openbmc.org/job/latest-master/label=3Ddocker-builder,target=3Dgbs/=
234/console</a><br>
<br>
3 out of 5 hunks FAILED -- rejects in file sensor.hpp<br>
Patch 0001-sensor-Implement-sensor-ASYNC_READ_TIMEOUT.patch does not apply =
(enforce with -f)<br>
<br>
stderr: <br>
ERROR: Logfile of failure stored in: /data0/jenkins/workspace/latest-master=
/label/docker-builder/target/gbs/build/work/armv7a-openbmc-linux-gnueabi/ph=
osphor-hwmon/1.0+gitAUTOINC+6d50c3e9e1-r1/temp/log.do_patch.19118<br>
<br>
<br>
&gt; <br>
&gt; Thanks,<br>
&gt; Brandon<br>
&gt; <br>
&gt; On Fri, May 7, 2021 at 11:26 AM Andrew Geissler &lt;<a href=3D"mailto:=
geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; wrot=
e:<br>
&gt; <br>
&gt; <br>
&gt;&gt; On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" target=3D"_blank">Geor=
ge.Hung@quantatw.com</a>&gt; wrote:<br>
&gt;&gt; <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; We already fix the patch error for phosphor-hwmon, could you help =
proceed to join the quanta/gbs to CI build ?<br>
&gt; <br>
&gt; Hey George, I=E2=80=99ve added it to our daily build, it=E2=80=99s sti=
ll not passing for gbs though. Please take a look at <a href=3D"https://jen=
kins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,target=3Dgbs/=
" rel=3D"noreferrer" target=3D"_blank">https://jenkins.openbmc.org/job/late=
st-master/233/label=3Ddocker-builder,target=3Dgbs/</a> <br>
&gt; <br>
&gt; Once I see that daily job pass I=E2=80=99ll add it to our official CI =
job.<br>
&gt; <br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Thanks a lot.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Best Regards<br>
&gt;&gt; George Hung<br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; It looks like it&#39;s due to my patch to phosphor-hwmon (which, t=
he repo is going through some overhaul and is causing conflicts with). The =
patch in question is in the process of getting upstreamed and the repo is s=
ettling down, so I&#39;ll ping you on Discord once it looks ready to be tri=
ed again (hopefully by end of the week).<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Thanks,<br>
&gt;&gt; Brandon<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; On Thu, May 6, 2021 at 6:38 AM Andrew Geissler &lt;<a href=3D"mail=
to:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; On May 5, 2021, at 2:37 PM, Brandon Kim &lt;<a href=3D"mailto:bran=
donkim@google.com" target=3D"_blank">brandonkim@google.com</a>&gt; wrote:<b=
r>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Hi Andrew,<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; `gbs` machine will provide meta-google coverage, so it would be gr=
eat if `gbs` could be added in addition to `gsj` instead of as a replacemen=
t.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Is there a shortage of OpenBMC CI nodes by any chance? Google has =
been providing 2 of the OpenBMC CI nodes, so it would be great if adding `g=
bs` could count towards one of those CI nodes.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Yep, google donates two servers so sounds good. I added it to our =
daily build of master and it looks like it hit a build issue. We can coordi=
nate in discord if you like but once we get this figured out, I=E2=80=99ll =
add it to the main openbmc/openbmc CI job.<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; <a href=3D"https://jenkins.openbmc.org/job/latest-master/231/label=
=3Ddocker-builder,target=3Dgbs/console" rel=3D"noreferrer" target=3D"_blank=
">https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,=
target=3Dgbs/console</a><br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; Thank you,<br>
&gt;&gt; Brandon<br>
&gt;&gt;=C2=A0 <br>
&gt;&gt; On Wed, May 5, 2021 at 10:54 AM Patrick Venture &lt;<a href=3D"mai=
lto:venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:=
<br>
&gt;&gt; On Wed, May 5, 2021 at 6:25 AM Andrew Geissler &lt;<a href=3D"mail=
to:geissonator@gmail.com" target=3D"_blank">geissonator@gmail.com</a>&gt; w=
rote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt; On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=
=A0=E6=95=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" target=3D"_bl=
ank">George.Hung@quantatw.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Hi Andrew Geissler,<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; We have ported many OpenBMC features to quanta/gbs machi=
ne (Nuvoton BMC platform) and hope it could be added to CI build, could you=
 help add quanta/gbs machine to CI build verification ? (I&#39;m not famili=
ar with this, if there&#39;s anything we need to do first, please let us kn=
ow)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hey George,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Getting a new system into CI doesn=E2=80=99t have the most de=
fined process but<br>
&gt;&gt; &gt; I think in general it has to fall under one of these due to o=
ur constraints<br>
&gt;&gt; &gt; in compute power for CI:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 1) Propose an existing system in CI to replace (and the benef=
its of that)<br>
&gt;&gt; &gt; 2) Donate a jenkins compute node to openbmc CI<br>
&gt;&gt; &gt; 3) Convince the community that your system provides additiona=
l meta-*<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0layer coverage (or some other critical ben=
efit) that would be worth<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0the additional hit to the existing CI infr=
astructure.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would=
 it make sense to replace<br>
&gt;&gt; &gt; it with this new =E2=80=9Cgbs=E2=80=9D machine?<br>
&gt;&gt; <br>
&gt;&gt; Jumping on this thread to say that I&#39;m hoping to have quanta-g=
bs<br>
&gt;&gt; support in upstream qemu shortly --- so we could also enable this =
as a<br>
&gt;&gt; Qemu CI machine.<br>
&gt;&gt; <br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Thanks a lot.<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; Best Regards<br>
&gt;&gt; &gt; &gt; George Hung<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt; <br>
<br>
</blockquote></div>

--0000000000000542aa05c1fc87c4--
