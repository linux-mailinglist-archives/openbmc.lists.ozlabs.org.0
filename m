Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F565B84B
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 11:46:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cjFF05TGzDq5y
	for <lists+openbmc@lfdr.de>; Mon,  1 Jul 2019 19:46:40 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RV3HFiW8"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cjC14rZHzDqTg
 for <openbmc@lists.ozlabs.org>; Mon,  1 Jul 2019 19:44:45 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id r185so27304962iod.6
 for <openbmc@lists.ozlabs.org>; Mon, 01 Jul 2019 02:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AXKWQYK6YLgR0UTOLDchnW6xNrMv3isyK856fj2YaNk=;
 b=RV3HFiW8c9ItjaWDvUez+4eAvUIMmbMbFklcD/+zzZDp07hGPGEQYdJZojV1MTgJKn
 r1DsorPq1zg33Qbl5T6eUMtRXGSzQ5PRUS9x9oHE9m3Bs0mwQyXd4gGJs2vYaJhptGQ3
 IFU0wG1BGJFSE9FT/MzAvZ9FyOOWH8xTrnRVBED5PKkSx7IkcIazsYhiH73a+zAPK6wz
 6Gwt80ylUl7cKGBqjnerZD781tg/EkjkhmnIsDvg6Tm1O0ClWZD1K7iI2r2pKVfNGz/7
 mBn75mqaWOpHpPPxM5hvxZMZooE+c2Qc6fBwGo5z+KPPInQfQuX63sOS1S2IY2Wz4A/+
 JAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AXKWQYK6YLgR0UTOLDchnW6xNrMv3isyK856fj2YaNk=;
 b=PzIp/hCeFCWT4dGwjPxfuD33LC6GBWI71nLnpqWFmoDeviOamb1YKZk0Ei6UfnVZmF
 ylY+0VzMWk8mIautjcpkwsr2n+lF0tDi2M4wP0jW5uSb1tuE/LSHVpL7Hc0vE4rQSvJO
 iAL58iOICiUOWTaOlOadEMJA72l5Gx7NDaKZB8vkPUyzD0eDeYTNBhU7zZd0LTTh9B05
 zzEFxzARTV6pjApckQ//C+DajSPhnx2PZ/NAXpCXPwT+AZKHZVKMTlfCpXF70tJRjD2N
 2tn3CKc2DtgjQl36N5C/kZjqriTkYQWVr0pCjJ0ICk+jkEonmJXwXBm1hADahP42xWzY
 4UNQ==
X-Gm-Message-State: APjAAAWgHKQCyvNwc4jhb0WFfoDl8sBU7e2Alqt1EphqR7DaUlnUZMmg
 VxuU3PD+gOP/kyBTtSSw88LGUhoqU1PkVsMDA7qqTggyoro=
X-Google-Smtp-Source: APXvYqyXPXrj4z0Ql9ihSGwDZGKUhFijMRjvXTqriy8dGVBQiaAxtukg7DRMZlk8t5/F2e73Aq3vPVVtVMiCZg+g0MQ=
X-Received: by 2002:a6b:e615:: with SMTP id g21mr3679834ioh.178.1561974280922; 
 Mon, 01 Jul 2019 02:44:40 -0700 (PDT)
MIME-Version: 1.0
References: <1561576002-5225-1-git-send-email-eajames@linux.ibm.com>
In-Reply-To: <1561576002-5225-1-git-send-email-eajames@linux.ibm.com>
From: Lei YU <mine260309@gmail.com>
Date: Mon, 1 Jul 2019 17:44:29 +0800
Message-ID: <CAARXrtnx6rBAgXVJgjaDKJw3RPWLWdvFWOi0k+5iZjG7YDOX+Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.1] OCC: FSI and hwmon: Add sequence numbering
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

Reviewed-by: Lei YU <mine260309@gmail.com>

On Thu, Jun 27, 2019 at 3:06 AM Eddie James <eajames@linux.ibm.com> wrote:
>
> Sequence numbering of the commands submitted to the OCC is required by
> the OCC interface specification. Add sequence numbering and check for
> the correct sequence number on the response.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-occ.c      | 15 ++++++++++++---
>  drivers/hwmon/occ/common.c |  4 ++--
>  drivers/hwmon/occ/common.h |  1 +
>  3 files changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index a2301ce..7da9c81 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -412,6 +412,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>                 msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>         struct occ *occ = dev_get_drvdata(dev);
>         struct occ_response *resp = response;
> +       u8 seq_no;
>         u16 resp_data_length;
>         unsigned long start;
>         int rc;
> @@ -426,6 +427,8 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>
>         mutex_lock(&occ->occ_lock);
>
> +       /* Extract the seq_no from the command (first byte) */
> +       seq_no = *(const u8 *)request;
>         rc = occ_putsram(occ, OCC_SRAM_CMD_ADDR, request, req_len);
>         if (rc)
>                 goto done;
> @@ -441,11 +444,17 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
>                 if (rc)
>                         goto done;
>
> -               if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
> +               if (resp->return_status == OCC_RESP_CMD_IN_PRG ||
> +                   resp->seq_no != seq_no) {
>                         rc = -ETIMEDOUT;
>
> -                       if (time_after(jiffies, start + timeout))
> -                               break;
> +                       if (time_after(jiffies, start + timeout)) {
> +                               dev_err(occ->dev, "resp timeout status=%02x "
> +                                       "resp seq_no=%d our seq_no=%d\n",
> +                                       resp->return_status, resp->seq_no,
> +                                       seq_no);
> +                               goto done;
> +                       }
>
>                         set_current_state(TASK_UNINTERRUPTIBLE);
>                         schedule_timeout(wait_time);
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index d7cc0d2..e9d7167 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -122,12 +122,12 @@ struct extended_sensor {
>  static int occ_poll(struct occ *occ)
>  {
>         int rc;
> -       u16 checksum = occ->poll_cmd_data + 1;
> +       u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
>         u8 cmd[8];
>         struct occ_poll_response_header *header;
>
>         /* big endian */
> -       cmd[0] = 0;                     /* sequence number */
> +       cmd[0] = occ->seq_no++;         /* sequence number */
>         cmd[1] = 0;                     /* cmd type */
>         cmd[2] = 0;                     /* data length msb */
>         cmd[3] = 1;                     /* data length lsb */
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index fc13f3c..67e6968 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -95,6 +95,7 @@ struct occ {
>         struct occ_sensors sensors;
>
>         int powr_sample_time_us;        /* average power sample time */
> +       u8 seq_no;
>         u8 poll_cmd_data;               /* to perform OCC poll command */
>         int (*send_cmd)(struct occ *occ, u8 *cmd);
>
> --
> 1.8.3.1
>
