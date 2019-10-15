Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D27D7D5F
	for <lists+openbmc@lfdr.de>; Tue, 15 Oct 2019 19:21:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46t2Jj4SvnzDr4N
	for <lists+openbmc@lfdr.de>; Wed, 16 Oct 2019 04:21:09 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46t2Hw2KCrzDq5y
 for <openbmc@lists.ozlabs.org>; Wed, 16 Oct 2019 04:20:27 +1100 (AEDT)
Received: from localhost (unknown
 [IPv6:2603:3023:50c:85e1:5314:1b70:2a53:887e])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 2146115043D43;
 Tue, 15 Oct 2019 10:20:14 -0700 (PDT)
Date: Tue, 15 Oct 2019 13:20:13 -0400 (EDT)
Message-Id: <20191015.132013.246221433893437093.davem@davemloft.net>
To: taoren@fb.com
Subject: Re: [PATCH net-next v8 2/3] net: phy: add support for clause 37
 auto-negotiation
From: David Miller <davem@davemloft.net>
In-Reply-To: <61e33434-c315-b80a-68bc-f0fe8f5029e7@fb.com>
References: <20190909204906.2191290-1-taoren@fb.com>
 <20190914141752.GC27922@lunn.ch>
 <61e33434-c315-b80a-68bc-f0fe8f5029e7@fb.com>
X-Mailer: Mew version 6.8 on Emacs 26.2
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 15 Oct 2019 10:20:14 -0700 (PDT)
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
 linux-kernel@vger.kernel.org, justinpopo6@gmail.com, olteanv@gmail.com,
 hkallweit1@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Tao Ren <taoren@fb.com>
Date: Tue, 15 Oct 2019 17:16:26 +0000

> Can you please apply the patch series to net-next tree when you have
> bandwidth? All the 3 patches are reviewed.

If it is not active in patchwork you need to repost.
