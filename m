Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF0B2A348D
	for <lists+openbmc@lfdr.de>; Mon,  2 Nov 2020 20:51:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQ3SW1W2DzDqN6
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 06:51:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::12e;
 helo=mail-il1-x12e.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=TqIOwtDG; dkim-atps=neutral
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQ3RW18shzDqML
 for <openbmc@lists.ozlabs.org>; Tue,  3 Nov 2020 06:50:14 +1100 (AEDT)
Received: by mail-il1-x12e.google.com with SMTP id v18so14076364ilg.1
 for <openbmc@lists.ozlabs.org>; Mon, 02 Nov 2020 11:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TmMm3yMfaUn0BWjWo1kIIrbVeQA4Qvl9pWZTwJOsmd4=;
 b=TqIOwtDGQtmsJRorF9Qs6lGcm4oaPGf/PMrxvE43VJWI5L65t4w8I8w/20BCk/C+sN
 oBknh0u6T6HOu1/B2/szttqvvKg/hZ0NwVJaBVUUwg531RpftM2WBFyJS8PUQ15xJufX
 otTEjAcQgVXqhI8Nymw+jcCfeA5ZTphksJOW9mdMB3I9FjpmMJEqD5L4PkE0cjShaoLQ
 9a6p1l+5JyUa6yT/kNGvB07u+jdRceQxBUXXvvTONdwpSmftTKu6nZbeAYBcRoCwshVj
 ADi0+0Cg5b/dfSVPQD08GbQdrbUDsVHel4a4E02Datx9MZs6PmDVubjtpvb9LWMMZZsR
 2XOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TmMm3yMfaUn0BWjWo1kIIrbVeQA4Qvl9pWZTwJOsmd4=;
 b=P+5REs2nEU/N7GyfY+D6vkb8m5MZ2x/NxXX/9c5lX9EIF9OEGVtvVjzreWuk9ZEmVN
 DN4g6kI4MoTKPnW69w2dm4QEXN4+uMl/c6MyH0dJnu0aC9lHWF2Y8ob7FF+A8EOyGVfT
 z4IoH2xmqQcfS+5RWYfX1PVqxRZ2YRI/SSbZu9HggHXzBsjmSFB26bG4/+NI0EFb+I+s
 L2aOSx1vewsirSttJKVD/POdhEN0xjpQWUawoXVqTKjERipq2os9PcjFDr14Zld/qLwh
 vPhUYk5+0zig61nUTOR0ztepubmsKSuXqPNjL1At6FgjD9XzhdrkwXmARPYnu5/7MIhB
 Bs3Q==
X-Gm-Message-State: AOAM5308CWujSRg106vhZiU6q+NiDfXcYtzIPxZLNuwpJ7oj2bSSGSkx
 3ol/fNMoG+yv9nKMoPGmLS7LawlnPKGTcfBP9fCf7A==
X-Google-Smtp-Source: ABdhPJwSgsQjpFyTtIp/gqyGHvH6V/3YwqTtaifrpArg1o8CJaFlyTuztoVFYWxo/g0+zcsEQfpDsPutqGVkK3h726Y=
X-Received: by 2002:a05:6e02:4aa:: with SMTP id
 e10mr11343883ils.58.1604346610866; 
 Mon, 02 Nov 2020 11:50:10 -0800 (PST)
MIME-Version: 1.0
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
 <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
 <HK2PR03MB4580C4DF82B1089E34B97311D3100@HK2PR03MB4580.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR03MB4580C4DF82B1089E34B97311D3100@HK2PR03MB4580.apcprd03.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Mon, 2 Nov 2020 20:49:59 +0100
Message-ID: <CADVsX8-9FMwUrjnNzKdEX2CRHRNr0nwFyy74U74OozQHWfXpVA@mail.gmail.com>
Subject: Re: [External] Re: SELinux support question
To: Ivan Li11 <rli11@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000d6c0ac05b3250dc2"
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Artem Senichev <artemsen@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000d6c0ac05b3250dc2
Content-Type: text/plain; charset="UTF-8"

Hello, Ivan.

Perhaps, you should enable selinux kernel configuration as well. The
openbmc kernels, if I'm not mistaken, have different recipes.

The default configuration relies on linux-yocto package:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-kernel/linux

You should include this selinux.cfg in on of the openbmc kernel layers:

SRC_URI += "file://selinux.cfg"

and copy selinux.cfg to one of the local files location.

On Mon, 2 Nov 2020 at 18:46, Ivan Li11 <rli11@lenovo.com> wrote:

>
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@aj.id.au>
> > Sent: Monday, November 2, 2020 8:54 AM
> > To: Artem Senichev <artemsen@gmail.com>; Ivan Li11 <rli11@lenovo.com>
> > Cc: openbmc@lists.ozlabs.org
> > Subject: [External] Re: SELinux support question
> >
> >
> >
> > On Fri, 30 Oct 2020, at 16:25, Artem Senichev wrote:
> > > Hi Ivan,
> > >
> > > Yocto has a layer for SELinux
> > > (http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux), you can try
> > > it.
> > > But the layer depends on Python for management tools, which does not
> > > exist in the OpenBMC image anymore.
> > > The problem is that Python significantly increases image size, it will
> > > be more than 32MiB, which causes some troubles with qemu emulation.
> >
> > The problem is broader than qemu though, it would also be broken on any
> > platform shipping a 32MiB flash part if the image exceeds 32MiB.
> >
> > That said, if there are systems that ship bigger parts and enabling
> SELinux for
> > those is feasible, we should add those platform models to qemu so
> emulating
> > them isn't constrained by the existing platform support.
> >
> > Andrew
>
> Hi Andrew and Artem,
> Per your suggestion, I try to enable SELinux with Yocto SELinux layer(
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux) and 64MiB flash
> part.
> But encountered one problem which is when I use command "getenforce" to
> check SELinux mode, it always returns "Disabled" even if SELinux mode in
> config file '/etc/selinux/config' is permissive or enforcing by default.
>
> Please help to advise it.
>

--000000000000d6c0ac05b3250dc2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, Ivan.<div><br></div><div>Perhaps, you should enable=
 selinux kernel configuration as well. The openbmc kernels, if I&#39;m not =
mistaken, have different recipes.</div><div><br></div><div>The default conf=
iguration relies on linux-yocto package:</div><div><a href=3D"http://git.yo=
ctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-kernel/linux">http:/=
/git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-kernel/linux<=
/a><br></div><div><br></div><div>You should include this selinux.cfg in on =
of the openbmc kernel layers:</div><div><br></div><div>SRC_URI=C2=A0+=3D &q=
uot;file://selinux.cfg&quot;</div><div><br></div><div>and copy selinux.cfg =
to one of the local files location.</div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 2 Nov 2020 at 18:46, Ivan =
Li11 &lt;<a href=3D"mailto:rli11@lenovo.com">rli11@lenovo.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
&gt; -----Original Message-----<br>
&gt; From: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"=
_blank">andrew@aj.id.au</a>&gt;<br>
&gt; Sent: Monday, November 2, 2020 8:54 AM<br>
&gt; To: Artem Senichev &lt;<a href=3D"mailto:artemsen@gmail.com" target=3D=
"_blank">artemsen@gmail.com</a>&gt;; Ivan Li11 &lt;<a href=3D"mailto:rli11@=
lenovo.com" target=3D"_blank">rli11@lenovo.com</a>&gt;<br>
&gt; Cc: <a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">open=
bmc@lists.ozlabs.org</a><br>
&gt; Subject: [External] Re: SELinux support question<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Fri, 30 Oct 2020, at 16:25, Artem Senichev wrote:<br>
&gt; &gt; Hi Ivan,<br>
&gt; &gt;<br>
&gt; &gt; Yocto has a layer for SELinux<br>
&gt; &gt; (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinu=
x" rel=3D"noreferrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cg=
it.cgi/meta-selinux</a>), you can try<br>
&gt; &gt; it.<br>
&gt; &gt; But the layer depends on Python for management tools, which does =
not<br>
&gt; &gt; exist in the OpenBMC image anymore.<br>
&gt; &gt; The problem is that Python significantly increases image size, it=
 will<br>
&gt; &gt; be more than 32MiB, which causes some troubles with qemu emulatio=
n.<br>
&gt; <br>
&gt; The problem is broader than qemu though, it would also be broken on an=
y<br>
&gt; platform shipping a 32MiB flash part if the image exceeds 32MiB.<br>
&gt; <br>
&gt; That said, if there are systems that ship bigger parts and enabling SE=
Linux for<br>
&gt; those is feasible, we should add those platform models to qemu so emul=
ating<br>
&gt; them isn&#39;t constrained by the existing platform support.<br>
&gt; <br>
&gt; Andrew<br>
<br>
Hi Andrew and Artem,<br>
Per your suggestion, I try to enable SELinux with Yocto SELinux layer(<a hr=
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux" rel=3D"norefe=
rrer" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-seli=
nux</a>) and 64MiB flash part.<br>
But encountered one problem which is when I use command &quot;getenforce&qu=
ot; to check SELinux mode, it always returns &quot;Disabled&quot; even if S=
ELinux mode in config file &#39;/etc/selinux/config&#39; is permissive or e=
nforcing by default.<br>
<br>
Please help to advise it.=C2=A0 <br>
</blockquote></div>

--000000000000d6c0ac05b3250dc2--
