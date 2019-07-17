Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F526B83A
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 10:31:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pVpv5cL4zDqNZ
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 18:31:19 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="LkeZGbEV"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pVp92fjszDqN7
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 18:30:40 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 55FD041208;
 Wed, 17 Jul 2019 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1563352234; x=
 1565166635; bh=PGS36SaFjwhOUY38cSk69m9lalFyPXIbmSpK12LA2/k=; b=L
 keZGbEVaqhxtb6QtNz4Bw3VlIGPXpVStg3i3dd2qgI/CKW8HaWwqnrmn8HQQCobw
 IOwLBZ4nAHV4Q8A9NmTiQ8vqwqm+43rmwG28WSUkrHCQO4ef2l3EwSl05K54EMmf
 f0Kp5AkyvvP7ZmbJwfFgLqZk9Y7Er3KsWEM/Yudy1k=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inFSgHNhurP1; Wed, 17 Jul 2019 11:30:34 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CB052404CD;
 Wed, 17 Jul 2019 11:30:34 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 17
 Jul 2019 11:30:34 +0300
Subject: Re: Obtaining fan/temperature sensor status for Redfish
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>, <openbmc@lists.ozlabs.org>
References: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <2678493d-5dd3-d083-eaaf-64c42e485542@yadro.com>
Date: Wed, 17 Jul 2019 11:30:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="q1P0CjHLPg4Hj6FYSsueN5q5Z4CrSdnav"
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

--q1P0CjHLPg4Hj6FYSsueN5q5Z4CrSdnav
Content-Type: multipart/mixed; boundary="uegIvaongyX7sBvYOODvp1RVACwI21Q7o";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Shawn McCarney <shawnmm@linux.vnet.ibm.com>, openbmc@lists.ozlabs.org
Message-ID: <2678493d-5dd3-d083-eaaf-64c42e485542@yadro.com>
Subject: Re: Obtaining fan/temperature sensor status for Redfish
References: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>
In-Reply-To: <bcdd6246-e116-a5a5-24b2-cd36181a00c5@linux.vnet.ibm.com>

--uegIvaongyX7sBvYOODvp1RVACwI21Q7o
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

26.04.2019 1:08, Shawn McCarney wrote:
> Hi,
>
> The Redfish Thermal URI (/redfish/v1/Chassis/{ChassisId}/Thermal) retur=
ns all the fan and temperature sensors within a chassis.
>
> Each returned fan/temperature sensor contains a Status object with the =
following properties:
> * Health: Health state of the resource (OK, Warning, Critical)
> * State: State of the resource (Absent, Disabled, Enabled, etc.)
>
> Currently bmcweb always returns a Health value of "OK" and a State valu=
e of"Enabled".
>
> I would like to enhance bmcweb to return more accurate values in the St=
atus object when possible.=C2=A0 Below I have summarized a proposed desig=
n.=C2=A0 Does this sound acceptable?
>
> =3D=3D Proposed Design =3D=3D
>
> * Initially assume Redfish Status->Health value of "OK" and Status->Sta=
te value of "Enabled" as it does today.
> * Use ObjectMapper associations to find the DBus inventory object path =
that is related to the DBus sensor (if available).
> * Get Functional property of xyz.openbmc_project.State.Decorator.Operat=
ionalStatus interface for inventory object path (if available).
> * Set Redfish Status->Health to "Critical" if DBus Functional property =
is false.

My understanding was that 'Functional' property is for deactivation/activ=
ation of components in context of both health checking and hotplugging.

That is, I had an impression that it's the property that can be set by ei=
ther the operator or the system software, so it's not necessarily a healt=
h status.

Correct me if I'm wrong, but to me it's more like it should map to State =
Enabled/Disabled without any reason implications. I think that health sta=
tus must come from another source than the dbus 'Functional' property.

The rest sounds fine to me.

With best regards,
Alexander Amelkin,
Leading BMC Software Engineer, YADRO
https://yadro.com



--uegIvaongyX7sBvYOODvp1RVACwI21Q7o--

--q1P0CjHLPg4Hj6FYSsueN5q5Z4CrSdnav
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdLtyqAAoJEOiTWHtbdBeNz0cQANwaZffQhj6itE6kIN6aMcEb
lBiwO8+BqgkzNvuLPwagDHiOT/i+IeV7TyFbuf/aomP8Pmm+MEEz6uj1Sqf70drw
Hd+z0OKMhgupuPDCTeAqqn9PFpYLowJlfxo9+z45MPQvD091uEcm8KnTPWTwFJiv
vsxbFR3/kNTGfRcaij7dV2po+UoUFpPPpeVLSXw+S6iuSOdp8TC9XQHKM/GkE3G3
rJKm5vSoKrFEnTulK2pIJqc8PBFcKncIJyBBotVM+8LEwc6R5qVdB74BGnSNe+qV
N88sZbOmdKOOsFLZafaPNf8+ttOomeQJRVV5eQ8iwchBZdiHfUIBtK4jibh7hZxp
tl4YJpMHPgca6wW0TPEPUlxyTqStbW27J78czL1z9JM3+OX+xsMSbpp98qkPCSgw
m9rExIFo3PVh2p6p+qVFGIsPUt8xVT7vFRRTdby9rmHZ3ATcWtdXBIH/EuKaGXSh
h6OXBoPV1TnTrYNvURxJmt0ZG2iB6iolNRkDxtmDHAoQ2hwWjHota3SokpUy/ONj
aZApSHoinZ7KNJ8i+uvDxfOi0dqCn43LO7MMu4C+BfrS5ITh1V4KEc8cTmMD2NWG
mgNwXPhJ1QMX+Dp/se8ZoX5LzEIGJVgMco4zcWzA7eKfsv/fAd36HZ9645ed834X
JhV5BiNueqNNbfg0Vkn1
=Q8wR
-----END PGP SIGNATURE-----

--q1P0CjHLPg4Hj6FYSsueN5q5Z4CrSdnav--
