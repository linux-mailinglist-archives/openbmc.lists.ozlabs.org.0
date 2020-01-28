Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B227A14AD3E
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 01:35:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48671Z54LlzDqGg
	for <lists+openbmc@lfdr.de>; Tue, 28 Jan 2020 11:35:14 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.18;
 helo=wnew4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=jRd1UP4A; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=WGURrXmL; 
 dkim-atps=neutral
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48670r4YXxzDqCk
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jan 2020 11:34:36 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id BF80D56E;
 Mon, 27 Jan 2020 19:34:32 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 27 Jan 2020 19:34:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=Q2osZlpfo6p20zNQOxsnn1lJjaI7EbZ
 h2NpclMwO7Ts=; b=jRd1UP4AHsi0mWw7M1Euns2l2U9WBlLCtl4Cptt8WFp+74s
 wC0Wp7HJgSQ2tzmkzcQec1VGJbTKvbziduEYnRoxNU4Uuhac/fsTblvVTM9EAs6u
 hmk32DCCT58aUaLPWSFDnis3SiJOjkbiJpDgiPGzxReIF8aZQbWkxNqgizG82bji
 tCi9bthMZl5/HNqobbAW0ImCvQgF+teq5o4Byk7pHmN80GFY5/x6jDlasqddZ+KE
 P+KoY2nkxVSn/MCkC3mNjJ53TCJtXh8fBHjyCvAUX6/enksqzV3vlWOGbpHhVRHp
 F2spEvpRm2SxhQBYbfvGWqJlODJpPOF7blR7ghQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Q2osZl
 pfo6p20zNQOxsnn1lJjaI7EbZh2NpclMwO7Ts=; b=WGURrXmLai8cYBbXZ+im1F
 wCpne6J8gu2HWkjYwsg6RWXpWuNXjAnqorBKYH2PkwQQ8drbt7tnMNnjBY4noZ3n
 4zJsu9/wRw/rtu8yubwqD3GSvRuKFteVtFYF8xjLRXM4KqbN62tSEiupgxUrKTZK
 XcnHVMzG6XLxzMDYjrc/SxAwdpxl82CXcZkIRFq63grWXNFhW+SeSCfwGLxdmFoW
 v1NWigzC+eiyWQXRYwl+24NphdX5UvkS7neeVva/OQ6jOJIy600s6T9OT3LXKchA
 mG3Ia5RhQN6mMeXurkb9qn4Gq8TpqUqkcMidllmoF287e+UoHIlv7qL+gYO66Bhg
 ==
X-ME-Sender: <xms:l4EvXgEKtH3oXuA9syqRXolJ5Iu9As8RDxw3fG7LASRW9BV4xNBXfQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeefgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghj
 rdhiugdrrghu
X-ME-Proxy: <xmx:l4EvXuMb4l-2AkWDTNZcVXzKw6Wx6SGoLTHxdlSuv-YNC0aykYlidg>
 <xmx:l4EvXnviw9-rAI4PASWLYgBIkuNHcuD9bUTuBx5CFDNirsqLLfi-IQ>
 <xmx:l4EvXkLA6MPgSNwSXeoSFPDlEu_bQasiE2ngqs126Xy4-wWN75PpvA>
 <xmx:mIEvXiFIZvsdHs9XCzR-2gennBOPK_qp7AbU7YSAeKD7fUbGnruy8xhcO9Y>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6387FE00A2; Mon, 27 Jan 2020 19:34:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-781-gfc16016-fmstable-20200127v1
Mime-Version: 1.0
Message-Id: <13a2567e-5426-4dc5-b7fd-4d982203eb61@www.fastmail.com>
In-Reply-To: <CAH1kD+bewL+yeW82bb_1uJx1cx6y_EC5oLXEHkwGwWM8wy8TUw@mail.gmail.com>
References: <67e599e4-0b45-aa01-1e27-d49c52873646@linux.intel.com>
 <13B92308-8346-4B8F-9A1C-139A0B11A762@fb.com>
 <CAH1kD+bewL+yeW82bb_1uJx1cx6y_EC5oLXEHkwGwWM8wy8TUw@mail.gmail.com>
Date: Tue, 28 Jan 2020 11:04:14 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Richard Hanley" <rhanley@google.com>, "Vijay Khemka" <vijaykhemka@fb.com>
Subject: Re: Reg OpenBMC PMCI Workgroup
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
Cc: "tomjoseph@in.ibm.com" <tomjoseph@in.ibm.com>,
 James Mihm <James.Mihm@intel.com>, "Winiarska,
 Iwona" <iwona.winiarska@intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 "piotr.matuszczak@intel.com" <piotr.matuszczak@intel.com>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, "Thomaiyar,
 Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "sumanth.bhat@linux.intel.com" <sumanth.bhat@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 25 Jan 2020, at 08:17, Richard Hanley wrote:
> Hi Richard,
> 
> +1 on interest from PST time zone. I know I've personally been 
> struggling with how to get meetings that cover most timezones. I'm 
> starting to think that a possible system is to alternating between two 
> set times. That way most people can be somewhat involved.
>

I'm in ACDT (UTC+10:30), PST can work for me but at the wrong end of
the day for what works for Richard. I'm maintaining libmctp with Jeremy
and have a plan for implementing kernel-based MCTP support, so really
want to be present at any related get-togethers.

Andrew
