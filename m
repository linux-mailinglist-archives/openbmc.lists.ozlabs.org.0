Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BF88A184B
	for <lists+openbmc@lfdr.de>; Thu, 11 Apr 2024 17:12:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lHVb/POe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFjqk47hVz3vYs
	for <lists+openbmc@lfdr.de>; Fri, 12 Apr 2024 01:12:50 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lHVb/POe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFjp91ZKcz3dS8;
	Fri, 12 Apr 2024 01:11:27 +1000 (AEST)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5aa2bd6f651so3528933eaf.0;
        Thu, 11 Apr 2024 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712848284; x=1713453084; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5+zFEYcFGgbVYjM4vgY3BN6Q53qllrvkhMJ4PRExZuo=;
        b=lHVb/POekJVyhuNq0qLqCjCKeYGbbf1kXK0nMxBa+I+6OQ+0ONyJf76uGtL+qFYqdL
         yvjDqMDF7Hr+caU9g9AZ9BinvLkajWehQs4bULu82h2TqYqDuWSaDrI4jIMo5wXPqoWN
         y5v+DjmbrgLcVl/U54BY0w3IXeDzSfSXMNZl2iaLVnzs7QTzmJn8/jhRpK4kaaoO49Ub
         p1TI8eb+E+zZRL7aQQ7hlNtnaIZBB8Ee1axWuDLPn+JJBhcW2wM4/E/E+LXvWN2Hwnzd
         Cj9XjNY+iCME43UGWPHrdP5NL9y0lW7kel8ENa5Hrc+b1Y+iWDkdgnWh4KApvqba176z
         bDyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712848284; x=1713453084;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5+zFEYcFGgbVYjM4vgY3BN6Q53qllrvkhMJ4PRExZuo=;
        b=o6XNoWdhsPzqDoaiU2FbqRvg0O34y3stWITu93Rh1RbaH1Mx79iIFQYOK/lknwoXei
         9PV4p7hLJfHfIVmAEteCci7o4SsINur8Kd0rCbeL4Rk9n3xPhVpn/qpdVSOeDMRPXh/g
         mGSIIrsAxIAILX4IdNP29y4f93R+hSQNPyEJcMRQP6ZcWgR1Hexf7FRlcVqlKESI/KO4
         Pi0BdyPgtCPuNUz+b6iuP3j3HaoYoQj/0jNJhf/QAgQSWjdngziLyPtXwZwlMiqb/evu
         v8zTluCtZXQZxP+kZLgWbie2QYHym/fkyYkiSgfEo2gCpLrmEwV/l3A8Z92bp0nLn8Xs
         bHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVb73gG24K9XG/d5Du+mLUpgK9DlXcsjM16q5SbBNDqNTUOaR6yuNUm8DL7c7hbnJlXBminDSb9xif8iB+/Ft3WhDw6shsFbKXB5d+jRcaPLdBrr7CVZNEK7rhVmMLmIahuxfce4aTz0DdMECFRVyGKDZB04KLnPvWcPSMdfJK0N8Kr43H4g==
X-Gm-Message-State: AOJu0YzgCDKxJZxGYB69yopfGNVyCC9nxLZBe5zzdpY4afR6wAFGrCWX
	zjMN5MFsVEPA9ZWC+EF22gw1auGaikKPDltQbQuIXyp+fSHqq3M=
X-Google-Smtp-Source: AGHT+IFB6Cokk57WMCZhgqg113k9hoFMhs9i+078DRUKacemNlRQbXO4GTcI3zUnKw7d8YHw3vLDpA==
X-Received: by 2002:a05:6820:1391:b0:5aa:3b8a:b491 with SMTP id i17-20020a056820139100b005aa3b8ab491mr6964498oow.4.1712848283554;
        Thu, 11 Apr 2024 08:11:23 -0700 (PDT)
Received: from serve.minyard.net ([47.184.173.124])
        by smtp.gmail.com with ESMTPSA id ev8-20020a056820310800b005a9c8091580sm353207oob.22.2024.04.11.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 08:11:22 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:e322:3bf8:f626:ba3a])
	by serve.minyard.net (Postfix) with ESMTPSA id 22476180011;
	Thu, 11 Apr 2024 15:11:22 +0000 (UTC)
Date: Thu, 11 Apr 2024 10:11:21 -0500
From: Corey Minyard <minyard@acm.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 0/6] ipmi: Convert to platform remove callback returning
 void
Message-ID: <Zhf9mQx/KgXOzPTs@mail.minyard.net>
References: <cover.1709655755.git.u.kleine-koenig@pengutronix.de>
 <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3uhfeeahn2u23mxyumyxcyx4kmcxzczipkan7eqh4aslsmhxyz@zgsmwj2jvb2v>
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
Reply-To: minyard@acm.org
Cc: Benjamin Fair <benjaminfair@google.com>, linux-aspeed@lists.ozlabs.org, Avi Fishman <avifishman70@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, openbmc@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tali Perry <tali.perry1@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Joel Stanley <joel@jms.id.au>, kernel@pengutronix.de, Patrick Venture <venture@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, openipmi-developer@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Apr 11, 2024 at 09:15:03AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Mar 05, 2024 at 05:26:57PM +0100, Uwe Kleine-König wrote:
> > this series converts all drivers below drivers/char/ipmi to struct
> > platform_driver::remove_new(). See commit 5c5a7680e67b ("platform: Provide a
> > remove callback that returns no value") for an extended explanation and the
> > eventual goal.
> > 
> > All conversations are trivial, because their .remove() callbacks
> > returned zero unconditionally.
> > 
> > There are no interdependencies between these patches, so they could be
> > picked up individually. But I'd hope that they get picked up all
> > together by Corey.

Yeah, I was kind of waiting for more reviews, but this is pretty
straightforward.  I've pulled this into my tree.

-corey

> 
> Apart from a (positive) review reply I didn't get any feedback to this
> series. My quest to change the prototype of struct
> platform_driver::remove depends on these patches, so it would be great
> if they made it in during the next merge window.
> 
> Best regards
> Uwe
> 
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ |


