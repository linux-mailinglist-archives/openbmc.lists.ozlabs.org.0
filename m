Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38759716
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 11:14:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZrgR20LnzDqjc
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 19:14:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=wangzhiqiang8906@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3HarYq7"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zrcw1ml1zDqsq
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 19:12:09 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id y198so3499987lfa.1
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 02:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7mrqRpFBcHlXIJTPrxU5vhuwhqLGAyTHsJFALo70qg4=;
 b=A3HarYq7qNIKhGAK0JlSPXx2FrZQjwxeYt9Sei65RP/fRuHvNorD27TCgxJIy8tTUI
 X3kuTI3jrstiSuIWPH7WEhvLmQOoFtaFlCOWzqlE7t8dxV2RL2ilqW8o19lmq5yrgGBZ
 jJram/coXtViiuIvP0ksjOhos4wFMRQ6sD8lVaxaKPekZhOAJZCTFLzab2/9Edjh8BU1
 yT+yHuk9hCJukMePEdRtGLxozEy0BxEqn9F6CLxDMD/oFncuVI/j+SeWEFoJfLLgPvYI
 Q8TiYY4BfblfvjnmvlFnoWf/F/wEQKEN/ngnroCxLpcm8Lglg94l48SdyyVnJAvza86v
 +8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7mrqRpFBcHlXIJTPrxU5vhuwhqLGAyTHsJFALo70qg4=;
 b=qXaCWcOiLUCQnli+uWy3HB5rnZm0Fj/oOsJ2tZgEo54wJqgo+DkPxbAEQgjERBiiH0
 zRgupJbOFztjVIQPBFUSjN181EjPp3ZdVU6EMMIVq0vu695t5FMzmNu1eh55pCNom4PI
 riL9mscED3JCYwrRBmtyxmxqOziinVwnE576YbDadrvn3EkEw9HTUOw1OIvjzcLO51d/
 cciXFgL/GCic2/caB+1jJD1tkofuVa6IijDVyzFhaOLQH2nBtXbZSgRfofXu7bmOz70e
 1VMA3dCDnjFmWVpXoSsclLMQ38Ze8rPULcrRSD4a1BYrqD7q3F1JRF88Qh5L5Bxp4Qjw
 59uQ==
X-Gm-Message-State: APjAAAUjOhHyJAM8+yMgnl+oWK7jf+n+4yJb63h0AhR2qKV8krRi3O8G
 7txYyJmSUo3ONLlQfHaWASpOjIB4ykj11gRXGyU=
X-Google-Smtp-Source: APXvYqxylbApbZFZu+z8O773oR3E3OKBPyS+4ruem1iZGQ/cngWUmpaJlHvT6WFZLogbyoRnpzJyrANyLGDzvZozX7s=
X-Received: by 2002:a19:f20d:: with SMTP id q13mr4381584lfh.65.1561713126226; 
 Fri, 28 Jun 2019 02:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190628064139.17408-1-jk@ozlabs.org>
 <20190628080737.25491-1-jk@ozlabs.org>
In-Reply-To: <20190628080737.25491-1-jk@ozlabs.org>
From: qianlihu <wangzhiqiang8906@gmail.com>
Date: Fri, 28 Jun 2019 17:11:55 +0800
Message-ID: <CAHkHK0_ex5_13L9sAN3_u35qeTDOoTps2unR_f4Fayj3r-idoQ@mail.gmail.com>
Subject: Re: [PATCH v2] fsi/core: Fix error paths on CFAM init
To: Jeremy Kerr <jk@ozlabs.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Tested-by: John Wang <wangzqbj@inspur.com>

On Fri, Jun 28, 2019 at 4:09 PM Jeremy Kerr <jk@ozlabs.org> wrote:
>
> Change d1dcd67825 re-worked the struct fsi_slave initialisation in
> fsi_slave_init, but introduced a few inconsitencies: the slave->dev is
> now registered through cdev_device_add, but we may kfree() the device
> out from underneath the cdev registration. We may also leave an IDA
> allocated.
>
> This change fixes the error paths, so that we kfree() only before the
> device is registered with the core code. We also move the smode write to
> before we start creating proper devices, as it's the most likely to
> fail. We also remove the IDA-allocated minor on error, and properly
> clean up the of_node.
>
> Fixes: d1dcd678257603e71cf3f3d84c70e2b6f0f14bb8
> Reported-by: Lei YU <mine260309@gmail.com>
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> ---
> v2:
>   fix dropped semicolon
> ---
>  drivers/fsi/fsi-core.c | 32 ++++++++++++++++++++------------
>  1 file changed, 20 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1d83f3ba478b..1f76740f33b6 100644
> --- a/drivers/fsi/fsi-core.c
> +++ b/drivers/fsi/fsi-core.c
> @@ -1029,6 +1029,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>
>         }
>
> +       rc = fsi_slave_set_smode(slave);
> +       if (rc) {
> +               dev_warn(&master->dev,
> +                               "can't set smode on slave:%02x:%02x %d\n",
> +                               link, id, rc);
> +               goto err_free;
> +       }
> +
>         /* Allocate a minor in the FSI space */
>         rc = __fsi_get_new_minor(slave, fsi_dev_cfam, &slave->dev.devt,
>                                  &slave->cdev_idx);
> @@ -1040,17 +1048,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>         rc = cdev_device_add(&slave->cdev, &slave->dev);
>         if (rc) {
>                 dev_err(&slave->dev, "Error %d creating slave device\n", rc);
> -               goto err_free;
> +               goto err_free_ida;
>         }
>
> -       rc = fsi_slave_set_smode(slave);
> -       if (rc) {
> -               dev_warn(&master->dev,
> -                               "can't set smode on slave:%02x:%02x %d\n",
> -                               link, id, rc);
> -               kfree(slave);
> -               return -ENODEV;
> -       }
> +       /* Now that we have the cdev registered with the core, any fatal
> +        * failures beyond this point will need to clean up through
> +        * cdev_device_del(). Fortunately though, nothing past here is fatal.
> +        */
> +
>         if (master->link_config)
>                 master->link_config(master, link,
>                                     slave->t_send_delay,
> @@ -1067,10 +1072,13 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>                 dev_dbg(&master->dev, "failed during slave scan with: %d\n",
>                                 rc);
>
> -       return rc;
> +       return 0;
>
> - err_free:
> -       put_device(&slave->dev);
> +err_free_ida:
> +       fsi_free_minor(slave->dev.devt);
> +err_free:
> +       of_node_put(slave->dev.of_node);
> +       kfree(slave);
>         return rc;
>  }
>
> --
> 2.20.1
>
