Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B340C91AEB1
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 20:04:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgCii6OY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W96021Tn3z2xFn
	for <lists+openbmc@lfdr.de>; Fri, 28 Jun 2024 04:04:18 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WgCii6OY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=tmaimon77@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W95zV4NRrz3cXK
	for <openbmc@lists.ozlabs.org>; Fri, 28 Jun 2024 04:03:49 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-6480542003dso23023357b3.0
        for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 11:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719511427; x=1720116227; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pSmVyLQ1CGhsZWFaj0ZfsSXwYFtjjuHcrDN6uBpOH3k=;
        b=WgCii6OYw7j2DG6A3JK08pRubRcBQADZFXvWxlKo4iUB2e8WQH4e0cPfVPU8Qayk06
         r1YVp1e1H9BjWK40ea1zBQB4qjbKyqwfeYMxLcRqyXMk3bcQk2Z3dOfDOckKUVpLuhpH
         5kLo30nYoLBKRxTkLJTJvRLOaFhcQkWogpJQv5mAgpQi5TcdST43wrIPWAkdsv2DuEt/
         ga97k0YYENpqEr14Sn3l1+T2OLwd6pC5EgqZUb249F32gKKzvPsDUbev4vYbGJOerZgF
         69TI9C+SPPEm3jY4dVQRJb0t/aK0StfcRDw5Gch4XmSGkUwbzm/leZ27qw1giabfSTLI
         //Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719511427; x=1720116227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pSmVyLQ1CGhsZWFaj0ZfsSXwYFtjjuHcrDN6uBpOH3k=;
        b=NzXdp1VcWyVJHD6wyF3u1APht3hJJYN6Y0i6Bhvkg8LO8PxuyJfQqMukyRRV1m3Isa
         WDCXYDIEq58HaMwg9JNiaIKrhyuvhozXOHX6CDWZoJwbiDltTJ0Vekip6wPUZTobX0lc
         C9uEAGRT9bgSakIcMubiKt8ISrFf0QcmBqVE570oMftMH12tZ20FIuBcmaPhJSF/z401
         oYkBItPmwgXr6EKM7ftYE0VW/WGMcqgHtF/LsZCT6dJrOPQ/xJf1I9Ji5LGrFPt/eHkg
         lMdgVqjNR5rLBv0hxP3VATWacwS4QAiHcDgnTJIpoyS0t0WkJqNqGaqsHM72WR45HAWc
         j0rQ==
X-Gm-Message-State: AOJu0YxuK7sgn+8nDF4HhWbM7PwlNZQNy1ZulcDm5sodaAiC5IvR8AfR
	LjDTygqgVZe+FihaJm08oH5/+bxusp1EEorVIzb7QkLB4MQBXivqNMRKTcnyMe3UucWAuNrtEyb
	6Jgp78g8cfdZwmPY1DgaQjY/5kp3NPw==
X-Google-Smtp-Source: AGHT+IHLkm1jW+nJb1PQmwa0mnQ3rBY+K79kL5QQc9k4++U6hd8R1qxqrSI0xrpb7ZKnn+BNVuoR6ZhQWnv/kqTiEmE=
X-Received: by 2002:a81:92ca:0:b0:60f:ad5f:f889 with SMTP id
 00721157ae682-643ac91623fmr130984177b3.48.1719511426736; Thu, 27 Jun 2024
 11:03:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240626134230.3999615-1-tmaimon77@gmail.com> <a62f815ac481e4eb9e37fa82a4560b6d235bc161.camel@codeconstruct.com.au>
In-Reply-To: <a62f815ac481e4eb9e37fa82a4560b6d235bc161.camel@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Thu, 27 Jun 2024 21:03:34 +0300
Message-ID: <CAP6Zq1im3Ey2wkiWYUeLivud2wcd4PPA0iVUPxZ615B=2r=aEg@mail.gmail.com>
Subject: Re: [RESEND PATCH linux dev-6.6 v1] clk: npcm8xx: add clock controller
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

Thanks for your reply.

I will send the NPCM8XX clock driver according to V25.

Thanks,

Tomer

On Thu, 27 Jun 2024 at 05:11, Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Tomer,
>
> On Wed, 2024-06-26 at 16:42 +0300, Tomer Maimon wrote:
> > Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
> > generates and supplies clocks to all modules within the BMC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> How does this relate to the series that you've been iterating on
> upstream? Is this v25 of the patches?
>
> It help me if you clarified this in the commit message (ideally with a
> link to the upstream series in question if it's a direct backport).
>
> If it is v25 then there seem to be some concerns from the CI bots:
>
> - https://lore.kernel.org/lkml/202406191439.3NcnExKM-lkp@intel.com/
> - https://lore.kernel.org/lkml/202406201328.SGrN27to-lkp@intel.com/
>
> It looks like you also need to fix the dts to address the new
> constraints you've added to the binding (and also address the build
> failure).
>
> Andrew
