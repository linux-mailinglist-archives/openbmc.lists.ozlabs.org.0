Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED36743D1D5
	for <lists+openbmc@lfdr.de>; Wed, 27 Oct 2021 21:42:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HffGx5LQRz2yyl
	for <lists+openbmc@lfdr.de>; Thu, 28 Oct 2021 06:42:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=hyRJYjU4;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=ayXrhFej;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=hyRJYjU4; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=ayXrhFej; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HffGX4hJjz2xXq
 for <openbmc@lists.ozlabs.org>; Thu, 28 Oct 2021 06:42:12 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D3E35C00A1;
 Wed, 27 Oct 2021 15:42:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 Oct 2021 15:42:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=zY+ODzisgXnf6l194CJdzSSWHi
 df87IvVBSixWmts1Y=; b=hyRJYjU4W3NJ/kMDZFwoLSJSLUX7s5+ODs/sUqusI/
 sxZctAr4zov67lxTtLr0a2Q7BiJe1XwP86WaJ4AGWP/LuNsSQc8MA5DpLpOGlxXN
 r6vc7uzhlLcZ/wVlcRgXT1OV3hmIkXGJozx8P2+hQuO3+v0VmeUHci9wb1fXqZfA
 gec1B1VmWDwM5I2WaP+8kS+8x40cS+HQtXN1JduXAjYFb1xjaKCVduLoHYebUs/U
 r0jXayeicve9xVQ9UJtuUBAAFdH+ztwlMIIRTtD1I3BteniQ1p2ITYaibSd+KZ1x
 PSd9yTWp0+ce4agw/Lse/C1i7TaXLsJwBHmTTLqNZ2WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=zY+ODzisgXnf6l194CJdzSSWHidf87IvVBSixWmts
 1Y=; b=ayXrhFej7Y/8JE2mbsl0v+729j0aoLIlfj7fTx8sbzGbByxdASa80kPs2
 J/EIG7fcKHDXZhDAINVY/AMjHBIIgxne55JeOMCTXZlzlIhd84C5+mH4YqW+m9Ac
 E6DZO7q37k9gQ/90hVmaJ8oMzh0zKjT6VTn0XO9ZxOcrHZ0z7lI5MBExDpwrBdB1
 cKLSh4pXeex/PurnzQpim0XLuTYkh3ZMD11ZNn/0DulRonusdlB2G31J7/Jf2OHf
 0zkF242szEpdce6dvb+PcuHYv3Bp7FSvg8ji7eBbQ6C/7okSzYFgBmxtETFplbkX
 VDZyL9WKqlsHBQgSRl3tbI6kC4nAw==
X-ME-Sender: <xms:kat5YWGfesBdrMQ6K5PRg0xPYXpaskNN7MTLQnPqv9mRcTPFoJR0qg>
 <xme:kat5YXUeyXL4Fa5A-CGRGFgwRO--Uq3nHmJxLlFWTKknyGBAi7-MC9Nt9aQjEHuBg
 OEnGrnVVibaVeosCzU>
X-ME-Received: <xmr:kat5YQJuOxJD9_PuEYNp_DuPboBVY_ttiVrouwBdsv5CH7rlaeJN5KEgVH8xwPixwsmrAL0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgr
 ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homheqnecuggftrfgrthhtvghrnhepudejfeetkeegiefggeettdfgjeelleeutdehhfet
 hfetudefkeeuieeifeefgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:kat5YQEP35LmGjj5Sy2a1jMO1iznv--yidWRlPZZg_ixWIXiHBRtqQ>
 <xmx:kat5YcUNpN9LxcGMB2mVl5jl-pu4HIsDXj162j-Wtb1htm25ZqFTLg>
 <xmx:kat5YTN3u6VDGUxOx6XpZ9nA6cMEtl-Ly2qolNwwGUjcAmvsBAHugw>
 <xmx:kqt5YTRwOpkXRmZ8LU_svtuqdRtnydcZxdEh4ZnDXA0s2fcHtXbHYA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 15:42:07 -0400 (EDT)
Message-ID: <f53a303274f21127c3214d9aabfb0793b5a499af.camel@fuzziesquirrel.com>
Subject: Re: Start using github security advisories
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: "Mihm, James" <james.mihm@intel.com>, Bruce Mitchell
 <bruce.mitchell@linux.vnet.ibm.com>, Andrew Geissler <geissonator@gmail.com>
Date: Wed, 27 Oct 2021 15:42:07 -0400
In-Reply-To: <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
References: <62b15edd-110a-3574-66c5-d11299bbd38c@linux.ibm.com>
 <67C8A5BA-9FD5-4804-B5CA-C2687FC17889@gmail.com>
 <20211018184958.zajwqmloxsyxmxv2@cheese>
 <cd2f6175-475f-0e5a-0b65-4f7a12959ab6@linux.vnet.ibm.com>
 <DM8PR11MB56387B6B7713360A95C7959090859@DM8PR11MB5638.namprd11.prod.outlook.com>
 <79311a65fd6e30f18b0fb038b1906fe5ec015466.camel@fuzziesquirrel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-10-27 at 15:29 -0400, Brad Bishop wrote:
> On Wed, 2021-10-27 at 18:29 +0000, Mihm, James wrote:
> > Brad or Andrew, Can we proceed with the creation of security
> > repository so that we can run a couple of trials on security issues?
> 
> Hi James, thanks for the ping.
> 
> The only reason I haven't already done this was this comment from
> Bruce:
> 
> > > 
> > > I believe we want to make sure that none of security advisories
> > > get sent to Discord, wouldn't want to accidentally be going to
> > > something like #gh-issues.
> 
> This was a good point and I'm not sure what to do about it.

Hi James

I created the security-reponse github group and the security-response
repo just now and made it private.  Please do some testing and make sure
issues don't find their way into #gh-issues on Discord.

thx - brad

