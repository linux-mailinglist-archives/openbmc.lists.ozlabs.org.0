Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0A23C6E37
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 12:06:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPGWS71Gsz3001
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 20:06:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=qcgv65a0;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=qcgv65a0; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPGW84yKDz2yss
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 20:06:28 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 818A149DF5;
 Tue, 13 Jul 2021 10:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1626170784; x=1627985185; bh=ygupXc4lMRIGiPL6uvH/IC3wh
 N2q8kFut/9Bk5A6nZc=; b=qcgv65a0DzSzNjeHNwdR6kwb1EOlGhV00P+jL8j9O
 a1ZedZcK94BSNPscDmhvywjrxC4qgdZO1jK7ru43l53VyB1Op8CSdqBCTV+Gz8ua
 5aEKkTs43ME5UktyMI26Jjxb8IcX9gLbEkH/K8El1EAY2nqDEgvY5YRkBBclFjKo
 ps=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeLZvwBkyIei; Tue, 13 Jul 2021 13:06:24 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E6B40412FB;
 Tue, 13 Jul 2021 13:06:22 +0300 (MSK)
Received: from [10.199.0.247] (10.199.0.247) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 13
 Jul 2021 13:06:22 +0300
Message-ID: <2e961640f0d14fec87854a6c11c5f86b2380516d.camel@yadro.com>
Subject: Re: [PATCH v2 2/3] net/ncsi: add NCSI Intel OEM command to keep PHY up
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Joel Stanley <joel@jms.id.au>, Eddie James <eajames@linux.ibm.com>
Date: Tue, 13 Jul 2021 13:16:09 +0300
In-Reply-To: <CACPK8Xff9c-_9A_tfZ4UBjucUgRmy8iOOdzcV5dg8VUCOB29AQ@mail.gmail.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-3-i.mikhaylov@yadro.com>
 <CACPK8Xff9c-_9A_tfZ4UBjucUgRmy8iOOdzcV5dg8VUCOB29AQ@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.247]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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
Cc: Networking <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Samuel Mendoza-Jonas <sam@mendozajonas.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2021-07-12 at 10:01 +0000, Joel Stanley wrote:
> On Thu, 8 Jul 2021 at 12:27, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > 
> > This allows to keep PHY link up and prevents any channel resets during
> > the host load.
> > 
> > It is KEEP_PHY_LINK_UP option(Veto bit) in i210 datasheet which
> > block PHY reset and power state changes.
> 
> How about using runtime configuration over using kconfig for this, so
> the same kernel config can be used on different machines. Something
> device tree based?

As I see there is already the way with Kconfig option, with previous
broadcom/mellanox get mac address and set affinity for mellanox commands.
I'm not sure about dts based solution. As I see there is two ways:
1. make everything related OEM into dts based options
2. or this way, with Kconfig

> 
> Another option is to use the netlink handler to send the OEM command
> from userspace. Eddie has worked on this for an IBM machine, and I've
> asked him to post those changes. I would prefer the kernel option
> though.
> 

I like the idea, it may help with debugging.

Thanks.
> 

