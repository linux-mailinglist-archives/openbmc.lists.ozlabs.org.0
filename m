Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E713D9986
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 01:35:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZql6534kz3bWt
	for <lists+openbmc@lfdr.de>; Thu, 29 Jul 2021 09:34:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=LvJHs9j3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZiJrGkGb;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=LvJHs9j3; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ZiJrGkGb; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZqkm2V1Tz300C
 for <openbmc@lists.ozlabs.org>; Thu, 29 Jul 2021 09:34:39 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 194495C00D1;
 Wed, 28 Jul 2021 19:34:36 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Wed, 28 Jul 2021 19:34:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=iBkK3EV98psI9DcP+ydy/PRXql01JcK
 FfTJrtYIxJ68=; b=LvJHs9j3exMzAEpT5kAHYqmvPHHRYFm5iHN1FRXfY9Vo+wd
 bygEnfkJEsI7j5/iH89uboopi7s3NZBnMBF8STPdNjy1e3aJcU576L/hWU+5WFil
 c2VrUwYHGDrAB9JEJ+d6PR1ob6/P22N9rx5P8o6gr+nfzSdx9cYA2x3KH41FUPpb
 LsPfmjfGGp5FxxCRwTPZPhDzABldNIH57AQGNu5Fc6aDJqDJqjjEF7jYCh5EEWiQ
 QS/t+ADLsFw0B5K0Qgy0zNXe4XBKC8c4vsUDBiy/P7MBM2Et/YToP7iwYd/i1P6x
 nE2T2VONQfj0crX388VNlP00qIX5ijEfKDxqOkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=iBkK3E
 V98psI9DcP+ydy/PRXql01JcKFfTJrtYIxJ68=; b=ZiJrGkGbYMfXPcK/MP05XQ
 ud/aiUK/pPz9NDmdypZ2M+R9jBAxyFMiCtIP1Flh2h22ZGtjm62kNyP7NHZ+iOno
 6QIPM8pX3n94mfCNS0ScO6XRYCpxTWSK96II3L7GY51jJGtGL44y/hjMvH9ZCx1N
 END3Alqt5ZCE6p8ZLIRaLCQ2raqTvn86HIYvH+vE+tMrLpj49+YxhN2hnymEOdyO
 ub1RTwfiA22AAfQW4FLqH50buERSVcwxGzf22UnnfG3waPIgODXhZuI+5OQW1vX5
 GSlLVP7KuyboqiwXiJfYbCccXPgBqeBmrMfVW2Cm9iQRzqbY1AWmgqnnPobS8+Mg
 ==
X-ME-Sender: <xms:i-kBYR5talA0uwlI_Ox37-JorU6Mzy8YLcdElJOMMmjCqEk-qHzY_A>
 <xme:i-kBYe6F975O-s0ObBGIERJ5DKtRY79J-7Dw0Iz5lu317g3MG_YLgUN_HH7Kce8DQ
 38n5ofQwtwFTN674A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrhedtgdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepvdetjeejjeevhffgfedvudejffduteeu
 gfeigfegkeevheeuffdtveetvdegtddunecuffhomhgrihhnpehophgvnhgsmhgtqdhprh
 hojhgvtghtrdighiiipdhsthhruhgtthhurhgvugdqlhhoghhgihhnghdrmhgunecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifse
 grjhdrihgurdgruh
X-ME-Proxy: <xmx:i-kBYYcygISkzMAwiJzGqEqvMW-AEyq_TBiAKN0nrnTLqJLorGJJpQ>
 <xmx:i-kBYaI5UoNOAhHSXo8nKH715q4Btu14p46PTrT2CECeOYlb5c2CBA>
 <xmx:i-kBYVLaZaPhLFFegrJrCeni-8DvsUH3SLu8PEnFda60xMwfdTu03w>
 <xmx:jOkBYYlIQffhOWdWLyuqSMWtHz6zO2mhGnGsUu4ieIGCHWOARsnusg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2545FAC0DD0; Wed, 28 Jul 2021 19:34:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-545-g7a4eea542e-fm-20210727.001-g7a4eea54
Mime-Version: 1.0
Message-Id: <e1b41c2e-bcad-4282-a3b9-8f5344cab056@www.fastmail.com>
In-Reply-To: <YQD4TWus75QQjH3U@heinlein>
References: <YQBrbuQFz4JihBAE@heinlein>
 <41a334dd-56c4-44d0-b8f4-7ecdf5bfa5de@www.fastmail.com>
 <YQD4TWus75QQjH3U@heinlein>
Date: Thu, 29 Jul 2021 09:04:14 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Patrick Williams" <patrick@stwcx.xyz>
Subject: Re: `phosphor-logging` APIs (RFC)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, 28 Jul 2021, at 15:55, Patrick Williams wrote:
> On Wed, Jul 28, 2021 at 03:22:43PM +0930, Andrew Jeffery wrote:
> > On Wed, 28 Jul 2021, at 05:54, Patrick Williams wrote:
> 
> > >     - Useful data is missing from `journalctl` resulting in people working
> > >       around it by generating strings with `fmt` et.al.
> > 
> > Sounds promising! Reading the proposal it seems like you're appending 
> > certain bits of structured data to the message. I think it would be 
> > nice if the data could be interpolated into arbitrary positions and not 
> > just appended (note, I'm not asking for interpolation of arbitrary 
> > variables here unlike what can be achieved with raw use of fmt, only 
> > those captured via the structured logging).
> 
> Can you give me a concrete example of what you mean by this?  I'm not
> understanding.

I've left a comment on the patch:

https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-logging/+/45310/1/docs/structured-logging.md#60

But duplicating that here, how I'd like to use the API and what I'd 
like to see in the resulting journal message is:

```
value = "xyz.openbmc_project.EntityManager";
lg2::error("Error talking to {ENTITY} error code is {ERRNO}", "ENTITY", value, "ERRNO", 2);
```

The lg2 implementation renders the values into the format string and 
forwards the result as MESSAGE to the journal, along with the 
structured values (ENTITY and ERRNO in the example).

```
$ journalctl -b
...
Nov 25 13:13:09 bmc fansensor[3006]: Error talking to xyz.openbmc_project.EntityManager error code is 2
...
```

Better yet would be if we could just forward the format string and 
journalctl renders this at invocation time, but we'd need to work with 
upstream on that.

Andrew
