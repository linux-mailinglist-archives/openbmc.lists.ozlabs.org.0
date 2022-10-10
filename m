Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F05FA2C0
	for <lists+openbmc@lfdr.de>; Mon, 10 Oct 2022 19:32:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmQw850Ksz3c8V
	for <lists+openbmc@lfdr.de>; Tue, 11 Oct 2022 04:32:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=e3Ylgf67;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=e3Ylgf67;
	dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmQvX690kz2xZf
	for <openbmc@lists.ozlabs.org>; Tue, 11 Oct 2022 04:31:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1665423090;
	bh=xY5TbWfU9jnke50PzW1ZY4f+LCC+RjPv/XvsO5Beesk=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e3Ylgf6770zhHvYF7nlePQ2MiVPEQ9hsvyjDRiTsEQv1MjvT16HfPUlZ3+fbQIDVT
	 n0KJ4HW+t/n8b3FLCKoJPNC47wfMCQjuiAQvQTxrNYKRhsvxuNMRmLiI9+5D6ZQf6q
	 Byx+4gIQtacSBhzssVJvGVoWtjOkmO10WXPyE0Os=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from probook ([95.223.44.87]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMbO-1ou3Z01Jf2-00EJYj; Mon, 10
 Oct 2022 19:31:30 +0200
Date: Mon, 10 Oct 2022 19:31:26 +0200
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Kun-Fa Lin <milkfafa@gmail.com>
Subject: Re: [PATCH v1 0/5] Support Nuvoton NPCM Video Capture/Encode Engine
Message-ID: <Y0RW7rOfUrvWXgdv@probook>
References: <20221007025413.3549628-1-milkfafa@gmail.com>
 <Y0AsbVvZA+VQVfcP@probook>
 <CADnNmFq-_pVFSDRFJ07HAt0Z+=CMwbHaiSPamaJiUXOU9haD-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQ97n8+uIIgKWnrR"
Content-Disposition: inline
In-Reply-To: <CADnNmFq-_pVFSDRFJ07HAt0Z+=CMwbHaiSPamaJiUXOU9haD-g@mail.gmail.com>
X-Provags-ID: V03:K1:CGp3mngjhN4Omsz1QwLchy9aUbKpO3tiPKuudFdXFZajPIG/ZgF
 azpkFwiKiqMEW6XSUNx+EMYFmhWgNukhvfdrmMp0NM9JxuKi9nd0PrJpbc3gUPrhKGJTzyV
 m9IzxvYUAMkR3AN0rqS+qCYUQ9wfoRDF1hosnOfmoy/TbnEsNbsbkmgJYYZCEYpqmGgwwOb
 /auIBpg0iRY5XfBcxm+lg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ytorM80HTGY=:jKEcTUZLd9FaXjaPlkub7f
 16wMo0OPBZaHCX7O5DrSDGU3t8HYraqpKq2HK0M9yIx3xHj7zUQRwwqBA9vy0sijlCpZx/uHQ
 8TiG7ksy5/UneMy1C57R6aEYyIx8uB/ikbIjoWv/dgTY5nwV1XJdjYop8At5/0M3lrH5YMmYi
 zSppqaiDhONV5YuVBoYf6i+TV9D+kCxC+4UcCLdqcEZmJ8w6/SJzY31oJYXcxZFZp/AeNILv4
 7N1XdddEMN3jc+V7v7Y5RrtVUNX+/HQ29aZTebrsYWj6YuCs8V1A7uR+FwJ51Fvilps5dPWA8
 CC42wfZah/i5mIXty1yT2e1lJlI1nl/iMPOodfrHFOZamop8SmHL54fmUBjWgDWC0J57GwcsU
 IIWKyA9J69w9hv+JVwReSqfyyVRo5wuCCH6Ga3MXNK5xfsXJoWJXojzuYukNnxPYclDod3BGm
 45Im7DF4Ej7oZfHNhya4gtqNeNgyfPbQT+GYMEeAl5u4OPUZqXXQAQgnsJR5Zy+hDPNjkrhPh
 RaVS0jzD5z0iCYx0jiPtwE254glew9QRwe1EZXJeiiwTVtyC5W9mdlGu9w54BAOtVGb4L8uEC
 1ZBMGIt/PgFIXeGmgU60KkOd5xBGlBstu1bGGSOKYtEBZNxr+pQMuTgeC/ytetnAAW2TLj+/p
 v0SWj61SQ+EoIJEck9+yybvqrnYpyTpV8/rxNgetkpiXNQSAPdS3FYcZUJ6J02eX1acCy490M
 ztALHo7tMedgt8zpoQ/Gm/yQ6etY3lCMLfu837BERsqXfa+kfTwngc8zAd76RzftIEkWryt3c
 OUrfbY6ZCNwkl+SdGWsZEA8IGogWj+Slzu2YD+iMUpzcsiVyZEHdCRuTBxx0krz2bWGZFg5F8
 Sts9XqAfS97lC4lW1LfV+mmgXzH8rwjitsizg5T++KosSsg/2vQMfiLpasSnXNFp0vrl7gONv
 L+Zy2CwD9kpKXcVt93ofetZoex2egHwbX4sVKZv2dYOp5VBuqB/N3m+agAcK+0ntAbSCc4KQp
 sMSrRAUOJ4NjTLmD5gd9eF9MSIefK7AGoz00gqN3bW42E/tKrwV+mqleAyX1cPWAt5Jxo/5zp
 WioP4hprotsmzcU8vCB2xH1LomgtXeeqrZ5aX5pjbKA4j6fWHP7Gvx4HTQJn9Dr6JmaaDftcW
 d6DD7QesIcx4iDFJsh4TgLhdVKz8h9FmQ1FwfiYH9l5lpR7exekr+61UOZg6vxSX5E15roiNI
 l2d17xjICi9D+VEH0b+5WOzV7yPvox9SeD+lFP3pFSOpdxZSKeqqBp+2muVQsGSrotUgA9BT+
 i+dsrn8u+/hSSSsCFGU8SxZUPbAZQwUqmVzDTh1nDO1DL+SCsVwF+cWlsVV+lOn9FhTs/dhN9
 NhOXVUSf/kuN2RTFew5gtz1GM196HxTzKi8VxTRMwBfx/K6mmc7bJCqNutB1+din34xgfidT+
 +sdqfOC2aHzQrugCf63Zbb0u+i9j2smIMXcFJGj++v3ZmuWSGzOAtB1SyKUIW/8JgSAu5bsiA
 lMqfS6uu3qmTsuPoPnbwfZGRxCYJL7hz34vLA/8S0qNph
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
Cc: tmaimon77@gmail.com, andrew@aj.id.au, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, joel@jms.id.au, kflin@nuvoton.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--pQ97n8+uIIgKWnrR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 09:01:25PM +0800, Kun-Fa Lin wrote:
> Hi Jonathan,
>=20
> Previous patchset was aimed for torvalds/linux and we would also like
> to upstream to openbmc/llinux.
> So this new v1 patchset is specifically aimed for openbmc/linux branch de=
v-6.0.
> https://github.com/openbmc/linux/tree/dev-6.0

Ah, I missed that, thank you for the explanation!

To avoid such confusion, I'd suggest perhaps indicating the branch in the
subject line, e.g. using [PATCH openbmc-6.0 v1 0/5] or similar instead of
[PATCH v1 0/5]. "git format-patch" can do this with the --subject-prefix op=
tion.


Best regards,
Jonathan

--pQ97n8+uIIgKWnrR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmNEVssACgkQCDBEmo7z
X9tqSg/+NEc3x9Pa7Om6JSaXX287FIm0WTfRnllWM9QWnrObd8tqbr6zYhAr6dY3
3XHT8MzxzZUKsN5ZFbudpvTLNi16KloO67ZLhNnsqIpKKBqPVFksJsRlnn4QEHjm
TRFcP4OQ6fBJhWhXoVV2GlkcpSSkvTadvJhMYAuAA6NunE+ZXztFiSgTd8AzxcV4
Xs1ZtObpUrUjIQmUeHdxKfd3t8L8UyAlUE1FOD9j6Mnx09AwfIDojwA13y04PBel
zjbnqEFSQ1XbNJZnKlaa6crdh1hz6bFGOdQzLGZz1lSEw5LvIIJ6Eux76vwisQHE
ppnVBWMPMkffC1Zopc2UtIjjjN6stE0k/oe85n3Mss+mL2Cv0HA6CRiPx8oVDbin
ziOaoR6X5CabfOpMuf9t/0yQh2EJuJjGPSfpWj9U17FkkqItBZXrprSEOu1RsMgX
mmXkovtl6z2FfE3l8GxivZOd+GnKam0sC1C0EafKppi5iDZh09AKivjUtjEOgryN
iTRY0ZtYn4JIHyuQyPurEjjs9T+9tPcfCSAiRWRxzO99u4RUHiSesQDO/SpDLnZf
s3rFwHSkxjVXGsWnWAGDFSpzSVn9cJ4aP3LbaX/Itnt2G0uoWDL4QgmC0J+Tthd4
5EKiS3850SbmQrJmYLTxQO4u3li/fiBqh/fkEf+BVazsnydsCCU=
=Nmio
-----END PGP SIGNATURE-----

--pQ97n8+uIIgKWnrR--
