Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC77E7B6872
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 14:03:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a+Kx0Dg3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Gg92TZYz3cCh
	for <lists+openbmc@lfdr.de>; Tue,  3 Oct 2023 23:03:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=a+Kx0Dg3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::934; helo=mail-ua1-x934.google.com; envelope-from=milkfafa@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Gfb090gz3c3D
	for <openbmc@lists.ozlabs.org>; Tue,  3 Oct 2023 23:02:45 +1100 (AEDT)
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-7b0a569e2f5so365736241.3
        for <openbmc@lists.ozlabs.org>; Tue, 03 Oct 2023 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696334562; x=1696939362; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hd+Lx4aRlWvSHrfg7WOKO3naulywUKZrNYQIafJkcZY=;
        b=a+Kx0Dg3Zm6YIFiwa/CnWGJ4Fn8BI98TvJUOMquhOLUebP07+sHMZLGQYK2HW2vH1L
         dOsVgqJ27LfQwFJbZg006wmKgHzJLaMkQM5/ie3IlA3lX0vIHp2nhj6sXkRpR6HPj1pn
         Qzb3w1tvw2ImsHxbKfszQo+qQmqsSvhcHKIpTqeopHo3pXv3LW7Y4wKjQppkrguatLhl
         +CSKlEZ2EBQ3lqw9SnSf8lPzD0184yHaEos1wdTEfu4QQEsjVFGSbwiexHPdci8x3vCn
         g4jjGha1eu0HFnhsoTQgsjpZH8wsIzNVHSZ7N+ipjM3LchqWaCQ85VT/gvUOhSNXtNmH
         gW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696334562; x=1696939362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hd+Lx4aRlWvSHrfg7WOKO3naulywUKZrNYQIafJkcZY=;
        b=wNez+ZzMTM2+gaVp9uAp2JNY0HbQ+J1oBNeAjGDzGFbqL9YHyZPBYyLx8PxWh300lO
         2uXvY1LVONjVp18kqtDF/N7TupMSCuqu1PIRWAecywMxZ7wpXYmJGkVymMOim+OXXgOr
         w52/7xt7JNxWNN0zLA1AeVE/1m7oUpK+OMmLfjyggJwzE1zZYdlKUmqWRvIn+LdlTZN8
         Pu8EDzYTJAaUguTThLpT387zLjUo0VaBo12OY6GgDU3Wv4HuYAlpQvYetsPLMA6wX3ik
         umdHyIZ+FoRn79qd5tFTpcWEaU8s3NPIeVNXHVDlYE3k9CisVQhQuUjNr18y3csO6HP3
         ie5g==
X-Gm-Message-State: AOJu0YxeGWH0/D6Ux31VrYQuHtgQhx5ZioVj7dcu6NtXCmyuVujErZ6C
	2SzudW5T9ygz8n9OifF8q290YUkSjMmbryhULRA=
X-Google-Smtp-Source: AGHT+IGOT9AKk8fOpDGE1BJjc5REY867ya8oL5vBldAPtRvtWYbriuyP4mFkPCks4+SF+1iN1hdnmk3qgxyz6muVB34=
X-Received: by 2002:a1f:d8c4:0:b0:490:e790:a15b with SMTP id
 p187-20020a1fd8c4000000b00490e790a15bmr11034494vkg.10.1696334561880; Tue, 03
 Oct 2023 05:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
In-Reply-To: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
From: Kun-Fa Lin <milkfafa@gmail.com>
Date: Tue, 3 Oct 2023 20:02:33 +0800
Message-ID: <CADnNmFrOeGxUL1U9eJngKpMpoVVZXN4Owxxo9Ee18tEYxZ6FhQ@mail.gmail.com>
Subject: Re: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Joseph Liu <kwliu@nuvoton.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Marvin Lin <kflin@nuvoton.com>, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Dan,

Thanks for the patch.

> The of_parse_phandle() function returns NULL on error.  It never returns
> error pointers.  Update the check accordingly.

Commit message contains some redundant whitespaces.

>
> Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
> index ac8d73b794d3..b9e6782f59b4 100644
> --- a/drivers/media/platform/nuvoton/npcm-video.c
> +++ b/drivers/media/platform/nuvoton/npcm-video.c
> @@ -1660,9 +1660,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
>         void __iomem *regs;
>
>         ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
> -       if (IS_ERR(ece_node)) {
> +       if (!ece_node) {
>                 dev_err(dev, "Failed to get ECE phandle in DTS\n");
> -               return PTR_ERR(ece_node);
> +               return -ENODEV;
>         }
>
>         video->ece.enable = of_device_is_available(ece_node);

Others,
Reviewed-by: Marvin Lin <milkfafa@gmail.com>

Regards,
Marvin
