Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 894E87D7475
	for <lists+openbmc@lfdr.de>; Wed, 25 Oct 2023 21:37:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UbImyIgI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFzj53CkFz3cP3
	for <lists+openbmc@lfdr.de>; Thu, 26 Oct 2023 06:37:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UbImyIgI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFzhV4LRYz3c2K
	for <openbmc@lists.ozlabs.org>; Thu, 26 Oct 2023 06:36:57 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6b1ef786b7fso80539b3a.3
        for <openbmc@lists.ozlabs.org>; Wed, 25 Oct 2023 12:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698262613; x=1698867413; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGbMnAcQD9MpNg1isUp8Xn3wZuZoLOEwvnOJV3Zib1c=;
        b=UbImyIgIPm7SjXb9zi9jBs3XVDEp42njs7Z6LnvFXyWut3b9/kum2s7QpjbQHKPP81
         ZE0epsyzE8PlESKCprXZTakV/v5t3OKp0C96o0OzTB67SOaMy2Zgoc7ip8mZbmhYUlt+
         swxfR5UZCJV1oEHZTuknhDy9NiZEXjeCGfjptC5MXVk7zJ91AlHjDpx81zSNuhd+KdEp
         lJTdk9K0jIibB5Y9jwqWXh36OIyKr4HU/0ltxRjVlVmNetC2/SEpGYG63+hJsGeIKTad
         rfQk8l4lWt1EaxtSpsWvJjVnrbQKfMiZHKt6/NMVY6ZB74/5c1PTuTJHQ9UiMCYXuLMI
         KR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698262613; x=1698867413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGbMnAcQD9MpNg1isUp8Xn3wZuZoLOEwvnOJV3Zib1c=;
        b=sBrGnnSadlnU9dngozMpGjWwbKYzLdz5nx4X1ZkrIzXOIzqagjx84ye8ecfZMLZHJP
         ln2sKxUaB6j3uTNIjFGXffvvlmuxGGrHk8fm42cUt+Uhzdi0Q2uT/PFxxBH3HKncFuSh
         4UlSb8QjjeJ+cozcsAQpLWpXGNQ6r+6Jq+BRpT0XKA2pFFJa5DuY7Yo72Tr+j3JsfXy+
         uZHCwGHpFrjJjz7F+trjv7z8KQ8HD18BCA1H9qoQVtlUe0O2OwnyUhHLoW3zRDy171m8
         d4YBH5QNrX88++KCmrLbsp91I6hxw8jW55ZdlQVfA8W6cpOGpkQ2kESIB5EcurFbQWc2
         DVjA==
X-Gm-Message-State: AOJu0YwwHDhAq4p6bzSIILVWEs0ci9LxSq4hI7V2F9Q1htnkaIHBil+v
	p3MinUYqU1F68DupglcxNws=
X-Google-Smtp-Source: AGHT+IFDdIs+VkhqOZmhmb39SGTaiCH9s23YjOt7r0Pg9uoy33BcIMUwPDCXdR+5BIBpQO0/ZEH7AQ==
X-Received: by 2002:a05:6a00:1a4f:b0:6bc:e7f8:821e with SMTP id h15-20020a056a001a4f00b006bce7f8821emr19565769pfv.10.1698262612844;
        Wed, 25 Oct 2023 12:36:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g5-20020aa79f05000000b006be055ab117sm9980413pfr.92.2023.10.25.12.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 12:36:52 -0700 (PDT)
Date: Wed, 25 Oct 2023 12:36:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] hwmon: npcm750-pwm: add an error code check in
 npcm7xx_en_pwm_fan
Message-ID: <5036fed5-ff29-4d9b-a31a-1676a8e4f051@roeck-us.net>
References: <20231020085518.198477-1-suhui@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020085518.198477-1-suhui@nfschina.com>
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
Cc: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, jdelvare@suse.com, benjaminfair@google.com, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, tali.perry1@gmail.com, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, tmaimon77@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Oct 20, 2023 at 04:55:19PM +0800, Su Hui wrote:
> npcm7xx_pwm_config_set() can return '-ENODEV' for failed. So check
> the value of 'ret' after calling npcm7xx_pwm_config_set().
> 
> Signed-off-by: Su Hui <suhui@nfschina.com>

Applied.

Thanks,
Guenter
