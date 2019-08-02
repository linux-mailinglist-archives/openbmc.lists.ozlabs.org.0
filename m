Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC55A8024D
	for <lists+openbmc@lfdr.de>; Fri,  2 Aug 2019 23:48:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460glW0sFVzDrFb
	for <lists+openbmc@lfdr.de>; Sat,  3 Aug 2019 07:48:39 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=kunyi@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="TWKsXQGk"; 
 dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460gkw2Vr3zDrCG
 for <openbmc@lists.ozlabs.org>; Sat,  3 Aug 2019 07:48:07 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id j6so35484564ioa.5
 for <openbmc@lists.ozlabs.org>; Fri, 02 Aug 2019 14:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8IZXKQyVzK/R55s0kcJmgLxOYn1BAJMRBVObs9FAtz4=;
 b=TWKsXQGk7FC4XDyLar1uVN7avXTf1ZbywZqfimVc58gQjqHOqpAKf1sSOEGVIuhfKT
 MweUGASg3xa6BTk0AQ2H8UZWdA+l0fSRhpma1ujNpPiJJOOvSDLCpkaz04V8OGsQIdjR
 1oJnFcnuI6riRLLcnMD8MhUZ0SOpEcl5NdEbmKxhsTJONltbk8d2YjSo9kzWUpR85zw/
 jVuOOMJNpINlfShfmNLEM60v2dMNgcPs5FZ9MZHWZ7freREMcZbP21o5vfCHKmaWVwZm
 3HEA2x6hkTyl4KQcyzaQ2LtnUEAEHolDfZbGsPec0B5+Lu991c1CYv7rBVzjkOIJSQ3x
 5aow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8IZXKQyVzK/R55s0kcJmgLxOYn1BAJMRBVObs9FAtz4=;
 b=notsiWr7dt3cyRqIYL5fEck6P/FCBWBz4aB25AyIbteUXS914sGgMFtUlsac4ZaOs2
 eNTJj6sZ2Kf8pGtCqsXvcACPWnjNiC8/d8XniFmlbyKThy+v+2V7dbms7wa/0VlfvKwq
 kNhA9IFd11HMQtteunBb8Z1zIjdjBRCdh3hI53LuwCBOtE/mwkF7DctPQiPas2zyL+AE
 4/dF6xd67/hRN15m7r6SDqqMyFxSDauCNX86A9izZbWtCfV3zmZa3c4VQssU8bjYi0IW
 Vz14qKi0E4oY+BqwsBV9I6A3T1DqOd1EVHQbea15W+ws6SuvHLGTFMB1MWPOv40jUXd9
 h2bQ==
X-Gm-Message-State: APjAAAWPumeUPznT2xQ/dxmQTG565mvllUJ63X4uIdH0Iq7feQf/tGbm
 FCyyFtxEFl6DqGG9pli1OOyoYdGw+dxpIetbNnLbfg==
X-Google-Smtp-Source: APXvYqzgZz2p9fmJPFTzNC1ujaKkL0Xn8vfaney8MLzaKHZ3vVquWbYLsyd4xOyCd6V3OIIn7jxZYikWEWIKPdpCe2s=
X-Received: by 2002:a02:16c5:: with SMTP id
 a188mr144679170jaa.86.1564782484025; 
 Fri, 02 Aug 2019 14:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <A6540D28-604F-4057-8065-0EB20BFE92A5@fb.com>
 <CAARXrtn6OqU9P5MEbZ9znetZ5f115vyZ8NYr0e_P79PFdG1ChA@mail.gmail.com>
 <23b0b26b-2ad2-d97d-a7e5-d2518b801d6d@linux.vnet.ibm.com>
 <48D01587-EBCB-4992-83C6-5D8ABC56D234@fb.com>
In-Reply-To: <48D01587-EBCB-4992-83C6-5D8ABC56D234@fb.com>
From: Kun Yi <kunyi@google.com>
Date: Fri, 2 Aug 2019 14:47:37 -0700
Message-ID: <CAGMNF6VgO5jt1mNbm91Z23EzR=AEcbuM5DqukOAK=TMj_a3-4g@mail.gmail.com>
Subject: Re: Small help on trivial issue
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="0000000000001cd073058f295024"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000001cd073058f295024
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 2, 2019 at 2:19 PM Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Thanks a lot guys, It really helped.
>
> Regards
> -Vijay
>
> =EF=BB=BFOn 8/1/19, 11:27 PM, "vishwa" <vishwa@linux.vnet.ibm.com> wrote:
>
>     Here is another instance: from one of my old commits.
>
>
https://github.com/openbmc/phosphor-host-ipmid/blob/master/systemintfcmds.c=
pp#L131
>
>     !! Vishwa !!
>
>     On 8/2/19 7:39 AM, Lei YU wrote:
>     > I did not check the code details, but from the description, it is
likely due to
>     > the global variable's initialization order in a shared library.
>     >
>     > Basically, you need to specify
`__attribute__((init_priority(101)))` for your
>     > global variables.
>     >
>     > Please check below commit for details and how to manually specify
the init
>     > order for such variables.
>     >
https://github.com/openbmc/phosphor-host-ipmid/commit/4b0ddb68b4e7642035858=
9213bc400155fa12e43
>     >
>     >
>     > On Fri, Aug 2, 2019 at 4:12 AM Vijay Khemka <vijaykhemka@fb.com>
wrote:
>     >> Team,
>     >>
>     >> I am having small issue of global json object corruption and I am
unable to find reason for it. I am defining a global json object
(nlohmann::json appSelData) at the start of file. I am initializing this
object in register function and accessing this in different functions
defined in same shared library. While accessing in different function, it
doesn=E2=80=99t hold initialized data. This is failing in my storagecommand=
s.cpp
for IPMI.

I  would advise against using static global variables exactly for this
issue.
See also static initialization fiasco
<https://isocpp.org/wiki/faq/ctors#static-init-order>, another subtle way
to crash your app nondeterministically.
They were called out and forbidden
<https://google.github.io/styleguide/cppguide.html#Static_and_Global_Variab=
les>
in Google C++ style guide (except for constants).
Using a factory and use smart pointers to manage ownership would be a safer
bet.

>     >>
>     >>
>     >>
>     >> Then I created a separate new file selcommands.cpp and did the
same operation, it works here as expected. So I am wondering why it is
failing in existing file vs new one. Looks like there are some header
included in existing file is messing it up but I have no clue yet. This
only happens with json object.
>     >>
>     >>
>     >>
>     >> For your reference, I am attaching both below files
>     >>
>     >> Storagecommands.cpp =E2=80=93 where this fails
>     >>
>     >> Selcommands.cpp =E2=80=93 where it works.
>     >>
>     >>
>     >>
>     >> I know it is a debug issue and I have been struggling last 2 days
so thought of asking for help to team. Any help here would be appreciated.
>     >>
>     >>
>     >>
>     >> Regards
>     >>
>     >> -Vijay
>
>
>


--=20
Regards,
Kun

--0000000000001cd073058f295024
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Fri, Aug 2, 2019 at 2:19 PM Vijay Khemka &lt;<a=
 href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br>&g=
t;<br>&gt; Thanks a lot guys, It really helped.<br>&gt;<br>&gt; Regards<br>=
&gt; -Vijay<br>&gt;<br>&gt; =EF=BB=BFOn 8/1/19, 11:27 PM, &quot;vishwa&quot=
; &lt;<a href=3D"mailto:vishwa@linux.vnet.ibm.com">vishwa@linux.vnet.ibm.co=
m</a>&gt; wrote:<br>&gt;<br>&gt; =C2=A0 =C2=A0 Here is another instance: fr=
om one of my old commits.<br>&gt;<br>&gt; =C2=A0 =C2=A0 <a href=3D"https://=
github.com/openbmc/phosphor-host-ipmid/blob/master/systemintfcmds.cpp#L131"=
>https://github.com/openbmc/phosphor-host-ipmid/blob/master/systemintfcmds.=
cpp#L131</a><br>&gt;<br>&gt; =C2=A0 =C2=A0 !! Vishwa !!<br>&gt;<br>&gt; =C2=
=A0 =C2=A0 On 8/2/19 7:39 AM, Lei YU wrote:<br>&gt; =C2=A0 =C2=A0 &gt; I di=
d not check the code details, but from the description, it is likely due to=
<br>&gt; =C2=A0 =C2=A0 &gt; the global variable&#39;s initialization order =
in a shared library.<br>&gt; =C2=A0 =C2=A0 &gt;<br>&gt; =C2=A0 =C2=A0 &gt; =
Basically, you need to specify `__attribute__((init_priority(101)))` for yo=
ur<br>&gt; =C2=A0 =C2=A0 &gt; global variables.<br>&gt; =C2=A0 =C2=A0 &gt;<=
br>&gt; =C2=A0 =C2=A0 &gt; Please check below commit for details and how to=
 manually specify the init<br>&gt; =C2=A0 =C2=A0 &gt; order for such variab=
les.<br>&gt; =C2=A0 =C2=A0 &gt; <a href=3D"https://github.com/openbmc/phosp=
hor-host-ipmid/commit/4b0ddb68b4e76420358589213bc400155fa12e43">https://git=
hub.com/openbmc/phosphor-host-ipmid/commit/4b0ddb68b4e76420358589213bc40015=
5fa12e43</a><br>&gt; =C2=A0 =C2=A0 &gt;<br>&gt; =C2=A0 =C2=A0 &gt;<br>&gt; =
=C2=A0 =C2=A0 &gt; On Fri, Aug 2, 2019 at 4:12 AM Vijay Khemka &lt;<a href=
=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt; wrote:<br>&gt; =
=C2=A0 =C2=A0 &gt;&gt; Team,<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =
=C2=A0 &gt;&gt; I am having small issue of global json object corruption an=
d I am unable to find reason for it. I am defining a global json object (nl=
ohmann::json appSelData) at the start of file. I am initializing this objec=
t in register function and accessing this in different functions defined in=
 same shared library. While accessing in different function, it doesn=E2=80=
=99t hold initialized data. This is failing in my storagecommands.cpp for I=
PMI.<div><br></div><div>I=C2=A0 would advise against using static global va=
riables exactly for this issue.</div><div>See also <a href=3D"https://isocp=
p.org/wiki/faq/ctors#static-init-order">static initialization fiasco</a>, a=
nother subtle way to crash your app nondeterministically.</div><div>They we=
re <a href=3D"https://google.github.io/styleguide/cppguide.html#Static_and_=
Global_Variables">called out and forbidden</a> in Google C++ style guide (e=
xcept for constants).</div><div>Using a factory and use smart pointers to m=
anage ownership would be a safer bet.</div><div><br>&gt; =C2=A0 =C2=A0 &gt;=
&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =
=C2=A0 =C2=A0 &gt;&gt; Then I created a separate new file selcommands.cpp a=
nd did the same operation, it works here as expected. So I am wondering why=
 it is failing in existing file vs new one. Looks like there are some heade=
r included in existing file is messing it up but I have no clue yet. This o=
nly happens with json object.<div>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=
=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &g=
t;&gt; For your reference, I am attaching both below files<br>&gt; =C2=A0 =
=C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Storagecommands.cpp =E2=80=
=93 where this fails<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &=
gt;&gt; Selcommands.cpp =E2=80=93 where it works.<br>&gt; =C2=A0 =C2=A0 &gt=
;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt;=
 =C2=A0 =C2=A0 &gt;&gt; I know it is a debug issue and I have been struggli=
ng last 2 days so thought of asking for help to team. Any help here would b=
e appreciated.<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt=
;<br>&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt; Regards<br>=
&gt; =C2=A0 =C2=A0 &gt;&gt;<br>&gt; =C2=A0 =C2=A0 &gt;&gt; -Vijay<br>&gt;<b=
r>&gt;<br>&gt;<br><br><br>-- <br>Regards,<br>Kun</div></div></div>

--0000000000001cd073058f295024--
