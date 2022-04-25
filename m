Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB38650E457
	for <lists+openbmc@lfdr.de>; Mon, 25 Apr 2022 17:25:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kn8335Lclz3bdN
	for <lists+openbmc@lfdr.de>; Tue, 26 Apr 2022 01:25:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QlA0T1cs;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234;
 helo=mail-oi1-x234.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QlA0T1cs; dkim-atps=neutral
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kn82g4RKdz3bYG
 for <openbmc@lists.ozlabs.org>; Tue, 26 Apr 2022 01:24:59 +1000 (AEST)
Received: by mail-oi1-x234.google.com with SMTP id e4so17491893oif.2
 for <openbmc@lists.ozlabs.org>; Mon, 25 Apr 2022 08:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=HlA2P5BWRWn9hkwakxCdZMtiE0l4ySDlpjLRIi/llRo=;
 b=QlA0T1cs4nFfilxv0dlBZKar6zmilFCddvi70J39T2EfHSBjI2Je1RSE6z0jbMqCmq
 em58sN0W2O57akqWSs8wtB+ncZ+Uae8LzeFjqUSktdXxMnj9cQCFwfgd2BU5s9xJ85z0
 kzQMkW+lbnhnoWAyAXbdPNYqU5Ed6m6wGIZkRLSHZe20Hs73yymFAj1yLY2t5/OUpf3T
 Ke+fEKTrVwVUM6aue7cHBbuDh0lhfMIe6i+c4KsL10E7R57/8yHmh9tRUblw1R6+3UGA
 YWGwAzQQYzHP5cSDRgoHkufb22S7DaCjmg/yHtJ+/qaAAspbCeCbkr9854HdeAlCSs08
 EEuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=HlA2P5BWRWn9hkwakxCdZMtiE0l4ySDlpjLRIi/llRo=;
 b=8Pyt6FVy65VWSAak9JTNl3F7jfhSzZUGNSM35P62/sPMaSgaAANXEP7RNtsTR8yFhJ
 MDe2kPUrNOD0LDpCrGVnoGNoSVQM5A/dsczKncztVJRUG95ROgTR66OnLcky2vxooZT9
 4VWoiUEvzUVptyXdNNGSG4GkQ8zPnJSASyKaQOtT55pfublmLUIimOht37hgQghAzWRv
 58T+ZqGcdWp6zUd2dApIxPdlEa9iivyjb05VFBwS1u+43Qitrx2qPVQrzjkPnDCE4xwh
 fwl7cAptSYj3dyoAcoINB5Ld4WduJ7M8XW4dmzgX1GVapjRb3NQVYIIQSnbwK1vSOPWy
 tNIQ==
X-Gm-Message-State: AOAM533JwEtoXK5+Zee6Qi8yhYvb6VZJwVw44cps5SgHPLO1q9iz/zwA
 oCnmHO0ISyNWbk3ek1rfEn0=
X-Google-Smtp-Source: ABdhPJxKDk7xpkbepDWFgElAjkEPtEeTgll3N7aydUR7QtcYNBdcBTcqhVHo9xwRv960Bt/zB/uizw==
X-Received: by 2002:a05:6808:190d:b0:323:2813:57e7 with SMTP id
 bf13-20020a056808190d00b00323281357e7mr8161144oib.169.1650900296360; 
 Mon, 25 Apr 2022 08:24:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a056870160e00b000e67f5bd9b9sm3470763oae.45.2022.04.25.08.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 08:24:54 -0700 (PDT)
Date: Mon, 25 Apr 2022 08:24:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 2/6] hwmon: (nct6775) Convert register access to
 regmap API
Message-ID: <20220425152453.GA4166687@roeck-us.net>
References: <20220309005047.5107-1-zev@bewilderbeest.net>
 <20220309005047.5107-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220309005047.5107-3-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Renze Nicolai <renze@rnplus.nl>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Mar 08, 2022 at 04:50:43PM -0800, Zev Weiss wrote:
> This replaces the nct6775_data->{read,write}_value function pointers
> with a regmap.
> 
> The major difference is that the regmap access functions may fail, and
> hence require checking at each call site.  While the existing WMI
> register-access code had potential failure paths, they were masked by
> the fact that the read_value() function returned the register value
> directly, and hence squashed errors undetectably by simply returning
> zero, and while the write_value() functions were capable of reporting
> errors, all callers ignored them.
> 
> This improves the robustness of the existing code, and also prepares
> the driver for an i2c version to be added soon, for which register
> accesses are much more likely to actually fail.
> 
> The conversion of the register-access call sites is largely mechanical
> (reading a register now returns the value via an out-param pointer,
> and returned errors must be checked for and propagated to callers),
> though the nct6775_write_fan_div() function is refactored slightly to
> avoid duplicating nearly identical (and now lengthier) code in each
> switch case.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> ---
>  drivers/hwmon/nct6775.c | 977 +++++++++++++++++++++++++++-------------

Needs "select REGMAP" in Kconfig.

Guenter
