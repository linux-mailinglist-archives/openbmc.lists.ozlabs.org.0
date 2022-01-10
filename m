Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA0E48A007
	for <lists+openbmc@lfdr.de>; Mon, 10 Jan 2022 20:20:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXkDK4dkqz2yw5
	for <lists+openbmc@lfdr.de>; Tue, 11 Jan 2022 06:20:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com header.a=rsa-sha256 header.s=fm1 header.b=X5deQPNR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=BdKR5XCw;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=X5deQPNR; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=BdKR5XCw; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXkCq5LZ2z2xBf
 for <openbmc@lists.ozlabs.org>; Tue, 11 Jan 2022 06:19:35 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C22693201F5F;
 Mon, 10 Jan 2022 14:19:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 10 Jan 2022 14:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=message-id:subject:from:to:date
 :in-reply-to:references:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=MMYPd8aM5aFcMaflBqvI423414
 3Y/yU7wlWzyaRxlms=; b=X5deQPNR0Pc6jqIE/GstXlA68tvkvmzTfVjtE6oPLU
 +IM7zSelkXtM6YLFEC2hdjGcUd4QB4qNyCHjcwAu9DNhwV2xQIPkzdLpC0xEIm9A
 TbxOso+gEvLPqMQHh4VgN4917KZXtlgJ5gEloz5/nN4HBbpXNeTYMH9ipWQaIC+q
 AJWyE+NpLMnx9uhpaAT9pbK7rArnWvvqypk6osh2Pxjq2YhuB/w5bebXIXvaIANr
 MU1qV3GDIpnkpqfw55F+5lIoV/lw89YLJW2UGmkh5CYI0lcvDvejuvKxVNNEHmfq
 3ReLtV9Aao6O/xysxWXsAoCLEbo9nBHDQvHwPYSNdQzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=MMYPd8aM5aFcMaflBqvI4234143Y/yU7wlWzyaRxl
 ms=; b=BdKR5XCwr/8j4d2tMp0lsFRAUM1mifGtp/DL1fqr6NkXv5+w1LJHROKq/
 71BGx+nNZBR6Chj2rxCxXQzSgcQVwN14atC2DbCk4I1DW+5uAxzLt7wdRRbSBQOi
 MZB03PmWO70o1PqWN2DFazwee2TIlHPprViPgA1Dw+bnA5Dv4mGf0pOOvYQQyuKF
 TCpCWCocaZC+wj0P5FUy1VNirna62lahf0ebkES13wgjK4qm0jXcbg1jur2YIlC4
 AwsvF1xFd+tm8q2iuK+eVkc525LIJkZRs2v64BU4zxtYxho+qXlDhNbNoxR+xJN7
 8c/MlXTLZvySHit4qsvtKhvB9LtQQ==
X-ME-Sender: <xms:wYbcYdFAG7EVdVZ_vNuJpFh953BLYB2nf8nInqcTTJKmF-RJjw8kEg>
 <xme:wYbcYSV7eCsse83kBa18MM8nICvDyp6CczVjbQ2_kjiMCESTsDGMP_t7c8Dg8zRks
 -KekqOWPCh9XGNdbLM>
X-ME-Received: <xmr:wYbcYfIEbFTxd_qa8IlPDDfcLNnJW6vCrPr95EHlUAeOWVAPmjjIryvkNxT5imRaddvFwEd9dZae1pYVrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggfgsehtke
 ertddtreejnecuhfhrohhmpeeurhgrugcuuehishhhohhpuceosghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomheqnecuggftrfgrthhtvghrnheptedvieduue
 ejvddvheeggfeiffegudelhffgudduteevheffteeggeelgfffjedtnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
 grihhlfhhrohhmpegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhm
X-ME-Proxy: <xmx:wYbcYTHzaq4PD-41Zxy7sFomTj1ASo7a5iaHuQdhScuX5NFKpJiciA>
 <xmx:wYbcYTVWd0XfLPhS90nNriEiIc0xMUgBKR9q0Le07VAkhzHNreGlEQ>
 <xmx:wYbcYePuBbt0gbt8TVbIT0eRgLBrU8sqYsBWgrzgDedvLvUGea0bQQ>
 <xmx:wobcYUcORiYoLHBPkweUmqet7s7-ju9wmUyhF5w1g_zCzUKK-LitmA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Jan 2022 14:19:29 -0500 (EST)
Message-ID: <cd41ad4e6446e7e25d29eaa62d058af9797e81cd.camel@fuzziesquirrel.com>
Subject: Re: DEPO OpenBmc CCLA
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Glukhov.Mikhail@depo.ru, openbmc@lists.ozlabs.org
Date: Mon, 10 Jan 2022 14:19:27 -0500
In-Reply-To: <2c83c348aa0e30569c937698f546cab2b0fe9036.camel@depo.ru>
References: <2c83c348aa0e30569c937698f546cab2b0fe9036.camel@depo.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2021-12-27 at 05:53 +0000, Glukhov.Mikhail@depo.ru wrote:
> Hello. On December 20, I sent a email with the subject "Depo CCLA",
> but did not receive an answer. Did I do something wrong or does it
> take more time?

Hi Mikhail, you did nothing wrong 🙂

Your CCLA was accepted.  I replied on Jan 4 - maybe your corporate spam
filter put my email in your junk folder?  Here is a link:

https://lore.kernel.org/openbmc/20220104164928.jdfjoq73x2ivmsjt@cheese.fuzziesquirrel.com/

thx - brad
