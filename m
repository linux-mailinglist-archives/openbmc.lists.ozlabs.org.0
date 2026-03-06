Return-Path: <openbmc+bounces-1438-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOK7G2GrqmnjVAEAu9opvQ
	(envelope-from <openbmc+bounces-1438-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 11:24:33 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C021EA2F
	for <lists+openbmc@lfdr.de>; Fri, 06 Mar 2026 11:24:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS2Zj0xRnz3bnJ;
	Fri, 06 Mar 2026 21:24:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772792669;
	cv=none; b=B/wblFSytLKDdZZYrSpWlcCXxPGoTCPstqYRFycjvyLfQ1RW1Kf5fMyzIE9U/6R+fOdpJV0mfhEeWdxGdDseEMKDTwNsOd3/BNnWY3jfKflmbHY8OkSziBbuBFp61iUb1SV61IMhI8QVMWOBskxT9SeymbqQOOIta2zbDUHlacVBdAAl6TjtwKaXKQRtVjubJj7W3OoFvP+VyILeNkuVUHB9GloewKJKRVPzqVGOpQ4Rh2M4nW8MiveYJwwU8QIEqw/3Uzm9O3bCdO7c883K+gEWVT5bgbN9VHl3A2ryiKhQ1ItUlxEVWg7BUpFeQBRJc0YR7U5QMDEA5QZ+xkz48A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772792669; c=relaxed/relaxed;
	bh=RjkU15zKUhozjGz3J/xdbMrcUdCPVMhIUSb5AP+FDwI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R2YNsc9PvdZPWhOwzgUUIuUTWH6pjUVaLK71IWLJRWIu2eAa/7jYwAyjkh190udLeuQehkG8/55kS01+8dIjmgkeP8JZXzECkeQvOxRMp533T9oH6C5cKcHbj1biYyImDROlghhOgZ2PrQv546GMlrIgiaN1NKMIKs2dBBeIEmvT+Nkep3orJU0nRxZyzhXO2o1wxpAY7kpuZChyGPbwMSgqGi/tErtssa4BDE49pAum1lolvnqLMWkl21awjKOHtReYjnxRuRfvCwvXDd4MSjRVZdAM6VsmIT0oSU+JA5/36KgwEt0WTk1IU7RD9RPR/IPUA/VZmmJUk36sN7/ANA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS2Zg4VGHz30T9
	for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2026 21:24:26 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLx-0005nT-6L; Fri, 06 Mar 2026 11:24:17 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLs-0042AW-1X;
	Fri, 06 Mar 2026 11:24:13 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vySLt-000000005Z5-36J5;
	Fri, 06 Mar 2026 11:24:13 +0100
Message-ID: <b0d5378b701254a9e5950f74577257c3a69d0868.camel@pengutronix.de>
Subject: Re: [PATCH 0/6] Remove register_restart_handler() from drivers/reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky
 Huang	 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian	 <qinjian@cqplus1.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 06 Mar 2026 11:24:13 +0100
In-Reply-To: <20250813214138.477659-1-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openbmc@lists.ozlabs.org
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 754C021EA2F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.50 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1438-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:afd@ti.com,m:vz@mleia.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:qinjian@cqplus1.com,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Mi, 2025-08-13 at 16:41 -0500, Andrew Davis wrote:
> Hello all,
>=20
> Continuing to remove users of register_restart_handler(), this series
> removes the remaining uses in the driver/reset subsystem.
>=20
> Build tested, but I don't have any of these platforms, so some
> sanity testing always welcome :)

Applied to reset/next, thanks!

[1/6] reset: ath79: Use devm_register_restart_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D59ad2fb0be75
[2/6] reset: intel: Use devm_register_restart_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D8bfef0c24389
[3/6] reset: lpc18xx: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D09f166128aea
[4/6] reset: ma35d1: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D42d03696a05d
[5/6] reset: npcm: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D71c021cd8875
[6/6] reset: sunplus: Use devm_register_sys_off_handler()
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9d93e13bf5c4

regards
Philipp

