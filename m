Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A54718054
	for <lists+openbmc@lfdr.de>; Wed,  8 May 2019 21:16:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zmS71Bt0zDqMK
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 05:16:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::144; helo=mail-it1-x144.google.com;
 envelope-from=benjaminfair@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="eAcoUAqn"; 
 dkim-atps=neutral
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zmRN6DlwzDqHZ
 for <openbmc@lists.ozlabs.org>; Thu,  9 May 2019 05:16:16 +1000 (AEST)
Received: by mail-it1-x144.google.com with SMTP id q19so5784198itk.3
 for <openbmc@lists.ozlabs.org>; Wed, 08 May 2019 12:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RZJ3D8bV/YbFEQQZpQWkUqF8GPUZ3bEpp6miTQlyyfw=;
 b=eAcoUAqnE2kRcWQD3CymIrhRRoroeGVAk8kZRS03hnHrN8n0M0g8nbRKyaxPuQT8Q0
 aNaOxRYznbnSfBKTOCEWStr4X/g4PzuwPg8ByTNiiPR2Y3MNxHWOc2MPzYr9dfvd5aUD
 tNQpZFDHtm4pK7HD26OY8K8ruUGTEpm0sqL+dPmwLRBKF5SaSd1drV+7AYvCFeUVUjZL
 DfE8QMotP+HVLq5rlINCc3qbV4OXiy7DS2lMRGD7ZgJse/PP8P3YTDWCr4wgAyglh7Eo
 oMSrYf7Pd44wYWHRfLYLJdc74D3OIlLAEs5RBPKDOB2kNM18b0DE0KniKP3SVlj9Ir1y
 2HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RZJ3D8bV/YbFEQQZpQWkUqF8GPUZ3bEpp6miTQlyyfw=;
 b=Lh+rJ+v+6caQrx+vKCty/BxeclOcQyH/h/2MKQyehrZaJNuYczeOC7rybzvZ1Ib0+1
 c3fh0e8F4MTPKrAoTGtSN3un095hVkiclCoCeifYJ4sBS4d20YtXBzmRw1iqM5Ag/iHA
 y5vvJtsUDFMiIrKhuaSl2jKGtfzh4FMNN6y3uh57icGeIUdP2OAP8S3k3G78dAKZlTlh
 rohQfJv4RzQ7fJGJ9vlyVzUOI4h8rUGFKowxZjT1ojPBVRuhK40O+omsbkOxmGadYOrX
 CJJrmgdoX5Nub/0O0RHKYxOMb0rYQtVmPfnmAtxJNKe6/+k0O3VmQwuj9bIPjs1b9aVS
 /anQ==
X-Gm-Message-State: APjAAAV5z3zSwOBk8dilAwvAFSNmK3cl2aZjVMKDcQwjRB5LvRyG4pZC
 60ppcBfm7YGieH0EckYUucEkcQNhVNmsRa4M1MSJKQ==
X-Google-Smtp-Source: APXvYqzX1SL40jwINzIaONEpA+HKCpwETTDW40pABWrgPAEXsgiCXokaqs1Z0BDkxPaHvPiLM4A+S7FuGbYbxndJ2K8=
X-Received: by 2002:a24:65cd:: with SMTP id u196mr344068itb.74.1557342974215; 
 Wed, 08 May 2019 12:16:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190412140132.39764-1-fran.hsu@quantatw.com>
 <20190412140132.39764-3-fran.hsu@quantatw.com>
In-Reply-To: <20190412140132.39764-3-fran.hsu@quantatw.com>
From: Benjamin Fair <benjaminfair@google.com>
Date: Wed, 8 May 2019 12:15:38 -0700
Message-ID: <CADKL2t7VhVkFGc90=OaBwcWrHBVYk4nvKDhpKN_LpD6TrAf7kw@mail.gmail.com>
Subject: Re: [PATCH dev-5.0 v2 3/4] ARM: dts: nuvoton: Add Quanta GSJ BMC
 machine.
To: =?UTF-8?B?RnJhbiBIc3UgKOW+kOiqjOismSk=?= <fran.hsu@quantatw.com>
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

On Fri, Apr 12, 2019 at 7:01 AM <fran.hsu@quantatw.com> wrote:
>
> From: FranHsu <Fran.Hsu@quantatw.com>
>
> Add a flash layout dtsi file for Quanta GSJ BMC.
>
> Signed-off-by: FranHsu <Fran.Hsu@quantatw.com>

Reviewed-by: Benjamin Fair <benjaminfair@google.com>

> ---
>  .../dts/nuvoton-npcm730-gsj-flash-layout.dtsi | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi
>
> diff --git a/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi b/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi
> new file mode 100644
> index 000000000000..6c406fb8504c
> --- /dev/null
> +++ b/arch/arm/boot/dts/nuvoton-npcm730-gsj-flash-layout.dtsi
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +partitions@80000000 {
> +               compatible = "fixed-partitions";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               bmc@0{
> +                       label = "bmc";
> +                       reg = <0x000000 0x2000000>;
> +               };
> +               u-boot@0 {
> +                       label = "u-boot";
> +                       reg = <0x0000000 0x80000>;
> +                       read-only;
> +               };
> +               u-boot-env@100000{
> +                       label = "u-boot-env";
> +                       reg = <0x00100000 0x40000>;
> +               };
> +               kernel@200000 {
> +                       label = "kernel";
> +                       reg = <0x0200000 0x600000>;
> +               };
> +               rofs@800000 {
> +                       label = "rofs";
> +                       reg = <0x800000 0x1400000>;
> +               };
> +               rwfs@1c00000 {
> +                       label = "rwfs";
> +                       reg = <0x1c00000 0x300000>;
> +               };
> +               reserved@1f00000 {
> +                       label = "reserved";
> +                       reg = <0x1f00000 0x100000>;
> +               };
> +};
> --
> 2.21.0
>
