Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 476953748C4
	for <lists+openbmc@lfdr.de>; Wed,  5 May 2021 21:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb6ST1Vl2z303q
	for <lists+openbmc@lfdr.de>; Thu,  6 May 2021 05:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Lal3gVee;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=brandonkim@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Lal3gVee; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb6SD2mjhz2yjK
 for <openbmc@lists.ozlabs.org>; Thu,  6 May 2021 05:37:45 +1000 (AEST)
Received: by mail-ot1-x32c.google.com with SMTP id
 c36-20020a05683034a4b02902a5b84b1d12so2762211otu.8
 for <openbmc@lists.ozlabs.org>; Wed, 05 May 2021 12:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YlynTp3x91xEjXNYzW7wEh6C14ecSO7rikv9eSapaY=;
 b=Lal3gVeeuQzPoIVzJ209inaF7o6Uk8yZa+4aa60QQlwgCjXeWMqkmj6Z+xSlcM1HOJ
 Xlnie0jmJw/mnHKya774uUhQCnqV+hu/QXGxQi0VKRlDIYl7ZQLeFvqnzK6/axoGmySV
 mGvmT3jc1+bG3Kf45dkveuc2DFXDwJCDQm2Lh33Q4mVU/awxyNQaWliThdvIVQXtAEYg
 vWuX9VphXRuOBfn/Pxy6ziMooeotTE7Dfg9Wf0zA4+ojpEcb2S7iRC+3oIKKg3Ac7vqB
 WG1xgvyIxOAHnCkjpUzfmEqmuUhlNtUntw7NGTenUlp5WLQDlvvrecXmRzYckX3Spmi9
 hW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YlynTp3x91xEjXNYzW7wEh6C14ecSO7rikv9eSapaY=;
 b=ibSQsy6ngAzerPf9E4xmuecryX0RKrYYraSrtpKFSy9dtiOoOnsRnj+x5sTlaPm2jy
 bxp482yL/j8Jy3Wcv+T6CWCa6PYdXqhRd8IcMRJrvFHsr9OZuuGyojxmUhPQPPBWloke
 K3TsNgfG1G6n3bj0x5tgY8ByGw8U+A+JvfNH56CNYQBSS+ozHIUK50t/4SS2bZ9rTxDP
 gaWR95f1+FNukOrWHIGj2FNRXU0IR1LrRGvj7O02EFc59WR/A1zVSD1LS4xjQl1pHpgv
 Os7FNMPm2MzWR0qMmKGAsdu5YnCozWuyeMT23SgY1vz2jec/SvHAM1WZQmZAq2kGRnx0
 Sj4Q==
X-Gm-Message-State: AOAM5327emYlM99ZszRlHnsdUJ/atEYKPL4jW0hdTkLX1bTojxVkGtdQ
 C3aVMm0lYfQNv0V3Wo1OHKRC5S1FTmLrGOppNTa7Fw==
X-Google-Smtp-Source: ABdhPJzGcGZq5MI7vOG1IpqUlio4pxg8fCNvexFMIG5xF5jBHHOXaJ7KWcV68z8bDn07pUwQcdRD2tq3lSq119xblus=
X-Received: by 2002:a05:6830:1bd8:: with SMTP id
 v24mr233054ota.203.1620243462187; 
 Wed, 05 May 2021 12:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB233989A7F66DD0B3964E2E0B8F599@HK0PR04MB2339.apcprd04.prod.outlook.com>
 <2DE216D2-B472-42B4-AC31-40902D5600CC@gmail.com>
 <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
In-Reply-To: <CAO=notyQFgzroaMfsQkr+ZjPm_8DE4y5s3mkadxdmic=N85OMQ@mail.gmail.com>
From: Brandon Kim <brandonkim@google.com>
Date: Wed, 5 May 2021 12:37:31 -0700
Message-ID: <CALGRKGPbdcSRrTUwU6uUpYfAxGZqOFWZL+LU74bFit0EcGP95Q@mail.gmail.com>
Subject: Re: CI build for quanta/gbs
To: Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="00000000000003ddd105c19a54ed"
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
Cc: Benjamin Fair <benjaminfair@google.com>,
 =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <Fran.Hsu@quantatw.com>,
 =?UTF-8?B?R2VvcmdlIEh1bmcgKOa0quW/oOaVrCk=?= <George.Hung@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000003ddd105c19a54ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

`gbs` machine will provide meta-google coverage, so it would be great if
`gbs` could be added in addition to `gsj` instead of as a replacement.

Is there a shortage of OpenBMC CI nodes by any chance? Google has been
providing 2 of the OpenBMC CI nodes, so it would be great if adding `gbs`
could count towards one of those CI nodes.

Thank you,
Brandon

On Wed, May 5, 2021 at 10:54 AM Patrick Venture <venture@google.com> wrote:

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

--00000000000003ddd105c19a54ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Andrew,<div><br></div><div>`gbs` machine will provide m=
eta-google coverage, so it would be great if `gbs` could be added in additi=
on to `gsj` instead of as a replacement.</div><div><br></div><div>Is there =
a shortage of OpenBMC CI nodes by any chance? Google has been providing 2 o=
f the OpenBMC CI nodes, so it would be great if adding `gbs` could count to=
wards one of those CI nodes.</div><div><br></div><div>Thank you,</div><div>=
Brandon</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, May 5, 2021 at 10:54 AM Patrick Venture &lt;<a href=3D=
"mailto:venture@google.com">venture@google.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">On Wed, May 5, 2021 at 6:25 A=
M Andrew Geissler &lt;<a href=3D"mailto:geissonator@gmail.com" target=3D"_b=
lank">geissonator@gmail.com</a>&gt; wrote:<br>
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

--00000000000003ddd105c19a54ed--
