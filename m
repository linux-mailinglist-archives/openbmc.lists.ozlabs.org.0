Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CA167B41E
	for <lists+openbmc@lfdr.de>; Wed, 25 Jan 2023 15:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P25b1422Rz3c6s
	for <lists+openbmc@lfdr.de>; Thu, 26 Jan 2023 01:20:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jv6f3Tdc;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BtMIXdyY;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=jv6f3Tdc;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BtMIXdyY;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P25ZL2ffXz3bW2
	for <openbmc@lists.ozlabs.org>; Thu, 26 Jan 2023 01:19:37 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id DC11A5C01E8;
	Wed, 25 Jan 2023 09:19:29 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Wed, 25 Jan 2023 09:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1674656369; x=1674742769; bh=aK9U8WTn97
	NPebT51/cFuo3wwkACC0fVMEQTckx6J5U=; b=jv6f3TdcGCCKOTvBUoMPHcVATX
	VCWzmgHjs2TF9GTjNDZZwj7/WUBiVnAdfNwdIsbBN1SODlWewJcQndj7pOsOgoms
	cnd0S92aUpxr/U/eITxrJfS2gTAFRRpi1gsTHxnCiIbv2FAFT7hhy3p66ZWlJlU8
	rxJWFK9EY+KnZdvVpeSEPKMOdrQ9StoFs5rHEwWvz4+dfMGBrIk/rO0dOhj430b2
	3hQYtyTAq0mn5T471C6S4q3k0Tz26xIxmh5puujg++mEbU3NbCzCDolwFJokyKs0
	pGHZE2ptyhidP1pP0eIzJJ2XSQIUEvyVGfE4OKfYnwoST+dyCoJ+f+Ged2HQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674656369; x=
	1674742769; bh=aK9U8WTn97NPebT51/cFuo3wwkACC0fVMEQTckx6J5U=; b=B
	tMIXdyY9qLWYXlW9haoz3USyOO5FyVnPqPAn11XpsSQBwiatzevMepVzzzIhdC3h
	DNWA+PeQzXKaPbYzseJP9IH7EDf5DC6EymEu/ryjQsFQblpOSZYPULLTthGaKrH5
	kZRRATWDWTUYxmzIAcIhmQyc1EVqsiUhvONW2ZKNgGILOd0wjkQiZjeE/ahtptl9
	C0ItTEBBSSte2todUwKicSUR8Dm26QuGXqOqDbZL4LOAJK9JZxQ1zqyjMZ7hQw7V
	2dAH4YN+JY860A6zf5F8W6GZldkarumKXDHQw/kISB5osP1+0nAPNM4nb611rFj9
	Hi54k3qtZYbykSwqRN97Q==
X-ME-Sender: <xms:cDrRY5EOio3sBviGsdFjV1zvLrswnqCcQkr6E2MKogOENWR6TDjvrw>
    <xme:cDrRY-WVgMB8Tj-Q9L8_eCinrq6GOsjcwIEyZcbAIr15tNjJdRplfOKQsBxdJ4A9n
    HvRM30y9oL0qBPZ5qA>
X-ME-Received: <xmr:cDrRY7Lo5zkrk2KEGAB768Ac04JHvwKGatcOHYdlg3fkRtGbZ7MHypY1cZcWIFAu05MIXlJHHDtDH27iuw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvvddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkffuhffvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgr
    ugcuuehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtg
    homheqnecuggftrfgrthhtvghrnhepgeetkedufeetjeehveefheektdeifedvhfeilefh
    ieehvdehvddtudfguefgieetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:cDrRY_FrySdZuYCuVSXtcb_ouJpqukAD37VUiPaRJ4mwQ9AxlQlP9g>
    <xmx:cDrRY_U_LaQw6eBD1EUvL5P5AH3KR_BLKoo2WtNdQDOqGQdJ_fyn6w>
    <xmx:cDrRY6P1fHvyeKeHfu2rDbj1sRohsSSUVKTweSTIE0lp1MDspCIayA>
    <xmx:cTrRY8h2wmqcnH0z8B7rr8j__KVPGTnPVeZ2sQ0tzskMVBNG2CqzPQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 09:19:28 -0500 (EST)
Message-ID: <95728b20d9dc6ba47b57f903b7be34b3d3610171.camel@fuzziesquirrel.com>
Subject: Re: Alibaba's CCLA Schedule A update
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>
Date: Wed, 25 Jan 2023 09:19:27 -0500
In-Reply-To: <34f330f0-7545-f596-7736-5e2d4bea385c@linux.alibaba.com>
References: <34f330f0-7545-f596-7736-5e2d4bea385c@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 
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
Cc: openbmc <openbmc@lists.ozlabs.org>, wangkuiying.wky@alibaba-inc.com, zhibing.lzb@alibaba-inc.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-01-23 at 11:41 +0800, Heyi Guo wrote:
> Hi Brad,
>=20
> We'd like to add Kuiying Wang as CCLA manager

CCLA accepted, thank you.

-Brad
