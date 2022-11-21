Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B473B63283F
	for <lists+openbmc@lfdr.de>; Mon, 21 Nov 2022 16:32:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGBGP44n1z3cKj
	for <lists+openbmc@lfdr.de>; Tue, 22 Nov 2022 02:32:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=NedJwE25;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B4tqjGsI;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm2 header.b=NedJwE25;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=B4tqjGsI;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGBFn0v16z3bc5
	for <openbmc@lists.ozlabs.org>; Tue, 22 Nov 2022 02:31:56 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id CA2113200919;
	Mon, 21 Nov 2022 10:31:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 21 Nov 2022 10:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:content-transfer-encoding:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669044710; x=1669131110; bh=hryv+YV5YLXNR6bDfNrqtoLFu
	qdz8m5FMceTETSnWZw=; b=NedJwE25htR91hckLAwdLy2suIpDddWlZNpPBlERV
	K9ekI1J2lDreNkOoxK4TN8yzw6eEKKc45pBkFYA1o3t3nig3btNK5jmRwx/UfJhz
	J7N+OZTbdTO/MA0HpzxREK/axLiLRNTGy+2IWI4csQW5MLT/tUAr9CkVKfs7yaD3
	ULxntH13h6UKrsh9Eeh346M4RHsII+tMcvzRoVh3d1pAH6TXqCDoTqmUAlC09zdr
	y1z/Wyr5MQqokLuFbSEKxSUs8Fz8lGdtA5AK7TkWkioHw2AXvdPXxB73NBsc3z0E
	Ooo2EVyyB5A8huYhidIfWWtLOrGhsatHPuR50Sn8RSc8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:date:feedback-id:feedback-id:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1669044710; x=1669131110; bh=h
	ryv+YV5YLXNR6bDfNrqtoLFuqdz8m5FMceTETSnWZw=; b=B4tqjGsITXRPHQwjf
	Zzl8PPLjB2w/vyEfjd59gV8KWo/ZG5JZaPbg6ABx/R9V7xwsiouGzmRLvvdr5tmq
	IxjGaBWdHNYCz1opvNqqCKvCETx5NO+SbrDo8kMXF+GSY6N2UEhBSQStkVEKauLZ
	2SWAaEzqYa4o416Trnax+4VV5U5GGA6dkrn6iA3kdQZ8YwV2fRPcDcov5emzj97W
	bztKUpp+v5Y6SkNcle3lTTf7E7IinBp1Mtx1bNMsBrGp2iMEJ3UjD6obI/YuYote
	JOb+YSCHn+rJT8QbG1dQSn2mdKLRwO/EpfQ/Bjz8UaPQaLrX8VGmGex+sar9nh64
	ocPdg==
X-ME-Sender: <xms:5Zl7Yxr-BMVe8VDhrpmmNgjyyfOORmGa-1L_LengcJ5iGAgSYGTLqw>
    <xme:5Zl7YzqpWXMJi8bnaX65PMZFI4X5yexpccDa8zPxnJVetXuZHTHi9TuEKTacFsJlV
    WRh-90pfuC6uvINbes>
X-ME-Received: <xmr:5Zl7Y-OBD_AHm78c3fdqM9jEIF3Zc_fjagaevp9QaHrOalgLb2pH9Yju_lmf2VWfcB9d8PWIJz95yss2cDTy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrheeigdejiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeeurhgrugcu
    uehishhhohhpuceosghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeehffekkeeggeevgfffhfekfeegveefvedugffhudek
    veduuefhjeeklefhieefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghrrggulhgvhigssehfuhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:5Zl7Y86rcwGAJIcei7K3Me2RN6Z69qrmxwFIhIb04EYjtF4HfB7ERQ>
    <xmx:5Zl7Yw7_xswVc5_B2fUkALQEcHXwXV4uI9w3H0TnM6tXEu7QMEF3Cw>
    <xmx:5Zl7Y0jJr78HHIMJxZt5D4IcPX-qEEEf52_cRAMUPOa70SZc1jWacQ>
    <xmx:5pl7Y1jYx34HfUIceFhwnyX1q0apYUOG-vZ5aZT1nO4JrXRnzzeGsg>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Nov 2022 10:31:49 -0500 (EST)
Message-ID: <156b4bbc5ee066dcbc3f79bf40cf6cc299c7a6fe.camel@fuzziesquirrel.com>
Subject: Re: ICLA request
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Dmitry Ponamorev <dponamorev@gmail.com>, openbmc@lists.ozlabs.org
Date: Mon, 21 Nov 2022 10:31:48 -0500
In-Reply-To: <CAL_DK_hogTRL7xTn=BvsfDnGXKDdcD0B8J3KL_0v-NGqXN8dew@mail.gmail.com>
References: 	<CAL_DK_hogTRL7xTn=BvsfDnGXKDdcD0B8J3KL_0v-NGqXN8dew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
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

Hi Dmitry

On Wed, 2022-11-16 at 13:59 +0300, Dmitry Ponamorev wrote:
> Full name: Dmitry Ponamorev
> Public name: Dmitry Ponamorev
> E-Mail: dponamorev@gmail.com=C2=A0<dponamorev@mail.com>

ICLA accepted.  Welcome!
