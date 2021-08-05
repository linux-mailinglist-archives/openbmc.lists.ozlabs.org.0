Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A943E15E8
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 15:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgVFH2SM0z3cXV
	for <lists+openbmc@lfdr.de>; Thu,  5 Aug 2021 23:43:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=VCoP3wIM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kaek2XDR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=VCoP3wIM; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=kaek2XDR; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgVF20zBJz30R3
 for <openbmc@lists.ozlabs.org>; Thu,  5 Aug 2021 23:43:33 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BCB3F5C00C9;
 Thu,  5 Aug 2021 09:43:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 05 Aug 2021 09:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:cc:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=ULcjWCgpKx1FE5uDYkBHiAk4t+
 EVPpvY2dTejKhwLEc=; b=VCoP3wIMLOMRZAaDXjUPkTl3rM1TMqxLN7CSTQm0lb
 kwpo7eBv/INyAAV9XCd07pkcN/kU2x06sLYdAj47wJZ3QtUqTEmQzui6Tx9N2+28
 lQdZRHIWF8nD1Q+1SCTfN5oCoXn/5lCLVNGgJUSj5izL16H5aFMmyAxk3DfwOa02
 +UA+InNa+Yh1QS2harBKaNkReS6yFXkVabIiR55T9jqRRsdUJ9uwAqmDE2GmNlPe
 HxkYfn+/dtx4TrLNVuobGXQQmPCK4bGXz8+VJDGG326PnQBfCHXJNFYGt7usvXPS
 z9FRj+7dNnKncO9WBjn4NSwVt2tC20YavdXNG1JtHggw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ULcjWCgpKx1FE5uDYkBHiAk4t+EVPpvY2dTejKhwL
 Ec=; b=kaek2XDRih9wpz0ZBXsAFGA/hMUF4mm28MsjHmQbI7+5kgGb1JW4fqje6
 EcCraq3K6/qsTbT4zE0vY43JLoINZ2knYHZHeHR3VdceZ5LX0J1+fGhojBPOldqH
 u5E5mYDG5BxXFS9L8KW56aZKj/fuDBxN9HDWaeQwsI9bf/QlCzfNM0vfU83ni/FO
 d9BvJaHn7UEB4MuyMmsQ5Pb+pmEYzxMw9tMPLJlVmzVIDRu8JsLNUuDbstx7VlTt
 Qvt7mJMVA+2OY727eJOeneRU414by77o3IzN6vdlvQjugZCLklS73vuumKNdB3k2
 /IEr3Muil36vn8sNeOmnKtrQtYVNw==
X-ME-Sender: <xms:AesLYY5jFyGoptMEVN8it4VOmFRL0WBjVhnE7YJdgJwBObTb8Ta-Hw>
 <xme:AesLYZ4TRU3iOt_7hOGZbp7kfrk8pF1GilE9tHExA2PEbAnR_PD29FFX1APZWkR3c
 ukLIZ5uHBaBp-OFi1c>
X-ME-Received: <xmr:AesLYXemEQe5RV9Df-m7lReyzSUXBUn-UhIKWblBHGmbE3I3Iz57gzU812thxcvwZ_Byu2M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieelgdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpeeurhgrugcu
 uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
 eqnecuggftrfgrthhtvghrnhepudejfeetkeegiefggeettdfgjeelleeutdehhfethfet
 udefkeeuieeifeefgfetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
 hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:AesLYdI2qsp3_-TB9siAXyqKfKUkmTsw30NGTEldNP-yQxxiZ2mLEw>
 <xmx:AesLYcLHlRmNJeDhh_rxcO3SgPpBYcmHfnE0ObgsqRnDRz-qxKkGHg>
 <xmx:AesLYez1_Fm1VCez1FnfWVNKS-pcaj8laNJQQVMy2-3f8feU_WGPoQ>
 <xmx:A-sLYQ2tHbtt9N6Haff7f8q6WU7OjSE3QOvphSxNPkTsaBA7vAv4Aw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Aug 2021 09:43:29 -0400 (EDT)
Message-ID: <8b94ff1ca846b6096f2b537c2d4a78cc272e87e1.camel@fuzziesquirrel.com>
Subject: Re: Security Working Group meeting - Wednesday August 4 - results
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Joseph Reynolds <jrey@linux.ibm.com>, James Mihm <james.mihm@intel.com>,
 "Sekar, Suryakanth" <suryakanth.sekar@linux.intel.com>
Date: Thu, 05 Aug 2021 09:43:34 -0400
In-Reply-To: <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
References: <89b3524f-a1b3-513c-fc6a-1d888e479238@linux.ibm.com>
 <638695c3-c0ac-1249-d3d1-fe2cf439432e@linux.ibm.com>
 <YQr0E+NP+7QKIrf1@heinlein>
 <1fb3f67c-84d1-a84b-c44f-a9c2774cfd9b@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.3 
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 2021-08-04 at 15:39 -0500, Joseph Reynolds wrote:
> On 8/4/21 3:09 PM, Patrick Williams wrote:
> > 
> > Can we please create a private Github repository and be done with
> > this topic?
> 
> I don't have any insight into how to resolve this question.

I think the first step is to bring the people actually doing the work
into the discussion.

James, Surya

First - I appreciate you setting up a security database on behalf of the
project.

> From today's meeting: using bugzilla has advantages over github issues

Ok, but now several community members have voiced concerns and
alternatives that address those concerns.  Can you please engage with
them and either consider the alternatives and/or explain why you don't
think the concerns are relevant?

-brad

