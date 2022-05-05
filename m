Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8097D51B941
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 09:36:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv59k2yp0z3cC0
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 17:36:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BFRMgPCy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=BFRMgPCy; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv54Y2nB9z3dPX
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 17:32:13 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id h29so6077839lfj.2
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2022 00:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oB2KwW+fZDHqViOCO0SeVykq03oI7SrGtrTSNV/zeXw=;
 b=BFRMgPCyAxXKzFPzrX83J2MXIK6omEstm896Lx2iPA/ubW3FXufIIDGSpcw8nP7CfZ
 KT6VvMMcQWBRuio908uzwWeaZoaZF37iiYvkO9cu99FRdbR0RkWnJ/AsH6Bz3ptOkNC5
 9kq+ZBstRLXItzwWciuW4x1sGY9BNgrvGL5YDH8eCFf9VF9MJ+7AMoz5Ti3TPSpcKo7J
 SCqjV2razKzhfdKn1jwNKTN3W8e+110uqKe+UDoqurE1o07K8UnTvFMmgRQbpF/hqtl4
 hXWiO544ygw/QY3BDhL4KzQP6+9CyF4G5ox7dFLLFzCaucoNe4kPJOOBSk1Srlly+IfH
 6nRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oB2KwW+fZDHqViOCO0SeVykq03oI7SrGtrTSNV/zeXw=;
 b=zzNyWwIRam44YLY5IvltmQF27skrvVwUH6P+wq/SYdV1Y66o5/yPfM+ea9fbUmv6UR
 FfIlP7nJaH+4K6XM2oOlx2wtevjJbI9qLrCe+CMLkr+aKiXPgBSL/fXcFVwBKEKuTLJO
 52o6fpA1ceGN88f7S6LGwADCpOXA+EMkTi3oe1nNZzxw7f9B4P39YrMaCNGRrL90iE2e
 lDcQred3d7Km6uKpUmU6dEezB9pIHvC82Bz+8/8Ie8lfCFxWtM7av+MRkMC5ttsLe7qL
 Z8AoA212WYEVZe/BtSSvb7O0bq0hHwqpkqbtL/IzzYkhvJ7jbrSdRkQygYn8RzF8Eico
 4Hxg==
X-Gm-Message-State: AOAM530c0z5yNmPtTZsBFsJno51volohDP/z6l+kl6tpqmHqG36NX43L
 WFtd0ShYrQYSXulbqIg8t0EXkZ1P+gjUKI9OHFE=
X-Google-Smtp-Source: ABdhPJxdjK58CQrmJIEecoD5ChKmpWmyR/5zI/i8u9leJjHYWUtdHJ1LEMyH3OIqMm8fbt5BxCCWR/FljHxYpu4pjwA=
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id
 z3-20020a0565120c0300b0044779127e6bmr17108146lfu.508.1651735928726; Thu, 05
 May 2022 00:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220503094728.926-1-ctcchien@nuvoton.com>
 <20220503094728.926-2-ctcchien@nuvoton.com>
 <YnEAtQQ6Wnacfrub@zn.tnic>
In-Reply-To: <YnEAtQQ6Wnacfrub@zn.tnic>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 5 May 2022 15:31:57 +0800
Message-ID: <CAHpyw9dz-P76ioNoZJPty0A_iHcw6Yx_z1S01E9+xWou28BeUg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: dts: nuvoton: Add memory controller node
To: Borislav Petkov <bp@alien8.de>
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
Cc: KWLIU@nuvoton.com, tony.luck@intel.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, KFTING <KFTING@nuvoton.com>,
 Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Tali Perry <tali.perry1@gmail.com>,
 devicetree <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 James Morse <james.morse@arm.com>, YSCHU@nuvoton.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Borislav,

Borislav Petkov <bp@alien8.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=883=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=886:15=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 03, 2022 at 05:47:26PM +0800, Medad CChien wrote:
> > ECC must be configured in the BootBlock header.
> > Then, you can read error counts via
> > the EDAC kernel framework.
> >
> > Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> > Reviewed-by: Borislav Petkov <bp@alien8.de>
> > Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>
> I don't think you understand the concept of Reviewed-by: tags. You
> may add them to a patch of yours when the reviewer gives them to you
> explicitly - not because she/he has given comments to a patch of yours.
>
> Please go over
>
> Documentation/process/
>
> and Documentation/process/submitting-patches.rst especially and then
> send patches.
>
> Thx.
>

Sorry, I did misunderstand  the concept of Reviewed-by: tags.
I will revise
thanks

> --
> Regards/Gruss,
>     Boris.
>
> https://people.kernel.org/tglx/notes-about-netiquette

B.R.
Medad
