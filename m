Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317663CC3BD
	for <lists+openbmc@lfdr.de>; Sat, 17 Jul 2021 16:05:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GRqcr0x60z30G0
	for <lists+openbmc@lfdr.de>; Sun, 18 Jul 2021 00:05:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=iPGfR4aS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::831;
 helo=mail-qt1-x831.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iPGfR4aS; dkim-atps=neutral
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GRqcS39Lsz2yP3;
 Sun, 18 Jul 2021 00:04:55 +1000 (AEST)
Received: by mail-qt1-x831.google.com with SMTP id v14so9392675qtc.8;
 Sat, 17 Jul 2021 07:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uU5y8nZLYxaj4LFOjlhepM5vk5aGA4uqxvcznWYEcEs=;
 b=iPGfR4aSARgZaiD+uKa5Puk+ePyZOfJv2BgBIUl2qE9ECUY27fxoTuGAYSlgGKLsH9
 aLmDiqVtaA0ntxH1krwzV85QekRTpFewEoLn/Xtr+GOR0cnboK8ZunGndeVLg/1/p4Kc
 d1HoEwujKR3J9VSOox7GyieV1FsQUlsXnp0pxEiuzcuqZFLwBgsnV9irz5TLFUS/nWbf
 wm5M29buQpGhar+bQz3lmfuRJI2msMpjRlAQ95we9A7QdOtawf4kjdk5Q6opvWAmsHz+
 m5biKT+ba8hZrPowK3ft23/uk77WtdPStWy3tb/oqhn8DEKty7PrVPhf7C3mMoToSfe7
 yIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=uU5y8nZLYxaj4LFOjlhepM5vk5aGA4uqxvcznWYEcEs=;
 b=aD35IdN9Ivzv8099eF9xsWEM0jJyungBk7dMrY+Zr/IKQPmeYitCY7a/S9wkyaVDOS
 jjvjYuIaTrmcjGKPui3dMKMKBLoYBrZ6eY/dp3492iX48DEyprApMsvhAhfD3Lvt9CmI
 GYzulacpyV331lx3LtQaMtuQbkUtkKaYx6wJ0rN29dblwuVx5/mv6bA3USHoSlGKUDsT
 vAMkdd9tyrNNI7OJcWNfXh7L1FKctSHlOZQ4uqIxFakllHvWBjKmT3rxNEqCM/yYe1aJ
 oin/ZniZx2nagrfaeSQmMQvI7RHo/Ew8Warpd5CLlWKZozCuytcITpGv88cNAelOLDJm
 REqg==
X-Gm-Message-State: AOAM532rGvTI1aJe9pOq8irtH7E4S0WgA1o79NvlrPupWqzulNtycfos
 a9GLlDQ7ZGY3ly/XUl3N4WM=
X-Google-Smtp-Source: ABdhPJwFYvuuuB/a5eqzYMYHCMb8XXye+hKtya8vbdNjK7AbGw3b4zv8g0xbDCtnV+R6yoHmsHd/qg==
X-Received: by 2002:ac8:7087:: with SMTP id y7mr5979528qto.91.1626530690440;
 Sat, 17 Jul 2021 07:04:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 67sm5192911qkm.134.2021.07.17.07.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 07:04:50 -0700 (PDT)
Date: Sat, 17 Jul 2021 07:04:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/3] hwmon: (occ) Remove sequence numbering and checksum
 calculation
Message-ID: <20210717140448.GA800975@roeck-us.net>
References: <20210716151850.28973-1-eajames@linux.ibm.com>
 <20210716151850.28973-3-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716151850.28973-3-eajames@linux.ibm.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-fsi@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jul 16, 2021 at 10:18:49AM -0500, Eddie James wrote:
> Checksumming of the request and sequence numbering is now done in the
> OCC interface driver in order to keep unique sequence numbers. So
> remove those in the hwmon driver.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

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
>  	int rc;
> -	u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
> -	u8 cmd[8];
> +	u8 cmd[7];
>  	struct occ_poll_response_header *header;
>  
>  	/* big endian */
> -	cmd[0] = occ->seq_no++;		/* sequence number */
> +	cmd[0] = 0;			/* sequence number */
>  	cmd[1] = 0;			/* cmd type */
>  	cmd[2] = 0;			/* data length msb */
>  	cmd[3] = 1;			/* data length lsb */
>  	cmd[4] = occ->poll_cmd_data;	/* data */
> -	cmd[5] = checksum >> 8;		/* checksum msb */
> -	cmd[6] = checksum & 0xFF;	/* checksum lsb */
> -	cmd[7] = 0;
> +	cmd[5] = 0;			/* checksum msb */
> +	cmd[6] = 0;			/* checksum lsb */
>  
>  	/* mutex should already be locked if necessary */
> -	rc = occ->send_cmd(occ, cmd);
> +	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
>  	if (rc) {
>  		occ->last_error = rc;
>  		if (occ->error_count++ > OCC_ERROR_COUNT_THRESHOLD)
> @@ -184,25 +182,23 @@ static int occ_set_user_power_cap(struct occ *occ, u16 user_power_cap)
>  {
>  	int rc;
>  	u8 cmd[8];
> -	u16 checksum = 0x24;
>  	__be16 user_power_cap_be = cpu_to_be16(user_power_cap);
>  
> -	cmd[0] = 0;
> -	cmd[1] = 0x22;
> -	cmd[2] = 0;
> -	cmd[3] = 2;
> +	cmd[0] = 0;	/* sequence number */
> +	cmd[1] = 0x22;	/* cmd type */
> +	cmd[2] = 0;	/* data length msb */
> +	cmd[3] = 2;	/* data length lsb */
>  
>  	memcpy(&cmd[4], &user_power_cap_be, 2);
>  
> -	checksum += cmd[4] + cmd[5];
> -	cmd[6] = checksum >> 8;
> -	cmd[7] = checksum & 0xFF;
> +	cmd[6] = 0;	/* checksum msb */
> +	cmd[7] = 0;	/* checksum lsb */
>  
>  	rc = mutex_lock_interruptible(&occ->lock);
>  	if (rc)
>  		return rc;
>  
> -	rc = occ->send_cmd(occ, cmd);
> +	rc = occ->send_cmd(occ, cmd, sizeof(cmd));
>  
>  	mutex_unlock(&occ->lock);
>  
> @@ -1151,8 +1147,6 @@ int occ_setup(struct occ *occ, const char *name)
>  {
>  	int rc;
>  
> -	/* start with 1 to avoid false match with zero-initialized SRAM buffer */
> -	occ->seq_no = 1;
>  	mutex_init(&occ->lock);
>  	occ->groups[0] = &occ->group;
>  
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index e6df719770e8..5020117be740 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -95,9 +95,8 @@ struct occ {
>  	struct occ_sensors sensors;
>  
>  	int powr_sample_time_us;	/* average power sample time */
> -	u8 seq_no;
>  	u8 poll_cmd_data;		/* to perform OCC poll command */
> -	int (*send_cmd)(struct occ *occ, u8 *cmd);
> +	int (*send_cmd)(struct occ *occ, u8 *cmd, size_t len);
>  
>  	unsigned long next_update;
>  	struct mutex lock;		/* lock OCC access */
> diff --git a/drivers/hwmon/occ/p8_i2c.c b/drivers/hwmon/occ/p8_i2c.c
> index 0cf8588be35a..22af189eafa6 100644
> --- a/drivers/hwmon/occ/p8_i2c.c
> +++ b/drivers/hwmon/occ/p8_i2c.c
> @@ -97,18 +97,21 @@ static int p8_i2c_occ_putscom_u32(struct i2c_client *client, u32 address,
>  }
>  
>  static int p8_i2c_occ_putscom_be(struct i2c_client *client, u32 address,
> -				 u8 *data)
> +				 u8 *data, size_t len)
>  {
> -	__be32 data0, data1;
> +	__be32 data0 = 0, data1 = 0;
>  
> -	memcpy(&data0, data, 4);
> -	memcpy(&data1, data + 4, 4);
> +	memcpy(&data0, data, min(len, 4UL));
> +	if (len > 4UL) {
> +		len -= 4;
> +		memcpy(&data1, data + 4, min(len, 4UL));
> +	}
>  
>  	return p8_i2c_occ_putscom_u32(client, address, be32_to_cpu(data0),
>  				      be32_to_cpu(data1));
>  }
>  
> -static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
> +static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>  {
>  	int i, rc;
>  	unsigned long start;
> @@ -127,7 +130,7 @@ static int p8_i2c_occ_send_cmd(struct occ *occ, u8 *cmd)
>  		return rc;
>  
>  	/* write command (expected to already be BE), we need bus-endian... */
> -	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd);
> +	rc = p8_i2c_occ_putscom_be(client, OCB_DATA3, cmd, len);
>  	if (rc)
>  		return rc;
>  
> diff --git a/drivers/hwmon/occ/p9_sbe.c b/drivers/hwmon/occ/p9_sbe.c
> index f6387cc0b754..9709f2b9c052 100644
> --- a/drivers/hwmon/occ/p9_sbe.c
> +++ b/drivers/hwmon/occ/p9_sbe.c
> @@ -16,14 +16,14 @@ struct p9_sbe_occ {
>  
>  #define to_p9_sbe_occ(x)	container_of((x), struct p9_sbe_occ, occ)
>  
> -static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd)
> +static int p9_sbe_occ_send_cmd(struct occ *occ, u8 *cmd, size_t len)
>  {
>  	struct occ_response *resp = &occ->resp;
>  	struct p9_sbe_occ *ctx = to_p9_sbe_occ(occ);
>  	size_t resp_len = sizeof(*resp);
>  	int rc;
>  
> -	rc = fsi_occ_submit(ctx->sbe, cmd, 8, resp, &resp_len);
> +	rc = fsi_occ_submit(ctx->sbe, cmd, len, resp, &resp_len);
>  	if (rc < 0)
>  		return rc;
>  
