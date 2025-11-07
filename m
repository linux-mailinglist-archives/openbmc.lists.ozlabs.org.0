Return-Path: <openbmc+bounces-857-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFB2C418C6
	for <lists+openbmc@lfdr.de>; Fri, 07 Nov 2025 21:13:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d39Gy48Nsz2yFJ;
	Sat,  8 Nov 2025 07:13:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=116.203.167.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762546394;
	cv=none; b=bL05Foba3Z7qb71DPKJoFknne8sMoTbOQaOZ3GOBtUtwCxynYi44P4RGC5LqPkdS+O6w+mUspfg9hfAhfFh/9vKvYfrwfSDTuWe0n0wjAFlrH8aLm9jxKD/iPK7L0SQH9bKCdREY5BEEBmtU//Hph7WxmAJLy1BsLA3++Vf7bcmR73geXk8Vu1ypqf8cvPgzNixGbXCi+E8U/NDVRLPtcDxXGmCfzoUbtHQ9xdEO4x5bA4DwWxTXxHNF1cklVtQ/KrYETwgLOa46NLhVmpVc1duZ6yLL05/VxE1twKQU55O+/vjEqlmAXiH3i4vNX+O6/CathErU/Sa5WmyK9bB2RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762546394; c=relaxed/relaxed;
	bh=Q057139mbSLFqM2gjZ2QezG+lPcNonFvnYn2UZm/59Q=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=XFJUoAhD12vIvRdBKaw+WG+UGj9GZEbvRNR2Hr/bpFE7ByJIZqmDVr7YSpXFNc+ORu1VNlB4TVee/D4XoxhmE4VCwwyPg5N2hmayqsn9/K/2m4vi9h6J/j6E1iedYq4ApgMtIFJA1ppDO3oI2meMDeNy09CcmtbmssbjEUVQLWI1P09cSrUS0ehRbEgLICkXpilb5LNCjJlw+PsWibgz9+14mqlsixdr/nLPmeeZf/++3kkq5ohw+lPQ2IxWcvPopwNaLka2T/Bf23SAnkUKnjPdGOJyX8oKWF7cJihVXasz0yTuG74Qcu+yzTxHpP6LqkDZ5bu9fHZ1Rn3Mwh2wWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=permerror (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org) smtp.mailfrom=nod.at
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org)
X-Greylist: delayed 586 seconds by postgrey-1.37 at boromir; Sat, 08 Nov 2025 07:13:13 AEDT
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d39Gx3Q8Cz2xnh
	for <openbmc@lists.ozlabs.org>; Sat,  8 Nov 2025 07:13:13 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A8D3F2B03EC;
	Fri,  7 Nov 2025 21:03:21 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id X-nbup-2UNCI; Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 553D011C057;
	Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 51_Gcrbkj5Yv; Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 2DA3911C056;
	Fri,  7 Nov 2025 21:03:20 +0100 (CET)
Date: Fri, 7 Nov 2025 21:03:19 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	OpenBMC Maillist <openbmc@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, sethjenkins@google.com, 
	adobriyan <adobriyan@gmail.com>
Message-ID: <55378147.159026.1762545799936.JavaMail.zimbra@nod.at>
In-Reply-To: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
References: <068ba254-0053-46d5-bff4-74c948d2e8ac@linux.ibm.com>
Subject: Re: UBIFS errors since Linux 5.15
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF143 (Linux)/8.8.12_GA_3809)
Thread-Topic: UBIFS errors since Linux 5.15
Thread-Index: +EEJ8XwfiheRTquyWgicZAVkYE0nQQ==
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eddie,

----- Urspr=C3=BCngliche Mail -----
> Von: "Eddie James" <eajames@linux.ibm.com>
> An: "linux-mtd" <linux-mtd@lists.infradead.org>, "richard" <richard@nod.a=
t>, "chengzhihao1" <chengzhihao1@huawei.com>,
> "OpenBMC Maillist" <openbmc@lists.ozlabs.org>, "linux-kernel" <linux-kern=
el@vger.kernel.org>, sethjenkins@google.com,
> "adobriyan" <adobriyan@gmail.com>
> Gesendet: Freitag, 7. November 2025 18:38:54
> Betreff: UBIFS errors since Linux 5.15

> Hello,
>=20
> We are updating some BMC (Aspeed AST2600, ARM32) systems that were on
> Linux 5.4 but observe consistent UBIFS errors with Linux 5.15 and later.
> The errors seem to vary; there is a sampling below.
>=20
>=20
> We performed a git bisect and came up with the following commit, which
> of course is completely unrelated to UBIFS. Reverting it does prevent
> the issue... Does anyone have any suggestions?
>=20
> commit 33fc9e26b7cb39f0d4219c875a2451802249c225
> Author: Seth Jenkins <sethjenkins@google.com>
> Date:=C2=A0 =C2=A0Thu Oct 27 11:36:52 2022 -0400

That's indeed strange.
Are you absolutely sure that this commit triggers the issue?
E.g. if you revert it on top of 5.15 the issue vanishes and when you
re-apply it, the issue is back?

Thanks,
//richard

