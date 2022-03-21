Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 197324E2FFF
	for <lists+openbmc@lfdr.de>; Mon, 21 Mar 2022 19:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMjnp0Ctkz30Ld
	for <lists+openbmc@lfdr.de>; Tue, 22 Mar 2022 05:29:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=K/auwkg5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=avifishman70@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=K/auwkg5; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMjnN2PFqz3036
 for <openbmc@lists.ozlabs.org>; Tue, 22 Mar 2022 05:29:11 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id l20so25946942lfg.12
 for <openbmc@lists.ozlabs.org>; Mon, 21 Mar 2022 11:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QJZE8dkCUnUnco1V96yxtmClw0LriXyfY1+6Wy3W2Cc=;
 b=K/auwkg58bis+KPUyv2LucN9+M2eugoOwqQbdSPyxV/O+vsw08julPiPq/JKG/QQF4
 hvUsNny4SYaI3irAM2JnrqK/hUchdS6UHbb4A/+vIx2bY9vQMubluIWrsAVCgJtmIgHn
 nXN2WsRp5E+YMeuZNUwRfMWVL+XKgduggKhmZILxvMjCY7zYW9H3evS0m5ZZ3h3A8zIK
 JKzoJO/vUuCBEPzXyuqb5jA6ogKNsDGhPS1zv0mD4shTBcJ35k5DChWFlhmdCDfhO33F
 Rg8UONAMbrIWNO6yPHVzVEnh06oZNQGdlkkzecccFiIY3Hqt6wPtS1zL6k9uHjydBf0S
 d+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QJZE8dkCUnUnco1V96yxtmClw0LriXyfY1+6Wy3W2Cc=;
 b=Dpv9brpIss8OVHv+nmNJCeO+zocoy5wtaePb0AXlBdAi3/dnJjhL+KkxsxTF4sE24Z
 1LP6GA6klClHWwilWPXO4zW7UYPqPw3cqGEm7/utACo2zoYhxEUN+LXcxDKv+IIHx/qO
 qMLucPFXlxlxi4k3LKdbV7ATvxy0hHYacDYc4fFUWQ+DmOPjtaDHm6gDguMxrwDEHfnR
 Njn/LK7DarzbCyCdPzX9glyKjqcHcKD4lBabQga+neVQC072E+fMQHexr1CKReYEhQU7
 DheW121hJrcckfeMni6tPCxjmBz1R/vK2yyd9Snhx6iaAuYYYF+06sZMqrrEYDgp86aN
 adJw==
X-Gm-Message-State: AOAM533zW8/bDc2EABTm9FQIIR6+xFtNXXR8Pk6hRFhtflYlfMX/C5TI
 t/A7/LBe24dVoepKP9OygdsKLuO5g+BM5pHRng==
X-Google-Smtp-Source: ABdhPJwXvLHLay8erHVCVarSzPk3KZSKXrgZr/Qo7BnjPvJl91SNmZ0JLwo1w/mYrxtHRGimXzrK+jroSI6bBTB7WGQ=
X-Received: by 2002:a05:6512:3b2c:b0:44a:35fd:994c with SMTP id
 f44-20020a0565123b2c00b0044a35fd994cmr1302459lfv.473.1647887343882; Mon, 21
 Mar 2022 11:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220317015854.18864-1-ctcchien@nuvoton.com>
 <20220317015854.18864-4-ctcchien@nuvoton.com>
 <37361667-C932-4139-B649-52DE029BDEE5@alien8.de>
In-Reply-To: <37361667-C932-4139-B649-52DE029BDEE5@alien8.de>
From: Avi Fishman <avifishman70@gmail.com>
Date: Mon, 21 Mar 2022 20:28:51 +0200
Message-ID: <CAKKbWA66rdm11fM2eWpQpSW2aCfFn-9OwJNNN4J2Q4rE2H4vEw@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] EDAC: nuvoton: Add NPCM memory controller driver
To: Boris Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: KWLIU@nuvoton.com, YSCHU@nuvoton.com, rric@kernel.org,
 Benjamin Fair <benjaminfair@google.com>,
 linux-edac <linux-edac@vger.kernel.org>, Patrick Venture <venture@google.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, JJLIU0@nuvoton.com,
 ctcchien@nuvoton.com, Rob Herring <robh+dt@kernel.org>,
 Tali Perry <tali.perry1@gmail.com>, KFTING@nuvoton.com,
 devicetree <devicetree@vger.kernel.org>, tony.luck@intel.com,
 James Morse <james.morse@arm.com>, Medad CChien <medadyoung@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Mar 17, 2022 at 2:50 PM Boris Petkov <bp@alien8.de> wrote:
>
> On March 17, 2022 1:58:54 AM UTC, Medad CChien <medadyoung@gmail.com> wrote:
> >Add support for Nuvoton NPCM SoC.
> >
> >Signed-off-by: Medad CChien <ctcchien@nuvoton.com>
> >Reported-by: kernel test robot <lkp@intel.com>
>
> What exactly has the robot reported here?
>
> >---
> > drivers/edac/Kconfig     |   9 +
> > drivers/edac/Makefile    |   1 +
> > drivers/edac/npcm_edac.c | 710 +++++++++++++++++++++++++++++++++++++++
> > 3 files changed, 720 insertions(+)
> > create mode 100644 drivers/edac/npcm_edac.c
>
> I don't see a MAINTAINERS file entry so that people can Cc you on bugs. See the other EDAC drivers for an example.
>

see in MAINTAINERS:
ARM/NUVOTON NPCM ARCHITECTURE
M:      Avi Fishman <avifishman70@gmail.com>
M:      Tomer Maimon <tmaimon77@gmail.com>
...
F:      drivers/*/*npcm*
F:      drivers/*/*/*npcm*

Isn't it OK?

> --
> Sent from a small device: formatting sux and brevity is inevitable.



-- 
Regards,
Avi
