Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB190583
	for <lists+openbmc@lfdr.de>; Fri, 16 Aug 2019 18:12:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697dJ3Bp0zDrPS
	for <lists+openbmc@lfdr.de>; Sat, 17 Aug 2019 02:12:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="WkaUMEcu"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697cR60MtzDrPS
 for <openbmc@lists.ozlabs.org>; Sat, 17 Aug 2019 02:11:51 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id s14so5201415qkm.4
 for <openbmc@lists.ozlabs.org>; Fri, 16 Aug 2019 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tON9S42IeyYjtYIYRrxvhxPPdsGEjAbWNSQPcXzX8IM=;
 b=WkaUMEcuD5jWnrDLSGUEqq3QtEKi98KQc20L++RMmhGYm8rxtN5eF/PuYFnvkgcBK2
 eD3cvbK45ajl5v63u4GDgRim6WuL8xjjBFbJ3uBqPWOSUuFbnR//qgf6vXmYRyjCOm+v
 Bb0qI4MgNwFlFnNjVDVa8x/FjOIk//WKVQbOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tON9S42IeyYjtYIYRrxvhxPPdsGEjAbWNSQPcXzX8IM=;
 b=GdkJAm+u6dAf6T1AY2ZVbLSHw7G1Cw4xSA7ZcooPzNDbOz21YS1JWXf8HC/PGg1hC3
 oA3FT9ldvM2b3zzpHPDeQh9t/ChJ6ltE3yn4Bp/qMDWfeIB5eAFFCrDabuzL/a9HY29d
 7T8czBt1ZnxhqP+PytG1kB9xkBEUECzXQQ1L0N5uFY+EJ03A2wRhoNt7zvI13RiL57sj
 HTq03mFM4m38toKSzueFta0oPLB/BcyxLoPr9CLg4YvX+zRg/mozJAHWNoZMrJQ+wcAS
 uvVmDsEeCCWa4JBlvpNzYBfeDRL+IV0gNR8EQ3wUjz5e6GhQJnYs6f7r+dgWBgqnEtp8
 bGqg==
X-Gm-Message-State: APjAAAUkZHGFudp+2qL7U8Kg46lyuv3U6CSQsO/adkmbq+Lp+PBUq8ho
 v5YFyCGxrVXMPN7fiK1DgWq5Bh/7D0c16RIefIY=
X-Google-Smtp-Source: APXvYqwNmxc8bXmZPSVVQ/mTN+gI4sLydfMGzI7tFOx6KxXqQSAYT+fEBvLOAE1gksyCljvgYqOazOOA4RYnWzxSMBg=
X-Received: by 2002:a05:620a:16d6:: with SMTP id
 a22mr9643056qkn.414.1565971908948; 
 Fri, 16 Aug 2019 09:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <1565896263-26277-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1565896263-26277-1-git-send-email-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 16 Aug 2019 16:11:37 +0000
Message-ID: <CACPK8XdiiZdnX4VXkkZzUm=Ygd8P6W0akCJ=X2SaHmBX0=8pWw@mail.gmail.com>
Subject: Re: [PATCH dev-5.2] fsi: scom: Don't abort operations for minor errors
To: Eddie James <eajames@linux.ibm.com>, Jeremy Kerr <jk@ozlabs.org>
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

On Thu, 15 Aug 2019 at 19:11, Eddie James <eajames@linux.ibm.com> wrote:
>
> The scom driver currently fails out of operations if certain system
> errors are flagged in the status register; system checkstop, special
> attention, or recoverable error. These errors won't impact the ability
> of the scom engine to perform operations, so the driver should continue
> under these conditions.
> Also, don't do a PIB reset for these conditions, since it won't help.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Jeremy, can you have a look a this one please?

> ---
>  drivers/fsi/fsi-scom.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/fsi/fsi-scom.c b/drivers/fsi/fsi-scom.c
> index 343153d..004dc03 100644
> --- a/drivers/fsi/fsi-scom.c
> +++ b/drivers/fsi/fsi-scom.c
> @@ -38,8 +38,7 @@
>  #define SCOM_STATUS_PIB_RESP_MASK      0x00007000
>  #define SCOM_STATUS_PIB_RESP_SHIFT     12
>
> -#define SCOM_STATUS_ANY_ERR            (SCOM_STATUS_ERR_SUMMARY | \
> -                                        SCOM_STATUS_PROTECTION | \
> +#define SCOM_STATUS_ANY_ERR            (SCOM_STATUS_PROTECTION | \
>                                          SCOM_STATUS_PARITY |     \
>                                          SCOM_STATUS_PIB_ABORT | \
>                                          SCOM_STATUS_PIB_RESP_MASK)
> @@ -251,11 +250,6 @@ static int handle_fsi2pib_status(struct scom_device *scom, uint32_t status)
>         /* Return -EBUSY on PIB abort to force a retry */
>         if (status & SCOM_STATUS_PIB_ABORT)
>                 return -EBUSY;
> -       if (status & SCOM_STATUS_ERR_SUMMARY) {
> -               fsi_device_write(scom->fsi_dev, SCOM_FSI2PIB_RESET_REG, &dummy,
> -                                sizeof(uint32_t));
> -               return -EIO;
> -       }
>         return 0;
>  }
>
> --
> 1.8.3.1
>
