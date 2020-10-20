Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5960A294552
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 01:06:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG8Pk2wW4zDqg4
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 10:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eHTIV0uq; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG8Nn6qflzDqX3
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 10:05:28 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id h140so455364qke.7
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 16:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=02qH45Uovyd1BGTd8lJy8UtfqgcV5E6vIKaIRSnMxLo=;
 b=eHTIV0uqreXpvqEWtmYQaJy9Km+5xyvkMwDoL13Ebn8hwF1I1CAncIi5F5aUs/ZLbl
 ADtEU3N4UoQy4Q7OGERBfdco7aPX/Lv1yJQMVNCrVpeclAmw+btOn8fVlRGPcIAAs/c8
 zpD1JfaO9rU9RVR6p98/fddqFBxp38vcKjgaduZez+npJIrSriM2PuxozaA+TjD1QbKd
 qb8Dsw6nCV2O5NNornNJNPBoOZMb7eT+FaeEY8SmB2dRp6Pou/eQt0tqEDSK3hDKed8o
 kThH4Lz46ud79h+g4ZPslNpyMweYLpeuuy9TUQOLncjYrNUSybkwUPe3GFE455ABvarN
 XMLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=02qH45Uovyd1BGTd8lJy8UtfqgcV5E6vIKaIRSnMxLo=;
 b=mqnB4FRHExau+v/K4qGqiHoRZNV5y+8Y0nAqaF1DNOm/gJrtqvqTI4wBnpW8LNnZEN
 /GE95X3iC7w+KRQyZ2YljyM2brZSrgfS3XNVEozqbIOtmBZNXDMCOOWuBSv7cCTt3i/S
 SMQMFu9SU6k8rIFHQLQ9otls8r8Sjs9+Xdze6zerc/+POL3DAkGMpINme8sViBzUb/kZ
 yg5p/dkz42yRA5uSTc5pL2MMiG3uoA4FDdByLQi5Kh3AcojfJzZf9qi2dYV1uzTVnUtb
 kS8DXRcnNDgaib99DBayIt3QWEEcwOPvjV2jjH/ICstPOoRsRWHqN/aNR7RL0t9oYyV6
 A3dg==
X-Gm-Message-State: AOAM532L9d6Qf++tFTTNzPhNkVlqI+ejR2czWqOKGhYLcv+BaTrEWL3t
 Vwi1Ht9gjIHR731vfLVv+GEHvU18I6h5vD7LoFLOb2k7hVM=
X-Google-Smtp-Source: ABdhPJwJV7kB6GxycZv1Ci/Yrn2blah+D5fdQp7+eTUySBtyFPTrrs/rhBuB1WmE9yh2aAl2P6jol7mZFatbpZ3ppiw=
X-Received: by 2002:a37:7286:: with SMTP id n128mr563249qkc.423.1603235124256; 
 Tue, 20 Oct 2020 16:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <CACWQX80+01RjO5hu3OQUrZKaMLz6LDR_-iAEdKPLDEHv4RZ=rQ@mail.gmail.com>
In-Reply-To: <CACWQX80+01RjO5hu3OQUrZKaMLz6LDR_-iAEdKPLDEHv4RZ=rQ@mail.gmail.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 21 Oct 2020 06:05:12 +0700
Message-ID: <CALioo34KSwMudvA5kcK9Jx-rEN0N-sMjG5ETk52-EXL8RN7byg@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Ed Tanous <ed@tanous.net>
Content-Type: multipart/alternative; boundary="00000000000012a8ee05b2224488"
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

--00000000000012a8ee05b2224488
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 20, 2020 at 1:32 AM Ed Tanous <ed@tanous.net> wrote:

> On Mon, Oct 19, 2020 at 11:22 AM Thu Ba Nguyen <tbnguyen1985@gmail.com>
> wrote:
> >
> > Hi Ed Tanous,
> >
> > Thanks for your info,
> > But in your platform we are using phosphor-hwmon to manage sensors.
> > We don't use entity-manager.
> > As I knew we can't use both entity-manager and phosphor-hwmon for one
> project.
>
> Understood.  i was mostly just pointing out that there might be
> logic/implementation details you can pull over into phosphor-hwmon.
>

 I think adding a "PowerState" configuration in each sensor is a good
solution.
 We can use this configuration to identify the concerning host sensors in
phosphor-hwmon.
 Those sensors will be removed from Dbus when
xyz.openbmc_project.State.Host.HostState is Off.
 And they will be back to Dbus when the host is On.

--00000000000012a8ee05b2224488
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></d=
iv><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Oct 20, 2020 at 1:32 AM Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net">ed@=
tanous.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">On Mon, Oct 19, 2020 a=
t 11:22 AM Thu Ba Nguyen &lt;<a href=3D"mailto:tbnguyen1985@gmail.com" targ=
et=3D"_blank">tbnguyen1985@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Ed Tanous,<br>
&gt;<br>
&gt; Thanks for your info,<br>
&gt; But in your platform we are using phosphor-hwmon to manage sensors.<br=
>
&gt; We don&#39;t use entity-manager.<br>
&gt; As I knew we can&#39;t use both entity-manager and phosphor-hwmon for =
one project.<br>
<br>
Understood.=C2=A0 i was mostly just pointing out that there might be<br>
logic/implementation details you can pull over into phosphor-hwmon.<br></bl=
ockquote><div>=C2=A0</div><div>=C2=A0I think adding a=C2=A0&quot;<span styl=
e=3D"color:rgb(3,47,98);font-family:SFMono-Regular,Consolas,&quot;Liberatio=
n Mono&quot;,Menlo,monospace;font-size:12px;white-space:pre;background-colo=
r:rgb(255,251,221)">PowerState</span>&quot; configuration in each sensor is=
 a good solution.</div><div>=C2=A0We can use this configuration to identify=
 the concerning host sensors in phosphor-hwmon.</div><div>=C2=A0Those senso=
rs will be removed from Dbus when xyz.openbmc_project.State.Host.HostState =
is Off.</div><div>=C2=A0And they will be back to Dbus when the host is On.<=
/div></div></div></div></div>

--00000000000012a8ee05b2224488--
