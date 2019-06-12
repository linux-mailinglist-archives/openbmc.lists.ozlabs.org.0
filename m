Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B4641A0E
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 03:51:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nqby00nxzDqxB
	for <lists+openbmc@lfdr.de>; Wed, 12 Jun 2019 11:51:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="VKQtVnej"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="VSyt5ulo"; dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NqbH6nVfzDqq7
 for <openbmc@lists.ozlabs.org>; Wed, 12 Jun 2019 11:51:07 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0C3D82227B;
 Tue, 11 Jun 2019 21:51:05 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 11 Jun 2019 21:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=L6Xj4+gtHFfBU99XpdCjoAIjCkfu+1d
 gdhJRRXVwqpY=; b=VKQtVnejq0SPiga+wF5wPGjPEiCWSoeRh8wzfKU6QZlZOTE
 GSBBgjYjanZ7zAjotcTGIuqFVKpi8qml4E/f+wYfr2SW7VDgJAUYeDfVhtb9CUca
 GoYP4TQ4qHTmPVPesNJt1PMcnFT33KJgpFTXHylSnAhYZ5xnj02Dvd22WALW1hU0
 O2dh+RJP2hvwhQ8SwDApgwznkqPPW929EZif/GabwLRB3LhY3p5eFS7N1Ax55RwJ
 O2UeBm/03UkRTMjgzIMRbO/sK+I2hINBwCdVfAW7czHm7HWjPnmSjZgNfr9OvXri
 XYebI86j6S/Jy9DTvaJDtnRvDsElA4AX+yCBlsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=L6Xj4+
 gtHFfBU99XpdCjoAIjCkfu+1dgdhJRRXVwqpY=; b=VSyt5uloLKlcbVgVecmM/+
 0SSUHyUESPbpR+ELPObGaFE2RdOCdE6bGmF5I9cDcWwLqAaJVExc0GcF9rzT5Ghh
 dWFIt5A0zrgKvPIDL5/xwQvN1ckFiu5IdOE9ZLeGAEAtG0bbwWyf9e7tUSYBoI4R
 G8xBsHm6K+doTz4kcSEj7fxjwr4DhwYWqDcAHJMvx9Tfy8Q3oyBiUPsisveES/e+
 8NxoKwuDG3YSeoCUpJpoc04zSiolT66TyJbUMdwB0h+wTdnBXdGmEE5UwdpYrjoW
 izVFlbKojTrFFatdYpiq8JZyirKKWoK8VN7aErdSGU7nzMsFcC/Gfw15ZlgF90gg
 ==
X-ME-Sender: <xms:h1oAXcnXTJRYV2IE0a2ayvtW8CLpO2qoj6M0hJlLfhVhvRcqSDKKOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:h1oAXaNgVb094loB_wEj4lEtqJ503y3HXiTquWKyoVLNp9robKNSMw>
 <xmx:h1oAXWpQ3D3IBpem61zGqe_1_vNMIDrht1QpXylpBXIjXgD-JpZ1Pw>
 <xmx:h1oAXbsPIRV0qWx0l56GrK00VXQQOwKt_bWAi7mz58Sun5yqNhlFdw>
 <xmx:iFoAXWyskdqFXuDkGiRf0ly5tH22aJGkua2oLh3M6_qn7kkwbyYu5A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id B132AE00A1; Tue, 11 Jun 2019 21:51:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-663-gf46ad30-fmstable-20190607v1
Mime-Version: 1.0
Message-Id: <5e34d258-a153-4296-8295-0b5100a9c66a@www.fastmail.com>
In-Reply-To: <170efdca68cf69f93ee902b2c7ae7884e2a4217f.camel@arm.com>
References: <18303a54-a3b0-4645-bdad-85a0c6ce4487@www.fastmail.com>
 <170efdca68cf69f93ee902b2c7ae7884e2a4217f.camel@arm.com>
Date: Wed, 12 Jun 2019 11:20:46 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Supreeth Venkatesh" <supreeth.venkatesh@arm.com>, openbmc@lists.ozlabs.org
Subject: =?UTF-8?Q?Re:_An_in-kernel_implementation_of_MCTP_for_a_socket-based_int?=
 =?UTF-8?Q?erface_to_MCTP_networks?=
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
Cc: Ed Tanous <ed.tanous@intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Sat, 8 Jun 2019, at 05:14, Supreeth Venkatesh wrote:
> On Thu, 2019-05-30 at 17:34 +0930, Andrew Jeffery wrote:
> > 
> > The DMTF PCMI WG have defined various bindings for MCTP, including
> > PCIe VDM,
> > KCS, serial and SMBus/I2C.
> > 
> > Putting my OpenPOWER hat on, we were looking at what bindings we
> > could make use
> > of in our platform designs. We make heavy use of the LPC bus during
> > early boot,
> > and so solutions needed to be useful across that interface. This
> > requirement
> > eliminates PCIe VDM (as do constraints in our PHBs). There's also no
> > path for
> > SMBus/I2C, leaving KCS and serial. KCS as it stands is pretty much
> > MCTP wrapped
> > in IPMI across a slow interface, and serial's no speed demon either.
> > Additionally, we can only use the VUART, and there's only one in the
> > AST2400/AST2500, so if we were to use it we'd have to multiplex the
> > console
> > with MCTP messages. This is all fairly ugly.
> > 
> > What Jeremy has proposed is a yet-to-be-standardised LPC MCTP binding
> > that
> > makes use of both a portion of the LPC FW space and a KCS device in
> > the LPC IO
> > space. This is made possible on ASPEED hardware by pointing the
> > LPC2AHB bridge
> > at a region of RAM, and defining an ABI for Rx and Tx buffers within
> > that
> > memory region. The KCS interface is then lightly used as an out-of-
> > band
> > mechanism for arbitration of buffer ownership. This gets us an
> > efficient
> > LPC-based interface for MCTP on our platforms that is compatible with
> > existing
> > hardware.
> Can LPC binding be proposed to DMTF PMCI group for standardization. I
> heard it briefly mentioned by Deepak in one of the calls, but dont
> think we have a document ready yet. Correct?

Correct. Currently we're considering it a bit OpenPOWER-specific. Once we've
got a better grip on it we can consider proposing it to PMCI for standardisation.

> > 
> > What it needs
> > -------------
> > 
> > There roughly four areas of work that fall out of the idea:
> > 
> > 1. Doing the work to expose AF_MCTP from the kernel with support for
> > SOCK_RAW
> >    (exposing raw MCTP packets) and SOCK_DGRAM (fully assembled MCTP
> > messages).
> > 2. Exposing an out-of-band management interface to describe MCTP
> > networks to
> >    the kernel. The plan is to do this via the kernel's netlink
> > interface.
> Not sure by what you mean by out of band interface here. MCTP is meant
> to be used for "inside the box" communication. Can you please
> elaborate?

"Out-of-band" in this context simply meant "not using the MCTP socket":
BMC userspace will talk via a (separate) netlink socket to the kernel to
provide the kernel with the MCTP network topology information it needs
to instantiate MCTP interfaces, bridges and networks, and to route MCTP
packets across interfaces. ("Out-of-band" was not meant e.g. as a contrast
to "In-band IPMI", where communication happens external to the platform).

Hope that helps.

Andrew
