Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F987471ED8
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 00:39:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC1Lt0GTqz3cN9
	for <lists+openbmc@lfdr.de>; Mon, 13 Dec 2021 10:39:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=ZP+XULGv;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.net
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=ZP+XULGv; 
 dkim-atps=neutral
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JC1LP56trz2xDY
 for <openbmc@lists.ozlabs.org>; Mon, 13 Dec 2021 10:38:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639352319;
 bh=3mMkIzuePUJJcDGvvt1bcnCBjfHfXYzeCjAoAmGStgY=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:References:In-Reply-To;
 b=ZP+XULGv7neuk32zfUabDp08CoZbLEXOdLfoFLMVLMNjMcxQA8d19vblzucX9nJPn
 D0SqzVK7H0E54MwvJkdI/HNJ0zDjdvVPE1LV/cNGIXqVrOUItYRnf8s79A6Hz3YNGb
 7wJj1K9mK2paOxfV6+jxMgw9DrrrQGsqZXWHGC7U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1mf9xu0VU1-00rDCW; Mon, 13
 Dec 2021 00:38:39 +0100
Date: Mon, 13 Dec 2021 00:38:38 +0100
From: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 4/8] dt-bindings: pinctrl: Add Nuvoton WPCM450
Message-ID: <YbaH/ny1nI5l7hh0@latitude>
References: <20211207210823.1975632-1-j.neuschaefer@gmx.net>
 <20211207210823.1975632-5-j.neuschaefer@gmx.net>
 <YbNvqTUwi1jzff4D@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dobARXniaDUcaAko"
Content-Disposition: inline
In-Reply-To: <YbNvqTUwi1jzff4D@robh.at.kernel.org>
X-Provags-ID: V03:K1:z+ESN2bwK8jz2Nyyr7dtTNg/XT/Ev9qeLtEvNLs5LUKKpvzCZ86
 SfZXs5qodvV8E/01/s8k1uUpWaSDGGVCt2AOje8PZ4SENbh0kI2+GgXjLPhbOtQB44Eab2R
 ovymWZtXKVeDnprY3QiQ+hXjg3zmrIbGgIQxrHvQhfGG3bipQYEAYJP+Ojrxs9jXLUcDUoh
 p72gnnLF5fsbzJM/dVzuQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ENfgMEktfxI=:yemYLyXas7ihLqEjvU6TRf
 dMgrj5TJ+GABYNdCcf+W0AvaAUvifRq2fzdIFYygZ2NpbxzeSjpJ9HZ/iqmkydIAX7rLXJi8s
 c04VHduIDT845ZgatwY175eEsPwmwy/3OeYSnCTn7Jxx7bcdtcqp5XncxqYV3P3j0MjsIWIPX
 rsIZukky35NjiffPyZn4iHlG1Sm1xgc/CumeBxgZSNKojdboGfmA+hyzwa2EYYBH0sTSAqmMS
 3Z3Px1+ox6ajNmTu5f9lU2Zyk56x6qLF5DT85SV54a6pdb7Q0HOiYVJ3ZW//gYNMMYzXcZY5r
 qSoKy8XhwvRH6VSZLInXqkzCS7E6y1DcIks9TzL4L2ZNH81dyStifLba+UYPIzpuRDIPx5obF
 taAAeWvSSnyYRSvsbI6MPzCeYeTelRhY8DTtd8w7kEvujypQxRuM7QBzHy2X84Ne5KK6cRt39
 kua8zkajxO1pK2kIVRbsHqMZ9c0O8Aos4JEZrOR8aIuOlcFygujgR3wCjaEDU5yQo9S0jd9gx
 SyYTAYkDcWCvzsmqzRucrW3ZK5u0LjaaAHYDEdRQyDB/Ve/wN6CSH0zOVQ0IE0g/ISGtz7cOb
 JOQnhcrM/+s+kILki4iM9HwIoY3K23GgxEf0pdmaP5CZEuzfKjDWQ/Ec5smksmEl3QbCljqix
 qhtiBzh2/HPU1xnw5KlW7HeTlxwngBqdwbkwvw/idOBrlOkGAPyAGHnnlZSXVhlQe91zW6e7v
 3HPnFatmueMBLVE9FwhrrEG1/n9TnmVd01RZh5i43fo/JNnVJlIaTImVJ2JJmip7HuGTU9ipN
 WA3qU6hLY6+tijAdPjcVN8OWMfOHgWHE8c/8RC+snUxl9PMXE5QxkDGn5ro5pY3jvlkmGQ0zG
 hiHsi299gmfuC0YuFNzPjfVLXyrJcj22vVZEB3ayrrc0ENeb3J9q0EVxlwH4MG/CjtIfmS4si
 B3OTDYCIOMAbNwmgtyru+eio50EKk7NBmlYq3XKwevURy1VcNSIM8a/2xxWtIeebMdp1DKuyC
 SatkEkeX2ShcBasAxH0CCUOlgcn6G1BE32eRq0KgxDsv8uL4GLJPPpD8KyhIhmZa/b8k4I6fQ
 adY54NY8ctdPl4=
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
Cc: devicetree@vger.kernel.org, Tomer Maimon <tmaimon77@gmail.com>,
 openbmc@lists.ozlabs.org,
 Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>


--dobARXniaDUcaAko
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Dec 10, 2021 at 09:18:01AM -0600, Rob Herring wrote:
> On Tue, Dec 07, 2021 at 10:08:19PM +0100, Jonathan Neusch=C3=A4fer wrote:
> > This binding is heavily based on the one for NPCM7xx, because the
> > hardware is similar. There are some notable differences, however:
> >=20
> > - The addresses of GPIO banks are not physical addresses but simple
> >   indices (0 to 7), because the GPIO registers are not laid out in
> >   convenient blocks.
> > - Pinmux settings can explicitly specify that the GPIO mode is used.
> >=20
> > Certain pins support blink patterns in hardware. This is currently not
> > modelled in the DT binding.
> >=20
> > Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> >=20
> >=20
> > ---
[...]
> > +patternProperties:
> > +  # There are three kinds of subnodes:
> > +  # 1. a GPIO controller node for each GPIO bank
> > +  # 2. a pinmux node configures pin muxing for a group of pins (e.g. r=
mii2)
> > +  # 3. a pinconf node configures properties of a single pin
> > +
> > +  "^gpio@.*$":
> > +    if:
>=20
> Not necessary because you can't have a property with '@' in it.

Ok, I'll change it to "^gpio".


> > +        interrupts:
> > +          maxItems: 4
>=20
> Need to define what each interrupt is.

I think in this case one description for all interrupts would be more
useful, e.g.:

  interrupts:
    maxItems: 4
    description: The interrupts associated with this GPIO bank.


> > +        nuvoton,interrupt-map:
>=20
> Reusing 'interrupt-map' with a different definition bothers me...=20

I'm open to tweaking the name, perhaps to something like
nuvoton,gpio-interrupt-map. (Or dropping it entirely =E2=80=94 see below.)


> > +  "^mux_.*$":
>=20
> Use '-' rather than '_' and the '.*' is not necessary.
>=20
> "^mux-"

Ok

>=20
> > +    if:
>=20
> Don't need this.

Ok, I'll remove the if/type/then lines throughout the file.


> > +        pins:
> > +          description:
> > +            A list of pins to configure in certain ways, such as enabl=
ing
> > +            debouncing
> > +          items:
> > +            enum: [ gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6, g=
pio7,
> > +                    gpio8, gpio9, gpio10, gpio11, gpio12, gpio13, gpio=
14,
> > +                    gpio15, gpio16, gpio17, gpio18, gpio19, gpio20, gp=
io21,
> > +                    gpio22, gpio23, gpio24, gpio25, gpio26, gpio27, gp=
io28,
> > +                    gpio29, gpio30, gpio31, gpio32, gpio33, gpio34, gp=
io35,
> > +                    gpio36, gpio37, gpio38, gpio39, gpio40, gpio41, gp=
io42,
> > +                    gpio43, gpio44, gpio45, gpio46, gpio47, gpio48, gp=
io49,
> > +                    gpio50, gpio51, gpio52, gpio53, gpio54, gpio55, gp=
io56,
> > +                    gpio57, gpio58, gpio59, gpio60, gpio61, gpio62, gp=
io63,
> > +                    gpio64, gpio65, gpio66, gpio67, gpio68, gpio69, gp=
io70,
> > +                    gpio71, gpio72, gpio73, gpio74, gpio75, gpio76, gp=
io77,
> > +                    gpio78, gpio79, gpio80, gpio81, gpio82, gpio83, gp=
io84,
> > +                    gpio85, gpio86, gpio87, gpio88, gpio89, gpio90, gp=
io91,
> > +                    gpio92, gpio93, gpio94, gpio95, gpio96, gpio97, gp=
io98,
> > +                    gpio99, gpio100, gpio101, gpio102, gpio103, gpio10=
4,
> > +                    gpio105, gpio106, gpio107, gpio108, gpio109, gpio1=
10,
> > +                    gpio111, gpio112, gpio113, gpio114, gpio115, gpio1=
16,
> > +                    gpio117, gpio118, gpio119, gpio120, gpio121, gpio1=
22,
> > +                    gpio123, gpio124, gpio125, gpio126, gpio127 ]
>=20
> pattern: '^gpio1?[0-9]{1,2}$'

Indeed, that looks better.

> Feel free to tweak it more to limit to 127 if you want.

Ok.


> > +      gpio0: gpio@0 {
> > +        reg =3D <0>;
> > +        gpio-controller;
> > +        #gpio-cells =3D <2>;
> > +        interrupts =3D <2 IRQ_TYPE_LEVEL_HIGH
> > +                      3 IRQ_TYPE_LEVEL_HIGH
> > +                      4 IRQ_TYPE_LEVEL_HIGH>;
> > +        nuvoton,interrupt-map =3D <0 16 0>;
>=20
> Based on the example, you don't need this as it is 1:1.

Ah, it's a bad example. The real chip also has this node:


	gpio1: gpio@1 {
		reg =3D <1>;
		gpio-controller;
		#gpio-cells =3D <2>;
		interrupts =3D <5 IRQ_TYPE_LEVEL_HIGH>;
		interrupt-controller;
		nuvoton,interrupt-map =3D <16 2 8>;
	};

=2E.. meaning that bits 16 and 17 in the GPIO controller's interrupt
status register correspond to pins 8 and 9 of GPIO bank 1.

I'm not completely sure this is a good property to have in the
devicetree, I could also hide it in the driver (just like the register
offsets are not part of this binding).



Thanks,
Jonathan

--dobARXniaDUcaAko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEvHAHGBBjQPVy+qvDCDBEmo7zX9sFAmG2h9YACgkQCDBEmo7z
X9smnw/9EREnQfOVwcf3sZmXZKAGJ3NOAE3UMGzyikvU9A0cJLjb5TcMUXW6QosO
2pz4Mf/H8zsGrmFFC/DwC8yO7sMGHckNHFof+/uqgUPJF4pO8cAlUSUqO5QWh/Kz
vE8/gVz5mNOna7mKfpMXUs2vznNvAKNWQlhizEsal8zY3Dcir4+09Za5u08oTDbR
52IAbxsuMC68ULft3NJMeib/Zm839MC38GBs93rNyojNu1yBt7DVkNrxyxo8kt6y
pYNkhTrGKx5p8Yetoax7tKchIvs0k03L7BiabHkimQ7QTZ4XPkjG7vRJ+6PcDVOc
wc25k1ERWWdi1ORwBGLlvC8But6bvhM14NRezRGEwRY2WbY5h6aiHSXFfWtk80VA
9ZXaKiuIbCiRGyksdrq2nUu1E258bifUowCYgB/sp68IOdOLYh4zDpFegztDvUtH
LgfFMXGBMb8Gu1VUOc02wKgmA6tjnzNSr1eiR1uCigUyyoJLqOaHjmCJo2ZHnQNQ
jFih2QcjTh7uN9gyveARd1rLSadidfjIO7SEqTnGNMQTBOYeiq8YIIJ+kOx+FeCe
PikOCQyhN0Q/fptQuuCeMe4991//+UBd9sCxzGpDdEnLz4V0GcQcoPATPBnG7bUE
u2YsJaQeNjSURsnVN/S7qZ2cSxkqIRglFV3W4q6aGtMROEnzRLY=
=iNfO
-----END PGP SIGNATURE-----

--dobARXniaDUcaAko--
