Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F5E2AFBB6
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 00:46:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWhGM6PGSzDqwV
	for <lists+openbmc@lfdr.de>; Thu, 12 Nov 2020 10:46:51 +1100 (AEDT)
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
 header.s=google header.b=kpb3heQ9; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWhFk5nY1zDqpr
 for <openbmc@lists.ozlabs.org>; Thu, 12 Nov 2020 10:46:14 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id g17so2761904qts.5
 for <openbmc@lists.ozlabs.org>; Wed, 11 Nov 2020 15:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=irUn4gedpqTaDVWpWm4yGu3DsYV7KNDJO7t8HawhtaI=;
 b=kpb3heQ9bbC2bVbDjevOC7/M4gud6i4G7VO7B8gy8PkwoQd10yH1yw9ifB2wEC/htC
 apvISfwbNW6wq5MNG4bxcyV5yNdkLfzJikpJq13AOMXOkKQsukWLsQI6Ao6hkRaiZr9e
 080lUyPZ4pNI2QXATrBS+QVnERTpZ7I6LLtjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=irUn4gedpqTaDVWpWm4yGu3DsYV7KNDJO7t8HawhtaI=;
 b=tF+O/0JoT4tZ0unZLt3bNJQ7KVVgEoZEEYVdZKRpQOS72Izwehd+BnD69yXOqMeBvb
 nlY9NvIL5t/rauQRzt0Lmb14QHP5gSPButszpNFWBAxSBquAA2cqB8uPWFYTYPH2s7Zn
 kkTx15h5QQWReDbOlQPeQkksQXnydMHCPjQnLbkd2tflEJZvsmwGT23DdNh5FGMGwB0L
 2rWa20etyev5O1JLmB2Rwa46S7DmGY3kHl5fe4sdF+xD+BHmzJssHjMarlPzQMWTB8xa
 Eoqh1s3RPlQl2bvg0ffj2dmVNgdJwTrzNmggj0NbKQ1Ol6m88QUSxoRh4upT+i6Xf5aP
 S8FA==
X-Gm-Message-State: AOAM533lhAzKGLddJ/FhjCYVQwClJtrI/PSckTngRA7SKR+npERRXEzr
 9qR9pREZVVqU0tSb7BbpyZLsNzW9EYEXKnpMpwt7wGgkXX0=
X-Google-Smtp-Source: ABdhPJyixrKWHK4r1e4u9psigA9+sdhNEHqFUpnYfhOGavolo+E5PfTM2uIltauEaF6oovwuxquOu+JHQ7PG3eV4UjQ=
X-Received: by 2002:aed:38c8:: with SMTP id k66mr25698392qte.385.1605138370407; 
 Wed, 11 Nov 2020 15:46:10 -0800 (PST)
MIME-Version: 1.0
References: <20201111134427.1579-1-aladyshev22@gmail.com>
In-Reply-To: <20201111134427.1579-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2020 23:45:57 +0000
Message-ID: <CACPK8Xd5JiAL8Zf2Rd5KXkMAk6p9VouAC2oXbbuF37JEconLwQ@mail.gmail.com>
Subject: Re: [PATCH linux dev-5.8 1/3] ARM: dts: aspeed: amd-ethanolx: Enable
 KCS channel 3
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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

On Wed, 11 Nov 2020 at 13:44, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> The KCS interface on the LPC channel 3 in the controller
> is used for the in-band BMC<->BIOS IPMI communication.
> 0xCA2 is a default host CPU LPC IO address for this
> interface.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> Reviewed-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Link: https://lore.kernel.org/r/20201027123722.2935-2-aladyshev22@gmail.com
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I've merged this series into dev-5.8.

Cheers,

Joel

> ---
>  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> index 89ddc3847222..2a86bda8afd8 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> @@ -147,6 +147,11 @@
>         aspeed,lpc-io-reg = <0x62>;
>  };
>
> +&kcs3 {
> +       status = "okay";
> +       aspeed,lpc-io-reg = <0xCA2>;
> +};
> +
>  &kcs4 {
>         status = "okay";
>         aspeed,lpc-io-reg = <0x97DE>;
> --
> 2.17.1
>
