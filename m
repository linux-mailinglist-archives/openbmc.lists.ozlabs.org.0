Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF9652A210
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 14:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bcW16BJz30Dp
	for <lists+openbmc@lfdr.de>; Tue, 17 May 2022 22:52:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ewqkajjv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e29;
 helo=mail-vs1-xe29.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Ewqkajjv; dkim-atps=neutral
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com
 [IPv6:2607:f8b0:4864:20::e29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Hxc16cXz30Dp
 for <openbmc@lists.ozlabs.org>; Tue, 17 May 2022 11:06:11 +1000 (AEST)
Received: by mail-vs1-xe29.google.com with SMTP id q2so17306985vsr.5
 for <openbmc@lists.ozlabs.org>; Mon, 16 May 2022 18:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PqfKXA6ummtQ+loFC+cW0O+uRd4VLSHz2ygvVnQgwiU=;
 b=EwqkajjvILngo/hPlj2gD1B0kZLe+HqgcsLrswamUj84PjcL8x5fFL8PyyMx/WPQyZ
 J8y037SO1wFqV7A7t8TRJBitoBuKP+qt+bCSzrhcKo79VN7VsKM3rT8HFAGoV6xlOdf/
 yeDSi3FJmV84SvF24GORUnCEJij9TXExClyVBx1l481rYPTphONONmk6tr0kI34GlXwp
 MygAf1aeauH5DfQh10gsfHK8YfpuszVX7RIDU8wIMj2A1rV6/u8dFzNqV4HeHwNFIAxS
 5oYyRsRYQ2Yg705cfpRhl7bjBDSM2KGSEn3tmrNR7ioSni3NF2DNc/+fumrg2jyGAZvA
 AYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PqfKXA6ummtQ+loFC+cW0O+uRd4VLSHz2ygvVnQgwiU=;
 b=g1wE1JhGiEz8NX2a7BMVKli1qyrEVFfFu8kulywiNNVq4UUBVtbTW4ih5Q/AV9nEJv
 hIEmQMXrmixqaiJJLNIG8bIuQd/9THbVUMDu27VwNa0jSHIK+T5o03Ac0KTeWQDBklMD
 nROdg8opZzZ4CS/vj1wvo3KrTjWeUyTjIhhm7HIdWKocha7OVKPQnNUADfh4rt3vYYTP
 EXpXZ+cgEBmuq6CbTV9WZnKyUZVQ+Dq6Zy/XAVh9eONc5YWZmbx1S5GpGGm4qF9MDdsy
 Lo/6DnijSZuCkUzMTZI+s8De4TBgB5EcfoYIzrFqKKwpdbCA4EeFL3+K/UUv5KUUYTRe
 PJsA==
X-Gm-Message-State: AOAM5319MB1QetP3rpJmy6ERSAPpHkPG1Bui/1rjfnWmYBRLllfqQYUL
 gt1LjfwEKA+nND5XQ63Z/Rfv/CeCqeYdmU15MA==
X-Google-Smtp-Source: ABdhPJyHd5SN+PJcKF3EF7zTD8roA8ERM0HTQe4FTb7vQj3gof9y61JaQmfxGfW5LVwLF5BKV3X/Dz4+dgmGOzY4HTw=
X-Received: by 2002:a67:cb98:0:b0:32d:6652:cedb with SMTP id
 h24-20020a67cb98000000b0032d6652cedbmr7824968vsl.29.1652749566894; Mon, 16
 May 2022 18:06:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220510091654.8498-1-warp5tw@gmail.com>
 <20220510091654.8498-3-warp5tw@gmail.com> <YoKqdfLSeJ69WFhi@kunai>
In-Reply-To: <YoKqdfLSeJ69WFhi@kunai>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Tue, 17 May 2022 09:05:54 +0800
Message-ID: <CACD3sJa3koHGsC3PBbfZuBhTfVHhjF=3g3YysxZ0+TvQ1qwfyA@mail.gmail.com>
Subject: Re: [PATCH v4 2/9] i2c: npcm: Change the way of getting GCR regmap
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, sven@svenpeter.dev, 
 jsd@semihalf.com, lukas.bulwahn@gmail.com, olof@lixom.net, arnd@arndb.de, 
 tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, tomer.maimon@nuvoton.com, 
 KWLIU@nuvoton.com, JJLIU0@nuvoton.com, kfting@nuvoton.com, 
 openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 17 May 2022 22:52:11 +1000
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
Cc: jie.deng@intel.com, krzysztof.kozlowski@canonical.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your feedback and here is my reply below.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8817=E6=97=A5 =
=E9=80=B1=E4=BA=8C =E4=B8=8A=E5=8D=883:48=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 10, 2022 at 05:16:47PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Change the way of getting NPCM system manager reigster (GCR)
> > and still maintain the old mechanism as a fallback if getting
> > nuvoton,sys-mgr fails while working with the legacy devicetree
> > file.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> Tyrone, your SoB is missing for all patches from Tali.
>

After reviewing these two links, we decided to keep only the author's
SoB for each commit.

https://lore.kernel.org/lkml/YiCZlhJoXPLpQ6%2FD@smile.fi.intel.com/
https://lore.kernel.org/lkml/YiCb7LNY9tmMCZx7@smile.fi.intel.com/

Best Regards,
Tyrone
