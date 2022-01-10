Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 415E2489657
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 11:29:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXVS01Jryz2yPY
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 21:29:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=GYeiqvLS;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=GYeiqvLS; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXVRc3rW7z2xBZ
 for <openbmc@lists.ozlabs.org>; Mon, 10 Jan 2022 21:29:00 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 00EF046FA6;
 Mon, 10 Jan 2022 10:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1641810532;
 x=1643624933; bh=b/O49pFazJnVBV2RQjKxrSfSEmQJTZMqYNpQDFZ3+5s=; b=
 GYeiqvLSHZlLySFIbH8TwCC3gFaMA0UZtT3FgQLPXIKgP4wNKUXg8H7RiHYwUsdz
 mDJnUFaay8nePFs4dVIT5d7cPKcS83zKdXRzbm2flywddc99UoKgJxQSRh2NeqOv
 QVlnFM+gRcwTc4uf0ufXS4v+PIKAZKt0pwruYSWCUro=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id St3XpBILCflo; Mon, 10 Jan 2022 13:28:52 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id ADCD741786;
 Mon, 10 Jan 2022 13:28:52 +0300 (MSK)
Received: from localhost (172.17.1.114) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 10
 Jan 2022 13:28:51 +0300
Date: Mon, 10 Jan 2022 13:28:51 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Subject: Re: removal of company specific, general-developers teams
Message-ID: <YdwKY3hILpL9PfnF@nbwork.lan>
References: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220104182619.ua6xl655s72d44wu@cheese.fuzziesquirrel.com>
X-Originating-IP: [172.17.1.114]
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, Jan 04, 2022 at 01:26:19PM -0500, Brad Bishop wrote:
> Hi all
> 
> There are a number of github teams that as far as I know are unused so I
> would like to delete them:
> 
> https://github.com/orgs/openbmc/teams/general-developers
> https://github.com/orgs/openbmc/teams/ampere
> https://github.com/orgs/openbmc/teams/dell
> https://github.com/orgs/openbmc/teams/facebook
> https://github.com/orgs/openbmc/teams/google
> https://github.com/orgs/openbmc/teams/ibm
> https://github.com/orgs/openbmc/teams/ibm-development
> https://github.com/orgs/openbmc/teams/ibm-test
> https://github.com/orgs/openbmc/teams/intel
> https://github.com/orgs/openbmc/teams/inventec
> https://github.com/orgs/openbmc/teams/nuvoton
> https://github.com/orgs/openbmc/teams/quanta
> https://github.com/orgs/openbmc/teams/yadro
> 
> If you are aware of any use of these github teams please let me know.  If I
> have not heard anything by February I will assume the groups are unused and
> delete them.

I suppose `yadro` can be safely removed. At least it isn't used by us.

> 
> thanks!
> 
> -brad

--
Alexander
