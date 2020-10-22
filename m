Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 386C729647E
	for <lists+openbmc@lfdr.de>; Thu, 22 Oct 2020 20:15:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHFs93BWpzDqPS
	for <lists+openbmc@lfdr.de>; Fri, 23 Oct 2020 05:15:25 +1100 (AEDT)
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
 header.s=fm3 header.b=qC9t1wIC; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=LPHoNyjZ; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHFr6242xzDqtW
 for <openbmc@lists.ozlabs.org>; Fri, 23 Oct 2020 05:14:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 2486E5C009A;
 Thu, 22 Oct 2020 14:14:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 22 Oct 2020 14:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=nvdgW+o0yHdZz2eMpqMcd9WLpeb
 a+/+olmhLw2yb1v4=; b=qC9t1wICSEcreQ+Bctbb+ZIna497BlKUoCLCyU1m6Nq
 apYxmqDcyexmtIt1itOuOSs0ujHpGy0mrVr7gUG0PcV0UXeRfl+Khctmum0qWX5n
 FdGiMXY4AeFh8RNpNO6Z4Ob3pEvvuX0RU0YcdIMNS9MIfvh+AnTuVotVTmykBwT1
 YwtqRNhyI94ou154lA0kbB4FhyZlaoysJP8n5Z8M0b5QnaeKR5fGd0z9D6iBf436
 BUNWUoDuDha8xXuvmZbaAetB2dcfSEzSQHmziPCAt2JNBt7Rr9RrZ6m25Qqn0v3A
 5+aIKrUMB/px+Prtffn3dO92lbczpKlaCAGdRVyW2Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=nvdgW+
 o0yHdZz2eMpqMcd9WLpeba+/+olmhLw2yb1v4=; b=LPHoNyjZaNWzR0QF6o/W4D
 68VXvwa9qRCw/007zodMspA77xHr9d9WciT6Z+EO/iAdJrYCWeeWeY+dGsT7s5BO
 QVMDQAe2Pl34Mx7dvaGVpfFOluoDaocoB97O6C+rJ+BwRigg6S9p3H19ZL06Ep/6
 V59dK/4zzCN1HbsOXKHNG2yVfE8I4dcugfNKAOdHirAPkCfdh1H2pNzRIQ+aYdRx
 Kzl36OovvV9e193e4OmnmDiIvyXTJyEnXQZLp+gHRZCKMn6UWDzEaXNNnb52O4xG
 +WL7l8G+jQUz3EcKkVdKwqJaHcL2fSEo9jB1YT4r31LacqvlCLftEHhmG262D/Qw
 ==
X-ME-Sender: <xms:AMyRXzjvvEEXhCXUOtjpEQ7e_O81WEVh0JmszatbnERo-AkhNnxfPg>
 <xme:AMyRXwBH9But1xfnOMsyQE_iAXe1OcrsBY3rZnZujm-zsaUn6XdxiL1jcBxovdEQE
 KoAEnfh7jQ0bPoQUHU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeekgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddv
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpeegheehfeffgeekveehtdfhgfduhfeg
 fefgtdehhfektdelffevkefgueffhedtieenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:AMyRXzGTLMr920b2A6NgRPubKRkVjexRnLqz5gPEk8bJ7PdpZGaZMA>
 <xmx:AMyRXwQeSJWkHH0xB-OHFXQ1RjOgnpO66s15i20Kj53saZj2_KiNlw>
 <xmx:AMyRXwwkoLoCuGizoFU36DfqXzDXANm7GUxFOfqkjSrZxqe3BD7wxg>
 <xmx:AcyRX9pl2_Yt17V4nywkK51ht3InuxP-sexq8tQnWEWVEJaSsaYVRg>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 733EB3280059;
 Thu, 22 Oct 2020 14:14:24 -0400 (EDT)
Date: Thu, 22 Oct 2020 13:14:23 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Maciej Lawniczak <maciej.lawniczak@linux.intel.com>
Subject: Re: Installing Windows Server 2019 from a remotely mounted ISO
Message-ID: <20201022181423.GE3614@heinlein>
References: <60926e52-9d00-2b20-e8ac-7fd515ddac78@yadro.com>
 <CAH2KKeaBMhU3XDADDE0ieqRRhNBiF57-9rUi+Go-SSJCGG-GBA@mail.gmail.com>
 <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="maH1Gajj2nflutpK"
Content-Disposition: inline
In-Reply-To: <3c0b0dc3-a31d-dcfb-608b-53436074397b@linux.intel.com>
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
Cc: openbmc <openbmc@lists.ozlabs.org>, Alexander Amelkin <a.amelkin@yadro.com>,
 Thaj <tajudheenk@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--maH1Gajj2nflutpK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2020 at 01:37:17PM +0200, Maciej Lawniczak wrote:
> Mounting DVD-based ISOs in Intel-BMC Virtual Media is not supported by=20
> underlying USB Mass Storage gadget. To mount such iso files they need to=
=20
> be converted to MBR/FAT32 image. Attached instruction shows two ways of=
=20
> preparing such image.

Hi Maciej,

Nice write up.  Would you be able to contribute this to the openbmc/docs
repo?

--=20
Patrick Williams

--maH1Gajj2nflutpK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIyBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl+Ry/0ACgkQqwNHzC0A
wRnftw/3QtkPblvUYen7yCQsfh7fPuHnohXVawUCn0mUSEWD/ZODv31JJkrjg+QE
4bivQ20+GgQ5YxfnINKlqQyLK38tBLnX/65zwPmddSljndmiZsU6iq/l1aIEW76f
JS6lwe9iwgM8G5xFXChWbfn4BdjtzRhroMD9oo0bXUUThnEzoQZpUEbxWnDDMaLR
s3izD17PWoTIoeRbba8c/gdUvfBz163Zu3OE4LZ42OrEWTn+oMVZgWXOZF/91Uco
aky7WncofHZbyH9YtaDRwxPFMQXdHCAVjyODLNKCa/GVJgOvkGwn4+H9a/hY8YQf
6rComyUZAEXeyBOXoJkyQMzWeo7uEG1xiUMpQKfsBGJfdgmMFgkAAd8A4E/y7pXk
Xo/+5qtogAW3R70LJQ41B7X8hcPQ16HmsgVsd32N/EBmtn0EnmgAZL1BEQqAJHnl
fMXz+6mkN2Bvd5JUhdoKE35cF3Z6L8+K6F8YHrh+TPzP516ai3SGYr2XqZmLEEHM
g4s5LuHRlicF8ZVsK23YLeXXrjVxbwV5x0REj0IEmT9Nz83riiypk05NbC8/eqUZ
5OoUW4Tl1yNGoi0d5V6TNjWIyJzrteeLaYHQWKrbuj73NpGWWR/P+OtZBadkL/HY
0CdtZhTDOiSkliN+x5cHXKSuSSj0Sek0kjpDzOUaW3F8r/x50Q==
=jrYw
-----END PGP SIGNATURE-----

--maH1Gajj2nflutpK--
