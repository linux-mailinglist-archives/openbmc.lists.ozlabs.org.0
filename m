Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE8059553
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 09:47:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZplM1tzMzDqsv
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2019 17:47:43 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=inspur.com
 (client-ip=210.51.26.145; helo=unicom145.biz-email.net;
 envelope-from=wangzqbj@inspur.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inspur.com
Received: from unicom145.biz-email.net (unicom145.biz-email.net
 [210.51.26.145])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zpkq4nLNzDqqK
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 17:47:10 +1000 (AEST)
Received: from ([60.208.111.195])
 by unicom145.biz-email.net (Antispam) with ASMTP (SSL) id TNX40501
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 15:47:01 +0800
Received: from Jtjnmail201618.home.langchao.com (10.100.2.18) by
 jtjnmail201608.home.langchao.com (10.100.2.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1591.10; Fri, 28 Jun 2019 15:46:59 +0800
Received: from mail-lj1-f180.google.com (10.100.1.52) by
 Jtjnmail201618.home.langchao.com (10.100.2.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 28 Jun 2019 15:46:58 +0800
Received: by mail-lj1-f180.google.com with SMTP id 205so4999727ljj.8
 for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2019 00:46:58 -0700 (PDT)
X-Gm-Message-State: APjAAAUo7batuQkGhueO7CURGDYZbzSUyr8VIW7uG4Z/qQs5VWDwoROw
 tmlzNDcAOsZ8IzudJGpHAtwe2aRJx6T8zI2HJBY=
X-Google-Smtp-Source: APXvYqy1lrZHbSXmzjzwKU8P/R7FtEAO16O0PCf5U8dU59djIGWjf3Pq6r1jXB23i0UBGGuSD/XBEipSLD6TfZdG3tM=
X-Received: by 2002:a2e:9758:: with SMTP id f24mr5329739ljj.58.1561708015630; 
 Fri, 28 Jun 2019 00:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190628064139.17408-1-jk@ozlabs.org>
In-Reply-To: <20190628064139.17408-1-jk@ozlabs.org>
From: John Wang <wangzqbj@inspur.com>
Date: Fri, 28 Jun 2019 15:46:43 +0800
X-Gmail-Original-Message-ID: <CAHkHK0-4hBz1bJggNnm7sOm15QcM-2C3RQA-QbpNt-R6BQP3xQ@mail.gmail.com>
Message-ID: <CAHkHK0-4hBz1bJggNnm7sOm15QcM-2C3RQA-QbpNt-R6BQP3xQ@mail.gmail.com>
Subject: Re: [PATCH] fsi/core: Fix error paths on CFAM init
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.100.1.52]
X-ClientProxiedBy: jtjnmail201604.home.langchao.com (10.100.2.4) To
 Jtjnmail201618.home.langchao.com (10.100.2.18)
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

On Fri, Jun 28, 2019 at 2:44 PM Jeremy Kerr <jk@ozlabs.org> wrote:
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
>
> Lei: Can you test this on your hardware? Thanks!
>
> ---
>  drivers/fsi/fsi-core.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/fsi/fsi-core.c b/drivers/fsi/fsi-core.c
> index 1d83f3ba478b..9ba5e19d1c42 100644
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
> @@ -1067,11 +1072,14 @@ static int fsi_slave_init(struct fsi_master *master, int link, uint8_t id)
>                 dev_dbg(&master->dev, "failed during slave scan with: %d\n",
>                                 rc);
>
> -       return rc;
> +       return 0;
>
> - err_free:
> -       put_device(&slave->dev);
> -       return rc;
> +err_free_ida:
> +       fsi_free_minor(slave->dev.devt);
> +err_free:
> +       of_node_put(slave->dev.of_node);
> +       kfree(slave);
> +       return rc
semicolon missed :)
>  }
>
>  /* FSI master support */
> --
> 2.20.1
>
