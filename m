Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF234429581
	for <lists+openbmc@lfdr.de>; Mon, 11 Oct 2021 19:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSlwM60JBz2yZ2
	for <lists+openbmc@lfdr.de>; Tue, 12 Oct 2021 04:22:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=bkaRPCjr;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=kin+RAQ2;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm3 header.b=bkaRPCjr; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kin+RAQ2; 
 dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HSlvs1lchz2xfH
 for <openbmc@lists.ozlabs.org>; Tue, 12 Oct 2021 04:21:44 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A8185C00C8;
 Mon, 11 Oct 2021 13:21:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 11 Oct 2021 13:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=content-type:mime-version:subject:from
 :in-reply-to:date:cc:content-transfer-encoding:message-id
 :references:to; s=fm3; bh=nB6EmuvPxZHkHQCVca1fhv2At2uQjR0HLLPnMh
 eHWM4=; b=bkaRPCjrgWWt+EbmUZ40dQMHA0THD7eeux44Fn1f9y8E9BfUNe/BRD
 ggt4OvqL6w47FvHn+3gDU6vS+IQuH2HXx+DsEJaRebTQffJ6VXduoEJKuYd7Nxl8
 V9DRnZwlAdlnf+bWyVQlZwonbVlYBuC/ZCOc9p8xMoleRzD6pfysmjpu0SUHmqKQ
 i890a3g4XDpXVmWQsbUJAzeoQyhqa8PGaJRCZwJ86ScuM5+C9uGfZA3p/mnN/EyC
 e7mCzIjftwt1r3h1yc5r8snjj+B63Y79U047CM+kSv6DXPmnDH46ISxkbRjFTK3R
 PnyNkr9OgEimRIals4Oz5VS1DfzcuxKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=nB6EmuvPxZHkHQCVca1fhv2At2uQjR0HLLPnMheHW
 M4=; b=kin+RAQ2+B6A5jSTs20wCk8fS2uyxkFUbC89B5ifAgHJXLDg1nT2yo1iO
 +1lt+NcQnH4a//hAP4aGva2kgPu7CIXJnOWqa8UswvVCWXd6OWP/tQbDyKV0eDQJ
 rGvTHGgzyirXpagJ31xvOq/blN2tngbiYvF/qVMrBDQmk8yQZUaL3zaR9R9bHQGl
 KpXldgBYEQ/1ShK1SBMqVQiwuFap6mgptFzBycMUT097dI74RJmOmuJWX9pLvpHo
 Yzh28R9qYxzoLD7AMh4xen/rUcgRR67kULMkAuvFN7Oigzsn3ciy+bkRhTPyPwsi
 igNJSZH2GnM/0hBJcL/kccRppst+g==
X-ME-Sender: <xms:n3JkYaOXKmr5hpGcCqoKdERgZU5SKTlRjxN25nw2VCVJthwCfRtYrQ>
 <xme:n3JkYY8emeS9D9EQZ3KA_q7n9aRm9N5Jgi5vIxhE5-3OJPyPWhYyQZT7UxLXEfiVM
 mURCDVsAQqMyKXbmNw>
X-ME-Received: <xmr:n3JkYRTV2guZS--N3i1_8UhaFAf9I8hZnWdG9HktJNuErGQYvxw9n1Z4zE4a268TWfrU6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddtiedguddtjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpegtggfuhfgjfffgkfhfvffosehtqhhmtdhhtddvnecuhfhrohhmpeeurhgr
 ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
 homheqnecuggftrfgrthhtvghrnheptdethfdtgedufeetgefgteeulefgffeivdehieef
 hfdtgfelvddvheekgfefueefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
 hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
 mh
X-ME-Proxy: <xmx:n3JkYasd8LKuyLFPH6BbwoQDeUCF977rNTNI3ZsH3AiQEs8lWXRj6w>
 <xmx:n3JkYScIzMotIF2p7KorG1Qx7OFyzhLume824YjRFfYnPVGlvvRz8g>
 <xmx:n3JkYe0eDX-xVncD9JQ49DUx8LjQjpqQJFDm_VPn4JNRn1WmOLyuAw>
 <xmx:n3JkYTpTywAZhOalZy3qZcbtkBICBpcrz3_SZ2STx1GRKGyqb7CCGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Oct 2021 13:21:34 -0400 (EDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: OpenBMC
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
In-Reply-To: <BY5PR04MB642185E5B4FFBAFCAC253259DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
Date: Mon, 11 Oct 2021 13:21:34 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <C24B224E-DDEA-4573-9090-49EB4FD602F0@fuzziesquirrel.com>
References: <BN6PR04MB02751CA806D404FA7CA19855B9819@BN6PR04MB0275.namprd04.prod.outlook.com>
 <BN8PR04MB6164B5E8966F9438F0180DB8B9809@BN8PR04MB6164.namprd04.prod.outlook.com>
 <17a3b0e5-4613-8388-ad69-427c41439343@gmail.com>
 <BY5PR04MB6421D6EB8BF4D9EB43BE0024DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
 <BY5PR04MB642185E5B4FFBAFCAC253259DCB29@BY5PR04MB6421.namprd04.prod.outlook.com>
To: Janny Au <jannya@hyvedesignsolutions.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Phil Yeh <phily@hyvedesignsolutions.com>,
 Eric Kuo <erickuo@hyvedesignsolutions.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Oct 8, 2021, at 5:12 AM, Janny Au <jannya@hyvedesignsolutions.com> =
wrote:
>=20
> (Sending again for clarification...)
>=20
> Dear OpenBMC team,
>=20
> I am the current CLA Manager for Hyve Design Solutions.  Would you =
please help me change the member list?
>=20
> Janny Au (CLA Manager) <jannya@hyvedesignsolutions.com> (removed)=20
>=20
> Phil Yeh <phily@hyvedesignsolutions.com> (new CLA manager)=20
>=20
> Jennie Ho <jennieh@hyvedesignsolutions.com> (removed)=20
>=20
> Luke Lin <LukeLin@hyvedesignsolutions.com> (removed)
>=20
> Regards,
> Janny

Hi Janny, please just fill out the Schedule A page again and send it to =
me.

Thanks - brad=
