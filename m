Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C338B39390B
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 01:16:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrkGr6Zl6z300b
	for <lists+openbmc@lfdr.de>; Fri, 28 May 2021 09:16:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm2 header.b=pyDWArxu;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=RK/r/8P3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=pyDWArxu; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=RK/r/8P3; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrkGV39xCz2y0D
 for <openbmc@lists.ozlabs.org>; Fri, 28 May 2021 09:16:33 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 64AE613F4;
 Thu, 27 May 2021 19:16:27 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 27 May 2021 19:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=Nd+Ki6D7+985UB9rKvOwTETg4Pl4ryB
 UQDGrRiYCvjA=; b=pyDWArxua5EHqge3uRvrSzvcpYRVzlOs/RdZgnI0xBtCQVC
 qXuea0k3ZDjkUaJp7/t0f5Ee9obW1UvwcPibeNX80K04xmIljUSxqKyv49z2C9es
 rKCvNxY3K8s0EHiUBz+50UMCHz4S0q5fXsogfrpRe+Gj+6j9iF3fBNUkY+yW5G7g
 iNYXWr2RXpkerVeo67KyUyXSHXNLArZw80FBJH0XuGvSGfLTFdRteaMZi2TNfRGu
 GEw5DJx3kv7Jxuo3nahEbkBTN7OGdospfLRIBr+p2V2s9OCIk99xTb9i18laLrFv
 gd7NREUhPuaVvswa4/kF+dOdR8tjJAd/i+ZUYUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Nd+Ki6
 D7+985UB9rKvOwTETg4Pl4ryBUQDGrRiYCvjA=; b=RK/r/8P35d4Iztc/nTdTIp
 K7r+HJlnDs6g4fkRt5yl1QLIDXOVV6uZxtWLSpswBN4bffKahsgF27rRQoGi/TYi
 M0nCPe1QMKZ7eEdNQKiQEjok7XO67uVe3/2HxY/xfWcLBrJvjxDhPTZeBvTLFl96
 xpFHdhIrddI0qopLLLyW14MdSLxNuBcPlKRN4le0QqYOAtR/RfgQ9pgKdBsVZDDq
 G658UTCeB32CNefB6/66TjRTvBrdl2rSljXr+zNhXHZti2vPFLxcS1V9qVkfEZQo
 u6Xbgx5QnU9Kohy5dyiUXmAVPHhBTGE+YncTQkXiglM5VePkUR34VhL5vD4w3kjQ
 ==
X-ME-Sender: <xms:SiiwYHbu6wLtrgdfxwP_wGi9KLQVwg1R8CqdDLvO8ZHQ2Q2llhiNQw>
 <xme:SiiwYGaocKcLqm4ZS-GzAZo9LRTfEHUbFVHWuNd-MpMOMmYEIyUSKeyFkeCYzJZJz
 t6MD4iHjXkBaacUDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekiedgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedftehnughrvgifucflvghffhgvrhihfdcuoegrnhgurhgv
 fiesrghjrdhiugdrrghuqeenucggtffrrghtthgvrhhnpeehhfefkefgkeduveehffehie
 ehudejfeejveejfedugfefuedtuedvhefhveeuffenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:SiiwYJ-vqyvBgqJhtg-gXd_CEfeVfuOAVfBc2GWcVuEV2oijuL7kEQ>
 <xmx:SiiwYNoMWuW85gJP2z96Nv58teCixt91IlydVdkrNCMHU--8CHG6pQ>
 <xmx:SiiwYCoZH7DKty2XOk1naio_Bky1NQv8QUhTzNnInv8Y1MMmRNhbew>
 <xmx:SyiwYAFCn66xXUd0aOvJPD1HBr1kqwK9QROQBSJeuI9Y_EggZTQnRw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 70878A00079; Thu, 27 May 2021 19:16:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-468-gdb53729b73-fm-20210517.001-gdb53729b
Mime-Version: 1.0
Message-Id: <95b58f69-d706-4388-8056-7d8b058ace06@www.fastmail.com>
In-Reply-To: <CABqzqi4kV_zd1Wkm8vn_qdf5VGrnedvec3FtfE3GModQH5TuaA@mail.gmail.com>
References: <CABqzqi4kV_zd1Wkm8vn_qdf5VGrnedvec3FtfE3GModQH5TuaA@mail.gmail.com>
Date: Fri, 28 May 2021 08:46:06 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "sainath grandhi" <saiallforums@gmail.com>, openbmc@lists.ozlabs.org
Subject: Re: Using VFIO vs. developing a kernel module
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



On Thu, 27 May 2021, at 22:53, sainath grandhi wrote:
> Hello,
> Our project has an FPGA connected to BMC as a PCIe endpoint. This
> endpoint provides a set of registers via MMIO and an interrupt for
> notifying completion of work. This endpoint also implements AER
> capability.
> 
> We have two options to enable this endpoint.
> 1) Write a new kernel module with a character device interface for
> user-space interaction.
> 2) Use VFIO infrastructure provided by Linux and write an user-space
> application.
> 
> I am reaching out to the community to check if there is any
> recommended option, using VFIO vs. implementing a new kernel module,
> or any previous experiences weighing in one option over the other.

I don't have any experience with VFIO, so take this with a grain of salt.

Generally you should write an in-kernel driver for it. The reason you 
might not want to do so is if the device's register interface changes 
frequently, as it's more pain to update the kernel than some userspace 
application, which slows iteration. But handling DMAs and interrupts 
make userspace more painful, so unless VFIO helps there (I assume it 
does), then that would push the implementation back towards the kernel.

Andrew
