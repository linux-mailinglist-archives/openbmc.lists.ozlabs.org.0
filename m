Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 169ED2A972A
	for <lists+openbmc@lfdr.de>; Fri,  6 Nov 2020 14:42:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSM4s0TwRzDrN8
	for <lists+openbmc@lfdr.de>; Sat,  7 Nov 2020 00:42:05 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d31;
 helo=mail-io1-xd31.google.com; envelope-from=gmouse@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=nEIwPMDW; dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSM362lt3zDr3Y
 for <openbmc@lists.ozlabs.org>; Sat,  7 Nov 2020 00:40:31 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id m9so1469501iox.10
 for <openbmc@lists.ozlabs.org>; Fri, 06 Nov 2020 05:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JIX6+Xec82HNBm960btN2El/gvPQCchYgfAoBD8RLGE=;
 b=nEIwPMDWt1VG+YSWtO8uaAx/6p+9aJhTvUBOKoWqPizZzYT2uoOyyZv0u4oMzv/9is
 6Md9khszn/y0UbH6b8IF8dLVjG3Ww5kFXTxseS9T4+NYenpDzXU/6ihjhAejzPqE8z5B
 M+vNeMaUMMSoXc7RDobUXwk6LA56humsByDeWv+R88SDnzYjPCKAEQcZfp8tpfbRh72h
 tzBwpqaBFafxfuOeuFO5eAH3vsK2hrVMVCaH/vxGh2bY40qQyhDEC9qNY8T/tawyNWkV
 aHfJ9mBfC81M/jIID13egzww9mYUs6/lmdo4IlM0ugHnH31tz9TK4lWjrm+eWx06BX6R
 WIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JIX6+Xec82HNBm960btN2El/gvPQCchYgfAoBD8RLGE=;
 b=oySsjuQuGWeGHqIkunuCsz5IfXeQu9+FvkOEck+HyLaMCQ3U7N2kKVsR38sQHKaDfY
 hka21Tub+bc+SMVFUSW1tPGhFsl4XfHtKkx7WvJqEoqivVkNnzAjOLP1qkTYVxWPKGPy
 ZFeZJbssltRAZWbmH74JIg6VSkVolJWfjWQZqkK7CXScG8niLMA9MTQ66p+q9ARNwsRi
 oBdKgX+OFqzH5rIXD/Sr5k7GvvV0vpfUrmrkdn4AddJ5RrtMoCOQUB8XuD6zKVZZohtb
 GGcjS+tSRwhomOcRGLFakwlTSMOXVZ4kQJcyIUgnn+iHn2S1dlRD3abNIwMNPWito7p1
 M9hw==
X-Gm-Message-State: AOAM5330oDuF1ufnevHf1xed6+J2bv3eH/6CA1Pv4EnQ+THBnwJjO66c
 f7pYdsTwR/VxtdPa4ujMWfFVolDugflVdhK7vHcW4Q==
X-Google-Smtp-Source: ABdhPJwSvtcmX7E8Su/YCjgzXlvLiAnr0XhyJ2AT2SNibjJXHC7MVmrdh3b1KHEweOSrWoZyLEN14V51PsRHGVGz6wU=
X-Received: by 2002:a5d:9042:: with SMTP id v2mr1302251ioq.98.1604670027676;
 Fri, 06 Nov 2020 05:40:27 -0800 (PST)
MIME-Version: 1.0
References: <HK2PR03MB45804A1D770024303FC50FCAD3140@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CAHsrh9KO6jxKY1Oi6=8Gk74gF+Rrhz+9HN3UgRpO16st0RmjRQ@mail.gmail.com>
 <ef502742-673b-4aeb-8614-f305a0f0053a@www.fastmail.com>
 <HK2PR03MB4580C4DF82B1089E34B97311D3100@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CADVsX8-9FMwUrjnNzKdEX2CRHRNr0nwFyy74U74OozQHWfXpVA@mail.gmail.com>
 <HK2PR03MB4580DB8C2DD31082F2BEFB4DD3110@HK2PR03MB4580.apcprd03.prod.outlook.com>
 <CADVsX885665jhTuRVt5MjARNr_Ka7KUmkbN7J5vP7G+09qrYXQ@mail.gmail.com>
 <CACkAXSrDq+OOFc-44J=KcJw14XQorL=OUpORy_gzitn09yb7Eg@mail.gmail.com>
 <HK2PR03MB45802CA98BD94FE35F318F7DD3ED0@HK2PR03MB4580.apcprd03.prod.outlook.com>
In-Reply-To: <HK2PR03MB45802CA98BD94FE35F318F7DD3ED0@HK2PR03MB4580.apcprd03.prod.outlook.com>
From: Anton Kachalov <rnouse@google.com>
Date: Fri, 6 Nov 2020 14:40:14 +0100
Message-ID: <CADVsX89sKUU4ED-Xg+yk3B-KQmpKzCvjnd0Gr6KjdbgKq+98GQ@mail.gmail.com>
Subject: Re: [External] Re: SELinux support question
To: Ivan Li11 <rli11@lenovo.com>
Content-Type: multipart/alternative; boundary="000000000000fb9ebc05b3705a9a"
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
 Artem Senichev <artemsen@gmail.com>, Jayanth Othayoth <ojayanth@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000fb9ebc05b3705a9a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello, Ivan.

I'm unsure how policies are being built in Yocto. Usually, you should have
/etc/selinux populated in your image with precompiled policies. At least,
some default ones.

On Fri, 6 Nov 2020 at 11:06, Ivan Li11 <rli11@lenovo.com> wrote:

> Hi Anton and Jayanth,
>
>
>
> Thanks your suggestion, it=E2=80=99s workable to get correct status after=
 adding
> =E2=80=9Cselinux=E2=80=9D to systemd bbappened file.
>
>
>
> BTW,  may I check with you what does =E2=80=9Cprecompiled policies under
> /etc/selinux=E2=80=9D mean ?
>
> Does it mean that I need to add =E2=80=9CPREFERRED_PROVIDER_virtual/refpo=
licy =3D
> "refpolicy-minimum"=E2=80=9D to build/conf/local.conf file to assign poli=
cy in
> advance ?
>
>
>
> Thanks,
>
> Ivan
>
> *From:* Jayanth Othayoth <ojayanth@gmail.com>
> *Sent:* Thursday, November 5, 2020 3:37 PM
> *To:* Anton Kachalov <rnouse@google.com>
> *Cc:* Ivan Li11 <rli11@lenovo.com>; Andrew Jeffery <andrew@aj.id.au>;
> openbmc@lists.ozlabs.org; Artem Senichev <artemsen@gmail.com>
> *Subject:* Re: [External] Re: SELinux support question
>
>
>
>
>
> I tried on one of the IBM box which got 32MB flash in 2018 time frame and
> was able to got BMC read state . Reference patch (POC only) is available
> here
>
>
>
>
> https://gerrit.openbmc-project.xyz/q/topic:%22selinux%22+(status:open%20O=
R%20status:merged)
>
>
>
> On Wed, Nov 4, 2020 at 8:06 PM Anton Kachalov <rnouse@google.com> wrote:
>
> Hello, Ivan.
>
>
>
> Please check if the systemd has been compiled with selinux feature
> enabled. It should be in charge of enforcing selinux rules at boot.
>
>
>
> You should add "selinux" to PACKAGECONFIG over here:
>
>
> https://github.com/openbmc/openbmc/blob/master/meta-phosphor/recipes-core=
/systemd/systemd_%25.bbappend#L4
>
>
>
> As well as adding "selinux" to the DISTRO_FEATURES variable in your
> build/conf/local.conf file.
>
>
>
> Do you have precompiled policies under /etc/selinux ?
>
>
>
> If it still doesn't work, please also attach a boot log.
>
>
>
>
>
> On Tue, 3 Nov 2020 at 18:52, Ivan Li11 <rli11@lenovo.com> wrote:
>
> Hi Anton,
>
>
>
> Thanks your help and support.
>
> I=E2=80=99ve followed your suggestion to enable selinux kernel configurat=
ion and
> have seen kernel message =E2=80=9C[ 0.002268] SELinux:  Initializing.=E2=
=80=9D during boot
> time, but still returns =E2=80=9CDisabled=E2=80=9D after executing getenf=
orce command.
>
> The selinux mode and type I set in /etc/selinux/config file is permissive
> and minimum.  Could you help to advise me whether there=E2=80=99s some se=
ttings
> need to set to avoid this problem.
>
>
>
> Thanks,
>
> Ivan
>
> *From:* Anton Kachalov <rnouse@google.com>
> *Sent:* Tuesday, November 3, 2020 3:50 AM
> *To:* Ivan Li11 <rli11@lenovo.com>
> *Cc:* Andrew Jeffery <andrew@aj.id.au>; Artem Senichev <artemsen@gmail.co=
m>;
> openbmc@lists.ozlabs.org
> *Subject:* Re: [External] Re: SELinux support question
>
>
>
> Hello, Ivan.
>
>
>
> Perhaps, you should enable selinux kernel configuration as well. The
> openbmc kernels, if I'm not mistaken, have different recipes.
>
>
>
> The default configuration relies on linux-yocto package:
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-kerne=
l/linux
>
>
>
> You should include this selinux.cfg in on of the openbmc kernel layers:
>
>
>
> SRC_URI +=3D "file://selinux.cfg"
>
>
>
> and copy selinux.cfg to one of the local files location.
>
>
>
> On Mon, 2 Nov 2020 at 18:46, Ivan Li11 <rli11@lenovo.com> wrote:
>
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
> > > The problem is that Python significantly increases image size, it wil=
l
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
>

--000000000000fb9ebc05b3705a9a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, Ivan.<div><br></div><div>I&#39;m unsure how policie=
s are being built in Yocto. Usually, you should have /etc/selinux populated=
 in your image with precompiled policies. At least, some default ones.</div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Fri, 6 Nov 2020 at 11:06, Ivan Li11 &lt;<a href=3D"mailto:rli11@lenovo.=
com">rli11@lenovo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">





<div lang=3D"ZH-TW">
<div class=3D"gmail-m_-966113140234437432WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Hi Anton and Jayanth,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks your suggestion, it=E2=80=99s workable to get correct stat=
us after adding =E2=80=9Cselinux=E2=80=9D to systemd bbappened file.
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">BTW, =C2=A0may I check with you what does =E2=80=9Cprecompiled po=
licies under /etc/selinux=E2=80=9D mean ?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Does it mean that I need to add =E2=80=9CPREFERRED_PROVIDER_virtu=
al/refpolicy =3D &quot;refpolicy-minimum&quot;=E2=80=9D to build/conf/local=
.conf file to assign policy in advance ?
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Ivan<u></u><u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0cm 0cm 0cm 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Jayanth Othayoth &lt;<a href=
=3D"mailto:ojayanth@gmail.com" target=3D"_blank">ojayanth@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, November 5, 2020 3:37 PM<br>
<b>To:</b> Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com" target=
=3D"_blank">rnouse@google.com</a>&gt;<br>
<b>Cc:</b> Ivan Li11 &lt;<a href=3D"mailto:rli11@lenovo.com" target=3D"_bla=
nk">rli11@lenovo.com</a>&gt;; Andrew Jeffery &lt;<a href=3D"mailto:andrew@a=
j.id.au" target=3D"_blank">andrew@aj.id.au</a>&gt;; <a href=3D"mailto:openb=
mc@lists.ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>; Artem =
Senichev &lt;<a href=3D"mailto:artemsen@gmail.com" target=3D"_blank">artems=
en@gmail.com</a>&gt;<br>
<b>Subject:</b> Re: [External] Re: SELinux support question<u></u><u></u></=
span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I tried on one of the IBM box w=
hich got 32MB flash in 2018 time frame and was able to got BMC read state .=
 Reference patch (POC only) is available here
<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://gerrit.openb=
mc-project.xyz/q/topic:%22selinux%22+(status:open%20OR%20status:merged)" ta=
rget=3D"_blank">https://gerrit.openbmc-project.xyz/q/topic:%22selinux%22+(s=
tatus:open%20OR%20status:merged)</a><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Nov 4, 2020 at 8:06 PM =
Anton Kachalov &lt;<a href=3D"mailto:rnouse@google.com" target=3D"_blank">r=
nouse@google.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello, Ivan.<u></u><u></u></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Please check if the systemd has=
 been compiled with selinux feature enabled. It should be in charge of enfo=
rcing selinux rules at boot.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You should add &quot;selinux&qu=
ot; to PACKAGECONFIG over here:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://github.com/o=
penbmc/openbmc/blob/master/meta-phosphor/recipes-core/systemd/systemd_%25.b=
bappend#L4" target=3D"_blank">https://github.com/openbmc/openbmc/blob/maste=
r/meta-phosphor/recipes-core/systemd/systemd_%25.bbappend#L4</a><u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">As well as adding &quot;selinux=
&quot; to the DISTRO_FEATURES variable in your build/conf/local.conf file.<=
u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Do you have precompiled policie=
s under /etc/selinux ?<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">If it still=C2=A0doesn&#39;t wo=
rk, please also attach a boot log.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Tue, 3 Nov 2020 at 18:52, Iv=
an Li11 &lt;<a href=3D"mailto:rli11@lenovo.com" target=3D"_blank">rli11@len=
ovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin-left:4=
.8pt;margin-right:0cm">
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Hi Anton,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks your help and support.</span><span lang=3D"EN-US"><u></u><=
u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">I=E2=80=99ve followed your suggestion to enable selinux kernel co=
nfiguration and have seen kernel message =E2=80=9C[ 0.002268] SELinux:=C2=
=A0
 Initializing.=E2=80=9D during boot time, but still returns =E2=80=9CDisabl=
ed=E2=80=9D after executing getenforce command.</span><span lang=3D"EN-US">=
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">The selinux mode and type I set in /etc/selinux/config file is pe=
rmissive and minimum.=C2=A0 Could you help to advise me whether
 there=E2=80=99s some settings need to set to avoid this problem.</span><sp=
an lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">=C2=A0</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Thanks,</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:Calibri,sa=
ns-serif">Ivan</span><span lang=3D"EN-US"><u></u><u></u></span></p>
<div style=3D"border-top:none currentcolor;border-right:none currentcolor;b=
order-bottom:none currentcolor;border-left:1.5pt solid blue;padding:0cm 0cm=
 0cm 4pt">
<div>
<div style=3D"border-right:none currentcolor;border-bottom:none currentcolo=
r;border-left:none currentcolor;border-top:1pt solid currentcolor;padding:3=
pt 0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:11pt;font=
-family:Calibri,sans-serif">From:</span></b><span lang=3D"EN-US" style=3D"f=
ont-size:11pt;font-family:Calibri,sans-serif"> Anton
 Kachalov &lt;<a href=3D"mailto:rnouse@google.com" target=3D"_blank">rnouse=
@google.com</a>&gt;
<br>
<b>Sent:</b> Tuesday, November 3, 2020 3:50 AM<br>
<b>To:</b> Ivan Li11 &lt;<a href=3D"mailto:rli11@lenovo.com" target=3D"_bla=
nk">rli11@lenovo.com</a>&gt;<br>
<b>Cc:</b> Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au" target=3D"=
_blank">andrew@aj.id.au</a>&gt;; Artem Senichev &lt;<a href=3D"mailto:artem=
sen@gmail.com" target=3D"_blank">artemsen@gmail.com</a>&gt;;
<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_blank">openbmc@lists=
.ozlabs.org</a><br>
<b>Subject:</b> Re: [External] Re: SELinux support question</span><span lan=
g=3D"EN-US"><u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello, Ivan.<u></u><u></u></spa=
n></p>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Perhaps, you should enable seli=
nux kernel configuration as well. The openbmc kernels, if I&#39;m not mista=
ken, have different recipes.<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The default configuration relie=
s on linux-yocto package:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"http://git.yoctoproj=
ect.org/cgit/cgit.cgi/meta-selinux/tree/recipes-kernel/linux" target=3D"_bl=
ank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux/tree/recipes-ke=
rnel/linux</a><u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">You should include this selinux=
.cfg in on of the openbmc kernel layers:<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRC_URI=C2=A0+=3D &quot;<a>file=
://selinux.cfg</a>&quot;<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">and copy selinux.cfg to one of =
the local files location.<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=C2=A0<u></u><u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Mon, 2 Nov 2020 at 18:46, Iv=
an Li11 &lt;<a href=3D"mailto:rli11@lenovo.com" target=3D"_blank">rli11@len=
ovo.com</a>&gt; wrote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-top:none currentcolor;border-right:none current=
color;border-bottom:none currentcolor;border-left:1pt solid rgb(204,204,204=
);padding:0cm 0cm 0cm 6pt;margin:5pt 0cm 5pt 4.8pt">
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
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
x" target=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux=
</a>), you can try<br>
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
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux" target=3D"_bl=
ank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-selinux</a>) and 64MiB =
flash part.<br>
But encountered one problem which is when I use command &quot;getenforce&qu=
ot; to check SELinux mode, it always returns &quot;Disabled&quot; even if S=
ELinux mode in config file &#39;/etc/selinux/config&#39; is permissive or e=
nforcing by default.<br>
<br>
Please help to advise it.=C2=A0 <u></u><u></u></span></p>
</blockquote>
</div>
</div>
</div>
</div>
</blockquote>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000fb9ebc05b3705a9a--
