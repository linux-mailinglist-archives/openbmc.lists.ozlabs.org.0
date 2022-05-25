Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D59675334B2
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 03:29:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7D574lCmz3bk7
	for <lists+openbmc@lfdr.de>; Wed, 25 May 2022 11:29:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=joQ/Q1DG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42c;
 helo=mail-wr1-x42c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=joQ/Q1DG; dkim-atps=neutral
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7D4j6hHnz2ywN
 for <openbmc@lists.ozlabs.org>; Wed, 25 May 2022 11:29:23 +1000 (AEST)
Received: by mail-wr1-x42c.google.com with SMTP id u27so27203363wru.8
 for <openbmc@lists.ozlabs.org>; Tue, 24 May 2022 18:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mzba+1bqBZLcRm5qZ6rykTzRdXll1pChOXI2HUFHVUA=;
 b=joQ/Q1DGE8r0kvzsNBAYH9YkQ6kevDUnV+vyEt+TRntxuYH52QyFav1papNPG75v9P
 uIj+dx/EM5V1AnJUzEiTrJdGjnKraNBtZL9fEl07storMrgLZu0GNVOSo0Ln/Y+4CXbP
 4FmJWCaOLWmrC+hPVC/Pn7///TCWV4lqfUXUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mzba+1bqBZLcRm5qZ6rykTzRdXll1pChOXI2HUFHVUA=;
 b=ym8kJskY5ZdLCs0TmLBC7h3hScsY/In4pdX2uJU2K3JQln1v7UsOKtdCNErGXs4AnS
 2kzh1Jhh9oS3K8YlEno4NmVBDCiDWT6/IwcXfT6jzSdgQkctCzva6HIgMP0/gct8cb7c
 GPlp3FiK5tbmGlsa9v6xocKhDfyMD/63qL7/39uB5ifDPlBSFjVRS9k/q0Bi8EbLgYll
 xA9PHZ6R8VXp6/az07agNHLCBaj08QqdNUxeA6ofztIggX+WLAyg45GiW7ZvLvwt/HmA
 hOAT9LCxm2EWOQqgBMcws/dhtoooDvnkw5dP4dP5dYD6zHqr1UKPGrZXuPNU63iUjNjt
 Zkaw==
X-Gm-Message-State: AOAM533Wt8iwq0uHVNLYTxpRuPItdLUmRtVAjQ4pgBCbFlt/v5fL2/f5
 3A5d2gGZ7zXt1TB5d3TJvyuhkk+FATFWicIQIWa0HLBVnaU=
X-Google-Smtp-Source: ABdhPJwezzy94LxeMA1iv62VUkeBPFlmzZoZ7v7IEo4+3SW+QtvyxngsJ/X8AKm66xM5KooZidYGvvgI4tbX0dhPuK0=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr8248438wrc.315.1653442159648; Tue, 24
 May 2022 18:29:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220525011138.5882-1-eajames@linux.ibm.com>
In-Reply-To: <20220525011138.5882-1-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 25 May 2022 01:29:07 +0000
Message-ID: <CACPK8Xed4_msPWALtAh7AMwy9g1=1JKeegMgS28sqxbnOjUi3Q@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.15] iio: si7020: Remove reset in probe
To: Eddie James <eajames@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 25 May 2022 at 01:11, Eddie James <eajames@linux.ibm.com> wrote:
>
> I2C commands issued after the SI7020 is starting up or after reset
> can potentially upset the startup sequence. Therefore, the host
> needs to wait for the startup sequence to finish before issuing
> further i2c commands. This is impractical in cases where the SI7020
> is on a shared bus or behind a mux, which may switch channels at
> any time (generating I2C traffic). Therefore, remove the device
> reset in the probe function.
>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/iio/humidity/si7020.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/iio/humidity/si7020.c b/drivers/iio/humidity/si7020.=
c
> index ab6537f136ba..3c55b81ce984 100644
> --- a/drivers/iio/humidity/si7020.c
> +++ b/drivers/iio/humidity/si7020.c
> @@ -115,13 +115,6 @@ static int si7020_probe(struct i2c_client *client,
>                                      I2C_FUNC_SMBUS_READ_WORD_DATA))
>                 return -EOPNOTSUPP;
>
> -       /* Reset device, loads default settings. */
> -       ret =3D i2c_smbus_write_byte(client, SI7020CMD_RESET);
> -       if (ret < 0)
> -               return ret;
> -       /* Wait the maximum power-up time after software reset. */
> -       msleep(15);


../drivers/iio/humidity/si7020.c:111:13: warning: unused variable
=E2=80=98ret=E2=80=99 [-Wunused-variable]
  111 |         int ret;
      |             ^~~

I have fixed it up when applying, but keep that in mind for when you
send upstream.
> -
>         indio_dev =3D devm_iio_device_alloc(&client->dev, sizeof(*data));
>         if (!indio_dev)
>                 return -ENOMEM;
> --
> 2.27.0
>
