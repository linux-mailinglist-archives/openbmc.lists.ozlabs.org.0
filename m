Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4E42E845
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 07:09:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVvT05431z3bXR
	for <lists+openbmc@lfdr.de>; Fri, 15 Oct 2021 16:09:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=eFZkvPCh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=eFZkvPCh; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVvSZ2GCDz2yxj;
 Fri, 15 Oct 2021 16:09:01 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id l7so7625209qkk.0;
 Thu, 14 Oct 2021 22:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a8L8tI7fdWPVyLQWYDtFqLlsNHHScmHBHQCVqZSRnUA=;
 b=eFZkvPChLYCKGXv27qtba5UyFdqjjqownlsjEdy+4EKngt/MVChZWaXXsNpPRqtNdZ
 Uzpw6KMUk5imyPD/9a0ErDBs/mUyNpju3rXqNtXZRRYZunGxPC8MaPaIdzfix/J//PYy
 ug/ORwkTSl/NfS/h6FrpYcrn9TBQUZvtNC9lQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8L8tI7fdWPVyLQWYDtFqLlsNHHScmHBHQCVqZSRnUA=;
 b=JG24pWkUqTyxJhJij8BCPtckvqnz+dErT61jxFHVXESeL3s8hqXIfu/MWFBpNRg5V0
 CABPRDtuaNm/GiCmwA6KJXa0LZXRyoUV8bABP5rBtFM/ctefjBkks00YRLptyLVLpSza
 yUmspkHfy0Mh6zImLQVVWaAS9Hhra8u9jA+Ti6YQqe1EKYCpnBo47rOKQnNKoPq/3qC+
 BKXJCt+BQWg83RGNYme+Klo9Qr7Epu+0ioiUUay6RGzhvaQkfUergl6UeSzxzICnewS6
 QGvpE9ERi+gb1dVvkqDYl+joITNwMx5zVeBsNflNOxzC1/XsxQ9fZQ6yUcK4JXXtHC2v
 SZBQ==
X-Gm-Message-State: AOAM530iUIyQW5rye2lgMQbKOFHYdkc+k7SW4s2c6seriaf19Jr39La3
 vmAh6Rn0GW2d/543NpmK8M8HS802zKgtxFfv/oY=
X-Google-Smtp-Source: ABdhPJzuAMBgm8X5B5WDZpgXeLp9fa14Q/T2EoOBrzxlSLdt7SSEQHnrVDk/B8pW7JurHxpiT6HH0sn98mY2EuNrha4=
X-Received: by 2002:a05:620a:4247:: with SMTP id
 w7mr8273900qko.381.1634274538886; 
 Thu, 14 Oct 2021 22:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190031.22168-1-eajames@linux.ibm.com>
In-Reply-To: <20210920190031.22168-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 15 Oct 2021 05:08:47 +0000
Message-ID: <CACPK8XczD=4PXxRQrZ=aGCYtZk47i4-XoFVwep04qszf3Ls6jg@mail.gmail.com>
Subject: Re: [PATCH] fsi: sbefifo: Add sysfs file indicating a timeout error
To: Eddie James <eajames@linux.ibm.com>, Amitay Isaacs <amitay@ozlabs.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 20 Sept 2021 at 19:00, Eddie James <eajames@linux.ibm.com> wrote:
>
> The SBEFIFO timeout error requires special handling in userspace
> to do recovery operations. Add a sysfs file to indicate a timeout
> error, and notify pollers when a timeout occurs.

Should this have some documentation too?

What userspace uses this?

Looks good to me otherwise.

Reviewed-by: Joel Stanley <joel@jms.id.au>

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-sbefifo.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 84cb965bfed5..b414ab4431ef 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -124,6 +124,7 @@ struct sbefifo {
>         bool                    broken;
>         bool                    dead;
>         bool                    async_ffdc;
> +       bool                    timed_out;
>  };
>
>  struct sbefifo_user {
> @@ -136,6 +137,14 @@ struct sbefifo_user {
>
>  static DEFINE_MUTEX(sbefifo_ffdc_mutex);
>
> +static ssize_t timeout_show(struct device *dev, struct device_attribute *attr,
> +                           char *buf)
> +{
> +       struct sbefifo *sbefifo = container_of(dev, struct sbefifo, dev);
> +
> +       return sysfs_emit(buf, "%d\n", sbefifo->timed_out ? 1 : 0);
> +}
> +static DEVICE_ATTR_RO(timeout);
>
>  static void __sbefifo_dump_ffdc(struct device *dev, const __be32 *ffdc,
>                                 size_t ffdc_sz, bool internal)
> @@ -462,11 +471,14 @@ static int sbefifo_wait(struct sbefifo *sbefifo, bool up,
>                         break;
>         }
>         if (!ready) {
> +               sysfs_notify(&sbefifo->dev.kobj, NULL, dev_attr_timeout.attr.name);
> +               sbefifo->timed_out = true;
>                 dev_err(dev, "%s FIFO Timeout ! status=%08x\n", up ? "UP" : "DOWN", sts);
>                 return -ETIMEDOUT;
>         }
>         dev_vdbg(dev, "End of wait status: %08x\n", sts);
>
> +       sbefifo->timed_out = false;
>         *status = sts;
>
>         return 0;
> @@ -993,6 +1005,8 @@ static int sbefifo_probe(struct device *dev)
>                                  child_name);
>         }
>
> +       device_create_file(&sbefifo->dev, &dev_attr_timeout);
> +
>         return 0;
>   err_free_minor:
>         fsi_free_minor(sbefifo->dev.devt);
> @@ -1018,6 +1032,8 @@ static int sbefifo_remove(struct device *dev)
>
>         dev_dbg(dev, "Removing sbefifo device...\n");
>
> +       device_remove_file(&sbefifo->dev, &dev_attr_timeout);
> +
>         mutex_lock(&sbefifo->lock);
>         sbefifo->dead = true;
>         mutex_unlock(&sbefifo->lock);
> --
> 2.27.0
>
