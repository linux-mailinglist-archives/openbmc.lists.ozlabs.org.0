Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5646C21D7
	for <lists+openbmc@lfdr.de>; Mon, 20 Mar 2023 20:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgQG35xLbz3cMh
	for <lists+openbmc@lfdr.de>; Tue, 21 Mar 2023 06:46:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=uDHVQrSM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JisP7dIu;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm3 header.b=uDHVQrSM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=JisP7dIu;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgQFM3TrZz3cKj
	for <openbmc@lists.ozlabs.org>; Tue, 21 Mar 2023 06:45:26 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 238665C0148;
	Mon, 20 Mar 2023 15:45:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Mon, 20 Mar 2023 15:45:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	fuzziesquirrel.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1679341522; x=1679427922; bh=gK
	sOCY7m1/0HsEIdHaZm7PHEpNYnPC85sBAQOxXtSz0=; b=uDHVQrSMebpEsZyLed
	KtfdXewETnIhdNxxU5GxOIX46r42GoMA3HiYD0InOYMOkf458UTA6zDPbAlHTK05
	KYJJ/swHn0jn+ObVHW5z0ZfMTLHSvHHgfnsce7RovfMzw/ylvrMZCAl0mGzkSvlw
	q1xU405kamITDFypvyfgAYC0unrjWrRqkINnva2mNKGc2nx0JYQlsEW1hWdE/f1j
	yfOwV0phWJIkk539aUDahWDW9UA7qt4B31P1j/Jm4FAuFLPiZe+p2ORNiD5hSYUL
	1qiOFHftrdqfASIDutG4seE9dv9cnQ7AJtHF9pdn1W9s87boVJ4pydge63bVC+GY
	9bRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679341522; x=1679427922; bh=gKsOCY7m1/0HsEIdHaZm7PHEpNYnPC85sBA
	QOxXtSz0=; b=JisP7dIuawtiz//YP8lNJL1qIWE88MS6wCi/fqV9uul7bnmzWwg
	nfwUYyJryqSZ5zNodqArV7fE1mB4Oe3GSZUOXHn6CMANL2HQCoP7YP4vqA0BMneO
	DvY+9WeLisP1R4hL36tncntEW13pmMcm7wvlIzpn1DitHOvQPsAdxL4yqFhVWaw1
	ZAzGPGXH0hUxf4Jq8eSWM17iSW+vvTsUHEcUGM4gNQn+iF0XWJBiylbjIMlWYTsS
	Pdgfq0DBLb84DiNNpA6Tlwe2aokTU9PA/2H0wgWGThf57CO484Ix4bD/H5R1zjzY
	IphjVfOi3hzdT6We5IW8R8aMdFTDU7cGbuw==
X-ME-Sender: <xms:0bcYZM1kAALWmbsR_g13yOQyFtu3GwP-seblA2tht6jKCivSiAs2UA>
    <xme:0bcYZHE1rS8FMnKLJXkLqH8aYrcHjMNC078ArFY_HGog5Y3v6RvAJTfyRfhRIzg9N
    2T0333MogHvp80G6c0>
X-ME-Received: <xmr:0bcYZE6fTyQ7IIlmUoE6UFBV03AloHYy6mdO4-U3dLdJQgV8QASuQIE-l73HPAl8ASguipiI5eL-xIjJEG-8kDvS0_7-p_2IFpmx7fzz6NbS6aCJA5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdefkedguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomhepuehr
    rgguuceuihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegteekudefteejheevfeehkedtieefvdfhieel
    hfeihedvhedvtddugfeugfeiteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgt
    ohhm
X-ME-Proxy: <xmx:0bcYZF1U0sOYaCTX2WHZNXyxez6igrcoYU_AiYyzo6lLaplJlEWR0w>
    <xmx:0bcYZPE9WQAHAgsmvk-5KPh0gWdRV4mXevYlKhtb3wIVJjctqyb25w>
    <xmx:0bcYZO-BuOzoQBZzaiNrF7_3uMU6jRQrsGrJqvRnNJfmhYvEfmyidQ>
    <xmx:0rcYZCMYyMIi6rXyU8EUoZZ54i8lxu6xCAqFTb05RFRvco8SPeGyFw>
Feedback-ID: i02c9470a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 20 Mar 2023 15:45:21 -0400 (EDT)
Message-ID: <f93b92cdf5eb0066d3f1e48fa4d88539c29e5977.camel@fuzziesquirrel.com>
Subject: Re: Quanta's CCLA Schedule A update 2023-03-20
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Litzung Chen =?UTF-8?Q?=28=E9=99=B3=E5=88=A9=E7=90=AE=29?=
	 <Litzung.Chen@quantatw.com>
Date: Mon, 20 Mar 2023 15:45:20 -0400
In-Reply-To: <TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
References: 	<TY2PR04MB3952B507D338A69F62D05C16F1809@TY2PR04MB3952.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mon, 2023-03-20 at 07:19 +0000, Litzung Chen (=E9=99=B3=E5=88=A9=E7=90=
=AE) wrote:
> Hi Brad,
> =C2=A0
> Attached is the updated Schedule A of CCLA from Quanta, please help
> review.

Hi Litzung

You are not listed as a CLA Manager on the most recent Schedule A we
have on file.  For both mine and Quantas protection, I can only accept
Schedule A updates from CLA Managers.  Can you please have one of the
existing CLA managers send the update?  If you would like to make
Schedule A updates after that, have them add "CLA Manager" next to your
name.

> And I wold like to upload the CCLA file to Quanta google driver
> folder.
> =C2=A0
> Could you also help me to apply permission?

I would love to help you with this once you have been added to Schedule
A with "CLA Manager" next to your name.  This update needs to be sent by
an existing CLA Manager.

Apologies, I realize this is a hassle - but again this is for both mine
and Quanta's protection.

Thanks,
Brad
