Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC619D05B1
	for <lists+openbmc@lfdr.de>; Sun, 17 Nov 2024 21:14:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xs25r50tlz3cTn
	for <lists+openbmc@lfdr.de>; Mon, 18 Nov 2024 07:14:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731874445;
	cv=none; b=ZdUXys4GjZSpvyoiWpKF4nRD56KeNtdyJYILTZOZRlgw/BD58IRz80iNdzWjZMx7+VcxlCeIjbbf1YqLHE+/wAu2RajYFNk0pLXUiyzTmIBLhdbF8uD2cUmRoFpW60hG3KZc66v36mdblvV+pHPS3lIshclE/JmqSzhpcU9Egkxvhg6hXkwLmJ2NryA9leAaPHhb6o6jUztiZecZgZbKNMYCwsWAmfgz+7X5m6BdgIkcY7Q+sPcFIaVh5CDxM5q0W8A3xVXf4tCGIO/QaKu46kc/bY2lR/nZY8LnCmLcIpxhDF2349bemXDUI3ZX4FrpSi0xtcE6I+FyjuPNplPGLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731874445; c=relaxed/relaxed;
	bh=JQ22dxBuxJ3SOQxpojU/s+vE8bpP8RDnTxJHezr/asE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hvo+gZ991P0HhlBkD03qZ1A4b3ZxY+APU48Kb/E0qufIeHoxgJZUoTQMX87iGtVz97IrL5ud7gE2cVBeLLQQApBJqTGniPQpJqaGSkQczst2oODWAHl0YklvHwiN4MNaqkIWe+fGIoms61YFh8EZpbOzA1pPQiwLwQeVa+rDtJVDa4p77WAGcbh4t/k7MmsStCRFuogJeCp0iDXEy7CytBbTSbB3OXqckERl9DodS21SlnffclGEjfkC3HPdrINqkdE99/rJHJRANYJXjOdsrcpItzAuFQ+Bihlyd2IZX6NzLY7DK8jlzQE/wkDedLl8BMS+R1Fe+W5gpZTURh/C4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net; dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=NEjvBqpA; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org) smtp.mailfrom=tanous.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=tanous.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=tanous-net.20230601.gappssmtp.com header.i=@tanous-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=NEjvBqpA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=tanous.net (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=ed@tanous.net; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xs25k6M5bz2y8d
	for <openbmc@lists.ozlabs.org>; Mon, 18 Nov 2024 07:14:00 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso2746697b3a.3
        for <openbmc@lists.ozlabs.org>; Sun, 17 Nov 2024 12:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tanous-net.20230601.gappssmtp.com; s=20230601; t=1731874436; x=1732479236; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ22dxBuxJ3SOQxpojU/s+vE8bpP8RDnTxJHezr/asE=;
        b=NEjvBqpA1h2GioAJOqHuPyetFqQUUurXZMmKUjK5TrOHqv3HdB4Z2EzHvXHhjthtb7
         f78AMsEmHck5voSe+VPEcCbTMAm3E4Pm8QxKKhFmbMbtTsuFJ6B4jCkQU+/Y1x34schc
         xSy01BWZBjwI9xlc9mT1Nqwi5JnFVLHf0L+SxDh2/AO75VG6EyFpYakQHvgAxiKNtWhE
         zWKTwQ9V0DhqGfiCiIaQYQOUoXfK64m9eebVHYoapabZSUzGCnaW2Zh9WRlR+5fi5MWd
         Ezmaqk3Qi7Gi431PQcvk0w06U5x2YpD1N/e4aS1ESzEg3paqn4v1sGMb+Y9DG7jVuO4x
         LCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731874436; x=1732479236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JQ22dxBuxJ3SOQxpojU/s+vE8bpP8RDnTxJHezr/asE=;
        b=LoC5tFQhVxnc0wRaz3foNUuq1mBffxSvOypxH62gCHLsY8Jp5GSsB4e7/1ne1pADYn
         rRPjsfmK9fmGfSMO0gQC/CjrSQL5wuXWbeEWLeiLMaNsYlWvALK59OOOdfBEdKtZVkTS
         +MFKaEt92FIjrL/sq1bq3+4UdhODFsFPAZQttEfWgCjiBypoWP1y6RxDQyULncniLkrk
         7gejrUF6sbSHdTzsIH19xQiZdonoHI0CMZ8870T1RGpabT4lcSQto+EwVl9k/0wPpDTp
         CSKI8u1oz2Qi3fcYBvF+BjFFskAGiRcWdbNVSU3lTtSKnSE+j1e0TlPEOwoZNhexFXTK
         dh7A==
X-Gm-Message-State: AOJu0YxRGBiXxamTveF+88vHEV+25oYMP6VRAlsVfAIBmncPN8+VLguj
	/HOBRk+cjoQH6XOt49AH1dcjh1KwIb6dFqN6d8crb9S+kuxsmsbUMReBcJMCs6hoYJ5mo5W0pSi
	B2S3Ign5hqk/ovJD6aSY8Xwl8qEDeAWiqkDaayIHJW3uB/M1+NdE=
X-Google-Smtp-Source: AGHT+IE2u7qczij1wBlgQKaUU81dXj9yDW7X4GPevNqhah8CNOzAbaw1rIFFVwrDPly9NFgl77DrD9xWp6mSb02u6Xo=
X-Received: by 2002:a17:90b:4b50:b0:2ea:7a22:5390 with SMTP id
 98e67ed59e1d1-2ea7a319e89mr1365600a91.5.1731874436235; Sun, 17 Nov 2024
 12:13:56 -0800 (PST)
MIME-Version: 1.0
References: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn>
In-Reply-To: <18393666.6642.1931e8207af.Coremail.yubowei0982@phytium.com.cn>
From: Ed Tanous <ed@tanous.net>
Date: Sun, 17 Nov 2024 12:13:45 -0800
Message-ID: <CACWQX83vpXO_jNs1qnvEsd49smTQ9wrGjUapV01VJi2CJ-18hg@mail.gmail.com>
Subject: Re: BMCWEB debug question
To: =?UTF-8?B?5Za75p+P54Kc?= <yubowei0982@phytium.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Nov 12, 2024 at 2:39=E2=80=AFPM =E5=96=BB=E6=9F=8F=E7=82=9C <yubowe=
i0982@phytium.com.cn> wrote:
>
> Hello,pm
>
>
> Each time debuging a funcion of one line code will cost me too much time.
> 1.type "bitbake bmcweb",this action will cost me 5 minutes.
> 2.Replace bmcweb binary file.
> 3.reboot bmcweb.

First of all, the ideal workflow involves not building all of bmcweb
in your "main" work loop.  Write unit tests, and develop the unit
tests until you have confidence in your code.

If you have ubuntu 24.04 or newer, you can do this simply with:
# configure the project
meson builddir --buildtype=3Ddebug

# build the specific unit test
ninja -C builddir utility_test (replace with name of test you want to build=
)

# run the unit test
./builddir/utility_test

This loop on my machine takes about 90 seconds if I'm making edits to
the shared library code, and ~25 seconds if I'm only updating the unit
test code, which doesn't require a shared-file recompile.  This is
still too long (ideally it would be a few seconds), but it's
significantly shorter than your workflow now.

Once that is done, I will generally switch to qemu, which is faster to
boot up, and can test non-hardware changes quickly.

After that I will generally run on real hardware.

>
> This seriers of actions cost me too much time.I don't think it is a right=
 develop flow as a web engineer.Could u show me right way for debuging?
>
>
> The second question is that I didn't find any action relate with "meson s=
etup buildder && ninja " in bmcweb.bb.How does it work?how can I use =E2=80=
=9CIncremental Implementation=E2=80=9D to decrease waste time in action "bi=
tbake bmcweb" which cost me too much time.

Take a look at the meson.bbclass in yocto, and it will give you an
idea of how it works.
There's a tradeoff made here between binary size and link time.
bmcweb enables LTO, and builds most of the application logic into a
single library that's then static linked into the executable and the
unit tests.  b_lto controls this setting in yocto, and is disabled
implicitly in debug build types.  You could try both of these things
in your workflow and see if it's better.

>
>
> The third question.Dose bmcweb have Hot Deployment method?Must I replace =
binary bmcweb in obmc-phosphor-image for detectting writing result?

https://github.com/openbmc/bmcweb/blob/02c1e29fceae14aa5cb7a1b3d6bcaa4c0a25=
6f2e/TESTING.md?plain=3D1#L42

I suspect is what you're looking for?  bmcweb will happily run from
tmp, detect the "normal" binary running, and start on a different
port.  If you're really needing to make quick edits on hardware, this
is generally faster than loading a full image, but has some caveats.

>
> Dose it exist a function to detect result more convinently like npm run s=
erve in webui-vue,that is more convenient and more safe.It used proxy and w=
ill never replace binary file in obmc.

If you build with the instructions above, bmcweb will happily launch
from your desktop, although without dbus services, there's not a lot
you can test when running in that mode unless you set up more services
on your desktop (user auth, etc)



If you have any patches that would improve your workflow, please send
them to gerrit.

>
>
> Thanks!
>
>
>
>
> =E4=BF=A1=E6=81=AF=E5=AE=89=E5=85=A8=E5=A3=B0=E6=98=8E=EF=BC=9A=E6=9C=AC=
=E9=82=AE=E4=BB=B6=E5=8C=85=E5=90=AB=E4=BF=A1=E6=81=AF=E5=BD=92=E5=8F=91=E4=
=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E6=89=80=E6=9C=89,=E5=
=8F=91=E4=BB=B6=E4=BA=BA=E6=89=80=E5=9C=A8=E7=BB=84=E7=BB=87=E5=AF=B9=E8=AF=
=A5=E9=82=AE=E4=BB=B6=E6=8B=A5=E6=9C=89=E6=89=80=E6=9C=89=E6=9D=83=E5=88=A9=
=E3=80=82=E8=AF=B7=E6=8E=A5=E6=94=B6=E8=80=85=E6=B3=A8=E6=84=8F=E4=BF=9D=E5=
=AF=86,=E6=9C=AA=E7=BB=8F=E5=8F=91=E4=BB=B6=E4=BA=BA=E4=B9=A6=E9=9D=A2=E8=
=AE=B8=E5=8F=AF,=E4=B8=8D=E5=BE=97=E5=90=91=E4=BB=BB=E4=BD=95=E7=AC=AC=E4=
=B8=89=E6=96=B9=E7=BB=84=E7=BB=87=E5=92=8C=E4=B8=AA=E4=BA=BA=E9=80=8F=E9=9C=
=B2=E6=9C=AC=E9=82=AE=E4=BB=B6=E6=89=80=E5=90=AB=E4=BF=A1=E6=81=AF=E3=80=82
> Information Security Notice: The information contained in this mail is so=
lely property of the sender's organization.This mail communication is confi=
dential.Recipients named above are obligated to maintain secrecy and are no=
t permitted to disclose the contents of this communication to others.
