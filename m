Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF5A14DB0E
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 13:55:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 487gLN2991zDqYS
	for <lists+openbmc@lfdr.de>; Thu, 30 Jan 2020 23:55:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.filippov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=eS2hm5XL; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 487gJX0K8szDqRM
 for <openbmc@lists.ozlabs.org>; Thu, 30 Jan 2020 23:53:25 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 8B1EA47996;
 Thu, 30 Jan 2020 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1580388798;
 x=1582203199; bh=XWcuAmRmCeDLq9Wllx6gU+a40VS33CAJGHvhmyDMYRE=; b=
 eS2hm5XLlYqdFaMeetdLR+qCm5OKOWpIuOa/ihnBcCL2bDayaSxreLSZGAUxtkIu
 Vkc+GjPlpOaFIIm6zq+I30Vgt7r/tjc1+5iCGBPzrPVyPFFXA1pIBPQlP/zz2ndB
 as8d0C4wzG57wHq9kVph8u4pouLa3A/E969q9Ys6xb0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zjMXSCo4W_Hp; Thu, 30 Jan 2020 15:53:18 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8A4B947995;
 Thu, 30 Jan 2020 15:53:17 +0300 (MSK)
Received: from localhost (172.17.14.115) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 30
 Jan 2020 15:53:17 +0300
Date: Thu, 30 Jan 2020 15:53:17 +0300
From: "Alexander A. Filippov" <a.filippov@yadro.com>
To: Atharva Rajendra Karpate <karpatear@rknec.edu>
Subject: Re: OpenBmc Hardware
Message-ID: <20200130125317.GA21443@bbwork.lan>
References: <CAF0vu0SZuKY7gsSTkd=H2sbc_Oi4-j9_8r7GnWUFngPT_-0wRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAF0vu0SZuKY7gsSTkd=H2sbc_Oi4-j9_8r7GnWUFngPT_-0wRw@mail.gmail.com>
X-Originating-IP: [172.17.14.115]
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, Jan 30, 2020 at 04:53:22PM +0530, Atharva Rajendra Karpate wrote:
> Hi,
> I am a newbie to openBmc. I have tried the QEMU KVM Romulus openBmc.I want
> to further explore openBmc on real hardware. Could anyone suggest 1U or 2U
> rack servers which allow me to install openBmc on them?

Someone wrote in this list that he has run the OpenBMC on the Raspberry Pi.
Maybe it is, what are you looking for?

Most of hardware equipment with the OpenBMC on board is an enterprise solution.
In my opinion, it is too expensive for just examining the OpenBMC.

> 
> Thanks & Regards,
> Atharva R Karpate

Cheers,
Alexander
