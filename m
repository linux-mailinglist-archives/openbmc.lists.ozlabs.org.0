Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 827133757B7
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 17:40:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbd7z3yTKz3c0R
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 01:40:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=uvlez+YD;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::334;
 helo=mail-ot1-x334.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=uvlez+YD; dkim-atps=neutral
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbd5806Nqz3c6M
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 01:38:02 +1000 (AEST)
Received: by mail-ot1-x334.google.com with SMTP id
 b5-20020a9d5d050000b02902a5883b0f4bso5251035oti.2
 for <openbmc@lists.ozlabs.org>; Thu, 06 May 2021 08:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0XiSp7T4LuRTCQF+FhjjKDS6TgVyCtQ1w/XmzC0IRQ=;
 b=uvlez+YDZxuWjnl+ljOTj51ztNa676QxFpJQRJZY31IvJDM/Z2HA8dZXvAyh/kovRX
 2O1z0U/Tv/b8fgg7tCYuowNwFQqGupDsb8sPthn1aljhM6eo2zRpaBsnxizwyky/9ApH
 GQnw+dletb0CvkAuTsoALJwLku43j/ua9hgt6FIj8JP4a4q9S1tUSfd1v7pfqJpfW3me
 o9ZySKR2BXN7Liv/ICt0Em0pSh4M1pAr0m1Sc+MORgwMmGIOHR4tz7fj2XdgWQ13MLmK
 UyLtt0bb1oMt9b9K7dfDV8beyOwRYIsrTrIk5yHs818JSbL/VHNmy+RaWX+3yMTG3/QG
 N8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0XiSp7T4LuRTCQF+FhjjKDS6TgVyCtQ1w/XmzC0IRQ=;
 b=rAwxnDacg8v99fARWbVcG/H/pntJjA3ZCwWuEy20p/u2QJ9CnCJbsTSCsDO+nFvaEg
 JNYltbmm7EDgES72WbdfsoJRS1uNgbVtJXayhYw0cqMjArM+Dug7aXfPW6kin2dRfQjm
 QyxVRu09cFJILabAL3KwrYNEk3Nna2NGTCML+9ja/rWZWDuFABxLWFjxg4cohLyS5KqV
 O3Z8jbLjZ+6m+MBYrYW+cSkNfmc2W5V8IWGI4Ytqy2RdO7vw4d8FeyLj5oSTKmdQqAIZ
 AI90OHrX9iAS0dCXUsTJlm1yRUx3KyTqIz++3ATOofodSsy7T2fc3mx+nBFKANdqREcG
 dAxQ==
X-Gm-Message-State: AOAM533TkoJJ8w0yByGyr5OxpKG1PX86FL1mvysi4H+Bv4NfDxeVi7IZ
 9a+tNxZGLyLIAm5YZ84tZHFbAxYdV6T7t6MziBS0oQ==
X-Google-Smtp-Source: ABdhPJzatWA3FDk/wTUyrSCc5h01Wuv9zfiyheTeWgl/XjaF5QXhJInZY3g4uAfSPrPJRQ4xOb0rA2JTflzSNX3Oq/w=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr4144875ota.203.1620315478815; 
 Thu, 06 May 2021 08:37:58 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
 <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
 <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
In-Reply-To: <8D110F1E-CD90-41FE-808E-C2A2A3ACD903@gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Thu, 6 May 2021 08:37:46 -0700
Message-ID: <CALGRKGNUh1yMLX20LDLAs5Df=QB8=42KWuo=TC3SG84EEHqD5w@mail.gmail.com>
Subject: Re: CI build for quanta/gbs
To: Andrew Geissler <geissonator@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008a700005c1ab18b3"
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

--0000000000008a700005c1ab18b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

It looks like it's due to my patch to phosphor-hwmon (which, the repo is
going through some overhaul and is causing conflicts with). The patch in
question is in the process of getting upstreamed and the repo is settling
down, so I'll ping you on Discord once it looks ready to be tried again
(hopefully by end of the week).

Thanks,
Brandon

On Thu, May 6, 2021 at 6:38 AM Andrew Geissler <geissonator@gmail.com>
wrote:

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
>
>
> Thank you,
> Brandon
>
> On Wed, May 5, 2021 at 10:54 AM Patrick Venture <venture@google.com>
> wrote:
>
>> On Wed, May 5, 2021 at 6:25 AM Andrew Geissler <geissonator@gmail.com>
>> wrote:
>> >
>> >
>> >
>> > > On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=AC=
) <
>> George.Hung@quantatw.com> wrote:
>> > >
>> > > Hi Andrew Geissler,
>> > >
>> > > We have ported many OpenBMC features to quanta/gbs machine (Nuvoton
>> BMC platform) and hope it could be added to CI build, could you help add
>> quanta/gbs machine to CI build verification ? (I'm not familiar with thi=
s,
>> if there's anything we need to do first, please let us know)
>> >
>> > Hey George,
>> >
>> > Getting a new system into CI doesn=E2=80=99t have the most defined pro=
cess but
>> > I think in general it has to fall under one of these due to our
>> constraints
>> > in compute power for CI:
>> >
>> > 1) Propose an existing system in CI to replace (and the benefits of
>> that)
>> > 2) Donate a jenkins compute node to openbmc CI
>> > 3) Convince the community that your system provides additional meta-*
>> >     layer coverage (or some other critical benefit) that would be wort=
h
>> >     the additional hit to the existing CI infrastructure.
>> >
>> > We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make =
sense to replace
>> > it with this new =E2=80=9Cgbs=E2=80=9D machine?
>>
>> Jumping on this thread to say that I'm hoping to have quanta-gbs
>> support in upstream qemu shortly --- so we could also enable this as a
>> Qemu CI machine.
>>
>> >
>> >
>> > >
>> > >
>> > > Thanks a lot.
>> > >
>> > > Best Regards
>> > > George Hung
>> > >
>> >
>>
>
>

--0000000000008a700005c1ab18b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div>It looks like it&#39;s due t=
o my patch to phosphor-hwmon (which, the repo is going through some overhau=
l and is causing conflicts with). The patch in question is in the process=
=C2=A0of getting upstreamed and the repo is settling down, so I&#39;ll ping=
 you on Discord once it looks ready to be tried again (hopefully by end of =
the week).</div><div><br></div><div>Thanks,</div><div>Brandon</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, =
May 6, 2021 at 6:38 AM Andrew Geissler &lt;<a href=3D"mailto:geissonator@gm=
ail.com">geissonator@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div style=3D"overflow-wrap: break-word;"><br=
><div><br><blockquote type=3D"cite"><div>On May 5, 2021, at 2:37 PM, Brando=
n Kim &lt;<a href=3D"mailto:brandonkim@google.com" target=3D"_blank">brando=
nkim@google.com</a>&gt; wrote:</div><br><div><div dir=3D"ltr">Hi Andrew,<di=
v><br></div><div>`gbs` machine will provide meta-google coverage, so it wou=
ld be great if `gbs` could be added in addition to `gsj` instead of as a re=
placement.</div><div><br></div><div>Is there a shortage of OpenBMC CI nodes=
 by any chance? Google has been providing 2 of the OpenBMC CI nodes, so it =
would be great if adding `gbs` could count towards one of those CI nodes.</=
div></div></div></blockquote><div><br></div><div>Yep, google donates two se=
rvers so sounds good. I added it to our daily build of master and it looks =
like it hit a build issue. We can coordinate in discord if you like but onc=
e we get this figured out, I=E2=80=99ll add it to the main openbmc/openbmc =
CI job.</div><div><br></div><div><a href=3D"https://jenkins.openbmc.org/job=
/latest-master/231/label=3Ddocker-builder,target=3Dgbs/console" target=3D"_=
blank">https://jenkins.openbmc.org/job/latest-master/231/label=3Ddocker-bui=
lder,target=3Dgbs/console</a></div><br><blockquote type=3D"cite"><div><div =
dir=3D"ltr"><div><br></div><div>Thank you,</div><div>Brandon</div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, M=
ay 5, 2021 at 10:54 AM Patrick Venture &lt;<a href=3D"mailto:venture@google=
.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Wed, May 5, 2021 at 6:25 AM An=
drew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" target=3D"_blank=
">geissonator@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt; On May 5, 2021, at 1:26 AM, George Hung (=E6=B4=AA=E5=BF=A0=E6=95=
=AC) &lt;<a href=3D"mailto:George.Hung@quantatw.com" target=3D"_blank">Geor=
ge.Hung@quantatw.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Andrew Geissler,<br>
&gt; &gt;<br>
&gt; &gt; We have ported many OpenBMC features to quanta/gbs machine (Nuvot=
on BMC platform) and hope it could be added to CI build, could you help add=
 quanta/gbs machine to CI build verification ? (I&#39;m not familiar with t=
his, if there&#39;s anything we need to do first, please let us know)<br>
&gt;<br>
&gt; Hey George,<br>
&gt;<br>
&gt; Getting a new system into CI doesn=E2=80=99t have the most defined pro=
cess but<br>
&gt; I think in general it has to fall under one of these due to our constr=
aints<br>
&gt; in compute power for CI:<br>
&gt;<br>
&gt; 1) Propose an existing system in CI to replace (and the benefits of th=
at)<br>
&gt; 2) Donate a jenkins compute node to openbmc CI<br>
&gt; 3) Convince the community that your system provides additional meta-*<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0layer coverage (or some other critical benefit) tha=
t would be worth<br>
&gt;=C2=A0 =C2=A0 =C2=A0the additional hit to the existing CI infrastructur=
e.<br>
&gt;<br>
&gt; We currently have a =E2=80=9Cgsj=E2=80=9D system in CI. Would it make =
sense to replace<br>
&gt; it with this new =E2=80=9Cgbs=E2=80=9D machine?<br>
<br>
Jumping on this thread to say that I&#39;m hoping to have quanta-gbs<br>
support in upstream qemu shortly --- so we could also enable this as a<br>
Qemu CI machine.<br>
<br>
&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Thanks a lot.<br>
&gt; &gt;<br>
&gt; &gt; Best Regards<br>
&gt; &gt; George Hung<br>
&gt; &gt;<br>
&gt;<br>
</blockquote></div>
</div></blockquote></div><br></div></blockquote></div>

--0000000000008a700005c1ab18b3--
