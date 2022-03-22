Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D704E44E4
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 18:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNJB91P4gz308F
	for <lists+openbmc@lfdr.de>; Wed, 23 Mar 2022 04:19:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J29nEJua;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J29nEJua; dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNJ9p3Q9xz2xts
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2022 04:18:52 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id q5so24847430ljb.11
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 10:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=RTM8YUH/16l7EmtQcBgSO7BwZNaXuM1GsNHw5TU8YMA=;
 b=J29nEJuaabNwiyFtO8XZPJKmEU9lbA8VGTBj0axXaQD+gTYL1YKfUAADfwV/o/lH8o
 wRmlmmOVhmigITYeNYkxvKqC1BmEQ8TT7w2jnw6P4bHYJqs30SY0R9jl953jv2p00H/1
 0+tmBnmJOmrY4v4vb2xjA5lMl3pjnCv9DYZFQ/BI5ZAlwbJNuvnxbEXjWL53tNCMaPL2
 BbK893Os0K1j3Bj1/igfs65CzEV8BGVA6Y7JTd0qE6plW2BdV4BeNSTmnnnKCqlRLYKl
 9+vdcIStLRNz04/cWIrq+DhMCXoKhlyb+sDtos9t1bZLSBhWPbktKKFGfO2OtkSYNoqg
 iv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RTM8YUH/16l7EmtQcBgSO7BwZNaXuM1GsNHw5TU8YMA=;
 b=JNMdlamtU1KdPGv0gF8hj1ZFLceWETG+sCw+Wni7xOdeQGu7w/8mDV2yRISSazye96
 uLps0J+jhyqDDIEZxVBTabfZw5QGNefNZuH0VYAOl09taOvvNHaFSf0NnTRt6PmzKMm8
 QnFO3lx39I8iV5+64h6o3yWB3DW7zOBCOzo2+MS5f6vgmZVC8pVrvyNgWRta+EgAHwFN
 1LOFWQOp2bGQ0xzqnPxaGAXJoiKd5Gavwebe5wgc2AUs0na+fnycgqZrrxX011mJRs8B
 xUiOaPBjn+XV+yDvghQba2GhL8KTlgCwCkMF5Zl0QyRb5MWWoiNulUcdi7J1AO+H+jws
 Oz1w==
X-Gm-Message-State: AOAM5338dRl25IWsVQ5NCuUCIW0YnLdxrOANDg3gBDNOo9z/yJFTN1xZ
 EpZuA2LLTSrUls1ysqPM7cxH+8hOEy/o8p2l1Q==
X-Google-Smtp-Source: ABdhPJymIl3mnNzrBExxaC0P2tRc8nbab8mz9t2Jc0bzsAMqP+1Rv0yxtuHSGMSJ0/8LnAfqx+/tcAL9uimcF+hNheg=
X-Received: by 2002:a2e:505b:0:b0:248:1fc:68e9 with SMTP id
 v27-20020a2e505b000000b0024801fc68e9mr20172432ljd.206.1647969525404; Tue, 22
 Mar 2022 10:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220303083141.8742-1-warp5tw@gmail.com>
 <20220303083141.8742-9-warp5tw@gmail.com>
 <YiCZlhJoXPLpQ6/D@smile.fi.intel.com>
 <CAHb3i=t+Ai3w5mMhmZxxMsD7Zv0xpM4ZicMCmdDMtVn_OMbWYA@mail.gmail.com>
 <YiDNdlEKqorDFkZB@smile.fi.intel.com> <YiJ5unrCb82ZMV4Z@latitude>
In-Reply-To: <YiJ5unrCb82ZMV4Z@latitude>
From: Avi Fishman <avifishman70@gmail.com>
Date: Tue, 22 Mar 2022 19:18:34 +0200
Message-ID: <CAKKbWA4quvDbHWBdckAsKe65fDXXe8M-9CsjaP=4wsA=-NnULA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] i2c: npcm: Correct register access width
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, KWLIU@nuvoton.com,
 Tali Perry <tali.perry1@gmail.com>, Linux I2C <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benjamin Fair <benjaminfair@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Tomer Maimon <tomer.maimon@nuvoton.com>,
 devicetree <devicetree@vger.kernel.org>, bence98@sch.bme.hu,
 Arnd Bergmann <arnd@arndb.de>, sven@svenpeter.dev,
 Rob Herring <robh+dt@kernel.org>, Avi Fishman <Avi.Fishman@nuvoton.com>,
 Tyrone Ting <warp5tw@gmail.com>, yangyicong@hisilicon.com,
 semen.protsenko@linaro.org, jie.deng@intel.com,
 Patrick Venture <venture@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wolfram Sang <wsa@kernel.org>, kfting@nuvoton.com,
 Tali Perry <tali.perry@nuvoton.com>, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Mar 4, 2022 at 10:42 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:
>
> Hello,
>
> On Thu, Mar 03, 2022 at 04:15:18PM +0200, Andy Shevchenko wrote:
> > On Thu, Mar 03, 2022 at 02:54:27PM +0200, Tali Perry wrote:
> > > > On Thu, Mar 03, 2022 at 04:31:38PM +0800, Tyrone Ting wrote:
> > > > > From: Tyrone Ting <kfting@nuvoton.com>
> > > > >
> > > > > Use ioread8 instead of ioread32 to access the SMBnCTL3 register s=
ince
> > > > > the register is only 8-bit wide.
> > > >
> > > > > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controll=
er driver")
> > > >
> > > > No, this is bad commit message, since you have bitwise masks and th=
ere is
> > > > nothing to fix from functional point of view. So, why is this a fix=
?
> > > >
> > >
> > > The next gen of this device is a 64 bit cpu.
> > > The module is and was 8 bit.
> > >
> > > The ioread32 that seemed to work smoothly on a 32 bit machine
> > > was causing a panic on a 64 bit machine.
> > > since the module is 8 bit we changed to ioread8.
> > > This is working both for the 32 and 64 CPUs with no issue.
> >
> > Then the commit message is completely wrong here.
>
> I disagree: The commit message is perhaps incomplete, but not wrong.
> The SMBnCTL3 register was specified as 8 bits wide in the datasheets of
> multiple chip generations, as far as I can tell, but the driver wrongly
> made a 32-bit access, which just happened not to blow up.
>
> So, indeed, "since the register is only 8-bit wide" seems to be a
> correct claim.
>
> > And provide necessary (no need to have noisy commit messages)
> > bits of the oops to show what's going on
>
> I guess it's blowing up now because SMBnCTL3 isn't 32-bit aligned
> (being at offset 0x0e in the controller).
>

Hi Andy,
After this clarification can you please acknowledge this specific patch?
If you think there is a better way to describe this, can you propose one?

>
> Jonathan



--=20
Regards,
Avi
