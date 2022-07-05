Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768B56636A
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 08:52:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcYK01XXJz303t
	for <lists+openbmc@lfdr.de>; Tue,  5 Jul 2022 16:52:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WZ4XWfN7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WZ4XWfN7;
	dkim-atps=neutral
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LcYJZ19hrz2yn5
	for <openbmc@lists.ozlabs.org>; Tue,  5 Jul 2022 16:52:30 +1000 (AEST)
Received: by mail-wr1-x430.google.com with SMTP id r14so10303584wrg.1
        for <openbmc@lists.ozlabs.org>; Mon, 04 Jul 2022 23:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RlP4FqQS+PTG9ninW2XhKZEJIEEc3nyGrV0dsasgFlA=;
        b=WZ4XWfN7KIimHixwPavYRzo+hsqP1SdtEqiOWwlNf3j/jZpUEi8KEg7hnPwfyyDmge
         VqtDM8G7UtjILDEVvCAaoUMFaj1siC7usbSYuLYsgyT3Va1zaD3kPvou++I0ovp4/6B2
         EdBjfy8FEsoydFfwNlInX8FVX+YEfq8NVwtPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RlP4FqQS+PTG9ninW2XhKZEJIEEc3nyGrV0dsasgFlA=;
        b=Cb+xb97LV9eioJKnNGZYJV/ObvqQZIDtlHII86E39aaXKNQUjMq8cdXZz5O/f4zjMz
         0xRXfKwY8kfRyQj/dsUhu+WpD+2161E13hWbmjFr1XJvt2V6cDrpnmNB2nOTXDCBAWWL
         FfE6h+cyiQPQeR8OO88b+Ra98xlzypZMq9l969oOsCOH9Qr4bX5QwHjnQMX+lT8oh1A4
         pVuTUiBBwr8O82WFlVz0kNGaActVgGs9xIX82Fn3bqjCqq3r/REmVwQ0YMGlhLbn5Mwa
         fmdZbvCZvgQpPsqpNO52Nz1X3cRF8xvA7Z1eJlDivjD/E9csYWNWXOTtTN5zT+ekPRhx
         5LZw==
X-Gm-Message-State: AJIora+jqIYroGqIPPWJ8Ih0+9nd/9gcBmxuVTNj0sIKH7ejNXZxnG3T
	RL3CL0TxDyBjOuNG0LrDtZGBr7ai2BDoCJriu9HUkpim
X-Google-Smtp-Source: AGRyM1tn8hJoO4H5XsbLNHXBdjtd4GcRwTn5RFOlPSwCiUuZYlMRz7fWUE01S8QH+QwEb7WGciHQ5smVb3ttWji6bV0=
X-Received: by 2002:a05:6000:993:b0:21b:8f16:5b3f with SMTP id
 by19-20020a056000099300b0021b8f165b3fmr28576565wrb.628.1657003946710; Mon, 04
 Jul 2022 23:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220630200227.2292079-1-quic_jaehyoo@quicinc.com> <20220630200227.2292079-4-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220630200227.2292079-4-quic_jaehyoo@quicinc.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 5 Jul 2022 06:52:14 +0000
Message-ID: <CACPK8Xd40ruWBoMhC6fZO7VDRX=fchVf22k+Vemce7AxkRN8nw@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/3] board:
 ast2600_qualcomm: add env default
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Graeme Gregory <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Jamie Iles <quic_jiles@quicinc.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 30 Jun 2022 at 20:02, Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrote:
>
> Add env default to dc-scm-v1 board configuration.
>
> Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
> ---
>  .../aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt  | 4 ++++
>  configs/ast2600_qcom_dc_scm_v1_defconfig                      | 2 ++
>  2 files changed, 6 insertions(+)
>  create mode 100644 board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
>
> diff --git a/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
> new file mode 100644
> index 000000000000..9aebd38424ef
> --- /dev/null
> +++ b/board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt
> @@ -0,0 +1,4 @@
> +bootargs=console=ttyS4,115200n8 root=/dev/ram rw
> +bootcmd=bootm 20100000
> +bootdelay=2
> +loadaddr=0x83000000

This looks standard for a SPI boot. Do you really require it?

> diff --git a/configs/ast2600_qcom_dc_scm_v1_defconfig b/configs/ast2600_qcom_dc_scm_v1_defconfig
> index 353882deed26..e602163e1caf 100644
> --- a/configs/ast2600_qcom_dc_scm_v1_defconfig
> +++ b/configs/ast2600_qcom_dc_scm_v1_defconfig
> @@ -67,6 +67,8 @@ CONFIG_USE_ENV_SPI_CS=y
>  CONFIG_ENV_SPI_CS=0
>  CONFIG_USE_ENV_SPI_MAX_HZ=y
>  CONFIG_ENV_SPI_MAX_HZ=100000000
> +CONFIG_USE_DEFAULT_ENV_FILE=y
> +CONFIG_DEFAULT_ENV_FILE="board/aspeed/ast2600_qualcomm/dc-scm-v1-u-boot-env-default.txt"
>  CONFIG_NET_RANDOM_ETHADDR=y
>  CONFIG_REGMAP=y
>  CONFIG_SYSCON=y
> --
> 2.25.1
>
