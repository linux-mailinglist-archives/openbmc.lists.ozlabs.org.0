Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6AF3D06CC
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 04:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV0JV71XPz3bPL
	for <lists+openbmc@lfdr.de>; Wed, 21 Jul 2021 12:43:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=SB3u7/fh;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=SB3u7/fh; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV0JG0HJJz2yNT;
 Wed, 21 Jul 2021 12:43:24 +1000 (AEST)
Received: by mail-qk1-x72a.google.com with SMTP id s193so834509qke.4;
 Tue, 20 Jul 2021 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pBE5exiuCrDCx7ColZNpX2FjRqVvNIpBf5nUfYEkrIA=;
 b=SB3u7/fhvpu+LlaxdIPXmvmT7FgNnfYk43t/NGSfLjeReFhz1w54Q6A/0UG/kI8KIw
 kz3dVLzJr2UmHeX9GVkF7kG7ZJPWcpANs1WsJg9eUGatuNc5BMhypavNHEfeEON6PwGM
 P99HM3t8lL2SGSfTKU/kxfEAoAlk/X8aJ2mB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pBE5exiuCrDCx7ColZNpX2FjRqVvNIpBf5nUfYEkrIA=;
 b=TQmOWcP2qwGlchCRskVuhdmPZWC3bVLZ9u9Dfk7CMMWd+VKk/VPZ+Dc8tAcp1cE8OI
 UqJadec5TCjEUXe0+YkKwyErL5ElzdVT6iJVukCmgiB2XYbJZ9FtD50y1B5DcwZWMJU3
 RB6fdItuuohhQYCuaki9FE8VmSRVoO79xN+V6i7bo21kGuHLz3/OEEgEpZKPbuS9pGIY
 XjZ0SajHEVIpP7DSxU+5AN26Xu+PR4c9U6D35w1h0ZbhZEcNyYW1yHrkAbHw4v174xri
 fJFBd3eHYxzFctAxdlWm++7DMSmQabPYdHfmLYcxK+m9wPEX7GAslMfIXmtFFoz6p50J
 sOTw==
X-Gm-Message-State: AOAM53384IOERw3WfMMg8iYIbpfxlAvgusWX6ju4t1tRs7MiovFgnRae
 sk9aoBPQklWYN2tZ9wvof0n1gBAUdBvUzo/2e90=
X-Google-Smtp-Source: ABdhPJwoJzwZ4xiNcedHkvGHqVMmsjyctAH0RgdeojBVYudaowQhskoAnvek8zoFYjo9JJ+ERWJbzw0IcH3VzeBjQMs=
X-Received: by 2002:a05:620a:56b:: with SMTP id
 p11mr31361136qkp.66.1626835400754; 
 Tue, 20 Jul 2021 19:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-3-eajames@linux.ibm.com>
In-Reply-To: <20210716151850.28973-3-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Jul 2021 02:43:08 +0000
Message-ID: <CACPK8XcgF7i+b8P1AUDRYtWZeMDwG7Mjw74pFpVKVx6ZdJJKzw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hwmon: (occ) Remove sequence numbering and checksum
 calculation
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 16 Jul 2021 at 15:19, Eddie James <eajames@linux.ibm.com> wrote:
>
> Checksumming of the request and sequence numbering is now done in the
> OCC interface driver in order to keep unique sequence numbers. So
> remove those in the hwmon driver.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/hwmon/occ/common.c | 30 ++++++++++++------------------
>  drivers/hwmon/occ/common.h |  3 +--
>  drivers/hwmon/occ/p8_i2c.c | 15 +++++++++------
>  drivers/hwmon/occ/p9_sbe.c |  4 ++--
>  4 files changed, 24 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index 0d68a78be980..fc298268c89e 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -132,22 +132,20 @@ struct extended_sensor {
>  static int occ_poll(struct occ *occ)
>  {
>         int rc;
> -       u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
> -       u8 cmd[8];
> +       u8 cmd[7];

The shortening of the command seems unrelated?

If you leave it at 8 then you avoid the special casing below. Is there
any downside to sending the extra 0 byte at the end?

>         struct occ_poll_response_header *header;
>
>         /* big endian */
> -       cmd[0] = occ->seq_no++;         /* sequence number */
> +       cmd[0] = 0;                     /* sequence number */
>         cmd[1] = 0;                     /* cmd type */
>         cmd[2] = 0;                     /* data length msb */
>         cmd[3] = 1;                     /* data length lsb */
>         cmd[4] = occ->poll_cmd_data;    /* data */
> -       cmd[5] = checksum >> 8;         /* checksum msb */
> -       cmd[6] = checksum & 0xFF;       /* checksum lsb */
> -       cmd[7] = 0;
> +       cmd[5] = 0;                     /* checksum msb */
> +       cmd[6] = 0;                     /* checksum lsb */

> --- a/drivers/hwmon/occ/p8_i2c.c> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -97,18 +97,21 @@ static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
>  }
>
>  static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
> -                                u8 *data)
> +                                u8 *data, size_t len)
>  {
> -       __be32 data0, data1;
> +       __be32 data0 = 0, data1 = 0;
>
> -       memcpy(&data0, data, 4);
> -       memcpy(&data1, data + 4, 4);
> +       memcpy(&data0, data, min(len, 4UL));

The UL here seems unnecessary (and dropping it should fix your 0day
bot warnings).

But I think it would be simpler to go back to a fixed length of 8.

> +       if (len > 4UL) {
> +               len -= 4;
> +               memcpy(&data1, data + 4, min(len, 4UL));
> +       }
>
>         return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
>                                       be32_to_cpu(data1));
>  }
