Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD4326D0A4
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 03:33:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsKGf2yrNzDqVp
	for <lists+openbmc@lfdr.de>; Thu, 17 Sep 2020 11:32:58 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=DO6ADrCr; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsKBh5PnLzDqDf
 for <openbmc@lists.ozlabs.org>; Thu, 17 Sep 2020 11:29:32 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 6EDB657540;
 Wed, 16 Sep 2020 17:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1600278600; x=1602093001; bh=ECm/Fsli9JgD6E+MxFn7TS//B
 7a3LC1rnRXFM0ey/Ow=; b=DO6ADrCr81zB1w1II5X/Sj9iwZU4GSrwQrPTiTBmR
 RyXNlvmW13OI/0y4UeAcFCP9ePGFueL4cDsO9cWI6xtfJQkMHABEKL6AH9I3W8t6
 cq4LdAtdxSkhvtnL1VcYHqyPGRtQhifU2prTm6s8SS9Smz87MrpjxHa6un2VKKZr
 r0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3pp5PtAyjf7x; Wed, 16 Sep 2020 20:50:00 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id D739357524;
 Wed, 16 Sep 2020 20:49:59 +0300 (MSK)
Received: from [10.199.0.126] (10.199.0.126) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 16
 Sep 2020 20:49:59 +0300
Message-ID: <fa3c22c977a01d391aef1a850180b269d49f620a.camel@yadro.com>
Subject: Re: dbus-sensors: Unit property for
 xyz.openbmc_project.Sensor.Value interface
From: Andrei Kartashev <a.kartashev@yadro.com>
To: Ed Tanous <ed@tanous.net>, James Feist <james.feist@linux.intel.com>
Date: Wed, 16 Sep 2020 20:49:58 +0300
In-Reply-To: <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
References: <4456d953b1ea5debbc65a282fd62faf4f42d6a20.camel@yadro.com>
 <a824162a-3c7e-810b-5c9a-e41332a0cd22@linux.intel.com>
 <CACWQX82wHxHz9VLAjeSv_s+J1Ovh985o31ekB0oPdr8A8UBavw@mail.gmail.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.126]
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2020-09-16 at 09:24 -0700, Ed Tanous wrote:
> On Wed, Sep 16, 2020 at 8:23 AM James Feist <
> james.feist@linux.intel.com> wrote:
> > On 9/16/2020 6:28 AM, Andrei Kartashev wrote:
> > > Hi,
> > > 
> > > We noticed that dbus-sensors doesn't fully implement
> > > xyz.openbmc_project.Sensor.Value interface: there is no Unit
> > > property
> > > for all the sensors, defined by dbus-sensors.
> > > I believe it was intentionally, but I still wondering what was
> > > the
> > > reason?
> > 
> > It was originally as the information seemed redundant. If the
> > information is needed I'm fine with someone adding it, it just
> > hasn't
> > seemed to be a high priority.
> 
> Considering we've gone this long with no impact (considering the path
> can be used to lookup the unit) I wonder if we should consider
> removing unit from the sensor Value API?  It doesn't seem used.
> 
> > > I noticed that in intel-ipmi-oem units are determined based on
> > > object
> > > paths, but that looks ugly since there is well-defined natural
> > > interface for units in dbus.
> > > Lack of the "Unit" property in the interface breaks some existing
> > > logic.
> > > 
> 
> Technically the way the interfaces define it, both are valid to use
> to
> determine the Units, and both would need to be lookup tables.  Is
> using the path any more ugly than using the property?

I really don't like this approach to determine Unit based on Path. It
is really not logical, I was surprised to find that "Objects
implementing Sensor.Value must be instantiated in the correct hierarchy
within the sensors namespace." Isn't interfaces are supposed to break
out hierarchy dependency?
More of then, now we have same algorithm if determining units in
different places - this is potential source of inconsistency.
I vote for implementing "Unit" property and removing calculation units
based on path everywhere.

-- 
Best regards,
Andrei Kartashev


