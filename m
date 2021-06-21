Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5833AE8E7
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 14:18:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7pTQ0hKLz2yYV
	for <lists+openbmc@lfdr.de>; Mon, 21 Jun 2021 22:18:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=d3E2RnvR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=edtanous@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=d3E2RnvR; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7pT84pSYz2yY7
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 22:18:02 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id m3so10356344wms.4
 for <openbmc@lists.ozlabs.org>; Mon, 21 Jun 2021 05:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlG1B8mJ0Q/PG8U3mu178DGLMGbQRKySSvaoejZUuuY=;
 b=d3E2RnvRg0cxvbcqPkc/p9hk/Tvy4QNDaezf2o3ZnT7SHklDRfwV7+flZWE1tWSDib
 tJgD0xCE6cShDdf4anSgO+Nj+nnsvGRpc6JgzDRpMTCGYVa+2XpNX3+AjkOcynwz1R5l
 yqkBK81j1KgAfplEcBVJF3vE5xZ5yf6iAGUkZ9XrVtU/Ei1niS5ijI7OTOBmvpJ1PY5S
 4HAkS/MU+Ug6BGpuguDUdlcoQGcCNAmPWckNcK8KAddGYdxL17qLXKEFmryIqcWsMIHv
 qtid3X8iA/N5wAWqVqWkAQe0L0kOFfghPNXIKMcVAgGytxNTzHFgra0hKm0pOQDiDMaq
 BNAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlG1B8mJ0Q/PG8U3mu178DGLMGbQRKySSvaoejZUuuY=;
 b=siecHI3d7m7ixHDRz3osTiz4Yvq4sDIjZFljNM177ChHYfDD2eyqbIW7PozMXIgpLy
 3PD+pxG5MSTQhOzP3nGNSz+c2+hT5Pf2ZXiiVUW0frUFH+bt53Kg4ocv4erAFvkKOxOO
 HFKe6D8a7E33+cRiGXD60BK5K8U/Uru6m+WyYKDtK+KODMQxRo0LEvs4mC2uQkSgZkvv
 tO4K20q5M1B2YfMBT/WijeNRDVQ00kvrxpal4iT4UbnPnZIgnLyAB6a2fdLoSyZZwpQk
 xeNZ8gUF0/iTrNqdhA9rrFZJnwPLjFt4wWoufRd9Hli/WgBZl7JKYcUGDL5550VZAcEE
 o74w==
X-Gm-Message-State: AOAM531gX2NEyTpjnFGe/qDsrinT5PO6YcJk8q0NrKorDWD1u79X29hh
 RA8ORB+wMUOC2HX6k9TWpYIF6SylyRFyWrZImfsLiw==
X-Google-Smtp-Source: ABdhPJwaM8kgwx/XsUntGYlbx7MydmBdPpChWItctynEGF7RQrRXwx+t/TJR4629oMXe0Gt0YjOks6txAzbLIj/L9qo=
X-Received: by 2002:a05:600c:4e88:: with SMTP id
 f8mr27026104wmq.14.1624277875254; 
 Mon, 21 Jun 2021 05:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
In-Reply-To: <HK0PR04MB29649E3C07F77FD2FA2B3223FD0A9@HK0PR04MB2964.apcprd04.prod.outlook.com>
From: Ed Tanous <edtanous@google.com>
Date: Mon, 21 Jun 2021 05:17:44 -0700
Message-ID: <CAH2-KxBoi-OBBGG8Rvo612RfosB+5Q9-Xa+ddqVWbSPNi1bBFg@mail.gmail.com>
Subject: Re: Adding dependent service as Entity-manager to Ipmb-fru-service
To: Kumar Thangavel <thangavel.k@hcl.com>
Content-Type: multipart/alternative; boundary="000000000000c5d85805c545a978"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Ed Tanous <ed@tanous.net>, "Velumani T-ERS, HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000c5d85805c545a978
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 2:28 AM Kumar Thangavel <thangavel.k@hcl.com> wrote=
:

> Classification: *Confidential*
>
> Hi All,
>
>
>
>            Ipmb-fru-device deamon trying to read some dbus objects from
> entity-manager to get the ipmb bus details. Entity-manager daemon initial=
ly
> taking some time to load all the dbus objects. But Ipmb-fru-device deamon
> starts at system startup.
>
>
>
>            Since, Entity-manager deamon initially taking some time to loa=
d
> all the dbus objects, ipmb-fru-device getting the below error.
>
>
>
>           *Error* :
>
>           =E2=80=9Cipmb-fru-device[345]:   what():  sd_bus_call:
> org.freedesktop.DBus.Error.UnknownObject: Unknown object
> '/xyz/openbmc_project/inventory/system/board/Yosemite_V2_Baseboard/IpmbBu=
s1'.=E2=80=9D
>

The easiest way to explain this would be to just point you at code.  Every
dbus-sensor daemon handles this race condition;  I'd recommend looking at
the code in the relevant main(), and see how it does it.  If you have
trouble understanding it, feel free to message back here with specific line
numbers and questions and we should hopefully be able to get you sorted out=
.


>
>
>          When we restart EM deamon once, this error got resolved.
>
>
>
>          I tried to add EM service as dependent service to Ipmb-fru-devic=
e
> service. Added EM service in =E2=80=9CWants=E2=80=9D, =E2=80=9CAfter=E2=
=80=9D fields in Ipmb-fru-service
> service.
>
>
>
>          But, still EM deamon taking some time load all the dbus objects.
>

This is intentional.  Because of the way hardware gets detected, new
devices or different configurations could be loaded at any time.  Some
devices aren't detected until the host OS boots for example, so we can't
hold the service startup to wait for the entire system to be detected.


>
>
>          So, Could you please let us know to how to add the EM as
> dependent service. Or Please let us know if any other approach.
>
>
>
> Thanks,
>
> Kumar.
> ::DISCLAIMER::
> ------------------------------
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only. E-mail transmission is not
> guaranteed to be secure or error-free as information could be intercepted=
,
> corrupted, lost, destroyed, arrive late or incomplete, or may contain
> viruses in transmission. The e mail and its contents (with or without
> referred errors) shall therefore not attach any liability on the originat=
or
> or HCL or its affiliates. Views or opinions, if any, presented in this
> email are solely those of the author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification, distribution and / or
> publication of this message without the prior written consent of authoriz=
ed
> representative of HCL is strictly prohibited. If you have received this
> email in error please delete it and notify the sender immediately. Before
> opening any email and/or attachments, please check them for viruses and
> other defects.
> ------------------------------
>

--000000000000c5d85805c545a978
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 21, 2021 at 2:28 AM Kumar=
 Thangavel &lt;<a href=3D"mailto:thangavel.k@hcl.com">thangavel.k@hcl.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-884049030016977109WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Classification: <b><spa=
n style=3D"color:rgb(180,95,4)">Confidential</span></b><span style=3D"font-=
size:12pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal">Hi All,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Ipmb-fru-device deamon trying to read some dbus objects from enti=
ty-manager to get the ipmb bus details. Entity-manager daemon initially tak=
ing some time to load all the dbus objects. But Ipmb-fru-device deamon star=
ts at system
 startup.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 Since, Entity-manager deamon initially taking some time to load a=
ll the dbus objects, ipmb-fru-device getting the below error.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 <b>Error</b> :<u></u><u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 =E2=80=9Cipmb-fru-device[345]:=C2=A0=C2=A0 what():=C2=A0 sd_bus_call: o=
rg.freedesktop.DBus.Error.UnknownObject: Unknown object &#39;/xyz/openbmc_p=
roject/inventory/system/board/Yosemite_V2_Baseboard/IpmbBus1&#39;.=E2=80=9D=
</p></div></div></blockquote><div><br></div><div>The easiest way to explain=
 this would be to just point you at code.=C2=A0 Every dbus-sensor daemon ha=
ndles this race condition;=C2=A0 I&#39;d recommend looking at the code in t=
he relevant main(), and see how it does it.=C2=A0 If you have trouble under=
standing it, feel free to message back here with specific line numbers and =
questions and we should hopefully be able to get you sorted out.</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div lang=3D"=
EN-US"><div class=3D"gmail-m_-884049030016977109WordSection1"><p class=3D"M=
soNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Whe=
n we restart EM deamon once, this error got resolved.=C2=A0
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I t=
ried to add EM service as dependent service to Ipmb-fru-device service. Add=
ed EM service in =E2=80=9CWants=E2=80=9D, =E2=80=9CAfter=E2=80=9D fields in=
 Ipmb-fru-service service.
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 But=
, still EM deamon taking some time load all the dbus objects.</p></div></di=
v></blockquote><div><br></div><div>This is intentional.=C2=A0 Because of th=
e way hardware gets detected, new devices or different configurations could=
 be loaded at any time.=C2=A0 Some devices aren&#39;t detected until the ho=
st OS boots for example, so we can&#39;t hold the service startup to wait f=
or the entire system to be detected.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m=
_-884049030016977109WordSection1"><p class=3D"MsoNormal">
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 So,=
 Could you please let us know to how to add the EM as dependent service. Or=
 Please let us know if any other approach.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Kumar.<u></u><u></u></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</div>

</blockquote></div></div>

--000000000000c5d85805c545a978--
