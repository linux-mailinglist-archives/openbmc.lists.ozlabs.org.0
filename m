Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B634B76E
	for <lists+openbmc@lfdr.de>; Sat, 27 Mar 2021 14:44:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F70T42HLLz3bpY
	for <lists+openbmc@lfdr.de>; Sun, 28 Mar 2021 00:44:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256 header.s=fm1 header.b=nm4UTlAp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bF33XQOR;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.28;
 helo=out4-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=nm4UTlAp; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=bF33XQOR; 
 dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F70Sp25ytz2xy9
 for <openbmc@lists.ozlabs.org>; Sun, 28 Mar 2021 00:44:41 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 51B935C00CA;
 Sat, 27 Mar 2021 09:44:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 27 Mar 2021 09:44:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=EZcd8L3/AWQsGI1dd+CUP8BPIjL
 qyyqbyQyYYyfE4zE=; b=nm4UTlApMVM0padbmUcHZSWhk8zRlRNliX0aRtiaISB
 D/aWyWTdRW5IzuIhBkwrWWyjGQ7lCk0qVS4htRQvfAWZbFE9XNqBE/hX9iJf5uhR
 3M/lKC2Ld0ivk41VyEA3hyGRSr64bWMyGdj6Q9qo5ZcDU2JabMBcFz2pp3rAMNSW
 5oUrvqh3NCjhQMpqHhnAoZ1eXXS5dVxEQmdTtJxYbzHpvrw/n6KjzuICE81OGVKT
 4I0vM2e8q3GubJaGuPyfoT9yCIduEtJ52OOGik/S21kWt84hKRNoCPunffrxQSCW
 xVatCDUOXnq6WZLd3qSGzR1KCYskreRrAkYHp4YHVYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=EZcd8L
 3/AWQsGI1dd+CUP8BPIjLqyyqbyQyYYyfE4zE=; b=bF33XQOR5xn5FqKBw5uh/I
 c6le0XA8fAIxe0acSbJUCnBa64bsHbpvoml1KY0TkLf4U5xKwDGx5e65wK9X/Co6
 nk8bBzYwm+4BJeYn2ATfJfEGg1dlguQGyGCHPWRjJVFwS1k+3sgnjPR/L19k2/nm
 LfuoowgAKTBQcgBOMpeW1UH5A6Gg5Y2MgCoiybXSIlQmdm72aVs01FLzP440srVD
 fuWH7NFIoz+WIzfXfmOp881KO1J/UzojqQ1BhIuuJma4ZyGtwW7faiy9RzwtCCdR
 9dNUEaSEhI++9T8myTIpA3LbHVVo/nAva1UvWOwejJB1PiRk5F/LudEFc1KICMsg
 ==
X-ME-Sender: <xms:xDZfYFTDRtAFLJReuB9NiaE3v8AmEWHETy0Sp7sKP_eeBYF7rtRVLQ>
 <xme:xDZfYOy-BHOeCXiw7JHczS4ql3ISqwWOd6RIHEbo51L83gEnO2Spe_52NzHLWxc2K
 3NaIXthlRPXRj9lu0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehgedgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdlvdefmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddt
 vdenucfhrhhomheprfgrthhrihgtkhcuhghilhhlihgrmhhsuceophgrthhrihgtkhessh
 htfigtgidrgiihiieqnecuggftrfgrthhtvghrnhepvdfgtdehvedvieduvdegteeffeet
 veeihffhjeduiefgtefgfeekteelgefgtdfgnecuffhomhgrihhnpehsphgugidrohhrgh
 dpghhithhhuhgsrdgtohhmnecukfhppeejiedrvdehtddrkeegrddvfeeinecuvehluhhs
 thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepphgrthhrihgtkhessh
 htfigtgidrgiihii
X-ME-Proxy: <xmx:xDZfYK2qfd2cKEpJEsLCl1PmIQpM2YmW64b1r8RBtxODCzyJYGl4Nw>
 <xmx:xDZfYNCFONggQlGocrWHFzHkOuJ8Yf_JfABnS5KyHDVmd4cxtVOEdQ>
 <xmx:xDZfYOidTdC9HvlTw-ufT3Nplv0FNuh8kmslS5vLz2NC_CQHFxVENg>
 <xmx:xTZfYEdjEWJBuaF3KRqT7i3yzWPvc2oHly3qNg7-E9Bd7mSPm8ohFA>
Received: from localhost (76-250-84-236.lightspeed.austtx.sbcglobal.net
 [76.250.84.236])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6FDBF1080054;
 Sat, 27 Mar 2021 09:44:36 -0400 (EDT)
Date: Sat, 27 Mar 2021 08:44:34 -0500
From: Patrick Williams <patrick@stwcx.xyz>
To: "Giri, Prashanth" <Prashanth.Giri@dell.com>
Subject: Re: License of generated code by sdbus++
Message-ID: <YF82wrt7FUCr59/U@heinlein>
References: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0qfyevJKz+piWmaV"
Content-Disposition: inline
In-Reply-To: <DM6PR19MB34172FAC6C40C87026A7C68495639@DM6PR19MB3417.namprd19.prod.outlook.com>
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


--0qfyevJKz+piWmaV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 08:58:26PM +0000, Giri, Prashanth wrote:

I am not a lawyer and I would suggest discussing with your legal team.

I am the original author of the majority of the sdbusplus code and
especially the auto-generated templates.

> I see the sdbusplus library repo itself is Apache Licensed. Am wondering =
if the auto generated code from sdbus++ is also Apache ?  Did not find any =
special wording on the generated code in the license file in the repository.

You are correct that we do NOT have any special exemption in the
repository like many compiler-compiler or binding-generation libraries
might have[1,2].  My opinion is that if you consider the output of the
sdbus++ program, which combines your provided YAML with our templates,
the bulk of the IP value is contained in the template.  The output of
the program should be considered a derivative work of the templates
themselves[3] and you should follow any requirements imposed by the
Apache license on Derivative Works.

> Is it safe to mix the generated code with closed (proprietary) sources ?

I'm going to assume you agree that the output of the code generator is
Apache licensed.  Generally, Apache is considered one of the "safest"
licenses for commercial (including closed source) and that is a
significant reason why it was chosen as the default license for OpenBMC
code repositories.  The generated code links against the
libsdbusplus.so, so in all cases you would be including into your binary
image some amount of Apache-licensed code for which you must follow the
requirements set out under Redistribution[4].  Using the code generator
should not impose additional requirements on you.

> Thanks in advance,
>=20
> --Prashanth

I hope this helps you.

1. https://spdx.org/licenses/GPL-2.0-with-bison-exception.html
2. https://github.com/protocolbuffers/protobuf/blob/master/LICENSE#L29
3. https://github.com/openbmc/sdbusplus/blob/master/LICENSE#L40
4. https://github.com/openbmc/sdbusplus/blob/master/LICENSE#L89

--=20
Patrick Williams

--0qfyevJKz+piWmaV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAmBfNsEACgkQqwNHzC0A
wRn90BAAkqWBRbJUP0eAR0MgRVVIaakmxt3e3FE9Y0BJpaqvc+KDYIZUamkQu0Ss
/KFGArYJPNJQr4NqyMjuHP1JZ97XfQi/gMBqbKFr/U66soe2hzzRzDMsxhj9y4IX
+xr+HHV1tOZBuvvWbGCh+tsTa2HSHN7gioguJYoTAwe5b48iiPVV5Xfzh2mTAXAa
Cm0eRwzyL19mO64IeExmIeXz/N2jCUMBSFfzhBJTfDVpd8189Bjmk2kEwM4glXZB
d1R9kTA4/eDEQR0cNv7zSkDRwrhUhZPR+3KnqSCCMkWCASw3+BPGlmDMkTCIxEEf
smbGQlGG5luwacYqCreawxpaSVgmkac4ubNb4iexYxg2555eazGb31agI/NKubQg
5m3xK0fYVcOxyR/W/N3nPmXK9fWcfl6ajXgCAHpcf15GGqBYrrvooSQ42RSN1Mlq
tBMgIhOEFybaRVgSfYCerr/x0mDwvP4vF87i4YOv0088YbhN5N4V6rElToeJsaYb
QsU5chQOMqsgzD4tccP0X78J09joXYYriQss1X8I6KB8Z0pBIicb5dJgOpIG05LR
vQJvsbn42SzWFbBZmHJe7OOh5jzi6kLJObPSravcS4f/edjv1t4/j5TYy5T7muo7
THkrcvPqC2EBF0i9S8mA3n1/HW6OLK+snJ0vY8vQzf/nNhGev6w=
=RHWv
-----END PGP SIGNATURE-----

--0qfyevJKz+piWmaV--
