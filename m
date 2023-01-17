Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477B66DF4F
	for <lists+openbmc@lfdr.de>; Tue, 17 Jan 2023 14:50:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nx9J61Zvwz3cJF
	for <lists+openbmc@lfdr.de>; Wed, 18 Jan 2023 00:50:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=SjNQpClt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WYgAQrm7;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=SjNQpClt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=WYgAQrm7;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nx9HR1rgmz3c41
	for <openbmc@lists.ozlabs.org>; Wed, 18 Jan 2023 00:49:38 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 50F105C0175;
	Tue, 17 Jan 2023 08:49:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 17 Jan 2023 08:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1673963373; x=1674049773; bh=HvtIOT38PXy4pxOMiNMg+RYRC
	3Lcz7xviH4axulauXw=; b=SjNQpCltmdIzeLfsdPJj6EFqxcT/LK2BWY58kAM9w
	sWFNW5rRE2wfmGXO+EWwTioiaaNQgIjrjVBYhszBMwOwE94pF2JY+fUsFPZhX+9C
	Phq3yTwv0VX8Bdw+BLZ1o9tSs4qKPEhAfX42Nvl89R5fBefMo5vtQAmVLRf/J1Wy
	nXD2f3U+5P0/uYEBFmyErthqpHD70o9QZSR3qEznm5Up3kNT+UY3QiYPqQNSe6+t
	WZnUFV0LkQ/Hm25kc9CNjm5YBC0NteJ8zTYVCNZtyYXRk+hgzilcFQcFZS5mkel2
	Yr2gvmyZqFKS9XmUTS1j0XK6mRCaEQUiO7Avvr4E2330g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1673963373; x=1674049773; bh=H
	vtIOT38PXy4pxOMiNMg+RYRC3Lcz7xviH4axulauXw=; b=WYgAQrm70SITxqiV7
	L9SfXd21qYMWsy8FZiKmgt0ErXBLxoDDwSGyILZblsPGwlvx0PiCNyOUnha48w+q
	Ek8ZaReNVBit1pLqknv4A1Rf6yYPFky76V13Tg2Ax4sS7BySBphXsVVQVwfaY2t2
	cX+kMh0APFbwgkiqdnpgPl0HDHClMw6znLCla5oiaDWlc7Qe3h+vVrxUCeSzXQ6G
	rZaopVgnKDPQJQVT5TJ95FzaKB68TbTqVFjAMybqx2usQH5C1WxFvBTaNs3QcmNn
	sBqTb/+HO8ApO7hGhEPYkoDqg85v5gUgxsfwmoVf3J0BdRbGA983UCGNB9DE8AHs
	WJ86Q==
X-ME-Sender: <xms:bafGY76adAcklxSNa1Oqk0iCeIrgATklCcM3njCP4Gwz_EGIgznhEA>
    <xme:bafGYw6zyqIJbVj3pPMmwDczzf73Bxjk9cYaW5KYRFgrWTGcqrNHsnz0icosoD6TC
    rnCRmKEklxrFS4sico>
X-ME-Received: <xmr:bafGYycpdZnQ1mHutEbLcTE3YVdmDfDLyTbPmTey8NRypNJw11q0bxpxlEoYgtwCYQ_AafzDHgIcJL4N_zYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftgfgfgggsehtqh
    ertddtreejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
    uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnhepgeeutdefve
    egiefhfeeujedvieevhfekuedtkeegieefueelkeetkefgkeeuvdegnecuffhomhgrihhn
    pehophgvnhgsmhgtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtgho
    mh
X-ME-Proxy: <xmx:bafGY8L7sqBEmTyrQoVyXW8Q24u5XSNHbiO0L00q_ggywjmmfwsPUQ>
    <xmx:bafGY_JBgckHyGcafDkietcpkVc1uEwkcm3VycSd6RLILrAuJHyxTw>
    <xmx:bafGY1wcRxWHScoccmzZlR4mEKnd3nLSctSG7gUdWrKDlfZRuh208w>
    <xmx:bafGYxykmeAIRu9cpPWszNdv-Y6BH6MqKloMUPDW5JDRcQAJSEMXAQ>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 08:49:32 -0500 (EST)
Message-ID: <30aa9080cf78fc59814906cec5875f5224162af8.camel@fuzziesquirrel.com>
Subject: Re: BMC image generation without private key
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Lei Yu <yulei.sh@bytedance.com>, openbmc <openbmc@lists.ozlabs.org>
Date: Tue, 17 Jan 2023 08:49:31 -0500
In-Reply-To: <CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
References: 	<CAGm54UG=i8Ym-23N7R468xCsH3px5QAr52+zY+1MULBYVcf3Xg@mail.gmail.com>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-01-16 at 17:53 +0800, Lei Yu wrote:
> The OpenBMC build requires a private key to:
> 1. Generate the public key that is put in the image;
> 2. Sign the image and generate the whole tarball.
>=20
> For dev builds, it uses the insecure development key in the tree.
> For release builds, it requires the `SIGNING_KEY` env to point to a
> secure key to sign the image.
>=20
> It is considered insecure because it requires the build server to
> access the private key.

It depends.  If you just put the path to they private key in there, then
yes.  But the tools that look at 'SIGNING_KEY' support signing helpers
(socsec) and pkcs11 (mkimage), which can be used to get the image signed
without access to the key.

There is an example of this here:

https://gerrit.openbmc.org/c/openbmc/openbmc/+/50797/5

As you can see it was never fully reviewed and it was not accepted, so
maybe there are problems with it.  But I think the concepts/design
sound.

Thanks,
Brad

