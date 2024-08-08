Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7592F94C7C1
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 02:45:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1DoEXWjZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wg4ty2k8nz2xdY
	for <lists+openbmc@lfdr.de>; Fri,  9 Aug 2024 10:44:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1DoEXWjZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=khilman@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wg27P59SDz2xxw
	for <openbmc@lists.ozlabs.org>; Fri,  9 Aug 2024 08:40:31 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1fdd6d81812so15347455ad.1
        for <openbmc@lists.ozlabs.org>; Thu, 08 Aug 2024 15:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1723156829; x=1723761629; darn=lists.ozlabs.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=1DoEXWjZWJDHyWZTQa8Cf2sVFIGX+bua6seeuXnfW8xU8Nr3SQIxBUOFVJcPaChOm2
         VcR87rLo/fZJD1DpqktC7g44YTmahaiL6EvBkfyoznhWXJCPYpdqB1xqYDIz1OT+HyaH
         W+B8HMHiHRc8DLECY6d7QAWobzBQS7e2WHfo0OEv8d9MHV0hmWm6ssWzFGedPsdMcXH4
         Uf/6Fqmvh5ABq+vAPEV0DiIUl81V7tmxsTjJLieEO9Q2nUt/E5kOBPX+bRKhd8aGWqKd
         ofcEBnXrDkCcxM/+KkYIH9lX2zydKAwmSzaKGkc/42V2D9er4pXO5x1uAY2G9PSAWHiN
         1S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723156829; x=1723761629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vnFFKslAyQCvTlzcAGgFXS35aWJRluBhjxEK1S5MBPE=;
        b=FZhzfsUrE6D1NFuRgs0Xk+DqY65hDNlPikvbnVPy8PkvRHoWTUb/z3dDewG0MWqbpx
         JGkSmSBNhQxIyYh8MV0gUKIbnnIlfzrKVXDh4nFo3S2HKOPjFUfQ5LytWedgXqZZSDul
         rePX9yGrRZWw6FmcNBozPxHgffzpd/xIkv/CQPY4R+iA39lGtcm4c65VE5OMw5rtdIFd
         9CcYs3ONjbznXt18ShLwyqSP0fqvr9lVpN2yxUIJMZYiNsjw8QMtFhB4svDrojuQ7Fkq
         +fLo5/C98x4RW5Jp78vXbCibpwlPkmrVqehBwwiLHQpAlHKqhasWB9UjbxzDEHljG0/V
         y4VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRc4tZdzxBoPLo29JJxoIns6x8wVL7kXj/ndMD+FbwOCX6cO9pCoFm72/TTXiHIReGz1HPJHWztUJ8k4nWSBiiW6vM1TwMSC0=
X-Gm-Message-State: AOJu0YxjL1ioV7lRcHDfF6/Rbdg8Zqk/7zXDy0F73YxWPsrV+y3NIXgU
	BLtNOMq2qB/VqzZA5SsMJaN+beAFgOD70FqQDdGohtJph2cUTMLv9NbkeJIczZ8=
X-Google-Smtp-Source: AGHT+IFuozGVpD2S8JcbyZGe128XhqnFMQbDl0tXLzyrxRy3snyF4waOTyuxeRGS6PqrGLYA3KLmIg==
X-Received: by 2002:a17:903:228c:b0:1ff:4d4f:d819 with SMTP id d9443c01a7336-200952633e7mr47633515ad.34.1723156829035;
        Thu, 08 Aug 2024 15:40:29 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-200668fc398sm85768725ad.207.2024.08.08.15.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 15:40:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, soc@kernel.org, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Dinh Nguyen <dinguyen@kernel.org>, Andrew Lunn <andrew@lunn.ch>, Gregory
 Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Mark Jackson <mpfj@newflow.co.uk>, Tony Lindgren
 <tony@atomide.com>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH] ARM: dts: Fix undocumented LM75 compatible nodes
In-Reply-To: <20240808164941.1407327-1-robh@kernel.org>
References: <20240808164941.1407327-1-robh@kernel.org>
Date: Thu, 08 Aug 2024 15:40:27 -0700
Message-ID: <7hcymir63o.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Fri, 09 Aug 2024 10:42:55 +1000
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

"Rob Herring (Arm)" <robh@kernel.org> writes:

> "lm75" without any vendor is undocumented. It works with the Linux
> kernel since the I2C subsystem will do matches of the compatible string
> without a vendor prefix to the i2c_device_id and/or driver name.
>
> Mostly replace "lm75" with "national,lm75" as that's the original part
> vendor and the compatible which matches what "lm75" matched with. In a
> couple of cases the node name or compatible gives a clue to the actual
> part and vendor and a more specific compatible can be used. In these
> cases, it does change the variant the kernel picks.
>
> "nct75" is an OnSemi part which is compatible with TI TMP75C based on
> a comparison of the OnSemi NCT75 datasheet and configuration the Linux
> driver uses. Adding an OnSemi compatible would be an ABI change.
>
> "nxp,lm75" is most likely an NXP part. NXP makes a LM75A and LM75B.
> Both are 11-bit resolution and 100ms sample time, so "national,lm75b" is
> the closest match.
>
> While we're here, fix the node names to use the generic name
> "temperature-sensor".
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> SoC maintainers, Please take this directly.

[...]

>  arch/arm/boot/dts/ti/omap/am335x-nano.dts     |  2 +-

For this one...

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
