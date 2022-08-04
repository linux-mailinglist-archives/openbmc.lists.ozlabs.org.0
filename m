Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3A589651
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 04:56:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LytfM3TjCz3bPP
	for <lists+openbmc@lfdr.de>; Thu,  4 Aug 2022 12:56:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QQ+0VKnA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=QQ+0VKnA;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lytdv6Yr4z2xrL
	for <openbmc@lists.ozlabs.org>; Thu,  4 Aug 2022 12:56:01 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id bv3so9757267wrb.5
        for <openbmc@lists.ozlabs.org>; Wed, 03 Aug 2022 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5cVstdr6z2hj1vev1Z8E/nks9A3iPhQeLLV+FzzNGRs=;
        b=QQ+0VKnAZSwbHlxDLuB93YK2aEu1XT/wWDyNFYcVTbCCLIEKgKrQe3yuFmN7/QVZuT
         GHFur5/7Z7jcy3rbSpK5ACuomoWYXiH79xoNqcFEyR7SGyP6T/JxgNTrJ4qpcTyuQcry
         H/wnTFQSxFS0cAZ/f7AzzZGAejyQFYA1wAnlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5cVstdr6z2hj1vev1Z8E/nks9A3iPhQeLLV+FzzNGRs=;
        b=3Il3CqAQxmse6myp1zBDozPos07WJnQHJ2Q6Hm/PqZ7PG4VO8jMhcXjnKeDDl0tOUH
         8rcopX3Qjak9KhN/Z7yAfQTevfgO0XVjmcgvjXeKfXjCamp7gXZ+GuZuXZXuHrtJ4ZEf
         Mi/ohfWU8OrkHho8Y4oRfrJWPv0opmIZmLvSu7p9foKfGYHpwyzqZaqUyWSWHd/82Q0l
         Uwllq0GzWdvlRCfYqnlb922AEPJPS/fWTlGRdlAinSAiZ4e984ulF6I51AkqbbfPS0WI
         osykrjquR475LBX7RPpm9INFu95caTLSmhxpGBE9VmwQXxWSju8QxKTY9QBTbF7u3Oir
         0TyQ==
X-Gm-Message-State: ACgBeo2k6kqRDAE4AMwFl5neUssgq7eVdiTEsqV4Gm3wqBIK8TdrrAeg
	lSZJJnzry+UmoxNsyFnDaJevtYuVzT59x3Y0Ka3e+sLE
X-Google-Smtp-Source: AA6agR6bHRl1Mc+jCu6P2l775CyDSpTctf+H7L/hTs950ELYMFjk3uxCgwlf3sgvjxdNxNDqTKsSVMLMN8VMW5KvtE8=
X-Received: by 2002:a05:6000:1ac8:b0:220:6af3:935d with SMTP id
 i8-20020a0560001ac800b002206af3935dmr8668991wry.549.1659581757898; Wed, 03
 Aug 2022 19:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220720201558.11337-1-eajames@linux.ibm.com>
In-Reply-To: <20220720201558.11337-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 4 Aug 2022 02:55:45 +0000
Message-ID: <CACPK8Xd_10O+XgU-4pzMFK6-oSb05sqaFN2M2=3cs17pJ5R++w@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15 1/2] hwmon: (occ) Prevent power cap command
 overwriting poll response
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 20 Jul 2022 at 20:16, Eddie James <eajames@linux.ibm.com> wrote:
>
> Currently, the response to the power cap command overwrites the
> first eight bytes of the poll response, since the commands use
> the same buffer. This means that user's get the wrong data between
> the time of sending the power cap and the next poll response update.
> Fix this by specifying a different buffer for the power cap command
> response.
>
> Fixes: 5b5513b88002 ("hwmon: Add On-Chip Controller (OCC) hwmon driver")
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> Link: https://lore.kernel.org/r/20220628203029.51747-1-eajames@linux.ibm.com
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I've applied this and the second patch.

> ---
>  drivers/hwmon/occ/common.c |  5 +++--
>  drivers/hwmon/occ/common.h |  3 ++-
>  drivers/hwmon/occ/p8_i2c.c | 13 +++++++------
>  drivers/hwmon/occ/p9_sbe.c | 10 ++++------
>  4 files changed, 16 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index f00cd59f1d19..1757f3ab842e 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -145,7 +145,7 @@ static int occ_poll(struct occ *occ)
>         cmd[6] = 0;                     /* checksum lsb */
>
>         /* mutex should already be locked if necessary */
> -       rc = occ->send_cmd(occ, cmd, sizeof(cmd));
> +       rc = occ->send_cmd(occ, cmd, sizeof(cmd), &occ->resp, sizeof(occ->resp));
>         if (rc) {
>                 occ->last_error = rc;
>                 if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
> @@ -182,6 +182,7 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>  {
>         int rc;
>         u8 cmd[8];
> +       u8 resp[8];
>         __be16 user_power_cap_be = cpu_to_be16(user_power_cap);
>
>         cmd[0] = 0;     /* sequence number */
> @@ -198,7 +199,7 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>         if (rc)
>                 return rc;
>
> -       rc = occ->send_cmd(occ, cmd, sizeof(cmd));
> +       rc = occ->send_cmd(occ, cmd, sizeof(cmd), resp, sizeof(resp));
>
>         mutex_unlock(&occ->lock);
>
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index 2dd4a4d240c0..726943af9a07 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -96,7 +96,8 @@ struct occ {
>
>         int powr_sample_time_us;        /* average power sample time */
>         u8 poll_cmd_data;               /* to perform OCC poll command */
> -       int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len);
> +       int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len, void *resp,
> +                       size_t resp_len);
>
>         unsigned long next_update;
>         struct mutex lock;              /* lock OCC access */
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index 9e61e1fb5142..c35c07964d85 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -111,7 +111,8 @@ static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
>                                       be32_to_cpu(data1));
>  }
>
> -static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
> +static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
> +                              void *resp, size_t resp_len)
>  {
>         int i, rc;
>         unsigned long start;
> @@ -120,7 +121,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>         const long wait_time = msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>         struct p8_i2c_occ *ctx = to_p8_i2c_occ(occ);
>         struct i2c_client *client = ctx->client;
> -       struct occ_response *resp = &occ->resp;
> +       struct occ_response *or = (struct occ_response *)resp;
>
>         start = jiffies;
>
> @@ -151,7 +152,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>                         return rc;
>
>                 /* wait for OCC */
> -               if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
> +               if (or->return_status == OCC_RESP_CMD_IN_PRG) {
>                         rc = -EALREADY;
>
>                         if (time_after(jiffies, start + timeout))
> @@ -163,7 +164,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>         } while (rc);
>
>         /* check the OCC response */
> -       switch (resp->return_status) {
> +       switch (or->return_status) {
>         case OCC_RESP_CMD_IN_PRG:
>                 rc = -ETIMEDOUT;
>                 break;
> @@ -192,8 +193,8 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>         if (rc < 0)
>                 return rc;
>
> -       data_length = get_unaligned_be16(&resp->data_length);
> -       if (data_length > OCC_RESP_DATA_BYTES)
> +       data_length = get_unaligned_be16(&or->data_length);
> +       if ((data_length + 7) > resp_len)
>                 return -EMSGSIZE;
>
>         /* fetch the rest of the response data */
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index d34d6a007e8d..ad2fcc31db78 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -79,13 +79,11 @@ static bool p9_sbe_occ_save_ffdc(struct p9_sbe_occ *ctx, const void *resp,
>         return notify;
>  }
>
> -static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
> +static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len,
> +                              void *resp, size_t resp_len)
>  {
> -       struct occ_response *resp = &occ->resp;
>         struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
> -       size_t resp_len = sizeof(*resp);
> -       int i;
> -       int rc;
> +       int rc, i;
>
>         for (i = 0; i < OCC_CHECKSUM_RETRIES; ++i) {
>                 rc = fsi_occ_submit(ctx->sbe, cmd, len, resp, &resp_len);
> @@ -102,7 +100,7 @@ static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>                         return rc;
>         }
>
> -       switch (resp->return_status) {
> +       switch (((struct occ_response *)resp)->return_status) {
>         case OCC_RESP_CMD_IN_PRG:
>                 rc = -ETIMEDOUT;
>                 break;
> --
> 2.31.1
>
