Return-Path: <openbmc+bounces-1267-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEhfNZdRcWkKCQAAu9opvQ
	(envelope-from <openbmc+bounces-1267-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:22:15 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0851D5EB88
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:22:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxJb71RyJz2xs1;
	Thu, 22 Jan 2026 09:22:11 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769034131;
	cv=none; b=RQt1pLnf8gjexeJT59VFwQdRyQKwD9OyvJaqIdV9BcuqsDXzeDwrgqqkwNbat1nw/v0qUZXnhGB51nRUY9NOux7NK1MdEanIWrmmR43Cr+FRt9sFLcBATBOnO1AVl/t06sAEMnWlsZX3rDfY4dzxs2f8NP6e+R3JvC5mm2lZaVz3JfBjOBs3+geo0gg/fKzyRJQgxZ+hEmhGiFQxbq8ZHiFW2RmYEwZHIh6YPIOQf/xx3APrWM0HUH5bouSWU7n/Qrtl9k0HzniKNZwkqNVDQRSCf3l/qJJHBzf7vW3hT/P2o3GtWDlL2CB1neqSQ+rdmHu3khH+CPIl20K7Ys2/BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769034131; c=relaxed/relaxed;
	bh=71BpcP2fgYCAtfQNdnVM+ahjOQns4Se5zsfiF1G/NgQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C0kRgG3URF6DUujB/MyTlz7QHKp+xQl0H3wS/ahZWiXB2OhIl3AFdYcmOH/EjeTBkem0A7buLtLv8k/mSmvSzY5AkRWxcrSNnSNrb0SfOZcuJxew7fJ6bIiAUmmBJKpsIT9R6MJkOqzjlHbdbNTsXkiRa+mjnwsPfsoF7HwpdcTtp5j7QVZbu59ZNwymk2mC/9Cuzj36AZta+Xj3dc1EswgeuF73yoP+nlsY6KgSVWmrCtj2wQrk8xGBasW/rc6iYJIl0epcFubxxFwl9rthmZK5pguzpqMfKgQm7T93Tb8tgbw2CA9ai7T1zeNc+drya9ElMM1TD0v/564amuD8QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aZgwhm1j; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aZgwhm1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxJb56thsz2xQC
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 09:22:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1769034127;
	bh=71BpcP2fgYCAtfQNdnVM+ahjOQns4Se5zsfiF1G/NgQ=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=aZgwhm1jFZ8Q5PXQBDcdmd336zVC+5op3vHJXgI3MvPEBtald5widvcCQRkt3XkZX
	 2fMdmvxPL40uXtH3Nl6ER5BQg0RItaJm5dwca3jijUrMMr/RKgATX5dZ5Lc+igZk1/
	 KNXf6VaaP0GtbAg9PImTf7OZ00An+wa4aN9m7TJ/Jv43efLaBC1q9PM5pgvSTIShJK
	 aLh4x0uljGcvd/2YtV3JpbZTSdPY2YCHO2MT0sVtGK2miR+lYhzvYHCrNW/pEIgx0R
	 X1Bcmh43KEpJPxX7vPgtEz1e71X4zEnCLNC0QdeBBK8CNbK+qbKNTpBcTPPu0KFBNh
	 ObVK53CwkXbRw==
Received: from [192.168.68.117] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6F2B07B1F0;
	Thu, 22 Jan 2026 06:22:07 +0800 (AWST)
Message-ID: <f317027856263794747d906eaebcfae69b01742a.camel@codeconstruct.com.au>
Subject: Re: TOF elections for 2026H1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Thu, 22 Jan 2026 08:52:02 +1030
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
References: <aXDmS4BmR6AGXKGW@heinlein>
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
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:patrick@stwcx.xyz,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-1267-lists,openbmc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@codeconstruct.com.au,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[codeconstruct.com.au:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 0851D5EB88
X-Rspamd-Action: no action

On Wed, 2026-01-21 at 09:44 -0500, Patrick Williams wrote:
> Hello,
>=20
> It is time again for TOF elections.=C2=A0 The current roll-call is availa=
ble
> at:
> =C2=A0=C2=A0=C2=A0 https://github.com/openbmc/tof-election/tree/main/2026=
H1/rollcall.json
>=20
> For this half, we have 4 seats up for election.=C2=A0 Currently those are
> held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayot=
h.
> All 4 are eligible for re-nomination / re-election.
>=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.=C2=A0 Only those eligible to vote may nominate or=
 be
> nominated.

I re-nominate myself.

Andrew

