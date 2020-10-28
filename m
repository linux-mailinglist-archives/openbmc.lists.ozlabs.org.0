Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4061129CFE1
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 13:20:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLnhh25SlzDqTW
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 23:20:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=BY3DHkmq; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLngf54wlzDqFM
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 23:19:26 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5C39F4127F;
 Wed, 28 Oct 2020 12:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1603887560; x=1605701961; bh=QaIukaOm1O2BfyvMfr5ntcCJE
 QIdpZYe1CWCdr1kJJ4=; b=BY3DHkmq+w/+n5FlU/G9S+dRTWj+2hIJetYGFxKAI
 egWa2uMEfx4e8aQBqNHBDEHvncqgjkP74NciUYmV57/Lsc0m/iVHR5uGVwcANIQf
 y2WZC9ALzS3aPVYMMnhHtJCmPA/Q+H8mgu4hacc2xrrTsoXDHCNDKidxjLaIJ4jX
 bc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8olSMjuAHbLX; Wed, 28 Oct 2020 15:19:20 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 66AF841370;
 Wed, 28 Oct 2020 15:19:14 +0300 (MSK)
Received: from localhost.localdomain (10.199.0.230) by
 T-EXCH-04.corp.yadro.com (172.17.100.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Wed, 28 Oct 2020 15:19:13 +0300
Message-ID: <6248c6b3557d679a64c01e6d23fd4cb18a3d1da4.camel@yadro.com>
Subject: Re: [PATCH v2 2/2] net: ftgmac100: add handling of mdio/phy nodes
 for ast2400/2500
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Andrew Lunn <andrew@lunn.ch>
Date: Wed, 28 Oct 2020 15:23:38 +0300
In-Reply-To: <20201027182354.GE904240@lunn.ch>
References: <20201027144924.22183-1-i.mikhaylov@yadro.com>
 <20201027144924.22183-3-i.mikhaylov@yadro.com>
 <20201027182354.GE904240@lunn.ch>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.230]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
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
Cc: Po-Yu Chuang <ratbert@faraday-tech.com>, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2020-10-27 at 19:23 +0100, Andrew Lunn wrote:
> On Tue, Oct 27, 2020 at 05:49:24PM +0300, Ivan Mikhaylov wrote:
> > phy-handle can't be handled well for ast2400/2500 which has an embedded
> > MDIO controller. Add ftgmac100_mdio_setup for ast2400/2500 and initialize
> > PHYs from mdio child node with of_mdiobus_register.
> > 
> > Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> 
> Please also update the binding documentation to indicate an MDIO node
> can be used.
> 
>     Andrew

Sure, I'll check.

Thanks.

