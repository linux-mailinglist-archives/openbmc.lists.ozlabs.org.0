Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C422DA73
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 12:25:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DRg974mQzDqKD
	for <lists+openbmc@lfdr.de>; Wed, 29 May 2019 20:25:25 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::12e; helo=mail-it1-x12e.google.com;
 envelope-from=tyler.sabdon@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UgdW/lWA"; 
 dkim-atps=neutral
Received: from mail-it1-x12e.google.com (mail-it1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DRff6YmWzDqF0
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 20:24:58 +1000 (AEST)
Received: by mail-it1-x12e.google.com with SMTP id h20so2809300itk.4
 for <openbmc@lists.ozlabs.org>; Wed, 29 May 2019 03:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9rcGM9GkQc6OE6+i3+MNzG5PHqRhv0Itgo+EFL66LpY=;
 b=UgdW/lWAw5DlkY1fv+y05dJya5MPy0VBsu85vuVx69pZ6/bZaWgN+NpFr4IRME70yZ
 q8EZsl2iT2clAtc13D/o+/tYULLVsfHIfGTeOqCkv+aa56LZ5ITACC9OIQBWrDGCJd2I
 f9RTMDw3IQScj5V238/BZNoiamPdw6Ks9mW4rQZcH/9fnRk3I/lN/HDglpMvAIsliEA0
 KuccakoiXoHaoGu5Kcyba+xUdS0TmZMfJELHd4+daXLGKOINpAmk5VvqmaWDkpho8uMT
 pYHmqULAIhDqRZ1bD7SF6wXvUOsinzteqV2EXvbAeV20gggg4NeYnrOCfz3wIYZU2Vl0
 84Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9rcGM9GkQc6OE6+i3+MNzG5PHqRhv0Itgo+EFL66LpY=;
 b=i6vyPqAwTmHFa9hegYQDhtPdf7UgUGFI1Qr8GVRz9IKWv1NvUUJ18x1N4AEBU8UWQe
 Tmbtkui9Jsl8ZaNCXM+nsul2lppeMw8wTiI617gDRFano9zMku9lCCzB7RWK1w8WKECx
 Zd+IrzFlQm2aAvRN4klvEmg8RGyotv0i5XoDr/tWKmRiurHqI6ftm0Nab57JF1P48SnD
 vUz7G83y+t2JWuy/toebKN/RU4p1FLgPNYIunriOIbvUwe2PSfvYdt6UzjzvR2Myrx8P
 dkeAPmfFq9d47SKGt0xMc+zV5F6wTLNRao9NudWfQKrS8fLvyy+8RIMZOjknbHzJ57E9
 AyFA==
X-Gm-Message-State: APjAAAVXXbMDpbkhRm18TO47Ynu4cd75H8tXpQ4yYM2KX9hkEC/bziTX
 H8DUsMCr0QRt6u5VZIg/Ui9pa3uwtZk7X/wG6IABDh5+
X-Google-Smtp-Source: APXvYqxiZfz3gsq9CG1tvhEPe+aUwR2gZb3ijFJpbjUSqg6uqXfRhi0qwDgEi3GhENbl0WNzgRR0vF2Uk3ZzM/x2GB0=
X-Received: by 2002:a24:1dce:: with SMTP id 197mr7062207itj.16.1559125494750; 
 Wed, 29 May 2019 03:24:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAO9PYRLdxqjbMHgsMoEY7m0ygwchLQk=7GOQr_itjqor=AMqfA@mail.gmail.com>
In-Reply-To: <CAO9PYRLdxqjbMHgsMoEY7m0ygwchLQk=7GOQr_itjqor=AMqfA@mail.gmail.com>
From: Deng Tyler <tyler.sabdon@gmail.com>
Date: Wed, 29 May 2019 18:24:57 +0800
Message-ID: <CAO9PYRLkgxrpes9QvzaN30TNu4-hcL5apFLhgdoBbzqiHynbRw@mail.gmail.com>
Subject: Re: Flash bmc fail due to partition incorrect
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000466476058a0431f9"
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000466476058a0431f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Deng Tyler <tyler.sabdon@gmail.com> =E6=96=BC 2019=E5=B9=B45=E6=9C=8829=E6=
=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:07=E5=AF=AB=E9=81=93=EF=BC=9A

> Hi all:
>     I encounter bmc firmware update fail issue and message is "Verify
> error: update: --no-flash --ignore-mount --no-save-files --no-restore-fil=
es
> --no-clean-saved-files\nERROR: Unable to find mtd partition for
> image-bmc.\n".
>
> I check my flash partition and found that I lost "bmc" partition as below=
:
> cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 00060000 00001000 "u-boot"
> mtd1: 00020000 00001000 "u-boot-env"
> mtd2: 00440000 00001000 "kernel"
> mtd3: 01740000 00001000 "rofs"
> mtd4: 00400000 00001000 "rwfs"
>
ls -l /dev/mtd
lrwxrwxrwx    1 root     root             7 May 23 11:56 kernel -> ../mtd2
lrwxrwxrwx    1 root     root             7 May 23 11:56 rofs -> ../mtd3
lrwxrwxrwx    1 root     root             7 May 23 11:56 rwfs -> ../mtd4
lrwxrwxrwx    1 root     root             7 May 23 11:56 u-boot -> ../mtd0
lrwxrwxrwx    1 root     root             7 May 23 11:56 u-boot-env ->
../mtd1

>
> I tried to add bmc partition in dts
> &bootspi {
>         status =3D "okay";
>         flash@0 {
>                 status =3D "okay";
>                 m25p,fast-read;
>                 label =3D "bmc";
>                 spi-max-frequency =3D <50000000>;
> #include "openbmc-flash-layout.dtsi"
>         };
> };
>
> but there still is no "bmc" partition. Could someone give any suggestion?
> thanks.
>
> Tyler
>

--000000000000466476058a0431f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Deng Tyler &lt;<a href=3D"mailto:tyle=
r.sabdon@gmail.com">tyler.sabdon@gmail.com</a>&gt; =E6=96=BC 2019=E5=B9=B45=
=E6=9C=8829=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:07=E5=AF=AB=E9=
=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Hi all:<div>=C2=A0 =C2=A0 I encounter bmc firmware update =
fail issue and message is &quot;Verify error: update: --no-flash --ignore-m=
ount --no-save-files --no-restore-files --no-clean-saved-files\nERROR: Unab=
le to find mtd partition for image-bmc.\n&quot;.</div><div><br></div><div>I=
 check my flash partition and found that I lost &quot;bmc&quot; partition a=
s below:</div><div>cat /proc/mtd<br>dev: =C2=A0 =C2=A0size =C2=A0 erasesize=
 =C2=A0name<br>mtd0: 00060000 00001000 &quot;u-boot&quot;<br>mtd1: 00020000=
 00001000 &quot;u-boot-env&quot;<br>mtd2: 00440000 00001000 &quot;kernel&qu=
ot;<br>mtd3: 01740000 00001000 &quot;rofs&quot;<br>mtd4: 00400000 00001000 =
&quot;rwfs&quot;<br></div></div></blockquote>ls -l /dev/mtd<br>lrwxrwxrwx =
=C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 7 May 23 11:56 kernel -&gt; ../mtd2<br>lrwxrwxrwx =C2=A0 =C2=A01 roo=
t =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 May 23 11:=
56 rofs -&gt; ../mtd3<br>lrwxrwxrwx =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 7 May 23 11:56 rwfs -&gt; ../mtd4=
<br>lrwxrwxrwx =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 7 May 23 11:56 u-boot -&gt; ../mtd0<br><div>lrwxrwxrwx=
 =C2=A0 =C2=A01 root =C2=A0 =C2=A0 root =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 7 May 23 11:56 u-boot-env -&gt; ../mtd1=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div><div><br></div=
><div>I tried to add bmc partition in dts=C2=A0</div><div>&amp;bootspi {<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 flash@0 {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 status =3D &quot;okay&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 m25p,fast-read;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 label =3D &quot;bmc&quot;;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spi-max-frequency =3D &lt;50000000&gt;;<br>=
#include &quot;openbmc-flash-layout.dtsi&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 };<br>};<br></div><div><br></div><div>but there still is no &quot;bmc&q=
uot; partition. Could someone give any suggestion? thanks.</div><div><br></=
div><div>Tyler</div></div>
</blockquote></div></div>

--000000000000466476058a0431f9--
