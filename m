Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F294BEF45
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 03:21:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2jbG1kQlz3bSx
	for <lists+openbmc@lfdr.de>; Tue, 22 Feb 2022 13:21:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P1GYRFZQ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::931;
 helo=mail-ua1-x931.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P1GYRFZQ; dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com
 [IPv6:2607:f8b0:4864:20::931])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2FWN1Jtfz2yJw
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 19:16:29 +1100 (AEDT)
Received: by mail-ua1-x931.google.com with SMTP id 10so7547525uar.9
 for <openbmc@lists.ozlabs.org>; Mon, 21 Feb 2022 00:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9ZtiehFZPrmpWvveDKWHT6rZBAs1vzApL4d4uaQ55HM=;
 b=P1GYRFZQeNPXDzMXWJMxK1Yx5Aiz56hvaICJRp4ELbWmjcvC2CljnRwc/RkSBLwm8C
 TvcnGVTln6qK7UEbtJb9Q784S9w0JvfjCLBlD99ydBcfj2HEXUa4/SRKzvw9gUXFPqUM
 e4jWTf4H0mAw8dE8PqxzIciBHPF4Y8x2AYqK+RIDZBA+7NcDreAWaUiCe+skZFOps1RA
 ThBwCqO4Ruxw2Vd/8MhEVA/9dOAcrjDUSmMkgaF36az5l/0DMjdbmH04n5uhdkaFgf31
 Z0L3V+iR9uJjo+wfRWUWd4IheeWR0FOC7u2J1mqrYLBCJaL9YZ7pvC0cfJeYvIARTgAB
 kLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9ZtiehFZPrmpWvveDKWHT6rZBAs1vzApL4d4uaQ55HM=;
 b=7VHB8dKiCtN/2dd7/wSg0bNzM2MMsUBFe1oVILodaOMr4BAJU+QGRlyToyT5UELz3C
 QxQQ4HFu3zh6GyS3Qp6l8w4RYsmro2znJlly69wRc9wa/D8bA3zJMXNu93/21Sb5rnSK
 F4HTKrRe7jY/zFFFQN/KLY/dDPo2EH2OoWYvNLx1+kz5vt3BQqzcB8AguMXpsJka5roA
 4Kid7dW7K1R/Jn6L/kgwKiUQKB/ALCduYvfFE9/T+7n9p6Fyt08PzhtFC5YTCFBEJRuu
 TitM1wGP8npZIDUlX3RjGWaJm1G23fcYQLI2QBRey/AI8dJhRfsiWVoOnprG+/TEuiTZ
 CM8Q==
X-Gm-Message-State: AOAM532c5RHEOJmPM5Jcg01GETPZAZvYQzkAtZ+Oee+ivj0yFZ4ERoqa
 OSPao2XON5v0xIg0DbLYomD3B5hwOI8sAVvG9Q==
X-Google-Smtp-Source: ABdhPJyCMqtc8yHa/Q//l3WPGW/u7LD/b3KNuHBI4Tjjh+j6t4LGe5SjDXAiedVRJD5oqBZFsxBlyHaEwvCXTA8W/yw=
X-Received: by 2002:a05:6130:388:b0:342:b8e5:15c2 with SMTP id
 az8-20020a056130038800b00342b8e515c2mr580343uab.85.1645431386642; Mon, 21 Feb
 2022 00:16:26 -0800 (PST)
MIME-Version: 1.0
References: <20220220035321.3870-1-warp5tw@gmail.com>
 <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
In-Reply-To: <5d507fda-525e-4064-3add-0bb0cc23d016@canonical.com>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Mon, 21 Feb 2022 16:16:14 +0800
Message-ID: <CACD3sJaXeWLu6=oLgxJcU9R+A1J+jB7xKaGcDFwYxof33yj17Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] i2c: npcm: Bug fixes timeout, spurious interrupts
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 22 Feb 2022 13:21:12 +1100
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
Cc: tmaimon77@gmail.com, devicetree@vger.kernel.org, tali.perry1@gmail.com,
 linux-i2c@vger.kernel.org, digetx@gmail.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, JJLIU0@nuvoton.com, christophe.leroy@csgroup.eu,
 lukas.bulwahn@gmail.com, tomer.maimon@nuvoton.com, KWLIU@nuvoton.com,
 bence98@sch.bme.hu, arnd@arndb.de, sven@svenpeter.dev, robh+dt@kernel.org,
 Avi.Fishman@nuvoton.com, andriy.shevchenko@linux.intel.com,
 semen.protsenko@linaro.org, jie.deng@intel.com, avifishman70@gmail.com,
 venture@google.com, yangyicong@hisilicon.com, linux-kernel@vger.kernel.org,
 wsa@kernel.org, kfting@nuvoton.com, tali.perry@nuvoton.com, olof@lixom.net
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Krzysztof:

Thank you for your comments and please find my reply next to your comments.

Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> =E6=96=BC 2022=E5=
=B9=B42=E6=9C=8820=E6=97=A5
=E9=80=B1=E6=97=A5 =E4=B8=8B=E5=8D=885:30=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 20/02/2022 04:53, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > This patchset includes the following fixes:
> >
> > - Add dt-bindings description for NPCM845.
> > - Bug fix for timeout calculation.
> > - Better handling of spurious interrupts.
> > - Fix for event type in slave mode.
> > - Removal of own slave addresses [2:10].
> > - Support for next gen BMC (NPCM845).
> >
> > The NPCM I2C driver is tested on NPCM750 and NPCM845 evaluation boards.
> >
> > Addressed comments from:
> >  - Jonathan Neusch=C3=A4fer : https://lkml.org/lkml/2022/2/7/670
> >  - Krzysztof Kozlowski : https://lkml.org/lkml/2022/2/7/760
>
> How did you address the ABI change comment? I still see you break the
> ABI with the introduction of a new, required property.
>

I add the new, required property "nuvoton,sys-mgr" in the file
nuvoton-common-npcm7xx.dtsi.
The file nuvoton-common-npcm7xx.dtsi is required by the existing
upstream NPCM devicetree files.
It is also updated and committed in this patch set [PATCH v2 01/11]
arm: dts: add new property for NPCM i2c module.
Please let me know if I misunderstand the meaning of "breaking the ABI".
Thank you again.

>
> Best regards,
> Krzysztof

Best regards,
Tyrone
