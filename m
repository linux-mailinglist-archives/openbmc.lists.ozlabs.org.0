Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EABC294520
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 00:27:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CG7Xd3Qt9zDqgq
	for <lists+openbmc@lfdr.de>; Wed, 21 Oct 2020 09:27:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=QLbpD3tP; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Pcp4fBRN; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CG7Wj1m7YzDqdG;
 Wed, 21 Oct 2020 09:26:24 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2D30C580304;
 Tue, 20 Oct 2020 18:26:21 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Tue, 20 Oct 2020 18:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=tHKl5ShHGM26aw0ab4WfiwYyOOZYZHB
 qMfpsajmzAwM=; b=QLbpD3tPmAXiqlMlcnfoj1G+xvLNn4/Nil+G0dtaCoqPso7
 QEkIrTRQuRs8Km6UVvFRpYUNI03y9qluqo6feuVeoPHjTTeJTIgMDGNtMA+fiNvw
 RtVrsUjJha8Y6NR2hLP1KmSDVXxgTJXNsq6J3G0PrgCoporAxbxdpLAG3weXfil0
 shG7VOfkOIktACzcB6KYGxbUy0ZoIYR6kBRje2xaUUD4Vwfe039cu/h+N3QXYKjW
 zUCVM7d6VTgaawPkFLCUw0MqdVjAz3U+IyBGZQlXPKcx33WTFemMgG9ccyQMgXyG
 rJOiU82qSLpb4c2sqkTqsiOcL9Jl4G9st8mE1ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tHKl5S
 hHGM26aw0ab4WfiwYyOOZYZHBqMfpsajmzAwM=; b=Pcp4fBRN5WzP53LIltbB6A
 RCrwHSFFMcxtRgZyn22cxfBD91KT8CTJvw3ZtYltd5h/lAyoAUSZPJUrOEdDIMJk
 KKwDkTnH6JV/hTrCWUUDO0PjgXyqcVO89PZXZNTX0hlAajaW60vx3K/CqDEKNjvu
 NVIi9VUWnH4bLux9YCeflHx4Skvcn+xJP8NPXrC71cTwAi3DWZTVzMVPlF2zooOj
 60Qvc9tSMv/L2Kmj5jllocNWH4Iwf3YIuKJyI1G52K46oW8Klf128ZK5KVlSA/UK
 dLibWFO2uyW0LJJZGVN/SP+DjLmfLCXFoJgPhXBntr3fBJFtEgXRsGx9APOtPtjg
 ==
X-ME-Sender: <xms:CmSPX_gUf-L1UPw6y0av5ordukPIdNck0PfKlIYSwmESyfRk08GIew>
 <xme:CmSPX8DZiEmgGvf7Oc820uirfWnojZHJyRFQOhuEYYQF5BukLg4U4E98PRdRaBSc3
 N2FsoFe_8wR4EONZg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeeggddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeehhfefkefgkeduveehffehieehudejfeejveejfedugfefuedtuedvhefh
 veeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CmSPX_GOR3cRj2vqHIcdQJUZ8TvuLGcNgOdnM5p9MrSwci86sD5Jvw>
 <xmx:CmSPX8TO8xxC0Rq-MyJObu17quBCzefrUmDTX6Kqgt6Nxf4yV_lZ5w>
 <xmx:CmSPX8zlhjASxVZPkCHcmni-ywKMYJTRCAO48365DZLpAJoJE2rLeg>
 <xmx:DWSPX7kVLDW7DdFt4yw0_iOMwebenGfQEr8O1GLoOqclRx2XDpWerw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 36A4BE00A8; Tue, 20 Oct 2020 18:26:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-502-gfef6c88-fm-20201019.001-gfef6c888
Mime-Version: 1.0
Message-Id: <529612e1-c6c4-4d33-91df-2a30bf2e1675@www.fastmail.com>
In-Reply-To: <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
References: <20201019073908.32262-1-dylan_hung@aspeedtech.com>
 <CACPK8Xfn+Gn0PHCfhX-vgLTA6e2=RT+D+fnLF67_1j1iwqh7yg@mail.gmail.com>
 <20201019120040.3152ea0b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <PS1PR0601MB1849166CBF6D1678E6E1210C9C1F0@PS1PR0601MB1849.apcprd06.prod.outlook.com>
 <CAK8P3a2pEfbLDWTppVHmGxXduOWPCwBw-8bMY9h3EbEecsVfTA@mail.gmail.com>
 <32bfb619bbb3cd6f52f9e5da205673702fed228f.camel@kernel.crashing.org>
Date: Wed, 21 Oct 2020 08:55:58 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Benjamin Herrenschmidt" <benh@kernel.crashing.org>,
 "Arnd Bergmann" <arnd@arndb.de>, "Dylan Hung" <dylan_hung@aspeedtech.com>
Subject: Re: [PATCH] net: ftgmac100: Fix missing TX-poll issue
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
Cc: BMC-SW <BMC-SW@aspeedtech.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Po-Yu Chuang <ratbert@faraday-tech.com>, netdev <netdev@vger.kernel.org>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Wed, 21 Oct 2020, at 08:40, Benjamin Herrenschmidt wrote:
> On Tue, 2020-10-20 at 21:49 +0200, Arnd Bergmann wrote:
> > On Tue, Oct 20, 2020 at 11:37 AM Dylan Hung <dylan_hung@aspeedtech.com> wrote:
> > > > +1 @first is system memory from dma_alloc_coherent(), right?
> > > > 
> > > > You shouldn't have to do this. Is coherent DMA memory broken on your
> > > > platform?
> > > 
> > > It is about the arbitration on the DRAM controller.  There are two queues in the dram controller, one is for the CPU access and the other is for the HW engines.
> > > When CPU issues a store command, the dram controller just acknowledges cpu's request and pushes the request into the queue.  Then CPU triggers the HW MAC engine, the HW engine starts to fetch the DMA memory.
> > > But since the cpu's request may still stay in the queue, the HW engine may fetch the wrong data.
> 
> Actually, I take back what I said earlier, the above seems to imply
> this is more generic.
> 
> Dylan, please confirm, does this affect *all* DMA capable devices ? If
> yes, then it's a really really bad design bug in your chips
> unfortunately and the proper fix is indeed to make dma_wmb() do a dummy
> read of some sort (what address though ? would any dummy non-cachable
> page do ?) to force the data out as *all* drivers will potentially be
> affected.
> 
> I was under the impression that it was a specific timing issue in the
> vhub and ethernet parts, but if it's more generic then it needs to be
> fixed globally.
> 

We see a similar issue in the XDMA engine where it can transfer stale data to 
the host. I think the driver ended up using memcpy_toio() to work around that 
despite using a DMA reserved memory region.
