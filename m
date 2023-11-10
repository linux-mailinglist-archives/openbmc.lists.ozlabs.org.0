Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 575447E77AC
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 03:43:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iivyegL7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SRNRf13rfz3cmp
	for <lists+openbmc@lfdr.de>; Fri, 10 Nov 2023 13:43:26 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=iivyegL7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SRNR52wyvz2xQD
	for <openbmc@lists.ozlabs.org>; Fri, 10 Nov 2023 13:42:57 +1100 (AEDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-50931355d48so2043480e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 09 Nov 2023 18:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1699584173; x=1700188973; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uOlt/wrM8mND2rC/vGNjgj0jSO9jWbzA9CBIozpRSkQ=;
        b=iivyegL7wOrA7pytsFTD0xI8jtzLAlo0DarWS1PIpE7JpUVRxPRbneBoJ0NM/Bafws
         60LXMWa0MqfWsasgqHpe2tRaP3lbulM8iFdlV57AB0mRf2Ctr/4oJQxX/gvEIaskt9DX
         QRYC8Lsru4LXSdKO1eB9AqT5Iprrj8WNpyTV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699584173; x=1700188973;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOlt/wrM8mND2rC/vGNjgj0jSO9jWbzA9CBIozpRSkQ=;
        b=hyu9eXoWoSY2jUrGC2rh/2E68vPGVgRFTWfD0fBK1p/ROmplF0tLyyOAvpTJSsvMqs
         472SVoceYWRJ8umGY5fhGFB8jCf6fPLxVOlOUPnvg52NVXCxOCIqhCRmyz9BUiwBrsH+
         MLas5mKc3RH1VU2THtSQywoY61EmWqHaJ/h6es+21wCFdlwpgeLAEfnfaydJhRA9Cfh5
         /vZ9WQ8RxYd+Vp0MpDp+EnzE34uNup2GBKzqdRLEbjvrvKRkEgdGBTCtctg7ydGWqO5R
         ex8D6fwh02geN5CjO+QoHuzg48T2WlOP48VUG75JTH+5Y64ftGCf94khvv28ojSLsU5Z
         Zz8g==
X-Gm-Message-State: AOJu0YwiemvMaAvjOBzWEF/aC0xP2ExVWbl5Do9d7Gc9TlrXMTcFAKCW
	U25eo9baJpYMQHSkwhcqpcMfjO5qB/NBpQesGHI=
X-Google-Smtp-Source: AGHT+IHXkRoMdjzIQusEPfUhFnwqmv/OjnK5aPx9oLWpbcnFct5qoPznT2JzsrWmyDlZegojOJDMJCFYZ5a2EpWSaw8=
X-Received: by 2002:ac2:57d4:0:b0:509:49fc:c261 with SMTP id
 k20-20020ac257d4000000b0050949fcc261mr2834660lfo.51.1699584172939; Thu, 09
 Nov 2023 18:42:52 -0800 (PST)
MIME-Version: 1.0
References: <20231108230754.17064-2-zev@bewilderbeest.net>
In-Reply-To: <20231108230754.17064-2-zev@bewilderbeest.net>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 10 Nov 2023 13:12:41 +1030
Message-ID: <CACPK8Xc4ybw3QGJ7aSHKwNmQUPqExF7uTJ8thQ1C+8VpRpNmdw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.5] pinctrl: aspeed: Allow changing SPI mode
 from hardware strap defaults
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 9 Nov 2023 at 09:38, Zev Weiss <zev@bewilderbeest.net> wrote:
>
> Some platforms unfortunately have their SPI mode selection bits
> strapped incorrectly (such as being configured for passthrough mode
> when master mode is in fact the only useful configuration for it) and
> thus require correction in software.  Add the SPI mode bits to the
> GPIO passthrough bits as the exceptions to the read-only rule for the
> hardware strap register so that the pinctrl subsystem can be used for
> such corrections.
>
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>
> Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> Link: https://lore.kernel.org/r/20231005030849.11352-2-zev@bewilderbeest.net
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> (cherry picked from commit d875d6ccd36f5eed25829d483b12df6ed826f9b5)

Applied to dev-6.5.

Cheers,

Joel
