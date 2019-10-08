Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD855CFF5D
	for <lists+openbmc@lfdr.de>; Tue,  8 Oct 2019 18:56:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nk5x5DkdzDqQ9
	for <lists+openbmc@lfdr.de>; Wed,  9 Oct 2019 03:56:53 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="CJ23hdxZ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nk5L0CWmzDqPb
 for <openbmc@lists.ozlabs.org>; Wed,  9 Oct 2019 03:56:21 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id EC0CF43B4E;
 Tue,  8 Oct 2019 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1570553774; x=1572368175; bh=OhDFpYlSa6v7ZX7/f/GR7co4C
 wVapBhhSAeBHIYvROc=; b=CJ23hdxZ+OdVBkeFcSuSWkRy3bAhiDl9BHGBNK+7L
 tiAiABKpjtLIAC5/jDumI4HiSmf1sUhK7+bbsZttR4aVacBNTxPeXChhnArjHFJD
 mQiC8eQpP4pBVpSVg1GgmWd26m7vugnwmvrS0XZ+w3yO4v4l4hICy4AadeelYOYo
 kE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m1wu1_HZZaqO; Tue,  8 Oct 2019 19:56:14 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CBAC342F10;
 Tue,  8 Oct 2019 19:56:14 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Tue, 8 Oct 2019 19:56:14 +0300
Message-ID: <106edb5ee091ec873c0461d28fb4820856a742ba.camel@yadro.com>
Subject: Re: watchdog's patches backport from dev to 2.7/warrior
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 19:56:10 +0300
In-Reply-To: <CACPK8XfLqGqZSWqfUtOWqvxyBdOyd_PpAA7NMuUUARoNn1Gu-w@mail.gmail.com>
References: <a75f96a83100994878c2ad459146b7107b5d1da8.camel@yadro.com>
 <CACPK8XfLqGqZSWqfUtOWqvxyBdOyd_PpAA7NMuUUARoNn1Gu-w@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2019-10-08 at 06:20 +0000, Joel Stanley wrote:
> On Mon, 7 Oct 2019 at 16:16, Ivan Mikhaylov <i.mikhaylov@yadro.com> wrote:
> > Hey Joel, Brad,
> > 
> > Can we backport these patches into 2.7 warrior, please?
> 
> Sure. There are two ways to achieve this:
> 
>  -  apply changes as kernel patches to the kernel in the layer for your
> machine.
>   - update the kernel to a newer version by updating meta-aspeed
> 
> As the kernel is not being maintained for the branch, I would suggest
> updating meta-aspeed is the best way to go.
> 
> Cheers,
> 
> Joel
> 
> > c536e5f66af75f4301361363e37d7f4e3aa4eb37
> > ARM: dts: aspeed: vesnin: Add wdt2 with alt-boot option
> > 
> > 6984ef32d05c2b5567f5d3f09d260ca7cbc2fc27
> > ARM: dts: aspeed: vesnin: Add secondary SPI flash chip
> > 
> > 653aedbf02b71d6930959323e76961da98eab858
> > watchdog: aspeed: add support for dual boot
> > 
> > Thanks.
> > 

Joel, we had same idea about kernel patches for our layer but meta-aspeed
approach is much better for us. So should I send those patches into gerrit for
meta-aspeed?

Thanks.

