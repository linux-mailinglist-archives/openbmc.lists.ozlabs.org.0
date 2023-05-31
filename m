Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 708FF717391
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 04:12:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWCTR6yGkz3cKj
	for <lists+openbmc@lfdr.de>; Wed, 31 May 2023 12:12:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UksYza6w;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=UksYza6w;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWCSs6NJHz3c34;
	Wed, 31 May 2023 12:12:13 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-51475e981f0so8637999a12.1;
        Tue, 30 May 2023 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1685499129; x=1688091129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ucx4kwK8ujRzNJbb04V3YLVl0GtgGlj1PvcZVvmj1Eg=;
        b=UksYza6wNv++MXgkLV6TDe5P04amEFt0Y/STxFL5ddTVUpx9Oof8N9nejDVj0LJBaZ
         Qp9nHyCFEoOR2KT7C59Zo4iAZgnllES/CX4UtbLXNF/cafT7E7uaRCE5ICzrl5osOrzh
         MS2F0URjTIywWbkLqEpmPRsMFkH/rpfcRCPP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685499129; x=1688091129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ucx4kwK8ujRzNJbb04V3YLVl0GtgGlj1PvcZVvmj1Eg=;
        b=gxr8RSgCSJdWZ1p2I1fEftxbIfUFLJa8K8YKclQEAgyAgYPdb7F3EQ1w9KZEfGD9IZ
         0jwo09CZCLLeQ21kYwDbGbouPCqiQnqQ2doc39fDyQxbuy3HaeUswsf+e7qG349c47Mj
         KOEliz32blWjVWdjmhl+luzANQTcV+A9tEvXcbb88C/cGu6eE9OVHyaJ8X84NxA/rS5Z
         FurnUYDHowh+7NEm/iJbP0BgUK5Fiv/6bIRiG0dfWvs5WSWN8PJOqLdck+e32ZBbwT3b
         LhVmnA9OoHiauRMBkY2pPg4PtZIucwDDlaVZ4IrVZ4Lh4bYLyCJtL7dkGK+Skg8Yakzs
         Og/w==
X-Gm-Message-State: AC+VfDxy1VvTQuh+B69i/oUYiiye2V5RL49wCFhbjQG06gY4t+YgR3aj
	fIVd/X4CkQkjFOpfaoRkcJceeTNQ4SYRPBKeZxW56JRr
X-Google-Smtp-Source: ACHHUZ5oxahDY3MaQoUQVhM7Tbdz41DGYhxrKbPGA+375sD6ptx3fcUhjX/tVD5i8ak/I8xYWweHuxNKoat820sgwb0=
X-Received: by 2002:a17:907:70e:b0:94f:5847:8ac with SMTP id
 xb14-20020a170907070e00b0094f584708acmr4252784ejb.51.1685499128511; Tue, 30
 May 2023 19:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230317134638.3128232-1-eajames@linux.ibm.com>
In-Reply-To: <20230317134638.3128232-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 31 May 2023 02:11:56 +0000
Message-ID: <CACPK8XeSemvhR2_mn_Qb2Xtt2K5=UqEufnKd1HnQxO2MfWXHSg@mail.gmail.com>
Subject: Re: [PATCH] fsi: sbefifo: Add configurable in-command timeout
To: Eddie James <eajames@linux.ibm.com>
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 17 Mar 2023 at 13:46, Eddie James <eajames@linux.ibm.com> wrote:
>
> A new use case for the SBEFIFO requires a long in-command timeout
> as the SBE processes each part of the command before clearing the
> upstream FIFO for the next part of the command. Add ioctl support
> to configure this timeout in a similar way to the existing read
> timeout.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

I've got one minor suggestion below that I'll make when applying.

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  drivers/fsi/fsi-sbefifo.c | 33 ++++++++++++++++++++++++++++++++-
>  include/uapi/linux/fsi.h  | 10 ++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/fsi/fsi-sbefifo.c b/drivers/fsi/fsi-sbefifo.c
> index 9912b7a6a4b9..223486b3cfcb 100644
> --- a/drivers/fsi/fsi-sbefifo.c
> +++ b/drivers/fsi/fsi-sbefifo.c
> @@ -127,6 +127,7 @@ struct sbefifo {
>         bool                    dead;
>         bool                    async_ffdc;
>         bool                    timed_out;
> +       u32                     timeout_in_cmd_ms;
>         u32                     timeout_start_rsp_ms;
>  };
>
> @@ -136,6 +137,7 @@ struct sbefifo_user {
>         void                    *cmd_page;
>         void                    *pending_cmd;
>         size_t                  pending_len;
> +       u32                     cmd_timeout_ms;
>         u32                     read_timeout_ms;
>  };
>
> @@ -508,7 +510,7 @@ static int sbefifo_send_command(struct sbefifo *sbefifo,
>                 rc = sbefifo_wait(sbefifo, true, &status, timeout);
>                 if (rc < 0)
>                         return rc;
> -               timeout = msecs_to_jiffies(SBEFIFO_TIMEOUT_IN_CMD);
> +               timeout = msecs_to_jiffies(sbefifo->timeout_in_cmd_ms);
>
>                 vacant = sbefifo_vacant(status);
>                 len = chunk = min(vacant, remaining);
> @@ -802,6 +804,7 @@ static int sbefifo_user_open(struct inode *inode, struct file *file)
>                 return -ENOMEM;
>         }
>         mutex_init(&user->file_lock);
> +       user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
>         user->read_timeout_ms = SBEFIFO_TIMEOUT_START_RSP;
>
>         return 0;
> @@ -845,9 +848,11 @@ static ssize_t sbefifo_user_read(struct file *file, char __user *buf,
>         rc = mutex_lock_interruptible(&sbefifo->lock);
>         if (rc)
>                 goto bail;
> +       sbefifo->timeout_in_cmd_ms = user->cmd_timeout_ms;
>         sbefifo->timeout_start_rsp_ms = user->read_timeout_ms;
>         rc = __sbefifo_submit(sbefifo, user->pending_cmd, cmd_len, &resp_iter);
>         sbefifo->timeout_start_rsp_ms = SBEFIFO_TIMEOUT_START_RSP;
> +       sbefifo->timeout_in_cmd_ms = SBEFIFO_TIMEOUT_IN_CMD;
>         mutex_unlock(&sbefifo->lock);
>         if (rc < 0)
>                 goto bail;
> @@ -937,6 +942,28 @@ static int sbefifo_user_release(struct inode *inode, struct file *file)
>         return 0;
>  }
>
> +static int sbefifo_cmd_timeout(struct sbefifo_user *user, void __user *argp)
> +{
> +       struct device *dev = &user->sbefifo->dev;
> +       u32 timeout;
> +
> +       if (get_user(timeout, (__u32 __user *)argp))
> +               return -EFAULT;
> +
> +       if (timeout == 0) {
> +               user->cmd_timeout_ms = SBEFIFO_TIMEOUT_IN_CMD;
> +               dev_dbg(dev, "Command timeout reset to %u\n", user->cmd_timeout_ms);

%u ms ? Or divide it by 1000 to print it in seconds?

> +               return 0;
> +       }
> +
> +       if (timeout > 120)
> +               return -EINVAL;
> +
> +       user->cmd_timeout_ms = timeout * 1000; /* user timeout is in sec */
> +       dev_dbg(dev, "Command timeout set to %u\n", user->cmd_timeout_ms);

Same here.

> +       return 0;
> +}
> +
>  static int sbefifo_read_timeout(struct sbefifo_user *user, void __user *argp)
>  {
>         struct device *dev = &user->sbefifo->dev;
> @@ -971,6 +998,9 @@ static long sbefifo_user_ioctl(struct file *file, unsigned int cmd, unsigned lon
>
>         mutex_lock(&user->file_lock);
>         switch (cmd) {
> +       case FSI_SBEFIFO_CMD_TIMEOUT_SECONDS:
> +               rc = sbefifo_cmd_timeout(user, (void __user *)arg);
> +               break;
>         case FSI_SBEFIFO_READ_TIMEOUT_SECONDS:
>                 rc = sbefifo_read_timeout(user, (void __user *)arg);
>                 break;
> @@ -1025,6 +1055,7 @@ static int sbefifo_probe(struct device *dev)
>         sbefifo->fsi_dev = fsi_dev;
>         dev_set_drvdata(dev, sbefifo);
>         mutex_init(&sbefifo->lock);
> +       sbefifo->timeout_in_cmd_ms = SBEFIFO_TIMEOUT_IN_CMD;
>         sbefifo->timeout_start_rsp_ms = SBEFIFO_TIMEOUT_START_RSP;
>
>         /*
> diff --git a/include/uapi/linux/fsi.h b/include/uapi/linux/fsi.h
> index b2f1977378c7..a2e730fc6309 100644
> --- a/include/uapi/linux/fsi.h
> +++ b/include/uapi/linux/fsi.h
> @@ -59,6 +59,16 @@ struct scom_access {
>   * /dev/sbefifo* ioctl interface
>   */
>
> +/**
> + * FSI_SBEFIFO_CMD_TIMEOUT sets the timeout for writing data to the SBEFIFO.
> + *
> + * The command timeout is specified in seconds.  The minimum value of command
> + * timeout is 1 seconds (default) and the maximum value of command timeout is
> + * 120 seconds.  A command timeout of 0 will reset the value to the default of
> + * 1 seconds.
> + */
> +#define FSI_SBEFIFO_CMD_TIMEOUT_SECONDS                _IOW('s', 0x01, __u32)
> +
>  /**
>   * FSI_SBEFIFO_READ_TIMEOUT sets the read timeout for response from SBE.
>   *
> --
> 2.31.1
>
