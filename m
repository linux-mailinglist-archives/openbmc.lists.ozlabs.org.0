Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AE17B1CCD
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 14:45:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BE6fSY7d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxCqq6GFyz3cCG
	for <lists+openbmc@lfdr.de>; Thu, 28 Sep 2023 22:45:11 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BE6fSY7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rw26V6ZNnz3cLj
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 00:23:45 +1000 (AEST)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5043120ffbcso13608227e87.2
        for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2023 07:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695738219; x=1696343019; darn=lists.ozlabs.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UssXu9Wxp7fradqyberfVF7I5rVfNpdxXWunpxNTls4=;
        b=BE6fSY7dXS+/AYOaw4n4A2MPXfCdz2INf4Q/E5MeNjioDm8IsGNsm4yiJ3TiWHymaB
         W/M5q5eEKBF/ayy/pryzlJuf9gkPsO8atv/e/1SGVBC7CLRBXJJfb3De9Vj1VaECg/ip
         zMS2WEAb5yC3ZW8ZJubTaB9RpSR6Ql3HLkHKtfrZXMNsH8C84JlyveOJ4gfxcw5BrZmu
         nXw+iUkJuzAPaNCWbMrFGdCAqgvO1+llgSJcJiua00CYpcN9b80K0J7CB7amofHR7Boy
         hbRECJSYElPr0w8Yx/bto58j/Vw0hgQv6sHltmafKFLu24vQ+yOib3PzzxkATgn4IYj7
         hjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695738219; x=1696343019;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UssXu9Wxp7fradqyberfVF7I5rVfNpdxXWunpxNTls4=;
        b=kTRnCt6fpS+v8Jbqxky3ndRjLrC9JEtAlIddH7uX9b0exIIP3e4hLMILu8NSMO/OO4
         bNgE1Vvx3iDxCV5lEBOXKOovfIvztFeB4irUFArrj4uJUd5vwoZ/E7kSFWSWEIfdIr/J
         ilmqU/LN2EZk1Hl+keyYWi1HtJtYFkhd7GxK1wd9aeE4tO+fmF1/p3SVRklLJOG52VUQ
         MnoJYkO0la5dwpXblccCtEPfELaB8IwajBjuFy4kv/tyaMgV1AcQVPjRd65aLnfpiSlj
         DM6gOak/3sTgMRtubqk/oX3AxHShEMADS9Qhsmbx/YaoxMjmPiY8wDsQVJSaGOy5bqn7
         p7ZA==
X-Gm-Message-State: AOJu0YxyFX39huLK6qNHsXZLj5pW/O2TFR6AkrJbBjHASis1mtfWSGWb
	Pgb4s2kD8oYtbKx+H/T6whbqXw==
X-Google-Smtp-Source: AGHT+IHcUm19hYY20+/d6glprVTg94TajPGELXQ4CXgxFCpADEW5oa8NfeU0dLhCEciyb1RBm632fA==
X-Received: by 2002:a05:6512:110b:b0:502:fdca:2eaa with SMTP id l11-20020a056512110b00b00502fdca2eaamr9903205lfg.52.1695738219428;
        Tue, 26 Sep 2023 07:23:39 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
        by smtp.gmail.com with ESMTPSA id j19-20020a170906051300b009937e7c4e54sm7884736eja.39.2023.09.26.07.23.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:23:39 -0700 (PDT)
Date: Tue, 26 Sep 2023 17:23:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: milkfafa@gmail.com
Subject: [bug report] media: nuvoton: Add driver for NPCM video capture and
 encoding engine
Message-ID: <f794bf89-584b-41ff-a021-ab973cae89f8@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Thu, 28 Sep 2023 22:44:44 +1000
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
Cc: openbmc@lists.ozlabs.org, linux-media@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Marvin Lin,

The patch 70721089985c: "media: nuvoton: Add driver for NPCM video
capture and encoding engine" from Sep 22, 2023 (linux-next), leads to
the following Smatch static checker warning:

	drivers/media/platform/nuvoton/npcm-video.c:1004 npcm_video_raw()
	warn: sleeping in atomic context

drivers/media/platform/nuvoton/npcm-video.c
    998 static unsigned int npcm_video_raw(struct npcm_video *video, int index, void *addr)
    999 {
    1000         unsigned int width = video->active_timings.width;
    1001         unsigned int height = video->active_timings.height;
    1002         unsigned int i, len, offset, bytes = 0;
    1003 
--> 1004         video->rect[index] = npcm_video_add_rect(video, index, 0, 0, width, height);
                                      ^^^^^^^^^^^^^^^^^^^
This function does a sleeping allocation (GFP_KERNEL).  However
npcm_video_irq() is holding spin_lock(&video->lock); so this is a
sleeping in atomic bug.

    1005 
    1006         for (i = 0; i < height; i++) {
    1007                 len = width * video->bytesperpixel;
    1008                 offset = i * video->bytesperline;
    1009 
    1010                 memcpy(addr + bytes, video->src.virt + offset, len);
    1011                 bytes += len;
    1012         }
    1013 
    1014         return bytes;
    1015 }

regards,
dan carpenter
