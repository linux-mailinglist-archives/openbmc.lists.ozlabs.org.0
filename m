Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C106B211B52
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 07:00:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49y5Wm5n86zDqvP
	for <lists+openbmc@lfdr.de>; Thu,  2 Jul 2020 15:00:36 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm3 header.b=GViTw9tT; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=glRSqegQ; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49y5Vr1GYhzDqnc
 for <openbmc@lists.ozlabs.org>; Thu,  2 Jul 2020 14:59:47 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6BF255C0127;
 Thu,  2 Jul 2020 00:59:44 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute3.internal (MEProxy); Thu, 02 Jul 2020 00:59:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:date:from:to:cc:subject:content-type; s=
 fm3; bh=HoUxohIIaPxCcHYc5GYHu/CkycD/0Ul1vwbhDZc+Rno=; b=GViTw9tT
 e+9ra5Cgvnoi5NKK19ZRxCabFxS4soWlTD6gGEeqNWyLUFWzwfHGHYUNi7jShwcU
 U2MqYYmhyVjXBQMVs0RF7HFNwfWgV4tniBdEWsVFvGOHsfsya7FXJOA8cRmLGzW/
 ZCO3o25IG36GXWX5Yy/Ot+MFK5QNV4eNCDTLz9j9pml7YqXU4ZiKoqpq7TMcgyDo
 4FY1mvqW1o1AsXN/Wv2op32jygWv0+pF16Dc9s7JyflQpqP/+SbK6H2IRCn347+R
 73lwjgqguMmISkThM4hXQ5YJ0KorX4bcHztbKKJmn1JXXkx5hbhXh0FuywCFDuTh
 Mu4Jew7yXJk9Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=HoUxohIIaPxCcHYc5GYHu/CkycD/0
 Ul1vwbhDZc+Rno=; b=glRSqegQnoX1c58KYTwDKt2MPkdBNAtc+iADCaz5BgM0m
 d+xMGNnwNqfBmZpnNjYna3kH0NYdLXdWB5TVomc8p9BLyCz6ADuavT7FFVu6r56N
 rlazIF9KyasabRpLlwkEIMC3ZCiWflxuZHfPrlk3a8EIzhOgMCZn3DcQy6a9i7Uu
 ZB9cdsTw87PTBl6/tY4W8gNo0DYqkgWAjTMpD7FE581VDFuXhfTYlhW0tDC5afNJ
 /wBNfHEPMYZ+ExqcYbLGoa7NckjeQJhVls/GQ5cK2dboruwih266qOmcbLjhGIgI
 w0UOKOrTHvxw0blRdJ/Fr/L6GKOFe//l3Y8/hCIQg==
X-ME-Sender: <xms:v2n9XkVKhhmxm1qWK8yWGS-YXD_8_fm7XsU7zY1Nb2D40dGqvnH9_A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdefgdekkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkfffhvffutgesthdtredtreertden
 ucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrih
 gurdgruheqnecuggftrfgrthhtvghrnheptefgieeuvedtveegueelveeujefgieffgfek
 keekleduhfegkeejvedtjeefjeffnecuffhomhgrihhnpehophgvnhgsmhgtqdhprhhojh
 gvtghtrdighiiinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomheprghnughrvgifsegrjhdrihgurdgruh
X-ME-Proxy: <xmx:v2n9Xom5eRpeBeFPW_ty5M4fhf_NC6F6u58ySwLHqt_S-ivHET2ezw>
 <xmx:v2n9XoZtMXJha50FmdKBEBD5MTZw9SD4RuCFNjT-LQojJbjdqus_6A>
 <xmx:v2n9XjVy3Xe7MMtS-SqoZJWRnIY-qAPP1BhLRc3VBi0YTTZ7tcnH5g>
 <xmx:wGn9Xlt1EKL-eLCkSTEATGMNSgOfBLoG4IQg9my9LKzGcGyY5rGWrA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D49CDE00ED; Thu,  2 Jul 2020 00:59:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-576-gfe2cd66-fm-20200629.001-gfe2cd668
Mime-Version: 1.0
Message-Id: <93c6a27a-db52-4bbb-a2e3-5c1b9837a093@www.fastmail.com>
Date: Thu, 02 Jul 2020 14:28:53 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Bhat, Sumanth" <sumanth.bhat@intel.com>,
 "Thomaiyar, Richard Marian" <richard.marian.thomaiyar@linux.intel.com>,
 "Winiarska, Iwona" <iwona.winiarska@intel.com>
Subject: MCTP bridging with one physical port per demux daemon instance
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi all,

First up, I've pushed a series to gerrit implementing bridging and routing in 
libmctp. If you're interested, please provide feedback:

https://gerrit.openbmc-project.xyz/q/project:openbmc/libmctp+topic:%2522routing%2522+(status:open)

The final patch in the series implements the provisional EID concept that we've 
been discussing on the list.

Back to the subject:

I've had a short think about bridging in the configuration where we have one 
mctp-demux-daemon instance per port. I'm not sure what plans you had with 
endpoint ID assignment, so assuming I have free reign with it, one proposal 
looks like below:


          demux A                             demux B
      +------------+                       +------------+
      |-----+      |                       |      +-----|
      +--+  |   +--+      demux socket     +--+   |  +--+
+-----+P0|10|   |P1+-----------------------+P1|   |11|P0+-----+
      +--+  |   +--+                       +--+   |  +--+
      |-----+      |                       |      +-----|
      +------------+                       +------------+

'demux A' and 'demux B' are our two separate processes. Figure 9 of DSP0236 
(v1.3.1) shows the different arrangements of endpoint assignments that are 
supported by MCTP, and the key element is that ports in a bridge are not 
required to be assigned endpoint IDs. In the diagram above I'm describing two 
ports associated with each process; the physical port P0 which we're 
associating with an mctp-demux-daemon instance, and P1 which we'll have as a 
port for a vendor-defined binding. By configuration, one of either 'demux A' or 
'demux B' connects to the other and establishes a "virtual bus" via P1. An 
endpoint ID is assigned to P0 in both instances (10 and 11), but neither 
instance assigns an EID to P1. Using null EID messages each side can send 'Get 
Endpoint ID' over the virtual bus linking the two daemons to bootstrap the 
(independent) route tables. From there, each side uses 'Get Routing Table 
Entries' to pull the route table state from the other, and update their own 
tables with the endpoints reachable through the remote.

In this configuration there's no change necessary to the generic libmctp code 
to handle forwarding packets between the different instances, it takes 
advantage of bridging and routing to do the job for us in concert with a 
vendor-defined binding to handle the socket.

A problem arises with how applications should interact with the separate 
daemons: Each application must connect to all the mctp-demux-daemon instances 
to receive their locally delivered packets.

To resolve this it might be possible to take advantage of the existing "bridge" 
implementation in libmctp which really functions as an adapter that glues 
together two ports of possibly different binding types. By inserting 
appropriate route entries packets arriving on either interface are simply 
forwarded to the other as there is no endpoint ID defined for the instance. 
With this approach you could do the bridging in a third process:

       adapter A                    demux               adapter B
      +------------+             +------------+            +------------+
      |            |             |------------|            |            |
      +--+      +--+             +--+  ||  +--+            +--+      +--+
+-----+P0|      |P1+-------------+P0|10||11|P1+------------+P1|      |P0+-----+
      +--+      +--+             +--+  ||  +--+            +--+      +--+
      |            |             |------------|            |            |
      +------------+             +------------+            +------------+

We'd probably have to do some tinkering to make sure broadcast and null EID 
messages are passed on. However, applications would then connect to just the 
bridge's domain socket to receive messages for both EID 10 and 11.

That's probably enough to spark some discussion.

Let me know what you think.

Andrew
