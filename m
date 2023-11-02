Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5637DEB33
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 04:14:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ieW7VNTV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLTWT1Z8Xz3cV6
	for <lists+openbmc@lfdr.de>; Thu,  2 Nov 2023 14:14:45 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ieW7VNTV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLTVs0qNTz2xwH
	for <openbmc@lists.ozlabs.org>; Thu,  2 Nov 2023 14:14:11 +1100 (AEDT)
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-3b3e7f56ca4so274044b6e.0
        for <openbmc@lists.ozlabs.org>; Wed, 01 Nov 2023 20:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698894847; x=1699499647; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Ng+Ky2De9mKEU9cACPl0CpnKEJS0eue27RL+2JZ1s8=;
        b=ieW7VNTVjOSasVq6GSiuiG4IhythNPEx2YJDH13Q2LZSKVtjsCiUzTueD1a0LGprKT
         xgqAXwi51gzui1LpFO9ickx64RywVBniBQP/H2IQwZyrVgjlp8w0P861SzC0QaosEGyb
         JdpzANE37HxTK0a3yyn9vGfuVuZxKz0uImSuNq5yCn1ao37jF4t10IzmLcS491h5ox9+
         gcgbLZk+y7nwF1dRYyMKLUf8YNbS31BWDjdWa+LVD7qGAP/aVdDqY4yShA12Tljdfx0J
         +BCzmx5I4HfR2Qa81z8PKDBhdh5I3J6n5VY/2Ltze0u+z3N0h90AcjY28Fuo5KxGnPOQ
         u+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698894847; x=1699499647;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ng+Ky2De9mKEU9cACPl0CpnKEJS0eue27RL+2JZ1s8=;
        b=Tx3QXVYd+yBuYFLyqWvXhAgoagoHyRg14JMcBT4mamNr0dOSz+LNq/PL77VAzSsEZV
         Grb0A1LnSNMc1IXfGWGHiCLKfLnVblIhFlSmhGxQUmmraz10FB3x6zJgyQCZrdJa0wvD
         9Xn2he4DmrJPW6ZpWGPI9v6jZGGeTxVg4acGXbaJUjnD5jWJBZiEZktZ5K2g1wFWAaqT
         titO3R9zWNQ+NzAz1coFtEgvMyGd5LPlU7j9UaZN6g+kEJmLcZBlH785NbDfNHvaG2F4
         9ikfuJtADbDO8IMpUInoenT8gAUUvpD5oBWpp3wCzBYZMr2xu0p1HAYSt7et9Z/z/Y81
         VHVQ==
X-Gm-Message-State: AOJu0YzJMz+x3RPPaBszfsr5PCUS/DXc0v/FsapOSb62IrFCtsqIVB6X
	ycgBNIklmZQnJEVbQnvssNA=
X-Google-Smtp-Source: AGHT+IEEI4dvb7QQTncXlStBqRd1w90xo3S0vMQiCz+d240Aib9+mztsA684rMGZIJudpyercdkBZA==
X-Received: by 2002:a05:6808:30a4:b0:3af:a0bd:45b7 with SMTP id bl36-20020a05680830a400b003afa0bd45b7mr22115843oib.13.1698894846743;
        Wed, 01 Nov 2023 20:14:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z20-20020a056808065400b003adcaf28f61sm417866oih.41.2023.11.01.20.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 20:14:06 -0700 (PDT)
Date: Wed, 1 Nov 2023 20:14:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v4 1/1] hwmon: npcm750-pwm-fan: Add NPCM8xx support
Message-ID: <8d9d439b-70f7-4e9e-bcfd-b18182d5bb39@roeck-us.net>
References: <20231031075806.400872-1-tmaimon77@gmail.com>
 <20231031075806.400872-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031075806.400872-2-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, joel@jms.id.au, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Oct 31, 2023 at 09:58:06AM +0200, Tomer Maimon wrote:
> Adding Pulse Width Modulation (PWM) and fan tacho NPCM8xx support to
> NPCM PWM and fan tacho driver.
> NPCM8xx uses a different number of PWM devices.
> 
> As part of adding NPCM8XX support:
> - Add NPCM8xx specific compatible string.
> - Add data to handle architecture-specific PWM parameters.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Applied to hwmon-next. I'll push it after the relase window closes.

Side note: An introductory patch is not necessary for single
patches. Providing the change log in the unnecessary intro patch
only adds additional overhead for no gain.

Guenter
