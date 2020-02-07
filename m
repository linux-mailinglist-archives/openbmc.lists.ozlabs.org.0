Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D526155F0D
	for <lists+openbmc@lfdr.de>; Fri,  7 Feb 2020 21:11:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DmfB5dsfzDqhm
	for <lists+openbmc@lfdr.de>; Sat,  8 Feb 2020 07:11:30 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=stwcx.xyz (client-ip=66.111.4.224;
 helo=new2-smtp.messagingengine.com; envelope-from=patrick@stwcx.xyz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=stwcx.xyz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=stwcx.xyz header.i=@stwcx.xyz header.a=rsa-sha256
 header.s=fm1 header.b=lGfc1eoH; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=P6fVm5T9; 
 dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DmdZ717CzDqgl
 for <openbmc@lists.ozlabs.org>; Sat,  8 Feb 2020 07:10:58 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id AA23E6EBB;
 Fri,  7 Feb 2020 15:10:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 07 Feb 2020 15:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stwcx.xyz; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=y5j5bv9gV8SvskDoTQ5oYvulVtN
 aKGQC4DBDpS7gmgM=; b=lGfc1eoHQsEZdh/UsLJmmpnVYtPdLbK0WaDCkWI85fU
 FT7akqYKxLKWmhxR2dhL28EOkg26chhY+btaIl9YsZtDokgTRNudhVDCeoFlLfse
 oNFaZT8q1VfAqxBcl6g+xto2xf/2MNspbQc5UvG5U9j0j/YFD3mXNChEF9+A3wT3
 LyxqzqGCUaT3BXjBt+nxVoxgfwA2aSYhQjgGk2w4eZB4D4HIQ4l33y2oYhI/bojS
 3spVGsDnITQf51RMEoWVWpmspO/Vyo/1t+C4alKUShqLqMpNLpB5B8CzyY34KQCG
 BYD4mVa40lqYlUMbBXwnrG8Sp97Tmt1eFXK5++p0T/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=y5j5bv
 9gV8SvskDoTQ5oYvulVtNaKGQC4DBDpS7gmgM=; b=P6fVm5T9cv99VhMYoROeTz
 p9JMD8KUMVEcsWATK7RL5wiv1PgrnsLXrvhUaFRFbGCBWxxAvGF9VU4LU3CdJjH6
 /nY5ZZOnBe5ENvEt2Xf1Hn4eIJ6a7QI+SMcrrvqL0STtVFF7cHtwuPVRaELcwLVv
 hXm/GgYRwbPyH5DFbHStkYtk2BJigKqtR6XfqdXp29Mav8Wz4ynUl6N7J0wMoSt4
 ZoUfEmxOO65PPcsFP5tR2H2LGeAzLV5NC5vcZjx1n1CxBuf6srx6er97XgAtvLbA
 UhAwrQxrrG7FKO5gWJUJfG0G58b00GJTIOBRQOB4SL2z09sYQeUqAO9r+9cvqG1w
 ==
X-ME-Sender: <xms:TcQ9Xt6wPFnEVSFYZbyP9w2WaLsRknxMObY18l80ystBVYTjzpawjQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrheehgddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfeehmdenucfjughrpeffhf
 fvuffkfhggtggujgesghdtreertddtvdenucfhrhhomheprfgrthhrihgtkhcuhghilhhl
 ihgrmhhsuceophgrthhrihgtkhesshhtfigtgidrgiihiieqnecukfhppeduieefrdduud
 egrddufedtrdduvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
 lhhfrhhomhepphgrthhrihgtkhesshhtfigtgidrgiihii
X-ME-Proxy: <xmx:TcQ9XsJHB8y8W20ai2rDUfEi_HM0NNCMJBY1E9-Jck1X2k3CMJVTgQ>
 <xmx:TcQ9XmN-M3PyFCVrx3vdYiAxsorEtfbANr2j1o2WzTjI7K3Gxq5yaA>
 <xmx:TcQ9XvkaO_5I4v__5fuyBjqv6DswmYBHlY_n7fIZWbWa58jOceHAOg>
 <xmx:TsQ9XqU87M273A0OYxVXFDUFk1eW7Mfaj5QNNtFuo12koLrg1_nRCA>
Received: from localhost (unknown [163.114.130.128])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8CF473060701;
 Fri,  7 Feb 2020 15:10:53 -0500 (EST)
Date: Fri, 7 Feb 2020 14:10:52 -0600
From: Patrick Williams <patrick@stwcx.xyz>
To: Adriana Kobylak <anoo@linux.ibm.com>
Subject: Re: BMC Secure Boot - dm-verity
Message-ID: <20200207201052.GB38734@patrickw3-mbp.dhcp.thefacebook.com>
References: <33245ec544dc3da5d7f988d5020b265c@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Content-Disposition: inline
In-Reply-To: <33245ec544dc3da5d7f988d5020b265c@linux.vnet.ibm.com>
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


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2020 at 01:28:18PM -0600, Adriana Kobylak wrote:
> The verity root hash value is needed to do the verification, which in
> chromeos appears to be compiled into the kernel, they don't have an
> initramfs.
> For OpenBMC, we're thinking of creating a new binding for the kernel devi=
ce
> tree so that an initramfs can read the hash value and do the verification.
>=20
> Any opinions or suggestions?

u-boot has commands to manipulate a fdt.  Does this weaken the security?

Can we put it into the initramfs itself?  I don't know what is easier,
rebuilding the kernel or the initramfs.

--=20
Patrick Williams

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBGD9ii4LE9cNbqJBqwNHzC0AwRkFAl49xEkACgkQqwNHzC0A
wRkqBA/6AnAHfuXwEdiwU94JFKP9anuZ+GDo1I1D5JhozUhZS0sTvvhy9C82wj2G
jnrZpRue+JIrzFtD3gNNTpgVz1VCFnCExsgE+mmiG3vXDLUn0tYke5IQ7gEug+p2
cCIFVoCZiHKt33I+hSgbFosqfS4KPpfV1rdhZzDBsFT9sEgT2PAJp7rKSp/gqo+n
nO7tWUr9UeIOthJE+s3qzAL50JvQlcpn7XIaFB5akcsdxH2Us3bX+4vUTSwJwehz
/JpBwMwi9dlukk0rYGljokBQ1jTnSXZXy3j9UJ3tdUwLal2mnmkWzwJaCHfN5h1N
T95g8vB1Zc8zlPsET4sMZN4LDzPER9HG+iaiO5Q1LD2rlOQq+ezUh7THP9WINRDs
HHd5nfGMSLuIDVRdBllo/zZqhEmMSsQ/TwdYZsNwbGX5r6JsSFJVghWBTmmX/159
I+mkjAxxShgMVpdFcPhRZoT0gvR7NRzOwClgEyf1OoeRJtvop60gbVbvu79VmjV0
wtwAK4AKvpanrLZ7zgV9oWZWgvXcyk1EDZSP24z8Eb1ZbWNncLRhkL+Nihzo7+GR
RIIIdM1N1/cWzRh6x1lOe4OTpdtXPymFbkVX/oTpwZRa4p/Jq6sMFK/FMoLt3RCh
5YrCcjidC0TGX+xydI/1R7BgGq63b12qWE7fKCKM1pAbqTYf35E=
=UnUV
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
