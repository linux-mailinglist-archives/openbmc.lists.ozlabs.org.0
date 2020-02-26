Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E589E170AEA
	for <lists+openbmc@lfdr.de>; Wed, 26 Feb 2020 22:56:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SV4F6yxYzDqnf
	for <lists+openbmc@lfdr.de>; Thu, 27 Feb 2020 08:56:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Y/vinrmf; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SV2w263bzDqnF
 for <openbmc@lists.ozlabs.org>; Thu, 27 Feb 2020 08:55:03 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id j34so751867qtk.4
 for <openbmc@lists.ozlabs.org>; Wed, 26 Feb 2020 13:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kz5Z4RCY4Tpl+dTiZNY8WHLRS8ZN2QcNJkbQ+Q8xyIw=;
 b=Y/vinrmfZUGb4fq+pKb29Y9EsFc4bD1+nMlgeHrfy1u6xGdpGS/fXRvACbbsGJyUzo
 7TIcobyFROaCSkZbIxvITnP4BTY4h/0Vvx7EeI6P/LYw/50/s51/GjmbEhWT0l+/s0NM
 fVka0oqTwitvSbujkwZw7IeMbnP18Tl7kkioU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kz5Z4RCY4Tpl+dTiZNY8WHLRS8ZN2QcNJkbQ+Q8xyIw=;
 b=TH+r92TqdJr696oKfZp3kEm+0SxbayYqaTfDT3XACC6ZKmZ7EFP/OfM8+H7R1RInfG
 xB1GcW947gR8nHiSJ8FptS1cx0Vr9SYtHCYIW+iTJlcioPNuas4hxj0FyWN+/k3cf7GG
 SfOL5Bw8HQisv2eqxWWZtn33UorGcmo3KYVtgq4VSXa9J3fdkYsRvz8Xt2kutGvqd5UY
 xFcalFnGCqquA9WOWD/aQUBFzB0puWDT6BfCc0lQtL4AHqkRozmaxFED45Tm3fAGf/GC
 LccTQ4uGmBZgWy3i2qAr5pWvhNPrxJASb5kJdnhfQVMeRyepfxi7EeeotageTcuyhyP0
 QluA==
X-Gm-Message-State: APjAAAWD4myjBliSKKhnLtown4/32VQA+uA5nzC0CWiuIG4P54mFgbnD
 5DqaXXLVRL61s0nGhNRJE7qB28/ZopiAjd+uXxBojQ==
X-Google-Smtp-Source: APXvYqw8nOh2G8ZoxrJsIZtZyjVLpcolN1TY85DBbqoraoX9Ezgx1qHcUq/zZJPUmnIQbLDGCLyH60xyslot66DcPco=
X-Received: by 2002:aed:3841:: with SMTP id j59mr1135369qte.220.1582754099305; 
 Wed, 26 Feb 2020 13:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
In-Reply-To: <20200211234950.4010-1-jae.hyun.yoo@linux.intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 26 Feb 2020 21:54:47 +0000
Message-ID: <CACPK8Xf5qcyBv3yZ7BRu-v4PGmqsvbXnMqoQEhsPyq_JC-wUZQ@mail.gmail.com>
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
> ---
>  drivers/hwmon/peci-cputemp.c  | 2 +-
>  drivers/hwmon/peci-dimmtemp.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  mode change 100644 => 100755 drivers/hwmon/peci-cputemp.c
>  mode change 100644 => 100755 drivers/hwmon/peci-dimmtemp.c

I don't think this was intended.

I fixed it up for you, but please try to figure out what went wrong so
it doesn't happen in the future.

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
