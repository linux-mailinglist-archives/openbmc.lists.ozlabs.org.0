Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E06AFA77FB
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 03:02:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NQWt6DdZzDqjc
	for <lists+openbmc@lfdr.de>; Wed,  4 Sep 2019 11:02:02 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com;
 envelope-from=raj.khem@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Oy29v25V"; 
 dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NQWF4X3rzDqWt
 for <openbmc@lists.ozlabs.org>; Wed,  4 Sep 2019 11:01:26 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d15so2566834pfo.10
 for <openbmc@lists.ozlabs.org>; Tue, 03 Sep 2019 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=yKWJZ+4T1YP63sphA1PKJOg/9P7OlpbmosLmR98z1A0=;
 b=Oy29v25VbGv9amZ6qO9J4VuAllWalrU/qT6XEeEiyU65HoWkJS8DodeS/y1u0le3OZ
 8pw7c9XGrMXx1JngBqpVeMnNMA1Py3oM/BzSQyuAWtK1b5i16eUPTAUE/MfTUObm1c5l
 7je0l0Ss+GM5A7JgEc1avrAuGL/5MXHP/VPAbOEzD+JwIgio14wOLMeJNGOccDPbD1D3
 xVmetF0299ijBou1YxCHi81fwBiJC/m9JYU0RU1mryGmczH/ZB7pZprnM/ph5zD1HBBD
 8m3BsjEuD0Dawp13UDMo1uWVcLEqz1hl+tRJTJnHVnCnySlrGkceFtae7VYj9xj6N0Ou
 6d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language;
 bh=yKWJZ+4T1YP63sphA1PKJOg/9P7OlpbmosLmR98z1A0=;
 b=HgKhxP5P8wlmuH9JAoqcUli4bMj2LKCEaOprT8bsdlRhMHOh+Uu4847i+YPAMBBpCS
 1d4DXkUXYroGHA5er43k3T+h9F8pr2WYNz8v4kXTiomZ5aXVErcHd1+1FCfEzFIV3Wze
 /pmYI+/IE0GWWaVReN+rnisfjDpBv7rLMmyIhmXGD3QN2rS75glv9g9JI0JpoekgDZJx
 atHCVrvdeG0cNrd4NCnHzjedLPf7TvSBdQxqgMim5Wo6CMEirmOoNV4uEwI24NnQGbIU
 LffAulTygg88WWECHND9mkCN+jUqoXk8kvhCJ6iGic9vF+FP6lj3+hQ47j9UUm2qA7/S
 3e+Q==
X-Gm-Message-State: APjAAAUftDdK00ZUWAHzK8hVJS6iapo3w9Fbwl5El37WikoV4pKBRWYX
 LUON7scE7fJVDN01KH2YNkg=
X-Google-Smtp-Source: APXvYqx4MHapjpKYlLrpwKmhpEaS+k57fW+QYGYpazlS10Uk/xCHvtIABxBS/RC+ktdHxS803MOjTA==
X-Received: by 2002:aa7:8a4e:: with SMTP id n14mr17147602pfa.170.1567558882611; 
 Tue, 03 Sep 2019 18:01:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:1c20::7c7a? ([2601:646:8500:1c20::7c7a])
 by smtp.gmail.com with ESMTPSA id d16sm23944892pfd.81.2019.09.03.18.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2019 18:01:22 -0700 (PDT)
Subject: Re: [yocto] Build break in the latest openbmc tree.
To: Brad Bishop <bradleyb@fuzziesquirrel.com>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, alistair.francis@wdc.com
References: <038f49d9-099e-dabd-2957-d31e7b8bbf41@linux.intel.com>
 <628d5b4c-63d4-78b6-83d8-1781cbc86e0f@linux.intel.com>
 <7694CCA3-89BD-44FE-90D1-99569476E980@fuzziesquirrel.com>
 <fbcfc988-687f-55ad-1ca9-ace092f09a99@gmail.com>
 <68bddbec8c08cbd9d31f561222bb3afde814a94b.camel@fuzziesquirrel.com>
 <9e7fa5a8-3ac4-a187-e878-2e6a24b1713d@linux.intel.com>
 <6C9B290B-77CA-4324-9480-891F0DC1EB7D@fuzziesquirrel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <8d75f35e-fb35-7b7e-7945-f212a9519bce@gmail.com>
Date: Tue, 3 Sep 2019 18:01:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <6C9B290B-77CA-4324-9480-891F0DC1EB7D@fuzziesquirrel.com>
Content-Type: multipart/mixed; boundary="------------4CDABB339191561D32D054E6"
Content-Language: en-US
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
Cc: yocto@yoctoproject.org, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 akuster808 <akuster808@gmail.com>, James Feist <james.feist@linux.intel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------4CDABB339191561D32D054E6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/3/19 5:36 PM, Brad Bishop wrote:
> at 5:16 PM, Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com> wrote:
>=20
>> On 8/27/2019 5:00 PM, Brad Bishop wrote:
>>> On Sun, 2019-08-25 at 10:49 -0700, akuster808 wrote:
>>>> the meta-security layer should be fix now.
>>>>
>>>> please update and let me know if not.
>>> Thanks Armin!
>>> Jae, I've pulled this into OpenBMC.=C2=A0 Can you give it a try?
>>
>> Thanks Armin, Brad!
>>
>> I tried it using the latest tree and checked that the build breakage h=
as
>> gone, but a new issue happened while it's building 'qemu-native'.
>>
>> | ERROR: Execution of
>> '/home/yoojae/workspace/openbmc/build/tmp/work/x86_64-linux/qemu-nativ=
e/4.1.0-r0/temp/run.do_configure.2396'
>> failed with exit code 1:
>> | ERROR: unknown option --disable-libssh
>>
>> So I made a patch to fix the new issue.
>>
>> --- a/poky/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/poky/meta/recipes-devtools/qemu/qemu.inc
>> @@ -137,7 +137,7 @@ PACKAGECONFIG[curses] =3D
>> "--enable-curses,--disable-curses,ncurses,"
>> =C2=A0PACKAGECONFIG[gtk+] =3D "--enable-gtk,--disable-gtk,gtk+3 gettex=
t-native"
>> =C2=A0PACKAGECONFIG[vte] =3D "--enable-vte,--disable-vte,vte gettext-n=
ative"
>> =C2=A0PACKAGECONFIG[libcap-ng] =3D "--enable-cap-ng,--disable-cap-ng,l=
ibcap-ng,"
>> -PACKAGECONFIG[ssh] =3D "--enable-libssh,--disable-libssh,libssh,"
>> +PACKAGECONFIG[ssh] =3D "--enable-libssh2,--disable-libssh2,libssh2,"
>> =C2=A0PACKAGECONFIG[gcrypt] =3D "--enable-gcrypt,--disable-gcrypt,libg=
crypt,"
>> =C2=A0PACKAGECONFIG[nettle] =3D "--enable-nettle,--disable-nettle,nett=
le"
>> =C2=A0PACKAGECONFIG[libusb] =3D "--enable-libusb,--disable-libusb,libu=
sb1"
>>
>> Brad,
>> Please apply this change into the qemu recipe.
>=20

this was intentionally introduced in [1] although commit message did not
mention about it so it could be unintended change, so I wonder if there
is something more going on, is this packageconfig edited by some other
bbappends from other layers in your setup


> Hi Jae
>=20
> Please send your patch to OE-Core.
>=20
> FWIW I am able to build qemu-native without issue with OpenBMC
> 93ee980ed9 although I am not using meta-security.
>=20
> thx - brad

[1]
https://git.openembedded.org/openembedded-core/commit/?id=3D50a7dec956180=
80962e56fd347f505e691b7ad6f

--------------4CDABB339191561D32D054E6
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------4CDABB339191561D32D054E6--
