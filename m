Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E670855
	for <lists+openbmc@lfdr.de>; Mon, 22 Jul 2019 20:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sqgt0PlszDqJs
	for <lists+openbmc@lfdr.de>; Tue, 23 Jul 2019 04:21:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=tajudheenk@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HoAtcs7s"; 
 dkim-atps=neutral
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sqgF2QGFzDqD1
 for <openbmc@lists.ozlabs.org>; Tue, 23 Jul 2019 04:21:11 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id a15so36119078wmj.5
 for <openbmc@lists.ozlabs.org>; Mon, 22 Jul 2019 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMQNzBOTZUpN/ZXbbNEwL5erITm4DsH3lN6Ic/ebwV0=;
 b=HoAtcs7sZQE9HJzmJjAc4vyIGe2yXyu4f7cOuShwHsRyfYt46xg9k1ZEurIZ3uOIVf
 R6gEdTQp21zjQ/9qVEhBpSgo/c5p9uK7FbTVky5KaCclGMjZ7zFlK4VZ1fxbgai4W+5o
 5fTiQaXBroZWDq3yS2a6D3oaxsiRWn0VEOksScm7hWeZEZPoo1VTxzzxPPmX9P/K6hzT
 R55cZyYFg4jZXKxV3qPZChdm50dxMnyReTqwNeI9lO8gOf4nFT0ZJ3HTTepgUFhUrUXZ
 g5zReFen9J5bFkWATW+MdNuMASC4k28N7urle0nVrL/1RzBMs7CiDYoNZ8o/So6BK/N/
 77rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMQNzBOTZUpN/ZXbbNEwL5erITm4DsH3lN6Ic/ebwV0=;
 b=K/yF+CgZGVW3A+G6yOV3047rstuMMHlMGfbneiAQ1EhVVjUEH4SVKAKJvoH9zb0y6A
 a5jd/OZX+qoHdirMi3HWWVRCp8GzHTLL/c22zUrIpASzEbwadFUEPVPj9iBlK9Yfw9fQ
 /9GiE7y5gXkfWoqPZ6MDZ0sApmUz487ekO/OvIBb7PcMXvhmpoV4PCQ1+046q7ZIq9Px
 ctLS1h7uSK1cIH9pA0937X2lq8zs0n0T2mQjv6J1pmTVKoIb/FdW2K/aVjH/UAdsvJmd
 JYJ9VATn4e3w/6rZV9rS6NGWsjm2BaWiQDMadiEXF/57VDnS0EY/9GoL9NVAmRfW5K98
 IHXA==
X-Gm-Message-State: APjAAAW2M6vYKbxuCkm6xL9yopEjMboKHLLz2UVTNyCay6V89bD4hR1V
 pUT2X3KewGBl/weMT5PsQElwx3qa6224aBQcRnJN/gvP
X-Google-Smtp-Source: APXvYqxu6Zg6ZDq50oh08jcbCBiETX6g3bD6Lq5Pq7rrcoI2rxCWhqpNT1nMlA4R24aCI7Ty5mNxDEuWkTTHvTkQrf8=
X-Received: by 2002:a1c:2d8b:: with SMTP id t133mr64760690wmt.57.1563819666898; 
 Mon, 22 Jul 2019 11:21:06 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2KKebkJUxfEQbjcySkGWEteWjCem8EDKwVahAPnw-0-DfPJw@mail.gmail.com>
 <20190722172656.hkjfluvusnnhtzkx@thinkpad>
In-Reply-To: <20190722172656.hkjfluvusnnhtzkx@thinkpad>
From: Thaj <tajudheenk@gmail.com>
Date: Mon, 22 Jul 2019 23:50:54 +0530
Message-ID: <CAH2KKeb8akcV6D_0x3612BeEepRpesTzLiZAk=ASCJwRv-_M9A@mail.gmail.com>
Subject: Re: Multi-node support
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Content-Type: multipart/alternative; boundary="000000000000bd0634058e492332"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bd0634058e492332
Content-Type: text/plain; charset="UTF-8"

Thanks Brad. Like you said, by multi-node I meant a scalable modular server
architecture.
For example, two 2-socket chassis (modules) can be combined(via cables) to
form single 4-socket server system.
In this case we may need MC to MC communication interface (Master/Slave)
for BMC management.

On Mon, Jul 22, 2019 at 10:56 PM Brad Bishop <bradleyb@fuzziesquirrel.com>
wrote:

> On Mon, Jul 22, 2019 at 10:26:04AM +0530, Thaj wrote:
> >Hi,
> >
> >Does OpenBMC support Multi-node server configuration ?
>
> Can you elaborate on what you mean by this?  I work for IBM so when I
> hear "multi-node" I think of multiple chassis, connected via cables NUMA
> systems.  If that -is- what you are referring to then OpenBMC does not
> support that today.
>
> >
> >Where can I get the roadmap of features in OpenBMC ?
> We label enhancement issues in Github by release so for example:
>
> https://github.com/openbmc/openbmc/issues/labels/Release2.7
> https://github.com/openbmc/openbmc/issues/labels/Release2.8
>
> To be honest there isn't a lot there - we're struggling somewhat to get
> those who implement features to maintain feature issues like these.
>
> thx - brad
>

--000000000000bd0634058e492332
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Brad. Like you said, by multi-node I meant a scalab=
le modular server architecture.=C2=A0<br>For example, two 2-socket chassis =
(modules) can be combined(via cables) to form single 4-socket server system=
.<br>In this case we may need MC to MC communication interface (Master/Slav=
e) for BMC management.</div><br><div class=3D"gmail_quote"><div class=3D"gm=
ail_attr" dir=3D"ltr">On Mon, Jul 22, 2019 at 10:56 PM Brad Bishop &lt;<a h=
ref=3D"mailto:bradleyb@fuzziesquirrel.com">bradleyb@fuzziesquirrel.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border-lef=
t-width:1px;border-left-style:solid">On Mon, Jul 22, 2019 at 10:26:04AM +05=
30, Thaj wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;Does OpenBMC support Multi-node server configuration ?<br>
<br>
Can you elaborate on what you mean by this?=C2=A0 I work for IBM so when I =
<br>
hear &quot;multi-node&quot; I think of multiple chassis, connected via cabl=
es NUMA <br>
systems.=C2=A0 If that -is- what you are referring to then OpenBMC does not=
 <br>
support that today.<br>
<br>
&gt;<br>
&gt;Where can I get the roadmap of features in OpenBMC ?<br>
We label enhancement issues in Github by release so for example:<br>
<br>
<a href=3D"https://github.com/openbmc/openbmc/issues/labels/Release2.7" tar=
get=3D"_blank" rel=3D"noreferrer">https://github.com/openbmc/openbmc/issues=
/labels/Release2.7</a><br>
<a href=3D"https://github.com/openbmc/openbmc/issues/labels/Release2.8" tar=
get=3D"_blank" rel=3D"noreferrer">https://github.com/openbmc/openbmc/issues=
/labels/Release2.8</a><br>
<br>
To be honest there isn&#39;t a lot there - we&#39;re struggling somewhat to=
 get <br>
those who implement features to maintain feature issues like these.<br>
<br>
thx - brad<br>
</blockquote></div>

--000000000000bd0634058e492332--
