Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C761BC5CB
	for <lists+openbmc@lfdr.de>; Tue, 28 Apr 2020 18:52:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BSNq4XcFzDqjk
	for <lists+openbmc@lfdr.de>; Wed, 29 Apr 2020 02:52:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=ztai@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=C0X2cFJL; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BSJn0T73zDqvP
 for <openbmc@lists.ozlabs.org>; Wed, 29 Apr 2020 02:48:40 +1000 (AEST)
Received: by mail-ot1-x333.google.com with SMTP id e20so33780274otk.12
 for <openbmc@lists.ozlabs.org>; Tue, 28 Apr 2020 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRDn6+heV7KqUPmd8aaQwcwZGgbzUhg2LXCQgCejadA=;
 b=C0X2cFJL1VWs6Ohcka7lXKsmBhDawtM/xoHPuVAj5HHCSxnGDWqnPPDUqQtZD7RYPX
 Rzf4zAxA80/cmG7nf5UuoGLnNrMuI+OjoRWRHWGgj4LyPpZzILKoo1x5fF1ncwywMSBg
 d0qPrmHot8tTzEcTRtjW5jzDt+DlLGTIq6XDGHvynovmI6jWrJYrPvH9rP+ejPnbZ2GK
 1vIzxbcD0ogXrU+1Ooh6ANEW/Vxzzf25LD5+jwiP90lk7cxYegewH9xyTcpnBx0rjF9m
 +ng6ywQHaWnf+XT5QjZ4dIbje1W93SCWl2S4G7Q22VsbDr/QK5QvtTQH3csgTfradSar
 Zqig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRDn6+heV7KqUPmd8aaQwcwZGgbzUhg2LXCQgCejadA=;
 b=RngOkQoMpyn91SbuRDuu6ECUKOVwivG4vYLaFhUPo+4TnP70IlOHG1D2/lqPkQniGh
 5munx2CUImhTdHbbD0eyFUGc1PP0SIUy4nx+HtDPAQhY4uxWScjNEcuJcEBmoTQZEUKk
 5Pacv8UGeEa2eflzB/+hU3suqzDFR7hk11+ZMek2GvSAkmiAnfWzwiLK38Cegctxzm9t
 GdlrzHZwOsmjLAJCwejhP++tnQrgFodkh2EbCxUAM/2gi0nvPf6tZrJoJ0qNcyUhkyCq
 sQJHajCc4AlVnyulqmYU9sZVBF0QjRMqyYEYxNA6HCqYAxzZFZ5Jl+EKd/wI1bErPIQC
 E2Pg==
X-Gm-Message-State: AGi0Pubc5kEA2V7lua0mOclLbz5B9iYNk3VUxCGPBChlxE4/UVAZB9Hg
 AqWH1Xrg8IW8/3vRT2XP0OJnDgTmhudgizv+/8SnYA==
X-Google-Smtp-Source: APiQypLzMFE91vt/WojDC7s26OXbur0+46TVLX1aYvJpg4Z70hPIVIcPu/AIZWwKwNzI+HwK6LdSrhWUVEx/Y+jMTCE=
X-Received: by 2002:a9d:423:: with SMTP id 32mr24436531otc.334.1588092516846; 
 Tue, 28 Apr 2020 09:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMXw96O6LpiR5CsmY4e_m2K-HNm_uHdRvRavf5iBSs1RqHYE6g@mail.gmail.com>
 <CAARXrtnLOFVT2TuBa=mPBzVv1tXtrPEbqjms1d2AiX3n4L9wag@mail.gmail.com>
In-Reply-To: <CAARXrtnLOFVT2TuBa=mPBzVv1tXtrPEbqjms1d2AiX3n4L9wag@mail.gmail.com>
From: Zhenfei Tai <ztai@google.com>
Date: Tue, 28 Apr 2020 09:48:25 -0700
Message-ID: <CAMXw96PaiyjPY2+Zk-BFRquWYPqtzJhCFtUQuoRudurOJK9iLA@mail.gmail.com>
Subject: Re: Error with QEMU
To: Lei YU <mine260309@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000056c99c05a45c9a17"
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

--00000000000056c99c05a45c9a17
Content-Type: text/plain; charset="UTF-8"

Thanks for the info.
For me it just hangs there.

On Mon, Apr 27, 2020 at 7:50 PM Lei YU <mine260309@gmail.com> wrote:

> On Tue, Apr 28, 2020 at 7:05 AM Zhenfei Tai <ztai@google.com> wrote:
> >
> > Hi,
> >
> > I'm trying to test a bmc image using QEMU but got this error at startup
> before it's supposed to boot.
> >
> > qemu-system-arm: Aspeed iBT has no chardev backend
> >
> > Has someone seen similar errors before? I found some bug reports in
> github but no resolution was found.
>
> I see this log, but it does not prevent the qemu from running the BMC. It
> shows:
>
>     qemu-system-arm: Aspeed iBT has no chardev backend
>     U-Boot 2016.07-00038-g59428fe010-dirty (Apr 26 2020 - 09:28:54 +0000)
>     ....
>
> And it runs the image OK.
>

--00000000000056c99c05a45c9a17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the info.=C2=A0<div>For me it just hangs there.=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, Apr 27, 2020 at 7:50 PM Lei YU &lt;<a href=3D"mailto:mine2603=
09@gmail.com">mine260309@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, Apr 28, 2020 at 7:05 AM Zhenfei T=
ai &lt;<a href=3D"mailto:ztai@google.com" target=3D"_blank">ztai@google.com=
</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I&#39;m trying to test a bmc image using QEMU but got this error at st=
artup before it&#39;s supposed to boot.<br>
&gt;<br>
&gt; qemu-system-arm: Aspeed iBT has no chardev backend<br>
&gt;<br>
&gt; Has someone seen similar errors before? I found some bug reports in gi=
thub but no resolution was found.<br>
<br>
I see this log, but it does not prevent the qemu from running the BMC. It s=
hows:<br>
<br>
=C2=A0 =C2=A0 qemu-system-arm: Aspeed iBT has no chardev backend<br>
=C2=A0 =C2=A0 U-Boot 2016.07-00038-g59428fe010-dirty (Apr 26 2020 - 09:28:5=
4 +0000)<br>
=C2=A0 =C2=A0 ....<br>
<br>
And it runs the image OK.<br>
</blockquote></div>

--00000000000056c99c05a45c9a17--
