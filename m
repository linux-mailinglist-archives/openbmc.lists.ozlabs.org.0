Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 309F741C8BD
	for <lists+openbmc@lfdr.de>; Wed, 29 Sep 2021 17:51:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKLTj0JGLz2yxv
	for <lists+openbmc@lfdr.de>; Thu, 30 Sep 2021 01:51:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OjGMwgt3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=OjGMwgt3; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKLTG4vBrz2yZB
 for <openbmc@lists.ozlabs.org>; Thu, 30 Sep 2021 01:51:30 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0864F61452
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 15:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632930686;
 bh=1Dcwft/d81SvmPwSaeSbXxkBB01iAeQr8xtz4Jq1N5Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OjGMwgt3BrGN5QWhoAG3V1VaZ2AlxZjUo9jvqlj5RxAO4f1E/nR7Ep3gXLIhYAUWD
 qGBbjtAQQaHt9cxIwnvfLFoagPW8cnodZMuf901jyKp/XFeJW53vyFD2UVTd2OHWvu
 veJH5RWXbIniquS2ROsqSngOP2OoIjrbTJqKDb87C4Yz0CmrwByAWeBA9WYMcRLB5D
 tXPl2Uu157Jogi/T3sQgB02LLNenERpVWc3m6xfVNk+3/W89GRuuAVU26O3iUfx1dx
 WHWXv3sfJ7IgSpuxUDtetl0z/RBLr0IOjIhPnN/3ikGdkgFPei+aaKlx5G0GbrdWCP
 zAQxpA+BfE6MQ==
Received: by mail-ed1-f49.google.com with SMTP id y35so10494769ede.3
 for <openbmc@lists.ozlabs.org>; Wed, 29 Sep 2021 08:51:25 -0700 (PDT)
X-Gm-Message-State: AOAM530WRFegn096VVj6j8h1WdIvdBIaFeCWeGjuwThUphoUbV+ZmJnl
 u+p2FSXEtomQE66n5uJgglfztEOWFwwC73RA3Q==
X-Google-Smtp-Source: ABdhPJyDVq+IG+koLOXiLxdfQZw+feqfIR0H7K/pSvABlVfDD0w96pf4+hV0nY2UlnWGhNDULYpUcjh3D8xUIWyaxP4=
X-Received: by 2002:a17:906:a294:: with SMTP id
 i20mr511335ejz.128.1632930610672; 
 Wed, 29 Sep 2021 08:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210929115409.21254-1-zev@bewilderbeest.net>
 <20210929115409.21254-2-zev@bewilderbeest.net>
In-Reply-To: <20210929115409.21254-2-zev@bewilderbeest.net>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 29 Sep 2021 10:49:58 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+rKGv39zHTxNx0A7=X4K48nXRLqWonecG5SobdJq3yKw@mail.gmail.com>
Message-ID: <CAL_Jsq+rKGv39zHTxNx0A7=X4K48nXRLqWonecG5SobdJq3yKw@mail.gmail.com>
Subject: Re: [PATCH 1/6] of: base: Add function to check for status =
 "reserved"
To: Zev Weiss <zev@bewilderbeest.net>
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
Cc: devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jeremy Kerr <jk@codeconstruct.com.au>, Frank Rowand <frowand.list@gmail.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Sep 29, 2021 at 6:54 AM Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Per v0.3 of the Devicetree Specification [0]:
>
>   Indicates that the device is operational, but should not be used.
>   Typically this is used for devices that are controlled by another
>   software component, such as platform firmware.
>
> One use-case for this is in OpenBMC, where certain devices (such as a
> BIOS flash chip) may be shared by the host and the BMC, but cannot be
> accessed by the BMC during its usual boot-time device probing, because
> they require additional (potentially elaborate) coordination with the
> host to arbitrate which processor is controlling the device.
>
> Devices marked with this status should thus be instantiated, but not
> have a driver bound to them or be otherwise touched.
>
> [0] https://github.com/devicetree-org/devicetree-specification/releases/download/v0.3/devicetree-specification-v0.3.pdf
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/of/base.c  | 53 +++++++++++++++++++++++++++++++++++++++-------
>  include/linux/of.h |  6 ++++++
>  2 files changed, 51 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/of/base.c b/drivers/of/base.c
> index f720c0d246f2..c5cc178fc6bd 100644
> --- a/drivers/of/base.c
> +++ b/drivers/of/base.c
> @@ -579,14 +579,18 @@ int of_machine_is_compatible(const char *compat)
>  EXPORT_SYMBOL(of_machine_is_compatible);
>
>  /**
> - *  __of_device_is_available - check if a device is available for use
> + * __of_device_check_status - check if a device's status matches a particular string
>   *
> - *  @device: Node to check for availability, with locks already held
> + * @device: Node to check status of, with locks already held
> + * @val: Status string to check for
> + * @alt: Optional alternate status string to check for (NULL to check only @val)
> + * @dflt: default to return if status property absent
>   *
> - *  Return: True if the status property is absent or set to "okay" or "ok",
> - *  false otherwise
> + * Return: True if status property exists and matches either @val or @alt.
> + * @dflt if status property is absent.  False otherwise.
>   */
> -static bool __of_device_is_available(const struct device_node *device)
> +static bool __of_device_check_status(const struct device_node *device, const char *val,
> +                                     const char *alt, bool dflt)

How about val==NULL means available/okay and then you can get rid of
alt and dflt.

Otherwise, I'd simply not try to share the implementation here and
just add of_device_is_reserved().

Rob
