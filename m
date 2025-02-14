Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F8BA35630
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 06:23:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvL773KVlz3cVf
	for <lists+openbmc@lfdr.de>; Fri, 14 Feb 2025 16:23:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739510608;
	cv=none; b=JisZNqwB5BIuP6ejUBVG/XK0+ooQ5O7Wui0pBdyF2+EJ8mJbSlo9jPuGUtCGbtQDKLv8vXcUX3ZKKekNLzqQaRTXu/8yiwxscVjyB/4USJBygKoThFjObs64+fKBhJptZtF130JXt4mPHlvZXPnbQeULKsGuKl564QBbR6fXgLQHhnCSJ8muKVOtW+QIpS5yY3Km4uHcQtgOEpX9IaxwzhjBAS2nLLRT2zsDgg0uo7lsV6lYvaKf7ezuciV53Xp+XOhLpPE68dRVHTyRoebnbTfsLWsa/3bDyI98V8UGJRyYpk1QOFeR0jWX9lfnt4RNrwPlgyXHPIF6AJijT2BhIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739510608; c=relaxed/relaxed;
	bh=F4KnP2E9od7Pmf3TC4LMcRrih8NLrNG43nKmgY5dC0A=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FaOtXdo8rs8MXzd5l/8krommcsPsnV5s5+/qrSNb/joBqH1vmnB3p6Xq1qdQgBVhNgrUCSYAsjtuPhcpv6imAiufkRrFGkc8hbYa51IgPj35lK8/aIVUibewFHcOcmOvunKQQ3g0ZbT/jmTbYs9XDCdkif06JTxfla/DaKnds3VlKGh9DeSBU0iCR2RaK/YDzC8kWqL11UpPVN9PoX0hd9fb9SMz1fTSz1S+X7Nwh3goaqeCBpeugJgXiheNdKrUStmeXyyn0DOEalgXHPHNDIC/p6UpKW2/RESpeBTGSB33Por4+CTSVpQandaM72/CViDPVxTuv+448id0Y9gXsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CFShOsfK; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CFShOsfK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvL732fwfz2xtK
	for <openbmc@lists.ozlabs.org>; Fri, 14 Feb 2025 16:23:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1739510604;
	bh=F4KnP2E9od7Pmf3TC4LMcRrih8NLrNG43nKmgY5dC0A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CFShOsfK6Ed03865pXWYS5Ztm15GAHbavNsi/dPTAwhYNrTQKp5gbhcS1V/UIWruR
	 gtb+VAnsAfbRUrmcQnlkVxiyWVFCfS3rTiF8DOHYYKg9GVWlxaZGYIYhAZckorgW6N
	 CR5XDlLvLr1xp1apE/BseG/cA4//5UL0MK3JRiKNdSwstgSBepfzZIcOmkBQmXRPBq
	 XHTJAwzeQEJylq9tpw3wULPCmFl5Ox4l1YfxNeJ5v3QUCo2u2e8yFDX58WX5PM8z65
	 GIY10d4I+N9B2+J/oJGAdHHgdSJek6P7ilTCdI9SpbxQYH78hgqJVLYQpMBFylacts
	 C75ow/IdpEh1A==
Received: from [192.168.68.112] (203-173-1-243.dyn.iinet.net.au [203.173.1.243])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 71FF26D8EE;
	Fri, 14 Feb 2025 13:23:23 +0800 (AWST)
Message-ID: <99a6795fac93ed52f2b2546026dd2cb4032dd8e0.camel@codeconstruct.com.au>
Subject: Re: Ampere's CCLA Schedule A update 2025-02-10
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Thang Nguyen OS <thang@amperemail.onmicrosoft.com>, 
	"openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>
Date: Fri, 14 Feb 2025 15:53:22 +1030
In-Reply-To: <077812E1-6D53-4F66-86D5-57DD5B8A8779@amperemail.onmicrosoft.com>
References: 	<077812E1-6D53-4F66-86D5-57DD5B8A8779@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Hieu Le OS <lhieu@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, 2025-02-13 at 04:17 +0000, Thang Nguyen OS wrote:
> Hi Andrew Geissler,
> Attachment is the updated schedule A of CCLA from Ampere.
>=20
> Please help review.
>=20
> Note that Hieu Le will replace me as Ampere CLA Manager. I will check
> with you in Discord to change maintainer access from me to Hieu for
> what I am handling (openbmc/meta-ampere and ampere-ipmi-oem,
> ssifbridge).

I don't have concerns with Hieu replacing you as CLA manager, however
the expectations are different for maintenance roles. Background here:

https://github.com/openbmc/docs/blob/master/community-membership.md

Specifically:

 * https://github.com/openbmc/docs/blob/master/community-
   membership.md#platform-maintainer
 * https://github.com/openbmc/docs/blob/master/community-
   membership.md#subproject-owner

openbmc/meta-ampere still has Thu as maintainer, ampere-ipmi-oem has
Dung, and ssifbridge still has Chuong. These won't become unmaintained.

Hieu should be subject to the expectations outlined in the community
membership document, as everyone else is. Currently Hieu has few
changes pushed to Gerrit.

Working through the process is an important demonstration of alignment
with community norms and values. It takes time. It protects the project
and community. It is what provides social and technical stability.

Andrew

