Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C018F2A11D9
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 01:07:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CNKHf4kxjzDqyS
	for <lists+openbmc@lfdr.de>; Sat, 31 Oct 2020 11:07:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2a;
 helo=mail-io1-xd2a.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=U8uTJ2S6; dkim-atps=neutral
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CNKGl4WRRzDqwW
 for <openbmc@lists.ozlabs.org>; Sat, 31 Oct 2020 11:06:38 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id u62so9247838iod.8
 for <openbmc@lists.ozlabs.org>; Fri, 30 Oct 2020 17:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YPEEwK0lYgidezI25viX4bBysO0c73gPjaVGC4TLjM8=;
 b=U8uTJ2S6qU8oBOHiAlVLukI6y8Uq58xAf99FGaxpqb3rGXmqYVgzAyIKnFDxySvqYT
 PjGJ4H8eUEi8cA86kX/vk1UdCNmJlZzdk7L8ccQNSbNiP6jyU/QTgJ9kz6OuG843VUfW
 +EfSF759RriGKUOl4vwQY3Dl6XGvc03jPKQXCPK2a3FU2jyEOTtmqy49AUhdMGgXU0Ix
 fNRWAcRL2bzxq0LodnA4d0ygVqBRg678G6bMEJArNYCjQYnEIkr1Qplr4jzZP+37sWub
 5FWQmeB/Jl56ZesArK03sC65wjxpkzBfW+oBtV886bsCC1FZFPZhG+79kqcBvbqXZ2iS
 NOVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YPEEwK0lYgidezI25viX4bBysO0c73gPjaVGC4TLjM8=;
 b=Ikh8SLm/JUdw8geEvP4G606kIJCah7K0dpPrIDTj6Fh4N8Meir/IpecxaUGiSlIQIN
 yHzrY/+/LF19v8VRJwQvrJydMPgBSZW2E5ZFKWrOaST4SFt1m8k5Yl9NZshVL5P4taIC
 zMWxj0ipRpS7L8F/fP5yADLtbnsUDYFy0dW3ImqO4/QLkglrBf4E0cqMsT9qzoBfDB/h
 zRYxwCao84dx6bik3+Wc6pzfZR2rgkZ4Hb0jaioovM1VOWXD/aTzNdJie+8LTnd+iHVj
 z3YNfbi+j+woHuJ16CYcqejdpFa+QO/C+Ey/lwqtCRVFUZvBlFP3x96KwVYN5SuWB0en
 QM7A==
X-Gm-Message-State: AOAM530eb6XLL2LBzKaPS1IsWLnUDrv/Cs1ElHwl4PQwoFTm9t6/qHKG
 n/X4XteuwQlel/GT65IqkthJBUzA0eFtSg8LbmihZA==
X-Google-Smtp-Source: ABdhPJz0uDCIhsbvFIuzic2Etd7HtgsLOwB8Vo88B9r0qvYRfIv9Z0ZZQMNCcvnHKBQC6wu7RLnvERRjKoUdP3pRcvA=
X-Received: by 2002:a6b:8d12:: with SMTP id p18mr2279422iod.139.1604102795376; 
 Fri, 30 Oct 2020 17:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
 <4c13b632-c1ac-2908-4154-325f7c90a201@linux.ibm.com>
In-Reply-To: <4c13b632-c1ac-2908-4154-325f7c90a201@linux.ibm.com>
From: Anton Kachalov <rnouse@google.com>
Date: Sat, 31 Oct 2020 01:06:24 +0100
Message-ID: <CADVsX8-FRMUKCWGqwn8cdJysK0a9Hf7uiCjth1ak_FUw4hNdkg@mail.gmail.com>
Subject: Re: SELinux support question
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000004d8fdd05b2ec49eb"
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
Cc: Manojkiran Eda <manojeda@in.ibm.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Artem Senichev <artemsen@gmail.com>, Ivan Li11 <rli11@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000004d8fdd05b2ec49eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Ivan.

Some OpenBMC hardening work is ongoing:
https://github.com/openbmc/openbmc/issues/3383

Do you have a specific use-cases for SELinux?

On Fri, 30 Oct 2020 at 22:07, Joseph Reynolds <jrey@linux.ibm.com> wrote:

> On 10/30/20 12:55 AM, Artem Senichev wrote:
> > Hi Ivan,
> >
> > Yocto has a layer for SELinux
> > (http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
> > it.
> > But the layer depends on Python for management tools, which does not
> > exist in the OpenBMC image anymore.
> > The problem is that Python significantly increases image size, it will
> > be more than 32MiB, which causes some troubles with qemu emulation.
> >
> > --
> > Best regards,
> > Artem Senichev
> >
> > On Thu, Oct 29, 2020 at 7:48 PM Ivan Li11 <rli11@lenovo.com> wrote:
> >> Hi Team,
> >>
> >>
> >>
> >> I would like to ask about SELinux support. It=E2=80=99s seems that the=
re=E2=80=99s no
> SELinux related package in current OpenBMC.
> >>
> >> Therefore, is it not supported for now ?
> >>
> >> Please help to advise.
>
> SELinux and alternatives such as AppArmor and KRSI (Kernel Runtime
> Security Instrumentation) were discussed in various OpenBMC security
> working group meetings including 2020-05-13, 2020-04-01, and earlier.
> See the meeting minutes:
>
> https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsD=
UWmAOI
>
> I don't have any additional insight.
>
> - Joseph
>
> >>
> >>
> >>
> >> Thanks.
>
>

--0000000000004d8fdd05b2ec49eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, Ivan.<div><br></div><div>Some OpenBMC hardening wor=
k is ongoing:</div><div><a href=3D"https://github.com/openbmc/openbmc/issue=
s/3383">https://github.com/openbmc/openbmc/issues/3383</a><br></div><div><b=
r></div><div>Do you have a specific use-cases for SELinux?</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 30 =
Oct 2020 at 22:07, Joseph Reynolds &lt;<a href=3D"mailto:jrey@linux.ibm.com=
">jrey@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 10/30/20 12:55 AM, Artem Senichev wrote:<br>
&gt; Hi Ivan,<br>
&gt;<br>
&gt; Yocto has a layer for SELinux<br>
&gt; (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux" re=
l=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cg=
i/meta-selinux</a>), you can try<br>
&gt; it.<br>
&gt; But the layer depends on Python for management tools, which does not<b=
r>
&gt; exist in the OpenBMC image anymore.<br>
&gt; The problem is that Python significantly increases image size, it will=
<br>
&gt; be more than 32MiB, which causes some troubles with qemu emulation.<br=
>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt; Artem Senichev<br>
&gt;<br>
&gt; On Thu, Oct 29, 2020 at 7:48 PM Ivan Li11 &lt;<a href=3D"mailto:rli11@=
lenovo.com" target=3D"_blank">rli11@lenovo.com</a>&gt; wrote:<br>
&gt;&gt; Hi Team,<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I would like to ask about SELinux support. It=E2=80=99s seems that=
 there=E2=80=99s no SELinux related package in current OpenBMC.<br>
&gt;&gt;<br>
&gt;&gt; Therefore, is it not supported for now ?<br>
&gt;&gt;<br>
&gt;&gt; Please help to advise.<br>
<br>
SELinux and alternatives such as AppArmor and KRSI (Kernel Runtime <br>
Security Instrumentation) were discussed in various OpenBMC security <br>
working group meetings including 2020-05-13, 2020-04-01, and earlier.=C2=A0=
 <br>
See the meeting minutes:<br>
<a href=3D"https://docs.google.com/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xo=
JRQvLxxsDUWmAOI" rel=3D"noreferrer" target=3D"_blank">https://docs.google.c=
om/document/d/1b7x9BaxsfcukQDqbvZsU2ehMq4xoJRQvLxxsDUWmAOI</a><br>
<br>
I don&#39;t have any additional insight.<br>
<br>
- Joseph<br>
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks.<br>
<br>
</blockquote></div>

--0000000000004d8fdd05b2ec49eb--
