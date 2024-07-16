Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828979327DB
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 15:57:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eXb+0HPK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNgc23HSRz3dSl
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2024 23:57:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eXb+0HPK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNgbV68STz3cZq
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 23:56:37 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-65f852c82fcso29753007b3.1
        for <openbmc@lists.ozlabs.org>; Tue, 16 Jul 2024 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721138193; x=1721742993; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9vz8Inc5yg2/EbCO7iXUQd2CabpHrNyHz+Y0+3P9rQc=;
        b=eXb+0HPKa4I5rXUMerXAZLRZ3SZuj4MH3ZXWHTtFcCLOgf//vCXySKDDynDQzPOnwY
         CU0yqx01fHPHtUrDh5vAfcy50wryWk7MQPcyDODHwQupV4cIq7bl1rljzlO1wwWdU4+f
         m205d7pavhNaQXV+yvwhOBTPhqYD6Qf+G4xXa8R0dfeJpbA/g6bo1EowWJd2cqEre7v6
         EPLuXrT+/4X4Qwqz4iEbVdKClB3MO45aUC8o/bkJEXBVBYJltshZ9fKkVOj99iJf5PIl
         OMb1sPjRW5JK4uMqy9cCp9jhISIG8bByDBwkbFpvDSgfNKiOJ4U2AHvB0TbtCGCPk/PO
         uNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721138193; x=1721742993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vz8Inc5yg2/EbCO7iXUQd2CabpHrNyHz+Y0+3P9rQc=;
        b=j73ooWypzZoHZ05RSawcSJJjNNMNEPwu+A/EUQ3m0PgPGbZV7CcQQR5RsIiC15j9Hk
         GrIeZ8RPPTRTmsNL21FAc1Hkn78Y8hsetEsp3I+K9E29dRXr1gIjnq3jAq5AMhogRBgZ
         g+E68mjcRUnvs8DipkaWZHELs4lD0EHADGoQTUW6HhScZDb1X3cn1WQ4Rt0iwHPNxVkc
         PTqrfPQRPWd4HVXSjfbXAkLXT+EJ+d4nl4ZvyQyZoshU2olczkZecJUloRkh0WfrOD+k
         ikHg3iCSw16plPOEjfoiD5q8PVQmKEF/Raz8gf0FYPfZvRcPHdT6U6SjXYyAeJC0+miL
         qoog==
X-Gm-Message-State: AOJu0YzUMgUNMpKiCdxXrw559Q3YQCVVyFIumnmI8dbsOZbBenItDqce
	3aztNYZVTlXjQHDNgIAmvaNXwMrClzuq9L33z4smfQJ4m1OKdx9vw7kYfjLisYQECXCTwgvoucG
	lI6tVcq3kINqJSLm/1ZxhbE8c3uxLo6iE
X-Google-Smtp-Source: AGHT+IFuKvQx7cRohuSonvXh5LMlFgkR8ks1K2/bYYRTigZqMlcnTPqky3Igvvz4ls5D2Bi4ln/Hz6mM03O5G5vRQF4=
X-Received: by 2002:a0d:c6c5:0:b0:64a:7040:2d8a with SMTP id
 00721157ae682-66381abd92dmr21242077b3.23.1721138192970; Tue, 16 Jul 2024
 06:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240710124157.2106609-1-tmaimon77@gmail.com> <0cd404956b827b5ac5407b8de7866a221ea0700c.camel@codeconstruct.com.au>
In-Reply-To: <0cd404956b827b5ac5407b8de7866a221ea0700c.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Tue, 16 Jul 2024 16:56:21 +0300
Message-ID: <CAP6Zq1hi5Rw+hVn48Taqs=3jQn_9+PC+ZNuvorcm6s_uJURP7w@mail.gmail.com>
Subject: Re: [linux dev-6.6 v1] usb: chipidea: udc: enforce write to the memory.
To: Andrew Jeffery <andrew@codeconstruct.com.au>
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
Cc: openbmc@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Andrew,

On Tue, 16 Jul 2024 at 06:34, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-07-10 at 15:41 +0300, Tomer Maimon wrote:
> > In the prime endpoint function, we need to read from qh.ptr->td.token
> > to ensure that the previous write to it has indeed been committed
> > to memory.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
> > ---
> >  drivers/usb/chipidea/udc.c | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
>
> What's the state of this patch with respect to upstream? Is this
> something specific to the openbmc/linux dev-6.6 tree, or is there an
> upstream equivalent? If the latter, can you please link to the relevant
> patch?
This patch didn't upstream yet to OpenBMC vanilla.
Its not specific to openbmc/linux dev-6.6 tree, but it is something
that related to NPCM UDC module and I am not sure that Chipidea will
approve to upstream it to the main chipidea driver
I am planning to start the upstream in the next Linux version 6.11.
>
> Andrew

Thanks,

Tomer
