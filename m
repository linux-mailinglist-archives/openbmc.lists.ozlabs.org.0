Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 988C43C6D82
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 11:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPFm341m9z303y
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 19:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=Ur2vjL8X;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=Ur2vjL8X; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPFlp4ryXz2ym5
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:32:22 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DBC8A45C91;
 Tue, 13 Jul 2021 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1626168738; x=1627983139; bh=gD0UuHaFhtXE1CjYlSQQdnWtb
 kTcj4oOtAaKhS8m6Bo=; b=Ur2vjL8XI1D1BEPiiveK3sXgIHaUN24tyldZ6QS+v
 sPh3LOD4JsHronEa+gn29eap4R+jG+ST2TLf8zNiNpwhbBg5TCRYukspNCLAKjO1
 hTQMmNN3TDsyOCWIGVi8V3aaWf6LeqHF2lWVUykRn7Yitl7w3uFbcFQ/CQOm/P6T
 gI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DlROguvzsDIE; Tue, 13 Jul 2021 12:32:18 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8D66149E06;
 Tue, 13 Jul 2021 12:32:18 +0300 (MSK)
Received: from [10.199.0.247] (10.199.0.247) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 13
 Jul 2021 12:32:18 +0300
Message-ID: <bf3df39a60917e0d5ac7b6ae7fbb3a083f244e00.camel@yadro.com>
Subject: Re: [PATCH v2 3/3] net/ncsi: add dummy response handler for Intel
 boards
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Date: Tue, 13 Jul 2021 12:42:05 +0300
In-Reply-To: <CACPK8XcdUtzZCPcmr+=b5kJ=563KroEtfMATquwkqd6Z11JCDA@mail.gmail.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-4-i.mikhaylov@yadro.com>
 <CACPK8XcdUtzZCPcmr+=b5kJ=563KroEtfMATquwkqd6Z11JCDA@mail.gmail.com>
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

On Mon, 2021-07-12 at 10:03 +0000, Joel Stanley wrote:
> On Thu, 8 Jul 2021 at 12:28, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > 
> > Add the dummy response handler for Intel boards to prevent incorrect
> > handling of OEM commands.
> 
> What do you mean?

When you don't have proper OEM handler for your MFR_ID, you'll get this as
example:
[   39.073873] ftgmac100 1e660000.ethernet eth1: Received unrecognized OEM
packet with MFR-ID (0x157)
[   39.082974] ftgmac100 1e660000.ethernet eth1: NCSI: Handler for packet type
0xd0 returned -2

> Is this to handle the response to the link up OEM command? If so,
> include it in the same patch.

It is not the response, it's provides same way of handling as for broadcom and
mellanox manufacturers.

> Can you check that the response is to the link up command and print a
> warning if not?

Yes, I can. As example, ncsi_oem_smaf_mlx doesn't check the response, for me
it's like unidirectional commands, same for this one.

Thanks.

