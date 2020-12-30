Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48D2E7624
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 06:06:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D5K4p5S1vzDqGq
	for <lists+openbmc@lfdr.de>; Wed, 30 Dec 2020 16:06:18 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f;
 helo=mail-lf1-x12f.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XPFBcCrE; dkim-atps=neutral
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D5K3n57jDzDqGX
 for <openbmc@lists.ozlabs.org>; Wed, 30 Dec 2020 16:05:23 +1100 (AEDT)
Received: by mail-lf1-x12f.google.com with SMTP id h205so35270279lfd.5
 for <openbmc@lists.ozlabs.org>; Tue, 29 Dec 2020 21:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7DMmuxqBW+v4vtcTOvA9Ea2RUGXk1k7S4CBkweiF1o=;
 b=XPFBcCrENujvbdBzGoFQCpb58Xu/cO++lc0KBapICx+lE0MbQcVbd1nTl8j8LdE3uy
 L6JsbI6pOVOac4Bm2BKNYmlBzutO57A5pfSrpNmVfeMGUTeimMzXAJcQ9etHj0t7bLe5
 y/QgXO41hgTXf2ErxLDn/5zTIQw2r3XK+9N/tInaXDn1qAl/5Y2xsXYNmQE/24qVEkvb
 +Ht3L0IpDdYyOFbso26BsiUYICthk25ju6fvfpWne82I0Ky9eOjqdQy/aKJuG2vQwRYg
 CQYfwMOTe/mfPO5ignINrm60Jye8bJYmn+Sj58VP6xgTL7yHfGPptsjUtW2jp5DULs6M
 2Hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7DMmuxqBW+v4vtcTOvA9Ea2RUGXk1k7S4CBkweiF1o=;
 b=dCK7qYZqwx5O+M2KUlAUT/CDWVqvfYkmfbTWAdflXnKIHDRz7uwXE0623ftzibNLLQ
 msbZZxuHKpXaaQM0/w7RMOugbWpnxSzomUwmYH1yQkuc3FZjvEW8xfx5oYVxIWVBOCa+
 SEfNuVbROIctMggePwoibSXOg5UBaBVxA9iz8Tu4bpScFP0RtgF7Qi2ApuM1k+xXT7cB
 4CWqGU+mQYZvySXVWtpj8Kwx0WAvQq5tFnX0ewrZ9F6U4JZN8Xm86s+NJd+0GmblPXPh
 aAG/1HUNmTc1w8umEvLZyLm/RAnWr+p46sJQtGmxDCq935k/Ep1/3g+qPH364poWhIxj
 pXUg==
X-Gm-Message-State: AOAM5330M91ph3/t7Stf8vLJWqWo+ZojecVO0PJzfaRe90aknBsI16Qa
 XSJrZnLYJpYt/eGm9SU0lFucaXalORHjl/GAHgVoe/3z
X-Google-Smtp-Source: ABdhPJw77i/sLnNuYLrm+/NtKyaq9qpokxy5PUiHBIy8F08eag6ScKB9+8SjCOF5AI1Ao8NGojwnivoSw48EbB8B918=
X-Received: by 2002:ac2:5bc2:: with SMTP id u2mr23103240lfn.565.1609304719151; 
 Tue, 29 Dec 2020 21:05:19 -0800 (PST)
MIME-Version: 1.0
References: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
In-Reply-To: <SG2PR04MB30939AC2AE5E41555B8BBE08E1DD0@SG2PR04MB3093.apcprd04.prod.outlook.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Tue, 29 Dec 2020 21:05:07 -0800
Message-ID: <CAJTGxZHVwf_Lr=5YF2q9Jt8W_p_BT62M12WOPNast4pMKht4DA@mail.gmail.com>
Subject: Re: Sensor Details
To: Jayashree D <jayashree-d@hcl.com>
Content-Type: multipart/alternative; boundary="0000000000001ed61c05b7a77403"
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

--0000000000001ed61c05b7a77403
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 24, 2020 at 7:55 AM Jayashree D <jayashree-d@hcl.com> wrote:

> Classification: *Public*
>
> Hi Team,
>
>
>
> Is there a way to get the details of sensor events like crossed
> threshold/fault etc from any other service running on bmc (ex.
> phosphor-led-manager).
>
This has been enabled in tiogapass, I don't remember which application but
I see logs if there is any threshold hit.

>
>
> Please provide your inputs/suggestions on this.
>
>
>
> Regards,
>
> Jayashree
>
>
> ::DISCLAIMER::
> ------------------------------
> The contents of this e-mail and any attachment(s) are confidential and
> intended for the named recipient(s) only. E-mail transmission is not
> guaranteed to be secure or error-free as information could be intercepted,
> corrupted, lost, destroyed, arrive late or incomplete, or may contain
> viruses in transmission. The e mail and its contents (with or without
> referred errors) shall therefore not attach any liability on the originator
> or HCL or its affiliates. Views or opinions, if any, presented in this
> email are solely those of the author and may not necessarily reflect the
> views or opinions of HCL or its affiliates. Any form of reproduction,
> dissemination, copying, disclosure, modification, distribution and / or
> publication of this message without the prior written consent of authorized
> representative of HCL is strictly prohibited. If you have received this
> email in error please delete it and notify the sender immediately. Before
> opening any email and/or attachments, please check them for viruses and
> other defects.
> ------------------------------
>

--0000000000001ed61c05b7a77403
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 24, 2020 at 7:55 AM Jayas=
hree D &lt;<a href=3D"mailto:jayashree-d@hcl.com">jayashree-d@hcl.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_5863433896934686407WordSection1">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">Classification: <b><spa=
n style=3D"color:green">Public</span></b><span style=3D"font-size:12pt"><u>=
</u><u></u></span></p>
<p class=3D"MsoNormal">Hi Team,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Is there a way to get the details of sensor events=
 like crossed threshold/fault etc from any other service running on bmc (ex=
. phosphor-led-manager).</span></p></div></div></blockquote><div>This has b=
een enabled in tiogapass, I don&#39;t remember which application but I see =
logs if there is any threshold hit.=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div lang=3D"EN-US"><div class=3D"gmail-m_58634338969=
34686407WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:10.5p=
t;font-family:&quot;Segoe UI&quot;,sans-serif"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.5pt;font-family:&quot;Se=
goe UI&quot;,sans-serif">Please provide your inputs/suggestions on this.<u>=
</u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Jayashree<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
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

--0000000000001ed61c05b7a77403--
