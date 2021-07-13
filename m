Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BFC3C6CCD
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 11:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPF4G4sxvz30JY
	for <lists+openbmc@lfdr.de>; Tue, 13 Jul 2021 19:01:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=MhGH47pO;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=MhGH47pO; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPF3z62N3z302K
 for <openbmc@lists.ozlabs.org>; Tue, 13 Jul 2021 19:01:19 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0FA3749DFB;
 Tue, 13 Jul 2021 09:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:user-agent:date:date:mime-version
 :content-type:content-type:organization:references:in-reply-to
 :from:from:subject:subject:message-id:received:received
 :received; s=mta-01; t=1626166873; x=1627981274; bh=nTYVAlTPiYr7
 lxItHGFf4MOyH4HtsZz+n7U+oa9+8Gc=; b=MhGH47pOFt6GEFHvIKcqK4LgZQvH
 YHMsPQ4o8333zqf2Ez2AltKDUWATLTsy6hj8Qg+PTkhxxyq82PrA9H6BV6BfheuZ
 aS0GKweV+jrwpSbyb9356THnIGIgCyODiMCjCa8e7wkhBbfMDGcy5O2Om2A0Mncf
 1cgo6kt6Ks9OkVo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aIZhp-e2neT; Tue, 13 Jul 2021 12:01:13 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id EA8F749E12;
 Tue, 13 Jul 2021 12:01:07 +0300 (MSK)
Received: from [10.199.0.245] (10.199.0.245) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 13
 Jul 2021 12:01:07 +0300
Message-ID: <796d759a685428814cfd68ae2fd69fe9ab5298dd.camel@yadro.com>
Subject: Re: [PATCH v2 1/3] net/ncsi: fix restricted cast warning of sparse
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
In-Reply-To: <CACPK8Xe2W-qTPjyuAHkTGq6Kz0sWYRz23Cqqdxu0CL2XNc=T0w@mail.gmail.com>
References: <20210708122754.555846-1-i.mikhaylov@yadro.com>
 <20210708122754.555846-2-i.mikhaylov@yadro.com>
 <CACPK8Xe2W-qTPjyuAHkTGq6Kz0sWYRz23Cqqdxu0CL2XNc=T0w@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date: Tue, 13 Jul 2021 12:08:56 +0300
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.245]
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

On Mon, 2021-07-12 at 09:09 +0000, Joel Stanley wrote:
> On Thu, 8 Jul 2021 at 12:27, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > 
> > Sparse reports:
> > net/ncsi/ncsi-rsp.c:406:24: warning: cast to restricted __be32
> > net/ncsi/ncsi-manage.c:732:33: warning: cast to restricted __be32
> > net/ncsi/ncsi-manage.c:756:25: warning: cast to restricted __be32
> > net/ncsi/ncsi-manage.c:779:25: warning: cast to restricted __be32
> 
> Strange, I don't get these warnings from sparse on my system.

https://patchwork.hopto.org/static/nipa/510079/12355969/build_32bit/stderr
All those errors from ntohl. David linked this one in first series of patches.

> 
> $ sparse --version
> 0.6.3 (Debian: 0.6.3-2)
> 
> > 
> > Signed-off-by: Ivan Mikhaylov <i.mikhaylov@yadro.com>
> > ---
> >  net/ncsi/ncsi-manage.c | 6 +++---
> >  net/ncsi/ncsi-rsp.c    | 2 +-
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/net/ncsi/ncsi-manage.c b/net/ncsi/ncsi-manage.c
> > index ca04b6df1341..42b54a3da2e6 100644
> > --- a/net/ncsi/ncsi-manage.c
> > +++ b/net/ncsi/ncsi-manage.c
> > @@ -700,7 +700,7 @@ static int ncsi_oem_gma_handler_bcm(struct ncsi_cmd_arg
> > *nca)
> >         nca->payload = NCSI_OEM_BCM_CMD_GMA_LEN;
> > 
> >         memset(data, 0, NCSI_OEM_BCM_CMD_GMA_LEN);
> > -       *(unsigned int *)data = ntohl(NCSI_OEM_MFR_BCM_ID);
> > +       *(unsigned int *)data = ntohl((__force __be32)NCSI_OEM_MFR_BCM_ID);
> 
> This looks wrong, the value you're passing isn't big endian. It would
> make more sense if the byte swap was ntohl, as it's coming from the
> cpu and going into the NCSI packet.

Is there any other ways to deal with those sparse errors?

Thanks.

