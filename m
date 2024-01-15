Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7082E282
	for <lists+openbmc@lfdr.de>; Mon, 15 Jan 2024 23:19:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PYs4+34v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDRQP5Vz5z3bnc
	for <lists+openbmc@lfdr.de>; Tue, 16 Jan 2024 09:19:41 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=PYs4+34v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDRPl6CW5z2xQD
	for <openbmc@lists.ozlabs.org>; Tue, 16 Jan 2024 09:19:07 +1100 (AEDT)
Received: from [192.168.68.112] (ppp14-2-74-3.adl-apt-pir-bras31.tpg.internode.on.net [14.2.74.3])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F93C2012B;
	Tue, 16 Jan 2024 06:19:04 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1705357145;
	bh=WZpHBrv/WSwg+5SquW1RGVOKinQQz1ZIdFKz1v0NN98=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=PYs4+34vkn9RcRk1EOXTqnQseFrh48oCiR6StdvaVXQpM3siirjBIetdkn8CWEiFu
	 hnaReCUoC4xUtpm9ZTILGFz96cuilkSXoiXksxfD4dqWaEelt9nZg85QeMONnTr3p2
	 UOw/9cXQMLj6KB5fQ3DSVDh2EDWt+7F67ZMQxSDcVzZ2t1vVGlWTkB66ju6IIaPvt4
	 CcXR0RyIs2KL61RuQhuoK1wRBBAplkD7RS4btRd2Mn9O/NrKWuYxRygXh/ooGNkkle
	 ZoERk5/hxcErg4o2zNXaEJ2COJJEmXpu3hCUWJA2r36wRYhN6GWXiYH3eV/HvPFsWG
	 rXjN0VEmq69eg==
Message-ID: <63d1f92973b85756efcda420abb90a29dda5312c.camel@codeconstruct.com.au>
Subject: Re: TOF elections for 2024H1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Patrick Williams <patrick@stwcx.xyz>, OpenBMC List
	 <openbmc@lists.ozlabs.org>
Date: Tue, 16 Jan 2024 08:49:02 +1030
In-Reply-To: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
References: <ZaWZY3A4TZth-ons@heinlein.vulture-banana.ts.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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

On Mon, 2024-01-15 at 14:45 -0600, Patrick Williams wrote:
> Hello everyone,
>=20
> It is that time again for TOF elections[1].  The current election roll-ca=
ll
> is available at:
>     https://github.com/openbmc/tof-election/blob/main/2024H1/rollcall.jso=
n
>=20
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew J., Jason, Patrick, and William.
>=20
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may be nominated.
>=20
> Disagreements with the roll-call (ie. your body of contributions are not
> reflected in our current score system) may be petitions for inclusion
> at https://github.com/openbmc/technical-oversight-forum/issues
>=20
> 1. https://github.com/openbmc/docs/blob/master/tof/membership-and-voting.=
md
>=20

I will nominate myself to continue on the TOF.

Andrew
