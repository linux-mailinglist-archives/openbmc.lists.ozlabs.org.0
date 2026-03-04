Return-Path: <openbmc+bounces-1426-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFc0O1sgqGlQoQAAu9opvQ
	(envelope-from <openbmc+bounces-1426-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 04 Mar 2026 13:06:51 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10291FF7AB
	for <lists+openbmc@lfdr.de>; Wed, 04 Mar 2026 13:06:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQrxP5qZDz3c1J;
	Wed, 04 Mar 2026 23:06:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:edc0:2:b01:1d::104"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772625993;
	cv=none; b=NvU2AFya+SvCOpKeJi0O9UU9BWf9IR4L4fmPCp0FyB1tW4ocUd6wlfu524fkH6w9VeNqbtwhPonPDdwSOMXG0V5OMZ+2tZYeUWrHa8Op96cQqcol+uGEiqGZrOBvUkUzI4C2JZKXrU8utVD6uPYtU2r2wqTqj0WL/mADcw74cawajFfQYA3Aaj2mzk+0NeyikArYGss7yqgoss++beAjPFvozwYzWX1M71DFvOTppEuUJvM+TFs34i9NuW+2Le5x+tw/tnIgy8J5Hai90ZwthGymzEgc3qmm4IGzwbJFEZ6jxdOc10leFbD7hXFGwW5jH89h+lID36ZhSXNUmYi/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772625993; c=relaxed/relaxed;
	bh=2NaXXDV1tJIB0Dp9DIhsU+WPRj8uTu2ysRvhlaplcIo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S33/SFzAitsDLKwXkpJJIwmsRLfc28OwQrvOAJLG7kh2AO2VKAwTzwJwTyF5bFNqi4AyLn+pB1qVNzYtJWXHGMdvxldRzgDmgfvDeUb8wzGQ+aucqwla7gJVbScskJ8+xdwG6SBUY3QsJr5Lm6NXTpKW0RLXCBltgiXGHu4MyNc4dAgX9L7p94ZryJDB2ZbkKZNbOfykPS+xjQXJA9xLSFCjUAnX4vkNOiQH4BUcvpE1XJ/uomuD1v9eAEEGALm65gdLWSMXok7EkORd27UYf4wnfrbSKh6GCx4BpVcZ9PknuMTbk8C09A8s6sWqfTPmr7P3sqceH8Pp5jHIdIvl3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=pengutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2a0a:edc0:2:b01:1d::104; helo=metis.whiteo.stw.pengutronix.de; envelope-from=p.zabel@pengutronix.de; receiver=lists.ozlabs.org)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQrxP24Pbz2yY0
	for <openbmc@lists.ozlabs.org>; Wed, 04 Mar 2026 23:06:33 +1100 (AEDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhP-0007OA-Q0; Wed, 04 Mar 2026 12:47:31 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhO-003hsl-0p;
	Wed, 04 Mar 2026 12:47:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vxkhP-000000009W6-2CCc;
	Wed, 04 Mar 2026 12:47:31 +0100
Message-ID: <ceb3f2715e85a922c8122229c843ca79219b4433.camel@pengutronix.de>
Subject: Re: [PATCH 2/6] reset: intel: Use devm_register_restart_handler()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Andrew Davis <afd@ti.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky
 Huang	 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Qin
 Jian	 <qinjian@cqplus1.com>
Cc: openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Mar 2026 12:47:31 +0100
In-Reply-To: <20250813214138.477659-3-afd@ti.com>
References: <20250813214138.477659-1-afd@ti.com>
	 <20250813214138.477659-3-afd@ti.com>
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
X-Rspamd-Queue-Id: F10291FF7AB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.50 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1426-lists,openbmc=lfdr.de];
	FORGED_SENDER(0.00)[p.zabel@pengutronix.de,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:afd@ti.com,m:vz@mleia.com,m:ychuang3@nuvoton.com,m:schung@nuvoton.com,m:qinjian@cqplus1.com,m:openbmc@lists.ozlabs.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Action: no action

On Mi, 2025-08-13 at 16:41 -0500, Andrew Davis wrote:
> Function register_restart_handler() is deprecated. Using this new API
> removes our need to keep and manage a struct notifier_block and to
> later unregister the handler.
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

