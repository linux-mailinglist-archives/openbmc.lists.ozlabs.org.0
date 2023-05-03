Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAA66F581A
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 14:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QBGsy1VMqz3cdQ
	for <lists+openbmc@lfdr.de>; Wed,  3 May 2023 22:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q20Ib5SC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=avifishman70@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q20Ib5SC;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QBGsM1knVz3c7Q
	for <openbmc@lists.ozlabs.org>; Wed,  3 May 2023 22:46:13 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-24deb9c5ffcso2824580a91.1
        for <openbmc@lists.ozlabs.org>; Wed, 03 May 2023 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683117970; x=1685709970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKcaR2Y71+BtcLhFEMIecVXlw8v4MnMkXKlw5yUDa7w=;
        b=Q20Ib5SCi/mOl7nJ4DS3hOypeOFH6yLJfWH+GMCn22d9D78iUEFgWqHS1EltgKh1jc
         SlvP94ZPds+ZNIj54i+AQUgGaWyhw+OGT8IPz9IqSGm2ZrH1/yTh061wItUXLKGQFI4l
         z6749hHZvIkZLUBIH+jkDGNmzdvv7eehE36LYkhA7WEpEP2Hp1vX5/sMtznb5KrWA5lF
         D0boAjkNR4ZF6vxeIsEJb0wGdF9QMlq9JhqlKtQeTF7WSe9CUlCp1ZuF9CBTctf8DjSu
         0vw0wlnkJRqyY04jM8Yb1Kl4sbEugxVBFdM7lhxz1iXhHUGsRxa4wPiZD9hou//bCsZp
         PdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683117970; x=1685709970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKcaR2Y71+BtcLhFEMIecVXlw8v4MnMkXKlw5yUDa7w=;
        b=dIK2xnoQRx2wWQFeDBP9RCQhRLoS19DcIEkRsLPzB05cDXNnKBWLeHtchwVSFVa/ZL
         6fbVUu1Rsue4g0b2yyjwU0+nXNzX1dB6KTAE/KChBLRT0GAqbe5T650HfqetCJ9ukbgA
         /An5MopBx8am+Gdc39afu/qYHiYHHQbFukY2kyDr+KGUBVJS/LegLlxPcJEATYLjrgIO
         kT1NkD4sd4rWVbVeDv/p5jtTBDWcpQrFfJvZD59LK3UTI0401REsmy/XvMv6fcIZ+vx4
         nv9vJsT5GlO+kiOe9Rbuk/dKL0EN2+34eDx5lZXgWmj6afxuC0HRS7KNawFDopjAYnjk
         qGzg==
X-Gm-Message-State: AC+VfDzW7+2Upq02lt2T78WQdokpt7mlTLPqtK1dHuEWz1ROlUUmO8z8
	Uxp9JVK3/2WD5E7sypKcVe5yO/d11+0gO+VB1g==
X-Google-Smtp-Source: ACHHUZ5nhf4lF3uq/4n15BVT+42cY4KAqH7L29R9qy4h36JsiFb1uqtPjzLO52x+qngqc/wt+tisZOg9lmF1kPRQFx4=
X-Received: by 2002:a17:90a:5511:b0:24e:165d:8f65 with SMTP id
 b17-20020a17090a551100b0024e165d8f65mr7526116pji.5.1683117970103; Wed, 03 May
 2023 05:46:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZEwbPFW5p6jB0kLR@probook> <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
In-Reply-To: <CACPK8XcONxSRa=5vq3uDxiAQww6ULVJr+OkQp3Q72MDLSJrBnQ@mail.gmail.com>
From: Avi Fishman <avifishman70@gmail.com>
Date: Wed, 3 May 2023 15:45:59 +0300
Message-ID: <CAKKbWA6=Em3Pih83qX2v0YfPZr823Cj9UvmaRoxbEKQmPqumQw@mail.gmail.com>
Subject: Re: Upstreaming Nuvoton EMC (100 Mbit Ethernet MAC Controller) support
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

Indeed this will be great.
Note that the code has some workarounds in its implementation.
See updated version at:
https://github.com/Nuvoton-Israel/linux/tree/NPCM-5.15-OpenBMC/drivers/net/=
ethernet/nuvoton
also, long time ago I started the progress of upstreaming and stopped, see:
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg2067239.html

Thanks,
Avi

On Tue, May 2, 2023 at 9:44=E2=80=AFAM Joel Stanley <joel@jms.id.au> wrote:
>
> On Fri, 28 Apr 2023 at 19:15, Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx=
.net> wrote:
> >
> > Hello Avi and others,
> >
> > in my ongoing project to support the Nuvoton WPCM450 BMC in mainline
> > Linux, I have reached the point where the next useful step would be
> > Ethernet support. The WPCM450 contains a Nuvoton EMC, which is also use=
d
> > in some older Winbond SoCs, and newer Nuvoton NPCM7xx BMCs.
>
> That would be a great contribution.
>
> I have a npcm750 eval board that I can test it on, please cc me when
> you post the patches.
>
> Cheers,
>
> Joel



--
Regards,
Avi
