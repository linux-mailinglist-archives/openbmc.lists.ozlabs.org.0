Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDF31855C
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 08:20:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4503BH3DH9zDqJM
	for <lists+openbmc@lfdr.de>; Thu,  9 May 2019 16:20:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=windriver.com
 (client-ip=192.103.53.11; helo=mail5.wrs.com;
 envelope-from=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=windriver.com
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tCh94ShHzDqCY
 for <openbmc@lists.ozlabs.org>; Tue, 30 Apr 2019 04:23:03 +1000 (AEST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
 [147.11.189.41])
 by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x3TILLIE026205
 (version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
 Mon, 29 Apr 2019 11:21:37 -0700
Received: from yow-pgortmak-d1.corp.ad.wrs.com (128.224.56.57) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.439.0; Mon, 29 Apr 2019 11:21:20 -0700
Received: by yow-pgortmak-d1.corp.ad.wrs.com (Postfix, from userid 1000)	id
 4C7C52E0DEE; Mon, 29 Apr 2019 14:21:20 -0400 (EDT)
Date: Mon, 29 Apr 2019 14:21:20 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular
Message-ID: <20190429182120.GZ23044@windriver.com>
References: <1556034515-28792-1-git-send-email-paul.gortmaker@windriver.com>
 <1556034515-28792-4-git-send-email-paul.gortmaker@windriver.com>
 <20190429164014.GA14357@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190429164014.GA14357@roeck-us.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Thu, 09 May 2019 16:11:47 +1000
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

[Re: [PATCH 3/5] watchdog: npcm: make it explicitly non-modular] On 29/04/2019 (Mon 09:40) Guenter Roeck wrote:

> On Tue, Apr 23, 2019 at 11:48:33AM -0400, Paul Gortmaker wrote:
> > The Kconfig currently controlling compilation of this code is:
> > 
> > config NPCM7XX_WATCHDOG
> >        bool "Nuvoton NPCM750 watchdog"
> > 
> > ...meaning that it currently is not being built as a module by anyone.
> > 

[...]

> I'll send a different patch to make the driver tristate,
> to follow the example given by other drivers for the same chipset.

Great, thanks.  I'll drop this patch from my internal queue once I see
it conflict with your tristate conversion in linux-next.

Paul.
--

> 
> Guenter
