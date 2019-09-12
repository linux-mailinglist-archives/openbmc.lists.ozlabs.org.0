Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 949F9B0D0F
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 12:38:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TZxC1RKBzF4J2
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 20:38:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.252; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="kLsktzJJ"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-02.yadro.com [89.207.88.252])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TZlj3bRdzF4Cc
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 20:30:09 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0648042009
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 10:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1568284201; x=
 1570098602; bh=r0dGytVVg6qr0awC8askupz6lixTqm8BsA10yRkd/VE=; b=k
 LsktzJJwvhE8Mq1R8Noe585SXpAltznREkCStm442yifiBEw3kdbG5tHzBq+ogzs
 CU55HSqRMFYX3XcbMpkxCJAnSgBtjXse9GiOIgqcLHnfXhpypP/JAbW2qBRs3wM2
 m4ZQE2+hQ+WLMInIHCJmsa6s/NI5jGREIsLB0WeRbs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OJ5FfAtaAyFj for <openbmc@lists.ozlabs.org>;
 Thu, 12 Sep 2019 13:30:01 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4258B4193F
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 13:30:01 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Thu, 12
 Sep 2019 13:30:00 +0300
Subject: Re: how to do large-ish IPC transfers
To: <openbmc@lists.ozlabs.org>
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
Date: Thu, 12 Sep 2019 13:30:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190911183102.GF45301@mauery.jf.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aYEcdz5p1Jygq06n70XHe5QPHYDaYAtDU"
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

--aYEcdz5p1Jygq06n70XHe5QPHYDaYAtDU
Content-Type: multipart/mixed; boundary="cQvn17tUKiwR4XJ9OXk9AI9VPnvSaQxQJ";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: openbmc@lists.ozlabs.org
Message-ID: <dc2c8eba-35ab-afa6-0f27-30fe6e8398d3@yadro.com>
Subject: Re: how to do large-ish IPC transfers
References: <0938D0E7-0B8A-4F34-8195-FDC8E7F7606C@fuzziesquirrel.com>
 <20190911183102.GF45301@mauery.jf.intel.com>
In-Reply-To: <20190911183102.GF45301@mauery.jf.intel.com>

--cQvn17tUKiwR4XJ9OXk9AI9VPnvSaQxQJ
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

11.09.2019 21:31, Vernon Mauery wrote:
> On 11-Sep-2019 01:49 PM, Brad Bishop wrote:
>> Hi everyone
>>
>> I have an application or two that need to collect and save ~ 16KiB of
>> debugging data.  The applications have various triggers but they are v=
ery
>> infrequent when deployed (on the order of months/years).  In the lab i=
t
>> would happen much more frequently.  It isn=E2=80=99t really debugging =
information
>> for the developer of the application but rather for customer service
>> personnel debugging broken components on a deployed server, after the =
event
>> (and state) that caused the data to be collected.
>>
>> The applications generating this data will not be the same application=
s that
>> publish it (the webserver), so there is a need to transfer it using IP=
C.
>>
>> 16KiB seemed a little big for a DBus interface, and we=E2=80=99d have =
to ascii
>> encode all that into a string.  Some other ideas were:
>>
>> 1 - passing a file descriptor over dbus
> This would probably be the best, given our architecture. It would allow=
,=20
> at some point in the future, to have the sender have different=20
> permissions on the file and allow access to a less-privileged process.

What is a 'file descriptor' you're referring to here? The Linux file desc=
riptor
(the integer you get from open()) is process-specific and doesn't keep it=
s
meaning in another process' context.

>> 2 - passing a file name over dbus
>> 3 - shared memory

Classic IPC in POSIX are named UNIX sockets, named pipes, message queues,=
 or
indeed shared memory (access requires a shared key for SysV or a name for=
 POSIX,
both could be sent over d-bus).

> Two and three could be the same (if that file is in a tmpfs). System V =

> shared memory is a pain to use, so simply mmap'ing a file in tmpfs is=20
> the easiest way to go. But both of these require permissions to align=20
> between sender and receiver.

Well, System V shm isn't that much of a pain actually (just some), but th=
ere is
also POSIX shared memory (man shm_overview), mmap() being a part of that =
spec.
You'll need synch primitives anyway, even for a file. For sendinding
message-like data I'd probably choose message queues (man mq_overview). T=
hey are
well capable of such small amounts as 16KiB.

> --Vernon
>
>> Are there reasons to steer clear of any of these?  Security concerns?
>> Performance concerns?  Maintainability concerns?
>>
>> Are there other choices I=E2=80=99m not thinking of?
I personally consider classic POSIX IPC mechanisms much better performing=
, much
less complex, much more robust, more thought-through and overall more pro=
ven
than d-bus and systemd. I wouldn't even think of d-bus when developing an=

embedded system, but `that's just me...

With best regards,
Alexander Amelkin,
BIOS/BMC Team Lead, YADRO
https://yadro.com



--cQvn17tUKiwR4XJ9OXk9AI9VPnvSaQxQJ--

--aYEcdz5p1Jygq06n70XHe5QPHYDaYAtDU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJdeh4oAAoJEOiTWHtbdBeNtckP/jmVzER/Am38QU8RIryr6fZs
Nrr8jJqZh5KStAz2av/LLEz+qBhyoBV/CuOadP/hyqIONc9E4CNclZmHkYGImJx2
8BSst2UE1LxFy+e1wBhY6Lr/hmdvPy/PS9r1cNGaFkthpShRnjp3J9BSH79xNnc8
DeIxn1LK/+8HAkVcXaERDzkCXW9Bx+IXpv98haov8m9wa8h3AKLgYkiG6Pc/UlPh
j27AKuXQacQTbwvxisPjhp+8h/sJpSze6vXExPRuJIaShyCoQd+Hp2vaGpv2zms5
r8tRMPVROnfBTappo+9kMRuVd2Ibku1GnbD4sDTljqhcApWYmYV9V31bzwULOxit
jD6N9ttR9+9qImmcNrXjVOIF3k1jQj33hHx5x2+gJmoK7KZeNt32PROhaHZ0W5oa
/V4U96SUihvDF5/z43YUS2pwGdaia8eFyXkQ7l04JIQI9c66vaOQJ+/4Cj6QHFi2
rzH93ObvWvZky5XOUchcvFuLVVtVi66ikm4AwI0jWEgmlTVKrOuwc2shRHCwwV9U
PixaGGDVs/ItQEjgHUmcKFUVtxJv4emiSH1Yl6XTr0/HhB8ABi+P46x/EfsXNY4g
YN+rBtKkH+WaamI8+dSPs3HT8lqTB5FKFugThT6+ffCgSTGlTOU4bahPgppYvqd3
0KaIRXRanU4zlPj0CYba
=HINW
-----END PGP SIGNATURE-----

--aYEcdz5p1Jygq06n70XHe5QPHYDaYAtDU--
