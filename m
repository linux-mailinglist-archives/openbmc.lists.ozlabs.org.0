Return-Path: <openbmc+bounces-1155-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430FD10866
	for <lists+openbmc@lfdr.de>; Mon, 12 Jan 2026 05:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqJjx4pS7z2yjn;
	Mon, 12 Jan 2026 15:07:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768190837;
	cv=none; b=Kij9vuATbgqapBD9TvDad8YdpORINfLzciHyYxJKVx8EsMQoZp+QNQWRjU73ejeBEu7AJKMWfZK4KgbxDH/3mBZUzif23hPIxCTykrbE71dGmQi0dyLiRfLwkERVEysncPLnX8oxmfJFAPZZTTPAW7FkKkA7UkL3ujjvOYf+xa6dDCQK6gcKlUTMFILViWbZv7prZrKqpkoxoETkv6YtQY9/25EiSgJu3BeHaJwBZwpdQFSgeTgjQmgzOyrX/gVchpUSCnYmRnl0IoYO6G24GroL5gqpV67UDXVGkxzexna82ebjQkHFrtCZKsuneclYWyez8Tvv0yvqVx7EVjwUyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768190837; c=relaxed/relaxed;
	bh=kLivkmDI72MWbsCW9DSyd+xJ5GAV1Sol6ooTqBdXZv4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SqtaBggBRDbyQ7d/qH+AeHIjJet5kzC4ddLoKHe5ivDYSZHkOBYOPWSJE1qaCU5mZy10xKscW1qHfWABmzjzwevgFjEE7x3XFNKcbWXrPCdCfMMckH0P1P7S1TYW+HqUubjfX2x2BgDBH6WaqobStgsEJdYdRpQ8RdQc+p+zOxQtVoTrVOXfXz1uZfusmUDtf/X+L4G3FqCO4MglkCafrH0lqP1nD02t7NTyOLTKt2gZR3hE8zKDLUlPVN9r64OUmzUR0YqaWN8J3B2aYqWwgcmedpWr3q6/jMnxom2Ex3xyr26bQ7SnLxtgJD83klFtL1LgH836k61WQYCJJZGQIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fxUdce1O; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=fxUdce1O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqJjx1mH3z2yhX
	for <openbmc@lists.ozlabs.org>; Mon, 12 Jan 2026 15:07:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1768190836;
	bh=kLivkmDI72MWbsCW9DSyd+xJ5GAV1Sol6ooTqBdXZv4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fxUdce1OknSZ2y44jXraU1ldGgIZa7W9nZMSo/+/C6wX0YoBcsYQvbrFGvk2lOGua
	 SnMRU94DqjZDfRM7nurAOb0XezkEYddL3OnmPwiIo4yywOfRt5eA8oq5bl/cpmwqKr
	 jFo6GYaztFxN1ZhJFKx5fB0i6wThcvCyl12s/wEv4Xy4OgH951EpD/DncmwqGraEyb
	 k50btyXlSTbDTr2azxMXVO96HIxlg8KyHkIzNnM80DKkmjxwlcVGXgfUM/Pxe10WtP
	 Po6bHE9WEaMSpJlC/1Ri33G+z7h2jJ63pChKqhBaFQFWWygxM+v8GG3wHARFFbmNXy
	 A+7IjFZhSMPjw==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 54CD464705;
	Mon, 12 Jan 2026 12:07:15 +0800 (AWST)
Message-ID: <f43b8b95e96d34089282a1af2e26f3a6ee16fa36.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.12 v2 0/6] Add device tree for Axiado AX3000
 EVK
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kuan-Jui Chiu <kchiu@axiado.com>, openbmc@lists.ozlabs.org,
 joel@jms.id.au
Date: Mon, 12 Jan 2026 14:37:14 +1030
In-Reply-To: <20c8a4e6-ef9c-452a-ab21-446e7de66d56@axiado.com>
References: <20260109060254.1575868-1-kchiu@axiado.com>
	 <150ed77b60b22670766fcc1607fe696c0708acce.camel@codeconstruct.com.au>
	 <20c8a4e6-ef9c-452a-ab21-446e7de66d56@axiado.com>
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

On Mon, 2026-01-12 at 12:06 +0800, Kuan-Jui Chiu wrote:
> Hi Andrew
>=20
> I checked the 6.18 kernel and I found it had included all of the changes=
=20
> in this patch series already.
> So I believe we don't need this patch series anymore, thanks.

Great! Thanks for following up.

Andrew

