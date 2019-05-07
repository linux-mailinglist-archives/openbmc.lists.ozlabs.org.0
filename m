Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1134166B8
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2019 17:28:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44z3Qz0pQ9zDqJl
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 01:28:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::c31; helo=mail-yw1-xc31.google.com;
 envelope-from=jandraara@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KjdAPepX"; 
 dkim-atps=neutral
Received: from mail-yw1-xc31.google.com (mail-yw1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44z3Pl5YVrzDqGt
 for <openbmc@lists.ozlabs.org>; Wed,  8 May 2019 01:27:23 +1000 (AEST)
Received: by mail-yw1-xc31.google.com with SMTP id p19so10701756ywe.10
 for <openbmc@lists.ozlabs.org>; Tue, 07 May 2019 08:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m0tyKBNPUdFC3QdmZ7gbhEc8gDtR1dbP+KtD4dNwmfw=;
 b=KjdAPepXa4Tf/7cDCqMQBbZEivNY3r34h4/YRq/NCV/668LtH9HOLQV0p69S8j4iia
 BTW3ID3061EDZPxDpfy+u3OrSf0fnCS3Zk/fDvL+n8HHMi5AlJgDUNlPVag4XeXYg3tc
 zKR8SQ6zErCcqZgfOlG8kEmz+IzXCFmt87+VvS3HXPulKKHDjRyQHD3cbL6JS5xwPudx
 /o/CjxkP0rnO3by2vMmTjQPkTUkB8QCO3u4O/hGW+EzGKiB1oZHB386fFVZ7E60E1L8U
 lOW1LP4fBjDOlWVNj+iks8Je+nSB1OAHwUTZCXtoJUPZU/DIGuL7ef8plXSRfufzjPta
 eq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m0tyKBNPUdFC3QdmZ7gbhEc8gDtR1dbP+KtD4dNwmfw=;
 b=DyzPMqEmJXmk/8K6QMGDL0f00KKdgEgN6YcWwJd5OZk0DrwmrIm7r0BreXpfVKOlMx
 1PWwl/XOPsQJoHowsQ84M5OPVJCBkO7wAUYQSN+83bnOm+tCFLKovbL8oY0hDOKKxcA1
 sWVh89s5BWOJ5NSPFlJfA/dB2JL0ASnuOhUQ3AUW8Max1fg3kKL02OW78oB2qWkw5/bf
 l1OvT2erd2DfpWtlCe8IV4Ro+tW6WChXy7AzsvfbdIcjjes9o/NPzTllkvR+n4JYHAPJ
 G1rVLliM0o3CH/+lP/Ah6Nmb7hYFweqbnWD2jeYNk8OGvDqmX9hSf6R1e+oTFhWgOhpr
 Pc/A==
X-Gm-Message-State: APjAAAUhG/3AEsCS4RjnmBimSBanbklXjhh4gvzdMh6wTZLQuXSCf+v5
 PngsWxXn4/G8F6rTHhxMGSNtFNN598u4E1tqIVPX2S5X
X-Google-Smtp-Source: APXvYqxWeNvFjb7Av2eU8s0/rlthqnxMWy2y+8cPk40599ny0zH2MYdu/BUQztPGTG9bDkPiUX5a9AzeAadqN97hGF8=
X-Received: by 2002:a5b:2ce:: with SMTP id h14mr21256263ybp.193.1557242839124; 
 Tue, 07 May 2019 08:27:19 -0700 (PDT)
MIME-Version: 1.0
References: <a345e6df8a574eb394eab94e70474cd8@Eltsrv03.Eltan.local>
In-Reply-To: <a345e6df8a574eb394eab94e70474cd8@Eltsrv03.Eltan.local>
From: Jandra A <jandraara@gmail.com>
Date: Tue, 7 May 2019 10:27:00 -0500
Message-ID: <CAMTupoSh0s1TQySQ+FZyKc8UH5s3hEYjkwNyW+8oBEG6yUBYTw@mail.gmail.com>
Subject: Re: webui: setting Boot.Mode and Boot.Source
To: Wim Vervoorn <wvervoorn@eltan.com>
Content-Type: multipart/alternative; boundary="000000000000414fa105884ddaa6"
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

--000000000000414fa105884ddaa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Wim,

Yes, I'm glad you ask. This is something we are currently working on so
there is still some work to be done. We'd love to get your feedback to see
if what you think is missing aligns with the work we have planned, and
understand what your needs would be from this functionality as a ser. You
can find the current design proposals here:
https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_=
System_On
.

Note: To leave feedback in InVision, turn on Comment mode from the bottom
right hand corner of the screen and then click where you want to leave a
comment. To navigate through the prototype, click where you see flashing
blue rectangles or use the right and left keyboard arrows

Please let us know if you have any questions and if you would like to set
up some time to review this.

Best,
Jandra Aranguren  |  GUI Design Team


On Tue, May 7, 2019 at 7:25 AM Wim Vervoorn <wvervoorn@eltan.com> wrote:

> Hello,
>
>
>
> Currently the webui doesn=E2=80=99t contain the functionality to change t=
he boot
> mode and boot source. Are there any plans to add this to the interface?
>
>
>
> Best Regards,
>
> Wim Vervoorn
>
>
>

--000000000000414fa105884ddaa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello Wim,<div><br></div=
><div>Yes, I&#39;m glad you ask. This is something we are currently working=
 on so there is still some work to=C2=A0be done. We&#39;d love to get your =
feedback to see if what you think is missing aligns with the work we have p=
lanned, and understand what your needs would be from this functionality as =
a ser. You can find the current design proposals here:=C2=A0<a href=3D"http=
s://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Options_-_Syst=
em_On">https://ibm.invisionapp.com/share/8ENYRVXAPFD#/319095138_1-_Boot_Opt=
ions_-_System_On</a> .=C2=A0</div><div><br></div><div>Note: To leave feedba=
ck in InVision, turn on Comment mode from the bottom right hand corner of t=
he screen and then click where you want to leave a comment. To navigate thr=
ough the prototype, click where you see flashing blue rectangles or use the=
 right and left keyboard arrows<br></div><div><br>Please let us know if you=
 have any questions and if you would like to set up some time to review thi=
s.=C2=A0<br><br>Best,</div><div>Jandra Aranguren=C2=A0 |=C2=A0 GUI Design=
=C2=A0Team</div><div><br></div></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 7, 2019 at 7:25 AM W=
im Vervoorn &lt;<a href=3D"mailto:wvervoorn@eltan.com">wvervoorn@eltan.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div lang=3D"EN-US">
<div class=3D"gmail-m_-4570422781387075257WordSection1">
<p class=3D"MsoNormal">Hello,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Currently the webui doesn=E2=80=99t contain the func=
tionality to change the boot mode and boot source. Are there any plans to a=
dd this to the interface?<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif">Best Regards,</span><span lang=3D"NL" style=3D"font-siz=
e:12pt;font-family:&quot;Times New Roman&quot;,serif"><u></u><u></u></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif">Wim Vervoorn<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"NL" style=3D"font-size:10pt;font-famil=
y:Arial,sans-serif"><u></u>=C2=A0<u></u></span></p>
</div>
</div>

</blockquote></div>

--000000000000414fa105884ddaa6--
