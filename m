Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5934901F6
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 07:29:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jchnz3Dpyz3089
	for <lists+openbmc@lfdr.de>; Mon, 17 Jan 2022 17:29:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=dzcCdQoh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=dzcCdQoh; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jchnb2BBfz2xBJ
 for <openbmc@lists.ozlabs.org>; Mon, 17 Jan 2022 17:29:06 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id s12so14138221qkg.6
 for <openbmc@lists.ozlabs.org>; Sun, 16 Jan 2022 22:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lr1n4Qi8nHXa4zTCwWkX2Lr1b5KEP9BAvR58XUL33hM=;
 b=dzcCdQoh1ITXgCpAkspSVZA9JmEbvBLpKiLVqsLTH96+bWoG/AjyAcRuISY6kNWRxR
 eGsMohZoJsEambuBMTq2t4+9qrvzU/ETgqXBSlW52KdJgmIU/BCDfI75wFosZUzxF4G0
 mItJop7lGdZlGHasmGjGGiEIsGuRjZpALlkTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lr1n4Qi8nHXa4zTCwWkX2Lr1b5KEP9BAvR58XUL33hM=;
 b=DDHWlqWz4AMYnTuaYxKGox+da18tWQquCT5CWdXK4ZjfvCvaXzmkGaaWdTf+78Qk2T
 4qgu1qTvFGIHiDpkozYMhz3RRum5OTkjze/PTOtO+u6UmzeRySl9spaJsWWqcsd2g7+4
 i3uI3PR4KgmjQn1qnPtxMCNHXpGdcIqPT9X2VrY6csdHXnWUSReh5E4GsTnq7KCWar09
 AWLFYCJFPGC59DFfnHHLoiAeXCVU3WlZHrhJuiaVqXSH5N7+7GOZw1uzQ2hrAkqirdU2
 Jb7z9dbBrpSrrLahBR2ylhQ/4X7oc/GUYQMDETfHfznq4RQkRcM5+Mee6X2ZSn/omWqo
 LANw==
X-Gm-Message-State: AOAM530eHmRMdIZkchP75jHyxv5P4nXTFCYxlj/pBxzMwDx57/70uiJh
 i7yxV0a8hcj61xiY1bnItTkOOi4UFZxuftjE9p0=
X-Google-Smtp-Source: ABdhPJwo8f1Iqa9aYU2XRnxLWQaP3pwtUhmIpI2VxJo9i5rUgOrDjAiqEGJ6WZ2/sobbDu+R+OgR8KIYtgXE2TYmALI=
X-Received: by 2002:a37:94c2:: with SMTP id
 w185mr13097215qkd.666.1642400942441; 
 Sun, 16 Jan 2022 22:29:02 -0800 (PST)
MIME-Version: 1.0
References: <20220114032708.2532-1-Lulu_Su@wistron.com>
In-Reply-To: <20220114032708.2532-1-Lulu_Su@wistron.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 17 Jan 2022 06:28:50 +0000
Message-ID: <CACPK8Xf817U7_6ww9m7Jxa6W9OGpTLGfPpzioW1mzv=PmSMuWA@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.4 v1] hwmon: (pmbus) Add a PMBUS_NO_CAPABILITY
 platform data flag
To: Lulu Su <Lulu_Su@wistron.com>
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
 Eddie James <eajames@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

I note that you're targeting v5.4 for this patch. I don't know anyone
working on maintaining this kernel tree in the openbmc project.

I suggest you move your platform to the latest LTS, v5.15. This patch
is already present in that tree.

On Mon, 17 Jan 2022 at 06:27, Lulu Su <Lulu_Su@wistron.com> wrote:
>
> From: Eddie James <eajames@linux.ibm.com>
>
> Some PMBus chips don't respond with valid data when reading the
> CAPABILITY register. Add a flag that device drivers can set so
> that the PMBus core driver doesn't use CAPABILITY to determine it's
> behavior.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/20201222152640.27749-2-eajames@linux.ibm.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> (cherry picked from commit e5befc024cb4515d815662ed8746712cc5366bfc)
> ---
>  drivers/hwmon/pmbus/pmbus_core.c | 8 +++++---
>  include/linux/pmbus.h            | 9 +++++++++
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index f7fc388..0f381558 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -2156,9 +2156,11 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
>         }
>
>         /* Enable PEC if the controller supports it */
> -       ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> -       if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
> -               client->flags |= I2C_CLIENT_PEC;
> +       if (!(data->flags & PMBUS_NO_CAPABILITY)) {
> +               ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
> +               if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK))
> +                       client->flags |= I2C_CLIENT_PEC;
> +       }
>
>         if (data->info->pages)
>                 pmbus_clear_faults(client);
> diff --git a/include/linux/pmbus.h b/include/linux/pmbus.h
> index 08468fc..74e1be0 100644
> --- a/include/linux/pmbus.h
> +++ b/include/linux/pmbus.h
> @@ -25,6 +25,15 @@
>   */
>  #define PMBUS_SKIP_STATUS_CHECK        (1 << 0)
>
> +/*
> + * PMBUS_NO_CAPABILITY
> + *
> + * Some PMBus chips don't respond with valid data when reading the CAPABILITY
> + * register. For such chips, this flag should be set so that the PMBus core
> + * driver doesn't use CAPABILITY to determine it's behavior.
> + */
> +#define PMBUS_NO_CAPABILITY                    BIT(2)
> +
>  struct pmbus_platform_data {
>         u32 flags;              /* Device specific flags */
>
> --
> 2.7.4
>
>
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
> This email contains confidential or legally privileged information and is for the sole use of its intended recipient.
> Any unauthorized review, use, copying or distribution of this email or the content of this email is strictly prohibited.
> If you are not the intended recipient, you may reply to the sender and should delete this e-mail immediately.
> ---------------------------------------------------------------------------------------------------------------------------------------------------------------
>
