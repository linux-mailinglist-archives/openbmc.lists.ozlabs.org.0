Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF817DA808
	for <lists+openbmc@lfdr.de>; Sat, 28 Oct 2023 18:21:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dSJqOrs4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SHlC31JLrz3cSd
	for <lists+openbmc@lfdr.de>; Sun, 29 Oct 2023 03:21:03 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dSJqOrs4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=groeck7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SHlBR1Qp0z2xPZ
	for <openbmc@lists.ozlabs.org>; Sun, 29 Oct 2023 03:20:28 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6b5cac99cfdso2843310b3a.2
        for <openbmc@lists.ozlabs.org>; Sat, 28 Oct 2023 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698510024; x=1699114824; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT9WTH6/M3GiAfWTUMKKJgdgKxBiJQefVVsQat7FxOQ=;
        b=dSJqOrs412v0fzGalZouFlUVq7BrSZMMw812/B9FqqG6Jy9LZ8P11JItu7WVNAaquA
         RmcDNr1J5XhAJaeKGPGlqSCoH3CMgbyUmh6nHDtt9GiI+XHNo15/sbP2wJFNdguUrGk3
         sYbF+EIaSJX9yi+oZLjfobMVgHkv2csiIvA8EvxWjiO2eeE8rnqElf5kQJ19UIwgfiDw
         6KX/9V67OWWNqt/JgrJNIqk6wK1aOkV71MdUZX4FfpTcdhg86f+nTRMVJz1OeVX6hjaP
         V1DSmX6wh0CAGbsIuEb/S064NGWNbxq7aR5NmyLSdnm8GhIfR9URuyLYgNLV1Nn1AseR
         EdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698510024; x=1699114824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NT9WTH6/M3GiAfWTUMKKJgdgKxBiJQefVVsQat7FxOQ=;
        b=kiz0OfbjU7dnRJbd/D5MSFpZNx+/G853LEAQ4GlQslSBCk0bcIZC0HEpEUklhbchqB
         F94xbU5/RztN3dndeHhWF1itFoo/H0fjOevRlOdxEyQ8rjXgfQDzUeq4xBa7P46nT7P+
         HelsLLqUJjFdnaJIqWkVof2cUzemVx0v1HN8cjohqDLpE9Qut23nVQW5CgfeYxYEKnPF
         oGrwu25Fg6sH3moe9O2K6yrH6KyFbDTrlwGAPOaZk6FIUeT8amQw/hy90FFoxvWPlKUI
         7PLE/AQmLMcZn2Qt1RNa17nO0NAMlE8/oL2WBrvVCPDy5bLuGku2xc8+7wmlvpO/gSak
         C1jw==
X-Gm-Message-State: AOJu0Yz/3oYvPjVnaMn8HwVDg4rjh10NwsVpepVrYNCMd+WXw/pWgd1i
	nUUSItZLWOAT/queS5/qIdg=
X-Google-Smtp-Source: AGHT+IHJhBXFjEFWZclViV4Ss51F9C7SAzSbQQRBvpyCqGaV4EydAiGGZj90kF12MI62I+3QMbI9Kg==
X-Received: by 2002:a05:6a00:198c:b0:68a:4261:ab7f with SMTP id d12-20020a056a00198c00b0068a4261ab7fmr6275125pfl.31.1698510023986;
        Sat, 28 Oct 2023 09:20:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id fn8-20020a056a002fc800b006a77343b0ccsm3140045pfb.89.2023.10.28.09.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Oct 2023 09:20:23 -0700 (PDT)
Date: Sat, 28 Oct 2023 09:20:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tomer Maimon <tmaimon77@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: npcm: Add npcm845 compatible
 string
Message-ID: <96dcad12-af5b-49ca-872b-34ed87c9766d@roeck-us.net>
References: <20231018181925.1826042-1-tmaimon77@gmail.com>
 <20231018181925.1826042-2-tmaimon77@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018181925.1826042-2-tmaimon77@gmail.com>
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, jdelvare@suse.com, benjaminfair@google.com, Rob Herring <robh@kernel.org>, avifishman70@gmail.com, venture@google.com, openbmc@lists.ozlabs.org, j.neuschaefer@gmx.net, tali.perry1@gmail.com, robh+dt@kernel.org, joel@jms.id.au, krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 18, 2023 at 09:19:24PM +0300, Tomer Maimon wrote:
> Add a compatible string for Nuvoton BMC NPCM845 Pulse Width Modulation (PWM)
> and Fan tach controller.
> 
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied.

Guenter
