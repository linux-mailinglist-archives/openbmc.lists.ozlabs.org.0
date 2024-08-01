Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7AF943F0C
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 03:31:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LYdfTyj6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZBJM6Ncwz30WW
	for <lists+openbmc@lfdr.de>; Thu,  1 Aug 2024 11:31:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=LYdfTyj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZBHm4hxhz2xck
	for <openbmc@lists.ozlabs.org>; Thu,  1 Aug 2024 11:31:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1722475858;
	bh=1ljONhAwupjUhU93zGB5miMv5CiEpNGUg+ODB7r3BZA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LYdfTyj6SoYEakhB+wuRq0/csJcDjz7f44w4BGEbQkrAQBBMnmeGpZDYpB+Sk5WIh
	 1Y7LxD8zoE/ml78mcimP2r31N4gpbSyZlCJ2w77KDH2z0pLpXus4gLlznoOWorNlIs
	 vIRIOh/PBmt92ufNBiGVZEesjNzpWI6m2LXZRyhlBLuGJ4cZjUXHTRD4TwsvZkm3jA
	 DtW1PZQv0LlpMZB4qI1ekgOFSQFaeq2wCMS+0JCMQe+1EX5Vil/FNb/3nd5l7jBVP2
	 IRllg7wqoRXVBHfkZgs9dCP5vKC40jxIVPMfqj5EbJW9qoDwWOLuAC6QC0mfZX1Kn7
	 JfHYdUa1Lup5g==
Received: from [192.168.68.112] (ppp118-210-29-70.adl-adc-lon-bras31.tpg.internode.on.net [118.210.29.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B71F164B84;
	Thu,  1 Aug 2024 09:30:56 +0800 (AWST)
Message-ID: <652362050e0a0de74b4704f93f31149c9f0c3823.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 0/1] ARM: dts: aspeed: system1: IBM System1 BMC update
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ninad Palsule <ninad@linux.ibm.com>
Date: Thu, 01 Aug 2024 11:00:56 +0930
In-Reply-To: <20240731214737.986010-1-ninad@linux.ibm.com>
References: <20240731214737.986010-1-ninad@linux.ibm.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, eajames@linux.ibm.com, joel@jms.id.au
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Ninad,

On Wed, 2024-07-31 at 16:47 -0500, Ninad Palsule wrote:
> Hello,
>=20
> This patch only applies to openbmc/linux.
>=20

If this is the case, then several points:

- Please don't send it to the upstream lists and maintainers, only to
openbmc@lists.ozlabs.org and the people who maintain the tree you're
targeting (Joel and myself). I've removed upstream people and lists
from To: and Cc: to spare them the thread :) There's no reason to
bother them with this change.

- You should use --subject-prefix=3D"PATCH linux dev-6.6" to indicate
where we should apply the patch, as both u-boot and linux patches are
sent to the OpenBMC list, and for different branches (when we're
upgrading).

> The max31785 pmbus driver
> changes are not available in the upstream yet.
>=20

This should have been the trigger to reconsider whether to include the
upstream maintainers and lists.

Andrew
