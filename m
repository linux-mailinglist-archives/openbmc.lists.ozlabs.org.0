Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFD44DC7B
	for <lists+openbmc@lfdr.de>; Thu, 11 Nov 2021 21:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqtXV6Yqhz305B
	for <lists+openbmc@lfdr.de>; Fri, 12 Nov 2021 07:26:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=unURXPAV;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=unURXPAV; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqtX505ZBz2yPp
 for <openbmc@lists.ozlabs.org>; Fri, 12 Nov 2021 07:25:56 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id CC1E445BF1;
 Thu, 11 Nov 2021 20:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1636662349; x=1638476750; bh=6gDZLMf4TvWeS5t/XFi9kNM78
 Izk9i5A/kJCZnzJ4MU=; b=unURXPAV17xCErdTCAZEbRotgjBVi0JM9663mPiwl
 8SmM7wbmOCQPozgdUxARXQZYd+PpU+T3F9mwsM8kZjyCHfQLIK8AbV4O9y3FjblY
 E9N5o4xGmAsRK7gOxuULe85nN/Tmg9r7OBgSErZsa4RHKcO+6gNuVIjTntyqqNQf
 GE=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cr5eBZthYzEg; Thu, 11 Nov 2021 23:25:49 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 8F3E94597C;
 Thu, 11 Nov 2021 23:25:48 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 11
 Nov 2021 23:25:47 +0300
Message-ID: <98e923bf1a12d2819510be7c74e497628988454f.camel@yadro.com>
Subject: Re: [External] [PATCH 2/2] ARM: dts: aspeed: add device tree for
 YADRO VEGMAN BMC
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 11 Nov 2021 23:25:46 +0300
In-Reply-To: <CAGm54UESNecrEJfiv9vXyLYqM6OSGp1Cxt8hB0UJgG_Bgi=-tg@mail.gmail.com>
References: <20211110222803.836-1-a.kartashev@yadro.com>
 <20211110222803.836-3-a.kartashev@yadro.com>
 <CAGm54UESNecrEJfiv9vXyLYqM6OSGp1Cxt8hB0UJgG_Bgi=-tg@mail.gmail.com>
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
Cc: andrew@aj.id.au, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2021-11-11 at 10:13 +0800, Lei Yu wrote:
> On Thu, Nov 11, 2021 at 6:29 AM Andrei Kartashev
> <a.kartashev@yadro.com> wrote:
> > +
> > +&fmc {
> > +       status = "okay";
> > +       flash@0 {
> > +               status = "okay";
> > +               label = "bmc";
> > +               m25p,fast-read;
> > +               partitions {
> > +                       compatible = "fixed-partitions";
> > +                       #address-cells = <1>;
> > +                       #size-cells = <1>;
> > +
> > +                       u-boot@0 {
> > +                               reg = <0x0 0x80000>; // 512KB
> > +                               label = "u-boot";
> > +                       };
> > +
> > +                       fit-image-a@80000 {
> > +                               reg = <0x80000 0x1b80000>; // 27.5MB
> > +                               label = "image-a";
> > +                       };
> > +
> > +                       sofs@1c00000 {
> > +                               reg = <0x1c00000 0x200000>; // 2MB
> > +                               label = "sofs";
> > +                       };
> > +
> > +                       rwfs@1e00000 {
> > +                               reg = <0x1e00000 0x600000>;  // 6MB
> > +                               label = "rwfs";
> > +                       };
> > +
> > +                       u-boot-env@2400000 {
> > +                               reg = <0x2400000 0x20000>; // 128KB
> > +                               label = "u-boot-env";
> > +                       };
> > +
> > +                       fit-image-b@2480000 {
> > +                               reg = <0x2480000 0x1b80000>; //
> > 27.5MB
> > +                               label = "image-b";
> > +                       };
> > +               };
> > +       };
> > +};
> 
> The flash layout is not the same as the openbmc static layout, but
> like the one used by Intel-BMC.
> May I ask if you are going to upstream the bmc-code-update related
> changes for this layout?

Yeh, we got to this mess, so now it is not easy to change, so we have
to deal with Intel-BMC layout.
We have our own utility to manage firmware:
https://github.com/YADRO-KNS/obmc-yadro-fwupdate
What to do with updates through webui, I don't know yet.

> > +&i2c0 {
> > +       /* SMB_IPMB_STBY_LVC3 */
> > +       multi-master;
> > +       general-call;
> > +       aspeed,dma-buf-size = <4095>;
> > +       aspeed,hw-timeout-ms = <300>;
> 
> These properties are not available in openbmc linux kernel tree, but
> used in Intel-BMC/linux, may I ask if you are going to upstream the
> related changes?
> 

Thank you for pointing this, will remove in next revision.

> > +       status = "okay";
> > +};
> > +
> 

-- 
Best regards,
Andrei Kartashev


