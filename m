Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE086170E5F
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 03:21:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sbyj14gGzDqXs
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 13:21:49 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a2d;
 helo=mail-vk1-xa2d.google.com; envelope-from=sdherts@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ezW8vHAv; dkim-atps=neutral
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48R5qp66B8zDqLW
 for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2020 02:40:35 +1100 (AEDT)
Received: by mail-vk1-xa2d.google.com with SMTP id w4so2606208vkd.5
 for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2020 07:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UeeYOzjqr71+6XH4rI15G48G2h29MGBRhEZtz3vmAe0=;
 b=ezW8vHAvs/xWMYolZoi1vdetr3FiNqd66FQl/4GXUL7pLRpjnmntGc/SqcmRv5Fc7s
 Jo8HEaq2lyTNjHNIxZU3uaB8pcBmWzJsVeB7wkjs0uOFuBYzRNM7IKncNIGeY6GXT/IA
 lGJ4/jfjmxu4WPPSlGhDXP4Ut/7W1puB/ZvGz4qBUZjQDBahgJ8qOD87iLE5VP1k8vKM
 T2SVcVEGxXjPf+sVbbXURNEzueN9tiwOwolfzuogqXNMjqTIwWHkalUu5S7NeFGXFV2H
 Mj0vWrbvRYgllQulOlRXf8g3Qic3Bx2ojjDqdrefKI7mEaTnMCWWn18gjs1s7JJta3SV
 lW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UeeYOzjqr71+6XH4rI15G48G2h29MGBRhEZtz3vmAe0=;
 b=tJOd0yCfK5t40E/2JjWc5OHp1lV8tIGyngHP2XczjqqXclNHXeSuqja6UNyBboW00J
 ZooDiZlWUy6jLdCkuG/0Eo5pmgmKFZxD5FEj+DIWifqJy9zbMW8Zhu6ghRwNJWsyLuU9
 joE3MdZxchugj2p5gS0gNc06lpVeeWQYxSYVD9idqWIWTNJH6DIR+e6xjfx/mGbu0Jvs
 GS/f1FkKF3Z5lh1IukeQ4egFJxhF45wjnfaWUbZiM5ezhRQvp6S8jEAZPSfDiiPq7LT4
 xE6hPOOfC+0/lLqBolUymldU5wCO5Y3u6HkiBjU9SjKpVogBk0YuLBSIfOrNJvJln3+j
 8enw==
X-Gm-Message-State: APjAAAU7hk6jH/5msGoCFCHdRMXV1IQ5hoqMcuEaUMLe3qG0tSGDOaaN
 ILdUy+lEckf/b9+CK8KVmH7uiu7TcE9oqW5Ctak=
X-Google-Smtp-Source: APXvYqyEVMVaJsP8n5ls+vn4hcXH3Mi7Ap6mfF82EsRumbtApHxLPXMU2LPRoCty8OWb93Q7/b+Q5ylaNCrLs56nvao=
X-Received: by 2002:ac5:c1c7:: with SMTP id g7mr23993852vkk.97.1582558830916; 
 Mon, 24 Feb 2020 07:40:30 -0800 (PST)
MIME-Version: 1.0
References: <CA+k9xxY2wfrzE=kQOM24wc5pgs+poqNEKyHooQNfxNfZrSsGFA@mail.gmail.com>
 <5937.1579503424@localhost>
In-Reply-To: <5937.1579503424@localhost>
From: Samuel Herts <sdherts@gmail.com>
Date: Mon, 24 Feb 2020 10:40:22 -0500
Message-ID: <CA+k9xxb0eBfXVeA4zxULKL-0NCwmO6=vPw7TBkyGt4fc6xfmOg@mail.gmail.com>
Subject: Re: OpenBMC Starting Point
To: Michael Richardson <mcr@sandelman.ca>
Content-Type: multipart/alternative; boundary="000000000000f3f9fc059f543095"
X-Mailman-Approved-At: Thu, 27 Feb 2020 13:08:41 +1100
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
Cc: openbmc@lists.ozlabs.org, geissonator@yahoo.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000f3f9fc059f543095
Content-Type: text/plain; charset="UTF-8"

So if I wanted a c++ script to run on the bmc whenever I desired, how
exactly would I go about implementing it as a module to run? Kind of like
the Phosphor state manager module that the Hello World guide starts on,
specifically, what steps would I need to take or what resources should I
look into for creating my own module that will run when a specific command
is sent, like the systemctl start phosphor.

On Mon, Jan 20, 2020 at 1:57 AM Michael Richardson <mcr@sandelman.ca> wrote:

>
> Samuel Herts <sdherts@gmail.com> wrote:
>     > I am currently working on getting a working OpenBMC test environment
>     > up and running. I am using VirtualBox and the github Development
>     > Environment tutorial. I had a couple questions regarding how to make
>     > our own modules. Would it be possible to upload files to the bmc on
>     > the virtual server?
>
> You can do that.
> The disk is rather small by default.
> If you are using VirtualBox, you may be able to use the vboxfs file system
> to
> mount the host. That might require adding modules to the kernel.
>
>     > And would I be able to make a script which can read text off of that
>     > file inside the bmc chip?
>
>     > I have a physical server which I am not using yet, would I be able to
>     > install openbmc and the scripts and insert the file onto the actual
>     > bmc chip, and eventually read from that file?
>
> Maybe. What server do you have?
>
> --
> ]               Never tell me the odds!                 | ipv6 mesh
> networks [
> ]   Michael Richardson, Sandelman Software Works        |    IoT
> architect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on
> rails    [
>
>

-- 
Sincerely,
Samuel Herts

--000000000000f3f9fc059f543095
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">So if I wanted a c++ script to run on the bmc whenever I d=
esired, how exactly would I go about implementing it as a module to run? Ki=
nd of like the Phosphor state manager module that the Hello World guide sta=
rts on, specifically, what steps would I need to take or what resources sho=
uld I look into for creating my own module that will run when a specific co=
mmand is sent, like the systemctl start phosphor.=C2=A0</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 20, 2020=
 at 1:57 AM Michael Richardson &lt;<a href=3D"mailto:mcr@sandelman.ca">mcr@=
sandelman.ca</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
Samuel Herts &lt;<a href=3D"mailto:sdherts@gmail.com" target=3D"_blank">sdh=
erts@gmail.com</a>&gt; wrote:<br>
=C2=A0 =C2=A0 &gt; I am currently working on getting a working OpenBMC test=
 environment<br>
=C2=A0 =C2=A0 &gt; up and running. I am using VirtualBox and the github Dev=
elopment<br>
=C2=A0 =C2=A0 &gt; Environment tutorial. I had a couple questions regarding=
 how to make<br>
=C2=A0 =C2=A0 &gt; our own modules. Would it be possible to upload files to=
 the bmc on<br>
=C2=A0 =C2=A0 &gt; the virtual server?<br>
<br>
You can do that.<br>
The disk is rather small by default.<br>
If you are using VirtualBox, you may be able to use the vboxfs file system =
to<br>
mount the host. That might require adding modules to the kernel.<br>
<br>
=C2=A0 =C2=A0 &gt; And would I be able to make a script which can read text=
 off of that<br>
=C2=A0 =C2=A0 &gt; file inside the bmc chip?<br>
<br>
=C2=A0 =C2=A0 &gt; I have a physical server which I am not using yet, would=
 I be able to<br>
=C2=A0 =C2=A0 &gt; install openbmc and the scripts and insert the file onto=
 the actual<br>
=C2=A0 =C2=A0 &gt; bmc chip, and eventually read from that file?<br>
<br>
Maybe. What server do you have?<br>
<br>
--<br>
]=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Never tell me the o=
dds!=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| ipv6 me=
sh networks [<br>
]=C2=A0 =C2=A0Michael Richardson, Sandelman Software Works=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 IoT architect=C2=A0 =C2=A0[<br>
]=C2=A0 =C2=A0 =C2=A0<a href=3D"mailto:mcr@sandelman.ca" target=3D"_blank">=
mcr@sandelman.ca</a>=C2=A0 <a href=3D"http://www.sandelman.ca/" rel=3D"nore=
ferrer" target=3D"_blank">http://www.sandelman.ca/</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0ruby on rails=C2=A0 =C2=A0 [<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Sincerely,=C2=A0<div>Samuel Her=
ts</div></div></div>

--000000000000f3f9fc059f543095--
