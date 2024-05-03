Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DE88BABF3
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 13:56:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r0GmkPBa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW8RS2MwKz3cns
	for <lists+openbmc@lfdr.de>; Fri,  3 May 2024 21:56:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=r0GmkPBa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW8Qv4MhNz2xSN
	for <openbmc@lists.ozlabs.org>; Fri,  3 May 2024 21:56:23 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41b7a26326eso58186135e9.3
        for <openbmc@lists.ozlabs.org>; Fri, 03 May 2024 04:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714737379; x=1715342179; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bLaSTUMLd9q7wnaDYiji/Br9jByyayQQUiPApn9kpCM=;
        b=r0GmkPBas4bEH6ZrQLZiMvcJeQhlyzyjQuHmj287RGTv9XPl1bSmKd4UvmIjX1Yoos
         JrRazdcY3Q6pr3pl+zhhfhkxq5miBqshuRnpnamp6YafklgQfHj1xZiCMKFNlcHam2i1
         /lHq67gzwQMXc8146UYm5hpcbAz2U8lzzTQfncep8uqJj/Wa7+I3kiZSPageDidcbR36
         r4DcX259000EpF7LtQI41NVHlAs34IbCBXRRBmT1uJnS8oawf0i4XcTOJXgl3IX9UsJK
         NaaUJhap/0owwwdei/o72BWXMS7WYl9nuZhyBtE56KE1N713JtIlLhL66zW63E8RmBH5
         SGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737379; x=1715342179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLaSTUMLd9q7wnaDYiji/Br9jByyayQQUiPApn9kpCM=;
        b=U8190ytU/wUAVtEWIru6LyVJjhSK10mWeyS0NChMQXoU72xOk8ZoG7lUxo2GBQ/qpT
         ummfycyDsPsFrWbYjvcwhrUY32aXwgF79G7hWFIVDkujIXiz2cJcnEWUQtSzv0yC1e/3
         r9mxQ2jP7/qg5zGHmjKKYZxsTidY9ypCIq+HQqOHn10OmM2fruLIxrzu4vIcwwrWNeA3
         3Dxkoc9qn/+j3J8xQqwBJcC1FSFsCJ9PoErG0FoU3MYy+mZu/kaqIH2AksRjo2OOynfu
         8zGDUST1RHn6bug+M65OLYvDk7QOKnlN7TZsBIUtXjx9deMDbbiaSdYsatqR1nPu60Ws
         N8Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWY3+AYXQptjCCZ1JmnVs4GN79N9Qm8nktbVWUmUkh4TDhoG7ET/BC11RSFhyfInRKCIl/6pawaxrgcMFMLOXQfRxyXfzV1Tcw=
X-Gm-Message-State: AOJu0YxtFVg/ijlF5v4q1NojX0vQa/ZONgLsv0gQN5Pp8E4406b76SGQ
	4IHXkUsLjyALUrC8Rwp15OMBcnSsk1pB39kUfwHYuSsjMh7/pJd4N3qVOvzz26s=
X-Google-Smtp-Source: AGHT+IF1f96C0+2XXsr5aNLkV/eYAX39+YQtc7Yo17drhLTHK/cv6FtqMZVjrmF/gOs5rAQRjpbfrA==
X-Received: by 2002:a05:600c:35c7:b0:416:3f85:d49 with SMTP id r7-20020a05600c35c700b004163f850d49mr2046052wmq.18.1714737379401;
        Fri, 03 May 2024 04:56:19 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c3b9500b0041a9fc2a6b5sm9095079wms.20.2024.05.03.04.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 04:56:19 -0700 (PDT)
Date: Fri, 3 May 2024 14:56:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Subject: Re: [PATCH v3] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <87badb93-27d4-4255-8dde-24774d8e04c1@moroto.mountain>
References: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240429070523.3160248-1-JJLIU0@nuvoton.com>
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
Cc: KWLIU@nuvoton.com, linus.walleij@linaro.org, JJLIU0@nuvoton.com, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, brgl@bgdev.pl
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2024 at 03:05:23PM +0800, Jim Liu wrote:
> The generic_handle_domain_irq() function calls irq_resolve_mapping()
> so calling irq_find_mapping() is duplicative and will lead to a stack
> trace and an RCU stall.
> 
> 
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v3:
>    - remove unused variable
> Changes for v2:
>    - add more description

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

