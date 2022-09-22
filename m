Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427D5E6811
	for <lists+openbmc@lfdr.de>; Thu, 22 Sep 2022 18:07:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYKtV2cPTz3bq5
	for <lists+openbmc@lfdr.de>; Fri, 23 Sep 2022 02:07:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=<UNKNOWN>)
X-Greylist: delayed 1040 seconds by postgrey-1.36 at boromir; Fri, 23 Sep 2022 02:07:15 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYKtC586jz3bk0
	for <openbmc@lists.ozlabs.org>; Fri, 23 Sep 2022 02:07:14 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1obOSB-0002HK-Vs; Thu, 22 Sep 2022 17:49:32 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1obOSA-002Hsy-F6; Thu, 22 Sep 2022 17:49:29 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1obOS8-000FKE-Dj; Thu, 22 Sep 2022 17:49:28 +0200
Message-ID: <8d586c6da80cb948d38eeb0236423ea4810269bd.camel@pengutronix.de>
Subject: Re: [PATCH v1] reset: npcm: fix iprst2 and iprst4 setting
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomer Maimon <tmaimon77@gmail.com>, avifishman70@gmail.com, 
 tali.perry1@gmail.com, joel@jms.id.au, venture@google.com,
 yuenn@google.com,  benjaminfair@google.com, arnd@arndb.de
Date: Thu, 22 Sep 2022 17:49:28 +0200
In-Reply-To: <20220922153856.23326-1-tmaimon77@gmail.com>
References: <20220922153856.23326-1-tmaimon77@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
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
Cc: openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Do, 2022-09-22 at 18:38 +0300, Tomer Maimon wrote:
> In NPCM8XX USB reset sequence, iprst2 register was set with iprst4 value
> and iprst4 register wasn=C2=B4t set.
>=20
> This fix sets the correct IP reset values in iprst2 and iprst4 registers
> in NPCM8XX USB reset sequence.
>=20
> Fixes: fc5d2a2f4aa5 ("reset: npcm: Add NPCM8XX support")
>=20
> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>

Thank you, applied to reset/fixes.

regards
Philipp
