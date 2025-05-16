Return-Path: <openbmc+bounces-46-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C904AB935C
	for <lists+openbmc@lfdr.de>; Fri, 16 May 2025 02:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zz7yF5h0Tz2yN1;
	Fri, 16 May 2025 10:59:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747357157;
	cv=none; b=R/DrfDtbQAFIeSOnNX7T8lwfR9X3LP768MVwO0GlaHUF9nPcRXW/n0OD+FsNTTIo1m5BI5i+w1XHJZqPwJ/mJy24CPC+D/OspATwO8GGul3HNMtS1WqwuWrEZdrdOO4fME4cVb8NfVlO0xMrW80qGoBMcw3u/nsma3Y6t7a082dXaq+Zzve6f4VkTqU/7EEO1aw5lyKi2f/RIBFvv0sJky18A2VNfPfvI2bcve58TnfPEEf7xLY7Qa+YHz6UcE+X6NHQajP24zW95ocNum6okXKC4wAEk4PglZrpvsMEJrcHu5uUYFJeYHau4kQDczRjTw/rl6m/Tg+7bm3ld975wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747357157; c=relaxed/relaxed;
	bh=XtEtYIpSwp8kr7uYUzwZ0fVFrnBNzdjjPYevq066B4E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V8N5nDCOnlROb16D0K/MMquG2BQ4NkbS20Gd5Frfh95PkrY3QF0Vc7hfmpTL8NS47TXbM6y4CzD96n3SB/s0VC0YP0NZd6Zu2L40cIV1XocoOYyMliMuGyyJiqwD6Ky3s/JoP4Gv5+4evEHZHYM1XqndqCodKagqfq6c4Pa4n90oG6oq4u1x8KuvjqwApggbrHuSmuniS5JN6qFqzE7Fj8RlkuC92is72pR42WAAcelgf9RZTPZ0LfHjSbfO00X3ZUansjcxxNMbLcKPULzflPqC3iG4SlfTJm+IpbO3SHwGWdYT2Yqecj2MixPph8AL9/5D2gNAmqav8sARgBifXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iZTieDV9; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=iZTieDV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zz7yD2z1sz2yDk
	for <openbmc@lists.ozlabs.org>; Fri, 16 May 2025 10:59:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747357154;
	bh=XtEtYIpSwp8kr7uYUzwZ0fVFrnBNzdjjPYevq066B4E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iZTieDV9GwTfNJcQXYbmEDi+1bxSfaq0sZHF/Frw+RAFGk74P9K+41zrDDosK2ej4
	 wBrwahm1B2WTYdRXrW1MitpS2cCh/xx0dUKvj7wio1JVl5u12wmqFOmAIq1UIzXAGk
	 Pr70n6dQ6eqv7PDLouso8/V9DgDgPBGI6pGe0R/CJL4weevFfxOBTrVkT05j3CWU4n
	 HvdfdjQClEEzbrJAhfG4FRzoTbPCCP85wwber0v9v2eoAhp2QPa/FSkUogd4hs76li
	 m0uTs8ly6r/JRm+z1To8ns/tgGgDY7IrUCM7PF2N/xTKmLVVb8+P+RNu3KdJ4dwyqs
	 pm5VTcAddfd/Q==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 77A307C6F5;
	Fri, 16 May 2025 08:59:13 +0800 (AWST)
Message-ID: <273f8317466446cb997917f9770b6991852e09eb.camel@codeconstruct.com.au>
Subject: Re: [PATCH linux dev-6.6] usb: typec: tcpm: Add support for parsing
 pd-revision DT property
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Cosmo Chou <chou.cosmo@gmail.com>, openbmc@lists.ozlabs.org
Cc: cosmo.chou@quantatw.com, Amit Sunil Dhamne <amitsd@google.com>
Date: Fri, 16 May 2025 10:29:12 +0930
In-Reply-To: <20250513135324.1616086-1-chou.cosmo@gmail.com>
References: <20250513135324.1616086-1-chou.cosmo@gmail.com>
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

Hi Cosmo,

On Tue, 2025-05-13 at 21:53 +0800, Cosmo Chou wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
>=20
> Add support for parsing "pd-revision" DT property in TCPM and store PD
> revision and version supported by the Type-C connnector.
>=20
> It should be noted that the PD revision is the maximum possible revision
> supported by the port. This is different from the 2 bit revision set in
> PD msg headers. The purpose of the 2 bit revision value is to negotiate
> between Rev 2.X & 3.X spec rev as part of contract negotiation, while
> this is used for Get_Revision AMS after a contract is in place.
>=20
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> Link: https://lore.kernel.org/r/20241210-get_rev_upstream-v2-2-d0094e52d4=
8f@google.com
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> =C2=A0drivers/usb/typec/tcpm/tcpm.c | 46 ++++++++++++++++++++++++++++++++=
+--
> =C2=A01 file changed, 44 insertions(+), 2 deletions(-)

I briefly looked at directly backporting this to dev-6.6 from upstream
(8ecf60c3b3d4), but doing so generated conflicts. Did you find the
same? If so, please add a short note about what you fixed to the
trailer as well as your S-o-b tag, e.g.

   ...
   Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
   [Cosmo: Changed <fix summary> to resolve merge conflcts]
   Signed-off-by: <Your contact details>

Patch reports fuzz when I apply this to the tip of dev-6.6, which is
currently 5a4c98323b01 ("Merge tag 'v6.6.90' into for/openbmc/dev-
6.6"). Can you address that and re-send?

Cheers,

Andrew

