Return-Path: <openbmc+bounces-1365-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJcsLRnojmkDFwEAu9opvQ
	(envelope-from <openbmc+bounces-1365-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Fri, 13 Feb 2026 10:00:09 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03B13444E
	for <lists+openbmc@lfdr.de>; Fri, 13 Feb 2026 10:00:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fC5j03rb9z2yqs;
	Fri, 13 Feb 2026 20:00:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=212.227.15.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770973204;
	cv=none; b=DPVHlckMRO4MrCdpmH31B0PLnbgkFU0Afj0xj8IcwNr406hmGQsiFBS7mIgSMWuFagbuouCzgY/JfGYJI5zvORJarUCu0zmq+kqmarbYdGhDt43INaPVV/2NUP+VHbR7g1VOASZG3LXFhbbSVCg9UatHEXwuhu7vTqQQ3b2nncc1IQJLNHqb+xXrD8Sg3JJtM0OMsSswTtN+cGDp8Mg9wVbhzR/70U0MfUY922JtLnnkQTOAzWpPewYPMDI+Wl/9l0tvq6PIiIigJSU1lqdgt52mqv9Q0yVzPUzSp4j/iTw/KRJwZQ346ZhcIdkBZR7jQTkZ1gbUt4SsbY4kWGQqBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770973204; c=relaxed/relaxed;
	bh=WfkDXFYmwC97kaq9x3OO67fq+4W/dySLiI/MkGDH91U=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=aZ43bEmsDjJGaDbFrXRj8OWuxc2KPq0XafYDyeAK4OTtnkTG6muhIUxv766I7NrgENZ72mRpkIYbPJaCIwpDJSspeqaQgS2U8jC056rvf5fcPbGuTUHxVwo7gtCxsYFHg5bz8avXHY1P4bHyC13GvbTgQB/x0zHZ7ZyomC/GkWRXAQ9BFtebTBGG9x7OGNSIufWfjWjSef3wPKoCFWk18+afpN0PrJOUeD6gF95t5wYnImoCUth3Vgapv/HLLQ3jXkED7aJ37U+iTF36j7GS4JocIMr8drV+ya4ITG430ROGOHBriR/NWBNeZ2q4GFfton7bmafAH0KhbgLSbQI+WA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=sR53dYTB; dkim-atps=neutral; spf=pass (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org) smtp.mailfrom=web.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=sR53dYTB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=web.de (client-ip=212.227.15.4; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 323 seconds by postgrey-1.37 at boromir; Fri, 13 Feb 2026 20:00:01 AEDT
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fC5hx0jDSz2xdY
	for <openbmc@lists.ozlabs.org>; Fri, 13 Feb 2026 20:00:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770973192; x=1771577992; i=markus.elfring@web.de;
	bh=WfkDXFYmwC97kaq9x3OO67fq+4W/dySLiI/MkGDH91U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=sR53dYTBppVId84bDQt/PqwAgf5C3Ehhi+VWe7sbE5yoIfkatIebb+ZSw/EaZ5G2
	 iEvylDX6GW3GXAMh8lHu7ZjKkSghXm00BPe/cJVhsnubtIxK2t9k1w6kCTZFjltYr
	 V+0CBk7fZdN699wOxQu9opmgOCzQMr4awxjLn6GfP0A5Hf1WDaxl+oOqTfMVcqcOM
	 ViTKHoI8UOBgHptuUIEgJdDrzRfve6tcM4YAh+1fzv1AV7KA24HpXcGHwkrQy31uK
	 +hjmUaoZUReuA2DxxVYg/LEXZLahsnC8/5Hk+bWFGlLOGmVOfK3e3zQ4J6+xIz8Br
	 P4P2Oveor5+pJPZWEQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.207]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N6K1l-1vkHX843XF-00wavz; Fri, 13
 Feb 2026 09:54:12 +0100
Message-ID: <c4db3d6a-b683-4b5b-943d-c0be91caad1d@web.de>
Date: Fri, 13 Feb 2026 09:54:09 +0100
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
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-spi@vger.kernel.org,
 openbmc@lists.ozlabs.org, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, Mark Brown <broonie@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
Subject: Re: [PATCH] spi: wpcm-fiu: Fix potential NULL pointer dereference in
 wpcm_fiu_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260212-wpcm-v1-1-5b7c4f526aac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HfWVrsW+IWR2QlxFK2Pl8zGVTnNAWL/CUi9X5L1uhbrwOLPgz0F
 BcDXQ7mrl58YsDVeMpFLIiHcGPvMhiNzFnReSxLk0mHAFSxdPHR/486hBnOgjfHyRDHZ+ZZ
 /3Qsj/EiZfw1ZnSzzkFAnxdIkZnl2iXUMa54SRm9mJ/sty25/Y3zJZO1zHZkvbdR0s2BdpJ
 JBSser5ygTmGOlC96V11A==
UI-OutboundReport: notjunk:1;M01:P0:gsoRQz/l4n8=;RA2UGiNow7xLPiSE7pw5wQ1KasP
 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
 p9D6UUWo=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-1365-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org,lists.ozlabs.org,gmx.net,kernel.org];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,openbmc@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:linux-spi@vger.kernel.org,m:openbmc@lists.ozlabs.org,m:j.neuschaefer@gmx.net,m:broonie@kernel.org,m:linux-kernel@vger.kernel.org,m:kernel-janitors@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[web.de:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EF03B13444E
X-Rspamd-Action: no action

> platform_get_resource_byname() can return NULL, which would cause a cras=
h
> when passed the pointer to resource_size().
>=20
> Move the fiu->memory_size assignment after the error check for
> devm_ioremap_resource() to prevent the potential NULL pointer dereferenc=
e.

Were any source code analysis tools involved here?

Regards,
Markus

