Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED834295128
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 18:55:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGc7H53vCzDqdx
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 03:55:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=tbnguyen1985@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BM4UdgVY; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGc6R6QCfzDq8M
 for <openbmc@lists.ozlabs.org>; Thu, 22 Oct 2020 03:54:39 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id s17so1435881qvr.11
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 09:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGdkICfqtP5CGzkysKMvuMjvARCKxrqKKtDc6IGXHkk=;
 b=BM4UdgVYPZgH3VfoXnSC/mAsb6nwJlDoLoNLmZYfO99iwpLyRsyL4h6FfQu6IytywK
 iG19LLYBFscxvUoKW1V9KicntEfo/mNbnN0AiqFqUueba/UatLy2GVK5+u3Yj7l1CHo6
 k5PRHTyIbBbcwrRsyNQ89QSqizO/0nC0hqFYcJsB+LiPu6sB8wt4Hx6nMD1S4hqJtS0u
 PTR/3yUprjd2uTGUxrbG/Stf4ft+oOTXgeAmtH/TVb27qWHXrVLD2tkylq50EmNX+hgn
 TpmEMbqlDYI09Da5rgsuIdRoHU46TOxNrBFH/U4A0n0cv7d9uNlVhCu6lbslYLphPkPm
 ttlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGdkICfqtP5CGzkysKMvuMjvARCKxrqKKtDc6IGXHkk=;
 b=S02VGoljL351xVVSry3N4FkGGjdmV5LblqoJ92jx8CILb+zP7kxw0MnC1I+MSzaDIJ
 iGoiJLI9FwA2niP5E45CYiC+TuTNwWwjzvahj2EHRX88nGXTwYE0FJREE/la2cly2mMM
 174Ca+lgg93SizJ+FZIDJG52BeT5pcuP9XZwHdzIjhcHGHqxZEoSPQ+nyGTSZ22Q8G33
 xYV2Z7MizNTSi8BcGu1NW6liiJM0HAhdTlPNGL4zRJvR6e+5mT5MPt/wY4uSRHZS6svz
 UkU50s55VUT2KjUAThVcPAXypV0o8mW+I5ZMxyExQowbV0vXDGPVX95tIw0Soa4NfZgR
 e+aA==
X-Gm-Message-State: AOAM532w8wODIoueDOH/Gm61BuWrarx/cpzYrT7u6KdUuL/29YkP8RbZ
 4ofCxdbdYe+PoJuoCvDygT6qaR6ny2EbamNVDmA=
X-Google-Smtp-Source: ABdhPJwjAI0x9x2Q1JIG8Aoo9J7aHauF1zn+55QBMyTSaBbTaGn5W9tSAIfPfu8EWtI3nqcAwndcLjNoy2kCCy72gtE=
X-Received: by 2002:ad4:4105:: with SMTP id i5mr3720023qvp.47.1603299274798;
 Wed, 21 Oct 2020 09:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <CALioo35zJdqL7uAhvxAuqa7c16wAdtfc+JVSz6Tg5UG5Yp8L3w@mail.gmail.com>
 <CACWQX833j+remiYr8qOdrZZ4z3L3D_GX0q6z4MPJDu8J4Nv+Pg@mail.gmail.com>
 <CALioo36kortxuLPJQmc7xtDVN=jAxPNf481ovFkc2jQfYu8-rg@mail.gmail.com>
 <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
In-Reply-To: <90950FB3-E1B3-4ACE-97C5-CB9582A94456@fb.com>
From: Thu Ba Nguyen <tbnguyen1985@gmail.com>
Date: Wed, 21 Oct 2020 23:54:23 +0700
Message-ID: <CALioo37b-BjgUdfZz2Vm+=6K6VMYRO9auyuHHo7=AZBFpoBzdw@mail.gmail.com>
Subject: Re: Enable/Disable some sensors when Host On/Off
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000be38c005b23133f2"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000be38c005b23133f2
Content-Type: text/plain; charset="UTF-8"

Hi Vijay,

I took a look on entity-manager and openbmc source.
Don't have many companies  using entity-manager model to support sensors.

Regards
Thu Nguyen.


On Wed, Oct 21, 2020 at 7:15 AM Vijay Khemka <vijaykhemka@fb.com> wrote:

>
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
> behalf of Thu Ba Nguyen <tbnguyen1985@gmail.com>
> *Date: *Monday, October 19, 2020 at 11:23 AM
> *To: *Ed Tanous <ed@tanous.net>
> *Cc: *OpenBMC Maillist <openbmc@lists.ozlabs.org>
> *Subject: *Re: Enable/Disable some sensors when Host On/Off
>
>
>
> Hi Ed Tanous,
>
>
>
> > Thanks for your info,
>
> > But in your platform we are using phosphor-hwmon to manage sensors.
>
> > We don't use entity-manager.
>
> > As I knew we can't use both entity-manager and phosphor-hwmon for one
> project.
>
>
>
> You can use both but for different sensors. You can decide what sensors to
> configure
>
> via EM/dbus-sensors and which one for phosphor-hwmon.
>
>
>
> Regards
>
> Thu Nguyen.
>

--000000000000be38c005b23133f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Vijay,</div><div><br></div>I took a look on entity=
-manager=C2=A0and openbmc source.<div>Don&#39;t have=C2=A0many companies =
=C2=A0using entity-manager model to support sensors.</div><div><br></div><d=
iv>Regards</div><div>Thu Nguyen.</div><div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2020=
 at 7:15 AM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhe=
mka@fb.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US" style=3D"word-wrap:break-word">
<div class=3D"gmail-m_-1371938094071620715WordSection1">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-style:solid none none;border-top-width:1pt;border-top-=
color:rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Thu Ba Nguyen &lt;<a hr=
ef=3D"mailto:tbnguyen1985@gmail.com" target=3D"_blank">tbnguyen1985@gmail.c=
om</a>&gt;<br>
<b>Date: </b>Monday, October 19, 2020 at 11:23 AM<br>
<b>To: </b>Ed Tanous &lt;<a href=3D"mailto:ed@tanous.net" target=3D"_blank"=
>ed@tanous.net</a>&gt;<br>
<b>Cc: </b>OpenBMC Maillist &lt;<a href=3D"mailto:openbmc@lists.ozlabs.org"=
 target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Re: Enable/Disable some sensors when Host On/Off<u></u><u><=
/u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Hi Ed Tanous,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Thanks for your info,=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; But in your platform we are using phosphor-hwmo=
n to manage sensors.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; We don&#39;t use entity-manager.<u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal">&gt; As I knew we can&#39;t use both entity-manager =
and phosphor-hwmon for one project.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">You can use both but for different sensors. You can =
decide what sensors to configure<u></u><u></u></p>
<p class=3D"MsoNormal">via EM/dbus-sensors and which one for phosphor-hwmon=
.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Regards<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Thu Nguyen.<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000be38c005b23133f2--
