Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 650B61CA1D2
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 06:12:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JH444kStzDqwm
	for <lists+openbmc@lfdr.de>; Fri,  8 May 2020 14:12:52 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=NnKIg7Gj; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=2CrsBoDK; 
 dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JH3B4qhwzDqjZ
 for <openbmc@lists.ozlabs.org>; Fri,  8 May 2020 14:12:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6DF6B785;
 Fri,  8 May 2020 00:12:01 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Fri, 08 May 2020 00:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm2; bh=3QeMCH+92iVH8bZcprlGMz/DVkHisS7
 sjczspXqHL3M=; b=NnKIg7GjxkjtpNXiHbh7KgjBu6q2sd+U53W0j7S61Cy9NW1
 6o1E3g+K8ElwtcVM1aBc+SsgZaC7Ide5k+0DuWdvEbcQt4zQTmgYuRaggMGxB4Fo
 ZkJkqkYaS4XF9aDaeh33dRaKqZ7DAS7joR+5me0oJfor2Y+gLXnkZyO3IJLWuwYM
 BdCqmptfEkoffrHsU00xSgJPSWj6gYesvEbJeIL5tUZfn5Wxu1HqXIvlzWCQa6Is
 dxgoBKAZvBpvAHuOvOxQt/sbtXvw1WYVW4aLNmc5mVdCgI/oecWZ+CKrPts/je/2
 HljbS/K+1QwoSc7G/rgTGWSt8bN4LVrQuM/mNIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3QeMCH
 +92iVH8bZcprlGMz/DVkHisS7sjczspXqHL3M=; b=2CrsBoDKvx27IqzuMF1fbt
 fLj/+enoBO7LzjOmWDLXn1rSYuYaYhqOpdPj7GXMkkpdh38UOBzA4GEVCRqIJxpV
 tX4+j7s9GFlZvugD+8WnOZnU1wD96YIAmupsPvKUAiMYHN1IE3IyxPsDQqO/WTEK
 yfXFdLgJqcU+mYoUxEHxo0ILyqHm8GVEbGvTid1uKofLmwgvN3K5SkOngE8ARFX7
 jX5KzEZLNnBvyGs51SMNQ0M0TMOv2ztkmBnQcBscTDBPgWce5wPJwOzwKI1xqVCU
 h8UxRRfsVqszuVOssSlF5VQSAqmAw5xB+LvnE0+ADbXM5Q/jTcyrwgYM2wZvoq/A
 ==
X-ME-Sender: <xms:ENy0Xnw0ygG1Bkzm_FhNgujsTBF40o6b1IfA6DUiU8xxMd-kDY8IWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrkedugdejkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ENy0Xm45R1Apk_iYp8YqzR4cWxPMnJ2e7LQ2lHisVEPLK-4n-mBkEQ>
 <xmx:ENy0XhhPHZe7UnqSrve6sM5fpfIUCA6PkUXQB712CSVbhU1pi9RuYw>
 <xmx:ENy0XpgibM1phW155cSbwtruO4gVlFD66q0SHosJV4zVUdXBEUw6jA>
 <xmx:Edy0XudArCKiTwWjGZ86f6m8opL31FFQFRdf1khDBDIbnkPrwztdxQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 54AC8E00B0; Fri,  8 May 2020 00:12:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-413-g750b809-fmstable-20200507v1
Mime-Version: 1.0
Message-Id: <d3f2626c-1183-4253-b65f-51a8b985e7dc@www.fastmail.com>
In-Reply-To: <CADfYTpGNRJ3Yk6h7K4iw27jn4c4VqNKnHw0PLMHyG5h+O7cQ6Q@mail.gmail.com>
References: <CADfYTpG8Jp6rkQXnAeRjyAf41jzrJa0sPHmc7K0gbR7=EigQNw@mail.gmail.com>
 <f197f55c-f7f2-c405-f3c8-bfbd5cd5e3bd@linux.vnet.ibm.com>
 <789e1bda-63d4-479e-bfa3-12bf1603ebbc@www.fastmail.com>
 <CADfYTpGNRJ3Yk6h7K4iw27jn4c4VqNKnHw0PLMHyG5h+O7cQ6Q@mail.gmail.com>
Date: Fri, 08 May 2020 13:41:38 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Nancy Yuen" <yuenn@google.com>
Subject: Re: Multiple BMCs in a system: IPMB? Redfish? MCTP?
Content-Type: text/plain
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



On Fri, 8 May 2020, at 05:14, Nancy Yuen wrote:
> 
> 
> On Mon, May 4, 2020 at 3:31 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > 
> > 
> >  On Thu, 30 Apr 2020, at 17:08, Deepak Kodihalli wrote:
> >  > On 30/04/20 4:21 am, Nancy Yuen wrote:
> >  > > I've talked with some people a while back (long while back) about 
> >  > > multiple BMCs in a system. Either for redundancy or managing separate 
> >  > > parts of a system. I'm wondering what other people are thinking in 
> >  > > this area if at all.
> >  > > 
> >  > > We are considering similar designs and I'm looking into options for 
> >  > > BMC-BMC communications. Some BMCs may not be externally 
> >  > > accessible. Here are some options that we've looked at:
> >  > > 
> >  > > 1. i2c/IPMB
> >  > > 2. usbnet/Redfish
> >  > > 3. i2c/MCTP/PLDM or something else?
> >  > > 4. internal network via switch chip/Redfish or MCTP
> >  > > 
> >  > > I'd like to reduce our use of IPMI so I want to avoid (1).
> >  > > 
> >  > > ----------
> >  > > Nancy
> >  > 
> >  > Hi Nancy,
> >  > 
> >  > I think it depends on whether the BMCs need to talk to each other for 
> >  > platform management, or if they manage their own hosts and we need one 
> >  > of the BMCs to broadcast out of band requests and aggregate responses.
> >  > 
> >  > For the former I think PLDM over MCTP could be a good fit. This is more 
> >  > of an "inband" use-case in my opinion so I'm not sure if Redfish is well 
> >  > suited. For the latter, a Redfish based aggregation is a good option.
> > 
> >  I think this looks like the right approach. Certainly some thought would be
> >  required in designing the MCTP networks given the (intentionally) limited
> >  number of endpoint IDs.
> > 
> >  Andrew
> 
> Hi Andrew, Deepak,
> 
> Sorry for the delayed response!
> 
> For the purposes of this discussion I have BMCs managing their own 
> host: BMC3<--->BMC2<--->BMC1/controller<--> external. I wrote BMC1 but 
> there maybe some other controller there that isn't strictly a BMC. BMC2 
> would be "passing through" information between BMC1 and BMC3. But I 
> don't necessarily want BMC2 to do any form of aggregation from 
> information from BMC3. For BMC1/Controller and BMC 2 we are thinking 
> Redfish. 

So to restate, you're looking to bridge data from BMC1/controller to BMC3
via BMC2?

MCTP caters to this but it probably depends on what transport medium
you were thinking of using. Redfish for BMC1-to-BMC2 suggests networking,
which starts to go outside the use-cases for which MCTP is intended.

Others might be able to comment on whether Redfish is a good fit for a data
bridge.

Andrew
