Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C9E7AF825
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 04:32:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=efbjJ+b3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RwLH46gYYz3cBQ
	for <lists+openbmc@lfdr.de>; Wed, 27 Sep 2023 12:32:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=efbjJ+b3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwLGW07dyz2yW6
	for <openbmc@lists.ozlabs.org>; Wed, 27 Sep 2023 12:31:45 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5344d996bedso4501235a12.3
        for <openbmc@lists.ozlabs.org>; Tue, 26 Sep 2023 19:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695781901; x=1696386701; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l7BMpSow5RxK+NKCBKV8MoxCToyI+Agt5TevrDCohaQ=;
        b=efbjJ+b3nIMTKE3AFdFrQ8K02cGwN8TQ+itt5Yth2OHLzd1IX/ux5vuBlZbUO2lDBN
         df1xYdb28tgWEPhaY3EBOXSBC706eRL30MJAnoTgIwLh6XDEjGuRpJL1fNvsuoXsUJ5y
         HorpC7G5X7BQr2zD4cEAipZnLyeGznoy0UQi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695781901; x=1696386701;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7BMpSow5RxK+NKCBKV8MoxCToyI+Agt5TevrDCohaQ=;
        b=Z2WVSseRvr+1nw+JEfIvTisCMbMNJkFXPoW3gY1RuzPpiHdZHYIDiQwbnrRvRzhmzN
         5dBmd+Eo4dpR+ZaIGfQvbv8GUFhinmgWno1VLz6F82zhB/+LaC0S/uYwVZSEz6dXyJzk
         b8jWdEd2/Kar02LwbpS2ztsNApzCWpVf7LRhiKfAAKNVWQRiZtdLMNqUslf+u6mFfD34
         4UMCIafqeMoVjyyfPOQJ95gEkCIidHTp0OxqsYYuOVSQ5UTjnDt/alsKZJcfvE8dtwKJ
         f3Aw02S2lYGWpu7cAo0a6JLgSvv4NqluttvmKIXKKesTuFUXbYalQYP/738zM9YjuYjv
         fG2A==
X-Gm-Message-State: AOJu0Yz1hMbAaQ3bKJsu5G4m61GnN5SzkJU32fsbGB/SRfasS+xjeMXF
	ssGrrvKHIOWVA0oCC9cfSuV8qWxwLRtnzTrv5Mk=
X-Google-Smtp-Source: AGHT+IGcJnI5SfK2KB1D2sEpF8rVe+yd6/QBYurx2BX8LOwGgrWdN6euUKLbVuYUX81NBDSOEHjWThcpkauByr/105I=
X-Received: by 2002:a17:906:1b:b0:9ae:6355:5ef4 with SMTP id
 27-20020a170906001b00b009ae63555ef4mr445585eja.3.1695781901154; Tue, 26 Sep
 2023 19:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
In-Reply-To: <20230920055514.1668839-1-Delphine_CC_Chiu@wiwynn.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:31:30 +0000
Message-ID: <CACPK8XftkY0ZAXoXJuhVVA_MRz-hAd=TSosVLuJW-Zf6qzPxDw@mail.gmail.com>
Subject: Re: [PATCH linux dev-6.1 v2 0/2] hwmon: ina233: add ina233 support
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
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

On Wed, 20 Sept 2023 at 05:55, Delphine CC Chiu
<Delphine_CC_Chiu@wiwynn.com> wrote:
>
> Support ina233 driver with binding documents for Meta Yosemite V4 using

We've moved to the 6.5 tree now. I would prefer we stopped development
on the 6.1 tree.

You have some upstream review comments on these. If you could address
those, then I'll backport your new version to the 6.5 tree.

Does that sound reasonable?

>
> Changelog:
>  v2 - Revise Makefile typo
>  v1 - Add ina233 driver and binding document
>
> Delphine CC Chiu (2):
>   dt-bindings: hwmon: add INA233 binding documents
>   hwmon: Add support for ina233
>
>  .../devicetree/bindings/hwmon/ina233.txt      | 27 ++++++
>  MAINTAINERS                                   |  6 ++
>  drivers/hwmon/pmbus/Kconfig                   |  9 ++
>  drivers/hwmon/pmbus/Makefile                  |  1 +
>  drivers/hwmon/pmbus/ina233.c                  | 89 +++++++++++++++++++
>  5 files changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ina233.txt
>  create mode 100644 drivers/hwmon/pmbus/ina233.c
>
> --
> 2.25.1
>
