Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5818B8C20
	for <lists+openbmc@lfdr.de>; Wed,  1 May 2024 16:47:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FZ9r+vGw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VV0K30F14z2xPZ
	for <lists+openbmc@lfdr.de>; Thu,  2 May 2024 00:47:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FZ9r+vGw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VV0JV1VRLz3cVB
	for <openbmc@lists.ozlabs.org>; Thu,  2 May 2024 00:46:48 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6ed01c63657so6585850b3a.2
        for <openbmc@lists.ozlabs.org>; Wed, 01 May 2024 07:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714574805; x=1715179605; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=03NAVWyPVCkux7RYgQXQ7gWtPHfhHO2R0JOSbz8EmHg=;
        b=FZ9r+vGw3ov49h6QQ3Xsu6UyASncz0uZCj4Bxan0l5hxYOo9+2KtYq+uiLQ2OI4Tma
         iacGI7sxLg8YUq4ahxdS9lbGKvMyHtNy0nmYBJHtR3CMAb8Dz6+IjnSsuLAM/8KYwZLt
         90vDcmofR5zeK36EAjCwB+pgV3jfOuz+IR/i5JVJnCQrXhrcG2BbicROtBHyUr3euMO+
         yiHrSVAWH3WFYXoEBc6XCSK+EKgJlevsnd/mw/QRPBfOOjDQ1wRPIm2GNwn9ZEofSmTC
         dDVrdbcb9U4vCA04WhB1LFrc9EH55d+Hwv5ppeLJixmrU+75RMvrrmIRV5T8LCuXe7TF
         G7zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714574805; x=1715179605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=03NAVWyPVCkux7RYgQXQ7gWtPHfhHO2R0JOSbz8EmHg=;
        b=LzTBYxe9c5l7BT3a0R3hrK45nrtsgKyn1ps96cQpkpnVJawXDiB4/jasFGdRc0boKy
         eVocT9Btaitop3MyfOqdknwXWX0T6Zxf0o/r0cclya1LGz1Ox8ZInxJxsOWw5/Vt1t+h
         C2HREO+zk7G2d21gr+5i8BvR6VOd23+LQ9tAQt5KXHZivWng03D0Gvbqcic0spXSS9K6
         ObesNdSY9MuBdRmoHhz88V6zpvNmKeAllm24JkYSkwPTGkr8kZmI8V0jrbQA9JwXAnD1
         sXObloOm7rz6xIGW6fkpeBfZx7G93rHMtJHNqNcyFi3EAvn4/tP2Ax2PGHIF41Q4+9Zl
         bPrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYRz4HEA7qCXfLyKL5L+fSd8U4ZLS/+5WossFXZ2Tk+bPwsPwUi9lycnfuSfTxSPywpWdWln8rQ6mZnXHPIACMM2MZpOeZqh4=
X-Gm-Message-State: AOJu0YxA7Ejbjsn0T9stEuRwpgCZZViSumHEGKdHx9oYXWB0fwoT0b72
	dBzedreZQ1QGNrEdvV+6/wM318hifxVYUf4EBm0Pvy7Mh3lGDSpG
X-Google-Smtp-Source: AGHT+IH58OM+dBAGypaVzMmT5xY2jQd7+OPRGG5/JnBc3ubz05DICGoArY0l/LmVqdn8E51edt07tg==
X-Received: by 2002:a17:902:ced0:b0:1e4:cb0e:2988 with SMTP id d16-20020a170902ced000b001e4cb0e2988mr2778248plg.2.1714574805328;
        Wed, 01 May 2024 07:46:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id p2-20020a1709027ec200b001e5c6c399d7sm24704940plb.180.2024.05.01.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 May 2024 07:46:44 -0700 (PDT)
Date: Wed, 1 May 2024 07:46:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/2] hwmon: (npcm750-pwm-fan) Remove an unused field in
 struct npcm7xx_cooling_device
Message-ID: <22c662b4-14f9-4aab-9bea-64c03fca648c@roeck-us.net>
References: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74eee8aa739f94b8c6425ce3e37a427ca92243ea.1714505655.git.christophe.jaillet@wanadoo.fr>
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
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Benjamin Fair <benjaminfair@google.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tali Perry <tali.perry1@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 30, 2024 at 09:35:37PM +0200, Christophe JAILLET wrote:
> In "struct npcm7xx_cooling_device", the 'fan_clk_freq' field is unused.
> Remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.

Thanks,
Guenter
