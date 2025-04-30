Return-Path: <openbmc+bounces-22-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D95ADAA4192
	for <lists+openbmc@lfdr.de>; Wed, 30 Apr 2025 05:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZnNj4257dz3bh6;
	Wed, 30 Apr 2025 13:59:04 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745985544;
	cv=none; b=WYuvpuqBF62jYusldFEHyAUOpkq1LMnrewEvEweeHvGeujEmJdp7teNJq7xsBp3RWnWIG2fNXBgGQo1n1sSJtHCHZqrp5yA1Aimk43QAu2nq3l1pd122ZC/HZUs/UeNv7R8LaHrhAk4eiyzTPGR/S7FQgmeJyAEyJTR023koRCdU6HI54f3qBDRMz6G6E651uiuTGc13QE72DyGVRyYiPXrgchn+jCYlN3Hj30/SR3g+Mu78GrnzJnm9J0j5RdoNY61A9owYB4vIwI3Xosa8nfejbnEJq24KMv52KzvRBaTfTiznaFHEW7ACJSd9sDLaVwVWJa8bV/o+l2Ajo4leZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745985544; c=relaxed/relaxed;
	bh=KXX+H7PdeRhjgL0AWhML/vGTr22gniIgEG70uSVCEmc=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CxS01O9cyvdxOXjIzVqvsnVisR3mLsw/vxiM6tYIzz8BIeuY5kZUuon27oGD733mYvPEm9lVbXummQ6kJdThsFToMsXXU+EcXiOX6sMLXjV2a/L+ZHgVVbeDcs84uYDlRSsJRj2zfLctLUOZT4LNZ8Ul9qxJxD1OOP5b3lgz/HRmRJ5Z7JG9QnNXGEfW7uz0l/zYc1CHtetepnXsvapkZ4R4GVjQIflQiGgtajh6/gWfg3u/UKJmtWLNnqC5kMKbspoeR4qyuVCyKiBO4ZGbVzVhILzZuEfUbE6o9CNfGxgLAjJt+UXZbytxW5G0Z/+2jj1xqvBymC2eohapOiu8JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iTnRG6ro; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iTnRG6ro;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZnNj31gzrz30Wg
	for <openbmc@lists.ozlabs.org>; Wed, 30 Apr 2025 13:59:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1745985541;
	bh=KXX+H7PdeRhjgL0AWhML/vGTr22gniIgEG70uSVCEmc=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=iTnRG6rovIg63kiT+YDrZTUZ3GT2W6bCxdf78vWNXIwV1HzRl7p4jL011auOMd+w3
	 TbfcBdEwp8X64oPhbKEldZWncvlq5Fegg8cMydZqzrr3By6YCCIZnisVtLrAQThgJ3
	 K7CModflLMZe1L6batZLFkG87E/Vz1Xox6Vut/QTNw24WZ+z6c9092VcUku5BKokFG
	 HXzLjPj3iDBGwZ5LLxlm2VP82amBHM0p6I4Cn0S89HfvC12X6b5TuufonPOVkhYilg
	 s1ClAOwUGbd2Oj1nuheAq6XNQRVa8jbiLv9cBNk0j+uBo+KmrNMorwe6knv88T7tBu
	 qmMhO/W8zVPag==
Received: from [192.168.72.170] (210-10-213-150.per.static-ipl.aapt.com.au [210.10.213.150])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EED25643FD;
	Wed, 30 Apr 2025 11:59:00 +0800 (AWST)
Message-ID: <db114c381d4f3c37b50fd66bb934e9b8c2008e16.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6 0/3] Backport MCTP Over USB Binding
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jeremy Kerr <jk@codeconstruct.com.au>, Santosh Puranik
	 <santosh.puranik.ibm@gmail.com>, openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Wed, 30 Apr 2025 11:58:19 +0800
In-Reply-To: <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
References: <20250427153008.3166922-1-santosh.puranik.ibm@gmail.com>
	 <d91c2e0617d97c79a31ac0b4d9db9d20506736eb.camel@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mon, 2025-04-28 at 09:43 +0800, Jeremy Kerr wrote:
> Hi Santosh,
>=20
> > This series backports the MCTP over USB binding driver and associated
> > definitions.
> >=20
> > Patches 1 and 2 were cherry-picked from upstream linux master and
> > patch 3 includes fixes needed to backport the binding to 6.6.
>=20
> We'll want to have f5d83cf0eeb9 ("net: mctp: unshare packets when
> reassembling") included too:
>=20
> =C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/net/mctp?id=3Df5d83cf0eeb90fade4d5c4d17d24b8bee9ceeecc
>=20
> - that should come from the 6.6 stable updates, but doesn't look like it
> has hit the openbmc tree yet. Could just be a matter of sequencing vs.
> that update, or you could include explicitly.
>=20
> (Andrew or Joel may have opinions one way or the other)

I can take care of it: There are some other related changes that need
backporting as well as they haven't come in via the stable trees (I've
just pushed recipe bumps integrating v6.6.88 for openbmc/linux).

Andrew

