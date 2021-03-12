Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCBD33827C
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:36:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRh96xNzz30Pl
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:36:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=VIJu6AZ2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=VIJu6AZ2; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRgz07Vmz2xZt
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:36:14 +1100 (AEDT)
Received: by mail-qk1-x733.google.com with SMTP id t4so22753959qkp.1
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5KF5lJjRLF+PxZKHDUBQQs4qJMBMkrRjJLK4pfNLoFw=;
 b=VIJu6AZ2ZOBEtW9Xn2MjBJmFMDsBDlIIt3MeCkhgGEKTWTk3xzha5PQOFHg9706gfV
 ndbwmLEMMv1adzFwuZc+mXohwnJE4s9vqv/0yoUCnxbHuDJslvKWZoloK4c+YTtVhXdA
 RmE8Dy3ctI+4AjSlGrHekb5G3ixmLso2ZC32A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5KF5lJjRLF+PxZKHDUBQQs4qJMBMkrRjJLK4pfNLoFw=;
 b=C1xTBK/9JQbuRcaXHwmmzbhWBpoaUWcDl8S5bJ4UrhsQO1i1JWHSqxIAVENsY/BHzB
 N3ECVc3PhBL3+HkRO5p5fgv0S7j/27rEIz3HW6tEfUfs6TxTf1txGGy7sDenTrEt78Gl
 fjsxJULFDvNbQS2EOLD6TjUUOTaP+d0ETcPLM7dfxI07pOvJqtHSdjSBsERzD4OfkVc2
 DeYNWoZ84j56sxUtCzI2v1ep57JrelUOyBblT4vB7vCXNcVejUSB2sMU6+++k5HGZwVo
 FhLKIlOWLjzY63JQm3XUbnpOAJkjnEk59Q5HhQK7ZH8yFn1krzcTzpH16A0rsI8y/fcT
 ZiGA==
X-Gm-Message-State: AOAM533GWqJb7nPmx/HOrdBS4OiYQI5tlYGmob5Kzawlyul+KocW2KDb
 ZfaOKvKpgrXHV3/G4X+6uVleJTTxgcalMx6dTy0=
X-Google-Smtp-Source: ABdhPJyu/4XMpl731qLN4Z3iVEzBTzDJK2OKEaYV2LQPKTzpCWaMpuKr1xnBvrBGDnH4SwPDzDQYOpETLaNfP4r9TJY=
X-Received: by 2002:a37:a147:: with SMTP id k68mr10431239qke.66.1615509369663; 
 Thu, 11 Mar 2021 16:36:09 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-34-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-34-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:35:57 +0000
Message-ID: <CACPK8XevDUym6e8f1O4DD4F4rVc=rRga1oQoGhdupbMTf-HT4A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 33/35] pmbus: (core) Add a one-shot retry
 in pmbus_set_page()
To: Eddie James <eajames@linux.ibm.com>, Andrew Jeffery <andrew@aj.id.au>
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

On Mon, 8 Mar 2021 at 22:56, Eddie James <eajames@linux.ibm.com> wrote:
>
> From: Andrew Jeffery <andrew@aj.id.au>
>
> From extensive testing and tracing it was discovered that the MAX31785
> occasionally fails to switch pages despite ACK'ing the PAGE PMBus data
> write. I suspect this behaviour had been seen on other devices as well,
> as pmbus_set_page() already read-back the freshly set value and errored
> out if it wasn't what we requested.
>
> In the case of the MAX31785 it was shown that a one-shot retry was
> enough to get the PAGE write to stick if the inital command failed. To
> improve robustness, only error out if the one-shot retry also fails to
> stick.
>
> OpenBMC-Staging-Count: 1
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Andrew, please review the pmbus related changes and let me know how
you would like to proceed.

> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 31 ++++++++++++++++++++-----------
>  1 file changed, 20 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 44c1a0a07509..dd4a09d18730 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -151,25 +151,34 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
>
>         if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
>             data->info->pages > 1 && page != data->currpage) {
> +               int i;
> +
>                 dev_dbg(&client->dev, "Want page %u, %u cached\n", page,
>                         data->currpage);
>
> -               rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> -               if (rv < 0) {
> +               for (i = 0; i < 2; i++) {
>                         rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE,
>                                                        page);
> -                       dev_dbg(&client->dev,
> -                               "Failed to set page %u, performed one-shot retry %s: %d\n",
> -                               page, rv ? "and failed" : "with success", rv);
> +                       if (rv)
> +                               continue;
> +
> +                       rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
>                         if (rv < 0)
> -                               return rv;
> -               }
> +                               continue;
>
> -               rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
> -               if (rv < 0)
> -                       return rv;
> +                       /* Success, exit loop */
> +                       if (rv == page)
> +                               break;
> +
> +                       rv = i2c_smbus_read_byte_data(client, PMBUS_STATUS_CML);
> +                       if (rv < 0)
> +                               continue;
> +
> +                       if (rv & PB_CML_FAULT_INVALID_DATA)
> +                               return -EIO;
> +               }
>
> -               if (rv != page)
> +               if (i == 2)
>                         return -EIO;
>         }
>         data->currpage = page;
> --
> 2.27.0
>
