Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A66A01785D9
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 23:46:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XBvL07tbzDqVc
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 09:46:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm2 header.b=GitYyGLp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=lE1n6/kz; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XBtd3pfgzDqSY
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 09:45:44 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 822DC2207D;
 Tue,  3 Mar 2020 17:45:41 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 03 Mar 2020 17:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type:content-transfer-encoding; s=fm2; bh=C0GSY
 xFmkABs8gR7KhLc1QcAmcHobPOsHK2l9Uz6ykA=; b=GitYyGLpxyB0ucceV8OFj
 hPhJwwJ0zr8D7DC2/RaNkVg09YWywgJjOawo1ZJHQZzTQSREifFuW+BxwIxtio03
 TQS+Ero/Q5Gna/X85xrtGyjngMSLEHJ1uPK8fMseUnB89PU/nbpRLgeNnYZy5rTU
 oriW+LYqCj4NCva1Kr95PcN+T2ms5Q8vfI3/u6oY3MDbOLtynix9bGDB8ZHkPZzc
 OGrZgFlNI5M+qTJ1+mKAo9q8aENPKcJUSei5oSy0e1yqgh8G80oC8nJkXduTq77Q
 Ahsrqt95zKioTgaFWSo50hRLZPNJTL7waFimzxTwapwjniQaX66laCM9/T5KInjr
 Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=C0GSYxFmkABs8gR7KhLc1QcAmcHobPOsHK2l9Uz6y
 kA=; b=lE1n6/kzYRYxEmja7Pgir6xXbcx9yKjVIru4vaocc0pnHsXEqlahUtSTs
 Joe44Ndbgzh7o8TJ1poC/17ipPV2xal11gMGqrlSJhSOYbz6KzJ+kiY2rE9VO/92
 8txEKQ5nlD5lZFs8oah8V9+HzcGvbztbhIF4+RHl6Kah4Vzy8iUCYue01i8xOm6P
 0Jt+QQmELoELHQ3MuAqcUzMLnYCCiilgNwfE1FRVcew7MewFczYBnx44MZmN9jJy
 9a7+qsjBAfDwqwGAfe2ChxwHDHu9z2YLrYx2pogfLWxRlixkHhkVbyU3MpqrfB6N
 rXsj7AAarzudAC6Ad/gBLd5VBtzkQ==
X-ME-Sender: <xms:E95eXvDcZQ47K5mItidfmzeiQF2yAlIRLH-3L5ok8ZvwBc7N1nusgw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedruddtjedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredt
 reerjeenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifse
 grjhdrihgurdgruheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpohhpvghnsghm
 tgdqphhrohhjvggtthdrgiihiidprghstghiihhflhhofidrtghomhenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhi
 ugdrrghu
X-ME-Proxy: <xmx:FN5eXiL-uq_jB2qDtJP-z5dz9Tu0IONGuY8zYGt7f0sRkCYfiH8AUw>
 <xmx:FN5eXg8maToGWGpICTtX9zry0Y0WeFke_-f4BbrerWpQIG02e3t1CQ>
 <xmx:FN5eXrpEWExv8bMo_pHR8gt-7W15YRweiOQPbifz-rhITo0ojiI4Ew>
 <xmx:Fd5eXno_fh7SyFCGAsfjooK1J69u2NP0NWFpVF7U-Eblm2vL00XktA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id D3DA8E00A8; Tue,  3 Mar 2020 17:45:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-967-g014f925-fmstable-20200226v1
Mime-Version: 1.0
Message-Id: <1e91c94b-bc20-477b-85b7-7cfab2f994b7@www.fastmail.com>
In-Reply-To: <d999eac8-84e9-826f-1d7f-c327a8efbf89@linux.ibm.com>
References: <SG2PR04MB3029CF9F520DF543B57B93C2FD100@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <f136d4ad-65e6-4e74-8f53-2ca3edaf9288@www.fastmail.com>
 <SG2PR04MB30295AD664D4B5BD5F24EFD3FD130@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <SG2PR04MB302996468E42284DE73358A6FDEA0@SG2PR04MB3029.apcprd04.prod.outlook.com>
 <5dd6cbbe-5f58-4370-82c7-55c8dc22ca5b@www.fastmail.com>
 <26B24CEE-C910-4FB1-B316-8E0676E3AD16@fb.com>
 <5867808b-871f-435e-aa79-10bf64a8f4b5@www.fastmail.com>
 <d999eac8-84e9-826f-1d7f-c327a8efbf89@linux.ibm.com>
Date: Wed, 04 Mar 2020 09:15:38 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joseph Reynolds" <jrey@linux.ibm.com>,
 "Vijay Khemka" <vijaykhemka@fb.com>, "Kumar Thangavel" <thangavel.k@hcl.com>, 
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



On Wed, 4 Mar 2020, at 03:53, Joseph Reynolds wrote:
>=20
>=20
> On 3/2/20 10:03 PM, Andrew Jeffery wrote:
> > On Fri, 28 Feb 2020, at 18:00, Vijay Khemka wrote:
> >> =EF=BB=BFOn 2/27/20, 2:05 AM, "openbmc on behalf of Andrew Jeffery"=

> >>     =20
> >>      ```
> >>      $ ls -1 /etc/obmc-console
> >>      client.2200.conf
> >>      server.ttyVUART0.conf
> >>      ```
> >> What are other contents of client and server conf file other than s=
ocket-id?
> > Whatever else you were previously specifying for the server.
> >
> >>     =20
> >>      So to map the client associated with port 2200 to the server a=
ssociated
> >>      with ttyVUART0 we set the same socket-id value in both files:
> >>
> >> Can this socket-id be any random word and can this be same across m=
ultiple
> >> Host (client/server) configuration. I mean, do we need different so=
cket-id for
> >> client.2200 and client.2201 or it can be same.
> > The socket-id is a unique portion for the unix domain socket created=
 by the
> > obmc-console-server instance. The server needs to know this because =
it needs
> > to know what to name the pipe; the client needs to know it as it nee=
ds to form
> > the abstract socket name to which to connect.
> >
> > In general unless you're looking to expose the same console on _diff=
erent_
> > network ports, you want to pair each client with a unique server.
> >
> > Here's an ASCII diagram:
> >
> >                 +---------------------------------------------------=
-----------------------------------------+
> >                 |                                                   =
                                         |
> >                 |       obmc-console-client      unix domain socket =
        obmc-console-server              |
> >                 |                                                   =
                                         |
> >                 |     +---------------------+                       =
    +------------------------+           |
> >                 |     | client.2201.conf    |  +--------------------=
-+  | server.ttyVUART1.conf  |           |
> >             +---+--+  +---------------------+  |                    =
 |  +------------------------+  +--------+-------+
> > Network    | 2201 +-->                     +->+ @obmc-console.host1 =
+<-+                        <--+ /dev/ttyVUART1 |   UARTs
> >             +---+--+  | socket-id =3D "host1" |  |                  =
   |  | socket-id =3D "host1"    |  +--------+-------+
> >                 |     |                     |  +--------------------=
-+  |                        |           |
> >                 |     +---------------------+                       =
    +------------------------+           |
> >                 |                                                   =
                                         |
> >                 |                                                   =
                                         |
> >                 |                                                   =
                                         |
> >                 +---------------------------------------------------=
-----------------------------------------+
> >
> > Does that help?
>=20
> Nice diagram!=C2=A0 Can this be added to
> https://github.com/openbmc/obmc-console/blob/master/README.md
>=20
> I tried to capture this network interface in an architecture review=20=

> here:
> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/27969/3/architectu=
re/interface-overview.md#130
> which also includes 'ipmi sol activate' and hostlogger.
>=20
> Please let me know the best way to document this in the project?=C2=A0=
 I=20
> would be happy to remove details from the doc-under-review and point t=
o=20
> the obmc-console README.=C2=A0 Does that sound right?

Sure, if the diagram was useful for you then it's probably useful for
others too.

For what it's worth, I drew it using http://asciiflow.com/

Andrew
