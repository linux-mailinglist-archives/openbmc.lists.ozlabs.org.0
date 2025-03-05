Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6372A53E9F
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 00:44:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z7Tfk0xCzz3cj7
	for <lists+openbmc@lfdr.de>; Thu,  6 Mar 2025 10:44:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741218267;
	cv=none; b=i0fuL8OY9JBg50zqvACtZg31v//dbFBB1ogj6DGJDxr6edOs+fhaLfMJjYHNbLVH2SHfTzMDXZuUwBsmixvZpdnZAhaUNFH1xIfZ8WsEVMWyAgA8Bb0PWL8+kH9cq1hg5lI33ytPD3DYcqPqE1PV+j93G8BxkXeKCRVvU1yWmpn/736sLWLWwfcxZA0ro8ilUwNrnctIKSgFhLmUw//eJg6D8NTW8U7N6KHFPUsraRptlNODbnIuD1iqn4Juv3aXojb0T9znx8kI9dhuz01uyBIjspyWQ2JSX23B5sTvOzSnLuw5kH9OHXX8u9RXpg6+hPi4gWGEDRjGO9kftarZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741218267; c=relaxed/relaxed;
	bh=uZ2F7dlit92NiZ+saIt5u+MI8QhvhIcLd9ZLAk6/B1A=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SejScZvL9T8H7k9mlJDvC+t/TQOUKgz2ImfLCB1CZLB7HeqmdQLKEQw2MJVFc4eaV0MRhodI0ipgyxv0l0Ti+WRA+BG8XBO4nPJzSzJBTDC0IdhiCyQ4fPxN7lilNo1NY2Mqr6u8d/BbeYz18YFmEpCOPi1YuLMxuwzRJLW3/WU2cq+Fba9XVNlFKz9w+8OnKkBZ6WN57Txglin9ndMxwdijNCYvJ6JR/lYsYnS7AGzWg53n6LNbPlAJerB5ix2bJHIKwMLOxja3UyDLfJzdHefHiZRZc4VQALLUG10Dn1Tna2ZDbcEF3OC8kemWEn9mtnpQQSZlkCQqZjJR6iV5/w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=emgARDJY; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=emgARDJY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z7Tff3RlZz30Vr
	for <openbmc@lists.ozlabs.org>; Thu,  6 Mar 2025 10:44:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1741218264;
	bh=uZ2F7dlit92NiZ+saIt5u+MI8QhvhIcLd9ZLAk6/B1A=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=emgARDJY3kOCH5S0tcnvBttQ0zs4ofxQfeXMfRlKvDE6oe2/7e7i+H3uV4W0fI4bV
	 Ro/4+tzQ+F70LG3dHea7ILHEG6IiSyzS6o3D/lkDNy6WSF6CkZYdapNF40Jc49/YLL
	 sM6WYgjheebLlvhHYEQlQs1al1VaY8okzZ0CV2CNpXxp8DDZIsRBfAKwh1Ne53gTQv
	 9rHVH2l54IwPNsY/c9CJNniJ/7CdkHL3sJC6TSMW3QBAGlFzjF5Qx/Ylk5S7BZm/tR
	 0Q9MdRcot7KV9NMZQNnjXMxN/ubOqYQtDgvYtj+sEIGt5Zlvma5N+ZlmAkl/XJcQaO
	 Znea20f2NpMaA==
Received: from [192.168.68.112] (ppp118-210-65-207.adl-adc-lon-bras32.tpg.internode.on.net [118.210.65.207])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id ED6D975FDA;
	Thu,  6 Mar 2025 07:44:22 +0800 (AWST)
Message-ID: <cc3237d56b12b48aaf327c3c972bdb86937a002c.camel@codeconstruct.com.au>
Subject: Re: TOF elections for 2025H1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Thu, 06 Mar 2025 10:14:21 +1030
In-Reply-To: <Z8ec-DOTlSM8FMhC@heinlein>
References: <Z8ec-DOTlSM8FMhC@heinlein>
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Tue, 2025-03-04 at 19:38 -0500, Patrick Williams wrote:
> Hello,
>=20
> It is time again for TOF elections.=C2=A0 The current roll-call is
> available
> at:
> =C2=A0=C2=A0=C2=A0 https://github.com/openbmc/tof-election/tree/main/2025=
H1
>=20
> For this half, we have 4 seats up for election.=C2=A0 Currently those are
> held by Andrew J., Jason, Patrick, and William.=C2=A0 Due to slipping fro=
m
> the developer membership, Jason is not eligible for re-election.
>=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.=C2=A0 Only those eligible to vote may be
> nominated.
>=20
> Nominations are due by Sunday March 16th, 2024.=C2=A0 The election, if
> required, will be held immediately after with more details to follow.


I nominate myself for re-election.

Andrew
