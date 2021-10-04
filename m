Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C3F421A32
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 00:37:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNbFq2vxpz3cJp
	for <lists+openbmc@lfdr.de>; Tue,  5 Oct 2021 09:37:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm3 header.b=kUqaHw4r;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=X09/TYYA;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.26;
 helo=out2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm3 header.b=kUqaHw4r; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=X09/TYYA; 
 dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNZzS4g7fz3cZb
 for <openbmc@lists.ozlabs.org>; Tue,  5 Oct 2021 09:25:24 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 16A295C00B1;
 Mon,  4 Oct 2021 18:25:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 04 Oct 2021 18:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=mNtomvxrUc8kIMv7OdfWfZNkb5b
 wwxuEl4kea5xXFdA=; b=kUqaHw4rRtm5oh/y/Zfn15RxH//ef/IPVAcwC63fBL4
 9CBLop4Yu6NhjvU25Ll/UWzXRfIgOMEeBAkeutN5GdI3pwuoeRU5Dk6L+KUdYqDe
 ZCNw8IQLrkbgNyNNkcEbOXM/k1iJqGmHxbm3Le2MrqgcVT+fl/+VNaPOCb0t7UQa
 VqdLzp87PFJ4Bqy6lsMN4OFkWWgm3KjwzdE3VXDX8P4IeOfExM+5525FvCjSuLdA
 XMKLXaHl1CksaQZO41fOzJdC/HaWiMcNjrIj3pYqthWUBWKZeZA6o+tm6PO0CJPP
 4hJh7XnQpydCIZQfrxSE1nlgKd96ShtKOmo9GM1GOAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mNtomv
 xrUc8kIMv7OdfWfZNkb5bwwxuEl4kea5xXFdA=; b=X09/TYYA1PD5tnhwNOvB5a
 1NgExcvir0PDvmBzzD020h4LPEeQpChffXo4MUooM4rjuAuSZD1jxuG40IFNWoRm
 93KffcANhk6sD9tgeDF22MbUa5rXCPkCrsm/ktN3UwKs79UGRgNCdGuxeBvQyz48
 KuNQK74NmbG+5TvRIuBf1S+LyrybxHVLnYcSu0/8yWYj5v2rplue98koYyo/usoZ
 J3I33pBrh3V0rrKpfbCXzlT4Mty/3Gt9UEiCdy5LwvOLf3sox4+MWP9BDSSu6A+t
 oyipSisxRa8lsvlmuElaxXgokSTtTWDaFGjK0ksNfoCIrAkayhkzUwsK+BcGGB9w
 ==
X-ME-Sender: <xms:T39bYfAAyUyjlWfAj5sZOix1rjURM28EcvXruZ3h8gSJFkZiZCVoew>
 <xme:T39bYVgio42Do_aWJPczLmPby1z5h-TurhKE_8hZzL-_3UWBR6wqbFULp083WMNjc
 L2x_MMbJ3rSIiYOvzo>
X-ME-Received: <xmr:T39bYakH0c8qhp9GhP67cIhi9G1HEzMRY2fSwAiOECMmFaMPEbNODupe7qPiK8rr3UFlj77FbTpXMNE1_ptibUEDyk6qtlsk8ow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelfedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 jeenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepkeduuedtfeeihfehfeehfedvjeeu
 jeeikedtteehledvhfelheekgedvieevkefhnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:T39bYRyFkSsliPg4Y5CbQwelceU30d3ZmLSzn4VcXRfL5svp8Fi9_g>
 <xmx:T39bYUSZoITUa-dmC_jCHuSD8SXaoCNV_gY6_HTDEY57XyzYAoWwzQ>
 <xmx:T39bYUb2qoVmkq7CVMC6k4TcwOyexHLsuSsd4xfe6cqGr3228D8e3A>
 <xmx:UX9bYfKX0bvtu7qCuFsbdQl75xwqUlBgVJOU_7LVEUtP5NXmwCwh8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 18:25:19 -0400 (EDT)
Date: Mon, 4 Oct 2021 17:25:17 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: Peter Delevoryas <pdel@fb.com>
Subject: Re: aspeed-adc driver kpanic
Message-ID: <YVt/TU4zANvubugD@heinlein>
References: <YVtJTrgm3b3W4PY9@heinlein> <YVtNypUnYfp/kztP@heinlein>
 <24AC6FDD-323D-4F37-818F-C965164544BF@fb.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZNHTb7gys93OLzrm"
Content-Disposition: inline
In-Reply-To: <24AC6FDD-323D-4F37-818F-C965164544BF@fb.com>
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
Cc: Billy Tsai <billy_tsai@aspeedtech.com>,
 OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--ZNHTb7gys93OLzrm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 04, 2021 at 07:26:04PM +0000, Peter Delevoryas wrote:

> Oh yeah, this is probably not the driver=E2=80=99s fault, this is the fau=
lt of my QEMU
> patches. I only allowed 32-bit aligned reads. I bet if you apply this add=
itional
> diff, it won=E2=80=99t crash

FWIW, applying this did get me past the kernel panic.  I don't really care =
about
any of the data right now.  I was trying to test something out in userspace.

> diff --git a/hw/adc/aspeed_adc.c b/hw/adc/aspeed_adc.c
> index fcd93d6853..58e3f18c6c 100644
> --- a/hw/adc/aspeed_adc.c
> +++ b/hw/adc/aspeed_adc.c
> @@ -234,9 +234,9 @@ static const MemoryRegionOps aspeed_adc_engine_ops =
=3D {
>      .write =3D aspeed_adc_engine_write,
>      .endianness =3D DEVICE_LITTLE_ENDIAN,
>      .valid =3D {
> -        .min_access_size =3D 4,
> +        .min_access_size =3D 1,
>          .max_access_size =3D 4,
> -        .unaligned =3D false,
> +        .unaligned =3D true,
>      },
>  };

--=20
Patrick Williams

--ZNHTb7gys93OLzrm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmFbf0wACgkQqwNHzC0A
wRkPpRAAgzi4f2Wq0LiMA531uoJKoF7vf12MZ5MTRvIOJrMJqakcfBdjI0hirrbJ
xXs00VymE9bIEItBbB/XtzknWwaZ1JKjf52TFJrw5uFsBFQTT9Q3nIp0pR75Rjrp
wdRgL2uhQxETcJrtSTcfe9EVjQgUeDZ1MFfTMMQUS8S6paUeaLbCWa7LY3Apegz/
6fqgidpaxYlYMAZ9bO2FLXEqTDtEesgKUG7MWZBbjax9NmId38PhZYssTHTP9RC+
nEMBSkaL8UiwNIN1MNsOARV1xGrB1wM2uu00zkIvtnk2w22DOCjJ+2TLJPIljCtu
Z1XyzvXeyOJp/a9W+4dsvwnaynzOs+tCkX9jfrgKjMSsGLPZm8p4Ca88mu7fO4Bn
kcP039wPnAtEUrWtoP1g9ptNl7FZIoi3noD9qNzjQPoD3IQzSMNanqBOZxNYLXQP
X14sxVC1dqevhzBiA1rjLoFP4rlCrr1CuJuOQPGu97CEMaOfa9OR04Vw5qW6QZof
4abUSqvVcMtqECAQGCAnu8IFteUCtpFnZlQOLJcUQdXJO4McZtai2EKWCnEljK6F
//Vp8LVf+G0PjcJDE5u9uxMiLArtyO/aL9+ADFSBOIqTa/1qRcqdzDp1YuR/JZoo
8cauxN0mjYhsMnsRHamhDbcybMRNDuv27dwl9x8+0f8dEPbcWkQ=
=V8HG
-----END PGP SIGNATURE-----

--ZNHTb7gys93OLzrm--
