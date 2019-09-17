Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE07B4A2A
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 11:17:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xctv2QBzzF4G1
	for <lists+openbmc@lfdr.de>; Tue, 17 Sep 2019 19:16:55 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="KQJNPaUD"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Xct96ccSzF422
 for <openbmc@lists.ozlabs.org>; Tue, 17 Sep 2019 19:16:17 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 063B9411F9;
 Tue, 17 Sep 2019 09:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1568711771; x=
 1570526172; bh=ScRjRDz+HJ2vinOMr+1FdXoHrTlAJs86cP7gDfK4znA=; b=K
 QJNPaUDxwTendINg0kkR1AQao/NuJt5dYN95w/gPkmOUYsKnTDeZEwAGe8rpXNST
 blx1aPwjI1UpKsfKVuXaFOnd0HWpK0XEErGvI5pWW3Dg1hsFbNDiKwpIKoKdXjUs
 0fVvrnTm41hDiCcEWRJdvuu4P2koR5e9B8aQ2iT96o=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilv2ToZVSCHz; Tue, 17 Sep 2019 12:16:11 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9BF6E41908;
 Tue, 17 Sep 2019 12:16:11 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 17
 Sep 2019 12:16:11 +0300
Subject: Re: RMCP support
To: Vernon Mauery <vernon.mauery@linux.intel.com>
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
 <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
 <20190913184108.GG45301@mauery.jf.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <2ed2b99b-23c1-88bb-7895-9e58706e6f7e@yadro.com>
Date: Tue, 17 Sep 2019 12:16:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190913184108.GG45301@mauery.jf.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pFaKoMbNyJA0DtSUDnx2MpBhczMG7LM80"
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--pFaKoMbNyJA0DtSUDnx2MpBhczMG7LM80
Content-Type: multipart/mixed; boundary="OPzmCq3ZenVlk7Dhx5rO0fQbm5ESA57aB";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Vernon Mauery <vernon.mauery@linux.intel.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <2ed2b99b-23c1-88bb-7895-9e58706e6f7e@yadro.com>
Subject: Re: RMCP support
References: <BYAPR21MB119102ED346FC31306D07911C8B10@BYAPR21MB1191.namprd21.prod.outlook.com>
 <20190911173139.GE45301@mauery.jf.intel.com>
 <3a091956-820f-5576-c620-8169e45ffb22@yadro.com>
 <20190913184108.GG45301@mauery.jf.intel.com>
In-Reply-To: <20190913184108.GG45301@mauery.jf.intel.com>

--OPzmCq3ZenVlk7Dhx5rO0fQbm5ESA57aB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

13.09.2019 21:41, Vernon Mauery wrote:
>> What about RMCP pings used for device discovery as described in sectio=
n 13.13 of
>> IPMI specification?
> I don't have any problem in particular with RMCP Ping, but it is not=20
> implemented. It is not required by RMCP+ as far as I can tell. The spec=
=20
> calls out that is *is* required for RMCP, and can be implemented for=20
> RMCP+.
>
>> AFAIK, it's not supported in OpenBMC and so `ipmiutil discover` fails =
to
>> discover OpenBMC devices.
> From what I can tell, the spec suggests that you send a Get Channel=20
> Authentication Capabilities request to discover RMCP+ devices.

True, but you can't send a broadcast GetChAuthCap and just gather all the=

answers like you can do with RMCP ping.

`idiscover` is much easier and faster to use than `idiscover -g -b 172.16=
=2E1.1 -e
172.16.1.254`. The latter takes like 15 minutes to complete versus like 2=

seconds for plain `idiscover`.

Do you think implementing RMCP ping support in OpenBMC is feasible?

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com



--OPzmCq3ZenVlk7Dhx5rO0fQbm5ESA57aB--

--pFaKoMbNyJA0DtSUDnx2MpBhczMG7LM80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdgKRaAAoJEOiTWHtbdBeN50kP/iAickiKSWlmg0jVzNvhRoHe
gpgcVhnQMN7XP6d3Kc5fUOCdsE+3/FMc5dfzVXugqBo5mfhjGt6Z3Pna7waA59Yk
FO33TEJG6kcDHtORceRlyTozrbgyoszTzrIKRaGvFKIFwfNR0eDjGDC+6PuWosDJ
WnkRIgiQjGasTiPUQBTkNzPA1j4EBja0G1g5wWoOA0dJouUpK402Kiadt20AqBL/
4jLhiH8KZjmsHZdmYbXob0iEgFzo66jejWAZyyIyxpFyvj5fdJLvBZWaSCOPX2ex
pPOf8pxIeTPU5dZOlpeO/xTMBOStAiPDt07MFn0vP7t2ygDrUCEeismMxCVp522M
OXHsGnfmWtwpP7ziUbJJuCXhY0Aj08A0qrVebnUMMHWit60RB0b8NI0FvYqGP95Q
BIiRtNAd/5W+KETfrQif7qI/oHJayMMB8Nt55y7EM+Lip4wU1pmtMdnwArYgnJ/p
TLpPtO+Rv805OksURs3/RF39U/F7U0EgHTgkuEM1kNiAvEVzjsUM/oqUm+4BB2a6
YklW6+Yud/IUYT2uWJQaEtJZyOx5H9m1NqrNOtl2bVLwS+lHUHJbG9o9+5nSMhGy
iI3QBIegh0kIRoX77jfcCHIF+kSnYy1JqHao09j2xSF6dERMRP5rMRwVo0+oCKl6
S3vUHsJBZgz8TGGP2fe+
=/rtf
-----END PGP SIGNATURE-----

--pFaKoMbNyJA0DtSUDnx2MpBhczMG7LM80--
