Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EBF045D831
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 11:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0DW72jxdz304y
	for <lists+openbmc@lfdr.de>; Thu, 25 Nov 2021 21:24:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=FQ3FRqSu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=FQ3FRqSu; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0DVg4rt7z2ywQ
 for <openbmc@lists.ozlabs.org>; Thu, 25 Nov 2021 21:23:39 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8A86D4775F;
 Thu, 25 Nov 2021 10:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1637835812; x=1639650213; bh=BYcQMwzwX9nKi04OKwDDmSS+f
 R3Fr+MHuldz4glE/Y8=; b=FQ3FRqSudaKQFD0+W/Ngr5j+AJC+x4JblyWtict7I
 CQ/bltNCXvzdph9giJeDQoK/ji29ZGpgT+vk/whVdEVhaNRvrNDdMx5Z4b0l6GfI
 TThd9AwgpTTBWQUE5CIxu2i021aeCyVHt1jbj6BdiIBrZ7Hc71kfEVg8fqE7cUiX
 4s=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Yrj8dZaRnwP; Thu, 25 Nov 2021 13:23:32 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 80E064775C;
 Thu, 25 Nov 2021 13:23:32 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 25
 Nov 2021 13:23:32 +0300
Message-ID: <7e00e6631b3684a23c6fda855612d66aa61cad8c.camel@yadro.com>
Subject: Re: [PATCH u-boot v2019.04-aspeed-openbmc] ARM: dts: aspeed: add
 vegman machine dts
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Date: Thu, 25 Nov 2021 13:23:30 +0300
In-Reply-To: <YZ6DImerODeksDI5@latitude>
References: <20211124122214.19669-1-a.kartashev@yadro.com>
 <YZ6DImerODeksDI5@latitude>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.199.10.105]
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

On Wed, 2021-11-24 at 19:23 +0100, Jonathan Neuschäfer wrote:
> Hello,
> 
> On Wed, Nov 24, 2021 at 03:22:14PM +0300, Andrei Kartashev wrote:
> > Signed-off-by: Andrei Kartashev <a.kartashev@yadro.com>
> > ---
> ...
> > +++ b/arch/arm/dts/ast2500-vegman.dts
> > @@ -0,0 +1,167 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +// Copyright (C) 2021 YADRO
> > +/dts-v1/;
> > +
> > +#include "ast2500-u-boot.dtsi"
> > +
> > +/ {
> > +       model = "AST2500 VEGMAN";
> > +       compatible = "aspeed,ast2500-vegman", "aspeed,ast2500";
> 
> The board-specific compatible string "aspeed,ast2500-vegman" seems
> wrong, if the board is made by YADRO rather than ASPEED.
> 
> 

Right, my fault. Fixed, thanks.

> Best regards,
> Jonathan Neuschäfer

-- 
Best regards,
Andrei Kartashev


