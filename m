Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC853DE4DC
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 05:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf1N125Hgz2yxX
	for <lists+openbmc@lfdr.de>; Tue,  3 Aug 2021 13:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm3 header.b=KYPlxyuN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B0O4oeJy;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=KYPlxyuN; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=B0O4oeJy; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf1Mf1yPDz307S
 for <openbmc@lists.ozlabs.org>; Tue,  3 Aug 2021 13:59:09 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id A17EA5C0154;
 Mon,  2 Aug 2021 23:59:05 -0400 (EDT)
Received: from imap43 ([10.202.2.93])
 by compute2.internal (MEProxy); Mon, 02 Aug 2021 23:59:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=qOfzOKyUz+qrIpCrAmMH+p8O2pXR95M
 rMmqjZr9X7s4=; b=KYPlxyuNcEl2zhoTdN+DlBoa1r5tVd92rYSSF6oBRPBUxU+
 DJgSlEsbbxSfE4MprKx5TvAnbysHY0+roga848OeqHIFBUX0WqvIc/b9MNOJ4Let
 x9xR0hO/WajTXczjJSLDXHLsNK1FB6olqkASoPMdq8FQ80cneCLbTpjV/2kO+bs/
 JMzrvSv/+tvLsP5TCWf3R8OVnihrAUBlxFLReI38aWtJEKRE4cbzpWbuIb0Z257r
 S3fR8diZ4WwDpQ6m+Rn/sNP0XzxBYcx4N8+57ST5I8+rKGj+JMpNlqB8EQRht/y3
 j+IGyIKcAYCbdNb8o3VGl0o3k3nR9Nlyb+fBh4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qOfzOK
 yUz+qrIpCrAmMH+p8O2pXR95MrMmqjZr9X7s4=; b=B0O4oeJyt1Eycsx4LWaPPx
 SMMLRF+opwX8QW8ncv/76siWeDOEvbV6mET15zQ1EqXZxPiEYDdCUas4n1NS+zHC
 wNmKsIjrVZDlHegj751t/HWAlFeuc9OT8EnZlMnVl/d8zdC7jFZcAMABMbKdr6h7
 mJWwr/OgQuvqvCMpoIsmbS40H7yF6KbiEAG8UKGmv5jq/pBagElE9GCvGcZFopX2
 saVd9tMH2CghjzUT8dG14AMgqoDjdKP6wdxM5R0mCCq4iQhF2+tMP6xNQkueRc4S
 YBsWmBf8Od48YrByTT2UTjDlm9TsMgpG6IFdhprBA0BNc1hxJQ9SmXHSBf1C209w
 ==
X-ME-Sender: <xms:CL8IYYHDfdSyTMDoD-CKk1aWVTl9biYRyeLNRjp-_Au-_Eytpzz33Q>
 <xme:CL8IYRVAFNiDhiapMdbTIr16soPh9T70pduiTb0MKnyb_m4wasonBlgTxcO_jHm7D
 OiAdxrRxngSxyrByA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgdeikecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucggtffrrg
 htthgvrhhnpeegffduueekieeuieekhfdtveelheeftdejvddtleeugfeihfeigeekleek
 geelteenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhoshhtrdhorhhgpdhkvg
 hrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
 fhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:CL8IYSJ_7nLNmKpbqmnKEIOwIvTFdXAMbaPHd7HDF8q77OFZFs8kTQ>
 <xmx:CL8IYaEZACrwM8ttyaxsseooxmcv1XCHiYVTzxsXic45qMs_4e9aeg>
 <xmx:CL8IYeVTwXMEHJ2_vRHDK-N91bbF2xFtT2EnucRBF8c753SAZnO05w>
 <xmx:Cb8IYZH5keFw39AmT7D3EJ3VssQf2-aQLbVV7SN8J-lzHacCnKyByQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 24148AC0DD0; Mon,  2 Aug 2021 23:59:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-548-g3a0b1fef7b-fm-20210802.001-g3a0b1fef
Mime-Version: 1.0
Message-Id: <572c7029-682e-4930-96d4-88730eac6c5c@www.fastmail.com>
In-Reply-To: <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
References: <20210729094640.GT875@home.paul.comp>
 <CACWQX81MBkR3JVRDGbJJMzgGgb3E03HfZTtKu_c0m51g4hXtoA@mail.gmail.com>
Date: Tue, 03 Aug 2021 13:28:40 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Ed Tanous" <ed@tanous.net>, "Paul Fertser" <fercerpav@gmail.com>
Subject: =?UTF-8?Q?Re:_Redfish_requests_for_dbus-sensors_data_are_needlessly_slow?=
 =?UTF-8?Q?_-_analysis?=
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
Cc: Zhikui Ren <zhikui.ren@intel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>,
 Andrei Tutolmin <a.tutolmin@gagar-in.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Timofei Nikitin <t.nikitin@gagar-in.com>, "Bills,
 Jason M" <jason.m.bills@linux.intel.com>,
 Gunnar Mills <gmills@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 30 Jul 2021, at 00:23, Ed Tanous wrote:
> On Thu, Jul 29, 2021 at 2:46 AM Paul Fertser <fercerpav@gmail.com> wrote:
> > I would be willing to work on doing the right thing but for that I'm
> > lacking the understanding of the complete picture involved in handling
> > all types of sensors and interfaces, so I'm kindly asking for your
> > help with it.
> >
> > diff --git a/redfish-core/lib/sensors.hpp b/redfish-core/lib/sensors.hpp
> 
> Can you please submit the below to gerrit as a WIP instead.  There's
> much better tooling there for reviewing and testing patches.  I can
> review it more there.
> 
> FWIW, it's on my list to look into the mapper shared-memory caching
> layer that @arj wrote a while back.  It might also be able to solve
> this problem;  I don't have the link offhand, but I think it was
> trying to solve a similar problem, but handled the cache invalidation
> issue as well.

Here's the link:

https://github.com/amboar/shmapper

FWIW it's not a caching layer - mapper clients directly access the 
mapper data structures through the shared memory mapping. The client 
APIs are all 'const' so you have to go out of your way to damage the 
data (or we can provide private-copy based APIs).

It would be cool to get to the point where applications can push their 
DBus schema directly into the shmapper daemon. This would remove the 
performance horrors associated with the introspection phase of the 
current implementation.

Anyway, unfortunately I haven't had time to hack on it recently. The 
current codebase is mostly the result of a hyperfocus brain-dump of 
ideas underpinned by some fuzzing. Performance and ergonomics can be 
improved a bit. The underlying ideas are also quite similar to Boost's 
Interprocess module[1], though implemented in C leveraging the sparse 
semantic parser[2] (which I think makes it easier to take advantage of 
than a Boost implementation, but there are trade-offs).

[1] https://www.boost.org/doc/libs/1_76_0/doc/html/interprocess.html
[2] https://sparse.docs.kernel.org/en/latest/

Andrew
