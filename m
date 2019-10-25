Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 56359E5053
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 17:41:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4707dT5HHpzDqfZ
	for <lists+openbmc@lfdr.de>; Sat, 26 Oct 2019 02:41:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=emilyshaffer@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="JuSz0c8+"; 
 dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4707cT3gqjzDqDs
 for <openbmc@lists.ozlabs.org>; Sat, 26 Oct 2019 02:40:56 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id w2so2176984qkf.2
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 08:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F71TnxfAgk/4QuiFf7QnyOoFsAFoJv9ZammhjgGB+K4=;
 b=JuSz0c8+0xPSMQTjxwRZ7rvgUvtOiWnLybuCRi8qfdzYNQsQ2vAX7UpkMAqroiAHar
 tHBFE+iHTRP+dVVxM2jiOyCqB/IAIaLRq4q/81ZheNRrVWKMO25Hm+zBDz+jm9RSYAK7
 I8mR2w1GNt/N75ryxv0rMnF3R3JHU4PIByxSfPWPXCETJqWH3i0nykR8Ri2mZSeLhv6u
 zklvuKdBrlXNbIj935s/OYucbuyU1ksrXiBm4s8Su5NFGMUlXR1KOUwqRlb4NVfxLiAQ
 sDIXuE2TR4nRlSt+MfCkFOnQin+YajhVJttr/dvRDNZbeln4EDogHqXtoRZ5Ir47BvGT
 UmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F71TnxfAgk/4QuiFf7QnyOoFsAFoJv9ZammhjgGB+K4=;
 b=b1l4SBkeJ/2F69KtfwDIlMJBcxwtURSCA/KXFklhGbMmnHYLOF2KKiIFJ3JA0Sv7R1
 VfLBz6sgKkWHS8eTeA9RVljJWlO/s4JZSkcq6ucDcN+Y4+HRwyRhAy9cL/fXLnmei4l3
 DTNjPmgQhvaCztMWJLRzmYD+13ZzdpcQ7j3Bc3luZn+EM+2jMbRAjBezuVL6Dz8VPjaD
 Ree5EO2t76gHHBznEIUHFGOWMqSQ7IHBA0KRNo58VCYrB9+6XMhlJLb+hLO0rXx9uXZO
 Kjz9nxk2euGxphcX7Syst9jBkJEM3XtQfe96TPYF3jciuMxIT0FOHG1+Iq8QmDT8lILd
 HIQA==
X-Gm-Message-State: APjAAAXBs0VBU50CWp4DXGh14Lx7QMh7U388+dbxUjru0D/Oe7GonnE0
 CDYJlDnpTdl/l879xqe3/fWa2S5kcc+OkF/NIPtZGFT0
X-Google-Smtp-Source: APXvYqyXkmbIyE/xUsL41E6umi46i1vR8tFJryE5ipi44Vp620u8/52nh2Wi04zIZ/p6NeIdtByvyQnkICzfy0s8Y84=
X-Received: by 2002:a05:620a:1364:: with SMTP id
 d4mr3494998qkl.218.1572018051992; 
 Fri, 25 Oct 2019 08:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <3cf26eea-3dfb-23a5-a533-408d8ccc0027@linux.ibm.com>
 <82753938-77f8-4098-1c02-36c454fda440@linux.ibm.com>
In-Reply-To: <82753938-77f8-4098-1c02-36c454fda440@linux.ibm.com>
From: Emily Shaffer <emilyshaffer@google.com>
Date: Fri, 25 Oct 2019 08:40:40 -0700
Message-ID: <CAJoAoZ=_Ex7W0LdTqSCDTYLx3E5YrvT8swyT-Unvvo4gYBdtig@mail.gmail.com>
Subject: Re: Running arbitrary tests in CI
To: Matt Spinler <mspinler@linux.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000009228cd0595bdf935"
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

--0000000000009228cd0595bdf935
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If I understand it, it sounds like you're planning to let us write tests in
any form, not just as part of the build, right?

Sounds rad =F0=9F=91=8D

 - Emily

On Fri, Oct 25, 2019, 8:12 AM Matt Spinler <mspinler@linux.ibm.com> wrote:

> Change here:
> https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/2657=
4/
>
> On 10/24/2019 9:25 AM, Matt Spinler wrote:
> > Hi,
> >
> > Following up to the thread that talks about being able to run extra
> > tests in CI:
> > https://lists.ozlabs.org/pipermail/openbmc/2019-September/018329.html
> >
> > I could definitely use something like this, so I am thinking of
> > putting up the
> > commit to do the: run any run-ci.sh in the repo.
> >
> > Are there any additional ideas or other comments on a way to do this?
> >
> > Thanks
>
>

--0000000000009228cd0595bdf935
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">If I understand it, it sounds like you&#39;re planning to=
 let us write tests in any form, not just as part of the build, right?<div =
dir=3D"auto"><br></div><div dir=3D"auto">Sounds rad =F0=9F=91=8D</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0- Emily</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 25,=
 2019, 8:12 AM Matt Spinler &lt;<a href=3D"mailto:mspinler@linux.ibm.com">m=
spinler@linux.ibm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">Change here: <br>
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/openbmc-build-scrip=
ts/+/26574/" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gerrit=
.openbmc-project.xyz/c/openbmc/openbmc-build-scripts/+/26574/</a><br>
<br>
On 10/24/2019 9:25 AM, Matt Spinler wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; Following up to the thread that talks about being able to run extra <b=
r>
&gt; tests in CI:<br>
&gt; <a href=3D"https://lists.ozlabs.org/pipermail/openbmc/2019-September/0=
18329.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.o=
zlabs.org/pipermail/openbmc/2019-September/018329.html</a><br>
&gt;<br>
&gt; I could definitely use something like this, so I am thinking of <br>
&gt; putting up the<br>
&gt; commit to do the: run any run-ci.sh in the repo.<br>
&gt;<br>
&gt; Are there any additional ideas or other comments on a way to do this?<=
br>
&gt;<br>
&gt; Thanks<br>
<br>
</blockquote></div>

--0000000000009228cd0595bdf935--
