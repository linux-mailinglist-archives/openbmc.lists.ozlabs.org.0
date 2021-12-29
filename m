Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65912481199
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 11:19:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JP6nm2lhVz305F
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 21:19:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fTW0JdR1;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=fTW0JdR1; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JP6nJ3BTtz2ygC
 for <openbmc@lists.ozlabs.org>; Wed, 29 Dec 2021 21:18:44 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id e5so12839006wmq.1
 for <openbmc@lists.ozlabs.org>; Wed, 29 Dec 2021 02:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DhXo7kMC0uPR2/PxJNBSCPHqufGQVkkQQH3q6s5xJ5w=;
 b=fTW0JdR1ykzRRIY9dw57yS/8M99GGw9D5WoARy8fmCk5IFEFao0lWGNbbjQJkYt+Xy
 3MNWPza2N21Cne2wpHD7iYG6Tc3pZFdHBl6alGSWaeBja4XGfd2dQLtkK5lYdBoAVuGN
 7BFoU68lYLsNk0WNUFm6RUb7/Fmudi5PwInGqMFkncUajsRgjCOgl0/Eza4QJQ+7GZt0
 DG+Us1/Dk7SO2aaYbGqoEo0noHRSFuaycOvCLnGZ6NidMlPa3IKnEhDEZtHpkQvt4wy1
 fXT9/t0kqPyp+R9mVR+CmJj+0vOOR2/h0+awCHcbxM4HFsiu9vuhjXG6XErcuhQrPAjb
 NHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DhXo7kMC0uPR2/PxJNBSCPHqufGQVkkQQH3q6s5xJ5w=;
 b=4E2FNNNrisv9RSTQInRw2zCookJWQXxZkIJAvOl3yzMJ9W73KwAPhK1NXRWY+rQrCw
 peTbtV313Tvauf4tvhNQ7ZoqCMxpr0juy/2QTljlR7Ejc2vwy8HL981DwuF8lotwpjLY
 Ypb8E/HsBKpiNpraiWO1OKR9Wd3SpDH69uA6ema0ZfG2YlpJlvWY8QhVN69lfVJRTKlv
 9viGGbK5drMRTJi+WqVPJMvmKYV6Y0ceJtwMmyuy/VPspTa2TpG4n6vW+BONXKDhWGA1
 EuXxsUm8y+P4Y1NutxvDmqIKGTAnmIdLJKBStcwFAVbkL9ZHqGOovIhDlI3IwKReJ9Sz
 W9bQ==
X-Gm-Message-State: AOAM532uIIj0jBwMtbQ2QQty83prakhR4oO9S3UFkwUA20zxaMOvLzIc
 SGuryi0fU3FADsQjIIvpteaV8g==
X-Google-Smtp-Source: ABdhPJxlh/wswgV+eWD3Uf/3R7henCTK2h+kQsStrI5za04QhH9jaGk/3Wx/qaAyCvETvukN4Wz1CQ==
X-Received: by 2002:a05:600c:a54:: with SMTP id
 c20mr20967140wmq.48.1640773120328; 
 Wed, 29 Dec 2021 02:18:40 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id k6sm19938299wrc.38.2021.12.29.02.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 02:18:39 -0800 (PST)
Date: Wed, 29 Dec 2021 10:18:37 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 8/9] misc: smpro-misc: Add Ampere's Altra SMpro misc
 driver
Message-ID: <Ycw1/XufNWq/FUss@google.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-9-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224041352.29405-9-quan@os.amperecomputing.com>
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
Cc: linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Dragan Cvetic <dragan.cvetic@xilinx.com>,
 Phong Vo <phong@os.amperecomputing.com>, Jonathan Corbet <corbet@lwn.net>,
 openbmc@lists.ozlabs.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Derek Kiernan <derek.kiernan@xilinx.com>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Arnd Bergmann <arnd@arndb.de>,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Rob Herring <robh+dt@kernel.org>,
 Open Source Submission <patches@amperecomputing.com>,
 linux-hwmon@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 24 Dec 2021, Quan Nguyen wrote:

> This commit adds driver support for accessing various information
> reported by Ampere's SMpro co-processor such as Boot Progress and
> other miscellaneous data.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Change in v6:
>   + First introduced in v6 [Quan]
> 
>  drivers/mfd/smpro-mfd.c   |   1 +

Please pull all of these patches out.

There are no build dependencies here.

>  drivers/misc/Kconfig      |   7 ++
>  drivers/misc/Makefile     |   1 +
>  drivers/misc/smpro-misc.c | 177 ++++++++++++++++++++++++++++++++++++++
>  4 files changed, 186 insertions(+)
>  create mode 100644 drivers/misc/smpro-misc.c
> 
> diff --git a/drivers/mfd/smpro-mfd.c b/drivers/mfd/smpro-mfd.c
> index a7cd64bf9eaa..5611dd30f8f4 100644
> --- a/drivers/mfd/smpro-mfd.c
> +++ b/drivers/mfd/smpro-mfd.c
> @@ -28,6 +28,7 @@ static const struct regmap_config simple_word_regmap_config = {
>  static const struct mfd_cell smpro_devs[] = {
>  	MFD_CELL_NAME("smpro-hwmon"),
>  	MFD_CELL_NAME("smpro-errmon"),
> +	MFD_CELL_NAME("smpro-misc"),

Misc is a Linuxisum which are not allowed in DT.

What does this driver actually do?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
