Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63148D0C7
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 04:18:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZ8ln2Lcgz30D7
	for <lists+openbmc@lfdr.de>; Thu, 13 Jan 2022 14:18:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=LAWyJiaG;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72f;
 helo=mail-qk1-x72f.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=LAWyJiaG; dkim-atps=neutral
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZ8ks6rMtz2yZW;
 Thu, 13 Jan 2022 14:17:57 +1100 (AEDT)
Received: by mail-qk1-x72f.google.com with SMTP id s12so1296475qkg.6;
 Wed, 12 Jan 2022 19:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FiBmD87n7smzQMQDeZHB6mm8SdQHhbXrtoGI/254RyQ=;
 b=LAWyJiaGMbnBlzy67ihXukao4c1KRhHhCn7RfEdKQmEB40gT9JXyb6m157EiuvGVOE
 /PxN/hDiidM+VCLuf096XyBuxV5fBMNQuE67JFw2JIHMchRo1nAfLGU5Sib4chnHUsTM
 UdPsB8Z6kyZU001GWuXDhnmxNFTos+4aw59Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FiBmD87n7smzQMQDeZHB6mm8SdQHhbXrtoGI/254RyQ=;
 b=uPGZ9RMV0iIU+lDXFzak8NELFZ2BQhwqBAd2Dl176hdiqS0K/Pig2hTKlZ5BhHaW+b
 Cci8qV3vvrxEH6wpPLXz8AAInxle3v3VrllzdQZi0M1sPW8/kYU854V+gDh3SLc4K3BN
 pUsZmIEl/FORTVVriJ/xMO05gDxsJmACelusLwAyqBqXuJOuZg2m63ANHoiMZyYjxQKW
 n9ORiAot+a3ECM5Z835NN1VYLyY+9IfZ5wK6dmUHHdlgI4DPF1wgGkVOB69xDS5EAjv4
 WzkN9dxR6mHVDgUFraXnIktLbxGsNa2Oz0q4SX69iZGOu4gCUduaApTWSAeiYRYnQV6C
 MJMw==
X-Gm-Message-State: AOAM5313NCZEJg06Ztx+nfb1Cso83/VY8SBD/Z/LgK+1TRVvcAvlbTmE
 tr4O0Y7rDsJF6jleycqEnGC53lgMRAvRIbq5SzE=
X-Google-Smtp-Source: ABdhPJwZHZYgvotm7oygzzdLm6RLj5EtzqmsCy8jzni/Q69ijc8yVKgxipA6k47FweFIb1bMy8Eht1BD/2/myLO/Jsg=
X-Received: by 2002:a37:94c2:: with SMTP id w185mr1904124qkd.666.1642043874271; 
 Wed, 12 Jan 2022 19:17:54 -0800 (PST)
MIME-Version: 1.0
References: <20220112230247.982212-1-iwona.winiarska@intel.com>
 <20220112230247.982212-2-iwona.winiarska@intel.com>
In-Reply-To: <20220112230247.982212-2-iwona.winiarska@intel.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 13 Jan 2022 03:17:42 +0000
Message-ID: <CACPK8Xfi33mr38_sdxF_Hi8Pw7VHzxH0zJd09gQz0voJm2xDBA@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] dt-bindings: Add generic bindings for PECI
To: Iwona Winiarska <iwona.winiarska@intel.com>
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, linux-doc@vger.kernel.org,
 Dave Hansen <dave.hansen@intel.com>, Zev Weiss <zweiss@equinix.com>,
 Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, devicetree <devicetree@vger.kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Arnd Bergmann <arnd@arndb.de>,
 Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh+dt@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 12 Jan 2022 at 23:03, Iwona Winiarska <iwona.winiarska@intel.com> wrote:
>
> Add device tree bindings for the PECI controller.
>
> Signed-off-by: Iwona Winiarska <iwona.winiarska@intel.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>

> ---
>  .../bindings/peci/peci-controller.yaml        | 33 +++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-controller.yaml
>
> diff --git a/Documentation/devicetree/bindings/peci/peci-controller.yaml b/Documentation/devicetree/bindings/peci/peci-controller.yaml
> new file mode 100644
> index 000000000000..bbc3d3f3a929
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-controller.yaml
> @@ -0,0 +1,33 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/peci/peci-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic Device Tree Bindings for PECI
> +
> +maintainers:
> +  - Iwona Winiarska <iwona.winiarska@intel.com>
> +
> +description:
> +  PECI (Platform Environment Control Interface) is an interface that provides a
> +  communication channel from Intel processors and chipset components to external
> +  monitoring or control devices.
> +
> +properties:
> +  $nodename:
> +    pattern: "^peci-controller(@.*)?$"
> +
> +  cmd-timeout-ms:
> +    description:
> +      Command timeout in units of ms.
> +
> +additionalProperties: true
> +
> +examples:
> +  - |
> +    peci-controller@1e78b000 {
> +      reg = <0x1e78b000 0x100>;
> +      cmd-timeout-ms = <500>;
> +    };
> +...
> --
> 2.31.1
>
