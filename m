Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 101A7131C92
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 00:54:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sC6d718vzDqR1
	for <lists+openbmc@lfdr.de>; Tue,  7 Jan 2020 10:54:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=xqiu@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="H4ghqWma"; 
 dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sBpN04B3zDqLW
 for <openbmc@lists.ozlabs.org>; Tue,  7 Jan 2020 10:40:43 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id z64so10817423oia.4
 for <openbmc@lists.ozlabs.org>; Mon, 06 Jan 2020 15:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TSPHNqjq8dv1pYDJFrRpe73ngxgyCRZwDKssVlet/8w=;
 b=H4ghqWmaprjX+2Y1jHtbZvjpXLOVqBzj64t3sTsvy1hO3fdPVD3i7kkZtGArt+0qVN
 S9k7wnZWQ3oxrexjOc95X0Csgfr4XvnB2EPvHX7dG7NgzO5AmMpN0i4pk1BWXUjHMy9H
 KG0wxzxPsFQBmuSQIczZHRwxEvtLeWwBv/ye7n3PCBWi3vD9TFlaR9KNRVGvZdcwfssS
 GJaC7Rtm8bIPDi/yTU/dtADrFZNl+/2hshrVuMXevpsV/FKMl2bB0iP3cQbQ4Xkt/UX/
 YepndP3hE6b05Ct3ftE+MdGrOI3ceb0Pur/H4J9WdXQfPb3uYlPO3X0LzbxBUvg6qu7Z
 k0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TSPHNqjq8dv1pYDJFrRpe73ngxgyCRZwDKssVlet/8w=;
 b=H8Dcirw7ks4iSJ1EkTsM3ZRS9BvzDUTuajeQ4yvdzLEaRmwDlG14IUV6eWdkuCeRyY
 uPK8/QfyVcQvJX0a1awutcNynvQsdqCIUuXEEm9bvFS/qOS5HEkfhSF76WG9677LJ1+g
 X9NMoUkIvPRYfysCnvGGRf2Uqf2bGQV4go6r+vgonEPGwrIPv+ssgERH7A/kCARRhM8J
 4juAG3jLhD+7ZaEPpK6gEhUb1Qf1qQ2PHBkSlsyfW5IWWaIdZdgWiiyZzZK5yu4o/L9f
 u9bGq3kGwLTjapUmDJSTHZDduw1D3VbKbhEzUtCZPbFZqSfg2ceXLL1i1GzvPkDWdS0H
 xYIg==
X-Gm-Message-State: APjAAAUNGDtUiua6N9yYTxWhhG15S/luoZfeY7FAE25hJussxkmFsUlH
 yvS3u36hvAl1tVjOVpLwmOajh7u9ydsx70lTG+4tPQ==
X-Google-Smtp-Source: APXvYqx8hqw5TxTMugZbOtVMycvVB+nQQlQz2If/KiMd9sowl2/sN9dS2B1W8LVvh7hwGH0scte6njmFgcbNR3c3vh4=
X-Received: by 2002:aca:f555:: with SMTP id t82mr6830477oih.103.1578354039959; 
 Mon, 06 Jan 2020 15:40:39 -0800 (PST)
MIME-Version: 1.0
References: <CAA_a9xLm_3CthjLS0rKQCcqYfciFWEXh-9BV4W=AebumP8Rf4A@mail.gmail.com>
 <B109D1A5-C1B5-41CF-9405-DAF4A2E3FD9C@fb.com>
In-Reply-To: <B109D1A5-C1B5-41CF-9405-DAF4A2E3FD9C@fb.com>
From: Alex Qiu <xqiu@google.com>
Date: Mon, 6 Jan 2020 15:40:28 -0800
Message-ID: <CAA_a9xLpmX1VE+6JTscKjy85uePnXsMRAABX=E_UwN8QOWBswg@mail.gmail.com>
Subject: Re: Configuring shunt_resistor in hwmon
To: Vijay Khemka <vijaykhemka@fb.com>
Content-Type: multipart/alternative; boundary="000000000000e20371059b812fda"
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
Cc: Josh Lehan <krellan@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Kais Belgaied <belgaied@google.com>, Devjit Gopalpur <devjitg@google.com>,
 Peter Lundgren <peterlundgren@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000e20371059b812fda
Content-Type: text/plain; charset="UTF-8"

Hi Vijay, I don't know about the device tree yet, and I will look for info
about it. Thanks!

- Alex Qiu


On Mon, Jan 6, 2020 at 3:37 PM Vijay Khemka <vijaykhemka@fb.com> wrote:

> You should be able to define this value in device tree. Or you can
> calculate scale factor and use it in entity manager.
>
>
>
> *From: *openbmc <openbmc-bounces+vijaykhemka=fb.com@lists.ozlabs.org> on
> behalf of Alex Qiu <xqiu@google.com>
> *Date: *Monday, January 6, 2020 at 1:18 PM
> *To: *"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
> *Cc: *Josh Lehan <krellan@google.com>, Kais Belgaied <belgaied@google.com>,
> Devjit Gopalpur <devjitg@google.com>, Peter Lundgren <
> peterlundgren@google.com>
> *Subject: *Configuring shunt_resistor in hwmon
>
>
>
> Hi OpenBMC folks,
>
>
>
> Is there a way to configure the shunt_resistor value for a hwmon with
> entity-manager or other modules? We need to configure this value to make
> the INA230 report correct voltage, but for now I don't find anything in the
> code for it. Shall this be a feature to implement? Thanks!
>
>
> - Alex Qiu
>

--000000000000e20371059b812fda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Vijay, I don&#39;t know about the device tree yet,=
 and I will look for info about it. Thanks!</div><br clear=3D"all"><div><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr">- Alex Qiu</div></div></div><br></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 6, 2020 at 3:3=
7 PM Vijay Khemka &lt;<a href=3D"mailto:vijaykhemka@fb.com">vijaykhemka@fb.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-4020581773647133205WordSection1">
<p class=3D"MsoNormal">You should be able to define this value in device tr=
ee. Or you can calculate scale factor and use it in entity manager.<u></u><=
u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(181,196,223);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:12pt;color:black">From: =
</span></b><span style=3D"font-size:12pt;color:black">openbmc &lt;openbmc-b=
ounces+vijaykhemka=3D<a href=3D"mailto:fb.com@lists.ozlabs.org" target=3D"_=
blank">fb.com@lists.ozlabs.org</a>&gt; on behalf of Alex Qiu &lt;<a href=3D=
"mailto:xqiu@google.com" target=3D"_blank">xqiu@google.com</a>&gt;<br>
<b>Date: </b>Monday, January 6, 2020 at 1:18 PM<br>
<b>To: </b>&quot;<a href=3D"mailto:openbmc@lists.ozlabs.org" target=3D"_bla=
nk">openbmc@lists.ozlabs.org</a>&quot; &lt;<a href=3D"mailto:openbmc@lists.=
ozlabs.org" target=3D"_blank">openbmc@lists.ozlabs.org</a>&gt;<br>
<b>Cc: </b>Josh Lehan &lt;<a href=3D"mailto:krellan@google.com" target=3D"_=
blank">krellan@google.com</a>&gt;, Kais Belgaied &lt;<a href=3D"mailto:belg=
aied@google.com" target=3D"_blank">belgaied@google.com</a>&gt;, Devjit Gopa=
lpur &lt;<a href=3D"mailto:devjitg@google.com" target=3D"_blank">devjitg@go=
ogle.com</a>&gt;, Peter Lundgren &lt;<a href=3D"mailto:peterlundgren@google=
.com" target=3D"_blank">peterlundgren@google.com</a>&gt;<br>
<b>Subject: </b>Configuring shunt_resistor in hwmon<u></u><u></u></span></p=
>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Hi OpenBMC folks, <u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Is there a way to configure the shunt_resistor value=
 for a hwmon with entity-manager or other modules? We need to configure thi=
s value to make the INA230 report correct voltage, but for now I don&#39;t =
find anything in the code for it. Shall
 this be a feature to implement? Thanks!<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><br clear=3D"all">
<u></u><u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal">- Alex Qiu<u></u><u></u></p>
</div>
</div>
</div>
</div>
</div>
</div>
</div>

</blockquote></div>

--000000000000e20371059b812fda--
