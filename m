Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A6B1914
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 09:43:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V70q4lrczF5Fw
	for <lists+openbmc@lfdr.de>; Fri, 13 Sep 2019 17:43:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="NO7RUdvc"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V7036ylZzF5Bb
 for <openbmc@lists.ozlabs.org>; Fri, 13 Sep 2019 17:42:43 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DF5D242001;
 Fri, 13 Sep 2019 07:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1568360558; x=
 1570174959; bh=XB88H8zMokjID2oIcTLRxlQqi1OzbOFJpQ7HEUvC52Q=; b=N
 O7RUdvcmQgTrxCzmg70hpPzewA41qs+yD0DTXkaCWivbR49I4WPnT0I3ea/FORzE
 At2SayNmvUWSyXUQA236jcGAgoGY1HcVxoshtKzz4igrn4M3BHyYR4meHwUeupGA
 6js1c314GI2GrmsCTzZwHkJLQ8/aAgoB1HFNHYKgJ4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJojcrgJB96Q; Fri, 13 Sep 2019 10:42:38 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id DC6024193F;
 Fri, 13 Sep 2019 10:42:37 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 13
 Sep 2019 10:42:05 +0300
Subject: Re: how to do large-ish IPC transfers
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
 <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
 <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <e0a953de-e329-7586-b072-c78294df452d@yadro.com>
Date: Fri, 13 Sep 2019 10:42:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KzDbfL7fL4BT7awiZnd5T0pr1GfMhV9U2"
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

--KzDbfL7fL4BT7awiZnd5T0pr1GfMhV9U2
Content-Type: multipart/mixed; boundary="eauzxD40jBPy8ke6NGnOwf1DuxqCacrjP";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Cc: openbmc@lists.ozlabs.org
Message-ID: <e0a953de-e329-7586-b072-c78294df452d@yadro.com>
Subject: Re: how to do large-ish IPC transfers
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
 <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
 <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>
In-Reply-To: <8B34652D-4C2B-44F2-A05B-68D7C3B24279@fuzziesquirrel.com>

--eauzxD40jBPy8ke6NGnOwf1DuxqCacrjP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

12.09.2019 16:24, Brad Bishop wrote:
>
>> What is a 'file descriptor' you're referring to here? The Linux file d=
escriptor
>> (the integer you get from open()) is process-specific and doesn't keep=
 its
>> meaning in another process' context.
>
> On Linux you can pass file descriptors (the ones returned by open) over=
 unix
> sockets.=C2=A0 The implementation of the =E2=80=98h=E2=80=99 DBus type =
relies on that.

Oh, great! Didn't know about that. Thanks.

Anyway, I think I'd just use message queues or sockets (directly). What's=
 the
profit of using a file whose descriptor is sent over a socket instead of =
just
using the socket for communication?

With best regards,
Alexander Amelkin



--eauzxD40jBPy8ke6NGnOwf1DuxqCacrjP--

--KzDbfL7fL4BT7awiZnd5T0pr1GfMhV9U2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJde0hLAAoJEOiTWHtbdBeNjnIP/3v5mI9DU/8ehknZlrGzYAvn
6H4YbB2tk3Ag57WzIodl+D/dKc4xKt3uLt48ZruMbO6rNPu5k0FRr+JTBec9l4j0
F0Vx8iyiQ6VhZPsELdNeBGpGT2nSXOuknTCfpp7g65t7MmKg7yQDubdzcuh1wEkJ
j1uhyAzKLO92mUgJu8GtujN+03/N4QpKQ/1ZvcJTeLnvu6Dpb5G5zHXRx6W5HOyo
ueDGMv91+WH8Ddlu0u032ee48L+nyRUsWowEZvNRkmBu/geGcMisc4MSYke1RpU7
sixFYpYYAigkEu8UkDlcf5iP9pX66q9I/64dPd8+KLtgjTbpneWJ75L4H0O/fnaT
y61xmhW/7ZB991zZCpadZbTIWDtfFg3w6hwHZbOppnpS90DR9oSVpkbzx+y0AllE
ScKI5GNAuwpXrgvcHekN/Vb7dFMbZYEX2oEYHteABPL9UdsHA7RNGcwDNOG0yT9z
ZQUSumVzcVHMBMnlVok4E2iLExHOCYXU4hXwoSX4cKn5Y5joVs8iPHjqPiLOXlyn
iZw/D6VR8+aWMIXjnfH4sBHClABmtGVPzMnZ1D4qNd9oCgdCX44Q8vrcjjezTkzf
15nPe3mcJr8WMGmd/kL9ZO/gUvVbL0T4FemNDhicBc+0R0SxM1/EEFqciMWcjB0s
cisvG6Ird4iCSv08qKub
=W5n0
-----END PGP SIGNATURE-----

--KzDbfL7fL4BT7awiZnd5T0pr1GfMhV9U2--
