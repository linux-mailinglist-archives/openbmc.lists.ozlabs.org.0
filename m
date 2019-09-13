Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ABCB1934
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 09:52:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V7C02BT2zF5Gk
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 17:52:12 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="oddzmY93"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V7BM5L5kzF5CV
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 17:51:39 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 3562842492
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 07:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1568361065; x=
 1570175466; bh=A3TQzgQq5+nIyY0a+SyO8uMdHgR3HEUG0dCHZEr/M90=; b=o
 ddzmY93kU4RcS5G0DNx/zvEuP/BEqVFvmPSztZXGvL75iQjvvsfKdqpz9bqoN3On
 UmCkKDi5ZRyMK8uCFI5Y35+RJlnkTyci7m5XKa64ss4J9aUzXyifsd/jOkfbDzZP
 RzEqeef9PKv0ieXDXKL+X1pVT/DA55XgJrguM0koig=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7e71QV1WNOZj for <openbmc@lists.ozlabs.org>;
 Fri, 13 Sep 2019 10:51:05 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E1C7442008
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 10:51:05 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 13
 Sep 2019 10:50:31 +0300
Subject: Re: RMCP support
To: <openbmc@lists.ozlabs.org>
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
Date: Fri, 13 Sep 2019 10:50:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190911173139.GE45301@mauery.jf.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A7YqF1PSnxJVI4UlFIL9LAdnCatIjCBqR"
X-Originating-IP: [172.17.14.197]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--A7YqF1PSnxJVI4UlFIL9LAdnCatIjCBqR
Content-Type: multipart/mixed; boundary="65ADZYRJfFkeco5rmXqbLe6OodLM2iAZa";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
Subject: Re: RMCP support
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
In-Reply-To: <20190911173139.GE45301@mauery.jf.intel.com>

--65ADZYRJfFkeco5rmXqbLe6OodLM2iAZa
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

11.09.2019 20:31, Vernon Mauery wrote:
> On 11-Sep-2019 05:27 AM, Neeraj Ladkani wrote:
>> Is there any plan to add RMCP support in IPMI LAN stack ?
> There are no plans for adding RMCP support. RMCP is horribly insecure; =

> even more insecure than the least secure RMCP+ cipher suites (not=20
> counting cipher suite 0, which should not even be a thing.)
>
> Not implementing RMCP was an intentional choice. RMCP+ is insecure,=20
> especially with passwords shorter than 8 (as shown by Rick Altherr's=20
> OSFC 2019 presentation). It is recommended that RMCP+ is only used with=
=20
> cipher suite 17 and maximum length passwords (20 characters). Ideally, =

> it would not be used at all, preferring Redfish, which uses modern=20
> crypto.
>
> Every open source IPMI utility out there supports RMCP+. That should be=
=20
> used instead of RMCP.

What about RMCP pings used for device discovery as described in section 1=
3.13 of
IPMI specification?

AFAIK, it's not supported in OpenBMC and so `ipmiutil discover` fails to
discover OpenBMC devices.

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com



--65ADZYRJfFkeco5rmXqbLe6OodLM2iAZa--

--A7YqF1PSnxJVI4UlFIL9LAdnCatIjCBqR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJde0pHAAoJEOiTWHtbdBeNij8QAMoQQIQ6DZO6j+mLL8RG5oEw
a8naJxKyZIn6cCyfoYdF7tTr5N0ZCWiM5BhpIqWg2/VCwM2X005NNCo29v/FXwxi
c78G4nu5Be4blgUZbC1oyP9EswAxXXGPAQGo70Mv7Gmn80r2qjkEJys5QKireQKH
KUWapCqbHht6mlaLIivatvKoX2Oq4KluRiCHJam86dJNuFv5zeyqMNmj/kvuhXYn
VY+UJeA9sJnDTjr7q07rGXuBMmNRyWVePUQo5xARB9/81kVLVf1Hl5S1nCZxQ9E4
oLpX4xHhrPuHRi4AWsmpNEnLMUdw7KMTZ1QHNfhGQWUodK6sLUvwegYeFQOzJAQ7
IEiCcVY0ZOiZaNN3h5MN6FKDTwF+qh1YQ770klqvf58s61uhVGAop22t62osJbTZ
/bVXxiKFHLgoThtgR9m6ZqAWejanPXdLaiMqtmT+I3dvXSIuBXVCB29q4V2CKNU+
PHQZk2PH82fNNRpsQKPlJVJWhFiFyOkQSJLJWl9DoEmVbwmOzzxVWsCg/MEL135o
4fAAJ4ivKFEFa3TF3v9Em/b+7NgDWTVkJYYWfqLMOetfAMdJiFoSQpgSyKcdkTKy
5jNmsfwG6EklHN/xdhKtt1QU3jtOBV2uQpBySDpmolsfcem8hL0EHoeiUmAU3kiZ
FsHoW8FNB1AkDA4RWkGn
=4zFu
-----END PGP SIGNATURE-----

--A7YqF1PSnxJVI4UlFIL9LAdnCatIjCBqR--
