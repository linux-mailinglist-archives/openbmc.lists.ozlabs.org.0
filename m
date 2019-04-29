Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E1CE7F1
	for <lists+openbmc@lfdr.de>; Mon, 29 Apr 2019 18:41:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t9QZ1XhfzDqQl
	for <lists+openbmc@lfdr.de>; Tue, 30 Apr 2019 02:41:10 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WKvhOJV0"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t9Pc3TqnzDqPy
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 02:40:19 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id n2so5392560pgg.13
 for <openbmc@lists.ozlabs.org>; Mon, 29 Apr 2019 09:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/pCLjtBJxxkhH4ZWDBLUE5wcjD8HsLkfgQ0ydZmgv6w=;
 b=WKvhOJV0Jvz+O9Bzzwcb/AQmAVqB92BKO5+hLzgka0Fu+ctb4gM4HwLwE84EDhpZPf
 BEq5+O/XSolc3ANPGm+GAXtbVpgbNqWVcQTrK4v4vfIy+aa9jxaIsuzJTqooOE26ZckG
 TWh0belYjwe2NGaGIxuX7aFuAdxQ5lCMfoHPim1REd2KpOIXKeoNJhMGmCDcDwXSLchF
 9/ve/ySDeWSEIuGtrLKO5SnCKSe0PvSfbTy3ZZWjBKZ0otxDogMSwBwwV1dgxKBkTlGF
 sUQfaQcgZ/QM8hQJgByaLR/pGzU+76gT8G7HkCxbeGnfhhZQHV7wFb7qam5UXmVcTv/q
 paoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/pCLjtBJxxkhH4ZWDBLUE5wcjD8HsLkfgQ0ydZmgv6w=;
 b=amveIJGNAgEh5uT62ssvDGf+jVsLaeO4X1UGoh2BnEVrYn66qBl5djIfHVacQ0yn2D
 Yvu2vNAZEp4YQAugqKNmG7/wIj8520eyXqIRgqwUhacCzKzpym4kc6Sz8PWO+Mmx211E
 fjMq9SQ0o/Y5R0J4sWvAvhfDoN7GGD9KaDSbOazmhy5iswXtoXIwGW93FtM+XHvIcIG1
 +EDlioOkR4aJfGMayVn0MecPoY7tt5Di9L/OmXm9itk+BaPXjsKaIb6pgRM/vKjIfNsa
 iD0YRAzi9mfXpDy8BYp4PqXgNT1ecvLBxFlBKmChKBEa1lisoQG0A3USAFfLQbNCw1uO
 Qm8A==
X-Gm-Message-State: APjAAAVKV1CpQfKm25qZFtpffNIa9AMln1m4ryIRS4IkquCittzp+gSn
 TiBEybYcpNrww2M7SWp/KQ4=
X-Google-Smtp-Source: APXvYqwCAVADJPjvoWnelLXP42g6sq8yoksUoOq0ZOGl9v203o/PClZ4Q7Z4DzZVkIc2EMvR/aAUWA==
X-Received: by 2002:a63:f503:: with SMTP id w3mr56447709pgh.60.1556556016073; 
 Mon, 29 Apr 2019 09:40:16 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 14sm12367489pfx.13.2019.04.29.09.40.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 09:40:15 -0700 (PDT)
Date: Mon, 29 Apr 2019 09:40:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular
Message-ID: <20190429164014.GA14357@roeck-us.net>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: linux-watchdog@vger.kernel.org, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, openbmc@lists.ozlabs.org,
 Tali Perry <tali.perry1@gmail.com>, Benjamin Fair <benjaminfair@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Tomer Maimon <tmaimon77@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Apr 23, 2019 at 11:48:33AM -0400, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
> 
> config NPCM7XX_WATCHDOG
>        bool "Nuvoton NPCM750 watchdog"
> 
> ...meaning that it currently is not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Avi Fishman <avifishman70@gmail.com>
> Cc: Tomer Maimon <tmaimon77@gmail.com>
> Cc: Tali Perry <tali.perry1@gmail.com>
> Cc: Patrick Venture <venture@google.com>
> Cc: Nancy Yuen <yuenn@google.com>
> Cc: Benjamin Fair <benjaminfair@google.com>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: openbmc@lists.ozlabs.org
> Cc: linux-watchdog@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

I'll send a different patch to make the driver tristate,
to follow the example given by other drivers for the same chipset.

Guenter
