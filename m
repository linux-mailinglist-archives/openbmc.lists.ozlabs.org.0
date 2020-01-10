Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654413656F
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 03:37:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47v6Zn52KCzDqZG
	for <lists+openbmc@lfdr.de>; Fri, 10 Jan 2020 13:37:21 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=davemloft.net
 (client-ip=2620:137:e000::1:9; helo=shards.monkeyblade.net;
 envelope-from=davem@davemloft.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=davemloft.net
Received: from shards.monkeyblade.net (shards.monkeyblade.net
 [IPv6:2620:137:e000::1:9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47v6Z25vpPzDqZG
 for <openbmc@lists.ozlabs.org>; Fri, 10 Jan 2020 13:36:42 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:1c3::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 4604F15736591;
 Thu,  9 Jan 2020 18:36:38 -0800 (PST)
Date: Thu, 09 Jan 2020 18:36:37 -0800 (PST)
Message-Id: <20200109.183637.755651104106589448.davem@davemloft.net>
To: vijaykhemka@fb.com
Subject: Re: [net-next PATCH] net/ncsi: Support for multi host mellanox card
From: David Miller <davem@davemloft.net>
In-Reply-To: <20200108234341.2590674-1-vijaykhemka@fb.com>
References: <20200108234341.2590674-1-vijaykhemka@fb.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Thu, 09 Jan 2020 18:36:38 -0800 (PST)
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
 linux-kernel@vger.kernel.org, sam@mendozajonas.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

From: Vijay Khemka <vijaykhemka@fb.com>
Date: Wed, 8 Jan 2020 15:43:40 -0800

> Multi host Mellanox cards require MAC affinity to be set
> before receiving any config commands. All config commands
> should also have unicast address for source address in
> command header.
> 
> Adding GMA and SMAF(Set Mac Affinity) for Mellanox card
> and call these in channel probe state machine if it is
> defined in device tree.
> 
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

Applied, thank you.
