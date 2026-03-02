Return-Path: <openbmc+bounces-1421-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJ2sJ2bbpGniuQUAu9opvQ
	(envelope-from <openbmc+bounces-1421-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:35:50 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 809D11D2215
	for <lists+openbmc@lfdr.de>; Mon, 02 Mar 2026 01:35:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKjD4YBMz2xR4;
	Mon, 02 Mar 2026 11:35:44 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772411744;
	cv=none; b=htftrL6vCfQ2B37+MMkTtyg7Dc2y9H/51GZGvxfK4s8DncBL/ZdS2KHs/UkQn11lMwo6+K5AoKBQdeMDhgTnwdv//vmVrefTw5pTrv5GgAM7eO2tM8zJVZfd2H4GIJjX0RbgQ61BEfiAo/y826/pXMC9SqL8TY8BOKlly5yHUSFkc6xwSYSzY8i1a0upojmTq+b/ozbAUPuDaYDUh449fBAMq9KECSWGrQT7lpKLrzRw+BUJH0JEZwwfrq1IAWagiJjovOcM3yfhMpf14/wPD93fxLd8M9XVL5ArwPkUQ/lsPdmh5gqH47aq+1apRaklAQwnTThKXHbTIL+3mWVNDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772411744; c=relaxed/relaxed;
	bh=MT1xAGUr9L6ccis/x1Sxxi0/omrTgaylHqwz8dij1Uo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qzm/q7icO0nIgYL/pWQLU9VG+E/Eb5rdcnfN4fJw5hBQb8Kgp4z1ckZ8/Q1YVTFI/UKeyGuUvKM4BMUC/pgo+BD1O+O5l1wTBOm2rCbPC78hVDdcTxvZwHc+m/YVYeQTUKaPOVban5ZJKPYSIHAoUh3QWOtfrZglI9Di/SxbrDlmERtoC9M43ieYrwaTxuQCsK9pOw6JZbWomepDV4mCsWVjCX6PuEzeUgChoWRmpJwb1Am9rmCIFpgKUBHyg5nXLe3elZG1xg/3qE11gxOcSwNs8+1e6qjGZ5If6T+AQMxU4PBkfysH5vPEvd4ZGDAjSQQKebDN6o7p8Yy+YD4MVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gYiMqFev; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=gYiMqFev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPKjC2lCfz2xNC
	for <openbmc@lists.ozlabs.org>; Mon, 02 Mar 2026 11:35:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1772411741;
	bh=MT1xAGUr9L6ccis/x1Sxxi0/omrTgaylHqwz8dij1Uo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=gYiMqFevnBnl6ysTMrXEbtbtI02TfzUbyAGCUxlSJaAw4qw3XAbJea6adEypI/1G8
	 hU2eGfrhedSm4hXvuhrqt5E4L1kz99EqDHmRbX6qUCjysNBG74w7D5zSAUuezoEmWS
	 ZVoYrRbb6NMsGWf9yCpxphNKAeStPut44aHXYJzXKFf3K11aBlnwVWxODhBycdT2bP
	 RYDZx3ifbpO4HfqOJ0U6DnsAG9iDiLCbHaWQYIWN0HqHjBzHytR6iUh08rabzHry0A
	 BsoDN327hnELQc3tDV9gd5DbwE/2o1RGltyfcIq88p4ZltIDS+ifQHn7m7sU1PlDWR
	 9OWQIEH+ZNW0Q==
Received: from [192.168.68.116] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 941706043F;
	Mon,  2 Mar 2026 08:35:41 +0800 (AWST)
Message-ID: <303c5ed56f31577405c92dc5abc2ebdbc81e8ce9.camel@codeconstruct.com.au>
Subject: Re: [PATCH] ARM: dts: aspeed: Add dts for ASUS Kommando IPMI card
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anirudh Srinivasan <anirudhsriniv@gmail.com>, joel@jms.id.au
Cc: openbmc@lists.ozlabs.org
Date: Mon, 02 Mar 2026 11:05:40 +1030
In-Reply-To: <CAJ13v3RjXmAL7L3DC8pcLv_xOQB7Bn7iFTPRKLwfqGpPaQRbWQ@mail.gmail.com>
References: <20260228-asus-kommando-v1-1-9a288620096d@gmail.com>
	 <CAJ13v3RjXmAL7L3DC8pcLv_xOQB7Bn7iFTPRKLwfqGpPaQRbWQ@mail.gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codeconstruct.com.au,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[codeconstruct.com.au:s=2022a];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1421-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[gmail.com,jms.id.au];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:anirudhsriniv@gmail.com,m:joel@jms.id.au,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 809D11D2215
X-Rspamd-Action: no action

On Sat, 2026-02-28 at 22:10 -0600, Anirudh Srinivasan wrote:
> Apologies, This patch was meant for the u-boot tree and I forgot to
> include u-boot as a prefix in the patch title.
>=20
> Should I resend another version with the corrected title?

No, this reply is enough, thanks :)

Andrew

