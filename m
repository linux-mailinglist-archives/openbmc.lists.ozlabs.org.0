Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A138D95E3
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 17:45:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tc7l5098zDqv5
	for <lists+openbmc@lfdr.de>; Thu, 17 Oct 2019 02:45:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jipu/z1o"; 
 dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tc715tmxzDqnB
 for <openbmc@lists.ozlabs.org>; Thu, 17 Oct 2019 02:44:45 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id y91so21665822ede.9
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 08:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H67j+z2RkSkgFkT7+dMpvpZ+7Ubq2ofyOCdjuaB72c0=;
 b=jipu/z1oN6QzMY5V15iOYLfXLV4PaEZ7AfWWhuOWxZ8MkBJPzq+w6rf+ie41q3jhqm
 AtnTm5eBx+B7hGb+BHrGiTskPmPo2OWwwgj9IWoJSgMb/UeRNv8CO/Kh/2c5RuVhQdtM
 lZlNk1hzOMKv0bXg/SzF6OVOUfCdsPwauk4wpLMKlM8g/vZIGtbKVVKDj3tmhV0bMTjd
 YZAObUFzHW0BwOxpf6bmXjCUEctFa+nnkwRWegSDpFUBL2UO2f+Ew/AqZz0dylSPjg2t
 pEVQVDXthLYugKmOvlg9YG5LbdGz7yJDpDehtBz+nH7wms0dfbpe8+Q4kaL3vLmov/9z
 oElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H67j+z2RkSkgFkT7+dMpvpZ+7Ubq2ofyOCdjuaB72c0=;
 b=Ptbm4O+4sqwqW5Cx7C7pZNTcz3Ws1dS78OqlLaPt/HdnxnBUcbKKWfO0tNa9IR638h
 C6xDFHfLIlE2g916JYJIdtPngP75IyzlD+Y92Fyl6l5gAFKHfY3/x+a0dYUfJk+cJr+D
 nR8/sOQBNU9EzbDzzmu70uYdOsIq9BVwkb/jkS2E8ywSq6/7uc1zBc7GRp1607aV4XHh
 Mjq42s8HiiBD6yJRpmBTQnOCTQ7J2sAL+QrUhoc/ZQ3l3zjKPb0iwjIHGkERkkeM43oS
 gHGDjlA4mENe/PqaCtnXmW6SFo6SvplT473NODj42Y+MLNZheO+O4Ygv8yVulkdCR9zQ
 JpNg==
X-Gm-Message-State: APjAAAUnNglua5vd0+y+KuPP63drIuBmcVGky9OvGCLYsD3e90uoAdu8
 8NfPCfo2chubgMz3Yc+o46UDZEqt0XTAlsBc5dDV5A==
X-Google-Smtp-Source: APXvYqxbW9oSg56RSQlF2dXSYru4LB1XIBoZiwsrl9rhbUPB0PXHDbeJLHv9udziMFU9/nCnubxaoOVW2e3aa02T9dA=
X-Received: by 2002:a50:f742:: with SMTP id j2mr39611561edn.253.1571240680736; 
 Wed, 16 Oct 2019 08:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
In-Reply-To: <33bfd87f4c3345d28be4e8c1d64f1437@SCL-EXCHMB-13.phoenix.com>
From: Oskar Senft <osk@google.com>
Date: Wed, 16 Oct 2019 11:44:24 -0400
Message-ID: <CABoTLcSgz-_LJ3tZ70-WenCqWqv3Kknfsbe1qstKmoTiP2wqQA@mail.gmail.com>
Subject: Re: Recommendations for development platforms for the ASPEED AST2500
 & AST2600?
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Content-Type: multipart/alternative; boundary="000000000000a231d4059508fa87"
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

--000000000000a231d4059508fa87
Content-Type: text/plain; charset="UTF-8"

Hi Bruce

I've had good experience with the TYAN S7106. We still need to upstream the
DTS for the board, though (sorry, upstreaming is hard).

You might also want to get in touch with TYAN to see if they can share
further information on the board with you for your work.

Whatever platform you choose you'd want information on the BMC's I/O pin
configuration and potentially on how it's connected to the PCH.

Oskar.

On Tue, Oct 15, 2019 at 6:47 PM Bruce Mitchell <Bruce_Mitchell@phoenix.com>
wrote:

> Hello,
>
>
>
> I am Bruce Mitchell and I work for Phoenix Technologies Ltd. as a BMC
> firmware Engineer.
>
> Phoenix Technologies Ltd. is developing an OpenBMC (
> https://www.openbmc.org/ , not the Facebook flavor) product.
>
> Our intent is also to be a valuable contributing member to the OpenBMC
> project.
>
>
>
> We will be initially developing for the ASPEED Technology Inc. AST2500
> followed by the AST2600 BMC SoC.
>
> Do you have any suggestion of available hardware development platforms for
> the ASPEED AST2500 & AST2600?
>
>
>
>
>
> Thank you very much for your time and support.
>
>
>
> --
>
> Bruce Mitchell
>
> BMC Engineer
>
> 503-567-3032 <(503)%20567-3032> direct
>
> bruce_mitchell@phoenix.com
>
>
>
> Phoenix Technologies Ltd.
>
> 15266 NW Greenbrier Pkwy
>
> Beaverton, OR 97006 USA
>
> 503-567-3000 <(503)%20567-3000> main
>
>
>
> www.phoenix.com
>

--000000000000a231d4059508fa87
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Bruce<div><br></div><div>I&#39;ve had good experience w=
ith the TYAN S7106. We still need to upstream the DTS for the board, though=
 (sorry, upstreaming is hard).</div><div><br></div><div>You might also want=
 to get in touch with TYAN to see if they can share further information on =
the board with you for your work.</div><div><br></div><div>Whatever platfor=
m you choose you&#39;d want information=C2=A0on the BMC&#39;s I/O pin confi=
guration and potentially on how it&#39;s connected to the PCH.</div><div><b=
r></div><div>Oskar.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Oct 15, 2019 at 6:47 PM Bruce Mitchell &lt=
;<a href=3D"mailto:Bruce_Mitchell@phoenix.com">Bruce_Mitchell@phoenix.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_2686015480279491922WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Hello,<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">I am Bruce Mitc=
hell and I work for Phoenix Technologies Ltd. as a BMC firmware Engineer.<u=
></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Phoenix Technol=
ogies Ltd. is developing an OpenBMC (<a href=3D"https://www.openbmc.org/" t=
arget=3D"_blank">https://www.openbmc.org/</a> , not the Facebook flavor) pr=
oduct.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Our intent is a=
lso to be a valuable contributing member to the OpenBMC project.<u></u><u><=
/u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">We will be init=
ially developing for the ASPEED Technology Inc. AST2500 followed by the AST=
2600 BMC SoC.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Do you have any=
 suggestion of available hardware development platforms for the ASPEED AST2=
500 &amp; AST2600?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Thank you very =
much for your time and support.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">--<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Bruce Mitchell<=
u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">BMC Engineer<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><a href=3D"tel:=
(503)%20567-3032" value=3D"+15035673032" target=3D"_blank">503-567-3032</a>=
 direct<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><a href=3D"mail=
to:bruce_mitchell@phoenix.com" target=3D"_blank">bruce_mitchell@phoenix.com=
</a><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Phoenix Technol=
ogies Ltd.<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">15266 NW Greenb=
rier Pkwy<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas">Beaverton, OR 9=
7006 USA<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><a href=3D"tel:=
(503)%20567-3000" value=3D"+15035673000" target=3D"_blank">503-567-3000</a>=
 main<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><u></u>=C2=A0<u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas"><a href=3D"http=
://www.phoenix.com" target=3D"_blank">www.phoenix.com</a><u></u><u></u></sp=
an></p>
</div>
</div>

</blockquote></div>

--000000000000a231d4059508fa87--
