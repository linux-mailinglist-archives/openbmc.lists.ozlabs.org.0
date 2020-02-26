Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE75170AE7
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 22:54:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SV2S3D9RzDqnV
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 08:54:40 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=naNgReko; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48STzr68bXzDqcj
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 08:52:22 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id a2so1094091qko.12
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 13:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3t2bLQBAarl0eajRPMKUoV8Z/E+nWWcbk3OpMTRwEJQ=;
 b=naNgReko349ax0igpBfyIV65d0KT1nU+/SrTtSsRn6swLTpfkdA93lTPtQshJwGAUS
 NWcAA6nTW3ja5119mAg/DRzx95A+BtnLmR+RBvIQysqSW2S5ePhlBUHMOno5xKJPgKdR
 5Q5cMXQnWuj5demCfcgGBBTPhi+vbjbVXOvZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3t2bLQBAarl0eajRPMKUoV8Z/E+nWWcbk3OpMTRwEJQ=;
 b=J9RrtteTns06/yfeS70Ty5UDf1mY6pD7/B+/yAsv2BntSuEUQ57RY3E0v5n9TmNwkm
 TzbyTOoOc3uVvNcR6oq3kp/7u05+ZNBIO4wOMYjVvguOiy4IRT+WrA7aCnBnfYPFNZga
 dtasxqsb+FOS992ex9CasqjNxoscEjq2OKmnz5L6vWCh1P2C22BXOIToVbPJEEaK2+xb
 O+BxW59KRSqM5e1nZseAvCCV7w1tOpE6p9FQ9N9ebrGF/9pz/H62oR6wXWrdOcWpdA+v
 V5OJs7+WWy5nIBLtvdxTpPooAhOlaFJTWbY/J1CmjU2m2dhIhPLltV9YpLj/bDQaJvj+
 eqZQ==
X-Gm-Message-State: APjAAAWoBckULBVXieKa13cwP7QZ9/z50RfEjSjb2jfQAqpzIgfJxYBx
 B7fT/2usJk86JGxjMrM/hg4aYZy7e06DvRuiwSU=
X-Google-Smtp-Source: APXvYqyYP5wsQ5V3r97a7uX66GQCT6FwG+BWqCrUDuxTm6EOHxZa5aJLMMG0afDt3nsjOMR0zdcXl6Z7hC2lmO96Clo=
X-Received: by 2002:a05:620a:c96:: with SMTP id
 q22mr1575691qki.330.1582753939537; 
 Wed, 26 Feb 2020 13:52:19 -0800 (PST)
MIME-Version: 1.0
References: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Feb 2020 21:52:07 +0000
Message-ID: <CACPK8XfVH2AVUW=zQkSdLzW0tZF+PmzA8RJ=_xOhZmSBcri_cQ@mail.gmail.com>
Subject: Re: [PATCH dev-5.4] hwmon: peci: change label strings to reflect
 natural numbers
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 11 Feb 2020 at 23:47, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>
> This commit changes label strings to reflect user friendly natural
> numbers like 'Core 1' instead of 'Core 0' and 'DIMM A1' instead of
> 'DIMM A0'.
>
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>

Applied to dev-5.4


> ---
>  drivers/hwmon/peci-cputemp.c  | 2 +-
>  drivers/hwmon/peci-dimmtemp.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/hwmon/peci-cputemp.c
>  mode change 100644 => 100755 drivers/hwmon/peci-dimmtemp.c
>
> diff --git a/drivers/hwmon/peci-cputemp.c b/drivers/hwmon/peci-cputemp.c
> old mode 100644
> new mode 100755
> index 78e442f433a7..b9fe91281d58
> --- a/drivers/hwmon/peci-cputemp.c
> +++ b/drivers/hwmon/peci-cputemp.c
> @@ -363,7 +363,7 @@ static int create_core_temp_label(struct peci_cputemp *priv, int idx)
>         if (!priv->coretemp_label[idx])
>                 return -ENOMEM;
>
> -       sprintf(priv->coretemp_label[idx], "Core %d", idx);
> +       sprintf(priv->coretemp_label[idx], "Core %d", idx + 1);
>
>         return 0;
>  }
> diff --git a/drivers/hwmon/peci-dimmtemp.c b/drivers/hwmon/peci-dimmtemp.c
> old mode 100644
> new mode 100755
> index 8ceab08d06e1..45eabd2ec5c8
> --- a/drivers/hwmon/peci-dimmtemp.c
> +++ b/drivers/hwmon/peci-dimmtemp.c
> @@ -260,7 +260,7 @@ static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
>         rank = chan / priv->gen_info->dimm_idx_max;
>         idx = chan % priv->gen_info->dimm_idx_max;
>
> -       sprintf(priv->dimmtemp_label[chan], "DIMM %c%d", 'A' + rank, idx);
> +       sprintf(priv->dimmtemp_label[chan], "DIMM %c%d", 'A' + rank, idx + 1);
>
>         return 0;
>  }
> --
> 2.17.1
>
