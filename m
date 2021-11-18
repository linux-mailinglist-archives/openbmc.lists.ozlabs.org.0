Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 496B04555CA
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 08:35:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvs641Fr9z304t
	for <lists+openbmc@lfdr.de>; Thu, 18 Nov 2021 18:35:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jvwlx3IA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531;
 helo=mail-ed1-x531.google.com; envelope-from=kumarthangavel.hcl@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jvwlx3IA; dkim-atps=neutral
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hvs5d3dNTz2yXv;
 Thu, 18 Nov 2021 18:35:14 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id y12so22798659eda.12;
 Wed, 17 Nov 2021 23:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0URvf8Ysl7HlCW2mQtjtDZ/PGw8GXuG3xU/3331OCX0=;
 b=jvwlx3IA78l2uA7OfWM32bczmkICeILoPBj0gqinKbWVEXKxDp58/fJdo/e6ISIO/C
 G50ssJUDD0Coyp+0gSVcnawpV/rqcdks6+5rcs01R7OAaPLazzsICrwWD5BfZNR4s9Qq
 HDCOpFUXtEmOJcA3Jv1GgAzW/tA8qVnOIip5DUpu/ARTyNGIz/SJGLqVc0LS91OuLT2h
 DHPNRd5FtEhlFtbRz8DdgPMIaTgJtVck9ShyoolnGyljjSCZAAnTOz0e0hpAzHtediq2
 W7PltIjamEKNQtdaaJiaMa7L5ERcgnNy4yFgqyzD/Zl0xTlrS6tpJqq8/KhyWVInys0M
 PgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0URvf8Ysl7HlCW2mQtjtDZ/PGw8GXuG3xU/3331OCX0=;
 b=yN95gHokxvaWoYggx9Xx0/hiVvZ4Pb043KForEFZwp7m6+2vkwUQTQSQrL7jXnsJpR
 spQ3i5B830Y2zVd3oDhos8Ar/loxUk5cMg5hLsfgzwLZoiOhKf/k+uadGwiJ7IInPsFY
 n/X9Pw2pet6cYWUInuIUL/b91Bn02GBQ5HJvf285Md5tBb87/gotrrQLjjFCDFZaNlGH
 gkmo6D1G6AZBQIPWlCUf6cTPkZfZCTbf2BSYfm+NSIh/2N/q/DtRn5evfA/hVr9tle6J
 ieCUoRd7JAwJ9DiZxVKkIxWv0oTBNWiFxGQdZlXj/mTnNC8Ls+/8J3tVS9iK89CxUADj
 roOw==
X-Gm-Message-State: AOAM530lF79FEzNW+pzU7pauumi4f5KzW9Q5IHbg3H2kVvmh7AISJVdl
 wwSxwaUd/slEunfh7zM6k5ZIMP/mLuWDJx2NvaNHKjR+
X-Google-Smtp-Source: ABdhPJxes64DATiFOCsBWgnpc/9Mt0nug8lW70oZsKrVZc11R01luhC6huCnySiqN6P2f1THe5fZ5diFLT1uBpUqmz4=
X-Received: by 2002:a17:907:d9f:: with SMTP id
 go31mr32039949ejc.412.1637220911912; 
 Wed, 17 Nov 2021 23:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20211117075513.GA12199@gmail.com>
 <20211117102300.68d00e9a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20211117102300.68d00e9a@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
From: Kumar Thangavel <kumarthangavel.hcl@gmail.com>
Date: Thu, 18 Nov 2021 13:07:07 +0530
Message-ID: <CAA7Tbcux55gKoqE9OoPfRcAOO1VkC9hAESHv=Egpjd_vR=M0yQ@mail.gmail.com>
Subject: Re: [PATCH v6] Add payload to be 32-bit aligned to fix dropped packets
To: Jakub Kicinski <kuba@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000df984705d10b3262"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, Amithash Prasad <amithash@fb.com>,
 patrickw3@fb.com, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 velumanit@hcl.com, "David S. Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--000000000000df984705d10b3262
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 17, 2021 at 11:53 PM Jakub Kicinski <kuba@kernel.org> wrote:

> On Wed, 17 Nov 2021 13:25:13 +0530 Kumar Thangavel wrote:
> > +const int padding_bytes = 26;
>
> net/ncsi/ncsi-cmd.c:21:11: warning: symbol 'padding_bytes' was not
> declared. Should it be static?

Ack.

--000000000000df984705d10b3262
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 17, 2021 at 11:53 PM Jakub Ki=
cinski &lt;<a href=3D"mailto:kuba@kernel.org">kuba@kernel.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 17 Nov=
 2021 13:25:13 +0530 Kumar Thangavel wrote:<br>
&gt; +const int padding_bytes =3D 26;<br>
<br>
net/ncsi/ncsi-cmd.c:21:11: warning: symbol &#39;padding_bytes&#39; was not =
declared. Should it be static?</blockquote><div>Ack.=C2=A0</div></div></div=
>

--000000000000df984705d10b3262--
