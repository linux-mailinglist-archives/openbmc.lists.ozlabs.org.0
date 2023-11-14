Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 817567EB079
	for <lists+openbmc@lfdr.de>; Tue, 14 Nov 2023 14:03:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOwIMkWl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SV61b31xdz3cPy
	for <lists+openbmc@lfdr.de>; Wed, 15 Nov 2023 00:03:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=gOwIMkWl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=tali.perry1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SV60y4pJcz3c4s
	for <openbmc@lists.ozlabs.org>; Wed, 15 Nov 2023 00:03:13 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4094301d505so43972635e9.2
        for <openbmc@lists.ozlabs.org>; Tue, 14 Nov 2023 05:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699966989; x=1700571789; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJjJKHUZUNOQdXGf9Dy6Kq7pWnEcJwiJCLLR5OWai7w=;
        b=gOwIMkWldDaSRnJZPoGH4ghv9+5lOn5zyW0QsKAwXKEKNH9inWcqt63vj/jjdkrXeS
         DSgWk22lOlDzzBB6sS+mMUZqrfHOhvnnuLxEGL+k1Jzw3azwazixzfBXI4d2HUfTYzTU
         N6tmZfP3m2OzpywwYXaDwVwtuyEQNGQujFElLVGnRoX3TyXRcCW/aFgvR3VHXl7PHNBJ
         rSghrY0Omkc3pqQuOBnLbfui5FoXETohH4Ka1NkezCih4XO9DxxAPHu2mQkjFJo4MTWz
         e9vkALzI/fmbaBJ5i+sa9N7mSnA3uYbu67dAm7c2P+mjReWbjwea2ETphb1JO4Na+oOh
         5tNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699966989; x=1700571789;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJjJKHUZUNOQdXGf9Dy6Kq7pWnEcJwiJCLLR5OWai7w=;
        b=UYeJkKJ0O/dOhOELzvq1Rmx2cFFZ7WC7Q/fU6OwmgFIc70+e419CBr3isFVsxIMeFv
         icLpROA5LptT9lG0XNNhxy3B+n7hvDOo/npV/ffsQOffI8aHKATPE/ul23NyDPzqvMSV
         jTrwG9slyZLW306UUCOjfLGVYzo0CkQ5BMaAOqYio0XdClnnBDYLlMxqjFueu1zgnJlp
         4cIkacAGh8hSQMufK3jR4BY4f6SambNgwU2uOT+uyNgjYpnzwSKsbZef3jYzQIKlZkeI
         X1n5g4xkmqnPiRLVgC2J1dnOYHnYp5DeDw7PKUeOE2aJ5qXgDe57T0TueJzB+Chix5Xn
         7CcQ==
X-Gm-Message-State: AOJu0YxE18iRcjyE9yiozsD/H0jYgsoeENjHGVm0rvA01CN9kYIShbyD
	UiTiFDBOh4pQ656QKF/kQN2cYAiFWOhE7TdLLq+9Xc3GYjQ=
X-Google-Smtp-Source: AGHT+IHgRd3gNlLXkJM9oqK5fEqaNFkOqkCsKijQhqu/BmgP88zXwR1Br7dHJnsSppo3pBXT6VEnVfgmwS/fz81trQs=
X-Received: by 2002:aa7:d316:0:b0:545:4bf3:ac89 with SMTP id
 p22-20020aa7d316000000b005454bf3ac89mr7125996edq.23.1699966665174; Tue, 14
 Nov 2023 04:57:45 -0800 (PST)
MIME-Version: 1.0
References: <20231112225444.4487-1-wsa+renesas@sang-engineering.com> <20231112225911.4650-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20231112225911.4650-2-wsa+renesas@sang-engineering.com>
From: Tali Perry <tali.perry1@gmail.com>
Date: Tue, 14 Nov 2023 14:57:34 +0200
Message-ID: <CAHb3i=tTvK9w4LgAiHhORWK-d3W6HKwGTv2BSAPTDc4siVkP9A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] i2c: npcm7xx: move to per-adapter debugfs directory
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Nov 13, 2023 at 12:59=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The I2C core now provides a per-adapter debugfs directory. Use it
> instead of creating a custom one.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/i2c/busses/i2c-npcm7xx.c | 49 +++++---------------------------
>  1 file changed, 7 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-np=
cm7xx.c
> index ae4bae63ad4f..54181b3f1919 100644
> --- a/drivers/i2c/busses/i2c-npcm7xx.c
> +++ b/drivers/i2c/busses/i2c-npcm7xx.c
> @@ -326,7 +326,6 @@ struct npcm_i2c {
>         u8 slv_rd_buf[MAX_I2C_HW_FIFO_SIZE];
>         u8 slv_wr_buf[MAX_I2C_HW_FIFO_SIZE];
>  #endif
> -       struct dentry *debugfs; /* debugfs device directory */
>         u64 ber_cnt;
>         u64 rec_succ_cnt;
>         u64 rec_fail_cnt;
> @@ -2250,27 +2249,15 @@ static const struct i2c_algorithm npcm_i2c_algo =
=3D {
>  #endif
>  };
>
> -/* i2c debugfs directory: used to keep health monitor of i2c devices */
> -static struct dentry *npcm_i2c_debugfs_dir;
> -
>  static void npcm_i2c_init_debugfs(struct platform_device *pdev,
>                                   struct npcm_i2c *bus)
>  {
> -       struct dentry *d;
> -
> -       if (!npcm_i2c_debugfs_dir)
> -               return;
> -       d =3D debugfs_create_dir(dev_name(&pdev->dev), npcm_i2c_debugfs_d=
ir);
> -       if (IS_ERR_OR_NULL(d))
> -               return;
> -       debugfs_create_u64("ber_cnt", 0444, d, &bus->ber_cnt);
> -       debugfs_create_u64("nack_cnt", 0444, d, &bus->nack_cnt);
> -       debugfs_create_u64("rec_succ_cnt", 0444, d, &bus->rec_succ_cnt);
> -       debugfs_create_u64("rec_fail_cnt", 0444, d, &bus->rec_fail_cnt);
> -       debugfs_create_u64("timeout_cnt", 0444, d, &bus->timeout_cnt);
> -       debugfs_create_u64("tx_complete_cnt", 0444, d, &bus->tx_complete_=
cnt);
> -
> -       bus->debugfs =3D d;
> +       debugfs_create_u64("ber_cnt", 0444, bus->adap.debugfs, &bus->ber_=
cnt);
> +       debugfs_create_u64("nack_cnt", 0444, bus->adap.debugfs, &bus->nac=
k_cnt);
> +       debugfs_create_u64("rec_succ_cnt", 0444, bus->adap.debugfs, &bus-=
>rec_succ_cnt);
> +       debugfs_create_u64("rec_fail_cnt", 0444, bus->adap.debugfs, &bus-=
>rec_fail_cnt);
> +       debugfs_create_u64("timeout_cnt", 0444, bus->adap.debugfs, &bus->=
timeout_cnt);
> +       debugfs_create_u64("tx_complete_cnt", 0444, bus->adap.debugfs, &b=
us->tx_complete_cnt);
>  }
>
>  static int npcm_i2c_probe_bus(struct platform_device *pdev)
> @@ -2362,7 +2349,6 @@ static void npcm_i2c_remove_bus(struct platform_dev=
ice *pdev)
>         unsigned long lock_flags;
>         struct npcm_i2c *bus =3D platform_get_drvdata(pdev);
>
> -       debugfs_remove_recursive(bus->debugfs);
>         spin_lock_irqsave(&bus->lock, lock_flags);
>         npcm_i2c_disable(bus);
>         spin_unlock_irqrestore(&bus->lock, lock_flags);
> @@ -2385,28 +2371,7 @@ static struct platform_driver npcm_i2c_bus_driver =
=3D {
>         }
>  };
>
> -static int __init npcm_i2c_init(void)
> -{
> -       int ret;
> -
> -       npcm_i2c_debugfs_dir =3D debugfs_create_dir("npcm_i2c", NULL);
> -
> -       ret =3D platform_driver_register(&npcm_i2c_bus_driver);
> -       if (ret) {
> -               debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> -               return ret;
> -       }
> -
> -       return 0;
> -}
> -module_init(npcm_i2c_init);
> -
> -static void __exit npcm_i2c_exit(void)
> -{
> -       platform_driver_unregister(&npcm_i2c_bus_driver);
> -       debugfs_remove_recursive(npcm_i2c_debugfs_dir);
> -}
> -module_exit(npcm_i2c_exit);
> +module_platform_driver(npcm_i2c_bus_driver);
>
>  MODULE_AUTHOR("Avi Fishman <avi.fishman@gmail.com>");
>  MODULE_AUTHOR("Tali Perry <tali.perry@nuvoton.com>");
> --
> 2.35.1
>

Test pass on npcm8xx device.

Reviewed-by: Tali Perry <tali.perry1@gmail.com>

Thanks Wolfram for the patch!
