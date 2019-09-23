Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D4ABAD6D
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 07:15:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46cCFN5fpXzDqDs
	for <lists+openbmc@lfdr.de>; Mon, 23 Sep 2019 15:15:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="E8v3K663"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ZT4jLitC"; dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46cCDr4yfmzDqCC
 for <openbmc@lists.ozlabs.org>; Mon, 23 Sep 2019 15:14:52 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F137F664;
 Mon, 23 Sep 2019 01:14:49 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 23 Sep 2019 01:14:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm3; bh=d93pS1Li1Lz/BXDrNnHsaTz/yMPMgx/
 K3zUdPH7U8BY=; b=E8v3K6639awBXda1JkY54taUBjd8Re/RoI+3PC/WqFiXEG9
 20eUFs/WJI8cPPFIoIieMRmqypJMn299HtnhpeibKlmJPEyfEIBrNY6/jprEm6r+
 7awKqiVqHjdGM6ydE3+YEQWvQMXWeul67GZav12LD1s1GHl2trtLMHDf/D4A5t/w
 7vA3p/Bc9KvOmwQHW1syPflWEF/HoXSIzg/P5m4oiznR1Y3sR07wa4mUhoIJ36jL
 XMqBNG6oWWzA+KsUt/2doYTA9fOjfGJMWSKkqsgf6btiw0cQFN4FT+GULnpZ6YAh
 qS2y9B4vVPAcJ+8bcPHuxxmIxqsSoORFOZQaU6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=d93pS1
 Li1Lz/BXDrNnHsaTz/yMPMgx/K3zUdPH7U8BY=; b=ZT4jLitC3rcY64DfyZRvYW
 BsTx185tYtgFMEPazae9zp4Tub0+RCi9OogRjuyjdVGtha+9au9RQXsgAkkVkgoy
 p19J4O8keo3eMzr/RkNRLhkvnH4ZD0HndrMFiOwT+y22FjNHnAoBp8bpWEA833qI
 8gcQ5X2Zpd7mdRXpNsQLvL6yoAKxcyPxJFuImoHEyhqBmUsBuBzME9hkRCuq2RHf
 88gnDMt3of/3E4iR5Ewu7khhQRtjiYYAM1o7A1f4hKCejR5hjgYadsZ4w7V2nNI3
 Jfpqagp9o1bvmhXXuPqaMxm/dI6B/HJaChXJ1B6Q9LjozeVpsy5H10gL2M+YLxfg
 ==
X-ME-Sender: <xms:yVSIXUXrX33Q_4u-15FrRrBLE3_xLHExOcUFFxuBg4tTf70hzJod1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderreejnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedu
X-ME-Proxy: <xmx:yVSIXXmp2h7BMS4CLHfkom0dkLat45jBjW7Oq-S5LlZm4DMERNJNOA>
 <xmx:yVSIXYi-RGovXpbbw8Ksbud-OSs2whn0bzLx5LAf60ZtONLCWcGEFg>
 <xmx:yVSIXVs3YgbyhSxhsVnaFykqVYlTbzWKu_NjumMvidtrf9v-xTqCNQ>
 <xmx:yVSIXZeC3YZ1VFKrFfp5TXBO03MpG-_nUrLdlONy64Y5RWgKRXOI8w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 16828E00A5; Mon, 23 Sep 2019 01:14:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-238-g170a812-fmstable-20190913v1
Mime-Version: 1.0
Message-Id: <96f5dc1d-2347-4d9c-8fa2-e938ac952664@www.fastmail.com>
In-Reply-To: <CACPK8Xf_ciMEtayQ78yUo=YhrovRMe65xuwviE+DWXDSuQb5-Q@mail.gmail.com>
References: <20190922123700.749-1-andrew@aj.id.au>
 <20190922123700.749-3-andrew@aj.id.au>
 <CACPK8Xf_ciMEtayQ78yUo=YhrovRMe65xuwviE+DWXDSuQb5-Q@mail.gmail.com>
Date: Mon, 23 Sep 2019 14:44:27 +0930
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Joel Stanley" <joel@jms.id.au>
Subject: =?UTF-8?Q?Re:_[PATCH_linux_dev-5.3_2/6]_dt-bindings:_net:_ftgmac100:_Des?=
 =?UTF-8?Q?cribe_clock_properties?=
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Mon, 23 Sep 2019, at 14:28, Joel Stanley wrote:
> On Sun, 22 Sep 2019 at 12:36, Andrew Jeffery <andrew@aj.id.au> wrote:
> >
> > Critically, the AST2600 requires ungating the RMII RCLK if e.g. NCSI is
> > in use.
> >
> > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > ---
> >  Documentation/devicetree/bindings/net/ftgmac100.txt | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/ftgmac100.txt b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > index 04cc0191b7dd..c443b0b84be5 100644
> > --- a/Documentation/devicetree/bindings/net/ftgmac100.txt
> > +++ b/Documentation/devicetree/bindings/net/ftgmac100.txt
> > @@ -24,6 +24,12 @@ Optional properties:
> >  - no-hw-checksum: Used to disable HW checksum support. Here for backward
> >    compatibility as the driver now should have correct defaults based on
> >    the SoC.
> > +- clocks: In accordance with the generic clock bindings. Must describe the MAC
> > +  IP clock, and optionally an RMII RCLK gate for the AST2600.
> 
> perhaps: "and optionally a RMII clock if RMII or NC-SI is used"
> 
> We should implement this for the ast2500 too.

Hmm, I didn't think to check because it has always worked, but I assume that's because u-boot was NCSI enabled and left the clocks ungated.

Will fix in a v2.

Thanks,

Andrew
