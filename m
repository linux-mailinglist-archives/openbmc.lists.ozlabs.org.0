Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB61D51B939
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 09:35:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv58M5nvrz3dtw
	for <lists+openbmc@lfdr.de>; Thu,  5 May 2022 17:35:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NLnXMSha;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=medadyoung@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NLnXMSha; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv51f4sDdz3cXX
 for <openbmc@lists.ozlabs.org>; Thu,  5 May 2022 17:29:41 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id w19so6035964lfu.11
 for <openbmc@lists.ozlabs.org>; Thu, 05 May 2022 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6Z3ugqzs69IZl2+sRBwHWpG9kKlwl5WbPNjhplCiidk=;
 b=NLnXMShaRN7PFstFtp8tEoVSOhftf8xxi0e83XfbK5BkN2iQ8x6cZgI8cOHrXkau6N
 QCfJH+/eiJeveTWsc/Wy4YmWIIDlcr3IDSOQXHB8LXW1qOgYWCq52+SmQQ4VQQdBNrj4
 6LwIQKCd6kqAdMSC4cHBaKQJIGP1MFrnrjRU0Pn5klIABxim8rvlc8nZbdFO9B67MrC8
 iSchmvzpQDBS7k2oRxryDg7m/Tjm5LT5A3Xo6lWFQOYPZpNX1ieE9oZsgiXaKgWOuiS/
 JE1SzzPfpZ7KWUpWof7vsPq0O/xAq3viH5rHjblyvfnM2t0IkX/k4du+kMlbaGzXxPEA
 TMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6Z3ugqzs69IZl2+sRBwHWpG9kKlwl5WbPNjhplCiidk=;
 b=245KgAwhubaCZA82S2zkqTk6u4lE2rGyIm6hv9rlo86S9zxC7T3LZp9YNmDyyQa90L
 Le60JauMbMQmeBh+W2xV0XvnYt/InsGtjpz6/UXuw1WzENTBOtj2nRSEzzhzdKaJiUj8
 pbhL6plR7gZeDTkEK88ulnUf5dcMtEidplx79rkguajEBXorDcorT+PdhAZep6dK1Tyj
 /G0blx5Nn4k0RNfjVHcMOV0tSp9wcmvGNQZ1U1iE3Tsg976TR+xYvyUIWDkWMDqHYa6A
 RV/UOCuhLE4DDoxTBrvjaAWJfwyPRLO+N8VfZdIialaBH0AhaxWyBEzpTra+xTB/+k8d
 OZBw==
X-Gm-Message-State: AOAM530ZUmP3aiJNNVdxf9I8bP4mk85iwRmRkX5wVO91XEZL3B2uxLEv
 yDIjVqmLQvV9L/uVphZHepQuUpew738/GkJhlxg=
X-Google-Smtp-Source: ABdhPJwWrkWiEJE8wFxjLWt23K89Z5Y+pMlvG1QF6O0ewp61J8ENn3UK3Mk3CGRcyf6V/ntmhPUqWSTVxcUQ2sMYgFo=
X-Received: by 2002:a05:6512:c03:b0:447:7912:7e6b with SMTP id
 z3-20020a0565120c0300b0044779127e6bmr17101977lfu.508.1651735776564; Thu, 05
 May 2022 00:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220503094728.926-1-ctcchien@nuvoton.com>
 <20220503094728.926-2-ctcchien@nuvoton.com>
 <776bb807-feba-7c75-d280-11c33e33f71d@molgen.mpg.de>
In-Reply-To: <776bb807-feba-7c75-d280-11c33e33f71d@molgen.mpg.de>
From: Medad Young <medadyoung@gmail.com>
Date: Thu, 5 May 2022 15:29:25 +0800
Message-ID: <CAHpyw9dJqzgf_LKD9cmumoPMCNX92Pd9+m5xxDwxoLsEyVX1gg@mail.gmail.com>
Subject: Re: [PATCH v8 1/3] ARM: dts: nuvoton: Add memory controller node
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
 Borislav Petkov <bp@alien8.de>, James Morse <james.morse@arm.com>,
 YSCHU@nuvoton.com, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Dear Paul,

Paul Menzel <pmenzel@molgen.mpg.de> =E6=96=BC 2022=E5=B9=B45=E6=9C=883=E6=
=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=885:56=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Dear Medad,
>
>
> Thank you for v8.
>
> Am 03.05.22 um 11:47 schrieb Medad CChien:
> > ECC must be configured in the BootBlock header.
> > Then, you can read error counts via
> > the EDAC kernel framework.
>
> Please reflow for 75 characters per line.

OK, I will reflow for 75 characters per line.

>
> [=E2=80=A6]
>
>
> Kind regards,
>
> Paul

B.R.
Medad
