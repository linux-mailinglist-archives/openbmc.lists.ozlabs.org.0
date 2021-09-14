Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E1940A9BB
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 10:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7xt50jGZz2xYR
	for <lists+openbmc@lfdr.de>; Tue, 14 Sep 2021 18:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=IZYYGsij;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=IZYYGsij; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7xsf5rsxz2xlG
 for <openbmc@lists.ozlabs.org>; Tue, 14 Sep 2021 18:51:34 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 2A57741D34;
 Tue, 14 Sep 2021 08:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1631609489; x=1633423890; bh=aXoPXotgLofqNYWHFMN7ACIHs
 tX5+cV5iiK5lc+HOsY=; b=IZYYGsijraUuSw6n7JdQFfiI1ktq9Lp/dDCzHFWdV
 bFpYJpiycagxw6RgOGkyuTr7VR/zTxn3PT1DQMXV0zsTU63SqVhyGRphBHd3sw2b
 AkMnlJ59g6Kgv1oEXTmSI7LwCifSGd5zN2fnB79WjBp6npqUYhOuGaQWpND2WjNG
 04=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ypvUbK6BQ5pr; Tue, 14 Sep 2021 11:51:29 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E979C41D24;
 Tue, 14 Sep 2021 11:51:29 +0300 (MSK)
Received: from [10.199.0.6] (10.199.0.6) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 14
 Sep 2021 11:51:29 +0300
Message-ID: <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
Subject: Re: Read smbios2 file failed
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>, <openbmc@lists.ozlabs.org>
Date: Tue, 14 Sep 2021 11:51:28 +0300
In-Reply-To: <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.0.6]
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

No, it is not same as "dmidecode --dump-bin". 

On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> 
> On 13/09/2021 23:56, Andrei Kartashev wrote:
> > You need to somehow deliver smbios data image to BMC. This means,
> > your
> > BIOS should implementat some logic to transfer this data.
> > For BMC side see example here:
> > https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp
> 
> Hi Andrei,
> 
> What is the format of smbios data to transfer to BMC? Is it the same 
> content of "dmidecode --dump-bin" command from Host Linux? or
> anything 
> special in formatting the content to send?
> 
> > On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> > > Hi guys, I am beginner in openbmc
> > > I build openbmc with smbios-mdr repository and I have error:
> > > 
> > > Read data from flash error - Open MDRV2 table file failure
> > > 
> > > There isnt file in /var/lib/smbios/smbios2
> > > 
> > > How I can resolve this problem?
> > > Help me please!!!

-- 
Best regards,
Andrei Kartashev


