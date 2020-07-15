Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E5A22143D
	for <lists+openbmc@lfdr.de>; Wed, 15 Jul 2020 20:27:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6QpX46ztzDqpG
	for <lists+openbmc@lfdr.de>; Thu, 16 Jul 2020 04:27:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a;
 helo=mail-ej1-x62a.google.com; envelope-from=qweran@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ds+HlNeX; dkim-atps=neutral
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6Qnl4FxZzDqf5
 for <openbmc@lists.ozlabs.org>; Thu, 16 Jul 2020 04:26:35 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id y10so3195671eje.1
 for <openbmc@lists.ozlabs.org>; Wed, 15 Jul 2020 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MpTP1CLS60o0tVNGH/1/DJNmFKEJ2nKOGH9cOwTGw20=;
 b=Ds+HlNeXxa3+IHkzKOPDfGJ3LUqPQQH89gOQf8K0WMRPP+tURL7C4nVnjs5fae+s+4
 xo/HhcFWXLnQ+J82uiPOGd3Mo7hN3EOVD2nuxb/BL2DOVkpHrqMzVuIrdDTec1M3tY91
 HY50uKzhSI7NNWQuoUhQqF6TvjtQyOZjaZ+BDRkN92OaqkHRtrEbG7qtq/TiGZaEyjm8
 pzWPZT8296B1C/CzME/MkHeqMtgza6HzQajfRlV6xbeuONw9MvecAuFf+5wKopc90in9
 8ieH2NqFoUcTbseZsZNxmO1RIrrArs5W9d1EH+YB9cZ+u1jLe/8xJ/PBTWEApXZOJs2r
 2YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MpTP1CLS60o0tVNGH/1/DJNmFKEJ2nKOGH9cOwTGw20=;
 b=ZadH/P02e23yzjGmBckXH1rA/gq/8oSiIJuxEt9sS+NSggstBItOpM+aZEdsWg1sCu
 77E9pvg7sGfK36fdO9sTfXPjQ+uWZGZDm0zngudQAYSGRwy60avYrKBXAURkcYk1OQ1A
 5Q0KwKMjBzGXXDNuBe20Lfy+fOEEMuNBS3shd7o+RIPe+9QquqFpQRQR+2qptxoIt8hh
 hzjhSvr3OkoZK2+Do2y/T9dZG/G+YmRCtGiniZMJOLU9G7iRZxH/RvR37gHCSND+NNqk
 AvlnOKa0tz7pux+++q5feuzu/yvfJbPooVKKc/zvI0G1BNyPfUG/fF8gBxr2BPXX2SND
 YJkg==
X-Gm-Message-State: AOAM533t/5jQ3rkSig8/ty47eAB1TX3LDNiKvD0CC5UKuOI+JfXO8gpT
 gOSNjM6tfPrCksVog6DfWjygzDSnW/qzb+yH/DA=
X-Google-Smtp-Source: ABdhPJyYLdOyMQbarr9R8kXelLNAufFbjU6It3mj4noQT8la3jpTKl6V0JwXr8E1b8WmnBHN5hlZbZ2JHek3jfZEXtw=
X-Received: by 2002:a17:906:fa92:: with SMTP id
 lt18mr258205ejb.534.1594837590836; 
 Wed, 15 Jul 2020 11:26:30 -0700 (PDT)
MIME-Version: 1.0
References: <CACS57oWum6NJghyv8904M+-GzrYy=LD93wvizGo8RagHOkOSZQ@mail.gmail.com>
 <8B3F0342-9917-4929-B955-F226FE8EE0AA@fb.com>
In-Reply-To: <8B3F0342-9917-4929-B955-F226FE8EE0AA@fb.com>
From: Ilya Gousev <qweran@gmail.com>
Date: Wed, 15 Jul 2020 21:26:19 +0300
Message-ID: <CACS57oVN=vvisXABSihcRaxCbzWNbzbkyqX2PB1zRb3yOFi0TA@mail.gmail.com>
Subject: Re: Tiogapass build
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000138c6005aa7f108a"
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

--000000000000138c6005aa7f108a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Vijay!

About KVM:
When I was build OpenBMC, KVM did not work. There was no vhub and video
nodes in devicetree file. Is this done on purpose?

Right now I have problem with KCS Bridge, but i fix it with udev rule like
this:
KERNEL=3D=3D"ipmi-kcs3", SYMLINK+=3D"ipmi_kcs3"
And fixing * phosphor-ipmi-kcs_git.bb <http://phosphor-ipmi-kcs_git.bb>*


*Right now i have a problem with starting ipmb service.*


*Do you have such problems too?Or is it my fault?*


*Thanks, *

*Ilya*

=D1=81=D1=80, 15 =D0=B8=D1=8E=D0=BB. 2020 =D0=B3. =D0=B2 20:56, Vijay Khemk=
a <vijaykhemka@fb.com>:

> Hi Ilya,
>
> Please see my answers inline
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=3Dfb.com@lists.ozlabs.org> o=
n
> behalf of Ilya Gousev <qweran@gmail.com>
> *Date: *Wednesday, July 15, 2020 at 5:18 AM
> *To: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> *Subject: *Tiogapass build
>
>
>
> Hi!
>
>
>
> >I have tried to touch Tiogapass (by Wiwyn).
>
> Good.
>
> >I have added the devices for KVM. And it works.
>
> What are you trying for KVM here?
>
> >Now i want to get information about hardware (for example CPU and DIMM
> imformation, like model, clocks, etc.). How i can get it? Only from IPMI
> stack (like KCS)?
>
> Yes it can be accesses from IPMI stack via ipmi tools, you can run
> ipmitool from BMC console itself. And there is a file in /etc/appData.jso=
n
> which stores all of these data.
>
>
>
> Ilya
>

--000000000000138c6005aa7f108a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, Vijay!</div><div><br></div><div>About KVM:<br></d=
iv><div>When I was build OpenBMC, KVM did not work. The<span class=3D"gmail=
-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"=
gmail-">re was no vhub and video nodes in devicetree file. <span class=3D"g=
mail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=
=3D"gmail-">Is this done on purpose?</span></span></span></span></div><div>=
<span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span =
title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-tra=
nslation" lang=3D"en"><span title=3D"" class=3D"gmail-"><br></span></span><=
/span></span></div><div><span class=3D"gmail-tlid-translation gmail-transla=
tion" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tl=
id-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gma=
il-">Right now I have problem with KCS Bridge, but i fix it with udev rule =
like this:</span></span></span></span></div><div><span class=3D"gmail-tlid-=
translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-=
"><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><spa=
n title=3D"" class=3D"gmail-"><code>KERNEL=3D=3D&quot;ipmi-kcs3&quot;, SYML=
INK+=3D&quot;ipmi_kcs3&quot;</code></span></span></span></span></div><div><=
span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span t=
itle=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-tran=
slation" lang=3D"en"><span title=3D"" class=3D"gmail-"><code>And fixing <st=
rong class=3D"gmail-file-title-name">
<a href=3D"http://phosphor-ipmi-kcs_git.bb">phosphor-ipmi-kcs_git.bb</a></s=
trong></code></span></span></span></span></div><div><span class=3D"gmail-tl=
id-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gma=
il-"><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><=
span title=3D"" class=3D"gmail-"><code><strong class=3D"gmail-file-title-na=
me"><br></strong></code></span></span></span></span></div><div><span class=
=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" =
class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" l=
ang=3D"en"><span title=3D"" class=3D"gmail-"><code><strong class=3D"gmail-f=
ile-title-name">Right now i have a problem with starting ipmb service.<br><=
/strong></code></span></span></span></span></div><div><span class=3D"gmail-=
tlid-translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"g=
mail-"><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"=
><span title=3D"" class=3D"gmail-"><code><strong class=3D"gmail-file-title-=
name"><br></strong></code></span></span></span></span></div><div><span clas=
s=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D""=
 class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" =
lang=3D"en"><span title=3D"" class=3D"gmail-"><code><strong class=3D"gmail-=
file-title-name"><span class=3D"gmail-tlid-translation gmail-translation" l=
ang=3D"en"><span title=3D"">Do you have such problems too?</span><br><span =
title=3D"" class=3D"gmail-">Or is it my fault?</span></span></strong></code=
></span></span></span></span></div><div><span class=3D"gmail-tlid-translati=
on gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"><span c=
lass=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=
=3D"" class=3D"gmail-"><code><strong class=3D"gmail-file-title-name"><span =
class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=
=3D"" class=3D"gmail-"><br></span></span></strong></code></span></span></sp=
an></span></div><div><span class=3D"gmail-tlid-translation gmail-translatio=
n" lang=3D"en"><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-=
translation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-=
"><code><strong class=3D"gmail-file-title-name"><span class=3D"gmail-tlid-t=
ranslation gmail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"=
>Thanks, <br></span></span></strong></code></span></span></span></span></di=
v><div><span class=3D"gmail-tlid-translation gmail-translation" lang=3D"en"=
><span title=3D"" class=3D"gmail-"><span class=3D"gmail-tlid-translation gm=
ail-translation" lang=3D"en"><span title=3D"" class=3D"gmail-"><code><stron=
g class=3D"gmail-file-title-name"><span class=3D"gmail-tlid-translation gma=
il-translation" lang=3D"en"><span title=3D"" class=3D"gmail-">Ilya<br></spa=
n></span></strong></code></span></span></span></span></div><div><span class=
=3D"gmail-tlid-translation gmail-translation" lang=3D"en"><span title=3D"" =
class=3D"gmail-"><span class=3D"gmail-tlid-translation gmail-translation" l=
ang=3D"en"><span title=3D"" class=3D"gmail-"><code><strong class=3D"gmail-f=
ile-title-name"><br></strong></code></span></span></span></span></div><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D1=81=D1=80, 1=
5 =D0=B8=D1=8E=D0=BB. 2020 =D0=B3. =D0=B2 20:56, Vijay Khemka &lt;<a href=
=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.com</a>&gt;:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_2049833802716390853WordSection1">
<p class=3D"MsoNormal">Hi Ilya,<u></u><u></u></p>
<p class=3D"MsoNormal">Please see my answers inline<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-color:rgb(181,196,223) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Ilya Gousev &lt;<a href=
=3D"mailto:qweran@gmail.com" target=3D"_blank">qweran@gmail.com</a>&gt;<br>
<b>Date: </b>Wednesday, July 15, 2020 at 5:18 AM<br>
<b>To: </b>&quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@lists.=
ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Subject: </b>Tiogapass build<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<p class=3D"MsoNormal">Hi!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;I have tried to touch Tiogapass (by Wiwyn).=C2=
=A0<u></u><u></u></p>
<p class=3D"MsoNormal">Good.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;I have added the devices for KVM. And it works.<=
u></u><u></u></p>
<p class=3D"MsoNormal">What are you trying for KVM here?<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;Now i want to get information about hardware (fo=
r example CPU and DIMM imformation, like model, clocks, etc.). How i can ge=
t it? Only from IPMI stack (like KCS)?<u></u><u></u></p>
<p class=3D"MsoNormal">Yes it can be accesses from IPMI stack via ipmi tool=
s, you can run ipmitool from BMC console itself. And there is a file in /et=
c/appData.json which stores all of these data.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Ilya<u></u><u></u></p>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000138c6005aa7f108a--
