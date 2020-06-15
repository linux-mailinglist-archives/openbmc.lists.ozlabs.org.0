Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C32E41FA4D5
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 01:59:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49m7bs5g5fzDqg9
	for <lists+openbmc@lfdr.de>; Tue, 16 Jun 2020 09:59:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::129;
 helo=mail-il1-x129.google.com; envelope-from=vasantpatil2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P+5jtZup; dkim-atps=neutral
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49m7b167kmzDqQs
 for <openbmc@lists.ozlabs.org>; Tue, 16 Jun 2020 09:58:51 +1000 (AEST)
Received: by mail-il1-x129.google.com with SMTP id b5so17135700iln.5
 for <openbmc@lists.ozlabs.org>; Mon, 15 Jun 2020 16:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lPXVq+KsIEb8lo7fe9V1CIlm+XW2x13xK/jo+aQo4Pc=;
 b=P+5jtZupM5rO65yy22aJF7oeMXfnAHBsNTiJ+eY9flfjFOb+10Y8uaQLILbzgmG2V6
 g4Dp+S7NFq4yMz1lhaRuCL4JNQ6xhJnAH6mpsQsSgjctBvPY9JEr3qwwlxMIk8SHM9lY
 EW2eUirYNivbtM/GtffAR+8WaJ6HJ7NMkFpd+LCccYhC6BxI8K+ndYOjcO2h6E/OLf2h
 M/arzFM+Q9uhoxygSivrEVI2UB+7SWxj73lrfXrFOpfIsj3oy/g4HM9hXukXh9diIBSq
 T4pFLGR8Ee0KpJBJsBlIQrf6nzKGSWdNrgw2LIzVnE7Z5MLAIUCR0I47Fhw8mW3I+js4
 XYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lPXVq+KsIEb8lo7fe9V1CIlm+XW2x13xK/jo+aQo4Pc=;
 b=f6lsbFSg7jNZqnj4IJ75dtB8HUTnSEqUSQNwGLgm+eLH4HGW3Qj5AhMzImbnY2EYji
 ooe2ZFknqlQlIjiyH+nbUch+TA4bT2/9Z7OLo2eCeAgpswHRuvsTOQYiuJvP9G0wDuqA
 7iZ7uf2+L0IRTT2BE5pK+c7lseJ1P1fGgVEEamEvB5ggOKShP2rVbrvWkHVe8CKo6RX4
 TBsjFO+HqJPiZ5EE0aHzFROi5aEX8EgVDKvHbjWBsVgODNZ3yU34A3ZfZYd9R+gknSVg
 skaAYDK8uv7FvdVsB4pESQjUszh1PtQY5fWXN/xQlSM1gV5TrDtkFEEEv5EPbHAJ1Wqh
 i0sw==
X-Gm-Message-State: AOAM532JQzVSIx90rF620adWyQ6q6gk9NpReYDZP+wNuBDDD7YWpB9h6
 QUwL6mlRPAmE+ICngl9/Rp1mYFXmwzzYdnbuz4k=
X-Google-Smtp-Source: ABdhPJyb3Mpvzrq5VtpemTWOuy/8Pc7IEMtPb7i1Z6yFolzYMxIFcpqGs+eLSrBya+2QXBesJ+NRqQBkfUt74evESUY=
X-Received: by 2002:a92:b00f:: with SMTP id x15mr459070ilh.27.1592265527825;
 Mon, 15 Jun 2020 16:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <BN8PR12MB32820451E47D3AE41B7401A8C79C0@BN8PR12MB3282.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB32820451E47D3AE41B7401A8C79C0@BN8PR12MB3282.namprd12.prod.outlook.com>
From: vasant patil <vasantpatil2@gmail.com>
Date: Mon, 15 Jun 2020 19:58:35 -0400
Message-ID: <CAERBOQJJXu+4FikBD=G16eGeCOq712ZfyMSsV_EVuwg=h_pMWw@mail.gmail.com>
Subject: Re: OpenBMC Redish support and Working Group meeting
To: Vasant Patil <vasantp@nvidia.com>
Content-Type: multipart/alternative; boundary="0000000000002c993705a8283546"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--0000000000002c993705a8283546
Content-Type: text/plain; charset="UTF-8"

Fixing typo in subject line:)

Team you might receive with same subject line from my personal email.
Please ignore that since when i send email from NVIDIA ID ,it bounced back
so I used my personal email I'd with which I subscribed.

Sorry for the spam.

Regards
Vasant


On Mon, Jun 15, 2020, 6:50 PM Vasant Patil <vasantp@nvidia.com> wrote:

> Hi Team,
>
>
>
> I am Vasant from NVIDIA corporation. We are exploring adopting OpenBMC for
> our products.  Thanks Andrew J, Deepak K , Patrick Williams, Ben Wei and
> Sai for your guidance so far.  We have below questions . I will create
> separate question
>
>
>
> Is below two functions supported via redfish
>
>    1. System Boot order change
>    2. Changing SBIOS(UEFI) configuration parameters e.g. Hyperthreading
>    enable/disable etc.
>
>
>
> *General Question: *
>
>    - Are users allowed to attend the working group (like PMCI) meeting
>    who have not yet signed the CCLA?
>
>
>
> Regards,
>
> Vasant
>

--0000000000002c993705a8283546
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Fixing typo in subject line:)<div dir=3D"auto"><br><=
/div><div dir=3D"auto">Team you might receive with same subject line from m=
y personal email. Please ignore that since when i send email from NVIDIA ID=
 ,it bounced back so I used my personal email I&#39;d with which I subscrib=
ed.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry for the spam.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Regards</div><div=
 dir=3D"auto">Vasant</div><br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Jun 15, 2020, 6:50 PM Vasant Patil &lt;<a h=
ref=3D"mailto:vasantp@nvidia.com">vasantp@nvidia.com</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">





<div lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"m_8296468177783014875WordSection1">
<p class=3D"MsoNormal">Hi Team,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">I am Vasant from NVIDIA corporation. We are explorin=
g adopting OpenBMC for our products.=C2=A0 Thanks Andrew J, Deepak K , Patr=
ick Williams, Ben Wei and Sai for your guidance so far.=C2=A0 We have below=
 questions . I will create separate question
<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Is below two functions supported via redfish<u></u><=
u></u></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"m_8296468177783014875MsoListParagraph" style=3D"margin-left:0i=
n">System Boot order change
<u></u><u></u></li><li class=3D"m_8296468177783014875MsoListParagraph" styl=
e=3D"margin-left:0in">Changing SBIOS(UEFI) configuration parameters e.g. Hy=
perthreading enable/disable etc.<u></u><u></u></li></ol>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><u>General Question: <u></u><u></u></u></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"m_8296468177783014875MsoListParagraph" style=3D"margin-left:0i=
n">Are users allowed to attend the working group (like PMCI) meeting who ha=
ve not yet signed the CCLA?<u></u><u></u></li></ul>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Regards,<u></u><u></u></p>
<p class=3D"MsoNormal">Vasant <u></u><u></u></p>
</div>
</div>

</blockquote></div></div></div>

--0000000000002c993705a8283546--
