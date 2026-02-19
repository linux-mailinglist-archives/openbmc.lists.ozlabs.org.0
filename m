Return-Path: <openbmc+bounces-1395-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3x14FTNmlmkbewIAu9opvQ
	(envelope-from <openbmc+bounces-1395-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 02:24:03 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDB615B5C3
	for <lists+openbmc@lfdr.de>; Thu, 19 Feb 2026 02:24:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGbHw1Dtzz2xlj;
	Thu, 19 Feb 2026 12:23:56 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771464236;
	cv=none; b=m5ay2Xxdatc8viu+/IRm6VL/BOPoa0/p0L/hEJWLdys0RMXbyETj8YH05AWJbooGu1yG7xMUfqpdZATqqVfTzLrBy+bcNTzZk7M3yIgUyuPD0MnV2TKQVTIXisH9LsxQFkhFNw4uPAgcfnyJHAwWbgRNgd2HquLEa5sjkx4RcGgu0xM6df15hZsATXDLCTR6YCi88nxt6ZOEmUAwlI8lJgtno5QjGtoVFQeJXG5N9ypl9axZZ8Jk8yyIDhk0vOrwOHMUjNN2KZv2BTs79o4nZtkryV8/lOl81s4nHGNJqv40YZcZI6ZBMiCHU1ILEAUfceB1Yb4A1sjw/IOfBPxDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771464236; c=relaxed/relaxed;
	bh=Xy08KtZDZ20gEMB9xTdgtI0Y8xbR3QzLEA/JtWQFReQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M7TAwoCkBA5ee8cEFpTq24mb9UAsla8GrPumAR75ztl5Fl3TaSwx4hK57twWxdm7oTxG79eT220O5ZVh6Dt0fxThmb4vh954z79H69/lovzlnbxb96vsOl/7Mh6LfGzIBR+JFmKjbFibHFk3au8XHEcdLVDCYt+pFxM4msYZtedi/ZT7zbsOiLBNiE3AmtKWpkPgnkV/9UcT0lzf1HwPmnnFjBytgN7LoR+Wo8rFRCxZ4IYmtV7HxfK7ydCX0OzFYgcTjv7oinTyEoDFy67AZtA2qNjqmhHJcKsyCzrRvVNfUvjfldjq/ApbltCxcA9pmyj2TP6I5aEhp9WmeNq8ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bX6bdwsf; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=bX6bdwsf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGbHt19L3z2xN8
	for <openbmc@lists.ozlabs.org>; Thu, 19 Feb 2026 12:23:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1771464232;
	bh=Xy08KtZDZ20gEMB9xTdgtI0Y8xbR3QzLEA/JtWQFReQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bX6bdwsfjiYHJ06yCZgSYPgcanvll+CHWJeA9NEVDMFwoAgmx2dXoB1cMfDBucHD0
	 h8PkZVmclvSq761lmahRDi2g2YiUhK05UuMuADOtM2NFqHmt1v7/SBnu8wb34gi7d3
	 2fpMmt+7dcZT6GKbxPt52Pl/f+OAGc4sH2qMF7dol40b2NhLxTq4qgREzHh2syw3Mq
	 +IHUUJVIyNCdcjARpvg3UsMOfmOZ9Tkhs+saws93XDDq69vzn0KSN1kq4hMZnvtj6E
	 8hb8FMrDO67GsssgFFWifTSnrMfz2YBdimxacVW5PQaZzkhevzfb+mKuXecol9D9+G
	 4lCV2CXZaV7DA==
Received: from [192.168.68.114] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3055D6002C;
	Thu, 19 Feb 2026 09:23:51 +0800 (AWST)
Message-ID: <27244f564b8d2e85670152428910a43a3cbb91e4.camel@codeconstruct.com.au>
Subject: Re: [PATCH u-boot v4 0/2] aspeed: Add support for MSX4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, openbmc@lists.ozlabs.org, 
	joel@jms.id.au
Cc: eajames@linux.ibm.com, fr0st61te@gmail.com
Date: Thu, 19 Feb 2026 11:53:50 +1030
In-Reply-To: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
References: <20260210-msx4-v4-0-7dbb1e223e49@nvidia.com>
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
	TAGGED_FROM(0.00)[bounces-1395-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:molberding@nvidia.com,m:openbmc@lists.ozlabs.org,m:joel@jms.id.au,m:eajames@linux.ibm.com,m:fr0st61te@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
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
X-Rspamd-Queue-Id: CBDB615B5C3
X-Rspamd-Action: no action

On Tue, 2026-02-10 at 10:20 -0800, Marc Olberding wrote:
> Add a device tree flag for the FMC_WDT2 to be disabled.
> Also add a device tree for MSX4 that uses the aforementioned flag.
> The MSX4 is a granite rapids based reference hardware platform module
> for the CX8 SuperNIC Switchboard. It uses the AST2600 BMC SoC for
> out of band management.

Applied, thanks.

Andrew

