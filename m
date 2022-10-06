Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E8E5F5F4C
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 05:09:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjbyQ5wNkz3bj8
	for <lists+openbmc@lfdr.de>; Thu,  6 Oct 2022 14:09:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=qHWU0Swl;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TJ7mnv46;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=qHWU0Swl;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=TJ7mnv46;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjbxn4S1wz2x9v;
	Thu,  6 Oct 2022 14:09:01 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 4D8A33200917;
	Wed,  5 Oct 2022 23:08:59 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Wed, 05 Oct 2022 23:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1665025738; x=1665112138; bh=YLPP3ai1CZ
	bUXBkGYE8FeExSwido5nCV0cHPJQIZgPI=; b=qHWU0SwlVVnJjB+094CvRTb1w6
	IKxxEGUwvbAlOp91pDIrd8m71GNQrAXv9OhLyaEp//5FrQUfi4J4x1OxkX7l4o0M
	3HeslnRwe1WX03r3zfB5tGCoqd6hBsjeOz/fWiMBF8ad25vmNqFEcAj2vvA5v3Wy
	xhsy5oGmvzD0zhz7Me1K9piEJW53zGSbcw8NU16zcwt1u+FYFrtK8uIb+2eqJR1i
	iZmdyhZNxGXGx3hn9UXQWKdNgSCvF+Amm+7nyI9u9JOjivuD51O/k6dCtukQSurh
	iv/jlUiTlO1/HYJWkkZLUh0Ck0cdoyekgxRs8dZROXxyquzmB+cw/ZUVwPTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1665025738; x=1665112138; bh=YLPP3ai1CZbUXBkGYE8FeExSwido
	5nCV0cHPJQIZgPI=; b=TJ7mnv46ihjN1lCqaaKBPvtrx6U+cE38GW8Vaa7CIxbb
	09FghGEiiOiBTtQgnn1Xrx+LPnH2GTBBYLn8HEUAvT/jckSTsGMnE7K/3o1F7l79
	PQCbdtdSshABmoVI/vsnxgyjWfuHh44BtCSVbTENhyxlbcdHy9kFibB5Y2HYCDWz
	w5xDMIcce412xIDNjZEQzebiu12TfFxMsmg2KEdtUQdjdpe3+ehmPVglpLJuMHZL
	WJQRrrdWmGguKmaRqWSGmM/EfvBMUq61/JgJANZVJO2IQVa7GytsdPdCaQNB6uBM
	Sa45eLRZ8ofAJxHcbMumVm0fPeZ9rtwHFThgtNetUA==
X-ME-Sender: <xms:ykY-Y-xryuzZQ8qGBDii0q6_gb8aUWSmxCglPzOV10y61jTvgyQoRA>
    <xme:ykY-Y6QXrBzBx0r8Sgs3hZLNwepcQauDk20aZloJC-5IaG3fr30VFYXnjAas68k2O
    G0bSQj8ZdnjX2NoVA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeigedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehn
    ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
    frrghtthgvrhhnpeekvdekjeekgfejudffteetgeejkeetteduvedtffdtledutdfhheev
    feetkeeiteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhroh
    hmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:ykY-YwXBE82SIdOTLaedMFXhtA3X2LwdUQX3DOxDmIowTpTUBMTQHA>
    <xmx:ykY-Y0gZU5zGzX53fUbgNPR81D3g2aAiBQmV6XXxVZKCzOp2f7YbOw>
    <xmx:ykY-YwA4vDJI5dG7dw-F95RLRCypWR11glTCIyCAPXUzatf9W9EgsQ>
    <xmx:ykY-YzNSalJ-zI_eDlKA_x8-s8ZIZORKv5y5tnx7Hn_OlOLkOjys9Q>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AF10E1700083; Wed,  5 Oct 2022 23:08:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1015-gaf7d526680-fm-20220929.001-gaf7d5266
Mime-Version: 1.0
Message-Id: <c992be3d-2002-44e3-8bee-9ded84145ad1@app.fastmail.com>
In-Reply-To: <Yz4ZU8Ron/b9GV6p@minyard.net>
References: <20220812144741.240315-1-andrew@aj.id.au>
 <08c20621-e75d-4a72-82e6-b1980304e20a@app.fastmail.com>
 <Yz4ZU8Ron/b9GV6p@minyard.net>
Date: Thu, 06 Oct 2022 13:38:30 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Corey Minyard" <minyard@acm.org>
Subject: Re: [PATCH] ipmi: kcs: Poll OBF briefly to reduce OBE latency
Content-Type: text/plain
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
Cc: linux-arm-kernel@lists.infradead.org, openipmi-developer@lists.sourceforge.net, openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Thu, 6 Oct 2022, at 10:24, Corey Minyard wrote:
> On Thu, Oct 06, 2022 at 09:42:57AM +1030, Andrew Jeffery wrote:
>> Hi Corey,
>> 
>> On Sat, 13 Aug 2022, at 00:17, Andrew Jeffery wrote:
>> > The ASPEED KCS devices don't provide a BMC-side interrupt for the host
>> > reading the output data register (ODR). The act of the host reading ODR
>> > clears the output buffer full (OBF) flag in the status register (STR),
>> > informing the BMC it can transmit a subsequent byte.
>> >
>> > On the BMC side the KCS client must enable the OBE event *and* perform a
>> > subsequent read of STR anyway to avoid races - the polling provides a
>> > window for the host to read ODR if data was freshly written while
>> > minimising BMC-side latency.
>> 
>> Just wondering whether you're happy to pick this one up? I haven't seen 
>> it hit the IPMI tree yet.
>
> Sorry.  It's in my tree for 6.2 right now.

Thanks!

>
> I can't push it up to for-next until 6.1-rc1 comes out.
>

No worries, just wanted to make sure it didn't fall through the cracks 
:)

Andrew
