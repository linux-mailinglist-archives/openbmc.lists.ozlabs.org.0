Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FD058BE73
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 02:25:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M1H6n42yFz2yMk
	for <lists+openbmc@lfdr.de>; Mon,  8 Aug 2022 10:25:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=N+W8XF3F;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jDKGmU17;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aj.id.au (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=N+W8XF3F;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jDKGmU17;
	dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M1H6G53htz2xGf
	for <openbmc@lists.ozlabs.org>; Mon,  8 Aug 2022 10:25:25 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id BF18E5C00DA;
	Sun,  7 Aug 2022 20:25:20 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute3.internal (MEProxy); Sun, 07 Aug 2022 20:25:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1659918320; x=1660004720; bh=7YOFe4vwF0
	urE3XokQdpVPe6yv4mvSrMjRoCtJ9bgF0=; b=N+W8XF3FU+tXMhJafpp4R6fEwM
	mToLm3nhGoepmbBp+5IrGLoYuVdPFY4OInRKRUdQfarJCjoH4F3VF+3CwGr+ZFc+
	wW/YaPQvMXM4whBdgaegrIRS+4kI81mmePME3gnxnuP5y6dmjMhvd3ncAXJf/+Me
	ISTGGNb+vy1NQmB4aHDsTij0BLfw+NK7LwCWxVYFHtnbh8/PgBfE/eaYPNenGc3x
	VwPFHxRrosnlCClS4zSN1UVktfGtgJqBqjJOLgVQgGISKDG3HXbilphDC9/Rx9tf
	uJa75t0ykqk6pFSAEwdHMq8tXJnbPIwKl6iCuxj7GmjqYi54ec0I3M5ZClZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1659918320; x=1660004720; bh=7YOFe4vwF0urE3XokQdpVPe6yv4m
	vSrMjRoCtJ9bgF0=; b=jDKGmU17886/vjIbusvydyco7vkKqMskJgU8Mz2hIqiM
	+NiT/tAu5kfWemz2R4K2bww524F7TpCRlfpsUkDMCsDBkJT5+hRFBuspK+VPikjV
	HQgN/RXpJY9h5MN8D5xF6GUb912SlKe4+J/704z92TnXMnPgaRqO9u1aJwSB+ig2
	jP0b8cVgFO7M+nsqJ7C6k21gvLJOW1c2yDopueUvIv+xjWTCQho9WxPWHJO7V7GD
	RXI7nv+DfVcHc97o/ffPyz9oXp/cemFOzJfkMtVUrTeTC2e9tXLmFdHbIqTqiQHH
	j22w8+X+m1RI6VctgOsCpklassyhNS815VsX/nMQtQ==
X-ME-Sender: <xms:8FfwYuAgZoBTg1APAxtjJdLV7sgRd4kdM29UrV5hDBxtJ9lqWUy_fw>
    <xme:8FfwYohbe0PPurX4ftECIxXWSDjoN9gnJhQ9RLFSIbQqeXjrSj5YdnNs-pHq0Dq5E
    9YWUhjCok0YOULfWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefjedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecuggftrf
    grthhtvghrnhephefhfeekgfekudevheffheeihedujeefjeevjeefudfgfeeutdeuvdeh
    hfevueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:8FfwYhmBgtiMU4LRiBa5A8B8dB8dH6-XC-V6D3C3_LTG94mjirmHvg>
    <xmx:8FfwYszZfGVzkn3bg50zuCom-LaHQQGhI9weMRengaLLIsEU7164Aw>
    <xmx:8FfwYjTIKU72JcfMDiDg55jFjJ1rr-ipkCvedbJ8uWiBiVLeXcXN_A>
    <xmx:8FfwYk5I605FcDYcOxRq1KrQlD1O8Aemaj-Fp290pI2gjRzwH_anTg>
Feedback-ID: idfb84289:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 37F73170007E; Sun,  7 Aug 2022 20:25:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-758-ge0d20a54e1-fm-20220729.001-ge0d20a54
Mime-Version: 1.0
Message-Id: <d147bf3e-6140-441f-8393-9677e25d8d82@www.fastmail.com>
In-Reply-To: <b090805f-0387-26dc-0274-eebf0f28c432@linux.microsoft.com>
References: <1bb24451-1407-75e1-ec02-d8d9a90ddb13@linux.ibm.com>
 <8c79b178-0abb-5f9f-037e-bff9931fd887@linux.ibm.com>
 <9922163c-3d64-48ff-a808-b4b8dcfcb32d@www.fastmail.com>
 <b090805f-0387-26dc-0274-eebf0f28c432@linux.microsoft.com>
Date: Mon, 08 Aug 2022 09:55:00 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Dhananjay Phadke" <dphadke@linux.microsoft.com>,
 "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Security Working Group meeting - Wednesday August 3 - results
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 6 Aug 2022, at 05:49, Dhananjay Phadke wrote:
> On 8/3/2022 8:01 PM, Andrew Jeffery wrote:
>> 
>> We already hold weekly Technical Oversight Forum meetings and
>> fortnightly PMCI get-togethers on the respective discord voice channels
>> and it works very well.
>> 
>> IMO Joseph, you should just start hosting the calls on discord. People
>> will move to it if they wish to continue to attend.
>
> Another issue is current Webex setup is, messages are not accessible 
> after meeting ends, discord channel would solve this offline access?
>

Yeah I think it would based on a quick glance at Joseph having 
commented in the Security voice channel, though I haven't used the 
voice channel chat feature yet myself.

Andrew
