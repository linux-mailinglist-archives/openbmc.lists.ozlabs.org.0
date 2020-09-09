Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC74E263963
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 01:33:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bmyxz0f5PzDqbg
	for <lists+openbmc@lfdr.de>; Thu, 10 Sep 2020 09:33:27 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::734;
 helo=mail-qk1-x734.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MGNzd7lS; dkim-atps=neutral
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmyxF2W4hzDqZT
 for <openbmc@lists.ozlabs.org>; Thu, 10 Sep 2020 09:32:48 +1000 (AEST)
Received: by mail-qk1-x734.google.com with SMTP id p4so4274029qkf.0
 for <openbmc@lists.ozlabs.org>; Wed, 09 Sep 2020 16:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7wb7ic5TkTX3iOcaqXcZLiNVaNt311Op0YrJJvLgc7s=;
 b=MGNzd7lSfZd2PWN+BAcnwd8kn/fcd5V82vEbZfWqdiTurJBpdiiw0qqy6LHH7g4jkH
 hjXUVaEQ427StFaIDYtDaMXcSm3cUnrFpEWCNAe6Pjl67Cw0WVSMIKR0vmyOgU9VHxMF
 22Ny/CAn+08bylg+t2PMG5RqZHUw1dxZCAuxfc+6Y+aKE8wmOsv9gCDm54GjZaYAm3Q2
 Yba8msiduyhAkvwWMzpD07WOuqVnTIKCvp2rrur6PJZbUOUGIqQK8KgSPDVAqAHJ14sY
 H7eg4LT4sgksL9RgLbvx7oDYwpvoEqOojqvlRFRFBl2bF2e0MCol7NF3I+Lla8jZ0OhJ
 yftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7wb7ic5TkTX3iOcaqXcZLiNVaNt311Op0YrJJvLgc7s=;
 b=t3/PfyJy6/mBm572Pan8Vc2LH0tyDu+ybhihFl+Hd8wTlm3sHbKqwbE6QlYSs0QoY5
 oblnLlZ/9u1uM7+PwgejveegCp1OyP14ncqi9tv6czU+jvALZ4gkNCswIUa+XyXuQtjO
 oHILkTWoxTO7ZH+k5OE1BFpxczUEL9NSja1UHFwlhgxs0V/ef4+nJEbcZcTalQKarUCj
 SIXHv3VddAelSy4AZl9gyAmSlpz15HgGOecZgnI3uzXuBSRoNobmfl9umq8PQr77XiTU
 kgRheE9zkv6UFeGL6bzb4vL4vAf73knZMpdfKmFPi3xhevEWsG/DPbpIMKAAHycDNQCv
 j9Mg==
X-Gm-Message-State: AOAM531B1yoBnh+22WuZzgMFN+xkVHSe6DwECvxNHgeb4AsGpIwqgKN9
 77VjL/onrPnlGkufu2Ug//XiJIyx6ezbFw==
X-Google-Smtp-Source: ABdhPJwgOi3CC5TgQjUuc160/Upm2GfOEar/7y9FIeqNg6UtiTmFXK/AKw6KmfiYlZlJYhZx/qMNCw==
X-Received: by 2002:a37:a3cf:: with SMTP id m198mr5642783qke.410.1599694363650; 
 Wed, 09 Sep 2020 16:32:43 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id d10sm4014053qkk.1.2020.09.09.16.32.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Sep 2020 16:32:43 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: meta-amd repository
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <28643e5c-e0ae-9cf7-5593-af82899ace1f@amd.com>
Date: Wed, 9 Sep 2020 18:32:41 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <C4E0C15E-3558-4CBC-8EDE-DBE1B8CB964D@gmail.com>
References: <3e858b31-2547-a114-75f5-4ccd740641d3@amd.com>
 <20200909141816.by4hbfaqbbeud2fm@thinkpad.dyn.fuzziesquirrel.com>
 <28643e5c-e0ae-9cf7-5593-af82899ace1f@amd.com>
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Sep 9, 2020, at 12:12 PM, Supreeth Venkatesh =
<supreeth.venkatesh@amd.com> wrote:
>=20
> Brad,
> Much appreciated.
>=20
> A related question:=20
> I see only the following targets being triggered for CI
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,romulus
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,zaius
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,witherspoon-tacoma
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,tiogapass
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,witherspoon
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,gsj
> Triggering ci-openbmc =C2=BB ubuntu,docker-builder,palmetto
>=20
> What is the process to get AMD reference platform added as a target =
for OpenBMC CI?=20
> It is **not** required in the short term, but eventually would like to =
contribute to OpenBMC CI infrastructure in the long run.
> We will be happy to collaborate by means of providing AMD reference =
platform, help with Jenkins script update, etc.
> Please let me know, how we can help.

Hey Supreeth, I always like to see some interest in CI!

The best way to get a machine on the CI list is to donate a server to be
used as a jenkins build worker :)

=
https://github.com/openbmc/openbmc/wiki/OpenBMC-Infrastructure-Workgroup#c=
urrent-infrastructure=20
covers our current infrastructure.

The goal with CI is to test as much as possible, as quickly as possible. =
The machines
selected for CI try and cover as many different meta-* layers as =
possible. So the second
way is to make the argument that your machine and the layers it test =
would provide
good testing and coverage for the community.

=
https://github.com/openbmc/openbmc/wiki/Adding-a-System-to-Hardware-Contin=
uous-Integration could
also be used as a way to build and test your system via your own CI =
process and=20
build machines and then updating the gerrit review with your results.

I do feel like we=E2=80=99ve been looking for a long time for a easy to =
get and cheap
OpenBMC reference platform that people could utilize for development. Be
great if y=E2=80=99all were working on something like that!

Andrew

>=20
> Thanks,
> Supreeth Venkatesh
> System Manageability Architect  |  AMD
> Server Software
>=20
>=20
> On 9/9/20 9:18 AM, Brad Bishop wrote:
>> [CAUTION: External Email]
>>=20
>> On Wed, Sep 02, 2020 at 02:55:20PM -0500, Supreeth Venkatesh wrote:
>>> Hi Brad,
>>>=20
>>> Please help add meta-amd repsoitory into openbmc as a subtree.
>>> meta-amd repository has been populated with basic bring up code.
>>=20
>> Hi Supreeth.  Done:
>> =
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit=
.openbmc-project.xyz%2Fc%2Fopenbmc%2Fopenbmc%2F%2B%2F36339&amp;data=3D02%7=
C01%7Csupreeth.venkatesh%40amd.com%7C9958fcee95a54f96a06c08d854cb33ff%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637352579007884384&amp;sdata=3DA6=
HowV1WotfXfg9dcawpvMfAsyD20jG2yqQXKAxAiFI%3D&amp;reserved=3D0
>>=20
>> -brad

