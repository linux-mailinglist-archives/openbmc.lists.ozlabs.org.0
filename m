Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1517F5FAD1F
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 08:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mmmp66Ktwz3c7q
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 17:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ct7Wf9Nj;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=ct7Wf9Nj;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmmnW55Sjz2xrk
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 17:57:51 +1100 (AEDT)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 24AD92005F;
	Tue, 11 Oct 2022 14:57:47 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1665471467;
	bh=LmvTKfIcPyxX/fr7W0tLgaVqjlQwcyjw7PpWzGR5Wbk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ct7Wf9NjBOOrkW28Hr/l5/mczHDD8LdDfbhL8y6PbEoHk2nERx+7BXnDaywf5cCzX
	 J9u94CllYA0WJxwbSmWYdJfRHaOnTevPjWqYJD3GLc9L8BW24+UOmB/TbHp7deG23s
	 M0B3mOv/MlbMb296XVIjJ27+/qhIuqPE0Hy0uQkUatP8TPYxzY4+0aPAlVyvjWT0hu
	 cd2HjQo7Tplpt05ubxVgY1o0Eon3RIgeAhq4ZGhNJfU99NpvumACgvDOkuR3MwFrB/
	 EGQ9FDW3H+8mVSs+B+YfZ2lqm/8G3J5RsLZCp/8YPM7D8qOynTJQEFZxNvALZRGzn2
	 Z5fjs0FcCBo/A==
Message-ID: <e6302d6e5afa58cb6b7d7954907c1bfd313b9a6d.camel@codeconstruct.com.au>
Subject: Re: Unable to connect to a BMC Serial Console
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubhabrata Bose <shubhabrata.bose@tcs.com>, James Mihm
	 <james.mihm@gmail.com>
Date: Tue, 11 Oct 2022 14:57:46 +0800
In-Reply-To: <BM1PR01MB24673AE3B07F7538DF11DF8985239@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
References: 	<BM1PR01MB24678016E23DB9B97349C7A185209@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
	 <c259d074d0e5dae670bfe18155a23db600796afd.camel@codeconstruct.com.au>
	 <CADy_Pt3e=MfxBK72HkU0d8FCs_xdfFrH=2NVqMf1tntBr9CEHQ@mail.gmail.com>
	 <BM1PR01MB24673AE3B07F7538DF11DF8985239@BM1PR01MB2467.INDPRD01.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.45.3-2 
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Shubh,

> After referring to your slides 25 and 28, =C2=A0it looks like it=E2=80=99=
s the
> Host Serial port (i.e., Serial_B Port next to the IPMB port, in BLACK
> colored in your slide) that=E2=80=99s the one I am connecting to, so it=
=E2=80=99s not
> the BMC Serial port then .

OK, yeah - the BMC serial may not be populated with a header. That 3-
pin header (which I have added) is definitely the BMC serial port on my
board.

However, as James has said, the GZ sounds substantially different from
that board, so all bets are off here.

Cheers,


Jeremy
