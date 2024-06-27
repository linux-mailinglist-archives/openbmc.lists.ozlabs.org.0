Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 197BE919D2A
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 04:11:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P6h/ARwc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8hrm3rWjz3ft5
	for <lists+openbmc@lfdr.de>; Thu, 27 Jun 2024 12:11:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=P6h/ARwc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8hrC61G3z3cF6
	for <openbmc@lists.ozlabs.org>; Thu, 27 Jun 2024 12:11:07 +1000 (AEST)
Received: from [192.168.68.112] (ppp118-210-79-194.adl-adc-lon-bras32.tpg.internode.on.net [118.210.79.194])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DB6C9200DB;
	Thu, 27 Jun 2024 10:11:05 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1719454267;
	bh=uGr7za6WHD+t8HIfSKYWyAX4OzaEpPgrIg6wXWDtiTI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=P6h/ARwc8T56bspCogP8oFK6hq14gD3JV29pRxXbp+corD6Tmk4x4MmDSdg1Ayq3k
	 zcqFBAx7d8+OoZeW9T1kFd90+/w8Dmrbph5CoU7tsIEBaVqukjUYTO7EL23sQxyS86
	 HIHAl3VycUcD4sNsJr9niULazactV+NayDeWrz/AFAJbSAnAK0IIyoS+DPajnljL/s
	 YqBP1oTsJR+YlYYPS6ZeL8O+BLHmHTxf8USiYQIrAnWBPpswm5WU4RZz4NjEtOHaRS
	 syNbaK4GAk6qV0JnP3EZrJQ7TUKcnrNWWygkhDHZFfp79khDHxmAyz5VbPiyAOpqpz
	 /RghkX9SqpzzQ==
Message-ID: <a62f815ac481e4eb9e37fa82a4560b6d235bc161.camel@codeconstruct.com.au>
Subject: Re: [RESEND PATCH linux dev-6.6 v1] clk: npcm8xx: add clock
 controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Tomer Maimon <tmaimon77@gmail.com>, openbmc@lists.ozlabs.org
Date: Thu, 27 Jun 2024 11:41:05 +0930
In-Reply-To: <20240626134230.3999615-1-tmaimon77@gmail.com>
References: <20240626134230.3999615-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Tomer,

On Wed, 2024-06-26 at 16:42 +0300, Tomer Maimon wrote:
> Nuvoton Arbel BMC NPCM8XX contains an integrated clock controller which
> generates and supplies clocks to all modules within the BMC.
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

How does this relate to the series that you've been iterating on
upstream? Is this v25 of the patches?

It help me if you clarified this in the commit message (ideally with a
link to the upstream series in question if it's a direct backport).

If it is v25 then there seem to be some concerns from the CI bots:

- https://lore.kernel.org/lkml/202406191439.3NcnExKM-lkp@intel.com/
- https://lore.kernel.org/lkml/202406201328.SGrN27to-lkp@intel.com/

It looks like you also need to fix the dts to address the new
constraints you've added to the binding (and also address the build
failure).

Andrew
