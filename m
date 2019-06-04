Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E363401F
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 09:29:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45J3Tm4SzTzDqY1
	for <lists+openbmc@lfdr.de>; Tue,  4 Jun 2019 17:29:48 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=a.amelkin@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="Rk245qCw"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45J3Sv3d6VzDqdp
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jun 2019 17:29:03 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id DD2D841206;
 Tue,  4 Jun 2019 07:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:in-reply-to:mime-version:user-agent
 :date:date:message-id:organization:from:from:references:subject
 :subject:received:received:received; s=mta-01; t=1559633337; x=
 1561447738; bh=ZXOXXLwA+1AUXh3TPxPRuvS1+zS2spHnhkNruFEWtQA=; b=R
 k245qCwP8iTOLUKxh1p09aPIBiQFN/wrQIPFA/pc4xcZnAOUJngvAKpw1pBQD0I/
 e+I+8Og7lZ7FT45KWf+b5IAQIw8D3GdR0ADj0q2p9cDmD4ke6ds0YGmCn5cotEvy
 KcojAIV7jIPyFg5bDDEJDu8hSCJJtbLhGL7VfYVUr0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3O_Fv6qbMZlK; Tue,  4 Jun 2019 10:28:57 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1C1E3411F8;
 Tue,  4 Jun 2019 10:28:55 +0300 (MSK)
Received: from [172.17.14.197] (172.17.14.197) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 4 Jun
 2019 10:28:54 +0300
Subject: Re: [Design] PSU firmware update
To: Lei YU <mine260309@gmail.com>, Neeraj Ladkani <neladk@microsoft.com>
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
From: Alexander Amelkin <a.amelkin@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=a.amelkin@yadro.com; prefer-encrypt=mutual; keydata=
 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
 dTYsE5wSxM06T2l/MILupCNZ7A==
Organization: YADRO
Message-ID: <22257476-0958-75c8-2093-cabd35bb0601@yadro.com>
Date: Tue, 4 Jun 2019 10:28:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dFr0mfnouhrTaCunbC8mH2x5T6Lr0bzXH"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--dFr0mfnouhrTaCunbC8mH2x5T6Lr0bzXH
Content-Type: multipart/mixed; boundary="7NoqpB9QqqyUQ26S2wuW31aOpIj2s0ZFM";
 protected-headers="v1"
From: Alexander Amelkin <a.amelkin@yadro.com>
To: Lei YU <mine260309@gmail.com>, Neeraj Ladkani <neladk@microsoft.com>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Message-ID: <22257476-0958-75c8-2093-cabd35bb0601@yadro.com>
Subject: Re: [Design] PSU firmware update
References: <CAARXrt=6mZtVuwdTxamjUWXJk5RXNKaNM9aVZE5nEyTjowVjEQ@mail.gmail.com>
 <CALLMt=pdm=Nk5sCZvZBORb+N5suT7-FK0xbvWUy3Qxg5KcttKA@mail.gmail.com>
 <BL0PR2101MB09320BD7856E280C04852CB1C8140@BL0PR2101MB0932.namprd21.prod.outlook.com>
 <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>
In-Reply-To: <CAARXrtnJ1SsSVb2Y=5tvVVQtOouUpmZR4XoY4p=vhgizHmh4hA@mail.gmail.com>

--7NoqpB9QqqyUQ26S2wuW31aOpIj2s0ZFM
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

04.06.2019 5:58, Lei YU wrote:
> On Tue, Jun 4, 2019 at 1:23 AM Neeraj Ladkani <neladk@microsoft.com> wr=
ote:
>> 1. Why host power off is a pre-condition? We should add this a PSU pre=
-requisite to support Live upgrade and activation.
> Derek's reply explains the reason why we want to the host power off as
> pre-condition.
>
>> 2. How should PSU update impact PSU and battery monitoring ? should th=
ere be coordination between sensor monitoring task during update ?
> This is a good point. During PSU update, the driver probably should be =
unbind,
> and after the update is one, rebind the driver.
> Does that sounds OK?

Unbinding the telemetry driver (as in kernel driver) isn't a good idea be=
cause telemetry for a PSU can be provided by the same driver that provide=
s firmware update facilities.

In YADRO we have developed a mechanism that renders certain sensors 'inva=
lid' (or alternatively changes their thresholds) in certain states of oth=
er sensors. For us that allows for avoiding failure state for chassis fan=
 sensors when the host is off and also let's us live fine with zero main =
12V output of PSUs when the host is off. I suppose this mechanism could b=
e adopted by OpenBMC and adapted to this task to just disable some teleme=
try during PSU firmware update.

>
>> 3. PSU may have multiple regions like bootloader, active region and in=
active region. We should design to support multiple region update.
> I do not have detailed information about this, which is more suitable t=
o let
> the vendor-specific tool to handle the multiple regions.
> What do you think?

It's definitely up to the PSU vendor specific update tool to handle all t=
he layout and update interface peculiarities.

>
>> 4. Can you propose required SEL logs and telemetry requirements as wel=
l ?
> While I was writing this design doc, I was not thinking about the detai=
led SEL
> logs.
> Will need some time to discuss this and see if it shall be covered in t=
his doc
> or not.

The only event that I could find in IPMI spec is 'Version change' (sensor=
 type code 0x2B).

With best regards,
Alexander Amelkin,
Leading BMC Software Engineer, YADRO
https://yadro.com




--7NoqpB9QqqyUQ26S2wuW31aOpIj2s0ZFM--

--dFr0mfnouhrTaCunbC8mH2x5T6Lr0bzXH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJc9h22AAoJEOiTWHtbdBeNifoP/Am+DchaHWcxhmAacPGuGfpk
yZkJECkj+LNK0v3OLNo18EZwgTBrw7YEMwJMZWF7PT27onnzJbS6EuhkmS2lu7t4
pjuACRHgWgEEyrKGQv2tUAAw9jdt1cDoWXBG2AAnBGJMcMcpQNL4mOcZwpsOkB8Y
Em2SDLYW/J/otZ9UZsdG2ioNKBVO3lxlcOj30sxX87eICtvJtMEwm1ZjA+HUQm8P
A3PIsXdrufb2eTzo2r+L3lpZA42N/FZjz5GbkFtU94y0W8gJ+PKtnmFYfHEOvr5N
zgQvFKNhcLwGpG2f2F48SEufPMw7KzPKur0G0MDsJDgwSlEFL1WssP/Nbo7/QttZ
E5A18GV/p27TvDl2d2i43gIBJpJT6MvhKa2X2z/ZurnkxL/Pa1Fen5t1P5ncDssX
3dzZA0g6FR9sDk6JYCTQ5nww8+cTO3iTGZjAi4ry44kSswZqaAWGhZB0OcxFSssh
RKgjXN/WLEOYzojRCSLpM6EA/KMKQetkYgL+O+Dd5oT/h16TAjlDz61kYPiF2oU7
jr106tN5iFQey2P/Kb7st8Gh6DTqBjljyKCA6A7VddAVy7kpqZD4HPWmN+dj8VWQ
H18nAZZ3YU/5Wq5Oo/hWvzQrtese/DIDIKNp7mRq0apeSQJKcqaM0285wtIOqefN
OxhPwhV5n6Xlu4WaC3rZ
=Fblx
-----END PGP SIGNATURE-----

--dFr0mfnouhrTaCunbC8mH2x5T6Lr0bzXH--
