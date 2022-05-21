Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD4052FC93
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 15:10:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L53qj269Kz3bnY
	for <lists+openbmc@lfdr.de>; Sat, 21 May 2022 23:10:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MMm10EHw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92b;
 helo=mail-ua1-x92b.google.com; envelope-from=warp5tw@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MMm10EHw; dkim-atps=neutral
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L53qG6P1Wz3bks
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 23:10:17 +1000 (AEST)
Received: by mail-ua1-x92b.google.com with SMTP id q1so3809538uao.1
 for <openbmc@lists.ozlabs.org>; Sat, 21 May 2022 06:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=gY5YVxSZXZa4246xLEbiahVb0abGv5fP2xn0Bj47TQk=;
 b=MMm10EHw5NfVdmbzl5QnYyuVlnEypnTwmxnUjZrASRiX2RdolTkvhEPaQEtTnLzUcB
 ZPAuRWUOk+JmMv9bCijbs03VPBKqVtjZ7zq6h8L2C+h3o8rJT3OajJkR2cAaX5auDWCW
 +avBzKF5XDR+EziuGPLwVH/foFpjhWUxdS91ikc3apcg+i12qRKv9rzwBOjRNcNhBezU
 aYXJaFYNxGJXFmu0+EqfbFRLe+EaHYb4jbQ0NMowo3xV4VLAgCK54EguUwQZggvFLcMq
 7QuXzDy12eydEhmCkozNV9kXSyckNYYMHmeIUyUOkCP5dJOC4OTWamw8CWnWFI4OsfMj
 OziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=gY5YVxSZXZa4246xLEbiahVb0abGv5fP2xn0Bj47TQk=;
 b=sdD5OyiTyM/v6lOR6KSvjXzUR+JLuNCeaLvoL9wRKx2U/Qxf97xlyRu1kLE4X3Sfi+
 rUhYul5a6FNoVfLmBjWQ8GUMS16QJLpFzUm9pNLUPUpDQh0AZ0vwTA/ccjccH9z0DZDU
 hAuz9juGEduR0DxR2hOc3PVOfhejuHhlC4WHOjdzrmIkec/+BckNMQQS7hJSLWm4MSIP
 2qk/APerhRwwI0o2ggU+DaWGb8jy055almBsKfhUXEVF499gjlL/ZobAOp8wYxMcIObi
 HaW6Dji5D2wCE5JlAG5Az8JRbDsi6yw6VK5N6IbqqxaYEJUzO8NNTjNqw5S9J14wW89o
 f3gg==
X-Gm-Message-State: AOAM532YWSO65HFH8fiDesFMe7QH0Ir128QyydOsMz45pNov+V6p5eK/
 q+z1BHLffMuE51yR5ZfAmkCLM2WntP8o7g0/2A==
X-Google-Smtp-Source: ABdhPJxMM64PIFeMevBuR5+/jP8tWbXAUSF3xQaHJhxiF1PXLUgVCD+aHXQWr5I9X4Fu4iz9yZN9yRf/dfAQ0K4A0Y4=
X-Received: by 2002:ab0:2e90:0:b0:368:acd4:f2cd with SMTP id
 f16-20020ab02e90000000b00368acd4f2cdmr5227856uaa.116.1653138614398; Sat, 21
 May 2022 06:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220517101142.28421-1-warp5tw@gmail.com>
 <20220517101142.28421-10-warp5tw@gmail.com>
 <YoiAF3fcFJiH4nGP@shikoro>
In-Reply-To: <YoiAF3fcFJiH4nGP@shikoro>
From: Tyrone Ting <warp5tw@gmail.com>
Date: Sat, 21 May 2022 21:10:02 +0800
Message-ID: <CACD3sJb6OParLBQxe+JwcGRpnLfihFRLMOQWEwC_DJHrpzcr_w@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] i2c: npcm: Support NPCM845
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

Thank you for your reminder.

Wolfram Sang <wsa@kernel.org> =E6=96=BC 2022=E5=B9=B45=E6=9C=8821=E6=97=A5 =
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=882:01=E5=AF=AB=E9=81=93=EF=BC=9A

>
> On Tue, May 17, 2022 at 06:11:41PM +0800, Tyrone Ting wrote:
> > From: Tyrone Ting <kfting@nuvoton.com>
> >
> > Add NPCM8XX I2C support.
> > The NPCM8XX uses a similar i2c module as NPCM7XX.
> > The internal HW FIFO is larger in NPCM8XX.
> >
> > Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>
> Would be great to get an ack from one of the listed Nuvoton maintainers.
>

Best Regards,
Tyrone
