Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D238D338235
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 01:24:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxRQ75vD8z3cWb
	for <lists+openbmc@lfdr.de>; Fri, 12 Mar 2021 11:24:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=JLb7Cces;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72c;
 helo=mail-qk1-x72c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=JLb7Cces; dkim-atps=neutral
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxRPw5DsKz2xZr
 for <openbmc@lists.ozlabs.org>; Fri, 12 Mar 2021 11:24:03 +1100 (AEDT)
Received: by mail-qk1-x72c.google.com with SMTP id n79so22680686qke.3
 for <openbmc@lists.ozlabs.org>; Thu, 11 Mar 2021 16:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lm/j+GbCDf4OOHQeboiyUtvHmwjj+FzkBBODE/422vo=;
 b=JLb7CcesTBz4krQTOASeansCLNGPZ4pqU+ulzOAMicphmez2mVZOKKg2Js9x77jMif
 DqPThG/6JjSTRSkQJcfFSiFr17N04qpAz8xQJi3i/2dUJLP2Sx/UKsRTbzKT/tFZUm0I
 TvM6t7qW0CkdIA8dStQohoifwKQJuIlVT5o+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lm/j+GbCDf4OOHQeboiyUtvHmwjj+FzkBBODE/422vo=;
 b=A+PP8EIj0st7cLWEjPih8xTuSsic5CJYucl1OQ6aU7c5ZIGMtbBndF7ws+X5UUuKlV
 velRjMyHqAee8/KthyOea1q1y0UXpOekwjbIHA9lGySpOE7ZapFq3ndc4FzpZtlH0+8e
 ITF/DyFPW1SaZiAmbx4ptIvqB8290ejdMnejIg8VZuFHkqNOBklcfHxDHeR97tdTJH/N
 CB3xc1XT89yFJM7F+Uo7MbDOyGCoudHOmWTY1LliPUtq1LV+t+GUGATvQfoe5AjBSY2H
 o3cSrVOMhtTFJI4CcrG7XIzyr3ZGYFQaeFWpgPHUW54+LhC2q1TUU1N5syXvz6WwgJhV
 c55A==
X-Gm-Message-State: AOAM533uwSIaxuvqekzXw4PC1rfXm3uPCzaSK0mrSC7ZfAhZgk5yGFuh
 Nw8QEU2hTAMrcFhApM+gPxWOFKmKK2WyoMvyqxw=
X-Google-Smtp-Source: ABdhPJzud0cqvpzeJqkccZEFzzniG//8CjGsaTsk88LI/7iWwHQwTZHzAdgD4K4xX27tAabzdbh7NItQdA+Bkl+rvXU=
X-Received: by 2002:a05:620a:c11:: with SMTP id
 l17mr10470866qki.487.1615508641277; 
 Thu, 11 Mar 2021 16:24:01 -0800 (PST)
MIME-Version: 1.0
References: <20210308225419.46530-1-eajames@linux.ibm.com>
 <20210308225419.46530-31-eajames@linux.ibm.com>
In-Reply-To: <20210308225419.46530-31-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 12 Mar 2021 00:23:49 +0000
Message-ID: <CACPK8XeDofks4xzismhcA5oJVnxkc2yWwG65fG1X8HH2ajt79A@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.10 30/35] hwmon: (pmbus/ibm-cffps) Set the
 PMBUS_NO_CAPABILITY flag
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

On Mon, 8 Mar 2021 at 22:56, Eddie James <eajames@linux.ibm.com> wrote:
>
> Several power supplies supported by the IBM CFFPS driver don't
> report valid data in the CAPABILITY register. This results in PEC
> being enabled when it's not supported by the device, and since
> the automatic version detection might fail, disable use of the
> CAPABILITY register across the board for this driver.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/20201222152640.27749-3-eajames@linux.ibm.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I have applied the commits to this driver that have been made upstream:


f7a652182cc7 hwmon: (pmbus/ibm-cffps) Set the PMBUS_NO_CAPABILITY flag
3bce071a301f hwmon: (pmbus) shrink code and remove pmbus_do_remove()

> ---
>  drivers/hwmon/pmbus/ibm-cffps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index 2fb7540ee952..f7bb7bebe045 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -472,7 +472,7 @@ static struct pmbus_driver_info ibm_cffps_info[] = {
>  };
>
>  static struct pmbus_platform_data ibm_cffps_pdata = {
> -       .flags = PMBUS_SKIP_STATUS_CHECK,
> +       .flags = PMBUS_SKIP_STATUS_CHECK | PMBUS_NO_CAPABILITY,
>  };
>
>  static int ibm_cffps_probe(struct i2c_client *client)
> --
> 2.27.0
>
