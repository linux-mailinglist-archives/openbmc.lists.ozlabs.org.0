Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1955D168853
	for <lists+openbmc@lfdr.de>; Fri, 21 Feb 2020 21:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PNL83SH5zDqZy
	for <lists+openbmc@lfdr.de>; Sat, 22 Feb 2020 07:27:28 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.221;
 helo=new1-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=ro0BTbxE; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=BSf2dVx/; 
 dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PNKV4jZrzDqWS
 for <openbmc@lists.ozlabs.org>; Sat, 22 Feb 2020 07:26:54 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3A4D370B1;
 Fri, 21 Feb 2020 15:26:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 21 Feb 2020 15:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=PmWV2Yr6ZFGeK0gLiGxcv6YZga9
 oqiPFcZW+paC+Hvo=; b=ro0BTbxEVEb5pcVG45PRnzNWpxusMFw5MbII+eeYf7d
 Xx/tOpwmiW4h7dNtCjl23HIvkB3skhxuHYtc6GmoyDS9pq7Yht+2xLyUq/OBPs0h
 TsVQQuK82GBKTAqosn99wNAN23RqK0TKi6W7oFfO52sYoFGGF4A50F2JCxRILgfx
 vjIlqaTkSeiqcnn0DdlqpDciU22EgeAsHWLa4IGl0nhOugnRqv7TKJmWeh9jTVCx
 j+12pJX+mNQixpDjbb2qV/uDcF4vrCmFOx4LTQJgGtAfFAgC493QFnj9L6GlNuPV
 LjnRJY2Vps8eDk7sYiiVjFrlmkjbArlycKrnV1u8dEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PmWV2Y
 r6ZFGeK0gLiGxcv6YZga9oqiPFcZW+paC+Hvo=; b=BSf2dVx/r3Op9fJ9b/2bYp
 gapEaRNxxRSH881BL5j5Gcmt1CLCGh170791IMYVIYaowH9rtBOSqo/dwH8Btefb
 p01Ja6R27pISdFCqEIC0DgiRjF9D5iB5rJU5Vhh+HrlzgRLHtIs/VGOLTef7jGDa
 HSW5KPfdOZxaqCH74u3LjeIRpVPBPKEX59BF88wE3l0RiTJNU8+xDc2lGvrjf1uB
 yy061Z34kUWlZAfAz8Zo54eDlm2+MFDB347EOtQgcVE5xdKS+eFUmcNwbzmDtVxv
 F0JseJoJA7RMCTCQTS66w64hsxkUkEni8B79aC1Ph1xsxPmU+O0sLeTvemMdTlog
 ==
X-ME-Sender: <xms:Cz1QXkaUNlP7DXAwT9WXtqHIdD7BnazxIXpqs5JINWX3mTOJsYEmrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkeeggddufeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlfeehmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecukfhppeduieefrdduudegrddufedtrdduvdeknecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:Cz1QXmzG6ClcxbspyJUcScr-BPP3nDeN1r-styqSbn97rUS-EZG7kA>
 <xmx:Cz1QXpSr4bSaolX3sF4Y3yIRIMH0IAXZRbS7m1nz5fm_yLav3qBIJw>
 <xmx:Cz1QXkpDGWYWLaDQ6YfaYC4nOo0AvoNP49FjKanRAHj2D4_iXhVSVg>
 <xmx:DD1QXhTfq4-PGVpnBRLe4hFdMePUZFHta21DORTNXRsbciNs2_hGtQ>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6959C3060FCB;
 Fri, 21 Feb 2020 15:26:51 -0500 (EST)
Date: Fri, 21 Feb 2020 14:26:50 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Bruce Mitchell <Bruce_Mitchell@phoenix.com>
Subject: Re: Security Working Group meeting - this Wednesday February 19 -
 summary results
Message-ID: <20200221202650.GC67957@patrickw3-mbp.dhcp.thefacebook.com>
References: <b9170918-0937-714a-470e-cb41e1e74b63@linux.ibm.com>
 <f4d9d6f6-277e-8c8b-6b5c-d0577eaa82cc@linux.ibm.com>
 <20200220162633.GB41328@patrickw3-mbp.dhcp.thefacebook.com>
 <2b30dde7-3415-8c7a-2001-28793e938339@linux.intel.com>
 <20200221201022.GA67957@patrickw3-mbp.dhcp.thefacebook.com>
 <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline
In-Reply-To: <2c409610c4544e0187e37a5322c6a313@SCL-EXCHMB-13.phoenix.com>
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 21, 2020 at 08:21:27PM +0000, Bruce Mitchell wrote:

Hi Bruce,

> I do not believe that the BMC's self-generated self-signed certificate sh=
ould
> be beyond what web browsers will accept (or in the near future).  If the =
customer
> wants to install their own self-signed certificate (i.e. not from the BMC=
) then that
> is their issue and can do what they want on  their own self-signed certif=
icate.

I think this is in reference to your original concern about the
certificate being 800+ days?  If so, I agree we should shorten if that is
more appropriate from a browser perspective.

My only concern is that it appears we're generating the certificate once
and if the bmcweb daemon stays up longer than that expiration time, we
end up serving out an expired certificate.  Unfortunately this isn't
something you can even observe until 30 days or so in the future.

[ I remember once having a ~40 day bug in a product because someone
  stored milliseconds in a 32 bit integer.  It can be a real pain to debug
  something that only happens when you don't touch it for a month. ]

--=20
Patrick Williams

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl5QPQoACgkQqwNHzC0A
wRlaVA/+Kk9dRxE162pvMHvShfxX7iqZG3xIKi8CH9sIQmQkmYymBI2wx3l+LQyC
TKf0GUSGKW2rtwfU0PdeRq8sG9ytXsCjJB7N9/ptdzQpFLoxqjtWBtwJwCz+6L8T
B6lux0zrNWzB12jmJZfuavqqjZhGh06sPpwsFkv2Al5a7U5JcULy98TbSqHzDfFv
DR84bZJXoNq3v0/+kSJjzyLOvpS053ZX4txmKFiypudnS3V58K2pTKAngJ0J3xCM
LwmRwkvzHPiSQPg1GlzdxYvMbao+4Mu6/M9BDlNJPQz+7V79MBRkrd+MzNYp8V4C
hZjCD1C4L60VtN/Ta6Vt0k+RV3wk4Ukw14n4bnXatwxE2AbPSlvLwyslEiYWVRk1
o1KdTROgkAZ561jcwiRaKgIp35dW4Z7CyamjY6zmGhlwuqUN1kfhrcIgBHV2+pbV
iD7L96Io37pIB2b0IqGLtMZ/vjJiwuyR+SZ+26KSMVMhIL2r1rcBQIegkiDtRINZ
cbVo2tOqftLcWZSJx4Sj14kHqRLk3GznXEEI2qV9WfA+VkYTxGJ06oMmldZ3Br56
dBJ4sLbi/EcTVPNdjmTve5Pun2DoAMh1t5tbuErtxnGJN17a7ZA0nA+xUg4WYM8q
rrPSQ7W5+6FTm05W+IPAnJ/JaUOon+5xthE/0MiJuYFarZpI2rE=
=H2Xr
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
