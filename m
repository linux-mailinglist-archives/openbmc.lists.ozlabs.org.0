Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B3E613B03
	for <lists+openbmc@lfdr.de>; Mon, 31 Oct 2022 17:11:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1J7K5qGFz3c8V
	for <lists+openbmc@lfdr.de>; Tue,  1 Nov 2022 03:11:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=QAp8c9xx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N/kmd/C+;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=QAp8c9xx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=N/kmd/C+;
	dkim-atps=neutral
X-Greylist: delayed 411 seconds by postgrey-1.36 at boromir; Tue, 01 Nov 2022 03:11:07 AEDT
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1J6g5J0pz3c5D
	for <openbmc@lists.ozlabs.org>; Tue,  1 Nov 2022 03:11:07 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id C8A623200961;
	Mon, 31 Oct 2022 12:04:12 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Mon, 31 Oct 2022 12:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm1; t=1667232252; x=1667318652; bh=gZSW7lQOg7Ihb+4VJ7uK8sTXw
	dn5T4m3v8aG8q17DWI=; b=QAp8c9xxV7CSktwyu2oxQ/oWXnwVqH0zw3Qmfd3Ib
	8P2Qt8FqhUO+0icVboI3Enik7yU8SIZpTZvTUE9fzQQlfWDRzVjSNekfaQ80596o
	SaDK1U40rlHTlXgDU3yhsDWs8+nTWGzN+NomgcpFHmDWhxiDH7KYR3UWBpnDOoab
	+f5vOIhc9qAMlSNhFiw7KorfOcMXZu068qPJwXwi/NsaDiSdWAbDbfuqYdxQYodl
	9XlNMsSf+xVluL5eJ9rjzjrhjXO8AAdrB3hrw6ug79FxMg8c28x4tEGhJGFz8rUG
	HJpb2wWMTJ3j8TIVEYRZoNYfV2sevfW5yPP3oSOe2KoGA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1667232252; x=1667318652; bh=g
	ZSW7lQOg7Ihb+4VJ7uK8sTXwdn5T4m3v8aG8q17DWI=; b=N/kmd/C+yueVWvU/F
	3dHgkM3MLVWY4qpmKMaXqgB3IfzOyHfzt8twCiHjrO4QEc/JHhCIc+O4WBawkX9z
	cyBwX9DNS8AQ/MhdXBNseb3ObGBftGpMJWmwpGtg0G+k7ha+91X4cTF2c7EGpCbH
	oUVAQ6x+nAhVD80eJsVZRQGVVJ7c1R+4qm6bJhouRNM9LZ8nwxbV7uMRJURfpYBZ
	EgfwyeQOk6GJeQ4QL8cEDBt0rGBm3y0Z6rHOSCdWEwzT4UktK/cl7rxECkGpGR93
	T/G5C8ysWSHyGihOj12VCcHMMlJtkcgCcgNrsJoL88Dt886pSs8sTFPox0NJ6Pm7
	5jMkQ==
X-ME-Sender: <xms:-_FfYwxAFKrpub6q5lWPWGOteS6wMl2XddgkvvnpBRtbhNkrVhSwWQ>
    <xme:-_FfY0QpMFfK7T-bfN08W2qxS4Mlcpq9l6BtGyh3z24-Z_H_EDJXhtWLk7XQQQk5_
    dZugk24W2ltk3J8s38>
X-ME-Received: <xmr:-_FfYyUCpV5L17g_XcxbR7Ycs-hnsHhTLjS-MXaDIarPDZinoZ9op_mlUdue-om3SS7YFf3T2Uy2ozrHhV-a>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudefgdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeehffekkeeggeevgfffhfekfeegveefvedugffhudek
    veduuefhjeeklefhieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:-_FfY-iTLuHOGxloR_JZBrbZw_LgLpMO4rMJsK1kuu-gI4_yTm4JZw>
    <xmx:-_FfYyAu2381bd0tbaujPMIlr7RKtd2TyQceO5Y-P0PnUDiRyCeCww>
    <xmx:-_FfY_L_KSKG1qTFVtWr3Wbxir7nviVCJYOTdrJxkzy_blLClP4zHg>
    <xmx:_PFfYz40vYg6fC-CLzFEVzWYr85_ElafNtoGbUfnH0FKMcn1dFtEww>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Oct 2022 12:04:11 -0400 (EDT)
Message-ID: <98e64d12efcd50c8b122f2e4433d5fe1344d0451.camel@fuzziesquirrel.com>
Subject: Re: Inspur's CCLA Schedule A update 2022-10-27
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: George Liu <liuxiwei1013@gmail.com>, OpenBMC Maillist
	 <openbmc@lists.ozlabs.org>, banht@inspur.com
Date: Mon, 31 Oct 2022 12:04:10 -0400
In-Reply-To: <CANFuQ7CiAn5XrpXkxjqHOXoLmVMEGz4QHMHbkVuqU5+nwcin=w@mail.gmail.com>
References: 	<CANFuQ7CiAn5XrpXkxjqHOXoLmVMEGz4QHMHbkVuqU5+nwcin=w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 
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

On Thu, 2022-10-27 at 11:07 +0800, George Liu wrote:
> Hey Brad:
> =C2=A0 Attached is the updated Schedule A of CCLA from Inspur.
> =C2=A0 Please help review.

Hi George

Can you send a revised version with yourself listed as a CLA manager?=20
Otherwise, please have one of the existing CLA managers send the
Schedule A update.

Thanks,
Brad
