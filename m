Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93535D14B
	for <lists+openbmc@lfdr.de>; Mon, 12 Apr 2021 21:43:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJzgR6gkVz30HK
	for <lists+openbmc@lfdr.de>; Tue, 13 Apr 2021 05:43:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=cmFkGGrM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::232;
 helo=mail-oi1-x232.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cmFkGGrM; dkim-atps=neutral
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJzfv1q1Wz3bpQ
 for <openbmc@lists.ozlabs.org>; Tue, 13 Apr 2021 05:43:01 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id d12so14573130oiw.12
 for <openbmc@lists.ozlabs.org>; Mon, 12 Apr 2021 12:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=PeEjr0Cm0Lq/v3q75Z7EsZ9GiyYbuo+6WpLe06toBfM=;
 b=cmFkGGrMNaApVw7yw8IMAf9Xu+PsM8FaVhMsdBhim+v0AmO2dXmm2QYjFNz1byCHxD
 VwJpLFrnBpL3IYKBxDzlolWe94zaft4/7F4prrLo6PpLpJRsy8Rz7Mbyrpb6+dAkfYRS
 z063ecwmpGm8fzvxPuzbv4suoPzqzFrTfulaD1dRg2x2yqz+XS4qoCdNC/18axFnLj2s
 zj1Yw2rZrXaX+6ye9GBxcP/p5XPenr51ueNNtbfMsCGwmqoxBt9llyZx50hI8K/DH7i1
 DjudVNCAcZrXVTklCzHX+CfzFpasxBzvii9oQ9z86xedQcVKg2vcAedbl0F2lk8F8V7E
 H5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=PeEjr0Cm0Lq/v3q75Z7EsZ9GiyYbuo+6WpLe06toBfM=;
 b=pBx995EO4JjV8y/yu3BhlCtmv7v+dqKJJY7V8/V2AxthBz72WDZ+3TqeJ0urhpqn3Y
 THWvQP5yXL5aOmDc3cIcObMaxc00rJCA6T+T6muFRtpyWR+K5ezbAkHUKf4+5rFYThDA
 jNMNyfCNu9BsSCxTJcpszlvcp5AZgC0bI00WACDM+nBXJrAIoNcmILz/Stj9qWaEZVRu
 KF9HFqh6MwbuMYy/kGWdLo1K88zpVqplNMS+OegkWjRqtnOVrkpJaAtjzbAjZ5cIW8y7
 QhePlyCLSxipbtSUw25m+JuELqW+7H0V5J3OFOqBsasZP30gO6sFrKmqDYZfHIG9sLbq
 uayg==
X-Gm-Message-State: AOAM533M1o7KExO5Q+Sy2wWe42bOV3BbAjpG/Ge9yshQzQ9ko7sPY7ke
 YqMCrOVSZcsHA2EfelSysQLO7HHL09ugJQ==
X-Google-Smtp-Source: ABdhPJyUkm4TOlOovgrD7s8LH2689A3XpCASRiB7l3zVKjkJ7zXPbIuI9p13Y1T5JBocn+0ox4JiGg==
X-Received: by 2002:a54:4494:: with SMTP id v20mr570444oiv.147.1618256577301; 
 Mon, 12 Apr 2021 12:42:57 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:b0a8:10fa:7be8:8905])
 by smtp.gmail.com with ESMTPSA id p24sm1529747oth.63.2021.04.12.12.42.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Apr 2021 12:42:57 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH linux dev-5.10 3/3] ARM: dts: aspeed: Add Rainier 1S4U
 machine
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <20210310173222.17556-3-eajames@linux.ibm.com>
Date: Mon, 12 Apr 2021 14:42:56 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <657EB644-62DF-4D57-81E3-C21EFE3E31A7@gmail.com>
References: <20210310173222.17556-1-eajames@linux.ibm.com>
 <20210310173222.17556-3-eajames@linux.ibm.com>
To: Eddie James <eajames@linux.ibm.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
Cc: openbmc Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Mar 10, 2021, at 11:32 AM, Eddie James <eajames@linux.ibm.com> =
wrote:
>=20
> The 1S4U version of the Rainier system has only 4 fans. Create a new
> tree, include the 4U version, and delete the 2 extra fans.
>=20
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> arch/arm/boot/dts/Makefile                        |  1 +
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts | 14 ++++++++++++++
> arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts      |  2 +-
> 3 files changed, 16 insertions(+), 1 deletion(-)
> create mode 100644 arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
>=20
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 7b24be9cf961..535a467822f9 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1398,6 +1398,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> 	aspeed-bmc-ibm-everest.dtb \
> 	aspeed-bmc-ibm-rainier.dtb \
> 	aspeed-bmc-ibm-rainier-v2.dtb \
> +	aspeed-bmc-ibm-rainier-1s4u.dtb \
> 	aspeed-bmc-ibm-rainier-4u.dtb \
> 	aspeed-bmc-ibm-rainier-4u-v2.dtb \
> 	aspeed-bmc-intel-s2600wf.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
> new file mode 100644
> index 000000000000..78b2dab63624
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier-1s4u.dts
> @@ -0,0 +1,14 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +// Copyright 2021 IBM Corp.
> +/dts-v1/;
> +
> +#include "aspeed-bmc-ibm-rainier-4u-v2.dts"
> +
> +/ {
> +	model =3D "Rainier 1S4U";
> +};
> +
> +&max {
> +	/delete-node/ fan4;

Testing brought to light that the hardware actually uses slots 0, 1, 2, =
and 4
for the 4 fans. So need to replace the delete of fan4 here with fan3.

Otherwise, looks good, thanks.

> +	/delete-node/ fan5;
> +};
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts =
b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 9f34136ec40f..dad90a152174 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -1978,7 +1978,7 @@ tmp275@48 {
> 		reg =3D <0x48>;
> 	};
>=20
> -	max31785@52 {
> +	max: max31785@52 {
> 		compatible =3D "maxim,max31785a";
> 		reg =3D <0x52>;
> 		#address-cells =3D <1>;
> --=20
> 2.27.0
>=20

