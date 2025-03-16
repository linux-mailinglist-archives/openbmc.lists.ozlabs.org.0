Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF89AA63636
	for <lists+openbmc@lfdr.de>; Sun, 16 Mar 2025 16:22:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZG20Z27VPz3bwF
	for <lists+openbmc@lfdr.de>; Mon, 17 Mar 2025 02:22:38 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1031"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742138554;
	cv=none; b=HjAwfsjYRuSldx1/JA7OowBtIqbKyfQCsmOQWOCAe/ifI5MfMqSObzL2VONQq3iQJY6K4wx1eQ3Gx6brQWtcDGP2Y/P14psk65SBMOa2+F7kDGuZVda0LZPYBBFrWCVElmb0Ue+7eqi5w9xGKHlTQ69wus0n2qcq/FQfwMFhXb9NA8daKWHEp5wkqP9IdagFkXtnS2NhdzwoLnQDvZjSmByeVoe4Itu1soBJFbszVBS6D1wFJzkDT2v+QTi4R/o/5nDMfv7NRBnM5ZSw25cVeXp8NNuA5mZHAioE6biizMToiJL5RnIjeoPsAa1U9vv8kewuW3nGAMd1pOKZehmslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742138554; c=relaxed/relaxed;
	bh=Rs6Mj7NfVXAbjMAhz8nE+UkRAhB37EqocID8lRhU1pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=itkhr668cxzfcYlLNUWQFOTaXbGLNI/gq6sNAD69qRYarZWE/IpyrP9/zrdtjxEv6fXFmUtKmdxNM4PcWZA1cHyhqCNg93n0omrO+EkRsdIfAZX5Mbt00nxLsjQ9Y4eFGHp01r/xEi9iMeo9Qs5CNXtiptiKLYUJojeUnlzapONyAV5M6oWWq/Ppsg2mgcgvZlTA6NXy3O0tnZDbnujsOoqhl/gsakIRYPO1wPc/WDE6hYEK7XXv+rOrQCQjcVsFA8rhn2qN+Ovv2IuBg4nJ5pF7YQMMcOrdT4LQiAeBy6xIzraONhgZOWJ/b/Fs8iQ30dfVaOasdVUhC6omDtEP3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IPBZd3dq; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IPBZd3dq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZG20S0nJPz2yKw
	for <openbmc@lists.ozlabs.org>; Mon, 17 Mar 2025 02:22:30 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3014cb646ecso1328296a91.1
        for <openbmc@lists.ozlabs.org>; Sun, 16 Mar 2025 08:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742138548; x=1742743348; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rs6Mj7NfVXAbjMAhz8nE+UkRAhB37EqocID8lRhU1pk=;
        b=IPBZd3dq53phwxZe1vliQeEtPMtnDuH3klHDgo5G8iojmy6BiAe3T7emq5wNepDHeh
         cjoMyyrGDIjAbbVuiq5Cr4uH1l4eQqDnVAhyXEUg6ZzCh/GOB7xAQwOui6NDWTFY0ILW
         2RFmwaiI40MCCkwgN9Mv7NP3EnEntOsiNqtCR9RRBKHvREaqz4+Mt7BzlC2U72cOhiri
         JmxdU1A4xzw5sMgCDaG9Q5dZ5JPvWf+81+qpX0LshmmX8MTiDaMR32K3V4UsZyJ7PcR3
         ys1/dh9Y1AXR8Qs75kBRhubzXWdyqMUDPAdTRZHbTqp2tlqvw9O5E9/8UknOv2RswTbC
         sV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742138548; x=1742743348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6Mj7NfVXAbjMAhz8nE+UkRAhB37EqocID8lRhU1pk=;
        b=de8hDBG7+hCEZAG+wMHtoGONhoeqzoJOeJIX4oGzcWhrdmpJoVx27iPekisZLMfwFN
         qUn5aM7VC1GuollDc69rM2Uo8AP22JYo3u0H0ereKMmYb4kJNd/zl5AfaU/VgEmvP5C0
         f+e/L/2e+5JhzfwFOStYlPCqmpdWPSqyg8uoX/u1pzBUvQ1W9a/mtzXxidRNn46fOal2
         mexak5xFWKij9QfF8daMva/1kfEiBqlJt5K4eGONVy4+S5nq2sDZW/89Nmy7GlXPjM39
         TwOrnlRl73a0t5qimnY2wObYYcvwRTl8lB+yeEc6qRmkQk6ktW+y+fZ6iTsNbhFmOE4v
         gRHw==
X-Forwarded-Encrypted: i=1; AJvYcCXrki3pS9SWyMqEuUbRE3g5FBN+3HxCrEsavK1C58MDo3e27ouEELh+q1jCVr7bbIYr95vrOIjx@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwJrCwFvb/VTUT+QLeLoT4JO3X05/qYHwOxX4Q32ThMBBv+X+0v
	6rwh5HX5EAV776w6R1tDyltBg5f22ZxXnSJj7slxZruOldlkpBNQ
X-Gm-Gg: ASbGnctfLW+1v4xKWQa0v5kg1Sz/AEH0cHdBd0bCAcxrPUsERsmySHqfRCHIkH8kMz7
	S+R/9UasNJZ/kJGvTMACinpg9Va+gkD3FKseFTHVGHLL8sbXAH+OS/Ip7UHHDIHtHxm6jB6Htpc
	JfK7MYJ/PdCVlm2kvwYmFkpJHUHopIn7cK82j2OQdM302ceMJ0ZoP8gXy9/kM1reE0BbIGSaV3g
	YZYJ95N6UNI0RkCXhLB44kuT9QLxPU4hR7HrMPIYvlAwDqyvXzq9xybVuTfn8PQ+FQ/zXGrLjR6
	yX2/b9wqfkqxGxkHa5tUIH3pqC0AGmfD3YJWqXu4Msr5LT2oP/MoDvD2hQ==
X-Google-Smtp-Source: AGHT+IFLvVeQxiakJUeEJp94hVx51DL+nhXHAvzn5+RsTwsHYZlZ6rkARhi6XFqLqRlS5aibN0kBRg==
X-Received: by 2002:a17:90b:254d:b0:2f9:cf97:56ac with SMTP id 98e67ed59e1d1-30151afbc79mr13794708a91.0.1742138547819;
        Sun, 16 Mar 2025 08:22:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301539d3f40sm4308739a91.4.2025.03.16.08.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 08:22:27 -0700 (PDT)
Date: Sun, 16 Mar 2025 08:22:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v28 2/3] reset: npcm: register npcm8xx clock auxiliary
 bus device
Message-ID: <536f5393-478c-4a50-b25f-180e221ef7a3@roeck-us.net>
References: <20240912191038.981105-1-tmaimon77@gmail.com>
 <20240912191038.981105-3-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912191038.981105-3-tmaimon77@gmail.com>
X-Spam-Status: No, score=2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: devicetree@vger.kernel.org, p.zabel@pengutronix.de, sboyd@kernel.org, venture@google.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, openbmc@lists.ozlabs.org, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

On Thu, Sep 12, 2024 at 10:10:37PM +0300, Tomer Maimon wrote:
> Add NPCM8xx clock controller auxiliary bus device registration.
> 
> The NPCM8xx clock controller is registered as an aux device because the
> reset and the clock controller share the same register region.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Tested-by: Benjamin Fair <benjaminfair@google.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Does this work with real hardware ? I tried with the new qemu emulation,
but that gets stuck in the serial driver initialization. I found that the clock
device instantiates but does not register as clock provider because it does
not have a device node. I needed something like the patch below to get beyond
that point.

Thanks,
Guenter

---
From: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] reset: npcm: Provide device node to clock driver

Without device node, the clock driver can not register itself as clock
provider. With debugging enabled, this manifests itself with

 of_serial f0000000.serial: error -EPROBE_DEFER: failed to get clock
 of_serial f0000000.serial: Driver of_serial requests probe deferral
 platform f0000000.serial: Added to deferred list
...
 Warning: unable to open an initial console.

Look up the device node and attach it to the clock device to solve the
problem.

Fixes: 22823157d90c ("reset: npcm: register npcm8xx clock auxiliary bus device")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/reset/reset-npcm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/reset-npcm.c b/drivers/reset/reset-npcm.c
index e5b6127783a7..43bc46755e82 100644
--- a/drivers/reset/reset-npcm.c
+++ b/drivers/reset/reset-npcm.c
@@ -409,6 +409,8 @@ static struct auxiliary_device *npcm_clock_adev_alloc(struct npcm_rc_data *rst_d
 	adev->name = clk_name;
 	adev->dev.parent = rst_data->dev;
 	adev->dev.release = npcm_clock_adev_release;
+	adev->dev.of_node = of_find_compatible_node(rst_data->dev->parent->of_node,
+						    NULL, "nuvoton,npcm845-clk");
 	adev->id = 555u;
 
 	ret = auxiliary_device_init(adev);
-- 
2.45.2

