Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CD322F1C3
	for <lists+openbmc@lfdr.de>; Mon, 27 Jul 2020 16:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFj5b0GHxzDqvV
	for <lists+openbmc@lfdr.de>; Tue, 28 Jul 2020 00:35:31 +1000 (AEST)
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
 header.s=fm2 header.b=icdq+z8o; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=eToA1zX2; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFj0f0217zF14y
 for <openbmc@lists.ozlabs.org>; Tue, 28 Jul 2020 00:31:12 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D77925C010A;
 Mon, 27 Jul 2020 10:22:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 27 Jul 2020 10:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=vBpTH3l5prLjmJBmRE1Aj87bs2x
 6uyF/CQ5H6wUr0o4=; b=icdq+z8o+VJi0WJsPTgRvJYRSoAYcKu63WhX5AecH+Z
 PQYk9ekFlNkQ5zxJCO54/EtxH/F/1ypz9YxEwoXlUtcWmV9R7UDEJCPgwuELMNNR
 vL6dpyT2xB/UC7fZSyoGVJAuuYRPSnuwHRKxAUXkKT8Tuk0dQiGGYOy+FQaD2asI
 +U80Xmo7mhb75QHtd48JBqk+RstB3ISLf2ulKENypqvgpEhhXfdCmS7WTRN0r9W8
 9CwiLM2E6VVF14hIVTeFJ2EyWhFStiGbb3jxY2pAw/Fcmji8N/agOQfKlx2WFJAg
 iWUEVAqXjnpRPDFswMhGgZcvpWnXFbI00oRvlUcA04A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=vBpTH3
 l5prLjmJBmRE1Aj87bs2x6uyF/CQ5H6wUr0o4=; b=eToA1zX2nlnOOsVaJaMKMt
 Fuv5NWvx7/JE8dunYishSdGDLOLk9cQQ6qO7iHwZZdVT6QofnO0rcbrX9oNofewL
 uFPWWJb8vW9NRg2JaH0JmjjXYd879zE1Es/ujuZHhnkdEt95qUhgeQJassyu447x
 PipIKL8cREDDdyhkcAhGX8LYl+7S8bY9xxMjlSpelIO+sVEobh/bDFZyFIVHE5T+
 N2xIXtPlXkLzWDWGc1Ee5bdiOkB0DzzmstDVJ/Dj7EMlxPY7XF36siGfJbi3satG
 7yN9+DLlh4uWoVEYOk7hZBXINiJYAl4tMYwhlubL1nJgKDq9vLS4xcBA3aS+9sxA
 ==
X-ME-Sender: <xms:NuMeX5wJRyD_lOrxGqurHAEg6uhifcHkDPZY3SY1WBODi2vJR-7k-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedriedtgdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fuuhhsphgvtghtffhomhgrihhnucdlgeelmdenfghrlhcuvffnffculdefhedmnecujfgu
 rhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpefrrghtrhhitghkuc
 ghihhllhhirghmshcuoehprghtrhhitghksehsthiftgigrdighiiiqeenucggtffrrght
 thgvrhhnpedttdehjeeiheevudffgedtgfduiefhieehhffgvdejvedvhfeugfeufeffvd
 evvdenucffohhmrghinhepghhoohhglhgvrdgtohhmnecukfhppeduieeirddujedvrddu
 vddurdduudeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:NuMeX5Rbp_xJWHYMklRPJe2gLYb4j05Ruyxuc5NcmevSGFO9ws18lA>
 <xmx:NuMeXzVOWat4QDLK8hrAPVkHiiWKWncWoECkfIlNmCh3qxZNEJrORg>
 <xmx:NuMeX7hWCYXJCKyvqCZisN4Ifg2g1D8xEUfj2uLVTo4-DHgdgGLYlQ>
 <xmx:N-MeXyNTNbXYQt34lBpuIulqXuhOLSK-liienEOxyNwlYdSP0Mjdsg>
Received: from localhost (mobile-166-172-121-118.mycingular.net
 [166.172.121.118])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5A22F3280068;
 Mon, 27 Jul 2020 10:22:46 -0400 (EDT)
Date: Mon, 27 Jul 2020 09:22:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Chang, Abner (HPS SW/FW Technologist)" <abner.chang@hpe.com>
Subject: Re: Fix content rendering issue on RemoteBiosConfiguration doc
Message-ID: <20200727142244.GM3922@heinlein>
References: <CS1PR8401MB11443DA57173714807F29080FF740@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
 <877be4a0-fac1-1787-c31f-9a670e1cfa7e@linux.vnet.ibm.com>
 <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ICrdrp3pM9DyZLTK"
Content-Disposition: inline
In-Reply-To: <CS1PR8401MB1144271C5D55D6896ED55982FF750@CS1PR8401MB1144.NAMPRD84.PROD.OUTLOOK.COM>
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
Cc: Mike Garrett <mike.garrett@hpe.com>,
 "suryakanth.sekar@linux.intel.com" <suryakanth.sekar@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ICrdrp3pM9DyZLTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2020 at 07:55:03AM +0000, Chang, Abner (HPS SW/FW Technolog=
ist) wrote:
> Hi Deepak, thanks for the reminder. Miller also mentioned this to me. Now=
 I am follow the steps mentioned in Contributions.md to activate me account=
=2E I just signed OpenBMC ICLA and sent back to OpenBMC for the approval.
> Thanks
> Abner

Hi Abner,

I think since you are working at HPE, the best solution here is to get
you added to the HPE CCLA [1] rather than have you sign an individual
one.  This gives us higher confidence that you are cleared for
contribution by your company's internal processes as well.

Scott Shaffer and Mike Garrett are the two listed in the CCLA which can
update and add your name to the list.

[1] https://drive.google.com/drive/folders/1VOKT6mnBX1UjMQqKcC75-ir8GcLU1YE1

(cc'ing Mike)

--=20
Patrick Williams

--ICrdrp3pM9DyZLTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl8e4zIACgkQqwNHzC0A
wRmx9g//S+vgIPk/GIe87JvtFcTyiesRkQHULIRgeVUZtgVBwR3A38ByEb7/S4wS
ICls48iRCtFFQ0thnoeUb3CLYFJd3RfcdOaKY3pOvN28tzeynCaEmUUnDXG8eaNp
pmK+sGP5kRfvXPrcGPIUFg6WyZzvVcAdhgO+s5w5lyxfLs76vmfyRtfxmgKyDx4k
lc8q17goo+BgffDshJFXeHN305k/HpzkPF8TTih503eWpegv2NxvPJEaPmOdF4q7
iCwtxWJHeH3Y0FP5s3JuXGw81CD9p5DC9z8254c4qUh4YnvepUXBEj3uSTMt1fbm
VJRSHQ7sum2gBndkarfcCXiAggppeXQFTFayBWP8woxGPrtI/CHcDMWA96vRS0w0
RvEJeDlsPZ29FLabehT/FmcPh+CwR5MjQVsRAddxcAIMmcEY2PrFF3vJxR0YIBoh
cHYTa0sxY8G15T3a7r0SP55fP/4B9gzuR5sY2xK8Br+decNxSwD73LaMWIz7Mkr9
brufmOKH5cfD3fdDJifMA/KSQGTNrTVD5FJyxVwp493NQJSAVIJdD8kZSheFqh9J
I87gTiw3gPFKL0POXqms1LJY/7Dg23nGmBQ21kloe57MFbTSk9AFMTeUXV7t14JV
adihDG2DrY0YOywxuRZHO2tvX7DDB3Ni4jhPcRnM1SfWmCx9BII=
=jdvd
-----END PGP SIGNATURE-----

--ICrdrp3pM9DyZLTK--
