Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E30234CB1DC
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 23:10:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K87bB0fCTz3bw6
	for <lists+openbmc@lfdr.de>; Thu,  3 Mar 2022 09:10:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UeBgR12A;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b;
 helo=mail-vs1-xe2b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UeBgR12A; dkim-atps=neutral
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com
 [IPv6:2607:f8b0:4864:20::e2b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7vF45lS5z3bYY
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 23:53:43 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id y4so1707402vsd.11
 for <openbmc@lists.ozlabs.org>; Wed, 02 Mar 2022 04:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=+Ikj6nSRW/83wAf8afXGAgsjyXlLyHwdFoow7ohi4CA=;
 b=UeBgR12APOHtLPpa0zXQWvvdUaqMRKijI8g5p/mpjKyeBdqZhOu1GBuyNOXylcM96T
 oLFjeniEtxytH8/srESWhLAZ6OXjOezrU9mERuY/yg4Dtebs19wic9MKE0+Gw5d6uuOG
 MssH5VSOIoTqvuJt4WbIxARibIBRaD2HK+r7IfFmjgKTvnrTdvNrqDMFn6n5Rnvb+dEL
 NmIS3UXbjaIyNXsQgJ54FsGwPR4qyzezC/y+L7LKyPXCfYwrYVdZAl15nvOqPldnkotx
 5GebsW5IVElNnfHg2jvccyAYg5YsDdy8wnEcTJWfdeWUODcuGRI1tCBHruxCwAmpRZrO
 faww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=+Ikj6nSRW/83wAf8afXGAgsjyXlLyHwdFoow7ohi4CA=;
 b=Cg86gPpPCnIWYXRsqrMG7FwD31OHB1QJLaJtnTY5YfleUslXkcDEjOwNElsSBmEGX0
 2hh+cSf/YFIAiHRv1+m11CMg6HCAYjojjQnac3JeRbB9YYpv1vfYDnQUMde2JY30di4+
 QoZ8sJsCtQgnEj2oM2XvjUC8wLvtdKUfPmt9PgoLXkp5uKprqPhidcs6lh6JBSrod/M4
 wV7lID4jAopOv3zz/p3fEYU0fkWWyib1sDWrk9pTOhOU2ocMKxOSTIlBDlcql755j2cS
 6Iy4rrTCjG3UWlzMRV49qxj7xdsuV1UyyvS2yAzZC/QfGa7QxBFgsAf3K6MBSBImLQK/
 jdCA==
X-Gm-Message-State: AOAM530EULuXY8+wGgziwjBJgQsoXXWxS32vXbNYUTp5ynbjed+KQ32u
 7GPfyJjaxlDEVY3OPaxeNBnP2F3TnppoRVeabg==
X-Google-Smtp-Source: ABdhPJwTl6o4n3ZiUFNOKRW+dr9GCbZ5z70Ms3ll+1CcGAyZvwH9YO0ObjYUMZbhQ1TBIqRqsT6qzfnRwllIuoAuHMc=
X-Received: by 2002:a67:d319:0:b0:31e:98fd:31b0 with SMTP id
 a25-20020a67d319000000b0031e98fd31b0mr6452889vsj.47.1646225621566; Wed, 02
 Mar 2022 04:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
 <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
 <5ce0f6a6-4a5f-4f25-3cc6-ab0f24bf15cf@canonical.com>
 <CACD3sJaWJMFgwzQgrHFV0KkkbJXzhgFx=umywxSrLszwP+hO2w@mail.gmail.com>
 <Yh536s/7bm6Xt6o3@ninjato>
In-Reply-To: <Yh536s/7bm6Xt6o3@ninjato>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Wed, 2 Mar 2022 20:53:29 +0800
Message-ID: <CACD3sJboyA_wV_eiivfbHR527Y3E6z3NRmhiDzegk=fcw+nZ9w@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 semen.protsenko@linaro.org, yangyicong@hisilicon.com, jie.deng@intel.com, 
 sven@svenpeter.dev, bence98@sch.bme.hu, christophe.leroy@csgroup.eu, 
 lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, digetx@gmail.com, 
 andriy.shevchenko@linux.intel.com, tali.perry@nuvoton.com, 
 Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, 
 JJLIU0@nuvoton.com, kfting@nuvoton.com, openbmc@lists.ozlabs.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 03 Mar 2022 09:09:56 +1100
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your comment and it'll be addressed.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B43=E6=9C=882=E6=97=A5 =
=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=883:45=E5=AF=AB=E9=81=93=EF=BC=9A
>
>
> > I'll keep old code as fallback, if getting nuvoton,sys-mgr fails as
> > you point out.
>
> Yeah, fallback is much needed. And if you implement it, then you can
> also split the series into two. One for the DTS changes and one for the
> I2C changes. That would make upstreaming a lot easier.
>

Regards,
Tyrone
