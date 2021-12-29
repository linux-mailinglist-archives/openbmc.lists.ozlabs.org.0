Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D690481192
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 11:17:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JP6lj3cXgz30Qv
	for <lists+openbmc@lfdr.de>; Wed, 29 Dec 2021 21:17:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nFApkzhs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::432;
 helo=mail-wr1-x432.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=nFApkzhs; dkim-atps=neutral
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JP6lC2hkjz2ygC
 for <openbmc@lists.ozlabs.org>; Wed, 29 Dec 2021 21:16:53 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id q16so43476835wrg.7
 for <openbmc@lists.ozlabs.org>; Wed, 29 Dec 2021 02:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=b+zE01u0JpXpyPFug8aJeTgsvJdxFWBY5Ed+UEXJSbA=;
 b=nFApkzhsRA48nGUu+5m10zgx/O8dTMBvvVv1kZzQwiqMHrMxHsItuQb0vBSLa7PUz0
 H5wJ9THDs0vtzxZRwJMcrBdgc05TslxDqhMj0PLv5Rl5bvj0mjFHBxn4Rv768Oj9gyAX
 OO63YnO6HU7LFncpBZ9CNKqug1Ps4gJRdVgHkSqt1rcMUtwoqpWiVS2I8zw0DKquhvmq
 DUBOUyj7NmEMqPSqH8kKTbjsCVw3cJy06PWUmLM5SrVJFDr5XinFywfp1IfAIOX3EnD6
 hYwt1IgD0ZTXATvchXACobxPOQh9Ib2lra6iAMhic7D2RvBRaF2UU0NU8HVzXJeTSvQq
 o6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=b+zE01u0JpXpyPFug8aJeTgsvJdxFWBY5Ed+UEXJSbA=;
 b=DRDDim6BjXpoBcOOVzstS2wJ9fnb2hgX/I+W4fIhmA/OQ9tlYYNMPx9YMXbinwfPo2
 /QorEmsYglHrbIyT2R64RzPpEPBOU+g0n7AcM7gff+bvnOBlKRoCpXfangLblTkTv1WS
 x257tiPgpSOFvSG0Xwcg1h6EGXxvACOUlUJKGbpSZQYQbWm5XtagmT7b49TROF0sfSzU
 lDCgYfhKte+Zpokoc8vN7CAkPWpz4gL9Nb8UsNmK7w2jQH24DNe4MaAaVfaTQNUMBxcc
 MuoeamUtGy1MypUhF9xUrdN8Cax9aWNq2RCETx4UZinS3vadUGXBp9B7ZSoIsQ7NXaKL
 2DCQ==
X-Gm-Message-State: AOAM530M8iNUZhT4ZKepJt52TJ29JUhNXAZL7ttc+H9ADtseWwlRbCIa
 xdlTqkcT4dCyy8y12xdPmDtTFw==
X-Google-Smtp-Source: ABdhPJx0iWeXqxZaRi6Rm3ozmbJecqRY7o7RGp5qWfmkkNU1k7L7xFc8xl0Wrcp57XJhzm0SxQHnJw==
X-Received: by 2002:a5d:56c2:: with SMTP id m2mr20111241wrw.313.1640773006492; 
 Wed, 29 Dec 2021 02:16:46 -0800 (PST)
Received: from google.com ([2.31.167.18])
 by smtp.gmail.com with ESMTPSA id o5sm3040713wmc.39.2021.12.29.02.16.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 02:16:46 -0800 (PST)
Date: Wed, 29 Dec 2021 10:16:44 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 6/9] misc: smpro-errmon: Add Ampere's SMpro error
 monitor driver
Message-ID: <Ycw1jNNGlkaj3QnI@google.com>
References: <20211224041352.29405-1-quan@os.amperecomputing.com>
 <20211224041352.29405-7-quan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211224041352.29405-7-quan@os.amperecomputing.com>
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

> This commit adds Ampere's SMpro error monitor driver for monitoring
> and reporting RAS-related errors as reported by SMpro co-processor
> found on Ampere's Altra processor family.
> 
> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
> ---
> Change in v6:
>   + First introduced in v6 [Quan]
> 
>  drivers/mfd/smpro-mfd.c     |   1 +

Separate patch please.

>  drivers/misc/Kconfig        |   7 +
>  drivers/misc/Makefile       |   1 +
>  drivers/misc/smpro-errmon.c | 571 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 580 insertions(+)
>  create mode 100644 drivers/misc/smpro-errmon.c

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
