Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74365456B67
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 09:13:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwTv43DKqz2xsh
	for <lists+openbmc@lfdr.de>; Fri, 19 Nov 2021 19:13:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RbjWIwGA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a;
 helo=mail-ed1-x52a.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=RbjWIwGA; dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwTtd408Wz2xtF;
 Fri, 19 Nov 2021 19:12:55 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id g14so39246252edb.8;
 Fri, 19 Nov 2021 00:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hR2yAk325BrlRylkCWxD2TTaF6J8KvgiXiq2KAxagn8=;
 b=RbjWIwGAfjBxtMZvbLRNc601OVlviKl1wEKMt3Bx7r9rCC+ujAi6/yrKHIzZNeLEke
 V/kb5lcPddRMlRKlKbFJquJWybz6OdPehotZ4BDpjNr2lOAZL/uYw0KEeZOlEP5/Avb9
 gwa2+f9uJyPiJBhrvtMFM+tM4q1lyJFTHnym9jJ0yHPTq2WAni3Z/O9O6DwETzrTYQAq
 GwQ0g3DCI3AoAka3GOyD0GKIqskZX8J5kYCnD5bPzc0DAbVTdsm3wlkkhBXN8VETKmm1
 0YddiQ58joqkOUoUNz3IBfzG9/GhS2OdULtq8zQPhyEzkrfk3BIBNAnoexut9IC1uvWj
 tifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hR2yAk325BrlRylkCWxD2TTaF6J8KvgiXiq2KAxagn8=;
 b=tCESXVrO1dx+hhUS1TwOIBsXMdjzMMnaNA1BDrKDy5UlsLAcwJ3wMwPOXp6SVllVKI
 +aPj3hsEBa8mlEVGYnogAzHE/8HNVCDOixUnGQ/WPqETU1IM/zUM2nJGFTVEy6+mtcNq
 67ZTnQtY8sEPBN6yT9OGWTLoFBDoHkwCuTzhofG7gBSCuDlR6cG65bkBrMoA2KPkDuFD
 yggPFhramHPl7kJA/nRDRzwrgHRmr2viYB12ClBgcFoq+ZcSisL09GwsPYhPrG33k7jv
 iNy8PDwS6KDafI3+S246Zu/C+hBQyyD8meThyWIgUZZIIiJkXabxHG3sEFfva6ZygMkA
 3fxQ==
X-Gm-Message-State: AOAM531PYQOMyz5kbZlPdrdApi/B165P2DC0/N+gm/nZgT5dD+OPduq3
 q1Da69PWoQh2ZJft26QPoBTC4UcBOxbf5Bm5DEI=
X-Google-Smtp-Source: ABdhPJxjGiCxWgyXlAlaNgDNDICuCWU7nWNeM/cd4+lZw+0LngVTGS8ehkLnD7w65I1brITSyetSl9dC1J2rruob4o4=
X-Received: by 2002:a50:ce4a:: with SMTP id k10mr22223815edj.31.1637309567492; 
 Fri, 19 Nov 2021 00:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20211118160301.GA19542@gmail.com>
 <20211118223228.7edfeade@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211118223228.7edfeade@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Fri, 19 Nov 2021 13:44:42 +0530
Message-ID: <CAA7TbctSATJ3w_4y+btdfbjs7GTx9BptGZ3QKUjjX_Up+15thA@mail.gmail.com>
Subject: Re: [PATCH v7] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="00000000000028653005d11fd746"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000028653005d11fd746
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 12:02 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 18 Nov 2021 21:33:02 +0530 Kumar Thangavel wrote:
> > +const static int padding_bytes =3D 26;
>
> /net/ncsi/ncsi-cmd.c:21:1: warning: =E2=80=98static=E2=80=99 is not at be=
ginning of
> declaration [-Wold-style-declaration]
>    21 | const static int padding_bytes =3D 26;
>

ACK.

>       | ^~~~~
>

--00000000000028653005d11fd746
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 19, 2021 at 12:02 PM Jaku=
b Kicinski &lt;<a href=3D"mailto:kuba@kernel.org">kuba@kernel.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 18=
 Nov 2021 21:33:02 +0530 Kumar Thangavel wrote:<br>
&gt; +const static int padding_bytes =3D 26;<br>
<br>
/net/ncsi/ncsi-cmd.c:21:1: warning: =E2=80=98static=E2=80=99 is not at begi=
nning of declaration [-Wold-style-declaration]<br>
=C2=A0 =C2=A021 | const static int padding_bytes =3D 26;<br></blockquote><d=
iv><br></div><div>ACK.=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0 =C2=A0 =C2=A0 | ^~~~~<br>
</blockquote></div></div>

--00000000000028653005d11fd746--
