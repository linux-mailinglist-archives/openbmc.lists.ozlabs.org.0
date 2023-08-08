Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3F773AA2
	for <lists+openbmc@lfdr.de>; Tue,  8 Aug 2023 16:07:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKw4K1QPFz3c7s
	for <lists+openbmc@lfdr.de>; Wed,  9 Aug 2023 00:07:29 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1162 seconds by postgrey-1.37 at boromir; Wed, 09 Aug 2023 00:07:08 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKw3w2v30z2xFm
	for <openbmc@lists.ozlabs.org>; Wed,  9 Aug 2023 00:07:07 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3a-0007wp-GT; Tue, 08 Aug 2023 15:47:30 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3Z-001zo9-KZ; Tue, 08 Aug 2023 15:47:29 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1qTN3Y-000DXW-1D;
	Tue, 08 Aug 2023 15:47:28 +0200
Message-ID: <24a8094b49ad4258553e45d90296d9a485436ade.camel@pengutronix.de>
Subject: Re: [PATCH] reset: npcm: remove unneeded call to
 platform_set_drvdata()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrei Coardos <aboutphysycs@gmail.com>, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org
Date: Tue, 08 Aug 2023 15:47:28 +0200
In-Reply-To: <20230807105630.11638-1-aboutphysycs@gmail.com>
References: <20230807105630.11638-1-aboutphysycs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
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
Cc: tmaimon77@gmail.com, avifishman70@gmail.com, venture@google.com, tali.perry1@gmail.com, Alexandru Ardelean <alex@shruggie.ro>, benjaminfair@google.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mo, 2023-08-07 at 13:56 +0300, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>=20
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>

Thank you, applied to reset/next.

regards
Philipp
