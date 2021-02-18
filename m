Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0A31F073
	for <lists+openbmc@lfdr.de>; Thu, 18 Feb 2021 20:52:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DhQN63H3xz30Mw
	for <lists+openbmc@lfdr.de>; Fri, 19 Feb 2021 06:52:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=johnathanx.mantey@intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DhQMx11ltz30Kw
 for <openbmc@lists.ozlabs.org>; Fri, 19 Feb 2021 06:52:07 +1100 (AEDT)
IronPort-SDR: yeriIzGNz/bOycl8MGwwyK+SxQKYQBsf22JHvJ2y4SUyZTVG+L5WisfVUJ/yecp8ryfSMHD4ox
 ekE1BqimytrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="171304074"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="171304074"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 11:52:03 -0800
IronPort-SDR: FEW4WfL3NXyTZcw1/QkPplsSc8Nhb94HRJtM5fREW0T7CeaXlntLj8sPJhCoVydpj+wLcibeET
 Bs2FYDHHA5lg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="427407229"
Received: from jmanteyx-desk.jf.intel.com ([10.54.51.75])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 11:52:01 -0800
To: Michael Richardson <mcr@sandelman.ca>
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com> <17303.1613669867@localhost>
From: Johnathan Mantey <johnathanx.mantey@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
Message-ID: <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
Date: Thu, 18 Feb 2021 11:52:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <17303.1613669867@localhost>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1jGOxvIhi4X7Nw8bOQT9wY0dXN9Y1j8Lz"
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1jGOxvIhi4X7Nw8bOQT9wY0dXN9Y1j8Lz
Content-Type: multipart/mixed; boundary="a9RD0V5bhnROcGdKEPCXg1Kcr9R7E4Txy";
 protected-headers="v1"
From: Johnathan Mantey <johnathanx.mantey@intel.com>
To: Michael Richardson <mcr@sandelman.ca>
Cc: =?UTF-8?B?RGF2aWQgV2FuZyAo546L5oyv5a6HKQ==?= <DavidWang@quantatw.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Message-ID: <f01d2a0f-7889-0cbf-30c2-6ea411668ea2@intel.com>
Subject: Re: ANSI Escape sequence unexpected output
References: <HK0PR04MB2737A1AA6BFD979A359584D3C9859@HK0PR04MB2737.apcprd04.prod.outlook.com>
 <47e7db9c-f07d-0b27-5e38-328fb6ba3d53@intel.com> <17303.1613669867@localhost>
In-Reply-To: <17303.1613669867@localhost>

--a9RD0V5bhnROcGdKEPCXg1Kcr9R7E4Txy
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

On 2/18/21 9:37 AM, Michael Richardson wrote:
> Johnathan Mantey <johnathanx.mantey@intel.com> wrote:
>      > David, I see a garbage sequence like this all the time.
>
>      > I run an Expect script that controls my terminal emulator (kermi=
t), and
>      > I see a sequence like this: [[39;88R I have tried multiple times=
 to
>
> That's the result of a Device-Status Report.
> https://en.wikipedia.org/wiki/ANSI_escape_code#CSIsection, see "DSR" or=
 "CSI 6n"
> 39 88 is the size of your terminal, or the one that Kermit is emulating=
 for you.
> (I seem to recall think that kermit has a full-screen mode. So many dif=
ferent
> versions of it over the decades)
> You may be able to turn kermit responding off, or change it's terminal =
type
> to dumb.
>
> The shell is emitting ESC [ 6n to set the stty size of the terminal.
> "resize" does this, but I think gnureadline does too.
Thanks for the information.

This motivated me to mess with this again.
FWIW, The DSR command is present when I run Kermit from within a TMux fra=
me.
This code, [[40;162R, is present when I run without TMux, and just use=20
Konsole.
Both sequences are emitted AFTER the password has been input, and accepte=
d.

Password:
Last login: Thu Feb 18 19:45:28 UTC 2021 on ttyS4
^[[39;81Rroot@intel-obmc

Using "set terminal type dumb" did not impact the emission of the ESC=20
sequence.
I haven't found the "turn responding off" control yet.

> --
> ]               Never tell me the odds!                 | ipv6 mesh net=
works [
> ]   Michael Richardson, Sandelman Software Works        |    IoT archit=
ect   [
> ]     mcr@sandelman.ca  http://www.sandelman.ca/        |   ruby on rai=
ls    [
>
>

--=20
Johnathan Mantey
Senior Software Engineer
*azad te**chnology partners*
Contributing to Technology Innovation since 1992
Phone: (503) 712-6764
Email: johnathanx.mantey@intel.com <mailto:johnathanx.mantey@intel.com>



--a9RD0V5bhnROcGdKEPCXg1Kcr9R7E4Txy--

--1jGOxvIhi4X7Nw8bOQT9wY0dXN9Y1j8Lz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEEynmy4K0ckuoyjA+Ocg9x5uaKcAFAmAuxWAFAwAAAAAACgkQOcg9x5uaKcB+
7AgAlx22eLNXgAkGpkfVK3gWLPO329AMg79cPcVxBM3yadQs0WtbNllr8HDP93DyPlF7kjvF4Nbj
YxM5CSmEWgf9l2SnmGZiWTs+EhzOgU6fnPlvEDOcBR04eTOlAEBXWA9x9l24Fs84IslxkgHiyUTq
BBVHhVVlZG9564Y0l+luHJUCQGuGOtDzl3fg2bgma5n2hF590FX/9bigXTlixp3iR/dYoO1azRj/
gwDJGXrf/PnuvZmRQ4ssconiqaULY0wu75hhz/8ruwVcImA3cw8PrVCltApBrsEr5kd6wBCaqILM
3LO73befcCMSZWW8xO/hUB9JdFBOKg6u7kNavuqveQ==
=Vtpl
-----END PGP SIGNATURE-----

--1jGOxvIhi4X7Nw8bOQT9wY0dXN9Y1j8Lz--
