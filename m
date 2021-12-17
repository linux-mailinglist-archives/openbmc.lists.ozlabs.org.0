Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B722B479051
	for <lists+openbmc@lfdr.de>; Fri, 17 Dec 2021 16:49:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFthB4G79z3cV7
	for <lists+openbmc@lfdr.de>; Sat, 18 Dec 2021 02:49:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MsyAIMi0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d;
 helo=mail-oo1-xc2d.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MsyAIMi0; dkim-atps=neutral
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFtgq4Xkmz2xtw
 for <openbmc@lists.ozlabs.org>; Sat, 18 Dec 2021 02:48:55 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id
 a11-20020a4ad1cb000000b002c2657270a0so824475oos.8
 for <openbmc@lists.ozlabs.org>; Fri, 17 Dec 2021 07:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6dm4pOYGFOUOnd9TBndDBcAp1Msui/lpdLLescsGmQA=;
 b=MsyAIMi0rI6dnluKwifLKBjgw8MSA/nu+AxFriSzfgy8u63mTZjxqKW/csPHbRk/LU
 z5IKRn04aNy9X7PEIV2twi23dM3LV86s7LDdAYc0uRKQlpjafphFv/EjqXr/oZUUpOA5
 Hj8sSooRsCVcCixaPCG1tv1mosUkULpk1DV9CNCdPWdkAmT4I/s4rMIn0jdAg7jSn3Bk
 NDyxO9ubTSyLLE/Sj5ecyT3FEnPMdTV+E19VHDqWPZ0NXDnp027/RjdX1Ioqu9ZXGzex
 gm5h8qjf/CQJv9WcxZlqM6AsBEkx+OfM/hs+mJYd39XmZuV/1uFrUaCc4Qv4T9dQ5nUH
 YRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=6dm4pOYGFOUOnd9TBndDBcAp1Msui/lpdLLescsGmQA=;
 b=E8Va2iHQOZhMy5Y5zShdWlLcvlKdfDZrbub+vIWrK41kh1YMbW1OEMylpW9XUqfcyT
 X3zEzgiXqtIo9XLASKy2OPZs/D0W5SL/sWst3oe+yoM26glTczbm5B+f4GlcCGgylopK
 Zyxy8A38izJEeptsqkO5WTrxUWV2o5AerGBbR+vr787b95gyqVZiB3aK0hAVckwF0F/o
 bM3Y4g33oS3+sWqgW/3yVgyncLRwhJ4XEjTen/WRDyJvyxJtWMVKL3edp/sfBaoWu7Z1
 veGTsq300dGAXNX+h2KFySDZ1tDuNuW61Q3c6rRj+c9tFmZPSMLm892/8O05csbjUJFT
 CqFw==
X-Gm-Message-State: AOAM532KG39cxbsPERV7qdcwQ1/Zk7ItwYq/xxOAF8oCKLJGGBIT7Xoc
 +tCpS34x/EjcQ2IzEVh8ihU=
X-Google-Smtp-Source: ABdhPJy4vDAoMqy1suYtcDZ5UF0RmpzzS+JQbYdAFRDtXk7bkPcIiomXqooHg3rF3Mi9zza1gK/0lQ==
X-Received: by 2002:a4a:d284:: with SMTP id h4mr2323424oos.31.1639756132252;
 Fri, 17 Dec 2021 07:48:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 c41sm1746402otu.7.2021.12.17.07.48.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 07:48:51 -0800 (PST)
Date: Fri, 17 Dec 2021 07:48:50 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v4 2/2] dt-bindings: add Delta AHE-50DC fan control module
Message-ID: <20211217154850.GA2969063@roeck-us.net>
References: <20211208213703.2577-1-zev@bewilderbeest.net>
 <20211208213703.2577-3-zev@bewilderbeest.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208213703.2577-3-zev@bewilderbeest.net>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 openbmc@lists.ozlabs.org, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Dec 08, 2021 at 01:37:03PM -0800, Zev Weiss wrote:
> This is the integrated fan control module of the Delta AHE-50DC Open19
> power shelf.
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Acked-by: Rob Herring <robh@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> index 791079021f1b..1c43cc91f804 100644
> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> @@ -73,6 +73,8 @@ properties:
>            - dallas,ds4510
>              # Digital Thermometer and Thermostat
>            - dallas,ds75
> +            # Delta AHE-50DC Open19 power shelf fan control module
> +          - delta,ahe50dc-fan
>              # Delta Electronics DPS-650-AB power supply
>            - delta,dps650ab
>            # Delta Electronics DPS920AB 920W 54V Power Supply
