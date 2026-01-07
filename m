Return-Path: <openbmc+bounces-1099-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFCCFBCD4
	for <lists+openbmc@lfdr.de>; Wed, 07 Jan 2026 04:07:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmCdb2tT8z2xrC;
	Wed, 07 Jan 2026 14:07:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767755267;
	cv=none; b=XaySLOrzcal0GjnOvBvpBOBaZjkJtGz49ErA/XtSskov/YIHcePPWAMTGPL0qcEIPm8uQKVu9vxRGt7mTm0qQfhJyifY5sJvWtFZtldczoE3jyzIc/wiaaa8pUDFpE1JkB651S5oX6eJjB/QAGTPsl/iCuNAhgFh3w4LB6uY7o0dcoJvIDVI0WAiLZofh/iEJrvskKowo+BkjiHHSml221jM0Xn4V/omj3FZGfL+GfXdY02VdcxAEzKBIMTRpecPnI1cBYjxLqhNMUJQF9+6irklevGW9YpbICtFOOSeNEXWTQ8y6ObnDEMZVVhIbWMfr4389m03DjRR6HWKfAAKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767755267; c=relaxed/relaxed;
	bh=S8g0zASzlZgrBh2Ae1vLpUVMLCcsau6OlNWPKheD44o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXf3cym55CUM/JC2t2DKE1GfBpiUljGce5hoYN988jvE8DFewn0Gzo9/QCbRbuJAKd7huQuG9b/f3wS+UQq7IGqSzlK8M+AVg8j+kXnjdKJUld0Vm+g1v8y055jFaKybkmOhBPKgaboV12nl0D/jlwTpsXUI97uX/mFS92ykE3zo0+kibH3PceTnshOw6+QKssqtfJ4CbBl6vRltb3DSY6eA0F/LzltUnrtdL7SVZ3SyuzzPompEH8zIXQscUOjbx4ICmuqMZADLOmHfxHTnmxTt0S1WHxSciONQCJUBuSnq72bLjpDqoVWRAN7GlGYKOYhcffaoPfBKATTkeP+Q9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SARrXB40; dkim-atps=neutral; spf=pass (client-ip=209.85.208.173; helo=mail-lj1-f173.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SARrXB40;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.173; helo=mail-lj1-f173.google.com; envelope-from=ksypassion@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmCdX6Rwyz2xHP
	for <openbmc@lists.ozlabs.org>; Wed, 07 Jan 2026 14:07:43 +1100 (AEDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37b99da107cso14186921fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 06 Jan 2026 19:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767755200; x=1768360000; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=S8g0zASzlZgrBh2Ae1vLpUVMLCcsau6OlNWPKheD44o=;
        b=SARrXB40eM6Ooc8Eck5H9mUB/H9DkNqSHD8T4y00ShhIlTAZxy4hnzfns32r9ZSEMh
         E88mMwjy2tnH7y3SpUXQfFXHHmv90nmVRU84VKmstG+aiz6kUFAwyaRCVaFYuiOvgh5h
         w9djnavjEu8wwQDB4swS3Jrd3Hk8Rw1PpuquflGaH/FIFM0GhXkNEzuSChYVnmgGzNFn
         Q7/7dOXrIux/uyVLY+E617lsEcmay3G7XQoHVdTaa5ZTmwopOHjpkujJT0eA2JIgGHUS
         9CsLXLh53W/sRNqKNyxC3XXpBQTQJpTmSFK7Uc7ec7hEkHsMx+EOa0RqIuXAEiHmTo5M
         Zg5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767755200; x=1768360000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8g0zASzlZgrBh2Ae1vLpUVMLCcsau6OlNWPKheD44o=;
        b=wLZc70UfyrTq0aXnchv4myxYVPqTMZA5g73REYO+06kCWCNBw/0S8uVH4Sf2ZW90Qo
         wm94OFageecmR5P3E8BjhteEKsTJuV58qpwTOHzuek2rhkRWSWWR/n0zrcDW5FjuEUEc
         jS+bW2OX48VGm7Q/0KTTnzYzgJO+8gs0eZLSrrfnDeOm+Vn2wrEFw15XaiS2wz2yEU33
         bT9kpJFdY2uTiJtnrKzmlYrfZ0iAZ/iZKc5y+lKjr3BjNOj9jVsz2k/0gvdSb0ji5ztO
         pLgC1KcZDTMdeJ2mr6CBMfUcLpssV5HRmkOkkXz1Lc620MowhRTDSEZxQhDgGRgTfGOC
         jNWw==
X-Gm-Message-State: AOJu0YzP81qTNzDZZa7yxdXpcEt5l5WCAQIPl1L2j0esTMMU8QKcpSJk
	/MSUBacFDbAh4rDZn2Q8xLge3rWue9UltOGN2uvFHevxuq/toKLjSrWafItbGXALT7yXhMydn/R
	xCK5VjC4KmpVzg8XjRXJ/fjkX6mvSaIs=
X-Gm-Gg: AY/fxX6VbhjjzIIDN5bNFeyEuqpyLdYeH1EPcSV5DMj4ZhI0wfLO21PWPhdeLkfkXzZ
	+Wk0SGW9z0tzSB6lFJ7wPoNd+pGA7CM8l5uGmA6BGTRIEeJy95bd7THaIfPrjqoOhIV+2DwyME4
	/0Uc6TWQNqRt1UfTWVvu00iWgzh1vteIRedCAuTrv/OZhUw2NF5Ap3srSFrY3dp1Edebjm0Oosg
	AXdAKaspB4tc9egRyIah1MMQNvc0kLdanGUI+0GDuZnzGRf2Sk3P3Fh+5DwisPn+0iUQwY=
X-Google-Smtp-Source: AGHT+IFGu/PF+t+u+xBzVwgGDttmT1q0T+TdlFBgL/chrLWGWzy3D4Cp/wCu7skx3smaTLF3508hXEFvwFgmph8ybC0=
X-Received: by 2002:a05:6512:a90:b0:598:ee60:8af0 with SMTP id
 2adb3069b0e04-59b6ef179demr278280e87.19.1767755199966; Tue, 06 Jan 2026
 19:06:39 -0800 (PST)
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
In-Reply-To: <CALVHhed3eE1XjcF21rnKEChoxpAkHoepi5hU3jYj-eSuB+1hiA@mail.gmail.com>
From: Soo-yeon Kang <ksypassion@gmail.com>
Date: Wed, 7 Jan 2026 12:06:28 +0900
X-Gm-Features: AQt7F2qzoHMmD00p1Nxgv3pg0l-iHdrJmMviYaEtXk1a-jt79W8LFimsHmW7xa4
Message-ID: <CAKmsAdmfX6jZAVBd5XeDqUk-Mq3bFpOM5+WukRfMgNE29SMB0w@mail.gmail.com>
Subject: Re: OpenBMC Individual CLA Resubmission - ksypassion
To: Mike Dolan <manager@lfprojects.org>
Cc: openbmc@lists.ozlabs.org, Andrew Geissler <andrewg@us.ibm.com>
Content-Type: multipart/alternative; boundary="000000000000be71fd0647c394e2"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--000000000000be71fd0647c394e2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am currently contributing as an individual to get started with OpenBMC
development. However, I work at XSLab (https://xslab.co.kr) as an embedded
software developer, and we are planning to have our company sign a
Corporate CLA in the future.

For now, could you please process my Individual CLA so I can begin
contributing immediately? We will follow up with a Corporate CLA later
once the company completes the necessary approvals.

Is this approach acceptable?

Thank you.
Best Regards

2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) AM 4:39, Mike Dolan <manage=
r@lfprojects.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:

> Hi Soo-yeon, which company are you contributing on behalf of?
>
> Mike
>
> On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang <ksypassion@gmail.co=
m> wrote:
>
>> Hello,
>>
>> I am resubmitting my Individual Contributor License Agreement for OpenBM=
C.
>>
>> I originally submitted my CLA on December 7, 2022, but it appears it was
>> not processed in the system.
>> I am currently unable to contribute to OpenBMC repositories due to "User
>> not approved" status.
>>
>> I am attaching a newly signed CLA document with this email.
>> (Attached file: OpenBMC_ICLA_ksypassion.pdf)
>> Please process this resubmission and confirm once it has been registered=
.
>>
>> Details:
>>
>> - Full Name: Soo-yeon Kang
>> - Email: ksypassion@gmail.com
>> - GitHub Username: ksypassion
>> - Gerrit Username: ksypassion
>>
>>
>> Please let me know once my CLA has been processed.
>>
>> Thank you.
>>
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

--=20


Soo-yeon  Kang

Mobile: +82 10 - 4067 - 8539
E-mail: ksypassion@gmail.co <ksypassion@gmail.com>m

--000000000000be71fd0647c394e2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am currently contributing as an individual=
 to get started with OpenBMC <br>development. However, I work at XSLab (<a =
href=3D"https://xslab.co.kr">https://xslab.co.kr</a>) as an embedded <br>so=
ftware developer, and we are planning to have our company sign a <br>Corpor=
ate CLA in the future.<br><br>For now, could you please process my Individu=
al CLA so I can begin <br>contributing immediately? We will follow up with =
a Corporate CLA later <br>once the company completes the necessary approval=
s.<br><br>Is this approach acceptable?<br><br>Thank you.<div>Best Regards</=
div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"=
ltr" class=3D"gmail_attr">2026=EB=85=84 1=EC=9B=94 7=EC=9D=BC (=EC=88=98) A=
M 4:39, Mike Dolan &lt;<a href=3D"mailto:manager@lfprojects.org">manager@lf=
projects.org</a>&gt;=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi=C2=A0Soo-yeo=
n, which company are you contributing on behalf of?<div><br></div><div>Mike=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Tue, Jan 6, 2026 at 4:29=E2=80=AFAM Soo-yeon Kang &lt;<a href=3D"m=
ailto:ksypassion@gmail.com" target=3D"_blank">ksypassion@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div>Hello,</div><div><br>I am resubmitting my Individual Contribu=
tor License Agreement for OpenBMC.<br><br>I originally submitted my CLA on =
December 7, 2022, but it appears it was not processed in the system.</div><=
div>I am currently unable to contribute to OpenBMC repositories due to &quo=
t;User not approved&quot; status.<br><br>I am attaching a newly signed CLA =
document with this email.</div><div>(Attached file:=C2=A0OpenBMC_ICLA_ksypa=
ssion.pdf)<br>Please process this resubmission and confirm once it has been=
 registered.</div><div><br>Details:<br></div><blockquote style=3D"margin:0p=
x 0px 0px 40px;border:none;padding:0px"><div>- Full Name: Soo-yeon Kang</di=
v><div>- Email: <a href=3D"mailto:ksypassion@gmail.com" target=3D"_blank">k=
sypassion@gmail.com</a></div><div>- GitHub Username: ksypassion</div><div>-=
 Gerrit Username: ksypassion</div></blockquote><div><br>Please let me know =
once my CLA has been processed.</div><div><br>Thank you.<br><br></div><div>=
<br></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"=
ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>=
<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"lt=
r"><br style=3D"color:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><b=
r style=3D"color:rgb(51,51,51);font-family:Roboto"><table style=3D"border-c=
ollapse:collapse;border-spacing:0px;color:rgb(51,51,51);font-family:Roboto"=
><tbody><tr><td colspan=3D"2" style=3D"padding:0px 0px 2px;border-width:0px=
 0px 1px;border-bottom-style:solid;border-bottom-color:rgb(0,182,217);outli=
ne:none"><span style=3D"border-bottom:3px solid rgb(0,182,217);padding:0px =
0px 2px"><span style=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0=
Kang</span>=C2=A0=C2=A0</span></td></tr><tr><td valign=3D"top" style=3D"pad=
ding:7px 16px 0px 0px;border:0px;outline:none"></td><td valign=3D"top" styl=
e=3D"padding:7px 0px 0px;border:0px;outline:none"><div style=3D"margin:0px;=
padding:2px 0px 0px;border:0px;outline:none"><div style=3D"margin:0px;paddi=
ng:0px;border:0px;outline:none"><span style=3D"color:rgb(0,182,217);font-fa=
mily:arial">Mobile:</span>=C2=A0<span style=3D"font-family:arial">+82 10 - =
4067 - 8539</span></div><div style=3D"margin:0px;padding:0px;border:0px;out=
line:none"><span style=3D"color:rgb(0,182,217);font-family:arial">E-mail:</=
span>=C2=A0<a href=3D"mailto:ksypassion@gmail.com" style=3D"outline:none;co=
lor:rgb(0,0,0);text-decoration:none;border:none;font-family:arial" target=
=3D"_blank">ksypassion@gmail.co</a>m</div></div></td></tr></tbody></table><=
div style=3D"margin:0px;padding:0px;border-width:1px 0px 0px;border-top-sty=
le:solid;border-top-color:rgb(208,208,208);outline:none;color:rgb(51,51,51)=
;font-family:arial;font-size:small"><br></div></div></div></div></div></div=
></div></div></div></div></div></div></div></div></div></div>
</blockquote></div>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br style=3D"color=
:rgb(51,51,51);font-family:Roboto;font-size:13.2px"><br style=3D"color:rgb(=
51,51,51);font-family:Roboto"><table style=3D"border-collapse:collapse;bord=
er-spacing:0px;color:rgb(51,51,51);font-family:Roboto"><tbody><tr><td colsp=
an=3D"2" style=3D"padding:0px 0px 2px;border-width:0px 0px 1px;border-botto=
m-style:solid;border-bottom-color:rgb(0,182,217);outline:none"><span style=
=3D"border-bottom:3px solid rgb(0,182,217);padding:0px 0px 2px"><span style=
=3D"font-family:arial;font-weight:bold">Soo-yeon =C2=A0Kang</span>=C2=A0=C2=
=A0</span></td></tr><tr><td valign=3D"top" style=3D"padding:7px 16px 0px 0p=
x;border:0px;outline:none"></td><td valign=3D"top" style=3D"padding:7px 0px=
 0px;border:0px;outline:none"><div style=3D"margin:0px;padding:2px 0px 0px;=
border:0px;outline:none"><div style=3D"margin:0px;padding:0px;border:0px;ou=
tline:none"><span style=3D"color:rgb(0,182,217);font-family:arial">Mobile:<=
/span>=C2=A0<span style=3D"font-family:arial">+82 10 - 4067 - 8539</span></=
div><div style=3D"margin:0px;padding:0px;border:0px;outline:none"><span sty=
le=3D"color:rgb(0,182,217);font-family:arial">E-mail:</span>=C2=A0<a href=
=3D"mailto:ksypassion@gmail.com" style=3D"outline:none;color:rgb(0,0,0);tex=
t-decoration:none;border:none;font-family:arial" target=3D"_blank">ksypassi=
on@gmail.co</a>m</div></div></td></tr></tbody></table><div style=3D"margin:=
0px;padding:0px;border-width:1px 0px 0px;border-top-style:solid;border-top-=
color:rgb(208,208,208);outline:none;color:rgb(51,51,51);font-family:arial;f=
ont-size:small"><br></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>

--000000000000be71fd0647c394e2--

