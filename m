Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3DD6CD8B4
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 13:46:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmlB33GJMz3f5W
	for <lists+openbmc@lfdr.de>; Wed, 29 Mar 2023 22:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IHwXdetf;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=satishroyal4u@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IHwXdetf;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pml9T02THz3c9H
	for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 22:45:32 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id h17so15325910wrt.8
        for <openbmc@lists.ozlabs.org>; Wed, 29 Mar 2023 04:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680090327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NQLmytFVskrVAW2W0v01uI1zl+of4k+L3nGXnHzphMY=;
        b=IHwXdetfCMklr7Z8rvh8aUAyjc8eQowmd6D2fQnj4Kmfj1On1DQA+FCAw6+Wx3MMVe
         vhnRSjaVoM5nh/tdSm4y1egVqkGEAUCx7lA12pG+ahjDO2YBsLCmCAq1rkhgMwCJ7wYq
         rgZMGKmuT8G1iRKda9RfeIlPkTdOJoQt/5/GnnYEFP4zwnjK/7DQDkCeibyDq0qkSdl8
         KfYmos2P9WSfAbuKXkIzh8avM/5XOBl7LCNbSRNby4nWbb+1kxfMTuPBNhxb+Zusi7TO
         btkjyUqLrH5wIdaO137fTzSFrfjpm+PNao7DnMh372hD6a/4P5ATCAJtB35f0HP/KU2q
         zuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680090327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NQLmytFVskrVAW2W0v01uI1zl+of4k+L3nGXnHzphMY=;
        b=IKYIsr5SzAU22dE0DEnzxkE0X1tVph2MYUQyZRLAAOknBu0yCHXgNv97lcx5++4lhd
         yFAaaZQ7sA3FbmMPPTxR4PnOTBg7k/y75/kf0mkwFv8lHEyKktvsJ4GCAaXLaVq432Ql
         zhe5I4lC1RL50052inuBuqedoEfLAwj4LnDqlrPLv0NAYhmrIc1HtQtshV56NZwWKS6Z
         Teiy9vmVkzjMQhf5ICD+XA3tK8SvoOcnkpf01+PbN7+rdfnjUQDicT2S4X2d6FCECmeR
         E+hMVGftaLF5KhvPAYkYVEYSLV15yPJocLA22nW3YEnsl6stLaq+mU/GT+zC5GQwgI/Q
         4Akw==
X-Gm-Message-State: AAQBX9cUa5En4myNZcQzdfSxCck2RT86Opo/1WQZ0CYjLVPiYZvmJAUm
	h/BmAU5UF8sVIUmLrmldRgOGmOcP16Lk8doYRX8=
X-Google-Smtp-Source: AKy350YZO0siEqzhoKvyoXitbTsBur+iy66ZNiPX4mX4n1Vntj8fLZG+H3f7O2NmwUIZkXInR0MYKEHFuW9UvCIRdi8=
X-Received: by 2002:a5d:4a52:0:b0:2e1:1569:6e07 with SMTP id
 v18-20020a5d4a52000000b002e115696e07mr2028006wrs.9.1680090326780; Wed, 29 Mar
 2023 04:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAGugOWsUK=2gE6iBiumKukO87b_cgAm2eT+Y=su1PPWow1-S8Q@mail.gmail.com>
 <20230328224413.GB18848@packtop>
In-Reply-To: <20230328224413.GB18848@packtop>
From: Satish Yaduvanshi <satishroyal4u@gmail.com>
Date: Wed, 29 Mar 2023 17:15:16 +0530
Message-ID: <CAGugOWvofh+f15KuMCkC97V-9Hn4QxuVTgw5aXkTM3bVNaeEDg@mail.gmail.com>
Subject: Re: Containerization Enablement in OpenBMC firmware
To: Zev Weiss <zweiss@equinix.com>
Content-Type: multipart/alternative; boundary="0000000000001e50ba05f808836c"
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

--0000000000001e50ba05f808836c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Embedding a container in  OpenBMC may bring  many advantages such as
portability, modularity, security and considerably speed up the application
development time.

On Wed, Mar 29, 2023 at 4:14=E2=80=AFAM Zev Weiss <zweiss@equinix.com> wrot=
e:

> On Tue, Mar 28, 2023 at 09:43:20AM PDT, Satish Yaduvanshi wrote:
> >Hi,
> >
> >I would like to know is there any future plans to containerize the  apps
> >and services of OpenBMC firmware
> >
> >Thanks,
> >Satish Kumar
>
> I'm not aware of any efforts in that direction, no.  Is there a
> particular benefit that would be achieved by doing so?
>
>
> Zev
>


--=20

Satish  Kumar G

--0000000000001e50ba05f808836c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(44,45,49);font-family:Georgia,Tim=
es,&quot;Times New Roman&quot;,serif;font-size:17.6px">Embedding a containe=
r in=C2=A0 OpenBMC may bring=C2=A0 many advantages such as portability, mod=
ularity, security and considerably speed up the application development tim=
e.</span><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Wed, Mar 29, 2023 at 4:14=E2=80=AFAM Zev Weiss &lt;<a href=
=3D"mailto:zweiss@equinix.com">zweiss@equinix.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">On Tue, Mar 28, 2023 at 09=
:43:20AM PDT, Satish Yaduvanshi wrote:<br>
&gt;Hi,<br>
&gt;<br>
&gt;I would like to know is there any future plans to containerize the=C2=
=A0 apps<br>
&gt;and services of OpenBMC firmware<br>
&gt;<br>
&gt;Thanks,<br>
&gt;Satish Kumar<br>
<br>
I&#39;m not aware of any efforts in that direction, no.=C2=A0 Is there a<br=
>
particular benefit that would be achieved by doing so?<br>
<br>
<br>
Zev<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div><span style=3D"font-=
family:&quot;arial black&quot;,sans-serif;font-size:12.8px">Satish =C2=A0Ku=
mar G</span><br></div><div><font face=3D"arial black, sans-serif"><br></fon=
t></div><div><font face=3D"arial black, sans-serif"><br></font></div></div>=
</div></div></div></div></div></div></div></div>

--0000000000001e50ba05f808836c--
