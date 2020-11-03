Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49F2A53C6
	for <lists+openbmc@lfdr.de>; Tue,  3 Nov 2020 22:04:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQj2v1HnfzDqrC
	for <lists+openbmc@lfdr.de>; Wed,  4 Nov 2020 08:04:39 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=ZJwvDDdZ; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Orwewbhm; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQhzk3tNZzDqsQ
 for <openbmc@lists.ozlabs.org>; Wed,  4 Nov 2020 08:01:54 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C93DC5C00E1;
 Tue,  3 Nov 2020 16:01:51 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 03 Nov 2020 16:01:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=/VuckXfPAqiOqV/wtCt2DiIVK0s
 Sr04gqXk9dozHKi4=; b=ZJwvDDdZ9lOWJgVwBsbQIooYTvp0Z+tLgKxfRiyQpDv
 TdykQHM/6VE3/f2rqkivKoDggDCki4EuBqf9195uZfxCJWl2GSZxwhAuE71ncQHs
 EsUh6fmarcRatV/sd35vmEKk/kZebYr7AfVTvI4J1DkbDa8ChqVMTd8rXf0QomGZ
 o69IyEiD6ngRf5NU+zJRO05NFeD/Cj1lHN7qLLFVieIniLZn32QdV95MRUtuRmUh
 GM4vBn1edZEmEJWtN/bhxcrNdldOlY8ujxPcV4+0pM0e9UgoRUWRESptOQSQY/cw
 qIQDAhoDBefS1IMTUFp25dwIXtGxKSGMceZZYvGcFmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=/VuckX
 fPAqiOqV/wtCt2DiIVK0sSr04gqXk9dozHKi4=; b=OrwewbhmmS9VP/T4R57rg2
 MpHBBj2IR7uBHSKwznGJaSrWxbIJmx1+Xm8q5WdR19+bjOf5dZ2LI3l1yikEL83b
 /kiN3xAwSRsKhZsoGU8/Os5taXJJfAmW5KwBctaQieaDMhzDDpXx/3vmY4zA9LIu
 LhuAOH7tDrG7YtxQ+UwQCr8fC9O1q784DiqE+l/6V1nshdij376HSj6rOUFgBnTU
 oSRtdxnVafX3JDsbMCNL74fQkSjOXHyA6TtcCMOl0GUvorQroQytEDXT6aEutAOQ
 iX48OxqtbUpqQdeYvfPq4jDCP+oMy610O8JrYMyd9txDWzBpujrkg4NostEnvq8Q
 ==
X-ME-Sender: <xms:PsWhX5Xd8VqxAN-3-u3LJ70uyijHgKH7173L6o450c7x3CkYFH6XeA>
 <xme:PsWhX5lSYclrlbrknZKslUyTFosHl2P2ATV_yAvKEkXjKuPFJK1I5AN6GIjJOfgOW
 aUGxH1mDK3DWYhTtas>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddtfedgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enfghrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredt
 tddvnecuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghkse
 hsthiftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfdu
 hfegfefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvd
 efieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehp
 rghtrhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:PsWhX1b5Efl3ANtrpBjqDAvqC4JevWaXNUoETGJ2zTA_nkgFClI47A>
 <xmx:PsWhX8XZ1eYrO3a7qvtIBByPt5cKM_NA5m8SBqaswDxKCvYMB54Btg>
 <xmx:PsWhXzl7lD6-CFbwMwMRC0FqADhpAWRjZ8iaVXfPT1S4qq7YhgOngA>
 <xmx:P8WhXxbSFe4j6yruthffcKd4UulvB6EphtBzseuGxNODRsR6L3xP9Q>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 07B833064686;
 Tue,  3 Nov 2020 16:01:49 -0500 (EST)
Date: Tue, 3 Nov 2020 15:01:49 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: Multi host bios upgrade support in phosphor-bmc-code-mgmt:
Message-ID: <20201103210149.GB38269@patrickw3-mbp.lan.stwcx.xyz>
References: <893bbe2bbfe35c6ccdea0988c8ec1de9@linux.vnet.ibm.com>
 <SL2PR04MB330696831B49B81F75168538CA020@SL2PR04MB3306.apcprd04.prod.outlook.com>
 <8EF4ECDB-2EA4-4620-B7EE-FBB899FD1C47@fb.com>
 <TY2PR04MB33110CD5532EF9CE5F3FD949CA1E0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <ce091343af20328a24f1b1f02fca3ec4@linux.vnet.ibm.com>
 <219FD10A-97C2-4876-94B0-23D548A6D7B6@fb.com>
 <TY2PR04MB3311F9B0C300A1CB363C2E67CA1C0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB3311EF16B27EFE8683C8B818CA1A0@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <TY2PR04MB33113E97FD6130E8FE8FBEA8CA170@TY2PR04MB3311.apcprd04.prod.outlook.com>
 <cb26521dbead9fd84e3b8863682291f5@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <cb26521dbead9fd84e3b8863682291f5@linux.vnet.ibm.com>
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
Cc: "P. Priyatharshan" <PriyatharshanP@hcl.com>, openbmc@lists.ozlabs.org,
 anoo@us.ibm.com, ojayanth@in.ibm.com, gmills@linux.vnet.ibm.com,
 "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Vijay Khemka <vijaykhemka@fb.com>, ratagupt@linux.vnet.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2020 at 01:52:32PM -0500, Adriana Kobylak wrote:
> I'd suggest filling up a design document template[1].

Agreed.  I tried looking back at the discussion and I'm not sure what
the remaining open issues are here to give additional feedback on.  A=20
design proposal and summary of the outstanding questions would help
give direction to where we still need solutions before you can proceed.

Feel free to spell out "Open Issues: ..." right in a design proposal and
we can work through that in review or defer back to the mailing list for
discussion on the specifics.

--=20
Patrick Williams

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+hxTwACgkQqwNHzC0A
wRnlAA//VXCpyzgpf62Muz1PnKuEDpCWVQlyctTLvx7vmj59QvWbIpKo7V6WVJIg
wSBrFTEeTk71n+42fKYSJwxSCk61sjwAVH6QlF0Ge7IQiLIXAvCLDCVmjgq3WgIp
hs247aNbZMPp4QRB8hsUsyIzGyi+oosb8Bk0WXGCPrE8bXaAEsuht6CK5z94t4gD
PIs/w2t/taYqDxRVtozbs9ga6oB4gyvHAutBu5jD+ZCiRFxeX/M0ZeUwrk2/8Orf
+NteXHggJDzarzWcxn/gwnJYrTFbKrhWUiU9EwpzNE5/jcM8MIMusJH/+X4VAHHm
u3EBeNDEDwPyLZgOy8WSpKFAEZ0qRQaO/BeZOZxVoiWWwsdHvSHwo5u+PGyYkB6f
qvwyMwCzcHo6PRkAVOkTE87L46wWlbDo3mq1nwbWzqcscneiMTqJyno132TiC5I6
HHUnZlkBSwh9nC4EekC1a/YhwzFdQyfsRtuUBU5pRdnlFLuXzv92qbjNM3JNfu0P
+fv1tIBQjFC+0lUR4XdvdHO+6kf4P6cbiru7gMc5T/2bbKxyhKoGZ/695u/WyNKf
00/5kqibFWhjIOwEaBZ9L9bavRrZbVTjjTYls9OCr2oN+CJmrh8R5ijeOiLreMIw
SK5urUxt4h7Ejo6LdzztREkZiGXlSVfmXLZnbc70H6UqNnmTtRE=
=W2QL
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
