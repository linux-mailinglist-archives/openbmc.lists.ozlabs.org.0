Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A597A6C6A
	for <lists+openbmc@lfdr.de>; Tue, 19 Sep 2023 22:44:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BZX8jo7Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rqtv33lSsz3c5c
	for <lists+openbmc@lfdr.de>; Wed, 20 Sep 2023 06:44:31 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=j.neuschaefer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=BZX8jo7Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net (client-ip=212.227.15.18; helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 316 seconds by postgrey-1.37 at boromir; Wed, 20 Sep 2023 06:43:59 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqttR6w9Qz2xdp
	for <openbmc@lists.ozlabs.org>; Wed, 20 Sep 2023 06:43:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
 t=1695156236; x=1695761036; i=j.neuschaefer@gmx.net;
 bh=kybDOh6D3XxyjaCVBL1N0978TW3OGvof2IUbAcUyp3w=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=BZX8jo7QvDztNbFbOet4uX/lH8I4kDBBZythdzwrdhl8c/y2u+wRybarjthq/myk3fAGT1y/DcH
 Hj2SZeb2nP70VObnjvOnKcrmQesUA2chXP58uPOMziPT/nIUCnePQi8T2jQZgeeFG82/7jplN66Ma
 0TpDw98YzNWzXT8tUAlW28SsQ0MS7OBmAouKmj5uvcoFwFcb+HGYzTFHcbZwzQ97JFUadEvo112Im
 RtObSk+7MQWEYoz1yqbGvOfrIk0fW0GrvW/uOwI19F/8YgdNvOeTkxaemP6P8H+C2yHUicrPnzshC
 ocuvWjuUXBS4CXMkAAg7VfAvsPilGtyOfqdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.47.152]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MDhlV-1qsLzJ474p-00AqrU; Tue, 19
 Sep 2023 22:38:19 +0200
Date: Tue, 19 Sep 2023 22:38:17 +0200
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v4 1/2] soc: nuvoton: Add a menu for Nuvoton SoC drivers
Message-ID: <ZQoGuR6+7tJdjL6V@probook>
References: <20230814173757.1747439-1-j.neuschaefer@gmx.net>
 <CAMuHMdWTU8tN1QNrAT-BWgdrgzvJRvV6a30GcDAFq3qmF1CWag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i29JFbL/BmvFTG8c"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWTU8tN1QNrAT-BWgdrgzvJRvV6a30GcDAFq3qmF1CWag@mail.gmail.com>
X-Provags-ID: V03:K1:mHpdvxoTSe4sfNwZN7x8qDj8Q1Rpc+ZxRf+bNcMA/1nJUXQRQhH
 DLuC2Uk/VbJ5FRljHJHhwTdYxmkTIxZeL7WPCEe9ccPPTclbRwizYIXuZWqxmil14huW4XT
 6lYEmdLv4XQpIk6A4vlqrALpTh2LzBSl9Ko5+b/n1GQNMN/c2aLnLVwedD0zp+YanWkE/4y
 vtSL+BEgxbI28puDHRZ9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PBJFr88qEqk=;G9DAXW7p6u94VN0c5qHjk2dnGBU
 huMhUYIdDj0CoPARyATH12bumMFgVGJjKK5JFqzGPZ6PlFVi/N4oqZw17IGAIVewS0roFamkm
 ZCnEjOrexpwW3SYpW7vlIp/uP0EXoatS1slYWauF9lez+s4XIC11qn/nBgHzKMpkhFclbXb0M
 9KonmgmnjawdA/RLCoRctCvVVBg+rQo2q1czQ/xERwGKYQJI55yzVlBn0KRjqsVk+EAACkdIz
 PJt9fNdYFl8BzusENmPTtnxea7iotH1EgAl4n79KmFkujBunZ69U8IPDUz3yowOn2nbSVXCSk
 fBmxQrIe2B4+fZpxEG24CJ7ygTLi5NnYGsEKJRtmI+9q/PXvBAXvdPCAnzRoRKCcU1ge3JmqP
 2NDGZC2D8FR7LMB5XW4Jkt0zhS8QULBL2yrgJi6IZtZzzTNpmZpzxIWFg+5fTsbrnzH2IPYnJ
 UFu1F41/hw6G367jABeZXcmn7V1Yu2q5U4sJy3XVxArSox0VZv7jmWt7Z4mKgVvxCgNZAQM9X
 XlgeoDXLJ9jZFi78dkOxcZitWUs0mUv3a7frxagqXJdhiFUdm6Ik5shJGVYgc7i5dPYmv5nWq
 3EKD87G4iyWD2GcCFs5CvQiXR60XyYRPXz+MIODJzvlmofHdmnPp/sJYpvRK7Fz7/GCdKjT6y
 m520uOltl+Q2q7uQshYVQHAWwmGreW8lF8xfI503aAryMit8LtmUVE3QFB1+5y7EEcEfBQX+s
 0NUbuVlte5yyUL+ewZEk0hFTkAQJ0CJ/GiRhW1xm5flK75AGgT0arpX4aTEV4kIHqwPER2rIy
 Q1s472OsdWxM/ccJucziYXx+eNKN5oLW5uf/l85o2sTWsd33Snm0rWIeOl+ytzxnY1IdbmMWt
 hsLh79fFa+Of8Jetf3C9qI5QPsVvgBqWY5wvY7p1quP1r5nnUEHYi6VuTkfsz4Jnnth13j7sD
 jGJF3w3N3GyTtaRKRswfS1cIU3Y=
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--i29JFbL/BmvFTG8c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 19, 2023 at 01:37:01PM +0200, Geert Uytterhoeven wrote:
> Hi Jonathan,
>=20
> On Mon, Aug 14, 2023 at 7:38=E2=80=AFPM Jonathan Neusch=C3=A4fer
> <j.neuschaefer@gmx.net> wrote:
> > Add a menu "Nuvoton SoC drivers" to make it easier to add other Nuvoton
> > SoC drivers later on and to prevent asking about the Nuvoton WPCM450 SoC
> > driver when configuring a kernel without support for Nuvoton SoCs.
> >
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdWo5vHCeE6BeSHrUy12uT7_wFhW-=
VbQmQ5u+4Q8c7-wYQ@mail.gmail.com/
> > Fixes: 7dbb4a38bff3 ("soc: nuvoton: Add SoC info driver for WPCM450")
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v4:
> > - Add Geert's tag
> > - Fix commit reference
> > - Change Link tag to Closes
>=20
> Any plans to move this patch and patch 2/2 forward?
> Thanks!

I've been distracted by other projects, but I still want to move this
patchset forward. I will hopefully get around to it by the end of this week.


Thanks for the reminder,
Jonathan

--i29JFbL/BmvFTG8c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmUKBpgACgkQCDBEmo7z
X9sGzQ//ZkXxXybWZnRwlpKSd3MQwxRRN26sQI7V8DFusqq8yA6dzJMzv0dYbNNT
BR0Z0CI6927jNBgAVBOrgE8laRCd2dk8gBgRfi7lEbEoG/+srPguxmZw5QoQgooL
xc/j+/xfPsCCJ/+HVkLImqVcx+MBB/L85FOGJ5WjQsjTHqjWuKiGM22oagIsk5Jm
tL0rafhiNLQH0UP8R8qBCdloSZW7KBKrQDZt1dxRkuq7F6To9yZ2pjm6bnwjVR9I
PuSu9EIgk+IcQ1pxk3mhrPzeixskooYFRY6GxNqHtIWfmBQI+aKA3QtA17p0r6Fn
MV2iwJlHa6dT3kqtdC12I/NLJJ4J37tF6iAHkLNAVO0pgGJH6ZprS0nDjNHL49o/
6VZvtirz1EWDlFx3EMVFXLinuhMP7WBVflVb5UIXeAxASHaDpvNzysyKXDzyIx3g
Al/mLyrrmscH5kVJn1/iI3lqckHoqbLYWL9pHDS3anmmq/FzxiUKFZ1gq+NO76+3
QNaMet0woYr62Z2So45bwxgDqsIMe13OiPEhNIcnARTJKLboemKQz3/mbK6YLdro
G9HH8eYM2OVXsRtmC85vIc3SVIHk9nUuzWzRFQnKTFzx4RmbPQyEoXz/wuDnpUuT
loA7prm/wNLHQp/bcjcT4rll0xQWkQKqDVSYyT3Q8zAEzfPnIxM=
=4UcE
-----END PGP SIGNATURE-----

--i29JFbL/BmvFTG8c--
