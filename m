Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C5E2A70
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 08:30:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zHRD6dfTzDqSq
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 17:30:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=rentao.bupt@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Col7n+vz"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zHQX4SHtzDqJc
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 17:29:24 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id c16so7603754plz.9
 for <openbmc@lists.ozlabs.org>; Wed, 23 Oct 2019 23:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TnQ6iUBhZ6QDqwjf7E/1ik4QV2HCeGlGTNteQTzWdPE=;
 b=Col7n+vz5f4YwdbhXX/IIWvYPUDLvSpR5WS/+OYA+B9B0KPYEmzTQwzE+8YS02cIsp
 zAxUY4fxaMZWliWuGne7Q7u0CDNuNloUcByHFkJvjLJ2ZHLKBwlpnBZFLg18bWVn6Mcm
 LifRkDSw9pgY02ohsvv69ZvC669TvdSgYTfCy4iRqKlTO7Gb6AR6z9qQzpaMcpGpxbP7
 yeVhjSE79UlTsn03gABejtlu+nZd8BkMCldJ3iUF0EMFC/p5f4YB5hqueXs8o6IQzrxU
 Nl3lJOf8dBoXIuZ1jO4g6AmIAjlnu46uuOk6FTgkffa8hkZrJHZSbYSTb5QBiZCNpNSs
 cQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TnQ6iUBhZ6QDqwjf7E/1ik4QV2HCeGlGTNteQTzWdPE=;
 b=Ytk6DMy5HE72WjcEWAYtEAX3giON5u+I2z9KDNYORGzHkVzGa4iHTBgNt0Z+bJtgwI
 I2vU09ZZKaDvYTjsFkjhIbSdWHIEXrTmZQN00CqdAv9YJB9F152VItdg+KvrSitNcbKv
 VtrJKHtCpf3b2cHGYoapDLFZaMjxSHN4B+su/9LjYooy2rx8OyQM+ud6Z6XJdhX/yayi
 y8emGBBXHTBU3FdHXkll4KYnm/glWb9oKYLsePRKtSSZx+YRiwDHyF7au/bMO4d5sk01
 7VUAaFVAgUuzU59B4VL5PmAX7wsOywQy1pHHENM9x2FbDMpggbqS3jsoyEU6uEpFDoj8
 p04A==
X-Gm-Message-State: APjAAAX5/8QDxQPux9nzn5fpmPRZgdZRkR57e/uw3AA4zEBiYp1MzOOr
 Qjj8ENWUVO9ZvnzOQWqbzWc=
X-Google-Smtp-Source: APXvYqyZ3Bj2GsNfgwSkrUQpaXxBZQyDDxMEOxw9u5rcNyUF7sEPGB8cWdSZahnHBKymatS99bHpuA==
X-Received: by 2002:a17:902:8505:: with SMTP id
 bj5mr13430539plb.296.1571898560629; 
 Wed, 23 Oct 2019 23:29:20 -0700 (PDT)
Received: from taoren-ubuntuvm (c-24-4-25-55.hsd1.ca.comcast.net. [24.4.25.55])
 by smtp.gmail.com with ESMTPSA id n3sm29168463pff.102.2019.10.23.23.29.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Oct 2019 23:29:20 -0700 (PDT)
Date: Wed, 23 Oct 2019 23:29:03 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v10 0/3] net: phy: support 1000Base-X
 auto-negotiation for BCM54616S
Message-ID: <20191024062902.GA52817@taoren-ubuntuvm>
References: <20191022183108.14029-1-rentao.bupt@gmail.com>
 <20191023.204311.1181447784152558295.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191023.204311.1181447784152558295.davem@davemloft.net>
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, arun.parameswaran@broadcom.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, justinpopo6@gmail.com,
 olteanv@gmail.com, hkallweit1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 08:43:11PM -0700, David Miller wrote:
> From: rentao.bupt@gmail.com
> Date: Tue, 22 Oct 2019 11:31:05 -0700
> 
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > This patch series aims at supporting auto negotiation when BCM54616S is
> > running in 1000Base-X mode: without the patch series, BCM54616S PHY driver
> > would report incorrect link speed in 1000Base-X mode.
> > 
> > Patch #1 (of 3) modifies assignment to OR when dealing with dev_flags in
> > phy_attach_direct function, so that dev_flags updated in BCM54616S PHY's
> > probe callback won't be lost.
> > 
> > Patch #2 (of 3) adds several genphy_c37_* functions to support clause 37
> > 1000Base-X auto-negotiation, and these functions are called in BCM54616S
> > PHY driver.
> > 
> > Patch #3 (of 3) detects BCM54616S PHY's operation mode and calls according
> > genphy_c37_* functions to configure auto-negotiation and parse link
> > attributes (speed, duplex, and etc.) in 1000Base-X mode.
> 
> Series applied to net-next, thank you.

Great. Thank you David!


Cheers,

Tao
