Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F46A47FA
	for <lists+openbmc@lfdr.de>; Sun,  1 Sep 2019 08:55:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LkVp0ww8zDqfy
	for <lists+openbmc@lfdr.de>; Sun,  1 Sep 2019 16:55:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LkV25sZPzDqRm
 for <openbmc@lists.ozlabs.org>; Sun,  1 Sep 2019 16:54:32 +1000 (AEST)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 6D47214CDC651;
 Sat, 31 Aug 2019 23:54:23 -0700 (PDT)
Date: Sat, 31 Aug 2019 23:54:23 -0700 (PDT)
Message-Id: <20190831.235423.1538075953540344193.davem@davemloft.net>
To: benwei@fb.com
Subject: Re: [PATCH v2 net-next] net/ncsi: add response handlers for PLDM
 over NC-SI
From: David Miller <davem@davemloft.net>
In-Reply-To: <CH2PR15MB3686A26D4BB64D8959B519B6A3BD0@CH2PR15MB3686.namprd15.prod.outlook.com>
References: <CH2PR15MB3686A26D4BB64D8959B519B6A3BD0@CH2PR15MB3686.namprd15.prod.outlook.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Sat, 31 Aug 2019 23:54:23 -0700 (PDT)
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
Cc: netdev@vger.kernel.org, openbmc@lists.ozlabs.org, sam@mendozajonas.com,
 linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Ben Wei <benwei@fb.com>
Date: Fri, 30 Aug 2019 20:50:51 +0000

> This patch adds handlers for PLDM over NC-SI command response.
> 
> This enables NC-SI driver recognizes the packet type so the responses
> don't get dropped as unknown packet type.
> 
> PLDM over NC-SI are not handled in kernel driver for now, but can be
> passed back to user space via Netlink for further handling.
> 
> Signed-off-by: Ben Wei <benwei@fb.com>
> ---
> Changes in v2 
>   - fix function definition spacing

Applied.
