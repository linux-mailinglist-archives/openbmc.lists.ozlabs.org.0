Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91941658ABC
	for <lists+openbmc@lfdr.de>; Thu, 29 Dec 2022 09:56:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjMh56wvjz3c63
	for <lists+openbmc@lfdr.de>; Thu, 29 Dec 2022 19:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D56q6hHZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e31; helo=mail-vs1-xe31.google.com; envelope-from=milkfafa@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D56q6hHZ;
	dkim-atps=neutral
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjMgX0FL8z2yyZ
	for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2022 19:56:06 +1100 (AEDT)
Received: by mail-vs1-xe31.google.com with SMTP id m2so17818370vsv.9
        for <openbmc@lists.ozlabs.org>; Thu, 29 Dec 2022 00:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdi5JNQLgXGQ66qKu+yMeeWn88rw9Bky4W1XebdlBEw=;
        b=D56q6hHZtVDkrih3nWz96tO0tf1ETJTioa9UJmFtlGOcgLwyVcG0N4bT7abG4iHyTK
         taiOmgzI3/MFU25z/6eACBHBsm0ZUcykUQVJedq9U4CbMYzDxArIv72uYbCo95e4/iK0
         SLxlYWW6Ouq817lvgU6TGpvSl58TdyfDCYYw5vweZ9+y8yHvhRA0JpOCyYo3NedDFKG9
         dx/8A2MIwQqYB4pFcohP8C9/DnmuhH7rjBBMQERFgYCgqkcAf3dnPuNii/PSvymQVGi7
         LCIrQE0ZUI0cygqCW74rY1+eIjvRnYWR5H73K5ndrQNTj46Lj6x4hT8v6ObhbgQddN//
         DMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdi5JNQLgXGQ66qKu+yMeeWn88rw9Bky4W1XebdlBEw=;
        b=ccCaBCB6rwPVvQrxSdD3FJoGXGLBZchYJNdvbZtinz3UARIv13M1MEZnnaHCDW8c0y
         vJYMEQH8IwD+t9RsxUfdbHntZlvT6wCtQbuDynknp5FK5yB1dofo7nE+//z1UEy3yiD+
         4z7HstmDHaotAMGq6d/i8JlTDbeu5zhJy7r0zcXe+GkrtRgrutu6gFpxnOZwRgFFD/o3
         CGC3lHeMoTQdg9lzOhbSBekopkPo8XXm0r3I1bazWXN5eAay+4NhocXvzcNHUEnfLd2s
         IZXFacYei2RDZiTHqpRyW6y/WlBt2qGOtqwNB/ohA0HhQFwTlEg1UlxhCBMc4glyNzCr
         909w==
X-Gm-Message-State: AFqh2krW/PQt5DWO6kkennPqNSYNFeFH4c/p16p7ufti6e4CrOV60FVl
	bz8VdZ0+gQL4UNMHuoBDLIiGxCyd1jCpfkNmpHY=
X-Google-Smtp-Source: AMrXdXvNrWrqy7ubjkhG7TGAHD6J4jDrQchAzhwTRpmi1zRv9eF8yToeWNw3Uhq9nGQovgVQ2fqq8ofaBMYifzcDReM=
X-Received: by 2002:a05:6102:f8c:b0:3c9:8cc2:dd04 with SMTP id
 e12-20020a0561020f8c00b003c98cc2dd04mr1182236vsv.73.1672304161401; Thu, 29
 Dec 2022 00:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20221227095123.2447948-1-milkfafa@gmail.com> <20221227095123.2447948-8-milkfafa@gmail.com>
 <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de>
In-Reply-To: <b8f173c0-6d40-d6aa-543e-fa8b06557f4f@molgen.mpg.de>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Thu, 29 Dec 2022 16:55:50 +0800
Message-ID: <CADnNmFr1naRfam=z0p-4hEugSDJy_HCK8XZyQJ0eFirnmwuH4A@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] media: nuvoton: Add driver for NPCM video capture
 and encode engine
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
Cc: kwliu@nuvoton.com, tmaimon77@gmail.com, devicetree@vger.kernel.org, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, andrzej.p@collabora.com, robh+dt@kernel.org, linux-media@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl, mchehab@kernel.org, kflin@nuvoton.com, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Paul,

Thanks for the review.

> > Add driver for Video Capture/Differentiation Engine (VCD) and Encoding
> > Compression Engine (ECE) present on Nuvoton NPCM SoCs. The VCD can
> > capture and differentiate video data from digital or analog sources,
>
> =E2=80=9Cdifferentiate video data=E2=80=9D sounds uncommon to me. Am I ju=
st ignorant or
> is there a better term?

How about "The VCD can capture a frame from digital video input and
compare two frames in memory, then the ECE will compress the frame
data into HEXTITLE format", is it better?

> Wich VNC viewer and version?

I used RealVNC version 6.21.1109 to test.
Do I have to add this information in the commit message?

> Maybe also paste the new dev_ log messages
> you get from one boot.

Do you mean dev_info/dev_debug messages of the driver?
If yes, I get these messages from one boot (only dev_info will be
printed in default):

npcm-video f0810000.video: assigned reserved memory node framebuffer@0x3300=
0000
npcm-video f0810000.video: NPCM video driver probed

> It=E2=80=99d be great if you noted the datasheet name and revision.

I can note the datasheet name and revision in the commit message but
can't provide the file link because it is not public.
Is it ok with you?

> > +static unsigned int npcm_video_ece_get_ed_size(struct npcm_video *vide=
o,
> > +                                            u32 offset, u8 *addr)
> > +{
> > +     struct regmap *ece =3D video->ece.regmap;
> > +     u32 size, gap, val;
>
> Using a fixed size type for variables not needing is, is actually not an
> optimization [1]. It=E2=80=99d be great, if you went over the whole chang=
e-set
> to use the non-fixed types, where possible. (You can also check the
> difference with `scripts/bloat-o-meter`.

So what I have to do is replace "u8/u16/u32" with "unsigned int" for
generic local variables as much as possible.
Is my understanding correct?

> > +MODULE_AUTHOR("Joseph Liu<kwliu@nuvoton.com>");
> > +MODULE_AUTHOR("Marvin Lin<kflin@nuvoton.com>");
>
> Please add a space before the <.
>
> > +MODULE_DESCRIPTION("Driver for Nuvoton NPCM Video Capture/Encode Engin=
e");
> > +MODULE_LICENSE("GPL");
>
> Not GPL v2?

I'll correct them in the next patch.

Regards,
Marvin
