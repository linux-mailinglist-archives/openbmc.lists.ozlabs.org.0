Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C52A1302
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 09:53:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JvxC1df3zDr88
	for <lists+openbmc@lfdr.de>; Thu, 29 Aug 2019 17:53:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=liuxiwei1013@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="vWIASCgU"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JvwY0nHKzDr6Q
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 17:52:41 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id b11so2626080qtp.10
 for <openbmc@lists.ozlabs.org>; Thu, 29 Aug 2019 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FmOhfTPFenz+Y3OPjIcUJj+KoC2zFYbvhu4VIMiSvL4=;
 b=vWIASCgUwZ68ngE9u1Td161KMr7BTztYJtIroj+4wdH/PY3/S6dIEh2GzN7F0y9aD2
 12u6zj6LZkLs7ugdQTrER6kX9UIFzqWBkLwloT0SpPRJ6W0JhiqdP3OZ1h9nPKnF8kfT
 nA/Zt+XYVCxAeE0iHEjkP1w/zleXdonP2ZBXpPmLoBEPQ0BU5s0sfed4YBDBnl4ktnSv
 wh+oofzWWQ3OY4pFOE354bBRKZRsn/4/v9b2v0O8XCk06uDAtlzqfGSjVDDMojsB0Osn
 um9K7aaaxWO9xvVltwIRhwEjnX5i28/GZS9psF5Fgip04+to0yJ0o5FftPpQox+FnuE2
 ATkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FmOhfTPFenz+Y3OPjIcUJj+KoC2zFYbvhu4VIMiSvL4=;
 b=qVhxgx7b+sGzuP82Nw2yCLP2EpyRmv1dB/YTiC+VuYoO1+eXBLQmnG32Jjf8CbtOfg
 UAEdw38vgJqlXaHERtAsEb7c0w2WIDsST4DnntheBrmW91D1Mh+cljNqjEfUdVH44wn4
 Ps+3LG5k/lUPZNWQJW3EQg7ksRGJAVU9kPSNL0yBnUqJicAQLHvWJ13xO7ulKN+vbAvG
 Ud9itexrE9Kyal2NP+ItY1sd/0LmHWm92KQUmweCgBl36do2AG4hI46MTXQBtTsxClTt
 3ZYMuH6QXr90nEh6Gz/Vr/KqlWQpg12gF7fgBpmyT6hYbkq2ePE0VpVeqJeR3Hb3rFvo
 guzQ==
X-Gm-Message-State: APjAAAXxPR30LAbAD9DyTGbNTyjkDrPdhpzW/rh7f+ctys2nodfz7MPA
 v+fOBQKs0vJwEnf4XtzWiVp4KEVHE2Q/TVghz0U=
X-Google-Smtp-Source: APXvYqxgctBiFtKUERS/sPDif14fjqlVHH464YZGrdxla/ix4TY4Aai5hOSeuOdDVFlV8/QAOKfpQjOhQXCiBggdPME=
X-Received: by 2002:ac8:124c:: with SMTP id g12mr8313039qtj.42.1567065158134; 
 Thu, 29 Aug 2019 00:52:38 -0700 (PDT)
MIME-Version: 1.0
References: <47e3e7b710604e45a04d184a47011c48@inspur.com>
 <a7192225-e326-699d-b3bf-dd3fac5d2d85@linux.ibm.com>
In-Reply-To: <a7192225-e326-699d-b3bf-dd3fac5d2d85@linux.ibm.com>
From: George Liu <liuxiwei1013@gmail.com>
Date: Thu, 29 Aug 2019 15:52:26 +0800
Message-ID: <CANFuQ7DycDmY4z2LyW2ZyerROW1p8DgxAG_RzKXMu0AqzB8KQA@mail.gmail.com>
Subject: Re: BMCWeb changes login password
To: Joseph Reynolds <jrey@linux.ibm.com>
Content-Type: multipart/alternative; boundary="00000000000017327d05913cca4d"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?R2VvcmdlIExpdSAo5YiY6ZSh5LyfKQ==?= <liuxiwei@inspur.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000017327d05913cca4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Joseph Reynolds <jrey@linux.ibm.com> =E4=BA=8E2019=E5=B9=B48=E6=9C=8829=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=883:48=E5=86=99=E9=81=93=EF=BC=9A

>
> On 8/28/19 3:20 AM, George Liu (=E5=88=98=E9=94=A1=E4=BC=9F) wrote:
> >
> > I want to discuss with everyone about the solution to change the login
> > password.
> >
> >   In the WEB, When the user needs to change the login password, the
> > current solution is to directly enter the new password twice to change
> > successfully, but the old password is not verified. the advantage is
> > that we can use the new password through this solution if we forget
> > the old password. but for the security reasons, I think should
> > verifying the old password instead of directly entering the new
> > password before change login password.
> >
> > if everyone have any ideas or experience, please share, thanks!
> >
> Are you referring to the phosphor-webui design mentioned here?:
> https://github.com/ibm-openbmc/dev/issues/1048
>
> OWASP has some recommendations:
>
> https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Cheat_Sheet=
.html#require-re-authentication-for-sensitive-features
>
> https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_Cheat_Shee=
t.html#step-4-allow-user-to-change-password-in-the-existing-session


Thanks, the password change was mentioned in step 4.
I think should add an input field to enter the old password and verify it
when the form is submitted(phosphor-webui).
>
>
> - Joseph
>
>

--00000000000017327d05913cca4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Joseph Reynolds &lt;<a href=3D"mailto=
:jrey@linux.ibm.com">jrey@linux.ibm.com</a>&gt; =E4=BA=8E2019=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=883:48=E5=86=99=E9=81=
=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
On 8/28/19 3:20 AM, George Liu (=E5=88=98=E9=94=A1=E4=BC=9F) wrote:<br>
&gt;<br>
&gt; I want to discuss with everyone about the solution to change the login=
 <br>
&gt; password.<br>
&gt;<br>
&gt; =C2=A0 In the WEB, When the user needs to change the login password, t=
he <br>
&gt; current solution is to directly enter the new password twice to change=
 <br>
&gt; successfully, but the old password is not verified. the advantage is <=
br>
&gt; that we can use the new password through this solution if we forget <b=
r>
&gt; the old password. but for the security reasons, I think should <br>
&gt; verifying the old password instead of directly entering the new <br>
&gt; password before change login password.<br>
&gt;<br>
&gt; if everyone have any ideas or experience, please share, thanks!<br>
&gt;<br>
Are you referring to the phosphor-webui design mentioned here?: <br>
<a href=3D"https://github.com/ibm-openbmc/dev/issues/1048" rel=3D"noreferre=
r" target=3D"_blank">https://github.com/ibm-openbmc/dev/issues/1048</a><br>
<br>
OWASP has some recommendations:<br>
<a href=3D"https://cheatsheetseries.owasp.org/cheatsheets/Authentication_Ch=
eat_Sheet.html#require-re-authentication-for-sensitive-features" rel=3D"nor=
eferrer" target=3D"_blank">https://cheatsheetseries.owasp.org/cheatsheets/A=
uthentication_Cheat_Sheet.html#require-re-authentication-for-sensitive-feat=
ures</a><br>
<a href=3D"https://cheatsheetseries.owasp.org/cheatsheets/Forgot_Password_C=
heat_Sheet.html#step-4-allow-user-to-change-password-in-the-existing-sessio=
n" rel=3D"noreferrer" target=3D"_blank">https://cheatsheetseries.owasp.org/=
cheatsheets/Forgot_Password_Cheat_Sheet.html#step-4-allow-user-to-change-pa=
ssword-in-the-existing-session</a></blockquote><div>=C2=A0</div>Thanks, the=
 password change was mentioned in step 4.<br>I think should add an input fi=
eld to enter the old password and verify it when the form is submitted(phos=
phor-webui).<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
- Joseph<br>
<br>
</blockquote></div></div>

--00000000000017327d05913cca4d--
