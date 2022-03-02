Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0624C9B36
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 03:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dNW3T64z3bd9
	for <lists+openbmc@lfdr.de>; Wed,  2 Mar 2022 13:29:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Twci9X1s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::230;
 helo=mail-oi1-x230.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Twci9X1s; dkim-atps=neutral
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dN25LPHz30L1
 for <openbmc@lists.ozlabs.org>; Wed,  2 Mar 2022 13:28:46 +1100 (AEDT)
Received: by mail-oi1-x230.google.com with SMTP id s5so519344oic.10
 for <openbmc@lists.ozlabs.org>; Tue, 01 Mar 2022 18:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1TPsb1Z6EjjOdmQqJxeYbGliQj5C8yQIP9zwfos0lVI=;
 b=Twci9X1sOca5bmoSUmGbGl0su7Ca6RB4al1dbsOdQcNsSvxjUx/hkXkuPurSa06DOL
 +J20kPQyOGjFXKuimn/E3tIYZ6WKPNVGNCikVFSSIepOFv+ZFA7eLiWuqBL6Sj+USKd1
 uWwtKYSMRv2hsnxCc+vjCKq/c6hTLH8Qa+dcXmFj2kuphjeUF23raRnXHQxuOtcVlkof
 XMv19sECqiIymV15yvJ+x9TtPZLNQ4sGdUUxEoqy1Efsg6qFjh0W+v1EZdiQ3YfS4eYS
 njrfw3jlpGZ18wKtI0ME7hCitLURXmu5/zfKpwuqi43PTv+MRnyO9Iq8FEv5rgIeQsC0
 swCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1TPsb1Z6EjjOdmQqJxeYbGliQj5C8yQIP9zwfos0lVI=;
 b=DSr6ySWrj4HqT9Z6rdx3eZoEOD71HjNN8yRsEVdIT6tjT5dGe9QA1GxqFfJGUfYIb9
 cTHIJR/SHxtNZIISqcp3nYs2NTxo8H2GHJJHR+i0ct9QTy0EztqJspTlNA+L35IX8rqf
 zKHbQs6tfoPDBLhdv67Om68X1WNJ+KHhRXV2hnBdZDGD+3quc4VQDGYpgcPCh/Vbc1U0
 v///PinQwfNKNzTE7dTB80cH4iibsHN3Ae2pME8XMepyfL9D/3uaGjBjGFCyO0wcPYjZ
 sZZcEZ8mIlOsgBPQBulWNxsewE0ChNQGjN+6en8NLCtkgUVS8MI43U0eMMSjLmNKcRwb
 1ycg==
X-Gm-Message-State: AOAM530b/MwvQGfvro3wc3L3UsIR0MrDWQeT2EnltG3EvypWxrYaNfDB
 AOsMRogYYcWmPAtBnjPeXUw4yLvZgXrdubC+PAmfok5vjJwMmW1f
X-Google-Smtp-Source: ABdhPJy9SMKAIDbTw7QRV9of2nDr5fcfKWYegTb5bEn8OmOp1BXEfJKuZRenor14H1cfzpdt3AggLE79COM2ZBPx1xg=
X-Received: by 2002:a05:6808:211a:b0:2d7:940f:3ee1 with SMTP id
 r26-20020a056808211a00b002d7940f3ee1mr10148072oiw.57.1646188123460; Tue, 01
 Mar 2022 18:28:43 -0800 (PST)
MIME-Version: 1.0
References: <20220214094231.3753686-1-clg@kaod.org>
 <CACPK8XdG=ok4P7Rd-SZ3htPsaXdy76rtMdqgcM6_QM2+fgoeJg@mail.gmail.com>
 <CAHwNHZUMhPeYmev=6Zn+Ay_Le7UBmPurBMokLOB623i0eu2ZOw@mail.gmail.com>
 <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
In-Reply-To: <CACPK8Xf6Zp7Zeu3wrRFHsctEKXfoYkJhbV+PSby0CmP72LC7aQ@mail.gmail.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Wed, 2 Mar 2022 10:28:32 +0800
Message-ID: <CAGm54UGabB9Ji9HBm_d=FnLB5DxMKgvtdnP=2Mc-TJdPo5Ld8Q@mail.gmail.com>
Subject: Re: [External] Re: Call for testing: spi-mem driver for Aspeed SMC
 controllers
To: Joel Stanley <joel@jms.id.au>
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
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>, John Wang <wangzq.jn@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

> I tried to enable quad spi by adjust the device tree:
>
> --- a/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> +++ b/arch/arm/boot/dts/aspeed-ast2600-evb.dts
> @@ -157,10 +157,13 @@ &rtc {
>  };
>
>  &fmc {
> +     pinctrl-names = "default";
> +     pinctrl-0 = <&pinctrl_fwqspid_default>;

We had similar issue, for QSPI it needs to pick FWQSPI related changes
from aspeed-sdk's tree:
https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/drivers/pinctrl/aspeed/pinctrl-aspeed-g6.c#L1322

And with the updated dtsi:
https://github.com/AspeedTech-BMC/linux/blob/aspeed-master-v5.15/arch/arm/boot/dts/aspeed-g6-pinctrl.dtsi#L120

And with the machine dts:
    pinctrl-0 = <&pinctrl_fwqspi_default>;
