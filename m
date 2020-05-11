Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6863D1CDD8F
	for <lists+openbmc@lfdr.de>; Mon, 11 May 2020 16:45:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LNy34T4szDqQr
	for <lists+openbmc@lfdr.de>; Tue, 12 May 2020 00:44:59 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=64.147.123.21;
 helo=wout5-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=lfVLaZNv; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=T+azKznW; 
 dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LKbd3DfZzDqMC
 for <openbmc@lists.ozlabs.org>; Mon, 11 May 2020 22:13:49 +1000 (AEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D13FB2D0;
 Mon, 11 May 2020 08:13:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 11 May 2020 08:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=l/GWxOU/EMBNjzpzn3w2/RLamrW
 DD5IvskzYRKmmgmg=; b=lfVLaZNvYZbdyTMiRNwBIV3NVn0tRKDjboqec96jXae
 gp0SR6JGUaoGOsqlKrJ9lgLwzyIhzLXvDg1whCh4JupSktL79NEH/6MnIlIHVF4c
 T4MpA1m5owcUnJrhk7hjWaVjTp6a8w0DprkOc/TA8Vac+t2CZoLPhopKZYXn8nxR
 hzD36nQWNaIDaiQScZ45QwecAVztn0Zrhal6laH3BS7mU2EihVYb2vmDJeIJbT11
 bEQa4QhlCdZY5gM/0r5/0M12yz7BGbcHFmqmPw3LxdI+vbvRdMl8Z/1yw6oP5AVF
 WbCijr8rwZ3htQlpTzxn+bEq49YWHZXjY2ae/gypvgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=l/GWxO
 U/EMBNjzpzn3w2/RLamrWDD5IvskzYRKmmgmg=; b=T+azKznWqaAL7WxJrfY/ot
 D8b11UrGCo+R5cc/+qYlfRZie8yDpCIVjeuw8L7IkZY7vnU4pR5K6Lj0SThzwxzt
 Sr/IHeSKCsxXeB8sS3uipo+dPyMwltLrCRMka3lcGEUp7sJu/DruLcoUCyf/TrwW
 nbPLe6mBBECAqlpFZMYBQzAvL6Hht0v7WrnnuvOPdE+s2svkV6bUUeaNjIgZd0Di
 5o6cRaWTE4ZTfcS/HuUCMSn2cib7K8GG8u/osL90sY4XbX+pEXVxCBlpq1OF7Bou
 ezb6cS3sSFLMYsn1iP0Fkj/nfERfqCQIe/iqpw6Y+2osVoa8JG9D2xj7M+/ohQvg
 ==
X-ME-Sender: <xms:ekG5XpO_S3-j9aep387Tfj0hXblily83U70GcwEDYMNslQuRv3QWng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrledtgdeggecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdejtddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttddu
 necuhfhrohhmpefrrghtrhhitghkucghihhllhhirghmshcuoehprghtrhhitghksehsth
 iftgigrdighiiiqeenucggtffrrghtthgvrhhnpedtfeejteeutdefleefieeiveevkeeg
 ueevtdevfeeivdfhieeuuefghfekledvhfenucfkphepjeeirddvhedtrdekgedrvdefie
 enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprght
 rhhitghksehsthiftgigrdighiii
X-ME-Proxy: <xmx:ekG5XqMpW7m14C9p8uXFLEnSVujsk4ESulzkV7njMmUVBLxGVnBJ8w>
 <xmx:ekG5Xhlwy4ahM-WtckZO7R9uHg2VWp-fnz1quQuuRWJnH8dORAucFA>
 <xmx:ekG5XosDRifRXa4sywJMN4fjDaAE25NZjHzSKFUnItHlAgmrvlR4MA>
 <xmx:ekG5XnBLfUDQ_4TTTLll2NVFSb-8z2eSbpwA6CrFqJsp8zhwX4B1OA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id C7FE1306628F;
 Mon, 11 May 2020 08:13:45 -0400 (EDT)
Date: Mon, 11 May 2020 07:13:44 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Li, Yong" <yong.b.li@linux.intel.com>
Subject: Re: rest-dbus does not work?
Message-ID: <20200511121344.GB10214@heinlein>
References: <0f8b153c-5edc-1aab-422c-28f5943d12db@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="i9LlY+UWpKt15+FH"
Content-Disposition: inline
In-Reply-To: <0f8b153c-5edc-1aab-422c-28f5943d12db@linux.intel.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, yong.b.li@intel.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--i9LlY+UWpKt15+FH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Sat, May 09, 2020 at 10:26:10AM +0800, Li, Yong wrote:
> Just find that the rest-dbus is broken, with the below error message:
>=20
> Anyone encoutner this issue? Any suggestions/comments?
>=20
>  =A0rest-dbus

I think we effectively broke this with the Python2 to Python3 migration.
rest-dbus was written in Python2 and against libraries that I think were
deprecated and never migrated to Python3.  I'm somewhat surprised that
it even installed into your image.  I would have expected it to fail
dependency needs as the libraries it depends on had been removed.

I believe everyone has effectively moved to bmcweb now, and most
platforms are not even installing Python on the BMC anymore.  I suspect
there is not much interest in reviving rest-dbus and migrating it to
full Python3.

--=20
Patrick Williams

--i9LlY+UWpKt15+FH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl65QXgACgkQqwNHzC0A
wRmaGw//aFURx9EvIsA8ampXDPRkjhGc6JDEoe2/HA0Mi+qVQcCX8aQV6vNSJl2w
O+vfxsbHc73pteBjxgc2nyXPOqxOOlMAEbMQiC9tOGe8oZYQpZfGWCaZAj956wsd
pzq4gRuIDQblsvtKePfKilOLfGuLfs9fPNamVELQ6HdpKIYAQxlGjgAzAm7qOo1l
q7w7C7vaWgyNxN8R/sRnidsohu3DPHVULCqEkjKFfkzk6ckYYFEX0G0TMItaZrCq
HQkiEOK4SXh5/yYGgO6MiwCRWJ9G4i43BZKTry/fupBNkEW5VaoOHWaQdJd50Wye
C2DsVPLDHdcLrlxw7uoCC8/quBuFd6HFODTZMMLPngu3y4uLCMS+NjAd9mmRVuvi
kjMOHTdREkDg8MnVis4SP5DQkmOO92e8DZONTAF16PfATp+ygMMSZLHXZSmmpVi0
rrWamvLYVe5SgyT+PI355o4DWKjwPUzttljLcJqw1O+m1EOZjHN0XkWB6XXQoohW
xMn5FU/kUuvOBKbAmeQ14kDUytI2HdTIih7x/0CuKrMAu9MFU3mZJVPZB677nm8b
+2+IrpuRGbIeitnyyZZ2h0p0G6jbQTIapgj+/PDriQPe+P/nQj+uZphiIzYkReqQ
x4JzH1f0icIH+9aM8MIV1QV2Sq1FjvQLcRUlcj1RUfYV+w2hiJQ=
=S9Ms
-----END PGP SIGNATURE-----

--i9LlY+UWpKt15+FH--
