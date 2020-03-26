Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05850194426
	for <lists+openbmc@lfdr.de>; Thu, 26 Mar 2020 17:19:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p9D11sflzDqhH
	for <lists+openbmc@lfdr.de>; Fri, 27 Mar 2020 03:19:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=yadro.com (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=i.mikhaylov@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.a=rsa-sha256
 header.s=mta-01 header.b=HPuIukxq; dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p9C40M33zDqxb
 for <openbmc@lists.ozlabs.org>; Fri, 27 Mar 2020 03:18:23 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A18EF412C9;
 Thu, 26 Mar 2020 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:mime-version:user-agent:content-type
 :content-type:organization:references:in-reply-to:date:date:from
 :from:subject:subject:message-id:received:received:received; s=
 mta-01; t=1585239495; x=1587053896; bh=HhMhecxMRkcjbad50vD0QiZBS
 c1sQoGt+DaYPyv9D9E=; b=HPuIukxqSPT2GoHT8DPfVc+dktlw0/jdV/xfreJ0x
 JPlkUzb/+5G44LoLr3EST8vlomEIhpKv/qD7WSzRzRlAE1W6jOSSxlbIT3T01GHL
 KD/5PFkxu1AcnA0Gj76GaIdNhPyDoZQ8ib9tc8/kh196OMktVgtZnVbTA0Cp2vk1
 mI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k58y7DqBVwmq; Thu, 26 Mar 2020 19:18:15 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 7A00F41291;
 Thu, 26 Mar 2020 19:18:15 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.118) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 26 Mar 2020 19:18:15 +0300
Message-ID: <b52e04131bd2734cf27bed2d057d085541278356.camel@yadro.com>
Subject: Re: Proposal for the connected redfish client info
From: Ivan Mikhaylov <i.mikhaylov@yadro.com>
To: Patrick Williams <patrick@stwcx.xyz>, Ratan Gupta
 <ratagupt@linux.vnet.ibm.com>
Date: Thu, 26 Mar 2020 19:18:26 +0300
In-Reply-To: <20200326140133.GB10853@heinlein.lan.stwcx.xyz>
References: <94469ba3-2b59-b131-ecbe-d708054aef89@linux.vnet.ibm.com>
 <bfd9332f-1a27-d00f-4379-8c039b9e9b24@linux.vnet.ibm.com>
 <76571c68-ed92-f15f-cfd5-37a323b430b1@linux.intel.com>
 <477c9a0c-ea2a-f1d5-7e0f-59ece898096d@linux.vnet.ibm.com>
 <2e08beba-3904-f3dd-b11e-6df9994f901b@linux.vnet.ibm.com>
 <20200326140133.GB10853@heinlein.lan.stwcx.xyz>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.118]
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
Cc: openbmc@lists.ozlabs.org, James Feist <james.feist@linux.intel.com>,
 rhanley@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2020-03-26 at 09:01 -0500, Patrick Williams wrote:
> On Thu, Mar 26, 2020 at 01:54:05PM +0530, Ratan Gupta wrote:
> > > > This confuses me, how are you getting the serial number for a 
> > > > connected client? If so, have you looked into data protection laws 
> > > > and storing Personally Identifiable Information?
> > > 
> > > Client have to give this info, it could be anything like hostname of 
> > > the client, serial number of the machine etc, it is up to the client 
> > > what they want to provide as part of client identifier.
> > > 
> > > Why it is needed?
> > > 
> > > Consider the below use case
> > > 
> > > => Client(x.x.x.x) creates the session with BMC
> > > 
> > > => BMC stores this IP(x.x.x.x)
> > > 
> > > => Now say Client IP(x.x.x.x) got change to y.y.y.y but the session is 
> > > still valid.
> > > 
> > > => Stored IP(x.x.x.x) will not be much usable here in this scenario
> > > 
> > > => Here Client Identifier may be usable to identify the connected client.
> > > 
> > > Let me know your thoughts here.
> 
> IP addresses are a terrible way of attempting to identify a client
> anyhow.  Aren't there hundreds of implementations of authentication
> tokens used in web technologies?  Why are we attempting to invent
> something new?
> 
> It seems like much of the internet world has coalesced around JWT.
> https://tools.ietf.org/html/rfc7519
> 

I agree with Patrick about tokens as identification, IP addresses are not usable
for this purpose.


