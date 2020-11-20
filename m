Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0A72BB7AC
	for <lists+openbmc@lfdr.de>; Fri, 20 Nov 2020 21:45:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cd7pj1Xg2zDr1S
	for <lists+openbmc@lfdr.de>; Sat, 21 Nov 2020 07:45:17 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=Hb1tL6Jy; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=W6FvMj+g; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cd7nm5nc9zDqsG
 for <openbmc@lists.ozlabs.org>; Sat, 21 Nov 2020 07:44:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D2A15C0160;
 Fri, 20 Nov 2020 15:44:23 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 20 Nov 2020 15:44:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=9b44lkB1sQVfDE+btN9PjMyydxY
 3s7LAPNsULOHYMaU=; b=Hb1tL6Jy1KFXdfsTgDWPynCospIqiYzlRlZU3lFxq2P
 j6jLhdKWt0/b4tMqFVxoQkTE6FV0yO4I2PD8ms9opd6+z4uMRbHOBZQzjc/sHLbl
 +Fe7OuRREjlmQL1m5hUt72eThtaq9+RsCKBh2xMSOKnmzp0DE2FvS+4pMjb7qKe5
 UOSfyd12OpzzzZnX1L0amECM4xHjknggg5Lx7Kv9byli9xgCcaq+mDm1Opxmr+xx
 BFNXZUKFclr6zQlyjOQWL94i6uLMXd+nt1ojXbcIf0aKzAUfEtD/y1YEmYPxU25Q
 onfARGC1Dyzab8uLwDnXewvHkn49ap+mq/P4N9dbTeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9b44lk
 B1sQVfDE+btN9PjMyydxY3s7LAPNsULOHYMaU=; b=W6FvMj+g/3vktDPCoXi2BS
 GKEArquEmTM7K/nFHYMnc8WRRpWka243IgjvRmdoKyRXmOj0IzOvXO9c47ewoCCK
 pYUTQCkzJiiRkB1XvlE3NjX7BL85WVOd0ToyS7eZzOsfntrQdUXconjWtrhg4aEF
 ikaoclr8/gnIcdTCYfo7Lvp4C9BeJ6s9AA88RSXZoC3aC7JsUqdUysBLX0WRUgsL
 V6XIM9LFe4MR97aa8MmebFwzl6IFONMeX9KcF4MuvU5bsPWYRoS2srg5XezpLVQb
 8PKZBdjoD+tEw/cGPLlXaJlIk3CFepoTDFE1kWYkc1Aij5x9P0NGq+eab87dU8wg
 ==
X-ME-Sender: <xms:piq4XxtdGEi6sXG1boumedx8gKGjmFD8kTzT2vbECHmwaARmYasUOw>
 <xme:piq4X6cC4By5kum_De2eb6Q816qWodxf5opPBNmTGiD77Ox5MI-dsKv52rkM-6xxz
 8QnYMR8hSHr37K4wk8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudegtddgudeflecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdefhedmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpefhhefhkeevteeludehtdduteek
 hfdtudehueekueetteduvdetffevheehjeekleenucffohhmrghinhepmhgrthhrihigrd
 horhhgnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:piq4X0yDF8nMDM7veHMkOmOU9i8o2XwNL2H-zmer0W604hP2-wxrCg>
 <xmx:piq4X4Ob7PXFi8tJCvCD_JitP1x3U8wRninrEv3s6_DE4-f23ETLzg>
 <xmx:piq4Xx-tfXw_SUTgoVk_qWReAzN6E4zStTHIa8RrGh9-r3J75hoOhA>
 <xmx:pyq4X2JDbWXRI3gPtQByR_RLvePW3FUC2bFP7SfJcGPs95sU8FncsA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id A34A63064AB3;
 Fri, 20 Nov 2020 15:44:22 -0500 (EST)
Date: Fri, 20 Nov 2020 14:44:21 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Andrei Kartashev <a.kartashev@yadro.com>
Subject: Re: [Announce] OpenBMC Discord Community
Message-ID: <20201120204421.GC1261035@heinlein>
References: <20201112145740.GB4495@heinlein>
 <2efc5fa8a97e5aa17d8579cd414676bb842367d1.camel@yadro.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TYecfFk8j8mZq+dy"
Content-Disposition: inline
In-Reply-To: <2efc5fa8a97e5aa17d8579cd414676bb842367d1.camel@yadro.com>
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


--TYecfFk8j8mZq+dy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andrei,

On Fri, Nov 20, 2020 at 10:31:23AM +0300, Andrei Kartashev wrote:
> Is there a Matrix (Riot.IM) to Discord bridge configured (
> https://matrix.org/docs/projects/bridge/matrix-appservice-discord)? Did
> you try it? Can we connect Discord channel with IRC channel via the
> bridge?

I did not try it.  It looks like it is "self-hosted" meaning we would
need someone to run the bridge.

I'd tend to prefer we don't run a bridge, especially since both Matrix
and Discord have web-clients so there shouldn't be any install / setup
impediment.  We're likely to lose some features with one side of the
bridge or the other.

If there really is an interest in setting up the bridge, I'll help
whoever wants to drive that on the Discord admin side.

> BTW, what was the problem with Matrix-To-IRC? I use it connect the
> channel and it works fine to me.

I think there were ultimately two problems with it:

    - We've seen many times where the bridge is "slow" and people have
      been confused by the conversation between Matrix and IRC because
      messages and replies arrive out of order.  There are times when it
      completely goes down but that hasn't been so bad lately.

    - People using the Matrix bridge don't see the IRC limitations, so
      long and formatted messages on Matrix show up on IRC as a URL to a
      "matrix long message" which most people on IRC just ignore.

Matrix and Discord at least have a similar feature set, so maybe there
is less likely to be a mismatch in the bridges.  One big advantage,
which we've already leveraged with Discord, is that we can easily create
a set of channels (based on topics) that are all together in our one
community.  With Matrix people have to know to go to #openbmc-<topic> in
addition to the main Matrix channel.

--=20
Patrick Williams

--TYecfFk8j8mZq+dy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+4KqMACgkQqwNHzC0A
wRnCXhAAgphlGK5VSNi/JbuK1VEOZh79Y/HTV+fgzXfOU+HgDdkZ/1W53sZ20d34
pt7CrzhSC6SXubKFsqE6NIxin9593VyOfOSJo129IEO13Ze43uZfHCMqYlN0g7JX
OH7JnISRdu5lJUtltgI/fie+W221avNEHyATj9KaSLnvsI8DZK2reJQ/om1HJ9OB
GtYpjQW5bF6g6wdBY438mtoJiR4CTibp1ABC61CsDUbMc0CvQiF2Jg8ebmBIOqo3
j8DKLW+jumcIgvmX3R0E0HBjBTntD7ijS7KTqywfYSrncThAykXSHpQ7c1x15XGT
wTQAlSocdKNqVQRfCYBXpp21+tAdbFf1IZcfUKggr4vsN/nedh6agq2J73HqXRN2
qQUPbt/R0O6MT3EkbhPXuX4ZhxPZErA0qka5SoDAXgsSY4ymhBs4MAos2b2WCzYk
3vrNGvtOjUIeTyuT/aezwoSWYbOiaXwVVQ2leikMCp/hkgrj1AEopPmO8pSoDlic
yxql5PcdwuVkHJFd11/9xBShv/8ogYOgmscTXSG0CskkreUBD6OfZtQYZ/WMdZay
Cwsz8QL1lblA5ndwT3rsri9TIvNARiCZjUHwDLAJlVp18YriGeZLA0chAfoFI0QX
fW/HfYABSZfHV3Bwsettqv3jdqq6TUNkYuTjNfJPkeE8oDDHxwQ=
=soRm
-----END PGP SIGNATURE-----

--TYecfFk8j8mZq+dy--
