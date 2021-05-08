Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F69A376DA5
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 02:19:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcScr4qkFz2ymQ
	for <lists+openbmc@lfdr.de>; Sat,  8 May 2021 10:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=aSeF5lEM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32d;
 helo=mail-ot1-x32d.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=aSeF5lEM; dkim-atps=neutral
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FcScY5MCNz2yWS
 for <openbmc@lists.ozlabs.org>; Sat,  8 May 2021 10:19:38 +1000 (AEST)
Received: by mail-ot1-x32d.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so9379734otf.12
 for <openbmc@lists.ozlabs.org>; Fri, 07 May 2021 17:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlGCoxS4XtbmF803L0JmlfS6FSJQEUCZg9SYqVKQ/RM=;
 b=aSeF5lEMpCySMSdvVyUxLN1TIv/b/3/LE4NAIdYPDJi9DFxx3wal60HKRqH8nB2qkI
 UkjEfsOcXgs0Soz+EED5Pked7zYGwl5eGCvHgJoh8Fx8UL2ANeUeWHCIqGtdyzhXtTzS
 krlMym9ul+3TUvC9M8CoTeKDPm71OoqS4YNUPsx+W/4d049C++lWLBbnp9KOz1d89gGn
 xfL9+nYuUcLkRmWG+LaRLJCZL8wcsMFoaNoMIZfQIeR7WcmRxz+bRFWEfKxkmSew+z1d
 2+p9CoBatr68mIe+INIDYIJHYdVQz/1b/qoigErbBOHhJQNHmMdW7iME6vR2soYQwJAf
 h3fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlGCoxS4XtbmF803L0JmlfS6FSJQEUCZg9SYqVKQ/RM=;
 b=TXdU5PmL97DlTZbOSOTpKxiHp/9a4Dm0MNqmJiFy4ycj1944BW4wL57Sn0oSJhVNri
 0Xzr2Cs0Nupce53kj7I9dHT+ypdIh2qs8Zd2hkOV0ceUUqyJ+4QHY/Cb5BtRW+UIiMFq
 Fpc1UQRAJIj6YclBxOrRM+5bgeXeki9rK/sWMYYSyq5QZcu8bh3E8okslt9dZGjFDQq/
 sRE0X1uhq5WRujWoBhfuNVZF/yJmmyvpshSHl0l0xbP6kwBC53VKOyEvGqNGZnl9Hj4j
 oRNEUwQO3RJGpAayI84YgVaDIE6CpnT6shempeLmsd9xW1VpNXtOrg0q39oROTdq4iUN
 yBzA==
X-Gm-Message-State: AOAM532pLWbL23Ej2FTQmRQBU4gZenixkgTkloIg5SGn3k63RTGr0pC9
 aMs933zxxvPMiZy6KLFox4sikeG8c2QI5Ql1MjR8eA==
X-Google-Smtp-Source: ABdhPJwpBEkNYavnMmYdOlEdkRxPZTT2QTt2Yht0pEFcWzo/uwdVbn8egoqmvoQrkYknXm/HjvbjzQgHnJjbWRtS1D4=
X-Received: by 2002:a05:6830:33ea:: with SMTP id
 i10mr10347179otu.212.1620433172564; 
 Fri, 07 May 2021 17:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
 <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
 <HK0PR04MB233989F62E1F9CE2C61AC99B8F579@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <7DAD0FAA-E02E-4666-846C-1363B45871FD@gmail.com>
In-Reply-To: <7DAD0FAA-E02E-4666-846C-1363B45871FD@gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Fri, 7 May 2021 17:19:19 -0700
Message-ID: <CALGRKGNyJ3WMd1CO36xD2+o8n3ACqaPpu7XwrnJfF83foFZDPg@mail.gmail.com>
Subject: Re: CI build for quanta/gbs
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000a27e8f05c1c67fb7"
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

--000000000000a27e8f05c1c67fb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Do you mind kicking off the docker build again for gbs? It looks like sslh
bump may have  been needed from meta-google
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/43015

Thanks,
Brandon

On Fri, May 7, 2021 at 11:26 AM Andrew Geissler <geissonator@gmail.com>
wrote:

>
>
> On May 7, 2021, at 2:10 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) <Ge=
orge.Hung@quantatw.com>
> wrote:
>
> Hi Andrew,
>
> We already fix the patch error for phosphor-hwmon, could you help proceed
> to join the quanta/gbs to CI build ?
>
>
> Hey George, I=E2=80=99ve added it to our daily build, it=E2=80=99s still =
not passing for
> gbs though. Please take a look at
> https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,=
target=3Dgbs/
>
>
> Once I see that daily job pass I=E2=80=99ll add it to our official CI job=
.
>
>
> Thanks a lot.
>
> Best Regards
> George Hung
>
>
> Hi Andrew,
>
> It looks like it's due to my patch to phosphor-hwmon (which, the repo is
> going through some overhaul and is causing conflicts with). The patch in
> question is in the process of getting upstreamed and the repo is settling
> down, so I'll ping you on Discord once it looks ready to be tried again
> (hopefully by end of the week).
>
> Thanks,
> Brandon
>
> On Thu, May 6, 2021 at 6:38 AM Andrew Geissler <geissonator@gmail.com>
> wrote:
>
>
>
>
> On May 5, 2021, at 2:37 PM, Brandon Kim <brandonkim@google.com> wrote:
>
> Hi Andrew,
>
> `gbs` machine will provide meta-google coverage, so it would be great if
> `gbs` could be added in addition to `gsj` instead of as a replacement.
>
> Is there a shortage of OpenBMC CI nodes by any chance? Google has been
> providing 2 of the OpenBMC CI nodes, so it would be great if adding `gbs`
> could count towards one of those CI nodes.
>
>
> Yep, google donates two servers so sounds good. I added it to our daily
> build of master and it looks like it hit a build issue. We can coordinate
> in discord if you like but once we get this figured out, I=E2=80=99ll add=
 it to the
> main openbmc/openbmc CI job.
>
>
> https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-builder,=
target=3Dgbs/console
> <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fjenk=
ins.openbmc.org%2Fjob%2Flatest-master%2F231%2Flabel%3Ddocker-builder%2Ctarg=
et%3Dgbs%2Fconsole&data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7C5daa46384b=
4e4cebf7f908d910a4efb6%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C6375591=
22843370643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&sdata=3DuFv0h2aHwSVlOU6o330pT9hnRO9i5fYc=
21nUH1Y3ly4%3D&reserved=3D0>
>
>
>
> Thank you,
> Brandon
>
> On Wed, May 5, 2021 at 10:54 AM Patrick Venture <venture@google.com>
> wrote:
>
> On Wed, May 5, 2021 at 6:25 AM Andrew Geissler <geissonator@gmail.com>
> wrote:
> >
> >
> >
> > > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC)=
 <
> George.Hung@quantatw.com> wrote:
> > >
> > > Hi Andrew Geissler,
> > >
> > > We have ported many OpenBMC features to quanta/gbs machine (Nuvoton
> BMC platform) and hope it could be added to CI build, could you help add
> quanta/gbs machine to CI build verification ? (I'm not familiar with this=
,
> if there's anything we need to do first, please let us know)
> >
> > Hey George,
> >
> > Getting a new system into CI doesn=E2=80=99t have the most defined proc=
ess but
> > I think in general it has to fall under one of these due to our
> constraints
> > in compute power for CI:
> >
> > 1) Propose an existing system in CI to replace (and the benefits of tha=
t)
> > 2) Donate a jenkins compute node to openbmc CI
> > 3) Convince the community that your system provides additional meta-*
> >     layer coverage (or some other critical benefit) that would be worth
> >     the additional hit to the existing CI infrastructure.
> >
> > We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make s=
ense to replace
> > it with this new =E2=80=9Cgbs=E2=80=9D machine?
>
> Jumping on this thread to say that I'm hoping to have quanta-gbs
> support in upstream qemu shortly --- so we could also enable this as a
> Qemu CI machine.
>
> >
> >
> > >
> > >
> > > Thanks a lot.
> > >
> > > Best Regards
> > > George Hung
> > >
> >
>
>
>

--000000000000a27e8f05c1c67fb7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div>Do you mind kicking off the =
docker build again for gbs? It looks like sslh bump may have=C2=A0 been nee=
ded from meta-google=C2=A0<a href=3D"https://gerrit.openbmc-project.xyz/c/o=
penbmc/openbmc/+/43015">https://gerrit.openbmc-project.xyz/c/openbmc/openbm=
c/+/43015</a></div><div><br></div><div>Thanks,</div><div>Brandon</div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, May 7, 2021 at 11:26 AM Andrew Geissler &lt;<a href=3D"mailto:geissonato=
r@gmail.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;"=
><br><div><br><blockquote type=3D"cite"><div>On May 7, 2021, at 2:10 AM, Ge=
orge Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC) &lt;<a href=3D"mailto:George.Hung@q=
uantatw.com" target=3D"_blank">George.Hung@quantatw.com</a>&gt; wrote:</div=
><br><div><div style=3D"font-family:Helvetica;font-size:12px;font-style:nor=
mal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;text-decoration:none"><div style=3D"border-style:none none none so=
lid;border-left-width:1.5pt;border-left-color:blue;padding:0cm 0cm 0cm 4pt"=
><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS =
PGothic&quot;,sans-serif"><span lang=3D"EN-US" style=3D"font-family:Calibri=
,sans-serif">Hi Andrew,<u></u><u></u></span></div><div style=3D"margin:0cm =
0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif">=
<span lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif"><u></u>=C2=A0=
<u></u></span></div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;fo=
nt-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US" style=3D"=
font-family:Calibri,sans-serif">We already fix the patch error for phosphor=
-hwmon, could you help proceed to join the quanta/gbs to CI build ?</span><=
/div></div></div></div></blockquote><div><br></div><div>Hey George, I=E2=80=
=99ve added it to our daily build, it=E2=80=99s still not passing for gbs t=
hough. Please take a look at=C2=A0<a href=3D"https://jenkins.openbmc.org/jo=
b/latest-master/233/label=3Ddocker-builder,target=3Dgbs/" target=3D"_blank"=
>https://jenkins.openbmc.org/job/latest-master/233/label=3Ddocker-builder,t=
arget=3Dgbs/</a>=C2=A0</div><div><br></div><div>Once I see that daily job p=
ass I=E2=80=99ll add it to our official CI job.</div><br><blockquote type=
=3D"cite"><div><div style=3D"font-family:Helvetica;font-size:12px;font-styl=
e:normal;font-variant-caps:normal;font-weight:normal;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;text-decoration:none"><div style=3D"border-style:none none no=
ne solid;border-left-width:1.5pt;border-left-color:blue;padding:0cm 0cm 0cm=
 4pt"><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quo=
t;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US" style=3D"font-family:Ca=
libri,sans-serif"><u></u><u></u></span></div><div style=3D"margin:0cm 0cm 0=
.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span=
 lang=3D"EN-US" style=3D"font-family:Calibri,sans-serif"><u></u>=C2=A0<u></=
u></span></div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-fa=
mily:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US" style=3D"font-=
family:Calibri,sans-serif">Thanks a lot.<u></u><u></u></span></div><div sty=
le=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&q=
uot;,sans-serif"><span lang=3D"EN-US" style=3D"font-family:Calibri,sans-ser=
if"><u></u>=C2=A0<u></u></span></div><div style=3D"margin:0cm 0cm 0.0001pt;=
font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D=
"EN-US" style=3D"font-family:Calibri,sans-serif">Best Regards<br>George Hun=
g<br><br><u></u><u></u></span></div><div style=3D"margin:0cm 0cm 0.0001pt;f=
ont-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"=
EN-US" style=3D"font-family:Calibri,sans-serif"><u></u>=C2=A0<u></u></span>=
</div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family=
:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">Hi Andrew,<u></u><=
u></u></span></div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12p=
t;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></=
u>=C2=A0<u></u></span></div></div><div><div style=3D"margin:0cm 0cm 0.0001p=
t;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=
=3D"EN-US">It looks like it&#39;s due to my patch to phosphor-hwmon (which,=
 the repo is going through some overhaul and is causing conflicts with). Th=
e patch in question is in the process=C2=A0of getting upstreamed and the re=
po is settling down, so I&#39;ll ping you on Discord once it looks ready to=
 be tried again (hopefully by end of the week).<u></u><u></u></span></div><=
/div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:=
&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u=
></span></div></div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12=
pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">Than=
ks,<u></u><u></u></span></div></div><div><div style=3D"margin:0cm 0cm 0.000=
1pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lan=
g=3D"EN-US">Brandon<u></u><u></u></span></div></div></div><div style=3D"mar=
gin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans=
-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></div><div><div><di=
v style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGot=
hic&quot;,sans-serif"><span lang=3D"EN-US">On Thu, May 6, 2021 at 6:38 AM A=
ndrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" style=3D"color:=
purple;text-decoration:underline" target=3D"_blank">geissonator@gmail.com</=
a>&gt; wrote:<u></u><u></u></span></div></div><blockquote style=3D"border-s=
tyle:none none none solid;border-left-width:1pt;border-left-color:rgb(204,2=
04,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm"><div><d=
iv style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGo=
thic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></di=
v><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&qu=
ot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><br><br><u></u><u></u>=
</span></div><blockquote style=3D"margin-top:5pt;margin-bottom:5pt"><div><d=
iv style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGo=
thic&quot;,sans-serif"><span lang=3D"EN-US">On May 5, 2021, at 2:37 PM, Bra=
ndon Kim &lt;<a href=3D"mailto:brandonkim@google.com" style=3D"color:purple=
;text-decoration:underline" target=3D"_blank">brandonkim@google.com</a>&gt;=
 wrote:<u></u><u></u></span></div></div><div style=3D"margin:0cm 0cm 0.0001=
pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=
=3D"EN-US"><u></u>=C2=A0<u></u></span></div><div><div><div style=3D"margin:=
0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-ser=
if"><span lang=3D"EN-US">Hi Andrew,<u></u><u></u></span></div><div><div sty=
le=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&q=
uot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></div></di=
v><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&qu=
ot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">`gbs` machine will pro=
vide meta-google coverage, so it would be great if `gbs` could be added in =
addition to `gsj` instead of as a replacement.<u></u><u></u></span></div></=
div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&=
quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u>=
</span></div></div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12p=
t;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">Is th=
ere a shortage of OpenBMC CI nodes by any chance? Google has been providing=
 2 of the OpenBMC CI nodes, so it would be great if adding `gbs` could coun=
t towards one of those CI nodes.<u></u><u></u></span></div></div></div></di=
v></blockquote><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;fo=
nt-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=
=C2=A0<u></u></span></div></div><div><div style=3D"margin:0cm 0cm 0.0001pt;=
font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D=
"EN-US">Yep, google donates two servers so sounds good. I added it to our d=
aily build of master and it looks like it hit a build issue. We can coordin=
ate in discord if you like but once we get this figured out, I=E2=80=99ll a=
dd it to the main openbmc/openbmc CI job.<u></u><u></u></span></div></div><=
div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;=
MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></spa=
n></div></div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;fon=
t-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><a href=3D=
"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fjenkin=
s.openbmc.org%2Fjob%2Flatest-master%2F231%2Flabel%3Ddocker-builder%2Ctarget=
%3Dgbs%2Fconsole&amp;data=3D04%7C01%7CGeorge.Hung%40quantatw.com%7C5daa4638=
4b4e4cebf7f908d910a4efb6%7C179b032707fc4973ac738de7313561b2%7C1%7C0%7C63755=
9122843370643%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DuFv0h2aHwSVlOU6o330pT9hnRO=
9i5fYc21nUH1Y3ly4%3D&amp;reserved=3D0" style=3D"color:purple;text-decoratio=
n:underline" target=3D"_blank">https://jenkins.openbmc.org/job/latest-maste=
r/231/label=3Ddocker-builder,target=3Dgbs/console</a><u></u><u></u></span><=
/div></div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family=
:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><br><br><u></u><u>=
</u></span></div><blockquote style=3D"margin-top:5pt;margin-bottom:5pt"><di=
v><div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-famil=
y:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u><=
/u></span></div></div><div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:=
12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">Th=
ank you,<u></u><u></u></span></div></div><div><div style=3D"margin:0cm 0cm =
0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quot;,sans-serif"><spa=
n lang=3D"EN-US">Brandon<u></u><u></u></span></div></div></div><div style=
=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothic&quo=
t;,sans-serif"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></div><div><=
div><div style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;=
MS PGothic&quot;,sans-serif"><span lang=3D"EN-US">On Wed, May 5, 2021 at 10=
:54 AM Patrick Venture &lt;<a href=3D"mailto:venture@google.com" style=3D"c=
olor:purple;text-decoration:underline" target=3D"_blank">venture@google.com=
</a>&gt; wrote:<u></u><u></u></span></div></div><blockquote style=3D"border=
-style:none none none solid;border-left-width:1pt;border-left-color:rgb(204=
,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4.8pt;margin-right:0cm"><div =
style=3D"margin:0cm 0cm 0.0001pt;font-size:12pt;font-family:&quot;MS PGothi=
c&quot;,sans-serif"><span lang=3D"EN-US">On Wed, May 5, 2021 at 6:25 AM And=
rew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" style=3D"color:pu=
rple;text-decoration:underline" target=3D"_blank">geissonator@gmail.com</a>=
&gt; wrote:<br>&gt;<br>&gt;<br>&gt;<br>&gt; &gt; On May 5, 2021, at 1:26 AM=
, George Hung (</span><span lang=3D"JA">=E6=B4=AA=E5=BF=A0=E6=95=AC</span><=
span lang=3D"EN-US">) &lt;<a href=3D"mailto:George.Hung@quantatw.com" style=
=3D"color:purple;text-decoration:underline" target=3D"_blank">George.Hung@q=
uantatw.com</a>&gt; wrote:<br>&gt; &gt;<br>&gt; &gt; Hi Andrew Geissler,<br=
>&gt; &gt;<br>&gt; &gt; We have ported many OpenBMC features to quanta/gbs =
machine (Nuvoton BMC platform) and hope it could be added to CI build, coul=
d you help add quanta/gbs machine to CI build verification ? (I&#39;m not f=
amiliar with this, if there&#39;s anything we need to do first, please let =
us know)<br>&gt;<br>&gt; Hey George,<br>&gt;<br>&gt; Getting a new system i=
nto CI doesn=E2=80=99t have the most defined process but<br>&gt; I think in=
 general it has to fall under one of these due to our constraints<br>&gt; i=
n compute power for CI:<br>&gt;<br>&gt; 1) Propose an existing system in CI=
 to replace (and the benefits of that)<br>&gt; 2) Donate a jenkins compute =
node to openbmc CI<br>&gt; 3) Convince the community that your system provi=
des additional meta-*<br>&gt;=C2=A0 =C2=A0 =C2=A0layer coverage (or some ot=
her critical benefit) that would be worth<br>&gt;=C2=A0 =C2=A0 =C2=A0the ad=
ditional hit to the existing CI infrastructure.<br>&gt;<br>&gt; We currentl=
y have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make sense to replace=
<br>&gt; it with this new =E2=80=9Cgbs=E2=80=9D machine?<br><br>Jumping on =
this thread to say that I&#39;m hoping to have quanta-gbs<br>support in ups=
tream qemu shortly --- so we could also enable this as a<br>Qemu CI machine=
.<br><br>&gt;<br>&gt;<br>&gt; &gt;<br>&gt; &gt;<br>&gt; &gt; Thanks a lot.<=
br>&gt; &gt;<br>&gt; &gt; Best Regards<br>&gt; &gt; George Hung<br>&gt; &gt=
;<br>&gt;</span></div></blockquote></div></div></blockquote></div></div></b=
lockquote></div></div></div></div></blockquote></div><br></div></blockquote=
></div>

--000000000000a27e8f05c1c67fb7--
