Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD836F77EE
	for <lists+openbmc@lfdr.de>; Thu,  4 May 2023 23:18:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC6BG0wK2z3cjL
	for <lists+openbmc@lfdr.de>; Fri,  5 May 2023 07:18:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=QD9B4isJ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bewilderbeest.net (client-ip=71.19.156.171; helo=thorn.bewilderbeest.net; envelope-from=zev@bewilderbeest.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.a=rsa-sha256 header.s=thorn header.b=QD9B4isJ;
	dkim-atps=neutral
X-Greylist: delayed 469 seconds by postgrey-1.36 at boromir; Fri, 05 May 2023 07:18:14 AEST
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC69f72t9z3c8F
	for <openbmc@lists.ozlabs.org>; Fri,  5 May 2023 07:18:14 +1000 (AEST)
Received: from hatter.bewilderbeest.net (174-21-172-149.tukw.qwest.net [174.21.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 03007D24;
	Thu,  4 May 2023 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1683234617;
	bh=iVg9r2yzqOGzsNuRawQ0Kql1aogpVCrRocEREyvEFIQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QD9B4isJtdAXdbyZUyCNjauFsLaRaTEWOH0Nq2Meiwh91rELg+A3C9xz4H09Tua9M
	 qeeG+H+GDGZBTL8N/o1LOLB9cTgRlL0QNrx82DToY/YWVP1CunZtZ7XbaWEP4gFTV/
	 y8AyOJBTH7Hx1xuotcLcobEwMlo7ilgV9SAgSBpo=
Date: Thu, 4 May 2023 14:10:15 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Oskar Senft <osk@google.com>
Subject: Re: entity-manager: SBTSI and hwmontempsensor
Message-ID: <9b2c7872-fbe3-4691-b5c1-bf69290b4186@hatter.bewilderbeest.net>
References: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CABoTLcQNTwxi5nVRG8yRoDrrtV-pO-WA1ubtFVmnLnebPLucmg@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, Ali El-Haj-Mahmoud <aaelhaj@google.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 04, 2023 at 01:00:47PM PDT, Oskar Senft wrote:
>Hi Zev
>
>In
>https://github.com/openbmc/entity-manager/commit/e22143df37faa0b0f5e2918d2f505b9f64e74b0f
>you "removed devices now managed by hwmontempsensor".
>
>I'm trying to figure out how to add SBTSI support for the TYAN S8036 board
>(AMD Milan). Do I just add the device to the DTS and then reference it in
>EntityManager board configuration via its bus and address?
>
>Is there still a way to dynamically get Entity Manager (or now
>dbus-sensors) to bind the driver or does it HAVE to happen in the DTS now?
>
>Thanks!
>
>Oskar.

Hi Oskar,

Assuming you use a corresponding, recent enough version of dbus-sensors 
(i.e. including commit a1456c4aba, though hopefully also with at least 
commit 7627c860fa, which was a follow-up bugfix), it *should* work the 
same way it did before, with the device described in your E-M config.

It shouldn't be in your DTS, because then it'd be statically defined and 
hwmontempsensor wouldn't be able to remove it when the host is powered 
off (which I assume you'd want).

In terms of userspace/kernel separation, it's overall pretty similar to 
how it had been previously, just with the management of device lifetimes 
(instantiation & removal) moved to hwmontempsensor instead of 
entity-manager.

Hopefully that's clear?  Let me know if you're having trouble getting 
things working though.


Zev

