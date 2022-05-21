Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA1C5308D0
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 07:32:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L65ZV4zyFz2yb6
	for <lists+openbmc@lfdr.de>; Mon, 23 May 2022 15:32:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JUAHcif5;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2c;
 helo=mail-vs1-xe2c.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JUAHcif5; dkim-atps=neutral
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53SP68L1z2ywR
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 22:53:56 +1000 (AEST)
Received: by mail-vs1-xe2c.google.com with SMTP id h5so2722605vsq.5
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 05:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ppjd92OlVB/MwGNt1qmR+MgTYt3GgGkBdJL3bf51wdM=;
 b=JUAHcif5tx1tsh8a9gOkhHOqrYPFKfupYtbTdOzIJkq8DfYK0/Z21ySt2t1TfrpqEH
 KsGTrg8Iau6UiiyYg2+i94lQcE/fRGC7VJyWcjm9T6Bx34VKYryJWrkyPVs++2IThb9L
 sSXLTpUpWZgI3X1yvvBgb8mP5Hxz+VWJm/d67G5Gm/tY05/8pHWd7f4jXlygSouAtcyA
 77vC70LozhWzjEl5r9JsSCPs7+U/Gj3nTJIGBzkmdlHmSoLsBY6bknQLmcqyq+/5oBgE
 W/KH4goKZkwIb6cvacuT/XBe/4HMHyjWlpdK3ShXvFgILx5kDFVGEH6IR1Qr9beu0toi
 BdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ppjd92OlVB/MwGNt1qmR+MgTYt3GgGkBdJL3bf51wdM=;
 b=eTAojeKjTHfuM8gI59xJuEEux1ZHgEjoq+XwWWUk63KUIi5efNNf+TbSMZ2WmoQYhN
 z15yqsXv5hIDbQgq20snIe5B1bZHfAKuibT/xlGA5NbjwRlCYyxRTdGrgmA3Yt9Ykwdf
 H9hdmYEuhXoXdmdcDRaucBcbv5vvaH+Jb3zuz7NzSLwHWHBJCYZkiJDWIdiwx4vX3WEc
 BXXRVDYWQHnvjBH3SclMD33mJOFfKtig2dhJGsYHA7+yfHnZR0HU2aucxGuC+j++wPJv
 LFunN7cg+TeLIapbIApyY0SXFDYwwRRw6HWPL34pFmPQ6DcHcJrfS2KSJRX1p38qoPZX
 HKlg==
X-Gm-Message-State: AOAM531GtEfDWmz/arcOchAMw+77GHQA5TOmWRWKi1EzzZUbQmsnSryX
 WRXOsrvxqf6PUi9+tbynZGwOqLeKwVbGLUsHYg==
X-Google-Smtp-Source: ABdhPJwogOGnDsSgDr+VBYrBTjLQWEj688uoqfvwo2KbNQeayXtr4cwnf42U1VjjRzlgShtbdXe2UHFhH1TP4DRzzG4=
X-Received: by 2002:a05:6102:3ec8:b0:335:d67e:7535 with SMTP id
 n8-20020a0561023ec800b00335d67e7535mr5759276vsv.47.1653137633399; Sat, 21 May
 2022 05:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-4-warp5tw@gmail.com>
 <Yoh9208mogGeWPYe@shikoro>
In-Reply-To: <Yoh9208mogGeWPYe@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 20:53:41 +0800
Message-ID: <CACD3sJa0adxqmzOV9OFz-XzYrtNUq-g=9E99mBWT=zo0RshwQQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] i2c: npcm: Remove unused variable clk_regmap
To: Wolfram Sang <wsa@kernel.org>, Tyrone Ting <warp5tw@gmail.com>,
 avifishman70@gmail.com, 
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
 yuenn@google.com, benjaminfair@google.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, andriy.shevchenko@linux.intel.com, 
 jarkko.nikula@linux.intel.com, semen.protsenko@linaro.org, rafal@milecki.pl, 
 sven@svenpeter.dev, jsd@semihalf.com, lukas.bulwahn@gmail.com, arnd@arndb.de, 
 olof@lixom.net, tali.perry@nuvoton.com, Avi.Fishman@nuvoton.com, 
 tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com, 
 kfting@nuvoton.com, openbmc@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 23 May 2022 15:30:44 +1000
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
Cc: jie.deng@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Wolfram:

Thank you for your help and review.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:51=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Tue, May 17, 2022 at 06:11:35PM +0800, Tyrone Ting wrote:
> > From: Tali Perry <tali.perry1@gmail.com>
> >
> > Remove unused variable clk_regmap.
> >
> > Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller dri=
ver")
> > Signed-off-by: Tali Perry <tali.perry1@gmail.com>
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>
> Applied to for-next, thanks!
>
> I dropped the Fixes tag, doesn't look like a bugfix to me.
>

Best Regards,
Tyrone
