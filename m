Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE585829554
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 09:44:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ne3KHmJP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T91Z426qgz3bT8
	for <lists+openbmc@lfdr.de>; Wed, 10 Jan 2024 19:44:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ne3KHmJP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T91YR0LFxz30f8
	for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 19:43:53 +1100 (AEDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-55719cdc0e1so4335609a12.1
        for <openbmc@lists.ozlabs.org>; Wed, 10 Jan 2024 00:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704876230; x=1705481030; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBqz+NKkAhcga/7KbDtJF7MTdjSbEbQnaZUr3GeRp3U=;
        b=ne3KHmJPDLOYvdWG43LwpBBzvf/zpKlKP6XD/JkuF7uueQ4p69cMEO8HchHL0Vug6A
         oYxM8GVwzft4ELcfkik8Mj+Z/32Gb/Hw3b92uWkHDMnJ7/mxhwaf+ol8fiOY+K5x7kbL
         bT4ZxjI5uQYhLMTS7Btq92RyLVZjh+8YPlYjTSs1bkIYOkU8HxEfh7zGVnv+VivcbAqg
         nZzlVt5jtcI+Bl9nwjNu5xGLDocGnnhLkt3knY06ZJccisTgAC7s1c32mUvggnPfDSkP
         UT68xrF87ocjDtHr9GezmtCcMfNy7pFF7FPLppOkZuscUBhcteuXh919D1hbbRmI3ZWC
         vOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704876230; x=1705481030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xBqz+NKkAhcga/7KbDtJF7MTdjSbEbQnaZUr3GeRp3U=;
        b=uR9JVPPjf5V9VBTAntty2DUjlUyf10pODVSRD4XF4wZy7UAYxmnTDYEtc548L2ekC9
         TvwP0+cNAp6mEOA7o+Na0/YGpeb5mgy+bKMIV1OPQlDFoBDxTxtxibWzxkxp8MOWAQX1
         SuC0nhcW4807DrnoNPf7fR9DgR0bYsiJPkol2wC13FVwAcT2tHufaq8Zb5ciQvJaLgY5
         J0npu7Jdhvs7zYuLmOEsvFzxui8zQ/CjHsEbeVKeBcoQ4zY0LZRkf6n2i4j7q9hkh7W9
         UDrWH+SU2N13fVQOhMh+6C6PB2WGUpKY7biU9cQnkUDHlCzYauLs2PCoDYoAIMfF+JW9
         9m5A==
X-Gm-Message-State: AOJu0YylIbY7nG0KlT7zJ2Tm4xepWS7AvxgQmAuotH82lpDseb1Sl+T+
	AtdVItY5PDfXgqUVyfS6r7fX3LVhirpYYZuyQAM=
X-Google-Smtp-Source: AGHT+IHa/PFtRzn+HpK1gr7bBYK+GoY2so+241U3ZxtOU8InhDxiYMj+taDmyfj/73a7cxq+54y7jqF4GNUm8x5fFJs=
X-Received: by 2002:a17:906:3e08:b0:a2a:2498:93c5 with SMTP id
 k8-20020a1709063e0800b00a2a249893c5mr424762eji.73.1704876229573; Wed, 10 Jan
 2024 00:43:49 -0800 (PST)
MIME-Version: 1.0
References: <20240109145121.8850-1-rand.sec96@gmail.com>
In-Reply-To: <20240109145121.8850-1-rand.sec96@gmail.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Wed, 10 Jan 2024 10:43:38 +0200
Message-ID: <CAHb3i=ttHrFw7NuL3qw1xdXDkGu9tOQdH+WuCMWgukmU6QrTKA@mail.gmail.com>
Subject: Re: [PATCH] i2c: Fix NULL pointer dereference in npcm_i2c_reg_slave
To: Rand Deeb <rand.sec96@gmail.com>
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
Cc: lvc-project@linuxtesting.org, voskresenski.stanislav@confident.ru, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, deeb.rand@confident.ru, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 9, 2024 at 4:52=E2=80=AFPM Rand Deeb <rand.sec96@gmail.com> wro=
te:
>
> In the npcm_i2c_reg_slave function, a potential NULL pointer dereference
> issue occurs when 'client' is NULL. This patch adds a proper NULL check f=
or
> 'client' at the beginning of the function to prevent undefined behavior.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Rand Deeb <rand.sec96@gmail.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index c1b679737240..cfabfb50211d 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -1243,13 +1243,14 @@ static irqreturn_t npcm_i2c_int_slave_handler(str=
uct npcm_i2c *bus)
>  static int npcm_i2c_reg_slave(struct i2c_client *client)
>  {
>         unsigned long lock_flags;
> -       struct npcm_i2c *bus =3D i2c_get_adapdata(client->adapter);
> -
> -       bus->slave =3D client;
> +       struct npcm_i2c *bus;
>
> -       if (!bus->slave)
> +       if (!client)
>                 return -EINVAL;
>
> +       bus =3D i2c_get_adapdata(client->adapter);
> +       bus->slave =3D client;
> +
>         if (client->flags & I2C_CLIENT_TEN)
>                 return -EAFNOSUPPORT;
>
> --
> 2.34.1
>


Thanks for the patch!

Reviewed-by:tali.perry1@gmail.com
