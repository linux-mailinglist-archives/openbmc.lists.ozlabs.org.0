Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B198497BE
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 11:27:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mc3awxtQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TT2cq4F6jz3c5T
	for <lists+openbmc@lfdr.de>; Mon,  5 Feb 2024 21:27:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mc3awxtQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=rand.sec96@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSQ6K2MVBz2xPc
	for <openbmc@lists.ozlabs.org>; Sun,  4 Feb 2024 21:02:15 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5111e5e4e2bso5429914e87.3
        for <openbmc@lists.ozlabs.org>; Sun, 04 Feb 2024 02:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707040927; x=1707645727; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MptYRqqpWIpcKqzkpmvlWrxraa2psiGdhVeQpldYTDM=;
        b=mc3awxtQW1c4ldYYhCmHAMjmmikiYSbRJiRQ0ho0m9cu8pj9PUMMn2NbOa/zkMaB+O
         F2AupUL3Ugqygn2qX0oYauaRNf3qfQk+u0YDBlG+U+zo+e/6BEWZidksQv9oCQmYyXrE
         lQCunAeAuNy3fbNrVkKZ5Sfwyw9UUVb7R2KMDFf6QaJSZjz2KBpltpoGpkrtG9Ed5Tbr
         ujYTin9PqESK8xW7A0lNhJ1gP4Yhk+WXx1tpaxIwt/cCbOtG47Yztai4++e6XzhQIvuq
         W5aErma8oPtnlD7sgkuq1FUxrKDZbVTGesaUmSdBHo5zvqgpVv6hGlmM+eGflfubN2Fc
         OUag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707040927; x=1707645727;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MptYRqqpWIpcKqzkpmvlWrxraa2psiGdhVeQpldYTDM=;
        b=GhUp/uSeATlsaH++yAwg4Dic9tIkL2qzUVYCPnUMYnFhfB1qIJWWM2bKzd0vShEUuQ
         2qTAG+HVVqdsPT61e1KKL/UZr8Zn95fIndX3X5VyqoPzumSxn5x5zO/LCg4olwEXuL6f
         mUDgGsnFcRi+0n/hYNugzaCrnoJ+aDP8+MKoFWPz1zR3tpDHjbs/3ZlF4J7RnygXkKMv
         V1sJnmbkDYt7VXzeXSuZMjbQuD08JT3OvTw16yLZzQovKIkVvfDaCsBrxe4qFy40IeB9
         hgCH3j/h2DmwAHJqHw7KSwsaPWOqO59V2EpwjoJJJtkkw+koUXT/2hB390n7/3aDfPtL
         FBuA==
X-Gm-Message-State: AOJu0YwKvuWkvg3e6tDjw7WHwTiK7raOTZ2VODjzUfksAV0whgMbOWCJ
	Iklb+cTAm7QB6tvZq9XCoD3K1Zsi9jQ6BuZBzVlLyNAL0uoAYeEGn5EkBLC5IrYVdoX1N0wGETo
	Dmkbu+qwNnadOioTzL/Z9uwsJb8Y=
X-Google-Smtp-Source: AGHT+IEpuMG1yXA7Zp55UkS7o6AT2ZjyTZhDF9/iTk2HqZci+oxnISlwVqBlvZTWDFfBr51NAh/6Q6+PJPN45aXbLHg=
X-Received: by 2002:a05:6512:33c8:b0:511:4e05:d398 with SMTP id
 d8-20020a05651233c800b005114e05d398mr431789lfg.0.1707040927310; Sun, 04 Feb
 2024 02:02:07 -0800 (PST)
MIME-Version: 1.0
References: <20240109145121.8850-1-rand.sec96@gmail.com> <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
 <111837c6-6c60-4bd4-9e66-1c652a43f3ae-pchelkin@ispras.ru> <Zb6luAVHcnX2fXz3@shikoro>
 <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
In-Reply-To: <f5f26a7d-973a-4232-b0cb-b0543fddefe0-pchelkin@ispras.ru>
From: Rand Deeb <rand.sec96@gmail.com>
Date: Sun, 4 Feb 2024 13:01:56 +0300
Message-ID: <CAN8dotn6r-NF+6tfaomGCGXWtwQ-rtJPaBPzU4NAfBUseerKUg@mail.gmail.com>
Subject: Re: Re: Re: [lvc-project] [PATCH] i2c: Fix NULL pointer dereference
 in npcm_i2c_reg_slave
To: Fedor Pchelkin <pchelkin@ispras.ru>
Content-Type: multipart/alternative; boundary="00000000000016e65e06108b7027"
X-Mailman-Approved-At: Mon, 05 Feb 2024 21:26:05 +1100
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
Cc: voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, Tomer Maimon <tmaimon77@gmail.com>, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, lvc-project@linuxtesting.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000016e65e06108b7027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Fedor!,

Sure, In fact, there were two scenarios from the beginning, either
redundant condition or potential NULL pointer dereference.I relied on
the condition to determine the type of issue because I did not find
it logical to add a useless condition, but based on the words Wolfram
Sang "we trust ourselves here." then the scenario will change to
redundant condition, so i'll write a new patch and send it in new
thread.

On Sun, Feb 4, 2024 at 11:54=E2=80=AFAM Fedor Pchelkin <pchelkin@ispras.ru>=
 wrote:

> On 24/02/03 09:44PM, Wolfram Sang wrote:
> >
> > > If I'm not missing something, npcm_i2c_reg_slave() is called via a
> > > function pointer ->reg_slave here [1]. And seems `client` can't be NU=
LL
> > > there. Other drivers implementing ->reg_slave function don't check it=
s
> > > argument.
> >
> > Correct, we trust ourselves here.
> >
> > > Maybe we should just drop `if (!bus->slave)` check?
> >
> > Yes.
> >
>
> Okay, thanks for confirmation.
>
> Rand, would you like to prepare the patch, please?
>
>

--00000000000016e65e06108b7027
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Fedor!,<div><br><div>Sure, In fact, there were two scen=
arios from the beginning, either <br>redundant condition or potential NULL =
pointer dereference.I relied on <br>the condition to determine the type of =
issue because I did not find <br>it logical to add a useless condition, but=
 based on the words Wolfram <br>Sang &quot;we trust ourselves here.&quot; t=
hen the scenario will change to <br>redundant condition, so i&#39;ll write =
a new patch and send it in new <br>thread.<br></div></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 4, 20=
24 at 11:54=E2=80=AFAM Fedor Pchelkin &lt;<a href=3D"mailto:pchelkin@ispras=
.ru">pchelkin@ispras.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On 24/02/03 09:44PM, Wolfram Sang wrote:<br>
&gt; <br>
&gt; &gt; If I&#39;m not missing something, npcm_i2c_reg_slave() is called =
via a<br>
&gt; &gt; function pointer -&gt;reg_slave here [1]. And seems `client` can&=
#39;t be NULL<br>
&gt; &gt; there. Other drivers implementing -&gt;reg_slave function don&#39=
;t check its<br>
&gt; &gt; argument.<br>
&gt; <br>
&gt; Correct, we trust ourselves here.<br>
&gt; <br>
&gt; &gt; Maybe we should just drop `if (!bus-&gt;slave)` check?<br>
&gt; <br>
&gt; Yes.<br>
&gt; <br>
<br>
Okay, thanks for confirmation.<br>
<br>
Rand, would you like to prepare the patch, please?<br>
<br>
</blockquote></div>

--00000000000016e65e06108b7027--
