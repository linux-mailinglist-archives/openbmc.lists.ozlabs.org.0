Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C78B9675
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 10:30:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fygQNv1S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVRw23k3Yz3cXg
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 18:30:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=fygQNv1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVRvS099Vz3c71;
	Thu,  2 May 2024 18:30:10 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-572baf393ddso1147279a12.1;
        Thu, 02 May 2024 01:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1714638604; x=1715243404; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EcS37ofGtSGOaqbMmyUYN9nLzJNBzaZA8qq8/HQQjPU=;
        b=fygQNv1SyfDFSwokgqbGXJThKAAVpd51NYQ/SzMmE1vNJxgXcE1ieUHma6kDDg+ifM
         v6bbX2YmapDbdPd9yzzstkLstPuMFaENcRLGXcU/wcYYk/W77xXki4fJPH1y/N4RiuYx
         yz/ezigWGVW5Zn9GxrStBLR8JkosCCo7C21hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714638604; x=1715243404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcS37ofGtSGOaqbMmyUYN9nLzJNBzaZA8qq8/HQQjPU=;
        b=YDjjTqg8wvwqRVNQ8+aUz7NNRDcWf7v3DRGzeFR8Lehw5YxcP/83NaUjRGZo/dMczY
         dhpb8w3meM4Jb10B0sfs2vVXm3rqq5iGC9Zn3W3DxeYYxxFnuh21AIqwYQnTicTBaKzv
         QM4SXv4Hb9Mucj4XMLs49iZqtktI3USWaCOwIcDgT6a4oz/DDKrnrO88yDq3tPZDX49F
         a5w8KxMB7xYKL7h84yzo5vfaNIBaHOsK3VfOACA9Jxcs8vCGJtNx+HVnZJxkO7Z4uPa5
         MG4WQYbX5o5YVY70v4nDie9mfkJY833KB9gv2BzS51s50DzInpOdriPsFcYJ1FsnZ9Nl
         /Xag==
X-Forwarded-Encrypted: i=1; AJvYcCX2ybm/EGHzgYrqlvlXh8Ll7n62lNk0p+em+sG4wIApDppOoY8HEJza+Xr5C1XvJl37JymnYQ8hvYjUIA3YNDM9BCxNH9rWMCKpbF0AD8j1jM9YJDU9kr+ykoL4lvNzFV6tmbgpAE0c
X-Gm-Message-State: AOJu0YxU0zYUsVvYr2fXf7QCpHVKguo3eBrjrF1woAvUKhUvoHFAd/Lg
	Zj2uBzxbcVxnE9rKvLxwlmXNyubkrKRYCo/UhAtQmTc9MJAA1OzG4eNUz+8OQengruscIreWB8V
	MkdbtWMeT/bh7+YT7Hvk40vATpos=
X-Google-Smtp-Source: AGHT+IE7PXs7Cu+sBWPGxvQ8zk0DGcZNvv6VeR1g/mLA+ZLjmhg+6Kp84MHM3XAzW8rbbeT+KWPAZfh1Yj4u2YTFJBU=
X-Received: by 2002:a17:906:3b4b:b0:a58:f186:229 with SMTP id
 h11-20020a1709063b4b00b00a58f1860229mr1782860ejf.0.1714638604139; Thu, 02 May
 2024 01:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240502002836.17862-5-zev@bewilderbeest.net>
In-Reply-To: <20240502002836.17862-5-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 May 2024 17:59:50 +0930
Message-ID: <CACPK8Xe9BcFziQTKA2FrQq6GT1aWeSirDrWTNBh8b+HwcZzctg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] ARM: dts: aspeed: Add ASRock E3C256D4I BMC
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2 May 2024 at 09:59, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Hello,
>
> These patches add a device-tree (and a couple tiny bindings updates)
> for the Aspeed BMC on the ASRock E3C256D4I, so that it can be added as
> a supported OpenBMC platform.

Thanks! Applied and pushed out.

>
> Changes since v2 [1]:
>  - Added patch 1 adding isl69269 to trivial-devices.yml
>  - Adjusted isl69269 compat string to use isil vendor prefix instead
>    of renesas, dropped unprefixed entry
>
> Changes since v1 [0]:
>  - Removed bootargs [Krzysztof]
>  - Renamed LED nodes [Krzysztof]
>  - Added function & color properties to LED nodes
>  - Added #address-cells and #size-cells to FRU eeprom node
>
> [0] https://lore.kernel.org/lkml/20231114112722.28506-4-zev@bewilderbeest.net/
> [1] https://lore.kernel.org/lkml/20231120121954.19926-4-zev@bewilderbeest.net/
>
> Thanks,
> Zev
>
>
> Zev Weiss (3):
>   dt-bindings: trivial-devices: add isil,isl69269
>   dt-bindings: arm: aspeed: document ASRock E3C256D4I
>   ARM: dts: aspeed: Add ASRock E3C256D4I BMC
>
>  .../bindings/arm/aspeed/aspeed.yaml           |   1 +
>  .../devicetree/bindings/trivial-devices.yaml  |   2 +
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-asrock-e3c256d4i.dts    | 322 ++++++++++++++++++
>  4 files changed, 326 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-e3c256d4i.dts
>
> --
> 2.44.0
>
