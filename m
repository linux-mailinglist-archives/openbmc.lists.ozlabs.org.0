Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7A79764AA
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 10:31:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X49dH0zbnz3c8Q
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2024 18:31:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726129868;
	cv=none; b=UkQWUMF3yjXn7FQHh0K+5L+D0axjBR101pbhT4227p/oaFIy6WvLOQMyFtdj4w9EEnp4nPEVv6iUOx/BN05ssq+9s54u/qcvZqgJWuf5fV8rPKQq4ROY7cu8It7p2ZKVK++lPG3y/5RiwtyuikWHOSADpa2VAS8PigGLRAzFzZ66EtiyspsK0YSJcAjY7fncMbzUCnb8CAwhWU2Mnq3bAPC1NRXfaQ8bCHatb/OYQSMc11tORhFC0NGqMargEeiHGCMT4dGUX/zLPTc6ZNuzx9COTCB3uw52J4xQAVu6cl55d3DLI+VRvbupCEIsSeCWKl8DSmEIN2yG/oMhXTnhAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726129868; c=relaxed/relaxed;
	bh=tFc20qYi8G2nsGh4yLlGq+s03iVNuXtFC3P3F5JNYvU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TU8Pbk6MNpWB9Q+Cye/UEqWKBNHTkUaZZzi+AxqwnPwHid9rsvQZuJ3FUlOktzmJTpDhh5RzGc65nKbNrMMRO9PhQcdHJ8cBC1nVAGUV/i2eqnaTZRpFeh3S0oZLFqmtZFhfescRjADuKQzF8ioyhAdUPiENulVIiHXH7su/62r01+UHLhFLnvIPSwguH1O2bO8jNJtV/ADHnC6Hm+QSgm72lgnlmMdB3k3fEedqBJhQV40tewo4LcNytqwZXApB+88K1Wo1a+cylAaKuGJLdG9/sQO4KsWuyQudj0uyGwe85l5+8M4Ftc/LayGU6elj9/BtlE+MbF8cjBYhb93GPw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 1086 seconds by postgrey-1.37 at boromir; Thu, 12 Sep 2024 18:31:07 AEST
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X49d73TVqz2yDT
	for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2024 18:31:07 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soewa-0006tl-H3; Thu, 12 Sep 2024 10:12:48 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soewZ-007Kw9-0z; Thu, 12 Sep 2024 10:12:47 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1soewY-0002V3-37;
	Thu, 12 Sep 2024 10:12:46 +0200
Message-ID: <d94539ba211906d3ecfed9446258870762a72acb.camel@pengutronix.de>
Subject: Re: [PATCH v1] reset: npcm: convert comma to semicolon
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yan Zhen <yanzhen@vivo.com>, avifishman70@gmail.com,
 tmaimon77@gmail.com,  tali.perry1@gmail.com
Date: Thu, 12 Sep 2024 10:12:46 +0200
In-Reply-To: <20240909061258.2246292-1-yanzhen@vivo.com>
References: <20240909061258.2246292-1-yanzhen@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
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
Cc: opensource.kernel@vivo.com, benjaminfair@google.com, venture@google.com, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Mo, 2024-09-09 at 14:12 +0800, Yan Zhen wrote:
> Replace a comma between expression statements by a semicolon.
>=20
> Signed-off-by: Yan Zhen <yanzhen@vivo.com>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
