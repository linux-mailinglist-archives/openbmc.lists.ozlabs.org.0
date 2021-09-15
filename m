Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500040C183
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 10:17:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8Y3Z3VJcz2yJt
	for <lists+openbmc@lfdr.de>; Wed, 15 Sep 2021 18:17:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=TEtXcn8g;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=TEtXcn8g; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8Y362fKsz2yHj
 for <openbmc@lists.ozlabs.org>; Wed, 15 Sep 2021 18:16:50 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DA99942747;
 Wed, 15 Sep 2021 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1631693805; x=1633508206; bh=NT9fBHmj3Q1CKD+8QnlOuZ9Ak
 CUCXPujpQvvkVZaqS0=; b=TEtXcn8g3WVl+y0BqnpcMSwqND3Bwi6JPOWCPR4vC
 yyD/CCWrQ/c25u9G/ly/JZ3ZXF/gT0blCZpSns9XUr5EdeEFxNh8BoPhRw46B0AR
 +jFvrEEbOIwu56mha2fgAkfUkGk1TKb/Qg3DFqf/m+W8u6TiZ/8Fl93hvaFBfGmF
 0s=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uew8zX3oheH; Wed, 15 Sep 2021 11:16:45 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 475D8425F3;
 Wed, 15 Sep 2021 11:16:45 +0300 (MSK)
Received: from [10.199.0.6] (10.199.0.6) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 15
 Sep 2021 11:16:44 +0300
Message-ID: <4bda1bb5f09395003c95c645518f34828105b160.camel@yadro.com>
Subject: Re: Read smbios2 file failed
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Thang Nguyen <thang@amperemail.onmicrosoft.com>, openbmc
 <openbmc@lists.ozlabs.org>
Date: Wed, 15 Sep 2021 11:16:43 +0300
In-Reply-To: <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
References: <CAMqwjCAaHrv0SgA_1hDEjjnX1fur6ijmCJCrn1gTPbr5Z2-ONw@mail.gmail.com>
 <d190054863c8112a66baad2f50dda7c6bdc45717.camel@yadro.com>
 <5f94cf85-6ded-3520-8ad2-592fade91e81@amperemail.onmicrosoft.com>
 <9ab79bcd06ad6b6cf574a8455247a767df8731ac.camel@yadro.com>
 <d93fc722-2a24-0921-56ee-b9968edbd6a6@amperemail.onmicrosoft.com>
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

I don't know what is format of "dmidecode --dump-bin", but if it just
raw dump of smbios then you only need to add mdr header.

See answer for the same question here:
https://lists.ozlabs.org/pipermail/openbmc/2021-July/026882.html

On Wed, 2021-09-15 at 12:41 +0700, Thang Nguyen wrote:
> Hi Andrei,
> 
> I see output of "dmidecode --dump-bin" follows SMBIOS specification.
> As
> the data for smbios-mdr does not follow this, do you know about the 
> document or any information I can reference to prepare data to send
> to
> BMC??
> 
> 
> Best Regards,
> 
> Thang Q. Nguyen
> 
> On 14/09/2021 15:51, Andrei Kartashev wrote:
> > No, it is not same as "dmidecode --dump-bin".
> > 
> > On Tue, 2021-09-14 at 13:46 +0700, Thang Nguyen wrote:
> > > On 13/09/2021 23:56, Andrei Kartashev wrote:
> > > > You need to somehow deliver smbios data image to BMC. This
> > > > means,
> > > > your
> > > > BIOS should implementat some logic to transfer this data.
> > > > For BMC side see example here:
> > > > https://github.com/openbmc/intel-ipmi-oem/blob/master/src/smbiosmdrv2handler.cpp
> > > Hi Andrei,
> > > 
> > > What is the format of smbios data to transfer to BMC? Is it the
> > > same
> > > content of "dmidecode --dump-bin" command from Host Linux? or
> > > anything
> > > special in formatting the content to send?
> > > 
> > > > On Mon, 2021-09-13 at 17:40 +0300, Alexander Raih wrote:
> > > > > Hi guys, I am beginner in openbmc
> > > > > I build openbmc with smbios-mdr repository and I have error:
> > > > > 
> > > > > Read data from flash error - Open MDRV2 table file failure
> > > > > 
> > > > > There isnt file in /var/lib/smbios/smbios2
> > > > > 
> > > > > How I can resolve this problem?
> > > > > Help me please!!!


-- 
Best regards,
Andrei Kartashev


