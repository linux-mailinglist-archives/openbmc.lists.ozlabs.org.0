Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA10176DCD
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 05:04:18 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wk0b48S6zDqbB
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 15:04:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=64.147.123.25;
 helo=wout2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=eaK12mYV; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=WtvwDg1U; 
 dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wjzk2VMrzDqKr
 for <openbmc@lists.ozlabs.org>; Tue,  3 Mar 2020 15:03:29 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id E7E1E689;
 Mon,  2 Mar 2020 23:03:24 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 02 Mar 2020 23:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=+WnFe
 Ya0Q2uCU1wMv6Jf5AK1yK3b+EMZ6gjU0r/7TS8=; b=eaK12mYV3mJbrsGbasm5F
 PSZ+AWWF3JLZm9i/O7nXs8mbUS+QCzuSQLB7ABop+SsfUQxYKrztoRFT/4/Y6KPM
 +b5ipCPVPFMmMf1zvnhqgrXj0Dkh1BYcvy3nywpVQEP8Dkl0td+PeYYZFFzGFsh5
 aiv8yITAs2zgOU6JaYox1J49bPsBer8Jpj+wtszVKNTucSuAMzA50m+mLOkdU6nX
 OYYrlyhFZGVoD8mCbpdDDsxTosWX3BMwajeI5biFUtaaxgpHVIG1uLjhcN+E+B9e
 ujbl1x+PZ5R2T5utX/wesG2Y3YH6ROiYhRFCHcNSdja5xNtihemlKORsnTZOJ8e2
 A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=+WnFeYa0Q2uCU1wMv6Jf5AK1yK3b+EMZ6gjU0r/7T
 S8=; b=WtvwDg1UWn2gDKwgbEpFtqpRpNeLJl3Rh+JoISTNxvpRV1dGFxyskVS61
 YaVcT7/K5zGjqVMi0pnFPtXf7tbWIzeOVxhI0itaDB2/AEFOk0c2L8wGYDQ6axzc
 XTNg1N8E+/bSql/I68x1RE/Scu02blbNCxYi1agVv/nxbvZ4AXHGm7PTPr9s04ia
 HUD+wYSw9iKrQ0MXfnSJcqegNkMI73rbVMlDz4mjXdx+xkHlH/ZlSYnSvYGPLHQk
 B3g/lh+wBZ1BVOVkCPXmxLHkKLOr9H3saVmDRVLChya2qxY/xszJ1ikzZl+CueIv
 8cxB2qc6hcgr86uqsrS6Cgs/Mjssw==
X-ME-Sender: <xms:C9ddXqdwrdgKPhaM79Cd7YQA2Rb953HR3UEj9mLUuDQZYL3zihZl-g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddthedgieefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedftehn
 ughrvgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucevlh
 hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfies
 rghjrdhiugdrrghu
X-ME-Proxy: <xmx:C9ddXpsgogunL-Kr-a7JR6lQR3q3e77nnyyU4ZgqLBfEgBAUxfYdOA>
 <xmx:C9ddXj27UXhHi6QiLTLAZ1IBoOcHNeme1se4vS8mKVh8k3hI9GBKow>
 <xmx:C9ddXmBG-MaZiHF46l6iw26cxxTbl0NzV3eL2u4IyJK-stOgAuLAiA>
 <xmx:DNddXlJqjHmTgxgRj6dbZHqsSJgd-Bg9q8i-4fok50xNCz2cQmm3yg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59DB3E00D8; Mon,  2 Mar 2020 23:03:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
In-Reply-To: <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
Date: Tue, 03 Mar 2020 14:33:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Vijay Khemka" <vijaykhemka@fb.com>,
 "Kumar Thangavel" <thangavel.k@hcl.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: obmc-console design for multi host support
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, 28 Feb 2020, at 18:00, Vijay Khemka wrote:
> =EF=BB=BFOn 2/27/20, 2:05 AM, "openbmc on behalf of Andrew Jeffery"=20=

>    =20
>     ```
>     $ ls -1 /etc/obmc-console
>     client.2200.conf
>     server.ttyVUART0.conf
>     ```
> What are other contents of client and server conf file other than sock=
et-id?

Whatever else you were previously specifying for the server.

>    =20
>     So to map the client associated with port 2200 to the server assoc=
iated
>     with ttyVUART0 we set the same socket-id value in both files:
>=20
> Can this socket-id be any random word and can this be same across mult=
iple
> Host (client/server) configuration. I mean, do we need different socke=
t-id for
> client.2200 and client.2201 or it can be same.

The socket-id is a unique portion for the unix domain socket created by =
the
obmc-console-server instance. The server needs to know this because it n=
eeds
to know what to name the pipe; the client needs to know it as it needs t=
o form
the abstract socket name to which to connect.

In general unless you're looking to expose the same console on _differen=
t_
network ports, you want to pair each client with a unique server.

Here's an ASCII diagram:

               +--------------------------------------------------------=
------------------------------------+
               |                                                        =
                                    |
               |       obmc-console-client      unix domain socket      =
   obmc-console-server              |
               |                                                        =
                                    |
               |     +---------------------+                           +=
------------------------+           |
               |     | client.2201.conf    |  +---------------------+  |=
 server.ttyVUART1.conf  |           |
           +---+--+  +---------------------+  |                     |  +=
------------------------+  +--------+-------+
Network    | 2201 +-->                     +->+ @obmc-console.host1 +<-+=
                        <--+ /dev/ttyVUART1 |   UARTs
           +---+--+  | socket-id =3D "host1" |  |                     | =
 | socket-id =3D "host1"    |  +--------+-------+
               |     |                     |  +---------------------+  |=
                        |           |
               |     +---------------------+                           +=
------------------------+           |
               |                                                        =
                                    |
               |                                                        =
                                    |
               |                                                        =
                                    |
               +--------------------------------------------------------=
------------------------------------+

Does that help?

Andrew
