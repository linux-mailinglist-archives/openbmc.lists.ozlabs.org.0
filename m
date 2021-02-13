Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3653931AD8B
	for <lists+openbmc@lfdr.de>; Sat, 13 Feb 2021 19:18:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DdJXH2g1qzDwlL
	for <lists+openbmc@lfdr.de>; Sun, 14 Feb 2021 05:18:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=tanous.net
 (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=ed@tanous.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tanous-net.20150623.gappssmtp.com
 header.i=@tanous-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=eoLalCQ0; dkim-atps=neutral
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DdJWZ2kPjzDvVF
 for <openbmc@lists.ozlabs.org>; Sun, 14 Feb 2021 05:17:58 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id f4so2921778ybk.11
 for <openbmc@lists.ozlabs.org>; Sat, 13 Feb 2021 10:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tanous-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ohZ+lpR+ljq3QbM6P79xrpXgq0DbTkZ/uvcGgG307mY=;
 b=eoLalCQ02oYTqpPRkDZgUgYUMlLnp9ORIxAWPNg8zbyhgQ7S6yrsnWw5ap2+Q7Tq/f
 6Xgcb5y29aa6rGjPawBiXPXrHgX3AuC5kx2d2uR2jO5mr+gJ0jcRKHeVRyvj4FQzEh94
 WHdRgEsDsjHVtx3M+3QjoRPwE57ZIgzzp1+WhuBydF7qZO+WDIaskvGc+tAJxRDxmrwo
 4rQsBPHYhOpNRnkhLd+sPYifw/VQFFFVQ1DGo80QbkfrwlXFDe/sFjarwxSQXMTbPz7W
 OjAF+QUuzmjTd5MKeCzzNz13cYiVx0PmQwG1T7SmaoI3CVe/hGcX8J7SJ0kytNhWyswI
 r9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ohZ+lpR+ljq3QbM6P79xrpXgq0DbTkZ/uvcGgG307mY=;
 b=IQu32iddrH+XIM4pgtSZ01WBnrzZ4dnyEIqylY8naCGwhclyJ+j5pExAtkaZaxiqYF
 setyC5ThAFq2Ha0gWkM4FlLbycFtvANUzTsU0MFGDVOCw4FFMFcfKTF2eSO6bLhcBbK6
 eSA3jaXHpvqEA6TTe5zno6VjUK2C2QjDUhEE2XvjkJKZJ0ZtrtO270xIl8YqOm03Sh4h
 YPGVUB+ahYTyMXJ211JnyBK66abkK/uQYrtTFPAU8jF//j1MA0xhiKGmAqoYBlz6XN/2
 YBQM1KhyJNyylUtwtSh3ES4M9Am0ka42LDME6n1TGG2TbGV/JG1LMwzbWNcis8lChjJd
 Xpow==
X-Gm-Message-State: AOAM531sdGnkeKEyClnZtmai73HfD05r5zrGv9cssgaoHMr7lUwM3nSj
 7i7uZ2JMmkQqOZKbcA/9dGtfbcx3LEZlFdgBfPuMaA==
X-Google-Smtp-Source: ABdhPJzcNTr77yePM5HlBkm45cP231IR5y+a/2LdPHV3o7lZUO2U4wddUATFsFw3Ns05cZDCuaieDOgm43L4LsDzEmk=
X-Received: by 2002:a25:c407:: with SMTP id u7mr11800022ybf.449.1613240274198; 
 Sat, 13 Feb 2021 10:17:54 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR02MB2796B5FB2DB9AAAE2594BA1E858B9@SG2PR02MB2796.apcprd02.prod.outlook.com>
 <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
In-Reply-To: <SG2PR02MB27961D3A938C94341747757C858A9@SG2PR02MB2796.apcprd02.prod.outlook.com>
From: Ed Tanous <ed@tanous.net>
Date: Sat, 13 Feb 2021 10:17:43 -0800
Message-ID: <CACWQX807_KpeTHnMqPMt8E+h_ggMpKy0_Jr82HPV+oRushXdXw@mail.gmail.com>
Subject: Re: Redfish v1/Systems/system/EthernetInterfaces
To: "Udupa.Ashwini ISV" <udupa.ashwini@inventec.com>
Content-Type: multipart/alternative; boundary="0000000000007b36da05bb3bc580"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000007b36da05bb3bc580
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 13, 2021 at 10:11 AM Udupa.Ashwini ISV <
udupa.ashwini@inventec.com> wrote:

>
>
> Hi,
>
>
>
> I am new to OpenBmc and Redfish.
> I saw in bmcweb/Redfish.md, that below Redfish is targeted for OpenBmc:
> /redfish/v1/Systems/system/EthernetInterfaces
>
>
>
> But, in redfish-core/lib/systems.hpp, I don=E2=80=99t see EthernetInterfa=
ces and I
> don=E2=80=99t see it on my server Redfish too.
>

What upstream system are you trying this on?  If your platform isn=E2=80=99=
t
upstream, can you point at the code review where you=E2=80=99re adding it?

If you don=E2=80=99t have either, take note that it=E2=80=99s really diffic=
ult to help
debug or make suggestions for platforms that we can=E2=80=99t see the code =
for.

Its only present in Managers/bmc/EthernetInterfaces.
>
>
>
> How do I add Systems/system/EthernetInterfaces Redfish support? What
> changes do I need to make?
>
>
>
> Regards,
>
> Ashwini
>
>
>
--=20
-Ed

--0000000000007b36da05bb3bc580
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br></div><div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Sat, Feb 13, 2021 at 10:11 AM Udupa.Ashwini I=
SV &lt;<a href=3D"mailto:udupa.ashwini@inventec.com">udupa.ashwini@inventec=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding=
-left:1ex;border-left-color:rgb(204,204,204)">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"m_-7154820597552746604WordSection1">
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am new to OpenBmc and Redfish.<u></u><u></u></p>
<h2 style=3D"background-color:white"><span style=3D"font-size:11pt;font-fam=
ily:Calibri,sans-serif;color:black">I saw in bmcweb/Redfish.md, that below =
Redfish is targeted for OpenBmc:
</span><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;color:w=
indowtext"><u style=3D"font-family:Calibri,sans-serif"></u><u style=3D"font=
-family:Calibri,sans-serif"></u></span></h2>
<h2 style=3D"background-color:white"><span style=3D"font-size:11pt;font-fam=
ily:Calibri,sans-serif;color:black">/redfish/v1/Systems/system/EthernetInte=
rfaces</span><span style=3D"font-size:11pt;font-family:Calibri,sans-serif;c=
olor:windowtext"><u style=3D"font-family:Calibri,sans-serif"></u><u style=
=3D"font-family:Calibri,sans-serif"></u></span></h2>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">But, in redfish-core/lib/systems.hpp, I don=E2=80=99=
t see EthernetInterfaces and I don=E2=80=99t see it on my server Redfish to=
o.</p></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto=
">What upstream system are you trying this on?=C2=A0 If your platform isn=
=E2=80=99t upstream, can you point at the code review where you=E2=80=99re =
adding it?</div><div dir=3D"auto"><br></div><div dir=3D"auto">If you don=E2=
=80=99t have either, take note that it=E2=80=99s really difficult to help d=
ebug or make suggestions for platforms that we can=E2=80=99t see the code f=
or.<br></div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:s=
olid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div lang=3D"EN-U=
S" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:break-word"><div c=
lass=3D"m_-7154820597552746604WordSection1"><p class=3D"MsoNormal" dir=3D"a=
uto"><u></u><u></u></p>
<p class=3D"MsoNormal">Its only present in Managers/bmc/EthernetInterfaces.=
 <u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">How do I add Systems/system/EthernetInterfaces Redfi=
sh support? What changes do I need to make?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Ashwini<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>

</blockquote></div></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature" =
data-smartmail=3D"gmail_signature"><div dir=3D"ltr">-Ed</div></div>

--0000000000007b36da05bb3bc580--
