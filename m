Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5897D077D
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 07:07:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OI4NsVVZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBXd05vpgz3clL
	for <lists+openbmc@lfdr.de>; Fri, 20 Oct 2023 16:07:00 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=OI4NsVVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBXcR2kFVz3bgs
	for <openbmc@lists.ozlabs.org>; Fri, 20 Oct 2023 16:06:30 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-136-142.adl-adc-lon-bras33.tpg.internode.on.net [118.210.136.142])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1791B20052;
	Fri, 20 Oct 2023 13:06:27 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1697778388;
	bh=4uKBWsEHmLUMYORqg+MRE2TyucAojTP3Q6IQNqbWm9Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=OI4NsVVZ6mE+qMl4awSVXEoQQ9G71esugsl3qfRxhVQhNV4c5u2pfGce384VMPfZL
	 6bspOmDDjbEXMA8VkpByH2/+LOHwaHbBdeMScmrk2q1+a6zdraVVaHyq3hTlYU/iK2
	 OxLilK98uiTxLnZMG0Ul4RVPaGb35Qn6EeYs4haJAXITqWaGKRdaEVypTmAlm1nM48
	 azqvLrPNp20eygaSRCt7I145eRFk0eru7VGp5YtsCrvJIkyhNssG8+v6ZBLH3AJQw5
	 W2FVmNwcwNgcHPI2dz22g2GOr4Pzo5u6hsqzLGypikecdLHk8nlMZVdGwb70Rb3n1R
	 CooasJbp5+0Iw==
Message-ID: <7be0e5989986a85748ba2af7e1ee0014a20d658b.camel@codeconstruct.com.au>
Subject: Re: D-bus model proposal for pay for access features -
 LicenseService at OpenBMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Sunitha Harish <sunithaharish04@gmail.com>, Brad Bishop
	 <bradleyb@fuzziesquirrel.com>
Date: Fri, 20 Oct 2023 15:36:26 +1030
In-Reply-To: <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
References: <20210504233843.hvuvmebaznanqnlv@thinkpad.fuzziesquirrel.com>
	 <YJLXlNyk/c8IVf9e@heinlein>
	 <0af0324d-c8a1-4ce8-80c3-f8f846cc930f@gmail.com>
	 <ZR_9p11_v5wQAOKB@heinlein.vulture-banana.ts.net>
	 <ub2mniaycgyvj6ujfwytknyvhrscnjgoewxjtvpgq37znlxszf@yzvbxgnre4iy>
	 <2736a0cbaf79f00617a8e55a962eea505ac7a7ab.camel@codeconstruct.com.au>
	 <dr2sdq6xt52ieidkgdit56uew5bgo2tedlk5e4uee3tobcez3x@t3mhaemftllv>
	 <0a4277122b61695d802c25d089533d1bdefe64a8.camel@codeconstruct.com.au>
	 <nsa67efkmr5y7v66ox4zcmrqz6h6jewbw47qarad4t32ubnaoh@ayzfcex6kpre>
	 <762c3491-93df-4ac4-9a44-a3fb1b448936@gmail.com>
	 <7xefpmuelqu2nv6iwkpaqqgeomdp7ru4uywejmqudeao7f5rbl@hqnhwttquefv>
	 <3fbaa94e-391d-4d3a-95fb-259503e94dd3@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: raviteja28031990@gmail.com, Ratan Gupta <ratankgupta31@gmail.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>, gmills@linux.vnet.ibm.com, abhilash.kollam@gmail.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2023-10-19 at 15:56 +0530, Sunitha Harish wrote:
>=20
> More over this new meta-oe work will turn out to be costly.

It's a bit of a tangent, but I have to ask: What's the basis for the
assertion that adding a recipe to meta-openembedded or some other
upstream layer will be costly? That's not at all my experience or
expectation.

Andrew
