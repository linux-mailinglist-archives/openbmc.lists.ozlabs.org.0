Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C45AD3BA4D7
	for <lists+openbmc@lfdr.de>; Fri,  2 Jul 2021 22:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGnPJ4XPhz307L
	for <lists+openbmc@lfdr.de>; Sat,  3 Jul 2021 06:53:56 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=mail.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
X-Greylist: delayed 383 seconds by postgrey-1.36 at boromir;
 Sat, 03 Jul 2021 06:53:42 AEST
Received: from mail.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGnP25zYyz301p
 for <openbmc@lists.ozlabs.org>; Sat,  3 Jul 2021 06:53:42 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
 by mail.monkeyblade.net (Postfix) with ESMTPSA id E78364D252307;
 Fri,  2 Jul 2021 13:47:02 -0700 (PDT)
Date: Fri, 02 Jul 2021 13:47:02 -0700 (PDT)
Message-Id: <20210702.134702.1259586523365258193.davem@davemloft.net>
To: i.mikhaylov@yadro.com
Subject: Re: [PATCH 0/2] Add NCSI Intel OEM command to keep PHY link up on
From: David Miller <davem@davemloft.net>
In-Reply-To: <20210702112519.76385-1-i.mikhaylov@yadro.com>
References: <20210702112519.76385-1-i.mikhaylov@yadro.com>
X-Mailer: Mew version 6.8 on Emacs 27.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.2
 (mail.monkeyblade.net [0.0.0.0]); Fri, 02 Jul 2021 13:47:03 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, sam@mendozajonas.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
Date: Fri, 2 Jul 2021 14:25:17 +0300

> Add NCSI Intel OEM command to keep PHY link up and prevents any channel
> resets during the host load. Also includes dummy response handler for Intel
> manufacturer id.

Please fix the warnings found by:

https://patchwork.hopto.org/static/nipa/510079/12355969/build_32bit/stderr

Thank you.
