Return-Path: <openbmc+bounces-1207-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E7AD2229F
	for <lists+openbmc@lfdr.de>; Thu, 15 Jan 2026 03:41:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ds6gG45Vpz2xrC;
	Thu, 15 Jan 2026 13:41:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::122c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768441957;
	cv=none; b=XZVdOz34GVzrtUt1RwVTuUa2EfswwO+arit+lIfag3EOkepwu1pHM6hs4JVHveHw5IK7dTVnH0U7XKoU1gRieqTEvV/6zxcJoLpYD18/3xRQJLhg/9upwXSTkSLx3VEQ913UQBN3kdQ9v0ceqj++cZ4icVr56kGotKd9qWQLQAHRzovk8ngMNj6iMCIogedSO68QxCIZdhxdKmnwAHJSxfCvaIKn5tS14gfOodlJcbSA1kVl+qygN5Vv0Q/1+bHAzPjQQyl0wQrSMJhw6SRLF9wMf3ADayrF2YrW9gqvxiRxR5oPJF+OQ/ANhGC0mPjWEb4gHiIwWdPYEPb91HLJiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768441957; c=relaxed/relaxed;
	bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyL6LQLs+WLOa0Ts3libQqSn2JV4HlH7I3dSdTGiTsbiaEKAfklzooRZZdJj4DQLRNEt7r8sxYBjSKPFKJfd5YzvxPFovj5ng2o0HZjLOQeoDUCRXZ+bAt/gbSmY+OljBnw2/2Wp9RkH+Pb0XrXG3xA0DhlF8ijdE7Ru54aby9bPjAcnRe6wyiSWHxG++mw4PzmZX12U8vz6sEqdw2aYnVPRbe6KgGGcZHQlJDHmJIOzlLFw5BqX1RrJ8tApwf6im2wNNmU8dbTDA+G8+1/fIru6ls5TFlNLkLmhSsBiE431pFmDQitVKJJVOa8xzoPkSoDQEmnrF/Cp7heppMDM/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R1rxVBtL; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=inochiama@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=R1rxVBtL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::122c; helo=mail-dl1-x122c.google.com; envelope-from=inochiama@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x122c.google.com (mail-dl1-x122c.google.com [IPv6:2607:f8b0:4864:20::122c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ds5b82jPDz2xqj
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jan 2026 12:52:36 +1100 (AEDT)
Received: by mail-dl1-x122c.google.com with SMTP id a92af1059eb24-12339e2e2c1so275942c88.1
        for <openbmc@lists.ozlabs.org>; Wed, 14 Jan 2026 17:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768441953; x=1769046753; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=R1rxVBtL/AF3DZ8zyp5Y1tt00k3hDC745aEh0gVHC2y/N+vY+U2dg/oD74bY7zYy/N
         Erk1yEvd5oIJ4005FGUqeM2k/TuWkX9VQ6pOXgFwH3VrX4XEkeqt6UDSHGOjgqG1f4ib
         odGHsCWRXW+y6OZAn4W2hfw26VrTMPoupF6MDR+D6GbK5tXvkZTJORFqTdxVnFtxBzlO
         7jvfd2g39zWAQUzKwMRrqj8s2oPzYPDYmHJwA3WOFk32/NXN4jmpkH8OA5UzqXYpdB5l
         tf0CNaeR6ugc/Ox+R7rUIJZ8DeyNjmA+Ft5hzxWLhPDBuL8qVya0dqeRqEFqJjcZaypx
         jmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768441953; x=1769046753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaGsIuvEkZT/0ZxJsJ40cQ270Lj1PGkWPT1RajGBoys=;
        b=TFNB45OZxp1xKJIYtyX8uS391fhccU7rHveN/k9JFNWbUhz4JGXWaUOwPZWu6rJZgA
         695jdLDMj7NhCjrxIH3HwUofPPBqeahzcSRTlVQNqjP6q/8hB6fC610Vt6DwU79GFDXx
         jnKS8eLpCwl7qM7QGIgqoDmAXP+yhrbbqPVKYiCs3z/pdESlg7d0YiraFUyhsVBskk9k
         jo63RI9JZ7OM80Mi/Ugl6TAaGomCKHWQowASm6cWZWA7gZtk8Z4rZ1IyD+HmzgZJMCzl
         GyjMhU6sMUVXb3gwhP5HepRAlvVI1ywxlklmzMpo87WDJtdBEYpQ2IgaYPeVPI4EnFVt
         w6sg==
X-Forwarded-Encrypted: i=1; AJvYcCVj2QIn8kK0IkvUBmDB72w2UE5eCKqWg8DDlW2RzcIrVUssdBxMq/eMrao1X28vxE7dVBgPfREp@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQaEdIYO/lYwA0FSZic8eETSH4bAkhdvRGKlBZtuxux5gY4a3h
	Ml3NiRx0OH7M4XxrOHm4DHhEE4OLMQ2TcnalOV6VF7gasqyl/rNMIUEs
X-Gm-Gg: AY/fxX4TYiVKpKM/4Si20KooANm5lrjn923+FDb1nVOnj7pjf2PsFQbGGr7eDSTdk2C
	i9A82ykr4fXQPdaJjrNhgInkb66AEUHf9Dwky4x1HNPEUaG47k0Q1TIr+a8cPhQSPIqBKI9zRpl
	KJPFgZUYz3DBVywAmJrgBcJ6xHB2zwlcs+WqGLmUylsixbJjefVRHShnDKEUHMC3NTx2EnF/zOQ
	OnAj6bBVW/R58i/wFzwdSVH0P8WjOOhJfb2bRAc1/keUUrIEK4xh+dx2I4Oh4cLxXELDNF/EkMG
	yEZpU4IZeMqtvPPJy3MsaqCuC/s5WQ6A9XIB77jEvg2PNLqtTjiZxm1bMsCwO3R6bg0/80Lyq5/
	OkCKH8XEih4RnC7H/Z0Ox0nKSxtqJYdJQPQKlGLlaDqH9d06QH1ry9QryiPMCoqk1XesjrQHucC
	Iibh4nc+a/HA==
X-Received: by 2002:a05:7022:6708:b0:11b:9386:a38f with SMTP id a92af1059eb24-1233d10f432mr1505698c88.22.1768441952848;
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f248c246sm32727140c88.11.2026.01.14.17.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 17:52:32 -0800 (PST)
Date: Thu, 15 Jan 2026 09:52:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 03/11] pinctrl: sophgo: Cleanup header includes
Message-ID: <aWhIOYIWnJy7mhkc@inochi.infowork>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
 <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-3-a14572685cd3@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 14, 2026 at 04:30:04PM +0100, Krzysztof Kozlowski wrote:
> Remove unused includes from internal headers, because they do not have
> following: bit manipulations, mutexes, spinlocks and struct devices.
> These headers are included by actual C files, which seem to have all
> necessary includes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/sophgo/pinctrl-cv18xx.h | 4 ----
>  drivers/pinctrl/sophgo/pinctrl-sg2042.h | 6 ------
>  2 files changed, 10 deletions(-)
> 
> diff --git a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> index 759c0e604acf..973ab9a38fcf 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-cv18xx.h
> @@ -6,11 +6,7 @@
>  #ifndef _PINCTRL_SOPHGO_CV18XX_H
>  #define _PINCTRL_SOPHGO_CV18XX_H
>  
> -#include <linux/bits.h>
>  #include <linux/bitfield.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> diff --git a/drivers/pinctrl/sophgo/pinctrl-sg2042.h b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> index d481973fcf97..1a2b00dde1fa 100644
> --- a/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> +++ b/drivers/pinctrl/sophgo/pinctrl-sg2042.h
> @@ -6,12 +6,6 @@
>  #ifndef _PINCTRL_SOPHGO_SG2042_H
>  #define _PINCTRL_SOPHGO_SG2042_H
>  
> -#include <linux/bits.h>
> -#include <linux/bitfield.h>
> -#include <linux/device.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> -#include <linux/platform_device.h>
>  #include <linux/pinctrl/pinctrl.h>
>  #include <linux/pinctrl/pinconf.h>
>  
> 
> -- 
> 2.51.0
> 

Thanks.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Regards,
Inochi

