Return-Path: <openbmc+bounces-1269-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGizC9GYcWngJgAAu9opvQ
	(envelope-from <openbmc+bounces-1269-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 04:26:09 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8BF614BD
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 04:26:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxRKm3PdSz2yFm;
	Thu, 22 Jan 2026 14:26:04 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::632" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769052364;
	cv=pass; b=oTs2GYAAphTi7hqdRrB8kJ+GeMdcQ94ugzmFKa75c9Ww4XOSGtlPvsUMU2UPwPDie/6Hx7/1fOpD2yZ7N3HLE4XXM7EOENP5zBiG/8JOY/vqmPZDwZxRAQLBGdLnqF38ijMqfbuArJ0uhA037wuGADwlbqZgJkYuENrK7D90r5F1izFdYvT9DpVfdmF/z6Y3hdwcUA9/HAORQI7/OehBJOdXNb/drUIS3NpC5kXvhMfmse9M4M6RPyAFnR4OTmMiN8rMW7VEHGjE97eC8KUjKV13IpXZZ2b/J56BA1nCHq/s2CcJrYqL3yojIiBnq051tMg5XA/eFUEKKcqLMRZSSw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769052364; c=relaxed/relaxed;
	bh=j16LbB+Qbanz6FtRWmCfJ3mb1Dj2IAJrJw8gRUy0U0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l4wI+w+HacNek3UayILOj05d6jy9hlat17pYpsUwoHAM/ALpbGHUBE1Ge4VZ7RKPYESwnIy1CNRR9YBgmbJVkjyi9NMUAPzgYbFxuQz4FatsvZsbsjGQOT3F5ia9QNO0Fxcw8x73e0LYB8dx1s+lKip5f10tlT9WMoMi5EQRk0hHqluPLQzN6scIFpMbWp+eiruEBU9zm67IAJ53D8t88VX0Igt8JFdTdHcwcikftch2oqHRai1lMgX8FNuuzXwBKcpK1be1W1bvd2AStxQ8aobE222LQXqGphoOVYPGI08M6PfBRN15IjTDR/tyFnhiBMeS6WdhxcXYxDDkmpS3nA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YodzlA23; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YodzlA23;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com; envelope-from=ojayanth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxRKk0jPcz2xS5
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 14:26:01 +1100 (AEDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b8838339fc6so43243966b.0
        for <openbmc@lists.ozlabs.org>; Wed, 21 Jan 2026 19:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769052353; cv=none;
        d=google.com; s=arc-20240605;
        b=EoEjj9c5vMfntZXJHOOnU0exSVJf5Bijlt4PXpxxwpMRNuBePkpmzN+U6vqlYIVHAF
         0b6Sk8TtowCxBhhiz/HY7y7DrS0ersd1KOpFq/ulOwfiMzWtIUKYgBr8lBfUpRsmaCk8
         1cN9JykgBjmxU1f1L2sYh3E8fRVEiRjo+ROlVpwV3cQpdk5ezXoOFda80ZzQZ+tm9TZn
         QGCzhvlalof26270csrndZ4RHxhDIukBf9dofjbAUCgcbmLyYQ8ZigD4S6Ncq/+ogpBY
         zk8jvd/4501Hc3u70StUsbWOB65wOFq1UvKzXxONwX6O/977JpV9PieEIIUlviuPWevs
         Y3kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j16LbB+Qbanz6FtRWmCfJ3mb1Dj2IAJrJw8gRUy0U0c=;
        fh=FD0vqnDumQ9DSr/xVRIdO7ly46uZxiceyiQs2zsUQTU=;
        b=Jhbw+RDJnZTpubEa72SkGinhDku6PRZtDOsACTjQd4vH8qzp0Qt5XT36dVMvE5QW3/
         DsN+8uARzXd68mI6bY9D+kKTUbZDeRfY4ZczNUcx1An94sf63/QN1jkLm3Q+XMmhUUDh
         uTX8Rvjm/DkFMkmnkKgEdv3XNc/0hnS8CvHbty8Bnyn6kIC4xpbeifnCioD/E6o03BFR
         d2y2iiLUvVxlFQ6jO2P+1iLLDnRqXzIYbW6v2Zf9rlRZYyKHxTJCWeRw3BGGJia6kBhk
         S5jY/xd6gevGY2/NRFxGcc7Qqk/F4xhHaj05yPeeO/JMpcG9Ss+fp0PplD5foq7/QalM
         t8iA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769052353; x=1769657153; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j16LbB+Qbanz6FtRWmCfJ3mb1Dj2IAJrJw8gRUy0U0c=;
        b=YodzlA23X3fRWaO2fZb17gubPsqbrnyw1t0DOWlr4WKfj0fB3pgtfxRDIjr/SmFcJj
         wQH5rAy+CyDPu4dUH7H1p/2VUR2yb+xnWqnyZT6zJPciS9/U8xgFJVj3EEatAFaAI4gf
         ARERYBAuhQWu8M4AP9nYIj3G01ULXRR7hGkyPbb9M+ytPuTuU3xUb8d6Um9hYOuJJC0+
         2sEl6OTZ4u6QiOxs9PH/SIeNSZP/ygp4SDokHvideVBap7/y7TjksyC135vTVGFDyrYY
         8k5a5LDdLltRuqxDUxQHzMO4ZDWpIx6skZOalNhQ0Vv8poWJXAU/4HwRWYxg+nz1R4LX
         yKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769052353; x=1769657153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j16LbB+Qbanz6FtRWmCfJ3mb1Dj2IAJrJw8gRUy0U0c=;
        b=Y0+K1iNdexsg/ySjZnVTUFJVUQTSW01jwAyzqe530CyWsTkI7qSukAWNz9czecXOFe
         Nk66S5OUQyBcCPxmooR0FdHQudz5e06E0R7PXqWgyLThNpTt7RxOlDlsDbpXFqFptcyR
         uy1ZeFnbmSNyut+arDZ9/fS/Jsq5Um1Nq5IB3kktKUhN42tTWBH+/H1Qm0+bzsWN+7Jl
         JG6ED65ltsvnMwRw34crGH8ghuoUxeRoiRQuLlcppavGHpAae4XM1q5MtI9ZlI/Bg4/z
         lhdtdR1m9JbOD+ZVPmvNIBAqI8tqLqaPx0O07/wiUhIsMJu9hqoR2UTrt1F7ojKnBT9J
         1U7w==
X-Gm-Message-State: AOJu0YxCi/oBVAhpi5zSWmhyEdwKA346RmNhLuVj/fp3u6GpLzjER2od
	E9hx/R5/83ET88mxzGSSMfDn6Wja2aRlrxiPZkhzi3hOe+Mj6/KxXScpw5/oWGDKdXZt8fPYvU/
	Hva1DM3fXShUxFaJPVke59vqV0a0yW2hte4WK
X-Gm-Gg: AZuq6aKFsgXUZylPnWk6zIIbHZUnWUjhkM+5BKxY2KqYYFC2eqtpVSpvldQQIEcOVDI
	FPDwKgV7ZLjWu4YeAuLiAzjMX+1iEvGsZfAIT9KwUVahF8UNnVDJVUJTIpjnr27MikkM+YczgVE
	0MwL9iH2ZPEututHe5eZE6dKLwpbF50k5a/hjeti0BbgqDOFSYSrXxeUl+6gYDp1h7446KAiZI6
	Q+qjqyAt4B9ROTS53t/KoQqaDx0hqx9tIg1QAVWMcJUrsEvDG/gfAY2H87SqLls4tNmShAP
X-Received: by 2002:a17:907:3f15:b0:b87:18bd:dc07 with SMTP id
 a640c23a62f3a-b8831d9523amr101451066b.19.1769052352667; Wed, 21 Jan 2026
 19:25:52 -0800 (PST)
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
References: <aXDmS4BmR6AGXKGW@heinlein>
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
From: Jayanth Othayoth <ojayanth@gmail.com>
Date: Thu, 22 Jan 2026 08:55:41 +0530
X-Gm-Features: AZwV_QhyU6UN5kC5yMjrXTjD0cozAxEjjfCJnkq6ZWKBqrztuyOEKQ_TodygXH4
Message-ID: <CACkAXSpDTmv54WPXsO07NvgDsD1usL2dGcygZnXeNLtWPPzUHA@mail.gmail.com>
Subject: Re: TOF elections for 2026H1
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="00000000000011e1f40648f199eb"
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[ojayanth@gmail.com,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:patrick@stwcx.xyz,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1269-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojayanth@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stwcx.xyz:email]
X-Rspamd-Queue-Id: 8E8BF614BD
X-Rspamd-Action: no action

--00000000000011e1f40648f199eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I re-nominate myself.

On Wed, Jan 21, 2026 at 8:14=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:

> Hello,
>
> It is time again for TOF elections.  The current roll-call is available
> at:
>     https://github.com/openbmc/tof-election/tree/main/2026H1/rollcall.jso=
n
>
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayot=
h.
> All 4 are eligible for re-nomination / re-election.
>
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.
>
> Nominations are due by Sunday Feb 15, 2026.  The election, if
> required, will be held beginning March 1st with more details to follow.
>
> As usual, disagreements with the rollcall results can be raised to the
> TOF.
>
> --
> Patrick Williams
>

--00000000000011e1f40648f199eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I re-nominate myself.</div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 21,=
 2026 at 8:14=E2=80=AFPM Patrick Williams &lt;<a href=3D"mailto:patrick@stw=
cx.xyz">patrick@stwcx.xyz</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello,<br>
<br>
It is time again for TOF elections.=C2=A0 The current roll-call is availabl=
e<br>
at:<br>
=C2=A0 =C2=A0 <a href=3D"https://github.com/openbmc/tof-election/tree/main/=
2026H1/rollcall.json" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/openbmc/tof-election/tree/main/2026H1/rollcall.json</a><br>
<br>
For this half, we have 4 seats up for election.=C2=A0 Currently those are<b=
r>
held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayoth.=
<br>
All 4 are eligible for re-nomination / re-election.<br>
<br>
Nominations for those 4 seats may be sent to the mailing list by<br>
replying to this email.=C2=A0 Only those eligible to vote may nominate or b=
e<br>
nominated.<br>
<br>
Nominations are due by Sunday Feb 15, 2026.=C2=A0 The election, if<br>
required, will be held beginning March 1st with more details to follow.<br>
<br>
As usual, disagreements with the rollcall results can be raised to the<br>
TOF.<br>
<br>
-- <br>
Patrick Williams<br>
</blockquote></div>

--00000000000011e1f40648f199eb--

