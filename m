Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2635C367527
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 00:30:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQZyK0lKzz303H
	for <lists+openbmc@lfdr.de>; Thu, 22 Apr 2021 08:30:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Z1MxZm/d;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d33;
 helo=mail-io1-xd33.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Z1MxZm/d; dkim-atps=neutral
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQZy52XJHz2xZ9
 for <openbmc@lists.ozlabs.org>; Thu, 22 Apr 2021 08:30:34 +1000 (AEST)
Received: by mail-io1-xd33.google.com with SMTP id v123so36743439ioe.10
 for <openbmc@lists.ozlabs.org>; Wed, 21 Apr 2021 15:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:date:subject:message-id
 :to; bh=5bk7fZbf7o1MQmJdq33Z1xBQh0unAD8tNLavOgIjIn8=;
 b=Z1MxZm/dwO/6seRE/clp6qhd5H9JKy2uGH/v+ffq3ewjs6T5JmXaqXxpKVfpKWotMA
 hFCEjAQcgdGheWTvC6Fe/6cSvwH2eIYPf+rLYUGCyKHa5B7dPCqYEGHwZ1mS4X0BqC+F
 aSRxLJL1aSFGaY7m0payRddiOjAVovPqL+dJlvYGxnUDEG83fkGwwt+djJ3HMrvunr7R
 H922E87gwQ/rTbS87e8bweBGyVTlVmygcTaUbCL63r3bYpLMpISQqbnHEwY5d/dasTZQ
 N3Bf4k5oFRuKXqsh2Zr49XUcrz+mGoogQlpA28mbgZ6sjaqKXyNrwWH7TySuqujB0wqC
 scDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version:date
 :subject:message-id:to;
 bh=5bk7fZbf7o1MQmJdq33Z1xBQh0unAD8tNLavOgIjIn8=;
 b=WTK7t8KkBXf5WqpTdGlUxMrDofFtrFCO0eeJj+OxffmS8FupcIV9qUvEdpqfU37c/y
 a9qXxuloUhDlJgeBy7ZPT4+aV+an1Zl4tO+46ccpuul9+vOhjOiUNjePKaDnbzGd8NPx
 8WYkF++yS+0x0GQ7+/ENidK9UOiKu6BP0xgQIqz6zz70eFEYynf654oqQ7ULgSe4LTCF
 O8Q2xJgO2FOS1OPcziIHjYZCFWwuzwMtSPWUJPrwkuA6U++mTdW/AfDudqwp7g4zroxc
 7Vokt+Ii2mx2lvaRDPHNPa7Ux8ytrLXb6oP90YQiNjcTsAI5v0CkMUS5rynV81bs3JzP
 m4yA==
X-Gm-Message-State: AOAM533NStYfjrZBaawAWvkm4QsUfPLFZjGWa+lc2u0jSapxpFxQKe2h
 r7JTh4vuAXoYYs7ayGLRgoeeezMxKAI=
X-Google-Smtp-Source: ABdhPJzEOCi1aU/BHHfuPC2K9vaMrPyOuL4fcm9dHdMWH0/ONZqKLzn0s/x0iH7AXJGoKPVLEoDyGw==
X-Received: by 2002:a6b:d60e:: with SMTP id w14mr133187ioa.187.1619044230563; 
 Wed, 21 Apr 2021 15:30:30 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:2863:fa8:22c3:1b1?
 ([2601:281:c001:2359:2863:fa8:22c3:1b1])
 by smtp.gmail.com with ESMTPSA id u9sm377224ior.8.2021.04.21.15.30.29
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 15:30:30 -0700 (PDT)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
From: Mike <proclivis@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 21 Apr 2021 16:30:29 -0600
Subject: libtirpc link error
Message-Id: <61F426A9-21C7-4D09-BB20-AC4046F436DD@gmail.com>
To: openbmc@lists.ozlabs.org
X-Mailer: iPhone Mail (18D70)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi,

Has anyone seen link errors for libtirpc-1.2.5-r0 from openbmc tag 2.9?

I tried building with tag 2.9 using my added layers and conf from a successf=
ul tag 2.8, but get errors in libtirpc_la-binddynport.o for multiple definit=
ions of __svc_xports.

Mike

Sent from my iPhone=
