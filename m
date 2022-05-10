Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86647520B73
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 04:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky2TS36ymz3bwX
	for <lists+openbmc@lfdr.de>; Tue, 10 May 2022 12:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=h5ED8T+r;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::336;
 helo=mail-wm1-x336.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=h5ED8T+r; dkim-atps=neutral
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky2T52Tfwz2yNG
 for <openbmc@lists.ozlabs.org>; Tue, 10 May 2022 12:45:13 +1000 (AEST)
Received: by mail-wm1-x336.google.com with SMTP id k126so9357889wme.2
 for <openbmc@lists.ozlabs.org>; Mon, 09 May 2022 19:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKIX70YFcvjL5X7t0o/wJ6hctGJoGQGCNhSdGURFxsU=;
 b=h5ED8T+r7ib0MTBjN3fG5OvN/hTpu14s4LK77aeIh4KGU4xM3d4zdEMBve0x4IbtnT
 lpF3gsCCxXtE2/jLW+8xnq9A2/5W8eiaKdOwGbSSb2nd2jocMO5YbnqyzuTtTVwwtKQu
 lIyWL5lqUc6Nng3IeCV8CUVDu7ZlePoV6PVpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKIX70YFcvjL5X7t0o/wJ6hctGJoGQGCNhSdGURFxsU=;
 b=3wTid4pzCz8uGJciJar0vnsqFHvSDhVJzX/5ax4Haz5zzS1l2a/frf6h2r+j6IAuwM
 8n6ODXEBUEfQXXVjDinOAIKjnuHzUOq8IvICV6vPM23BjaLbWx0/9DsP4LL99Sd8dcLL
 WMrGRWkigjBYvu5tv55EgNW62kKFE2KeJfiqJ29o7IhCuPZfc+0qSVgu7tpj21kLy92Y
 haxkRA3428Rq7kmiSYvCNpzRbOZzQsJTjaZuzSvNtgZm32pgaL/UerFtt5qeAjMndPQA
 tiDQqgRK6EMHVRB4I1FckaUyvnb6azHmCQo0TRjSfOvbFrFOUnZ4iDKid5NpyTX9grAh
 9B/w==
X-Gm-Message-State: AOAM533Z8EMQWdcmSsyv5P4NE/YPwJ3mLFBNMI5t/OerVz6hAu1jkqMt
 teIzLUddZZInFKzWflNjvg7GMX03q1gEHudtInCP5/M8
X-Google-Smtp-Source: ABdhPJxKeu0RNHg4+nUjubOFUgNrWXgTHBS3V3f6CuZAOo4jgvJOHjCIbZKQMIylWKED7qBweDNCYWi6my7esZdPfY4=
X-Received: by 2002:a7b:cd82:0:b0:389:77ef:66d7 with SMTP id
 y2-20020a7bcd82000000b0038977ef66d7mr18562745wmj.171.1652150710168; Mon, 09
 May 2022 19:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220505202829.31466-1-eajames@linux.ibm.com>
 <20220505202829.31466-4-eajames@linux.ibm.com>
In-Reply-To: <20220505202829.31466-4-eajames@linux.ibm.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 10 May 2022 02:44:58 +0000
Message-ID: <CACPK8XdfPotBg4ZVY5yA79UTKMK+W7XfuRWFs0nfMy7VVceSkg@mail.gmail.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc 3/5] arm: dts:
 ast2600-rainier: Add NPCT75X TPM
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

On Thu, 5 May 2022 at 20:28, Eddie James <eajames@linux.ibm.com> wrote:
>
> Add the TPM device on I2C bus 12.

What happens when a board doesn't have a TPM attached to this bus?

>
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  arch/arm/dts/ast2600-rainier.dts | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm/dts/ast2600-rainier.dts b/arch/arm/dts/ast2600-rainier.dts
> index 8a44fd8a0a..aa91b12ed3 100755
> --- a/arch/arm/dts/ast2600-rainier.dts
> +++ b/arch/arm/dts/ast2600-rainier.dts
> @@ -106,12 +106,14 @@
>
>  &gpio0 {
>         u-boot,dm-pre-reloc;
> +};
> +
> +&i2c12 {
> +       status = "okay";
>
> -       tpm_reset {
> -               u-boot,dm-pre-reloc;
> -               gpio-hog;
> -               output-high;
> -               gpios = <ASPEED_GPIO(R, 0) GPIO_ACTIVE_HIGH>;
> +       tpm@2e {
> +               compatible = "nuvoton,npct75x";
> +               reg = <0x2e>;
>         };
>  };
>
> --
> 2.27.0
>
