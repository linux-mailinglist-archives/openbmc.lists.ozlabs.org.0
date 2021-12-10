Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4353E46FAB3
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 07:40:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Lrn0mwhz3blF
	for <lists+openbmc@lfdr.de>; Fri, 10 Dec 2021 17:40:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256 header.s=fm1 header.b=axF+Zvd6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Jc0vBU2b;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aj.id.au (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=andrew@aj.id.au;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.a=rsa-sha256
 header.s=fm1 header.b=axF+Zvd6; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Jc0vBU2b; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9LrJ59KWz2yY0
 for <openbmc@lists.ozlabs.org>; Fri, 10 Dec 2021 17:40:32 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E53115C030F;
 Fri, 10 Dec 2021 01:40:28 -0500 (EST)
Received: from imap43 ([10.202.2.93])
 by compute4.internal (MEProxy); Fri, 10 Dec 2021 01:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to:cc
 :subject:content-type; s=fm1; bh=goBctlyyI3J/Op1kYis6hsVT9TfDKON
 B9LrMTo32VSk=; b=axF+Zvd6jGEahBAr3vdSX+sDacT9QRLbfBvWtRK5J4ZbTQ7
 9t+8aZ0edo4NvhgMtmgZU+8+X67e8fbRUm7RewV/somnRARE9s05VTFqO03Wy0xz
 kUSGDyPnRr5sknUtUzIQdJjNWlwVDp5QqgaZCW58dqDMvFh/XQuMtJpV7IFTs7x+
 YWOn7q7FhQMJZR071Jn6gEH6y4nE2Qq9+y2ZlEZaPwCPcYL+Ur58Q1sIzsDhx+t5
 0dCGL5PqxlFIXLdKs2vvXpC2SuIY0TnXE6yA8ubEwlTmAqnKiqd0NRAlRTEjzeb9
 TCGIMEYoF0HHheSlNBzzFs4wTUfSVANp0Od4n5w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=goBctl
 yyI3J/Op1kYis6hsVT9TfDKONB9LrMTo32VSk=; b=Jc0vBU2bsaP2TilEao0is0
 jC8p0zEuKq8G8vQMgpqFsduz6wn5cU0NfLNUbwUOmrPbl6zRNCRK5U8gbtX5TC/+
 Q++VTzTq688mmiRKi9C5vzwb+S7cr/OknOzLjNJKRSWVg67g8FGpFVnaBdZJ9qNt
 FT7k0M73kbSEiJjmJuckIWkA01OV4aU32Jwu1QRDIMKcRMz+WI5YBtXpg2WZCAaA
 o+UZEV5LbV2zHesmDl7LmZchkq7ENud/G+qXNfdv5p1JYvr6uyWE7TwC8Ci5bwXf
 08sRJ95eqnUgm95WMBEq7pllN5BzCpHxpvp+ufLgwsCKTpgUwBhG6y+pgai7Jvdg
 ==
X-ME-Sender: <xms:XPayYVagZMEgPI4nJL8AHTJicyhyZyWGM1aETmNH9VbWNB4y0FyyLg>
 <xme:XPayYcakI2uCJQ6h4Pky99XsiV8amRWTpjGfu0jIEC9jwwU7ovvQ4X9ofAwgYLPy4
 YvON3-zjpv3TABX4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkedugdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculddvfedmnecujfgurhepofgfggfkjghffffhvffutgesthdtredtreer
 tdenucfhrhhomhepfdetnhgurhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjh
 drihgurdgruheqnecuggftrfgrthhtvghrnhepgeehheeigffggfektefhgeeffeeugedt
 geefleekveekleevvdejhedttdejgeeunecuffhomhgrihhnpehgihhthhhusgdrtghomh
 dpohhpvghnsghmtgdqphhrohhjvggtthdrgiihiienucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghu
X-ME-Proxy: <xmx:XPayYX9kHzYgeC7bnIx_ifAekHPzWsZ5fT2aYQj-31GOITnzcunZrA>
 <xmx:XPayYTpQn0syuQvlRGrGrxXAlilBIWc3xUxlZrEcTHx1vIoquJH1fg>
 <xmx:XPayYQoJpdIDSTv5QAWBh8l_K68LA6467lJ8RgxTkMLP6NhwxnGrTw>
 <xmx:XPayYdBoFmxCLQOW-QEUrQiQbhwwUaQMMoMoaL2rTLnOLi07-xslPA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id A8D07AC03DB; Fri, 10 Dec 2021 01:40:28 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4514-g2bdc19e04f-fm-20211209.002-g2bdc19e0
Mime-Version: 1.0
Message-Id: <6f3caea0-6579-4042-8ce5-5601de66526c@beta.fastmail.com>
In-Reply-To: <HK0PR06MB214566D1A94F1B93795A44A78A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
References: <df30fbcd-870a-4d9e-9377-80c0b1a9c3ca@www.fastmail.com>
 <1639112518-8080-1-git-send-email-dphadke@linux.microsoft.com>
 <HK0PR06MB214566D1A94F1B93795A44A78A719@HK0PR06MB2145.apcprd06.prod.outlook.com>
Date: Fri, 10 Dec 2021 17:10:09 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Troy Lee" <troy_lee@aspeedtech.com>,
 "Dhananjay Phadke" <dphadke@linux.microsoft.com>
Subject: Re: Security Working Group meeting - Wednesday December 8 - results
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Joseph Reynolds <jrey@linux.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On Fri, 10 Dec 2021, at 16:25, Troy Lee wrote:
> Hi Dhananjay and Andrew,
>
>> On Fri, 10 Dec 2021, Andrew Jeffery wrote:
>> 
>> > There's not much documentation as yet. p10bmc can be used as an
>> > example of a system that enables it.
>> >
>> >
>> https://github.com/openbmc/openbmc/blob/ade3e145ead0beedad181394f
>> caa63
>> > 856176bdee/meta-ibm/conf/machine/p10bmc.conf#L39-L56
>> >
>> > Given the lack of documentation it's probably also reviewing these
>> > patches in the context of the configuration above:
>> >
>> > https://gerrit.openbmc-project.xyz/q/topic:%22secure-boot%22+(status:o
>> > pen%20OR%20status:merged)
>> 
>> Thank you for the pointer, I'll comments there.
>> 
>> >> Need clarity regarding OTP programming.
>> >> (1) There's Linux tool
>> >
>> > I assume this refers to socsec? The socsec repo provides two tools:
>> > `socsec` and `otptool`. `otptool` can be used to generate the OTP
>> > image and exercise signature validity.
>> >
>> > https://github.com/AspeedTech-BMC/socsec/
>> 
>> Yes, I was referring to these tools, socsec-sign.bbclass seems to cover the
>> workflow I was looking for.
>> 
>> >
>> >> and U-Boot patches floating somewhere.
>> >
>> > I'm not sure what patches you're referring to here, can you clarify?
>> 
>> https://github.com/AspeedTech-BMC/u-boot/commits/aspeed-master-
>> v2019.04
>> 
>> cmd/otp.c has more changes compared to openbmc/u-boot.
>> 
>> >
>> >> (2) Any specific OTP straps preferred by OpenBMC, e.g. enabling alt
>> >> boot (ABR).
>> >
>> > There's no real preference. My intent is to add a recipe that can
>> > consume a platform-specific otptool json config and spit out the OTP
>> > binary as a build artefact. Currently I just have the config captured
>> > in a separate repo internally and I generate binaries from that using
>> > make.
>> 
>> This is useful, having readable config and letting platform select behavior
>> such as alternate image in same SPI or alternate, etc.
>
> We have the recipe to generate otp-image with OpenBMC building
> process and is working on upstreaming it into OpenBMC.
> Could you help to review the recipe once we submit it into gerrit?

Yes, please push it for review.

Andrew
