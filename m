Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCD68BDCA3
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2024 09:45:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZANNHQvr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYVgt70gnz3cVM
	for <lists+openbmc@lfdr.de>; Tue,  7 May 2024 17:45:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=ZANNHQvr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYVfw039Gz3cTQ
	for <openbmc@lists.ozlabs.org>; Tue,  7 May 2024 17:44:55 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2df848f9325so33046861fa.1
        for <openbmc@lists.ozlabs.org>; Tue, 07 May 2024 00:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715067889; x=1715672689; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1bi4jNn6UYAzYQiUUn5O+wqHqVm96iTmQL0Ia3V0gI=;
        b=ZANNHQvrRKAbArHL9DML69ulCV/zHQMyQrjf9DhxZyMVqkec+Nwdh2IynF26kYyFEE
         VFwZ3KLJ5hgRYh/1j8hrYbrQ6KWtwvh2kkC/FfoRna6JzsE+m0uOCr3whDuqqcdHpm1m
         m8grVgjUfQCL2t5vOogffDyibd3W3xiV4JYcd+JneLzgyTqOURyzl6vgQAKiIp1+1BXf
         jTZhiklMk85sRrnQE5thBCZv5nhXDDQpxBnyQbd9W32CnTT+I/INEK7l5IWw2Y9nRbJs
         W0TsC5KmHH3HgtfwsohwA79vyUbWPucrARuGrhvbY7KJxxaIVz6QqZK2Pq03HE0Bfc+D
         UzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715067889; x=1715672689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1bi4jNn6UYAzYQiUUn5O+wqHqVm96iTmQL0Ia3V0gI=;
        b=SNFCMNCGLhwhmOVY/tGIL+IIrEqIrE4t5jMgUdwpb9WMJ93iHbU6IBs+ujgQjBDLMj
         rO9BXBxJVJ7sx8cMufbWoJyPH6TytKE+PbQtG3lXEoQFG6jXXzLwor27z+l7aE7uWqe0
         87tudcQOUtDPFLlAynbGHgq56PJ5PyMtt5qA6MMyhgSUsGtM3ltHrjsqDVRPf3w3iVpB
         FZXiUJ9gZiSM44S7znnnmYVZdn0lqa/1McLvOPHRvaVe63xvdpNVOLtzzdLFtFHnoP6i
         mdlAIu/MF/9THxphjVxa7R6QdYhgrQ6IVGQLsFjpwbucgmZWMfkQPYPa9Zhv9U5cXVoA
         jE1g==
X-Forwarded-Encrypted: i=1; AJvYcCWnsdRKXTht9kH1x2T0XUI4CRh+AtbLFpv2f5fGltFegO6bxNr0uy1xXMElnspGOeZFtkH3OttMGKcRNDlwHQnGZVqZ6mlB7Vk=
X-Gm-Message-State: AOJu0Yx+f4GYBajLUHxT/2rV1ywrx9zW+nEiR8u3HYeEZkZhGGrFqfEf
	r4DgHMUfkMUXO4iOZbCRprYom4ukZaZnYxEx15xaf3h/YrDFqvjs7WvU+fkvP6c=
X-Google-Smtp-Source: AGHT+IEqBq6InnqV5B1ebMw5bjIhWdea7zdgrrhAfTHQbMFBGkMMYvDCj4F0RXyjXFCvoK6BKa7DbA==
X-Received: by 2002:a2e:b0d5:0:b0:2de:73b5:4280 with SMTP id g21-20020a2eb0d5000000b002de73b54280mr8434578ljl.3.1715067888674;
        Tue, 07 May 2024 00:44:48 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:581a:1d:3b79:3b03])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c311400b0041bf685921dsm18660565wmo.0.2024.05.07.00.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 00:44:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: JJLIU0@nuvoton.com,
	KWLIU@nuvoton.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	dan.carpenter@linaro.org,
	elfring@users.sourceforge.net,
	Jim Liu <jim.t90615@gmail.com>
Subject: Re: [PATCH v4] gpio: nuvoton: Fix sgpio irq handle error
Date: Tue,  7 May 2024 09:44:47 +0200
Message-Id: <171506788090.6452.15729262435287015920.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240506064244.1645922-1-JJLIU0@nuvoton.com>
References: <20240506064244.1645922-1-JJLIU0@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: linux-gpio@vger.kernel.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 06 May 2024 14:42:44 +0800, Jim Liu wrote:
> The generic_handle_domain_irq() function calls irq_resolve_mapping().
> Thus delete a duplicative irq_find_mapping() call
> so that a stack trace and an RCU stall will be avoided.
> 
> 

Applied, thanks!

[1/1] gpio: nuvoton: Fix sgpio irq handle error
      commit: 7f45fe2ea3b8c85787976293126a4a7133b107de

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
