Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5240253B33B
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 08:00:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDFjJ2BRcz3bqL
	for <lists+openbmc@lfdr.de>; Thu,  2 Jun 2022 16:00:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KxH7T6Io;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=KxH7T6Io;
	dkim-atps=neutral
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LDFhv3zslz2x9J
	for <openbmc@lists.ozlabs.org>; Thu,  2 Jun 2022 15:59:42 +1000 (AEST)
Received: by mail-wr1-x429.google.com with SMTP id k16so5023668wrg.7
        for <openbmc@lists.ozlabs.org>; Wed, 01 Jun 2022 22:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EylIa7AU5DxKHtTl0NKLFEr7DuemmMY1TXNrTZ+7i2M=;
        b=KxH7T6IoN3lEk94H4LT/cweiPQxYtdHGjH9SAiynLW+HIVRh/i8IG8FDk9c9duDnLI
         3h86diDybTGDsxB0uvs/nWk0xSsKEUe/hkGgMvoi6aXpPonhcVKq8Be/KNJUjBPMh0to
         ON4Mfj147Gcs82gl3/+NMXvNfziEYjbPwLkEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EylIa7AU5DxKHtTl0NKLFEr7DuemmMY1TXNrTZ+7i2M=;
        b=pVEwueSPzTez73E3ev09xmIIFHTAyk+N3ZRx5Z6KpULIVgc4GDdeJlt1jcOKyXo5Dk
         psXsuF9zx14Lze4LXnXfWaJ/IRdgnxXGnV80K4QSuJxcnrJpwHZ/FFOmaNs2SgP4DEIz
         rnIsbe/GX/hsbq3xtM3kg1LDhawZhjQ61Q6+0ll25hPyCrnXsU/LwkVIIu6TJ6mCxoVh
         D/40bJq2Uk0HwDBScxs5OAWEm9MJ2gWVf+wOQRGNuYBZaGzW3cveFWHiPySsJ2lZ0sdV
         S6JaPhSqtR09UGKcSQ+HWm5R3MIOuJ9FCujhQMwofYXRwsw04eVfOoTl5nJSzr0NR2yN
         6L1A==
X-Gm-Message-State: AOAM532GvwEBmG+0kSkO1dennPHr8ecwV51dch8GiMY+x0ADZ1efT8qT
	QQjy+671dcDD8/s9Uhm65JXHhTYWHxQWmF78hOo=
X-Google-Smtp-Source: ABdhPJxNpaevndMDW6sk0RDVvXAcn1DIF7GwnJlUgpqwHdzoELNBIwPxbFPD8WMaSErfZZj/8xzwmQ4nESX4boFjWFw=
X-Received: by 2002:a5d:428f:0:b0:210:30cd:3753 with SMTP id
 k15-20020a5d428f000000b0021030cd3753mr2119204wrq.549.1654149575721; Wed, 01
 Jun 2022 22:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <1811e688e68.f6b260b112172.7670613845716605077@zohocorp.com>
In-Reply-To: <1811e688e68.f6b260b112172.7670613845716605077@zohocorp.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Jun 2022 05:59:23 +0000
Message-ID: <CACPK8XdtT9J6iX-bvrOX_hjnaaG6OoGVx0SPUd0waJCFsrzKEA@mail.gmail.com>
Subject: Re: [ Entity Manager - Beaglebone Adc }
To: Nikhil V <nikhil.vu@zohocorp.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 1 Jun 2022 at 08:51, Nikhil V <nikhil.vu@zohocorp.com> wrote:
>
> Hi ALL,
>           I have successfully ported openbmc on beaglebone black. I have displayed LM75, and ADC result on webui.

Neat. Do you have your patches on gerrit for review?

>           Now I am doing the same with Entity Manager. I have displayed LM75 result successfully, But unable to display ADC result through Entity Manager.
>           Below is my Config file.
> {
>     "Exposes": [
>     {
>             "Index": 0,
>             "Name": "PSU 12 Volt",
>             "ScaleFactor": 0.1124,
>             "Type": "ADC"
>         },
>     {
>             "Index": 1,
>             "Name": "PSU 5 Volt",
>             "ScaleFactor": 1,
>             "Type": "ADC"
>         },
>         {
>             "Address": "0x48",
>             "Bus": 2,
>             "Name": "Ambient 0 Temp",
>             "Type": "TMP75"
>         }
>     ],
>     "Name": "xplode",
>     "Probe": "True",
>     "Type": "Board"
> }
>
> 1) How to display ADC value through entity manager
> 2) I would like to control single pwm pin
>
> Any pointer would be helpful or what are the steps to display adc value/PWM control
>
> Board used : Beaglebone Black
>
> Thanks & Regards,
> Nikhil Muley
>
