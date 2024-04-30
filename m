Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F768B6F0A
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 12:04:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEq6SowC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTG5j1hKqz3cR3
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2024 20:04:57 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mEq6SowC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTG541CH3z2xmC;
	Tue, 30 Apr 2024 20:04:22 +1000 (AEST)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-51abd9fcbf6so9127263e87.1;
        Tue, 30 Apr 2024 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714471455; x=1715076255; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Jrz1JfpBFdZBx0eTSiA8xHHDpSAtTnJWWqjU+JHcZo=;
        b=mEq6SowCiNVe0CHfVtkDuQu8TXPa4o8srz4rgoRYMEHTln/I2f74b+TkF+0lo5Mjvp
         yNDzrBV+KOeEWCpQHm9n1cDBKAQQrndrc1ZJ0S0slR5z9m1wwevtMdju9VmgVFeqvoSg
         cNk5F/0pwtq3lHiEMyobfjyK3wACkM2qDguFXQgpbDQoJ499gMF3ND01Ra7L3XrjYohc
         zX7mY+BBgTv04Q7vCZ0idetbb6II8pkjegwVkquDnbkxsr1vUOOnBJZ2AN7XYWW5yB0z
         HbIy91gfwlVPsRsw3LMa2dauK3thZ7ZMj1pXcqKTR+6RKcOY2g7L9UllNozfc/HM0IV7
         Hqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714471455; x=1715076255;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Jrz1JfpBFdZBx0eTSiA8xHHDpSAtTnJWWqjU+JHcZo=;
        b=Ts08I/dB/8bvuUVKPygIj71AzGChllCOMZJsM4Hxwm0edntjcGsuxER5mkR9YvaceD
         OMiYGIunL/IaerjeCLmvNSIkE3Sj/ibDLaE1kRwQTRWfmvNCogJlBTUuFZ+PpveMt/HV
         CTywL/pldw5voF9khra9AQXel5QlJ4yU/L/Plpa/yhn+etlh214jJ+Vztn+pbuW1XgFL
         LDPjMoUFHUo8C3miGm/+2rmhu5ERsx17ouWOlVSJI3xVqaJt3cMLZIMs5FEAXMVlaFHU
         vZRW/KQjhImDGQZN3S/0idAaKoAmf/Q6lu6LFAHy7zrOvKlEhDmeJh0it7n2kYM4iFL0
         h5IA==
X-Forwarded-Encrypted: i=1; AJvYcCV4PyIXFlIj97SBzPCQpPq0M1TWds/3Kj307BDsdwoRONqxsqoB46HfhyNl9O7GPsXTBPI/kLMiaBDux9Z7OFRBBkkz1eUVri6w1ZFsvL4eoORfOPgVZ99B7E7b/18JM8uC1HgPEYWd
X-Gm-Message-State: AOJu0Yzl/NO9sd8bPRNtE6ykYwGCObdFONEhIDNyE4YiVi/64QrNb8UW
	IKy4OM100X0U1PaEPJLeIZ7ryc+9qDiWkBZC0aP8UNa2Hw9rskWmZmchX4AA8MuRaNu3O0oEdoD
	mCBkPj0d2N+lCKCfe+I7IvZ18IOs=
X-Google-Smtp-Source: AGHT+IETBwlr75OAt23unORtc3SLP17YiCxLDo0hvGcxOMGKyFESSJvU+kRAPGgkEmhgJcjJ4vzMVMCyQycomnJyF0E=
X-Received: by 2002:a05:6512:2509:b0:51c:eeee:8679 with SMTP id
 be9-20020a056512250900b0051ceeee8679mr10455888lfb.56.1714471454629; Tue, 30
 Apr 2024 03:04:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240430045853.3894633-1-Kelly_Hung@asus.com> <a21672d7-82dd-44a9-b301-94aa1537b75c@molgen.mpg.de>
In-Reply-To: <a21672d7-82dd-44a9-b301-94aa1537b75c@molgen.mpg.de>
From: Chia Li Hung <ppighouse@gmail.com>
Date: Tue, 30 Apr 2024 18:04:03 +0800
Message-ID: <CAK=2Bxt=WK4AdktNZDN2iXjk3ga9WRqUm9JQHoNjRnrW8hVt0Q@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] modify Signed-off-by field
To: Paul Menzel <pmenzel@molgen.mpg.de>
Content-Type: multipart/alternative; boundary="00000000000007f01306174d7e84"
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, Allenyy_Hsu@asus.com, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000007f01306174d7e84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2024=E5=B9=B44=E6=9C=8830=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:48=E5=AF=AB=E9=81=93=EF=BC=9A

> Dear Kelly,
>
>
> Am 30.04.24 um 06:58 schrieb Kelly Hung:
> > For the warning message:
> > From: Kelly Hung '<ppighouse@gmail.com>' !=3D 'Signed-off-by: Kelly Hun=
g <
> Kelly_Hung@asus.com>'
> >
> > I replaced Kelly_Hung@asus.com with my private Gmail account.
> >
> > Due to a security issue with ASUS's mail server, I am unable to use
> > ASUS's mail system to send patches out from my build server.
> > So I executed git send-email using my private gmail account.
>
> To put light on ASUS=E2=80=99 upstream work, using your company address w=
ould be
> nice in my opinion. Do you have it configured everything in git
> (`~/.gitconfig`)?
>
>      git config --global user.name "Kelly Hung"
>      git config --global user.email Kelly_Hung@asus.com
>
>
Hi, Paul,
Below is my git configuration.
[user]
        name =3D Kelly Hung
        email =3D Kelly_Hung@asus.com
[sendemail]
        smtpserver =3D smtp.gmail.com
        smtpEncryption =3D tls
        smtpUser =3D ppighouse@gmail.com
        smtpServerPort =3D 587

I made sure the "From" value after executing git format-patch was my ASUS
email address.

From: Kelly Hung <Kelly_Hung@asus.com>
Date: Thu, 29 Feb 2024 16:45:02 +0800
Subject: [PATCH v7 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board

Since my smtp server is Gmail, when I run send-gmail it replaces my "From"
value with the Gmail account. I asked ASUS IT for assistance today and
tried to get an SMTP acount.

Thanks for help.

Best Regards
Kelly

Then `git format-patch` and `git send-email` should put
>
> From: Kelly Hung <Kelly_Hung@asus.com>
>
> at the top of the message.
>
>
> Kind regards,
>
> Paul
>

--00000000000007f01306174d7e84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">Paul Menzel &lt;<a href=3D"mailto:pmenzel@mo=
lgen.mpg.de">pmenzel@molgen.mpg.de</a>&gt; =E6=96=BC 2024=E5=B9=B44=E6=9C=
=8830=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:48=E5=AF=AB=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dear K=
elly,<br>
<br>
<br>
Am 30.04.24 um 06:58 schrieb Kelly Hung:<br>
&gt; For the warning message:<br>
&gt; From: Kelly Hung &#39;&lt;<a href=3D"mailto:ppighouse@gmail.com" targe=
t=3D"_blank">ppighouse@gmail.com</a>&gt;&#39; !=3D &#39;Signed-off-by: Kell=
y Hung &lt;<a href=3D"mailto:Kelly_Hung@asus.com" target=3D"_blank">Kelly_H=
ung@asus.com</a>&gt;&#39;<br>
&gt; <br>
&gt; I replaced <a href=3D"mailto:Kelly_Hung@asus.com" target=3D"_blank">Ke=
lly_Hung@asus.com</a> with my private Gmail account.<br>
&gt; <br>
&gt; Due to a security issue with ASUS&#39;s mail server, I am unable to us=
e<br>
&gt; ASUS&#39;s mail system to send patches out from my build server.<br>
&gt; So I executed git send-email using my private gmail account.<br>
<br>
To put light on ASUS=E2=80=99 upstream work, using your company address wou=
ld be <br>
nice in my opinion. Do you have it configured everything in git <br>
(`~/.gitconfig`)?<br>
<br>
=C2=A0 =C2=A0 =C2=A0git config --global <a href=3D"http://user.name" rel=3D=
"noreferrer" target=3D"_blank">user.name</a> &quot;Kelly Hung&quot;<br>
=C2=A0 =C2=A0 =C2=A0git config --global user.email <a href=3D"mailto:Kelly_=
Hung@asus.com" target=3D"_blank">Kelly_Hung@asus.com</a><br>
<br></blockquote><div><br></div><div>Hi, Paul,</div><div>Below is my git co=
nfiguration.=C2=A0</div><div>[user]</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 n=
ame =3D Kelly Hung</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 email =3D <a href=
=3D"mailto:Kelly_Hung@asus.com">Kelly_Hung@asus.com</a></div><div>[sendemai=
l]<br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpserver =3D <a href=3D"http=
://smtp.gmail.com">smtp.gmail.com</a></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 smtpEncryption =3D tls</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpUser =3D =
<a href=3D"mailto:ppighouse@gmail.com">ppighouse@gmail.com</a></div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 smtpServerPort =3D 587</div><div>=C2=A0</div><d=
iv>I made sure the &quot;From&quot; value after executing git format-patch =
was my ASUS email address.</div><div><div><br></div><div>From: Kelly Hung &=
lt;<a href=3D"mailto:Kelly_Hung@asus.com">Kelly_Hung@asus.com</a>&gt;<br></=
div><div>Date: Thu, 29 Feb 2024 16:45:02 +0800</div><div>Subject: [PATCH v7=
 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board</div></div><div><br></d=
iv><div>Since my smtp server is Gmail, when I run send-gmail it replaces my=
 &quot;From&quot; value with the Gmail account. I asked ASUS IT for assista=
nce today and tried to get an SMTP acount.=C2=A0=C2=A0</div><div><br></div>=
<div><div>Thanks for help.</div></div><div><br></div><div>Best Regards</div=
><div>Kelly</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
Then `git format-patch` and `git send-email` should put<br>
<br>
From: Kelly Hung &lt;<a href=3D"mailto:Kelly_Hung@asus.com" target=3D"_blan=
k">Kelly_Hung@asus.com</a>&gt;<br>
<br>
at the top of the message.<br>
<br>
<br>
Kind regards,<br>
<br>
Paul<br>
</blockquote></div></div></div></div></div></div>

--00000000000007f01306174d7e84--
