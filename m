Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 022D92F39BD
	for <lists+openbmc@lfdr.de>; Tue, 12 Jan 2021 20:13:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFgFj1T4tzDrQR
	for <lists+openbmc@lfdr.de>; Wed, 13 Jan 2021 06:12:57 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Iu3MW60U; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFgBV0JHmzDqlw
 for <openbmc@lists.ozlabs.org>; Wed, 13 Jan 2021 06:10:08 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id l200so3457245oig.9
 for <openbmc@lists.ozlabs.org>; Tue, 12 Jan 2021 11:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6Awm6oG/OI+TMOWeju62VYZY9wtfwvDa8EO/SaAfZQE=;
 b=Iu3MW60UouIqBkr9yQojvZGrFC8GQaL/aSyLkYnxkElrvk8FHln8+fnBHrlZ7aDro7
 otDsAn1TvQH1x3cwjTF9Jwy54p0lg6dv8Fth4c2ZF6tfZjGCoPpXzUU3YalRMJKFGRU4
 nnvzySgwoSSjqC9+HWgXPJoQqssq6rOyMWVHtBkA83bOEUQo82mSdpEE82ZfpNAFwrR6
 F6i3SHfSk6sQTTIUf70O+GFSjMY0deGuaKHnpGyUf9/ioORhBIhEEHeGIcWm+qyFhVkG
 nYogoFqQAqZMY+PCU5rFrQvUnNyMmIAjUAUGmB7I8Y+rm5s+C3Ao4Xg5teu6B9wYoYlj
 0glQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6Awm6oG/OI+TMOWeju62VYZY9wtfwvDa8EO/SaAfZQE=;
 b=UhvHKFcjfOyCRXikovdDKstcc6XBIYDQD7eLM0cgxKlOFDYV5/jotEYyokOCJZO5pf
 f3vj6DKFIWsSIdbI5cS6VPVN3Y5wHoNemFMssZhtr5/mIQmyw9M0V88nM+QEPIPDSjoy
 iwOxmWMktgiMW8Jwo+2H3OLPL2ERd39fsTNGrPdfElqTI5CLasaWN7RhPht71r+54Mr0
 GWsi5SyWSINsb/+ubxmieXizJDD1fQhohpidGV+Oq9BLOBVrsoWrK9b5Am2mcJ/98Rty
 KOrljQlJpRzLl4hPYflwy3ih797dBP06ddc7qJbpJ1lRS9Y+7nfZC0ubsd2fui8g5oTF
 shdQ==
X-Gm-Message-State: AOAM530P7UX8vO8j6l06iuPz+RhoS6xDA2bmLuRrPcrrMWUHbsoLnWNa
 Yu4RMwlUOHxLrctqhNcjfkuAHgDr+iy5cw==
X-Google-Smtp-Source: ABdhPJzEEzQS7J+R/a70ZUz0zmtqLDYLjhaEPAPF1kn4R5vg1Q1dwGsYuUKWjo6iktzYk2Fav4fmmQ==
X-Received: by 2002:aca:61d6:: with SMTP id v205mr401734oib.123.1610478604567; 
 Tue, 12 Jan 2021 11:10:04 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:cdb6:1a20:c33f:bb72])
 by smtp.gmail.com with ESMTPSA id p25sm841684oip.14.2021.01.12.11.10.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Jan 2021 11:10:03 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: peci-pcie CI issues
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <50d6828a-3460-884e-c107-4b0fe5f1396d@linux.intel.com>
Date: Tue, 12 Jan 2021 13:10:03 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B9E4A2C-EBD0-485E-A234-3B8E73836166@gmail.com>
References: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
 <EC305987-22B3-40D2-86A6-4FF95B395956@stwcx.xyz>
 <CACWQX82quUYK+r0BkDqT0ZABXgRPj797Wwr8Joov05w8tCLwuA@mail.gmail.com>
 <0759e6524c910c8d24f1453dbbe226bc3460e588.camel@yadro.com>
 <CACWQX80E873CA2_LH7kVXHoGjuAZGUM21rxA6nsk8gMG-Ocemg@mail.gmail.com>
 <50d6828a-3460-884e-c107-4b0fe5f1396d@linux.intel.com>
To: "Bills, Jason M" <jason.m.bills@linux.intel.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
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



> On Jan 11, 2021, at 6:08 PM, Bills, Jason M =
<jason.m.bills@linux.intel.com> wrote:
>=20
>=20
>=20
> On 12/24/2020 10:53 AM, Ed Tanous wrote:
>> On Thu, Dec 24, 2020 at 10:34 AM Andrei Kartashev =
<a.kartashev@yadro.com> wrote:
>>>=20
>>> Well, then probably we can wait.
>>> How far this could happens?
>> Whenever the work gets done.  Someone needs to:
>> Send a patch to yocto upgrading the boost recipe.
>> Wait for the meta-layer bump to run (I think Andrew runs the job once =
a week).
>> Resolve any issues with the bump when it gets merged to OpenBMC.
>> There's no exact timelines on the above, but you can certainly
>> accelerate it by doing step 1, after which you're probably looking at
>> a couple weeks before we get it in OpenBMC.
>=20
> It looks like upstream Yocto picked up boost 1.75: =
https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-support/=
boost.

Here=E2=80=99s our bump to try and pick it up: =
https://gerrit.openbmc-project.xyz/c/openbmc/openbmc/+/39533=20

But we hit a build issue (unrelated to the boost aspect I believe).
https://github.com/openbmc/openbmc/issues/3746=20

Help appreciated on the fail.
>=20
>>>=20
>>> On Thu, 2020-12-24 at 10:23 -0800, Ed Tanous wrote:
>>>> On Thu, Dec 24, 2020 at 10:07 AM Patrick Williams =
<patrick@stwcx.xyz>
>>>> wrote:
>>>>> We have had this issue with a number of repositories lately. The
>>>>> most recent version of boost::asio does not allow -fno-rtti.  The
>>>>> makefile needs to be changed to no longer force this option.
>>>>=20
>>>> Or, as another option, just wait until boost 1.75.0 lands in yocto
>>>> master and subsequent openbmc bump.  It was released a couple weeks
>>>> ago and fixes this issue.  We'll likely be adding the no-rtti flags
>>>> back to most of the repos shortly after that.
>>>>=20
>>>>> Sent from my iPhone
>>>>>=20
>>>>>> On Dec 24, 2020, at 9:48 AM, Andrei Kartashev <
>>>>>> a.kartashev@yadro.com> wrote:
>>>>>>=20
>>>>>> =EF=BB=BFHello Jason,
>>>>>>=20
>>>>>> I push several patches to peci-pcie repo, but looks like CI
>>>>>> broken
>>>>>> there. Could you take a look on how to fix CI?
>>>>>>=20
>>>>>> [ 90%] Building CXX object CMakeFiles/peci-
>>>>>> pcie.dir/src/peci_pcie.cpp.o
>>>>>> In file included from
>>>>>> /usr/local/include/boost/asio/execution.hpp:19,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/system_executor.hpp:20,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/associated_executor.hpp:22,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/detail/bind_handler.hpp:20,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/detail/wrapped_handler.hpp:18,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/io_context.hpp:23,
>>>>>>                 from
>>>>>> /usr/local/include/boost/asio/io_service.hpp:18,
>>>>>>                 from /home/jenkins-op/workspace/ci-
>>>>>> repository/openbmc/peci-pcie/src/peci_pcie.cpp:22:
>>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp: In
>>>>>> static member function =C3=A2=E2=82=AC=CB=9Cstatic const =
std::type_info&
>>>>>> boost::asio::execution::detail::any_executor_base::target_type_vo
>>>>>> id()=C3=A2=E2=82=AC=E2=84=A2:
>>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp:811:23:
>>>>>> error: cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=A2=
 with =C3=A2=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
>>>>>>  811 |     return typeid(void);
>>>>>>      |                       ^
>>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp: In
>>>>>> static member function =C3=A2=E2=82=AC=CB=9Cstatic const =
std::type_info&
>>>>>> boost::asio::execution::detail::any_executor_base::target_type_ex
>>>>>> ()=C3=A2=E2=82=AC=E2=84=A2:
>>>>>> /usr/local/include/boost/asio/execution/any_executor.hpp:851:21:
>>>>>> error: cannot use =C3=A2=E2=82=AC=CB=9Ctypeid=C3=A2=E2=82=AC=E2=84=A2=
 with =C3=A2=E2=82=AC=CB=9C-fno-rtti=C3=A2=E2=82=AC=E2=84=A2
>>>>>>  851 |     return typeid(Ex);
>>>>>>      |                     ^
>>>>>>=20
>>>>>> --
>>>>>> Best regards,
>>>>>> Andrei Kartashev
>>>>>>=20
>>>>>>=20
>>> --
>>> Best regards,
>>> Andrei Kartashev
>>>=20
>>>=20

