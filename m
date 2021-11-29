Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 783DE46120D
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 11:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2hHj2r6qz3cYC
	for <lists+openbmc@lfdr.de>; Mon, 29 Nov 2021 21:22:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=oy5m1eCW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=oy5m1eCW; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2hHB3415z3cH2
 for <openbmc@lists.ozlabs.org>; Mon, 29 Nov 2021 21:22:14 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 62D3242310;
 Mon, 29 Nov 2021 10:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1638181328; x=1639995729; bh=JXY1RVYstVJquzr3YTOqZbcpI
 qgx00rTxMIPOF/xbfQ=; b=oy5m1eCWrq7U++uegnVwyi+UWXENYB1CBWYoik/Sl
 IAHPcwW6vyA3h36fspMua61P4zqIlp4h4RzxzhP73kLKwSsnSnXnxiuD8gqy8UWJ
 xh3fWFZxFG5TvVsZgynMrUnjmDtcWSVZPv+kVWpZLcRFFF6b9JeYfi0bFZlgjZgf
 xs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ILjgvh0fU7OT; Mon, 29 Nov 2021 13:22:08 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id C020F42306;
 Mon, 29 Nov 2021 13:22:06 +0300 (MSK)
Received: from [10.199.10.105] (10.199.10.105) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 29
 Nov 2021 13:22:06 +0300
Message-ID: <18a75e7d223e2c054e93e9a83a6c0ba474125518.camel@yadro.com>
Subject: Re:  openBMC pwm-fan control policy
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Landon <cld795@163.com>, "fercerpav@gmail.com" <fercerpav@gmail.com>
Date: Mon, 29 Nov 2021 13:22:05 +0300
In-Reply-To: <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
References: <mailman.0.1637828525.15424.openbmc@lists.ozlabs.org>
 <217ffd16.389b.17d5636abb5.Coremail.cld795@163.com>
 <20211125084640.GA22508@home.paul.comp>
 <78340dc9.749f.17d5ab53990.Coremail.cld795@163.com>
 <687802ca.772b.17d5ad02872.Coremail.cld795@163.com>
 <20211126215734.GH22508@home.paul.comp>
 <459566ca.670c.17d6b13a847.Coremail.cld795@163.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello,

Please read phosphor-pid-control documentation:
https://github.com/openbmc/phosphor-pid-control
https://github.com/openbmc/phosphor-pid-control/blob/master/configure.md
https://github.com/openbmc/phosphor-pid-control/blob/master/tuning.md
https://github.com/openbmc/phosphor-pid-control/tree/master/examples

Keep in mind that there are two different ways to configure phosphor-
pid-control: statically with JSON config files and dynamically with
DBUS (generally, using EntityManager JSON configuration) and same
parameters with this two ways mostly have different names.
The way you want to use is generally depend on either you use EM for
your platform or not.

On Mon, 2021-11-29 at 17:43 +0800, Landon wrote:
>  Thank you!  
> I have read it
> :  https://github.com/openbmc/entity-manager/blob/master/configurations/R1000%20Chassis.json
> But I don't understand,
> Is there an explanation for this part?
> Are there general instructions on how to control fan output by
> temperature?
> 
> and how to use phosphor-pid-control  to set this ?
>  
> Is there“ phosphor-pid-control ”the instructions for this part?
> Thank you very much !
> On 11/27/2021 05:57，Paul Fertser<fercerpav@gmail.com> wrote： 
> > On Fri, Nov 26, 2021 at 01:55:31PM +0800, Landon wrote:
> >  
> > > add: I just want to know in  OpenBMC by reading different
> > > temperature values  or
> > >  current values to  control the fan  output, so as  to cool down,
> > >  how does  this
> > >  strategy work? An example of this.
> > 
> > This is using temperature values to control the fans so as to cool
> > down, it works by configuring phosphor-pid-control appropriately, I
> > hope it's enough of an example:
> > 
> > https://github.com/openbmc/entity-
> > manager/blob/master/configurations/R1000%20Chassis.json
> > 
> > If you think phosphor-pid-control is missing some documentation
> > please
> > read its source code and send documentation patches for review.
> > 

-- 
Best regards,
Andrei Kartashev


