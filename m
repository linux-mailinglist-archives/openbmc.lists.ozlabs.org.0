Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A183B52C9EF
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 04:49:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3Z7b3tt8z3c8y
	for <lists+openbmc@lfdr.de>; Thu, 19 May 2022 12:49:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kiejp5CC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42a;
 helo=mail-wr1-x42a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=kiejp5CC; dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3Z7C3mTqz3bfr
 for <openbmc@lists.ozlabs.org>; Thu, 19 May 2022 12:48:55 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id f2so5216866wrc.0
 for <openbmc@lists.ozlabs.org>; Wed, 18 May 2022 19:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yw+hZWTquDyi90FRaT+oW4embDQnEDcH7OPDOrPJarU=;
 b=kiejp5CC6WUcZ7Wu+NlKFIqNJrgkz84gQ9HbsAGYHrmnoPVDAF+uvsFELJQVPAlWb5
 SIfuJ7J7g9QbCyr+nrvjm3ET3KM1y4kxfrYNy4atjp2YvOlW/jZxOaTFR9jrPiSUjcLx
 x4AUB7hoxjz8ZQk4WbVUIeKD6SlfRaXryHzwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yw+hZWTquDyi90FRaT+oW4embDQnEDcH7OPDOrPJarU=;
 b=ITozzusNqW4Koi91uRixmTsTTqut5QCRcf1fNBLH4aOU5iR8NQlsUkjqN85GuHg4Pr
 AUfg6VkikfSGl9qR59Ee4hqoEq0aIvXoUBrndPbVYAEAnLLkAuitfPZRaSFIsTNOPz2I
 tJUQsWbwbY8kZrRysrMEFcHB70gcB01h59JLXYqXRnYfssMfkobuLYpOGjlkhhH7NdEj
 +I6FzSuHx58TYPipB4/kTO3/5mq7TbzaB5UyfmuGd/0H9Eb6/jfaYkv7lNURDTxnuupV
 VKO6hlldh30Wrzx4DbiaPwU3koalAdpUPj73P/Jjy3qzbqJ/+mtfNS/zIGxnxM6aN2M9
 ezTg==
X-Gm-Message-State: AOAM530R4FR2CNE/DuF0RFZDZQQzPi5Xdi0dha9c0QYV5A/vk95Dl833
 hi2e7YfFvm6VTiaNRAiKKOa/RE9+CAG7Xhwgb6svhbCG
X-Google-Smtp-Source: ABdhPJzgu8FirBf4d5VXxr+28kX3mXL97Y1d0bicpsQcbOFCBtERGKZ6dNC9AnXjWpd8ubSqbEJoz00aOdOId33lBXA=
X-Received: by 2002:a05:6000:16c4:b0:20d:914:a441 with SMTP id
 h4-20020a05600016c400b0020d0914a441mr1963907wrf.705.1652928531313; Wed, 18
 May 2022 19:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220518134922.8833-1-eajames@linux.ibm.com>
In-Reply-To: <20220518134922.8833-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 19 May 2022 02:48:39 +0000
Message-ID: <CACPK8Xe0R8keBbAHq4jmORjdoo5ROUDPryZ8TkW3PiwSa1hwpA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] fsi: occ: Prevent use after free
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 18 May 2022 at 13:49, Eddie James <eajames@linux.ibm.com> wrote:
>
> Use get_device and put_device in the open and close functions to
> make sure the device doesn't get freed while a file descriptor is
> open.
> Also, lock around the freeing of the device buffer and check the
> buffer before using it in the submit function.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Applied, thanks.

> ---
>  drivers/fsi/fsi-occ.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index 3d04e8baecbb..8f7f602b909d 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -94,6 +94,7 @@ static int occ_open(struct inode *inode, struct file *file)
>         client->occ = occ;
>         mutex_init(&client->lock);
>         file->private_data = client;
> +       get_device(occ->dev);
>
>         /* We allocate a 1-page buffer, make sure it all fits */
>         BUILD_BUG_ON((OCC_CMD_DATA_BYTES + 3) > PAGE_SIZE);
> @@ -197,6 +198,7 @@ static int occ_release(struct inode *inode, struct file *file)
>  {
>         struct occ_client *client = file->private_data;
>
> +       put_device(client->occ->dev);
>         free_page((unsigned long)client->buffer);
>         kfree(client);
>
> @@ -493,12 +495,19 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>         for (i = 1; i < req_len - 2; ++i)
>                 checksum += byte_request[i];
>
> -       mutex_lock(&occ->occ_lock);
> +       rc = mutex_lock_interruptible(&occ->occ_lock);
> +       if (rc)
> +               return rc;
>
>         occ->client_buffer = response;
>         occ->client_buffer_size = user_resp_len;
>         occ->client_response_size = 0;
>
> +       if (!occ->buffer) {
> +               rc = -ENOENT;
> +               goto done;
> +       }
> +
>         /*
>          * Get a sequence number and update the counter. Avoid a sequence
>          * number of 0 which would pass the response check below even if the
> @@ -674,10 +683,13 @@ static int occ_remove(struct platform_device *pdev)
>  {
>         struct occ *occ = platform_get_drvdata(pdev);
>
> -       kvfree(occ->buffer);
> -
>         misc_deregister(&occ->mdev);
>
> +       mutex_lock(&occ->occ_lock);
> +       kvfree(occ->buffer);
> +       occ->buffer = NULL;
> +       mutex_unlock(&occ->occ_lock);
> +
>         device_for_each_child(&pdev->dev, NULL, occ_unregister_child);
>
>         ida_simple_remove(&occ_ida, occ->idx);
> --
> 2.27.0
>
