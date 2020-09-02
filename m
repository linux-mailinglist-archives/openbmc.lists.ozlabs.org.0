Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D72B25B66C
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 00:28:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bhdr81hd4zDqxF
	for <lists+openbmc@lfdr.de>; Thu,  3 Sep 2020 08:28:24 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=MzGLYvwv; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhdqR00JBzDqfr
 for <openbmc@lists.ozlabs.org>; Thu,  3 Sep 2020 08:27:46 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 19EF2574CD;
 Wed,  2 Sep 2020 22:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1599085659; x=1600900060; bh=+X2hyhxWjfzos+1vVg9ezx6FJ
 YhotgzFI20u9xKYZ4E=; b=MzGLYvwvEBlFkWkkRHJW7M/D4SYXN/sVwqSHViDcv
 RICS+8qX+DKugKAGPoAp+xAjQitpTe4fTF2hJidkLYAkk4q4uzQ5Af2MXP5HEWjn
 8XQIs7PU/UXyJ9lYR11hYibuqQSevo654Dhq87gi9TvkilxXLDhHaog7Rl1dVNtZ
 8Q=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jx5Mqw9QkhlH; Thu,  3 Sep 2020 01:27:39 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7A1BD52195;
 Thu,  3 Sep 2020 01:27:39 +0300 (MSK)
Received: from [10.199.0.154] (10.199.0.154) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 3 Sep
 2020 01:27:39 +0300
Message-ID: <ceef9c9e30992d6d9fe85ec19b1c87da1191fc39.camel@yadro.com>
Subject: Re: OpenBMC - FRU inventory with Entity Manager
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Ed Tanous <ed@tanous.net>
Date: Thu, 3 Sep 2020 01:27:38 +0300
In-Reply-To: <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
References: <DM6PR12MB3020D6DD47C7E6DBBD6530A3CD550@DM6PR12MB3020.namprd12.prod.outlook.com>
 <22E14C00-D87D-489F-AB22-6401DE8CDDF5@fb.com>
 <5e71fa32-4547-fb5e-ed50-dffe19cefc09@linux.vnet.ibm.com>
 <b9f035732b62a4bd58ea67e2ea936bdce2cec790.camel@yadro.com>
 <CACWQX83AXKZiTdhrXhuXg8r-2ZfJstqGANumOBzVtNHzFGonDA@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.154]
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2020-08-31 at 10:14 -0700, Ed Tanous wrote:
> 
> On Wed, Aug 26, 2020 at 11:11 PM Andrei Kartashev <
> a.kartashev@yadro.com> wrote:
> > Since there is a plan to move to EM for inventory, I believe it is
> > really good idea to also have support for FruDevice in phosphor-
> > host-
> > ipmid. Then we can have a common way on how to handle it.
> > Same for SDR BTW.
> 
> +1.  This was attempted a long time ago, but nobody was able to come
> up with a design that kept the "old" way working for those that
> needed it, and at the time there were some missing features.  Given
> where entity manager has gotten, it's probably time to start that
> discussion up again.  Do you think you could put together a patch
> that does what you describe?
>  
Well, I currently have number of more critical tasks for platform
bring-up, but I can take a look.

> > But there is other thing: there is catastrophically not enough
> > documentation for EntityManager/dbus-sensors. Looks like common way
> > just to adjust existing config and hope that it still will work.
> > <sorry, was all the day trying to get adcsensors work yesterday> 
> 
> That being the case, would you mind taking a look at the docs changes
> I just put up.  It's trying to improve the EM documentation a bit,
> although I realize it doesn't get all the way to where it needs to
> be.
> https://gerrit.openbmc-project.xyz/c/openbmc/entity-manager/+/36110

Great doc! I wish I had it month ago )

> Also, it'd be great if you can come up with some concrete examples of
> what else we can improve in this regard.  Unfortunately the "copy an
> existing config and modify" approach was the best way we found to
> make platform ports easy.  A lot of systems tend to look pretty
> similar, based on similar reference platforms, so usually there's
> something to use as a starting point.  Building a config from scratch
> using first principals and documentation is kind of daunting, and
> became a non-starter for most people, given that the config files
> tend to be large.

Yes, everyone likes "copy-paste" and this is working approach. Unless
you understand what exactly you pasting. E.g. Fan/PID configuration
looks like a hell and it doesn't match one that described in phosphor-
pid-manager ).
So, now we have brilliant top-level overview, next step is to describe
how to use and extend it. That is mostly on reactor side, of course,
but on EM side we should clearly describe how config is translated to
dbus objects. Another thing I would like to have is even more high-
level document describing the common architecture of EM-based
inventory.
I can start with some drafts of what I dig, to make it more clear.

> What were the biggest roadblocks you hit trying to get ADCSensor
> working?
>  

ADC is king of easiest sensor you can have, I thought ). But still I
face stones. For example, if you remove "PowerState": "On" from all
channels, you will get crash with "Power Match Not Created". Or this
configuration entry in Wolfpass config:
            "BridgeGpio": [
                {
                    "Name": "P3VBAT_BRIDGE_EN",
                    "Polarity": "High"
                }
            ],
which seems to be copy-pasted from somewhere else, since it present in
all other configs, but not in board schematics ) That is, of cause, not
a problem of EM or dbus-sensor, but this is example for copy-pasting
issues.



