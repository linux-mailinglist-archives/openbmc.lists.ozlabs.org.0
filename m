Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A13532FE
	for <lists+openbmc@lfdr.de>; Sat,  3 Apr 2021 09:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FC83G5GKNz3bw7
	for <lists+openbmc@lfdr.de>; Sat,  3 Apr 2021 18:40:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YF5klVI0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=andy.shevchenko@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YF5klVI0; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FC82z5b2rz30Gd;
 Sat,  3 Apr 2021 18:40:10 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id b17so1210164pgh.7;
 Sat, 03 Apr 2021 00:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=/VWQTguZbClmhLMkddpK4tx4UhKYZCDRF6eFCfsrvns=;
 b=YF5klVI0SXr07UKSGfnM0mXpLHkrypUh0mpwvfQ/b5o2rKgwyKPDk2d0DhktpLHYME
 ultGEt0d2gUIP6KbEXVDEfWBoetkBbn+4LizJtM8wuAF2JRmJa40UqG50KUKOHySOBje
 23+s/B4sIxw520965a/jgqMKUweJED7E8SZ3gG4+fIfrkrISaaNQZmtU9sPsySC/iY/3
 EA3Otuj8S2pqUSIPuWwGeP4x7xMs9RfI5Owmlk4qgEu3DoQHKxvZlKh6a7mSF4HE7FL9
 6ev3XzzmMBNdQlpUaUWd7b7mqvpGGZM0UqBIZA0kfpfobb8QKuQtdPNLXby2FncPq1Ai
 z7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=/VWQTguZbClmhLMkddpK4tx4UhKYZCDRF6eFCfsrvns=;
 b=M6xKG3Ie+ZuGSls9N2TFs9IIUnh6wHnPZpPgVn6P0Gwfv28/ISqWmmYxZOgwCxlrTE
 bE0WXAawK7rQx7XgOWJTGOhFfHsH0J9Ty6SGALRT3qEPRMdczNzc+JjHiv8T8EmCwt/k
 +gcrnHbfSC5qLqFXWKiNx7/cDjreLiTy5x3EQmqKZj80ptdGJ0i1tjl8l7nWQ5MWS5hx
 1EQSZhqdAfE/9pAAlEXIRtc/GMdS7ox9vMgFEnqFlQ/bPvDtN5L65HVQYECvO+xm1S+x
 tRWkTv0GRRiWXRfqvIpVJU4S7yqx3eCd0jhEgQTaMNV6mH3EB2sG58iEbPgD6zPepWi8
 rcyQ==
X-Gm-Message-State: AOAM531cVRvAiS/bPnnOD90hZvYAVC6Q6dgawPZ8PBUTEbynsV/NPypA
 FYdrTa95UDT7BsWJR0NGtaqDLy2C0oll7qUleBo=
X-Google-Smtp-Source: ABdhPJxfvMndYCG5gXTBOYjqE1ZXp13pygO6vHd9jN2/8/blqIfAQmfOJP+8eySJUtZNc0e8SIpRQ1Ihtkjo0xfoSAw=
X-Received: by 2002:a62:e50f:0:b029:214:8e4a:ae46 with SMTP id
 n15-20020a62e50f0000b02902148e4aae46mr15442581pff.73.1617435606075; Sat, 03
 Apr 2021 00:40:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:7184:0:0:0:0 with HTTP; Sat, 3 Apr 2021 00:40:05
 -0700 (PDT)
In-Reply-To: <20210402182724.20848-1-zev@bewilderbeest.net>
References: <20210402182724.20848-1-zev@bewilderbeest.net>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Apr 2021 10:40:05 +0300
Message-ID: <CAHp75VfbPZ1Xh6_DdRYe=W1KRWg4ZDECDmH-Qeikbymr0hKY2g@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] aspeed-vuart: generalized DT properties
To: Zev Weiss <zev@bewilderbeest.net>
Content-Type: multipart/alternative; boundary="000000000000bf4c4105bf0c925d"
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
Cc: "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000bf4c4105bf0c925d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Friday, April 2, 2021, Zev Weiss <zev@bewilderbeest.net> wrote:

> This series generalizes the aspeed-vuart driver's device tree
> properties to cover all the attributes it currently exposes via sysfs.
>
> The aspeed,sirq-polarity-sense property was a bit of a design mistake
> in that it ties Aspeed VUART SIRQ polarity to SCU register bits that
> aren't really inherently related to it; the first patch in this series
> deprecates it (though we hope to eventually remove it).
>
> The rest of the series adds two new properties, aspeed,lpc-io-reg and
> aspeed,lpc-interrupts.  The latter allows describing the SIRQ polarity
> (along with the interrupt number) directly, providing a simpler
> replacement for aspeed,sirq-polarity-sense.
>
>
>
Please, use better prefixes in the patches to avoid confusion, I.e.

=E2=80=9Cserial: 8250_aspeed_vuart: =E2=80=9C

Instead of what you have now.


> Changes since v3 [2]:
>  - renamed properties to match aspeed,ast2400-kcs-bmc
>
> Changes since v2 [0]:
>  - expanded to also handle sirq number and lpc address in addition to
>    sirq polarity
>  - added default settings if DT properties not specified
>  - refactored existing sysfs code slightly, adding range checks
>  - cleaned up 'make dt_binding_check' warnings
>
> Changes since v1 [1]:
>  - deprecate and retain aspeed,sirq-polarity-sense instead of removing it
>  - drop e3c246d4i dts addition from this series
>
>
> [0] https://lore.kernel.org/openbmc/20210401005702.28271-
> 1-zev@bewilderbeest.net/
> [1] https://lore.kernel.org/openbmc/20210330002338.335-1-
> zev@bewilderbeest.net/
> [2] https://lore.kernel.org/openbmc/20210402004716.15961-
> 1-zev@bewilderbeest.net/
>
>
> Zev Weiss (4):
>   dt-bindings: serial: 8250: deprecate aspeed,sirq-polarity-sense
>   drivers/tty/serial/8250: refactor sirq and lpc address setting code
>   drivers/tty/serial/8250: add aspeed,lpc-io-reg and
>     aspeed,lpc-interrupts DT properties
>   dt-bindings: serial: 8250: add aspeed,lpc-io-reg and
>     aspeed,lpc-interrupts
>
>  .../devicetree/bindings/serial/8250.yaml      | 28 +++++-
>  drivers/tty/serial/8250/8250_aspeed_vuart.c   | 95 +++++++++++++++----
>  2 files changed, 103 insertions(+), 20 deletions(-)
>
> --
> 2.31.1
>
>

--=20
With Best Regards,
Andy Shevchenko

--000000000000bf4c4105bf0c925d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, April 2, 2021, Zev Weiss &lt;<a href=3D"mailto:zev@bewil=
derbeest.net">zev@bewilderbeest.net</a>&gt; wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">This series generalizes the aspeed-vuart driver&#39;s device tree=
<br>
properties to cover all the attributes it currently exposes via sysfs.<br>
<br>
The aspeed,sirq-polarity-sense property was a bit of a design mistake<br>
in that it ties Aspeed VUART SIRQ polarity to SCU register bits that<br>
aren&#39;t really inherently related to it; the first patch in this series<=
br>
deprecates it (though we hope to eventually remove it).<br>
<br>
The rest of the series adds two new properties, aspeed,lpc-io-reg and<br>
aspeed,lpc-interrupts.=C2=A0 The latter allows describing the SIRQ polarity=
<br>
(along with the interrupt number) directly, providing a simpler<br>
replacement for aspeed,sirq-polarity-sense.<br>
<br>
<br></blockquote><div><br></div><div>Please, use better prefixes in the pat=
ches to avoid confusion, I.e.=C2=A0</div><div><br></div><div>=E2=80=9Cseria=
l: 8250_aspeed_vuart: =E2=80=9C</div><div><br></div><div>Instead of what yo=
u have now.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Changes since v3 [2]:<br>
=C2=A0- renamed properties to match aspeed,ast2400-kcs-bmc<br>
<br>
Changes since v2 [0]:<br>
=C2=A0- expanded to also handle sirq number and lpc address in addition to<=
br>
=C2=A0 =C2=A0sirq polarity<br>
=C2=A0- added default settings if DT properties not specified<br>
=C2=A0- refactored existing sysfs code slightly, adding range checks<br>
=C2=A0- cleaned up &#39;make dt_binding_check&#39; warnings<br>
<br>
Changes since v1 [1]:<br>
=C2=A0- deprecate and retain aspeed,sirq-polarity-sense instead of removing=
 it<br>
=C2=A0- drop e3c246d4i dts addition from this series<br>
<br>
<br>
[0] <a href=3D"https://lore.kernel.org/openbmc/20210401005702.28271-1-zev@b=
ewilderbeest.net/" target=3D"_blank">https://lore.kernel.org/<wbr>openbmc/2=
0210401005702.28271-<wbr>1-zev@bewilderbeest.net/</a><br>
[1] <a href=3D"https://lore.kernel.org/openbmc/20210330002338.335-1-zev@bew=
ilderbeest.net/" target=3D"_blank">https://lore.kernel.org/<wbr>openbmc/202=
10330002338.335-1-<wbr>zev@bewilderbeest.net/</a><br>
[2] <a href=3D"https://lore.kernel.org/openbmc/20210402004716.15961-1-zev@b=
ewilderbeest.net/" target=3D"_blank">https://lore.kernel.org/<wbr>openbmc/2=
0210402004716.15961-<wbr>1-zev@bewilderbeest.net/</a><br>
<br>
<br>
Zev Weiss (4):<br>
=C2=A0 dt-bindings: serial: 8250: deprecate aspeed,sirq-polarity-sense<br>
=C2=A0 drivers/tty/serial/8250: refactor sirq and lpc address setting code<=
br>
=C2=A0 drivers/tty/serial/8250: add aspeed,lpc-io-reg and<br>
=C2=A0 =C2=A0 aspeed,lpc-interrupts DT properties<br>
=C2=A0 dt-bindings: serial: 8250: add aspeed,lpc-io-reg and<br>
=C2=A0 =C2=A0 aspeed,lpc-interrupts<br>
<br>
=C2=A0.../devicetree/bindings/<wbr>serial/8250.yaml=C2=A0 =C2=A0 =C2=A0 | 2=
8 +++++-<br>
=C2=A0drivers/tty/serial/8250/8250_<wbr>aspeed_vuart.c=C2=A0 =C2=A0| 95 +++=
++++++++++++----<br>
=C2=A02 files changed, 103 insertions(+), 20 deletions(-)<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote><br><br>-- <br>With Best Regards,<br>Andy Shevchenko<br><br><b=
r>

--000000000000bf4c4105bf0c925d--
