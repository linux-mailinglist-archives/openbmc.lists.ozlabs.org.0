Return-Path: <openbmc+bounces-1100-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59325D0048A
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 23:11:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmj0j2t0Zz2y8c;
	Thu, 08 Jan 2026 09:11:01 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767823861;
	cv=none; b=EUrvDSosZ2ZgXityDGitFQExpQjTAf/u+g15mVC5Tp0JxdJfuwdvKVqRXddbIyErns0Nqe5x2dycrVmpcK7T0gT8l6BD0cGLQEgGKY5pdISr9F1BESMS3v15r4kJb0AaTI4cWII3HMyOMGniUhTtgW5hCZDftlqLk4c9V1nad7WvmRva5CYpUCWH/5+9HJmrHGM+LeTwlsdl9I0y2Y4H07bQqlxQ7kzeB2OtzPoYbTrhjp+0NQ6gDS3FT0vUS+8PoNbTcSb+d0q0jX/VTaqm6TdS1Gik6CBCtuWmM3j+m5584mCnoki0gyhqYT+Y+1dh7W82UxmBgeqNr4pd27yEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767823861; c=relaxed/relaxed;
	bh=YR86MQi5sGmckMRzH6MZw9q5qcKfzwTUGBAjbotVnGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HhORBIWK/LUa/6r0pvIBqgTddDgL0hGbHyilET+2070Vuss0uzJQXP7BfT+OWyC8qAoOpoFvRT957eJt11vx0C4/Qx1pVCcaBwk44l19mOtzQPfJ/rD+jygH7cI719OD0S8443rt/bXwCZBptlizl65hq+g/P0EgMO3kgaq3N/MW95utRiPS5DwsdbAxZ2MprU8mf0+4nW9JqAjas8nr9PUcr/9uujJCOtNpQeUvPzOUZ/EWe5JLz7Q576N9TR/xmtOKBE3GfMjzeawRBlAHG4zqlcvzT78/w6RJjRbbFPFYOS+dmuqSVqr/eQgjcJYf0n+ZdCPuY2fd0LgX8c3IEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CeHBYDeu; dkim-atps=neutral; spf=pass (client-ip=209.85.167.49; helo=mail-lf1-f49.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CeHBYDeu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.49; helo=mail-lf1-f49.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmj0d6gQXz2y7c
	for <openbmc@lists.ozlabs.org>; Thu, 08 Jan 2026 09:10:56 +1100 (AEDT)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59431f57bf6so2706331e87.3
        for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 14:10:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767823793; x=1768428593; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YR86MQi5sGmckMRzH6MZw9q5qcKfzwTUGBAjbotVnGY=;
        b=CeHBYDeu3jxuDljY6OLRzy9PwXgnQ5ssEZBvpFfr/qmMNgZb9OGNyaxnJC1g7+qGFf
         CjcqA70P6mQdwFqQaaMrSh9RzXC2nTateIESwagFL95xhxwYtNbxPifPNv8g/NXGyXsH
         J7BEo68knctvTeGxj19y79lOLyYMLL6RfT5icsmkaZg3L4HTdqZ1oImxmL/3CKZQcQLZ
         4xF4IdZH34DyB6CyoIxvktMRY+wqD7WwBvn+YekNbWiCIaphH/ZzBNjIUMN3CtYNSAU/
         UxPKdQ5kpUFiItCg4Gy3lGd7XqyT7xPcqJeap5rnl2kQ8tG5knPIdkuOW4xJF1/JNQYi
         Fz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767823793; x=1768428593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR86MQi5sGmckMRzH6MZw9q5qcKfzwTUGBAjbotVnGY=;
        b=b4uOdALPkSJY/lPt42CveoqTv1zS2c0fQFImunkhwYvC7VLFyz3ovxIB+nL0vkDf1M
         u9PkK8kJC108uzr5bHaoBoOPeTBNnAqcKq05l2QPHvZLtpVMiEuAPB6RpMb2O7E9UDNV
         J/9dUw4frfyXWzvF1nWZrf3Jl0q/OlplfZ417A+EJSRnLuprnvjtrH2yfVZ8SaFcyR4Q
         1O5e0c9C5kLP/1SPqK7aykn7Gdlob9GHoTflwqt7fidbprqZlg9MOT/c63/8wQQPvHJq
         NWPnShRL/ViJwAkMU0/QZvX8KGOkQAiBbUrJgEc4GhqIcBlDP2iR0oRnWEZl/TZuImR5
         +E6w==
X-Gm-Message-State: AOJu0YwhNTfhVx9lTORnFjJyelqs8xbMAG41Z3XyMyEtB8UvTQ6lceTG
	YP1AdyeX/3ZpZHm5R2FOzIgT9ilMaOxFaGzgIuEKectzDnFP4wtlWXsqRWU9CMO1D+QTq7cqJBm
	gqGpnCCVv+1xHSDv6sECK55eQglwJNY8=
X-Gm-Gg: AY/fxX4F+F+HNIrQnOvgYyXfFThL5nmMs+jGTcdtNFh2g3A9eXDymmDrnUPb7da7qA/
	fJTVrKMsPgbd9mJUDQQS0Gs/XIXhmqmvaJi4btlfu4poBNPSfI2irFTsrJsFy4e337fYY4gZQW5
	VOkG5ynvyZgbDgknFg19DezYR3cV9PHPQHX8TY8pwYnnBw5neil78te5FryV1V4z91lI3p54aGK
	HsPtL3YCzRj+pg+tdP5Cc5vU61vLbXCkVqPdJqZ4Ywhs69ZNInydSk6XidoccnS7fj84/Nt
X-Google-Smtp-Source: AGHT+IGmqoXg0AbVntrl2tvE/89CKlAkONwiUhM/1cbjDD4iQG2P/YtUSJG/NjfIkgKh9aZZJ1Qfi75FP/zgvlBAbHc=
X-Received: by 2002:ac2:4201:0:b0:59b:730d:4a56 with SMTP id
 2adb3069b0e04-59b730d4b07mr654007e87.49.1767823792557; Wed, 07 Jan 2026
 14:09:52 -0800 (PST)
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <CAKmsAdnDfkOQqaL_KJ5y4QDBYoDifSSdOGZdFdwSzNxScC5zxg@mail.gmail.com>
 <CALVHhed3eE1XjcF21rnKEChoxpAkHoepi5hU3jYj-eSuB+1hiA@mail.gmail.com>
 <CAKmsAdmfX6jZAVBd5XeDqUk-Mq3bFpOM5+WukRfMgNE29SMB0w@mail.gmail.com> <CALVHhecuwENv9w4QEmjLShLiq9=PMv6HyiWwAxOS-85MfrBftg@mail.gmail.com>
In-Reply-To: <CALVHhecuwENv9w4QEmjLShLiq9=PMv6HyiWwAxOS-85MfrBftg@mail.gmail.com>
From: Soo-yeon Kang <ksypassion@gmail.com>
Date: Thu, 8 Jan 2026 07:09:41 +0900
X-Gm-Features: AQt7F2oxr6gbDUnGZ7dalsD7uFRBLY6jKkRrZ8R2lOu06m_5LQln2fddq3hRUOc
Message-ID: <CAKmsAd=NX+3iKQn9dJ-BW5qDFx-MWnNPFkx3ZqsnSD+Cwh_uGQ@mail.gmail.com>
Subject: Re: OpenBMC Individual CLA Resubmission - ksypassion
To: Mike Dolan <manager@lfprojects.org>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Content-Type: multipart/alternative; boundary="0000000000002e53790647d38da8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000002e53790647d38da8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for the guidance. I have discussed this with my company
(AccessLab),
and they have approved the following approach:

1. Start with an Individual CLA to begin contributing immediately
2. Transition to a Corporate CLA once the company completes their
internal approval process for the CCLA

My company is supportive of contributing to OpenBMC, but the Corporate CLA
requires legal review and executive approval, which will take several weeks=
.

Would it be acceptable to proceed with an Individual CLA in the interim,
with the understanding that we will submit a Corporate CLA shortly?
This would allow me to start contributing while the company processes
the CCLA paperwork.

If the OpenBMC policy strictly requires CCLA first, I understand and
will wait for the company CCLA to be processed before contributing.

Please let me know which approach is acceptable.

Thank you.

Best regards,
Soo-yeon



2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=EC=A0=84 3:38, Mi=
ke Dolan <manager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Hi Soo-yeon, the OpenBMC community requires contributors employed at a
> company to have the company CCLA on file. I would recommend you get the
> company CCLA approval first.
>
> Mike
>
> On Tue, Jan 6, 2026 at 10:06=E2=80=AFPM Soo-yeon Kang <ksypassion@gmail.c=
om>
> wrote:
>
>> Hello,
>>
>> I am currently contributing as an individual to get started with OpenBMC
>> development. However, I work at XSLab (https://xslab.co.kr) as an
>> embedded
>> software developer, and we are planning to have our company sign a
>> Corporate CLA in the future.
>>
>> For now, could you please process my Individual CLA so I can begin
>> contributing immediately? We will follow up with a Corporate CLA later
>> once the company completes the necessary approvals.
>>
>> Is this approach acceptable?
>>
>> Thank you.
>> Best Regards
>>
>> 2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan <man=
ager@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>>
>>> Hi Soo-yeon, which company are you contributing on behalf of?
>>>
>>> Mike
>>>
>>> On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang <ksypassion@gmail.=
com>
>>> wrote:
>>>
>>>> Hello,
>>>>
>>>> I am resubmitting my Individual Contributor License Agreement for
>>>> OpenBMC.
>>>>
>>>> I originally submitted my CLA on December 7, 2022, but it appears it
>>>> was not processed in the system.
>>>> I am currently unable to contribute to OpenBMC repositories due to
>>>> "User not approved" status.
>>>>
>>>> I am attaching a newly signed CLA document with this email.
>>>> (Attached file: OpenBMC_ICLA_ksypassion.pdf)
>>>> Please process this resubmission and confirm once it has been
>>>> registered.
>>>>
>>>> Details:
>>>>
>>>> - Full Name: Soo-yeon Kang
>>>> - Email: ksypassion@gmail.com
>>>> - GitHub Username: ksypassion
>>>> - Gerrit Username: ksypassion
>>>>
>>>>
>>>> Please let me know once my CLA has been processed.
>>>>
>>>> Thank you.
>>>>
>>>>
>>>> --
>>>>
>>>>
>>>> Soo-yeon  Kang
>>>>
>>>> Mobile: +82 10 - 4067 - 8539
>>>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>>>
>>>>
>>
>> --
>>
>>
>> Soo-yeon  Kang
>>
>> Mobile: +82 10 - 4067 - 8539
>> E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m
>>
>>

--0000000000002e53790647d38da8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit">Hi,<br style=3D"font-size:inherit"><b=
r style=3D"font-size:inherit">Thank you for the guidance. I have discussed =
this with my company (AccessLab), <br style=3D"font-size:inherit">and they =
have approved the following approach:<br style=3D"font-size:inherit"><br st=
yle=3D"font-size:inherit">1. Start with an Individual CLA to begin contribu=
ting immediately<br style=3D"font-size:inherit">2. Transition to a Corporat=
e CLA once the company completes their <br style=3D"font-size:inherit">   i=
nternal approval process for the CCLA<br style=3D"font-size:inherit"><br st=
yle=3D"font-size:inherit">My company is supportive of contributing to OpenB=
MC, but the Corporate CLA <br style=3D"font-size:inherit">requires legal re=
view and executive approval, which will take several weeks.<br style=3D"fon=
t-size:inherit"><br style=3D"font-size:inherit">Would it be acceptable to p=
roceed with an Individual CLA in the interim, <br style=3D"font-size:inheri=
t">with the understanding that we will submit a Corporate CLA shortly? <br =
style=3D"font-size:inherit">This would allow me to start contributing while=
 the company processes <br style=3D"font-size:inherit">the CCLA paperwork.<=
br style=3D"font-size:inherit"><br style=3D"font-size:inherit">If the OpenB=
MC policy strictly requires CCLA first, I understand and <br style=3D"font-=
size:inherit">will wait for the company CCLA to be processed before contrib=
uting.<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Pleas=
e let me know which approach is acceptable.<br style=3D"font-size:inherit">=
<br style=3D"font-size:inherit">Thank you.<br style=3D"font-size:inherit"><=
br style=3D"font-size:inherit">Best regards,<br style=3D"font-size:inherit"=
>Soo-yeon<br style=3D"font-size:inherit"></div><br></div><div><br></div><di=
v><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">2026=EB=85=84 1=EC=9B=94 8=EC=9D=BC (=EB=AA=A9) =EC=98=A4=
=EC=A0=84 3:38, Mike Dolan &lt;<a href=3D"mailto:manager@lfprojects.org">ma=
nager@lfprojects.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:=
rgb(204,204,204)"><div dir=3D"ltr">Hi Soo-yeon, the OpenBMC community requi=
res contributors employed at a company to have the company CCLA on file. I =
would recommend you get the company CCLA approval first.=C2=A0</div><div di=
r=3D"ltr"><div><br></div><div>Mike</div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 10:06=E2=80=
=AFPM Soo-yeon Kang &lt;<a href=3D"mailto:ksypassion@gmail.com" target=3D"_=
blank">ksypassion@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-l=
eft-style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><div d=
ir=3D"ltr">Hello,<br><br>I am currently contributing as an individual to ge=
t started with OpenBMC <br>development. However, I work at XSLab (<a href=
=3D"https://xslab.co.kr" target=3D"_blank">https://xslab.co.kr</a>) as an e=
mbedded <br>software developer, and we are planning to have our company sig=
n a <br>Corporate CLA in the future.<br><br>For now, could you please proce=
ss my Individual CLA so I can begin <br>contributing immediately? We will f=
ollow up with a Corporate CLA later <br>once the company completes the nece=
ssary approvals.<br><br>Is this approach acceptable?<br><br>Thank you.<div>=
Best Regards</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, =
Mike Dolan &lt;<a href=3D"mailto:manager@lfprojects.org" target=3D"_blank">=
manager@lfprojects.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-colo=
r:rgb(204,204,204)"><div dir=3D"ltr">Hi=C2=A0Soo-yeon, which company are yo=
u contributing on behalf of?<div><br></div><div>Mike</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 20=
26 at 4:29=E2=80=AFAM Soo-yeon Kang &lt;<a href=3D"mailto:ksypassion@gmail.=
com" target=3D"_blank">ksypassion@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-wi=
dth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,=
204,204)"><div dir=3D"ltr"><div>Hello,</div><div><br>I am resubmitting my I=
ndividual Contributor License Agreement for OpenBMC.<br><br>I originally su=
bmitted my CLA on December 7, 2022, but it appears it was not processed in =
the system.</div><div>I am currently unable to contribute to OpenBMC reposi=
tories due to &quot;User not approved&quot; status.<br><br>I am attaching a=
 newly signed CLA document with this email.</div><div>(Attached file:=C2=A0=
OpenBMC_ICLA_ksypassion.pdf)<br>Please process this resubmission and confir=
m once it has been registered.</div><div><br>Details:<br></div><blockquote =
style=3D"margin:0px 0px 0px 40px;border:medium;padding:0px"><div>- Full Nam=
e: Soo-yeon Kang</div><div>- Email: <a href=3D"mailto:ksypassion@gmail.com"=
 target=3D"_blank">ksypassion@gmail.com</a></div><div>- GitHub Username: ks=
ypassion</div><div>- Gerrit Username: ksypassion</div></blockquote><div><br=
>Please let me know once my CLA has been processed.</div><div><br>Thank you=
.<br><br></div><div><br></div><span class=3D"gmail_signature_prefix">-- </s=
pan><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><d=
iv dir=3D"ltr"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><br style=3D"color:rgb(51,51,51);font-family:Roboto;=
font-size:13.2px"><br style=3D"color:rgb(51,51,51);font-family:Roboto"><tab=
le style=3D"border-collapse:collapse;border-spacing:0px;font-family:Roboto;=
color:rgb(51,51,51)"><tbody style=3D"font-family:Roboto"><tr style=3D"font-=
family:Roboto"><td colspan=3D"2" style=3D"padding:0px 0px 2px;border-width:=
0px 0px 1px;border-bottom-style:solid;outline:currentcolor;font-family:Robo=
to;border-bottom-color:rgb(0,182,217)"><span style=3D"border-bottom-width:3=
px;border-bottom-style:solid;padding:0px 0px 2px;font-family:Roboto;border-=
bottom-color:rgb(0,182,217)"><span style=3D"font-family:arial;font-weight:b=
old">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=A0</span></td></tr><tr style=3D"fo=
nt-family:Roboto"><td valign=3D"top" style=3D"padding:7px 16px 0px 0px;bord=
er:0px;outline:currentcolor;font-family:Roboto"></td><td valign=3D"top" sty=
le=3D"padding:7px 0px 0px;border:0px;outline:currentcolor;font-family:Robot=
o"><div style=3D"margin:0px;padding:2px 0px 0px;border:0px;outline:currentc=
olor;font-family:Roboto"><div style=3D"margin:0px;padding:0px;border:0px;ou=
tline:currentcolor;font-family:Roboto"><span style=3D"font-family:arial;col=
or:rgb(0,182,217)">Mobile:</span>=C2=A0<span style=3D"font-family:arial">+8=
2 10 - 4067 - 8539</span></div><div style=3D"margin:0px;padding:0px;border:=
0px;outline:currentcolor;font-family:Roboto"><span style=3D"font-family:ari=
al;color:rgb(0,182,217)">E-mail:</span>=C2=A0<a href=3D"mailto:ksypassion@g=
mail.com" style=3D"outline:currentcolor;text-decoration:none;border:medium;=
font-family:arial;color:rgb(0,0,0)" target=3D"_blank">ksypassion@gmail.co</=
a>m</div></div></td></tr></tbody></table><div style=3D"margin:0px;padding:0=
px;border-width:1px 0px 0px;border-top-style:solid;outline:currentcolor;fon=
t-family:arial;font-size:small;border-top-color:rgb(208,208,208);color:rgb(=
51,51,51)"><br></div></div></div></div></div></div></div></div></div></div>=
</div></div></div></div></div></div>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"color=
:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br style=3D"color:rgb(=
51,51,51);font-family:Roboto"><table style=3D"border-collapse:collapse;bord=
er-spacing:0px;font-family:Roboto;color:rgb(51,51,51)"><tbody style=3D"font=
-family:Roboto"><tr style=3D"font-family:Roboto"><td colspan=3D"2" style=3D=
"padding:0px 0px 2px;border-width:0px 0px 1px;border-bottom-style:solid;out=
line:currentcolor;font-family:Roboto;border-bottom-color:rgb(0,182,217)"><s=
pan style=3D"border-bottom-width:3px;border-bottom-style:solid;padding:0px =
0px 2px;font-family:Roboto;border-bottom-color:rgb(0,182,217)"><span style=
=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=
=A0</span></td></tr><tr style=3D"font-family:Roboto"><td valign=3D"top" sty=
le=3D"padding:7px 16px 0px 0px;border:0px;outline:currentcolor;font-family:=
Roboto"></td><td valign=3D"top" style=3D"padding:7px 0px 0px;border:0px;out=
line:currentcolor;font-family:Roboto"><div style=3D"margin:0px;padding:2px =
0px 0px;border:0px;outline:currentcolor;font-family:Roboto"><div style=3D"m=
argin:0px;padding:0px;border:0px;outline:currentcolor;font-family:Roboto"><=
span style=3D"font-family:arial;color:rgb(0,182,217)">Mobile:</span>=C2=A0<=
span style=3D"font-family:arial">+82 10 - 4067 - 8539</span></div><div styl=
e=3D"margin:0px;padding:0px;border:0px;outline:currentcolor;font-family:Rob=
oto"><span style=3D"font-family:arial;color:rgb(0,182,217)">E-mail:</span>=
=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D"outline:currentcolor=
;text-decoration:none;border:medium;font-family:arial;color:rgb(0,0,0)" tar=
get=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr></tbody></tabl=
e><div style=3D"margin:0px;padding:0px;border-width:1px 0px 0px;border-top-=
style:solid;outline:currentcolor;font-family:arial;font-size:small;border-t=
op-color:rgb(208,208,208);color:rgb(51,51,51)"><br></div></div></div></div>=
</div></div></div></div></div></div></div></div></div></div></div>
</blockquote></div>
</blockquote></div></div>

--0000000000002e53790647d38da8--

