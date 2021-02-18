Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCBD31EA7D
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 14:35:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhG0r4Sydz30Qf
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 00:35:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256 header.s=mta-01 header.b=rjlSyjSj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.kartashev@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=rjlSyjSj; dkim-atps=neutral
X-Greylist: delayed 376 seconds by postgrey-1.36 at boromir;
 Fri, 19 Feb 2021 00:34:54 AEDT
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhG0Z1X9Dz30LJ
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 00:34:53 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id BB122412FE
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 13:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1613654909; x=1615469310; bh=+qEwpUC9QrQEnqRo6YoU8ggOz
 gkRl1k7gb6n4BGg65Y=; b=rjlSyjSjV8nhBWmOkdYwgEkNmnu9Mnmw0EXI/bwhW
 iHYgRw4sxl17X+6d3hpT0J1LLoXVE/u1xpLTpblkKMVIjOyqLBLJ3CemyPiTHbT2
 qr5gZRd5RWZ4vUzcPieSrP44W1nn33PBYte/NBmkCsiL743Uova1dPDC1PdXlfG/
 Gk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TjfpvNifYXv for <openbmc@lists.ozlabs.org>;
 Thu, 18 Feb 2021 16:28:29 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2138441259
 for <openbmc@lists.ozlabs.org>; Thu, 18 Feb 2021 16:28:29 +0300 (MSK)
Received: from [10.199.0.39] (10.199.0.39) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 18
 Feb 2021 16:28:29 +0300
Message-ID: <9dad17e9feeb97ac6f435f0ccf36117baf7b9db2.camel@yadro.com>
Subject: Re: What is OpenBMC ?
From: Andrei Kartashev <a.kartashev@yadro.com>
To: <openbmc@lists.ozlabs.org>
Date: Thu, 18 Feb 2021 16:28:28 +0300
In-Reply-To: <9CE8D362-F1E1-4C37-8B01-A645D0C0CB4E@linux.vnet.ibm.com>
References: <177b3af96fa.eaf65e85615103.194541248329848746@maxvytech.com>
 <9CE8D362-F1E1-4C37-8B01-A645D0C0CB4E@linux.vnet.ibm.com>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.0.39]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
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

I would like to add this link, very good material to understand how
does it work:
https://github.com/openbmc/openbmc/wiki/Presentations#openbmc-learning-series2020

Also one may find it useful the presentation I prepared for some
internal event:
https://drive.yadro.com/s/jt8LpNEXoQZeXtE

On Thu, 2021-02-18 at 14:25 +0530, vishwanatha subbanna wrote:
> Hello Daniel,
> 
> Welcome.. Hopefully these links help. OpenBMC is a system management
> software layer that runs on BMC SoC.
> 
> https://www.servethehome.com/explaining-the-baseboard-management-controller-or-bmc-in-servers/
> https://en.wikipedia.org/wiki/OpenBMC
> https://github.com/openbmc/docs/tree/master/architecture
> 
> Thanks,
> !! Vishwa !!
> 
> 
> > On 18-Feb-2021, at 11:19 AM, Daniel <sd2@maxvytech.com> wrote:
> > 
> > This Message Is From an External Sender
> > This message came from outside your organization.
> > Hi,
> > 
> > I am new to OpenBMC or even BMC concept. Since a project
> > requirement has come related to this concept , i want to learn
> > about this concept. I am an embedded software developer.
> > 
> > Is OpenBMC an OS? somewhere i noticed that it will generate an
> > image file to a target machine.
> > 
> > What are the prerequisites that a target BMC should have?
> > 
> > and please explain the following as well,
> > 
> > *Can we install in an FPGA board? if yes, what is the hardware
> > requirement to install this OpenBMC?
> > 
> > *How redfish is used in OpenBMC?
> > 
> > *I would like to get some clarification in this concept.
> > 
> > *"Development board must support OpenBMC" what is the meaning of
> > this statement?
> > 
> > 
> > 
> > Thank you,
> > 
> > 
> > 
> > 
> > Regards,
> > Daniel Kirubakaran S
> > Embedded SW Developer
> > Maxvy Technologies Pvt Ltd
> > Bangalore
-- 
Best regards,
Andrei Kartashev


