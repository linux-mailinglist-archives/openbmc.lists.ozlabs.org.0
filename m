Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA9654216C
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 08:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHxsN6yGSz3bnM
	for <lists+openbmc@lfdr.de>; Wed,  8 Jun 2022 16:19:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lhpcQWPY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lhpcQWPY;
	dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHxs15JN9z2x9M
	for <openbmc@lists.ozlabs.org>; Wed,  8 Jun 2022 16:19:32 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id q15so18838089wrc.11
        for <openbmc@lists.ozlabs.org>; Tue, 07 Jun 2022 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oxu/4o4zh+l/7RBxmos9nJg4f3iwHYI4l6I6CyisrAE=;
        b=lhpcQWPYlE1Igw5ctUdKPE2IW5ez3i7V/lXFGJz465V9L3b3ViFBYf7KyUs9/Td35F
         iDchtx6SyIhD5vgkCsdC34ySh6bWux0gQO95WWxFPh/pxgAs2e1kFy9ExPz/4dC1u/i5
         EWcCZ/suiIl7HC9Q/k9FjDKH/TRPZ4sOafrXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oxu/4o4zh+l/7RBxmos9nJg4f3iwHYI4l6I6CyisrAE=;
        b=L85uxoTzX+4Wd1pb7QsF15iBTiv9KgiREXlqbVGVph2aNbGCUM4T2DsBm8d0jHStQe
         1CFj80rASd445alhCd6snGaShV2BgwwToUMG7hHM3xat+CRd9gdEKcYskKlYOCbMuzAb
         R9YHTsHgFVj+VPp2oYHtIsLOmHOB2ebZnq5a2XO50EhlEZ629mPxl+ximZ5JFGpoKLfS
         HdIhBPGqCFVC4+k9OiazGGgdQi8QjIjilI9Wt43ZwakNUU3uL6iidyRZUP1FOAUhdTJD
         1bqyWqUqh2eKF9TJfDNS8mBd159fuCUjMX5ZqnR8LoxL9C03HoCn8FBKzsKlH8RH782U
         y46w==
X-Gm-Message-State: AOAM532cw6jKhipBmkcGEY+1b4lOgVoJEzJ+bfk+A+3q8gbzN/+2mHeq
	curt5a90FxGDErausM1+xqTLsr1YvjjatjA3y6UzL7k5
X-Google-Smtp-Source: ABdhPJwnGGbCNGuyMFcTERCIxWde4ptzAuR3mtKC4VNAtktwvWWQU/P9x24j7wvkS0/i0vvazy6cwvQssUTw5sh/UUY=
X-Received: by 2002:a5d:47c9:0:b0:20f:e7da:6a48 with SMTP id
 o9-20020a5d47c9000000b0020fe7da6a48mr31608584wrc.315.1654669168690; Tue, 07
 Jun 2022 23:19:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220608061455.365123-1-clg@kaod.org> <20220608061455.365123-2-clg@kaod.org>
In-Reply-To: <20220608061455.365123-2-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jun 2022 06:19:16 +0000
Message-ID: <CACPK8XfusuUoFsqhPiUk_KwbG==YOJjgAiEzLbiPEZ_KcPkX-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: aspeed: Remove "spi-flash" compatible
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Jae Hyun Yoo <quic_jaehyoo@quicinc.com>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jun 2022 at 06:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The underlying SoC definitions use compatible "jedec,spi-nor", so does
> the aspeed SPI driver, this to be in sync with Linux and the latest
> U-Boot.

> diff --git a/arch/arm/dts/ast2600-tacoma.dts b/arch/arm/dts/ast2600-tacom=
a.dts
> index 67b3e3013c6b..a29e7e7fa23a 100755
> --- a/arch/arm/dts/ast2600-tacoma.dts
> +++ b/arch/arm/dts/ast2600-tacoma.dts
> @@ -65,7 +65,6 @@
>
>         flash@0 {
>                 // TODO: what compatible strings should be here?
> -               compatible =3D "spi-flash", "sst,w25q256";

Thanks. I had a similar version that also removed these todos. I'll
merge yours and remove the TODOs too.

Reviewed-by: Joel Stanley <joel@jms.id.au>


>                 status =3D "okay";
>                 spi-max-frequency =3D <50000000>;
>                 spi-tx-bus-width =3D <2>;
