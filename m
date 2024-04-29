Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 681768B5172
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 08:30:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zDSTBSjI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VSYP10nQTz3cR1
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2024 16:30:45 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zDSTBSjI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VSYNQ4R3Nz2xPd
	for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2024 16:30:12 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a524ecaf215so506506166b.2
        for <openbmc@lists.ozlabs.org>; Sun, 28 Apr 2024 23:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714372206; x=1714977006; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KERnA4T0jCEQs34o3IlPybs8QOMiz93MooHjuPlhTb4=;
        b=zDSTBSjIMHyFTlweCxaDw7fzAb9Chx6XuYpOjIuc0HK9CuZbWuMBaF/5g1nEJNjvK+
         287jkQ0u2CbNq8JO89NnuiNjogoFjmdOzWAog8tf02bWnamWdgQJaMPvDBeAk1eiQfzS
         tH4fVlaOBjXq8crGBnemyc1v0/gN+7CMgR1kyJT4bTNmw/3XWEH9ho0oRiUToouZZgDu
         1u8VZxSQnDi3K20321mMjYXOGQ0P04KPI7plAwyRKK/wVUOAkC2SLU/C8lZR+qc9UM+4
         rr+doG9xQ//I2TsfmkCURDsLyKldw/tj6Xlj9MrE7wyhWEBBlK43r8zuQei5trkBF/v9
         ucFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714372206; x=1714977006;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KERnA4T0jCEQs34o3IlPybs8QOMiz93MooHjuPlhTb4=;
        b=USgt5aC0VHj80CrqgFDY0ljMbHO8IY+YT4f4T/YT8gc3udSvwNj+pPhuQDBbf3RHIH
         sP0vQj4hqWo4M1XoEyPTvmnvR0xuKdNHFWEyqm5vIiNP1+CHxphEd2Q04OGksFd+bUxF
         KoNTcuzaJQ6emGCeW9q8no4V3rWyU+VcID7FoOz26BrailyvFi6HbZs8+MVVIGOCleSK
         g+T4+g3mo9B31tQqyVOfWE9JdLJOj+HupohP5576jvBDyr1nKmOgVZ6KyzGWFRO5zUMV
         HHgcQBPypc2jIouxJuwvQano8krl+buSOZ/DEgqKDGn2qApTOU+EIo+dV0dQFGhApneS
         BFDg==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ph88Vv1P4m+oSUctaoaEJm1D/3YquUwmI0DkmHg7SDWJhG/fbcDZRnUomNHSEWhNKCPd+LjEtkJyaq4PXBga4e6CuY/sSYY=
X-Gm-Message-State: AOJu0YwyP3pW3FOUEFmk6UMIJBz2YPT6mxH3U9w/Vj1C8apZT/3L7LDU
	fBUVGbs4NP5jaYItZg9/bVL5+QCBcGlXYpOckDMUkahzEW35m5YyYMgdpX91f3I=
X-Google-Smtp-Source: AGHT+IEuwGziIm6KgpZpUtsLTsqKVmTl4T2GUPgk2+IbpwCDyVrzevDmt0o2BYgkfnHK8qfanoQquQ==
X-Received: by 2002:a17:906:3602:b0:a58:e569:1242 with SMTP id q2-20020a170906360200b00a58e5691242mr3198451ejb.4.1714372206208;
        Sun, 28 Apr 2024 23:30:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00a51f2b5b1fcsm13544638eje.75.2024.04.28.23.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 23:30:05 -0700 (PDT)
Date: Mon, 29 Apr 2024 09:30:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Liu <jim.t90615@gmail.com>
Subject: Re: [PATCH v2] gpio: nuvoton: Fix sgpio irq handle error
Message-ID: <0ef4941c-ffa3-4f34-b3bb-4b97d923294f@moroto.mountain>
References: <20240429060642.2920266-1-JJLIU0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240429060642.2920266-1-JJLIU0@nuvoton.com>
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

On Mon, Apr 29, 2024 at 02:06:42PM +0800, Jim Liu wrote:
> User use gpiomon to monitor input pin ,if triger the system will call trace and rcu stall.
> 
> The irq_handler uses generic_handle_domain_irq, so there is need to remove irq_find_mapping.
> 
> Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
> Signed-off-by: Jim Liu <JJLIU0@nuvoton.com>
> ---
> Changes for v2:
>    - add more description

Part of the commit is missing so it will break the build.

drivers/gpio/gpio-npcm-sgpio.c: In function ‘npcm_sgpio_irq_handler’:
drivers/gpio/gpio-npcm-sgpio.c:437:28: warning: unused variable ‘girq’ [-Wunused-variable]
  437 |         unsigned int i, j, girq;
      |                            ^~~~

Thanks for improving the commit message and adding a Fixes tag.  That's
very helpful, but it still can be improved a bit.

======================================

Subject: [PATCH v3] gpio: nuvoton: Fix stall in npcm_sgpio_irq_handler()

The generic_handle_domain_irq() function calls irq_resolve_mapping()
so calling irq_find_mapping() is duplicative and will lead to a stack
trace and an RCU stall.

[ cut and paste the call trace here]

Fixes: c4f8457d17ce ("gpio: nuvoton: Add Nuvoton NPCM sgpio driver")
Signed-off-by:

======================================

Otherwise it looks good.  Please fix and resend.

regards,
dan carpenter

