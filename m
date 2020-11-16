Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02F2B54F9
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 00:31:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZlh32d1hzDqQW
	for <lists+openbmc@lfdr.de>; Tue, 17 Nov 2020 10:31:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=XY3Fl4vD; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bmlqLe7N; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZlfg014jzDqLj
 for <openbmc@lists.ozlabs.org>; Tue, 17 Nov 2020 10:30:02 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 3879BD6D;
 Mon, 16 Nov 2020 18:29:58 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Mon, 16 Nov 2020 18:29:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm1; bh=uqrZv
 mDA7OtCetB7Terk+zE+ilhVEe6cW4X7N4Mxx/I=; b=XY3Fl4vDeOMKfCbUwiwR8
 tXRGJ/Oy1X99wAeaTNc10RrXxz1v4PD7TKtCOXplF4x/mxdJYf0njEhdGuEO2swB
 1hhsn4ENVos9OcGkFNcXGEjRxe910icTFZ1mY0G9oCpWsfZWAq4BysU3SwlnTvkw
 WdWGWtHpoIrLNVch/Ni9PxrqoVCzX63bcNtGZ8jc9wDeHRHAYkyAxPt1qlca+Ujv
 rqjuAIG0jX5hrZUOFX/SrUKuUOmmhJ6JVdPOGdlz4K2frCMs/BlRfhSl1xMSlH7r
 GcWqMS+DPvrZ4OFimglAKUMEp5IVKFGswNqaz9Mk7omgmFialWlZfhaoSJTjzP3W
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=uqrZvmDA7OtCetB7Terk+zE+ilhVEe6cW4X7N4Mxx
 /I=; b=bmlqLe7NLWqpx+UTmov/g/yE+feU+61a4qVEH64o7FPuF73avg3O+wOff
 yiT90AECgftcRA39r+kxVh6RjfmQ5OWGaP0K6TfdWiy8WnOfowCPWNJab7WsAoN4
 rCtOnUCb93znJTe3EyftuxF5Qnoi9Xjx7JxUgaVkxDUoe7KyaObDE5Tid7CGWwCY
 PerxYa1ri2SN6UGIilum8652WTe5kJXqHlHqwldrSH3nFOD92mLEQH9S/2sHuOY/
 sH0z940IBthMCq375VSZD15KqxhFBjPfPdy1w7VtX5wJlj4eKH3s0MAy+s+FVnzp
 EE44sKKVVrW7zuSGLQ4H+3+HTmp/g==
X-ME-Sender: <xms:dQuzX0t-Hu6xuwR1tiRjVOg4YKZq1AOM5ultNyzfYl5sOpy3lKZe9A>
 <xme:dQuzXxdEjYe2CvMMwSE8IdIjVdTKu8Zw64JOprpJAEzuvDgvIcSLTOpdCd5Xwfa56
 gdG_m5KkkA51fnHUQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudefvddgtdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtf
 frrghtthgvrhhnpefhgfekhfdugefhjeduhfdtgfeutdefheejveetffegudduteejieej
 hfehfffgfeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgr
 uh
X-ME-Proxy: <xmx:dQuzX_z_5lAYSI_Ej2xAVoBM-1WKEKgjFUFbUVUbUwWH-p_UfnqAig>
 <xmx:dQuzX3PSisXc_oR0YxZO20xh8Dnb9KsOVT1Ivi-78HQQkPwYLvGUxg>
 <xmx:dQuzX0-xds0VMWx1-n4bmbNJfDhDOWjFFtDJsV8zpjpR5ik3xdQ4jg>
 <xmx:dQuzX5GgfZJh54bcJjcADwLMU2tt5IZAUEVf6eAc4QpuhPwm6MFrIg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 558E7E012D; Mon, 16 Nov 2020 18:29:55 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-570-gba0a262-fm-20201106.001-gba0a2623
Mime-Version: 1.0
Message-Id: <66742cd3-7261-4839-b8fb-3da41f473758@www.fastmail.com>
In-Reply-To: <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
References: <CAFMA7evLWM5ER_KAms4may+PanjUeQPH6Wy2JoCjQkiXj84eSQ@mail.gmail.com>
 <7db605b2-2a22-7693-041d-7d85c60cadd3@linux.ibm.com>
Date: Tue, 17 Nov 2020 09:59:32 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>, openbmc@lists.ozlabs.org,
 "Radhika Pradeep" <radhika@qwaveinc.in>
Subject: Re: STEPS FOR CHANGING THE DEFAULT SERIAL CONSOLE TO UART2
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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



On Tue, 17 Nov 2020, at 08:12, Joseph Reynolds wrote:
> On 11/16/20 2:30 PM, Radhika Pradeep wrote:
> > Hi , We have a BMC board based on the AST2520 with UART2 set as seri=
al...
> > This Message Is From an External Sender
> > This message came from outside your organization.
> >
> > Hi ,
> >
> > We have a BMC board based on the AST2520 with UART2 set as serial=20=

> > console.We are using the openbmc codebase based on ast2500 with aspe=
ed-g5.
> >
> > Since the default uart console is set to uart5 we are not able to ge=
t=20
> > the serial console output.
> >
> > We just got a "mw" command used in uboot to change the register for=20=

> > UART5 TO IO2 routing which can only be done temporarily.
> >
> > Because we have the console connected to UART2 only. So we need to g=
et=20
> > the console output at UART2 each time the board boots up.
> >
> > Could you please provide us with the information on how to change=20=

> > routing permanently or the information about=C2=A0 the file which ca=
n be=20
> > modified to change the register values permanently to get the uart2=20=

> > console output.?
> >
>=20
> Did you see UARTs described here?=20
> https://github.com/openbmc/docs/blob/master/architecture/interface-ove=
rview.md
> Which links to this?=C2=A0 https://github.com/openbmc/obmc-console
>=20

The query is about the BMC console, not the host console, so obmc-consol=
e and=20
the related documentation is not relevant here.

Andrew
