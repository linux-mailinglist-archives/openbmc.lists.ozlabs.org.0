Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94C2EB144
	for <lists+openbmc@lfdr.de>; Tue,  5 Jan 2021 18:22:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D9K7316yTzDqfX
	for <lists+openbmc@lfdr.de>; Wed,  6 Jan 2021 04:22:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f;
 helo=mail-oi1-x22f.google.com; envelope-from=vijaykhemkalinux@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YXYSayPv; dkim-atps=neutral
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D9K6F33YkzDqYk
 for <openbmc@lists.ozlabs.org>; Wed,  6 Jan 2021 04:21:24 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id q25so282274oij.10
 for <openbmc@lists.ozlabs.org>; Tue, 05 Jan 2021 09:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9mdTo4fwjlLnlanb1eY4lluiotYuuxLf+GD4Ktb8Sqg=;
 b=YXYSayPvpSsUz5auOCsp6wUgUt5NEqSb7pQr2sUmrYlEwI25YXI/SqIAgQgclcot4J
 FkQvl6GnAgl4JQbZspdLFeziLdP+TReAr3wL4SJdsIW9exxTAiIQTy3IbQTXxOsYr/3F
 8/OXdQRgiPEgcAC1CHEMFIoPrluOpqiACyX6SlJcCHFU6Kuh8GEOZDF/JP3TFww26j6s
 AmrVafjihnleJf9kft4wejxhO8qellNAfjFcnvun6A1k9sNwjY7hrtenM4vLswO9ENf0
 nQ+ARu4DzhBR5zpuSlGB+dqww+Px/6siiUnS1jpRdYq7FLkdjcWCnH08hIlC9yZjezzl
 qfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9mdTo4fwjlLnlanb1eY4lluiotYuuxLf+GD4Ktb8Sqg=;
 b=gu7ST3Z90DWNVjwocKaam8LWnu961lvUmuZKhGE6T5Dq8OEeYIfAdr7vA0dz+/M2us
 btt9TiVx8owZHzUxspbtIzDk+BVmLyJ5NyjbR5q0Zme2SEDIllOAdD2U6kABbIhVmS5O
 0/F/70PMuVyY4OsJZeDSvGXnU1bCfdklzsSSGMoiBhUjhCVPfk2eyMUm+wnr7IrLJ18D
 zz5njET4Ew7IjGBWJcCUKGyd8BzlmXBp5eePn/oaal06G1C7IjpqZdlX/9zN/dQOZyuM
 2nViTjqXjCJp2zfwqz4vowpaNFUUMISC5SyCJ4mO063Zm5PyBOgNWMw0bHkvny7u9QaJ
 Wxjw==
X-Gm-Message-State: AOAM530/xtXRb6VS/7a7N49x3UXU2LxJavNwbf+BXuyipFj/hL9eP62v
 1CbuFjVoBG828STR4Q7z40JMSTKovpJHY3NosPS18kM3
X-Google-Smtp-Source: ABdhPJytlBC5jYf9Quh+zhu/sYmNDEF3QMHNyVQahV3FhFlHFPOR34FsKxGotv4a6GURGTpUfJgBOOYEPe3rjWId/RY=
X-Received: by 2002:aca:4b16:: with SMTP id y22mr436219oia.148.1609867281309; 
 Tue, 05 Jan 2021 09:21:21 -0800 (PST)
MIME-Version: 1.0
References: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
In-Reply-To: <6ab96a24-70b6-c6a0-39f4-ab1d439aca9c@amperemail.onmicrosoft.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Tue, 5 Jan 2021 09:21:08 -0800
Message-ID: <CAJTGxZFk5qotVEVSRwU83ibZVrcJk4toMdV5Zj7mFHsjqo2OPw@mail.gmail.com>
Subject: Re: GPIO pin is reset to default value after release.
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Content-Type: multipart/alternative; boundary="00000000000070230905b82a6f17"
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--00000000000070230905b82a6f17
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 5, 2021 at 8:29 AM Thu Nguyen <thu@amperemail.onmicrosoft.com>
wrote:

> Hi,
>
>
> Current I'm using two difference GPIO libs gpiod and gpioplus to setting
> GPIO pins.
>
> I can set the GPIO pin to expected value in a service. And GPIO keep
> unchanging when the service is running.
>
> But when the service is exited, the GPIO handler is released then GPIO
> is reset to default value.
>

Can you make service "run always". systemd service allows this.

>
>
> Do we have any gpio lib which don't reset the GPIO when the handler is
> released?
>
>
> Thanks.
>
> Thu Nguyen.
>
>

--00000000000070230905b82a6f17
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 5, 2021 at 8:29 AM Thu Ng=
uyen &lt;<a href=3D"mailto:thu@amperemail.onmicrosoft.com">thu@amperemail.o=
nmicrosoft.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi,<br>
<br>
<br>
Current I&#39;m using two difference GPIO libs gpiod and gpioplus to settin=
g <br>
GPIO pins.<br>
<br>
I can set the GPIO pin to expected value in a service. And GPIO keep <br>
unchanging when the service is running.<br>
<br>
But when the service is exited, the GPIO handler is released then GPIO <br>
is reset to default value.<br></blockquote><div><br></div><div>Can you make=
 service &quot;run always&quot;. systemd service allows this.=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Do we have any gpio lib which don&#39;t reset the GPIO when the handler is =
<br>
released?<br>
<br>
<br>
Thanks.<br>
<br>
Thu Nguyen.<br>
<br>
</blockquote></div></div>

--00000000000070230905b82a6f17--
