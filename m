Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0677B126FA3
	for <lists+openbmc@lfdr.de>; Thu, 19 Dec 2019 22:19:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47f4X35d9fzDqVr
	for <lists+openbmc@lfdr.de>; Fri, 20 Dec 2019 08:19:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.20;
 helo=wout4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="BOhu0/HT"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="xEeCoc9B"; dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47f4Vw37JDzDqr5
 for <openbmc@lists.ozlabs.org>; Fri, 20 Dec 2019 08:18:48 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 49DE07CD;
 Thu, 19 Dec 2019 16:18:44 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Thu, 19 Dec 2019 16:18:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=1D+qG4rpQ83CyInUPfEOBmOMxNDNnwa
 /S4jGwJfuKNw=; b=BOhu0/HTBXJ6OKww//VVECP8tckJ8IoYq2mi4Ey6iL28hzh
 B7Elz+r8aA0eWDBQdY5yEK6Z5GCo3Idu/IaKMWimcAcKVZ9MgjgGj2wsS+sblitm
 O1Cq4qHlDCfE/rc3hwxNGmDRnECsk1VUdKSq3yd1unzgvJJlFwbUfQdDJU3/ivrD
 Z5WnHqno7qEqZfmKOBt5rxJNV2nUqTZZ7OkKCcW8AKLWG3vQ7Gb3CC7s1rjkf1G0
 W8QLah87mWm2X84IT81B2ool1mtt9pdG361aWS+d4bSBlM/b62XmoqgMFA12XN9R
 qmQAoqu4EV/IBtFpJ+vqXEJPzbB+BinOd1lGfIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1D+qG4
 rpQ83CyInUPfEOBmOMxNDNnwa/S4jGwJfuKNw=; b=xEeCoc9BTDyAS5JTSpIpOc
 ZsSGFSPa+ursJm9Rfodm+cZJdRHq7dwYiaSLSDCuF8YVPGw12BhAp4TyFu8pFVjH
 tlCArvY60c+ZXMyfQKxk3V2LMCtL82m7vigF0me+bTCCZP0ttV2T9Mi0JJ96zv7L
 lYNa9450/pLv05ZpvQfOOqHK+Pwx454bfszZEPmMKTb85b+cXH4hIAFeFAnoTy76
 nJypypwjvDH0oq732XFk8U9pyMCshwSEEtC25rogwsw4XwIZuPdEXuJ7yyp7fiwo
 L3grnTfSYCL4x07Xbj4AzbEvRzkSQUxHlWhqEEwr6gTDyawAOm/1JcDDOYp2nCMA
 ==
X-ME-Sender: <xms:M-n7XYx_CeiZKk1brWlWxuYKKFT7iwxaoH8LgV5AmXdRsRwX0iaKDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddgudegiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughr
 vgifsegrjhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfi
 esrghjrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:M-n7XRggsmAKdm7A8syW_ArYFhH3lrBbKInYNpRZiddQR7eBY8Fz0w>
 <xmx:M-n7XcDZYHOXBnQJ1KD7F-IV2BuI36PwrfdWbjfgr2Jp4b8tvKWieA>
 <xmx:M-n7XessKJUU1-XYsCP-om_Q7nVg7GYKVVSy1DEH2OdIQFL82uKKSw>
 <xmx:M-n7XW9YZTa7W2YtHf04pEHpo0OvbAd5wx-TWxBwY0ukHm2MRlJq8A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 0C481E00A3; Thu, 19 Dec 2019 16:18:43 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-694-gd5bab98-fmstable-20191218v1
Mime-Version: 1.0
Message-Id: <28f173c2-3053-4ee9-aef9-2e52a9928a69@www.fastmail.com>
In-Reply-To: <CAN34foyoxNYP=wzB5mbVKkjk+m5RujdaF7UoMuBxDUZ2uTkDPw@mail.gmail.com>
References: <tencent_0139807C40A9C767A1F947C84B4CD99FE80A@qq.com>
 <CAN34foyoxNYP=wzB5mbVKkjk+m5RujdaF7UoMuBxDUZ2uTkDPw@mail.gmail.com>
Date: Fri, 20 Dec 2019 07:50:25 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Stephen Beckwith" <embeddedsteve@gmail.com>,
 =?UTF-8?Q?=E5=8D=97=E9=87=8E=E3=83=A0=E3=83=AB=E3=82=B7=E3=82=A8=E3=83=A9?=
 =?UTF-8?Q?=E3=82=B4?= <1181052146@qq.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Subject: =?UTF-8?Q?Re:_how_the_openbmc_running_in_qemu_communicate_with_the_opera?=
 =?UTF-8?Q?ting_system_running_in_another_qemu_via_KCS/BT=3F?=
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
Cc: openbmc <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 20 Dec 2019, at 00:07, Stephen Beckwith wrote:
> Lui Hongwei;
>  Here is how we handled our initial setup for OpenBMC:
> 1) all of this runs in a single VirtualMachine on a Host System (an 
> Apple Macbook in my case) - the VM is running an ubuntu 18.04 LTS OS.
> 2) Within this VM:
> a) Build the OpenBMC image for AST2500
> b) You will need to rebuild from downloaded source the QEMU version 
> 4.1.0 to run the AST2500. The "stock" version that is delivered with 
> Ubuntu 18.03 is 2.11, and does not work. Rebuild this and keep a copy 
> to re-install as necessary.
> c) you will also need to install ipmitool on this system.
> 3) In Terminal Window 1: Use this command to run the image:
> qemu-system-arm \
> -machine ast2500-evb \
> -m 256 \
> -nographic \
> -drive 
> file=obmc-phosphor-image-evb-ast2500.static.mtd,format=raw,if=mtd \
> -net nic \
> -net 
> user,hostfwd=:127.0.0.1:2222-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=udp:127.0.0.1:2623-:623,hostname=qemu 
> 3) In Terminal Window 2: You can run the ipmitool to talk to the 
> AST2500 BMC image:
> ipmitool -H 127.0.0.1 -I lanplus -p 2623 -U root -P 0penBmc chassis 
> power status
> Chassis Power is off
> 
> IPMI "raw" commands also work:
> ipmitool -H 127.0.0.1 -I lanplus -p 2623 -U root -P 0penBmc raw 0x00 0x0f
>  3c 00 00 00 00
> 

I think what Liu was asking about was setting up in-band IPMI between two guests
(e.g. one BMC guest and one host guest). Your description covers network IPMI
between a management client and the BMC guest.

Andrew
