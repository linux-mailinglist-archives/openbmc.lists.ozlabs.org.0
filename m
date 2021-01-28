Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B4F306AD7
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 03:00:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3b52wPwzDqM0
	for <lists+openbmc@lfdr.de>; Thu, 28 Jan 2021 13:00:33 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fuzziesquirrel.com (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=bradleyb@fuzziesquirrel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fuzziesquirrel.com header.i=@fuzziesquirrel.com
 header.a=rsa-sha256 header.s=fm1 header.b=Rkk7clQZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=j6qgnejV; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2PB66dQzDrBj
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2021 12:06:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D5F375C01F0;
 Wed, 27 Jan 2021 20:06:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 Jan 2021 20:06:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 fuzziesquirrel.com; h=date:from:to:cc:subject:message-id
 :references:mime-version:content-type:in-reply-to; s=fm1; bh=LtL
 rsMqTX9srZ1meFsiDtZXOlwaTvN6tUrJjoZdRf7c=; b=Rkk7clQZ0saP3S6+CN3
 +v1BaiX6HRbHK5hBOGveQZXL6IODDKa98G+3MXQfI8VfFmZT+9Wl5zttAVXiwVmh
 R3c4DIYvIaJDmBvdiS74+qmod1TfMNph7QwmZo/blofq5BILcoKzsc2JbzRp8Acc
 8tunQhXPRFLbtL82J8dUGKXy3zt1BRPBPF5lQRns0NZud9pNQrZyKM/owLFO5OTv
 Z9jWCgJgIa+vMZ2P4xM9T1D0J/Gfe+FowTKKmQu2lqRv6rsDRdoZ8W47qyRkATPC
 vMgn4LBTCtWPsDRONoGOh8BG5QbSRcG62NQ3uoe5B11S5SS8cGs8GqsYhD99ljjg
 Q4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LtLrsM
 qTX9srZ1meFsiDtZXOlwaTvN6tUrJjoZdRf7c=; b=j6qgnejVapqIrS6xpqWSIm
 TQrZ1cccPQEQC2Rsf5elH+qf3QJ2fYcmyi4npA7EVABvhoCeao6+1q3HBFS36LrA
 Nw2j/vZBoXRkyN4SuOisjy17zIVQHxwH9hlJV30xMljMNR7pdOuM/thBFDmC5jBL
 HO9iSTv42+07M6Gd/m9AMOVlOLP0GdAf+NNU8sodJI3R7/Ir+EjjM2TxPlfvcCzp
 k2FKuMMzXZtBHz3+qykR2tIRPUVHnR8lHg8WgL3nEOl8UyBnxaIzxuC5PuMLXlDW
 wjnOVXuM2VXB1PiRYOCwLO9yEocPrmUAyxP32QuQhYk8HvmY8QkF+0HIXnNIPJFw
 ==
X-ME-Sender: <xms:Kw4SYDRQFYnDXC90E0DR6UiG1C0SdUgOBPvnf-r47LyQyW5kSuBIiQ>
 <xme:Kw4SYEz6B9Sj-j126xcfWuiSDHNqGE83OgLkIJ4p7ROUhPoBTQv4EFRJs0Tsbwgnt
 -FQjS6_mTcoTWCZRJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehrrgguuceu
 ihhshhhophcuoegsrhgrughlvgihsgesfhhuiiiiihgvshhquhhirhhrvghlrdgtohhmqe
 enucggtffrrghtthgvrhhnpeeffffhfeehgedutddvtdeuiefhudeifeekfeeifeekfedu
 feeuvedulefgkefffeenucfkphepudejfedrudeijedrfedurdduleejnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghrrggulhgvhigssehf
 uhiiiihivghsqhhuihhrrhgvlhdrtghomh
X-ME-Proxy: <xmx:Kw4SYI0ytg8nyj6DN1mbDZVMz8itq3gwNWbytwlKDH4aJzhxATY2eQ>
 <xmx:Kw4SYDCg3YZcuCGoNL4x3a5FxVz295m6ffTGm_EuynKiSMrqorHOsg>
 <xmx:Kw4SYMgYzBIh6DnTHWeXDM1WOHlu_SN0WHjILTP0PnnLhuMSvHkMPg>
 <xmx:Kw4SYKeqPBoZolDtGIqY1seINRzn8BloumLdJNp7L2Pnv67KK4wSwA>
Received: from thinkpad.fuzziesquirrel.com (unknown [173.167.31.197])
 by mail.messagingengine.com (Postfix) with ESMTPA id 75222108005C;
 Wed, 27 Jan 2021 20:06:51 -0500 (EST)
Date: Wed, 27 Jan 2021 20:06:50 -0500
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: Nancy Yuen <yuenn@google.com>
Subject: Re: request repo meta-tyan
Message-ID: <20210128010650.pvafu52hayv5rfvw@thinkpad.fuzziesquirrel.com>
References: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CADfYTpENhwh+o9fYhNbtDP7RZFP=C5A5gi100TZuO5NpXdK1Uw@mail.gmail.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 04:02:02PM -0800, Nancy Yuen wrote:
>We are bringing up some Tyan machines using OpenBMC request the creation of
>a meta-tyan repo.

Hi Nancy

With the owners plugin fully deployed and operational you should be able 
to submit a new meta-tyan to openbmc/openbmc.  Let us know if there are 
any problems there.

thx - brad
