Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE6A5287B3
	for <lists+openbmc@lfdr.de>; Mon, 16 May 2022 16:57:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L22Rd48Vzz3c7P
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 00:57:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qb1ylrbJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1131;
 helo=mail-yw1-x1131.google.com; envelope-from=peter.maydell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qb1ylrbJ; dkim-atps=neutral
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L22Qy59NBz3cBv
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 00:57:13 +1000 (AEST)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2fefb051547so28107907b3.5
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 07:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=Qb1ylrbJTTk0hEbxeoTx+1+frF7XgddeLFuyHgIhrpSE8amy1lp7xo+1ugDvrw+A5F
 rDopXW/IziDBD9oMjoynND6tCYjWxU7j/yaFeFsxKK8wFQ1dL0x8H17Po2jxP/uoJ40V
 hXaGscsAEkm3Iq8B2evXID9UoP8iP1nqJzwAtxLsUOJvVoYrswNT2AuvTG0oqOUv7JAU
 nRD+aK9U+NmJMsN2fP0pPEnLvfP57Ax/b2nJ7XWrYSQxlrBTXaBPU7KKVviAhsjDoWhh
 okVQMwOVvlCI719OHSaWymZEOysY0vQcPy4OjNe+wnP0U+UaLWT1zsrlGbzuC5KPi38C
 xjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=N89Sx8/KAkUuHJ7/ED0/EHJX3wQIKDwFFofDvqvUYdA=;
 b=spNGEwIeE/KtWKq9C2sbz8yASyX7fJvEpK4JTQRgpNQuwW6I5345ntzWH9uOLaL43q
 B5YtLG9H8DGL+AGAcLl+YxB0bMfHJlvijQ8Mbjp1zqC92P36J7OhVTW6uYYfsUtbKutY
 hjCTS9is1SBx4hjkMyAzmdq5iMzAG/kbnDjZUVjkTDwT+FFOF5jBILEwYT0NYf6fw+Yf
 RJPDrXY5lBEUxKw+ZWzi0IJ+n47MLiWtJd5Ei5/PvIeRH9MrpedMGzeNrsgcPT/5+rTO
 w4tvawU/5KTV1Rl3TM4mhNNWM1lj1PQsXwN3Y4nArq8j8cOVDwI/BwDfBLcpQNzBPrEz
 mPZw==
X-Gm-Message-State: AOAM5308ZGmdw7n4gA4WahGZ8CdLT3c3i3gQ6GN1Z1L8db3GdFLRNEpP
 jgOIeah3M0SIreow7jOfLf1YRtyU1wtbjOLK/E/VIg==
X-Google-Smtp-Source: ABdhPJx6UX6fZ1Snft4Vi959h5AJ/FXZgcTqqQBXdY9caOMoWxN2tXK68Dt9WKI1n3zM5BWPcelErmxSccghbBcikYM=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr7743832ywc.329.1652713029278; Mon, 16
 May 2022 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220513040220.3657135-1-pdel@fb.com>
 <20220513040220.3657135-3-pdel@fb.com>
 <443933f2-069f-df96-ec62-76c21fc644b2@kaod.org>
 <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
In-Reply-To: <05F5C72F-8424-476C-82B7-7D30BA48CDEB@fb.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 15:56:58 +0100
Message-ID: <CAFEAcA_dadj4cuE55K4ng-twgGO98FOcLX7Y=1_Y9Z929NUZLw@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw: aspeed: Init all UART's with serial devices
To: Peter Delevoryas <pdel@fb.com>
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
Cc: "zev@bewilderbeest.net" <zev@bewilderbeest.net>,
 Andrew Jeffery <andrew@aj.id.au>, Iris Chen <irischenlj@fb.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>,
 Cameron Esfahani via <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 13 May 2022 at 22:09, Peter Delevoryas <pdel@fb.com> wrote

> I was actually intentionally skipping that. If serial_hd(i)
> doesn=E2=80=99t exist, the function will return NULL.
>
> Chardev *serial_hd(int i)
> {
>     assert(i >=3D 0);
>     if (i < num_serial_hds) {
>         return serial_hds[i];
>     }
>     return NULL;
> }
>
> So then, the serial device=E2=80=99s CharBackend=E2=80=99s =E2=80=9CChard=
ev *chr=E2=80=9D
> will be initialized as NULL. Looking at all of the
> usage of this attribute in =E2=80=9Chw/char/serial.c=E2=80=9D, I think
> that=E2=80=99s ok, the read/write functions will just be no-ops.
> They all have guards for =E2=80=9Cchr =3D=3D NULL=E2=80=9D.

Yes, this is deliberate. We added these in commit 12051d82f0040
because otherwise lots of board/SoC code would have to create
NullChardev dummy backends (or forget to and then crash depending
on the user's commandline).

thanks
-- PMM
