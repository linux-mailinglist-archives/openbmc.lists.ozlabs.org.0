Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C27EADAA4
	for <lists+openbmc@lfdr.de>; Mon,  9 Sep 2019 16:02:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46RqcD64xtzDqNX
	for <lists+openbmc@lfdr.de>; Tue, 10 Sep 2019 00:02:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="COq4BPmx"; 
 dkim-atps=neutral
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46RqZv6DdjzDqHg
 for <openbmc@lists.ozlabs.org>; Tue, 10 Sep 2019 00:01:25 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id v38so13057780edm.7
 for <openbmc@lists.ozlabs.org>; Mon, 09 Sep 2019 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VaBE61BB5p3R0WxaYYXFQ7eNf5dxGZPkxXppKPrG12g=;
 b=COq4BPmxPKK5wpHzUBl40eUaK2UBm+2UxYl+2YCpHuMh6JkND8bwdwujyd0ZF1mEMT
 yZk/fTQLs57Av7IU+wCK334y5E0QqjtGkGEZKkuxoYz6WHQmskwQIRYIfqNT8dIVlqfA
 a2FM3GGYLqpBC5KsOaT6MJIj3j7lOWg1cl8tkDKygM+0kxpAo2t6RKonckQiYvowBUUe
 Q+d4CiNqKOEaNGKQlTzUfJGrlAJm6qPZrTMfeTUaejO5L4aLnjvV7a1IOBDMYrF21rzE
 0H6YPUN10UiVtpC1yo0rLdAve5GdxvHVa1mIdrZ1d2gzpm1kzAlayRcP12sUrHhfUcb9
 7T7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VaBE61BB5p3R0WxaYYXFQ7eNf5dxGZPkxXppKPrG12g=;
 b=XzIfSO5n+JVMCsotevo5nnsr422JBFt4P5m5VdCAA5LGv5u4p1yVPvcQmIdWeL877G
 h41j7F+vIbneFKHuq1txWJ+OGmBWfcaY6XNQev8C2fgIBrW1NmH8e7ftcx0B6ck5JTJC
 mnr1pkymP/NmUb89zSJIa2hrvz36taKS66ne9eTbf6WESrVZthcJs8iPiGJ/1I/rOP72
 R/3SB73nv+znpfISjaw9w1ToUS/7Cn0Ry7TEVzYNqHaDE2NRT5UIzq7H39aHPn2S/oO9
 MLuUvXZTVMr+/CL0YaIyrSuPUlymkXkTnYnnEht0pnJvoDZIR/KlYtlc03fEYmHNLMOf
 zAbw==
X-Gm-Message-State: APjAAAXq7BNpv0Wjy3f7BsaZUbFYCS4P09KzaIeXtEQl0YkXd2g9aEdG
 7N/h/w/nGT2KUVMTE4TPNQs+MQZszAJd9Cj31PGSLQ==
X-Google-Smtp-Source: APXvYqwF6MAaIF63N+wmfPuvotwdAcTo9sK0Mq85S+qrPE7P552SO6Wl2DTJ1fgFtqf76ujO3E5jdwFggic+XawMnus=
X-Received: by 2002:a50:d718:: with SMTP id t24mr22110627edi.168.1568037681623; 
 Mon, 09 Sep 2019 07:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <befd14ce992e47dba06d993e04cec647@lenovo.com>
In-Reply-To: <befd14ce992e47dba06d993e04cec647@lenovo.com>
From: Oskar Senft <osk@google.com>
Date: Mon, 9 Sep 2019 10:01:05 -0400
Message-ID: <CABoTLcRrd2sgxa6qN9bQQxyfX4E4fWpX=xmxFVeiksU8sk9tbw@mail.gmail.com>
Subject: Re: phosphor-ipmi-flash: Update over eSPI interface
To: Harry Sung1 <hsung1@lenovo.com>
Content-Type: multipart/alternative; boundary="0000000000000265ea05921f39e6"
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
Cc: Patrick Venture <venture@google.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Andrew MS1 Peng <pengms1@lenovo.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000000265ea05921f39e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Harry

What's the behavior on eSPI? I assume you still have the aspeed-lpc-ctrl
enabled, right?

Thanks
Oskar.

On Mon, Sep 9, 2019 at 4:41 AM Harry Sung1 <hsung1@lenovo.com> wrote:

> Hi Patrick,
>
>
>
> I found =E2=80=9Cphosphor-ipmi-flash=E2=80=9D have not support flash over=
 eSPI yet.
>
> May I ask if you have any plans to support flash over eSPI?
>
>
>
> I have done a simple test about shared memory between host and BMC :
>
> The shared memory is work after I set ESPI084 (source address) and ESPI08=
8
> (target address) registers.
>
> But it has an limitation that only 256 bytes are available on each page
> (4KB).
>
>
> For example, if host address starts to write from 0xFE0B0000 (BMC reserve=
d
> enough memory already)
>
> Writable area are:
>
> 0xFE0B0000 ~ 0xFE0B00FF
>
> 0xFE0B1000 ~ 0xFE0B10FF
>
> 0xFE0B2000 ~ 0xFE0B20FF
>
> 0xFE0B3000 ~ 0xFE0B30FF
>
> =E2=80=A6
>
> =E2=80=A6
>
> =E2=80=A6
>
>
>
>
>
> Thanks,
> Harry
>

--0000000000000265ea05921f39e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Harry<div><br></div><div>What&#39;s the behavior on eSP=
I? I assume you still have the aspeed-lpc-ctrl enabled, right?</div><div><b=
r></div><div>Thanks</div><div>Oskar.</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 9, 2019 at 4:41 AM Ha=
rry Sung1 &lt;<a href=3D"mailto:hsung1@lenovo.com" target=3D"_blank">hsung1=
@lenovo.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">





<div lang=3D"ZH-TW">
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi Patrick,<u></u><u></u></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I found =E2=80=9Cphosphor-ipmi-=
flash=E2=80=9D have not support flash over eSPI yet.<u></u><u></u></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">May I ask if you have any plans=
 to support flash over eSPI?<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I have done a simple test about=
 shared memory between host and BMC :<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The shared memory is work after=
 I set ESPI084 (source address) and ESPI088 (target address) registers.<u><=
/u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">But it has an limitation that o=
nly 256 bytes are available on each page (4KB).<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><br>
For example, if host address starts to write from 0xFE0B0000 (BMC reserved =
enough memory already)<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Writable area are:<u></u><u></u=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B000=
0 ~ 0xFE0B00FF
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B100=
0 ~ 0xFE0B10FF<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B200=
0 ~ 0xFE0B20FF<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:black">0xFE0B300=
0 ~ 0xFE0B30FF<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=E2=80=A6<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=E2=80=A6<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">=E2=80=A6<u></u><u></u></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Thanks,<br>
Harry<u></u><u></u></span></p>
</div>
</div>

</blockquote></div>

--0000000000000265ea05921f39e6--
