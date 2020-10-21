Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA2829479F
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 06:59:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGJFD5YvjzDqjv
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 15:59:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=QbWemZ7F; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGJDW0GRHzDqg7
 for <openbmc@lists.ozlabs.org>; Wed, 21 Oct 2020 15:58:50 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m65so1053278qte.11
 for <openbmc@lists.ozlabs.org>; Tue, 20 Oct 2020 21:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QURKDNAKHD81lMFQ8KR6WnU0YDQYAkK++gJ90ikXMb4=;
 b=QbWemZ7F0Ohutn4eMpdf2RvZkKZlzSBPHvBL3zjTqJdCW6X7MfmO/YjkCmqMU8ldMM
 chRK9jrTed4olAV2TZ7loiFjoW9f7qUEJGb8khXLy9LxQeIZPKtx2diwI8eX+imKhJIB
 jVGGD/w/nWxagg/VYPPjjHKYRmOzW0nUdYlSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QURKDNAKHD81lMFQ8KR6WnU0YDQYAkK++gJ90ikXMb4=;
 b=Phj32u/e5K21t5pQvZCeD+G+MxOYA2QMf+I+n5hdxBU0oZOfz6Wlpi/svXMLW7eSaG
 kir1ehm+JxhsQrvKgmCZqI26AEKKB02iIkZRGjnoUnSdH3AX1wOxiXSrifAVJC9n83aq
 NI6PqoCRr5yhh0F1AafZpCNuNre8dhdMQG6ns/S79JpJAlk3CEGB3wXyotzOdEDKWu87
 Ju4KYcOFUZ4Ewd04N3d0lYc4Z172bmywE2+reop3x1IFXxlZv/EeqrrlH9b1jpn/+fO1
 10qflynhyGNs8MM37ddQFcuGEne/2CD/QilrdCJIs3n5KzvipFORkrFMjtvaS2U3Rw92
 9hxQ==
X-Gm-Message-State: AOAM532fj/rl8aN2MU33zP3yCRRb73dX5k36CosyJgnKOgYQXw8wrWHh
 j4x7a24nq+wxRTeHEieqeUbM9xSJ9w8o9/nvigM=
X-Google-Smtp-Source: ABdhPJxiIijKI6XcyWOGpl4YIy0FN3ktmcC/cXmEj7R5wBWU68H2SgyJc3P+pEyQ5BOjeb0ppgfdqhCni0EYcNLapCU=
X-Received: by 2002:ac8:5b82:: with SMTP id a2mr1552322qta.176.1603256326047; 
 Tue, 20 Oct 2020 21:58:46 -0700 (PDT)
MIME-Version: 1.0
References: <20201014083057.1026-1-wangzhiqiang.bj@bytedance.com>
In-Reply-To: <20201014083057.1026-1-wangzhiqiang.bj@bytedance.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 21 Oct 2020 04:58:34 +0000
Message-ID: <CACPK8XcFuJrE91teZcbtRMz5v4o4w+-mViAP8n+nBGJtzbCSgw@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8] ARM: dts: aspeed: g220a: Add some gpios
To: John Wang <wangzhiqiang.bj@bytedance.com>
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
 =?UTF-8?B?6YOB6Zu3?= <yulei.sh@bytedance.com>, xuxiaohan@bytedance.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 14 Oct 2020 at 08:31, John Wang <wangzhiqiang.bj@bytedance.com> wrote:
>
> Add GPIO STRAP_BMC_BATTERY_GPIOS5, which is used for battery
> adc sensor.
>
> Change the INTRUDER_N to CHASSIS_INTRUSION, to make it
> more meaningful
>
> Signed-off-by: John Wang <wangzhiqiang.bj@bytedance.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> index 7eaf3a4e20db..89916a2eec18 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-bytedance-g220a.dts
> @@ -316,11 +316,11 @@ &gpio {
>         /*N0-N7*/       "","","","","","","","",
>         /*O0-O7*/       "","","","","","","","",
>         /*P0-P7*/       "","","","","","","","",
> -       /*Q0-Q7*/       "","","","","","","FM_PCH_THERMTRIP_N","INTRUDER_N",
> +       /*Q0-Q7*/       "","","","","","","FM_PCH_THERMTRIP_N","CHASSIS_INTRUSION",
>         /*R0-R7*/       "","PVCCIN_CPU1_SMBALERT_N","BMC_PREQ_R_N","FAULT_P12V_PCIE_RISER_N",
>                         "ALT_P12V_PCIE_RISER_N","BURN_BOARD_N","PVCCIN_CPU0_SMBALERT_N","",
>         /*S0-S7*/       "BMC_PRDY_N","SIO_POWER_GOOD","FM_BMC_PWR_DEBUG_R_N",
> -                       "FM_BMC_XDP_DEBUG_EN","","","","",
> +                       "FM_BMC_XDP_DEBUG_EN","","STRAP_BMC_BATTERY_GPIOS5","","",
>         /*T0-T7*/       "","","","","","","","",
>         /*U0-U7*/       "","","","","","","","",
>         /*V0-V7*/       "","","","","","","","",
> --
> 2.25.1
>
