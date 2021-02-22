Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CB321A4B
	for <lists+openbmc@lfdr.de>; Mon, 22 Feb 2021 15:27:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dkkyv0sshz3cLj
	for <lists+openbmc@lfdr.de>; Tue, 23 Feb 2021 01:27:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ghpCY7DC;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ghpCY7DC; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dkkyf3P9Tz30Jr
 for <openbmc@lists.ozlabs.org>; Tue, 23 Feb 2021 01:26:50 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id b8so12085506oti.7
 for <openbmc@lists.ozlabs.org>; Mon, 22 Feb 2021 06:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wFgfLMo9c8m6UraFByTHes8cmUqm27p3DMFb87Aatrc=;
 b=ghpCY7DCzN6uTxuLg85gV8Bgl2qG3P1BerA9ghd/t0Zj/bkV/9YE/Dr1Rl0t9D9qc9
 NQwNKQDaORmcgnxJgC53Sri08C4iCfmDHkdKek9XQamtMx9VHNFL+gWrVTmYSftQqZvD
 MpdJVbE7ZD5VhenIKnDOJbbt5W0hMe6vxDIagWlquMX5pSEqvm1i11iEWSwMCQIPHcDU
 dxFHMX1V9qRZaeSYrdM2kL3w6DuLjuyHHyPaUFmydcR+DjI0/Yh21neU2MBlUv6rgKpA
 UviMWgOIedcyvhBi3tu0DtOqb6FYNI4BB7//GUJKjmWHk9TwFZBzyIP+BFtQW4fB77uG
 hPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=wFgfLMo9c8m6UraFByTHes8cmUqm27p3DMFb87Aatrc=;
 b=Z5Pub9iIUsmH/SacST1vuEqzgcbBT5yzgDHmPnOPmal47lAOU1ysttu86LIikfPEO6
 LFnKuCmFf5NlS6rgSPmj6IRJO9tefGCd4vIdQmkN8d16fC5OazM1sxOn2AhU1wsrUjQm
 0ASxFV0qwgxKs8ctqvyW0VOjGR8MozC09u1tjtiJ7U89mvbmAbrrwgAUbPL97JVfQkip
 yDiYRiEoWVIS43KOcrlGctfSb8N0bqcRTaWgYbjGcx1vFeCpKfC/IfzCOrp/OfnYy6QE
 F6hc8+o+5s1RoYnucoKO3UGLiYud6J6gyL9DAaJrJFj+VG5SYABVoCQ0YLcFidFRol+8
 42uw==
X-Gm-Message-State: AOAM530srSRATFllEVdGr+/xJBYuO46ggFDoDpc5vMWNtjlDmDz/c+KI
 JRQXmY13/520Itxf1Ytk88U=
X-Google-Smtp-Source: ABdhPJytXt3rZfwpBE+aUjlOhWxEc4gKzNwMqcO4xJyPp7ujj4L9sYk4azj0IwhwFhN3LvepuI94RA==
X-Received: by 2002:a9d:a07:: with SMTP id 7mr3142903otg.270.1614004007024;
 Mon, 22 Feb 2021 06:26:47 -0800 (PST)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:3ce4:522d:aff2:120e])
 by smtp.gmail.com with ESMTPSA id g13sm3655605otl.60.2021.02.22.06.26.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:26:46 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Any convention on putting source codes into openbmc/openbmc
 repository
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <a53b3558-5502-9e87-7ec2-13b578e1fedd@os.amperecomputing.com>
Date: Mon, 22 Feb 2021 08:26:45 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <C42F1EF4-0128-466C-BFA3-95CF9A9DF828@gmail.com>
References: <71820e5a-1231-1937-1344-dee9f4a03600@os.amperecomputing.com>
 <CADfYTpF9yX0xheCwu5mftWs9b4YAe=ttGNNsf7GL8KkpW4dAcw@mail.gmail.com>
 <42403202-49c9-2b85-1207-4c84ec491332@os.amperecomputing.com>
 <CACPK8XdFxB4JQR09tNvV-DN4V4fiUmbY2_7+MArh_jdAs1YVkQ@mail.gmail.com>
 <YDFBBgX2kRHMlGQK@heinlein>
 <a53b3558-5502-9e87-7ec2-13b578e1fedd@os.amperecomputing.com>
To: Thang Nguyen <thang@os.amperecomputing.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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



> On Feb 22, 2021, at 2:25 AM, Thang Nguyen =
<thang@os.amperecomputing.com> wrote:
>=20
>=20
> On 21/02/2021 00:04, Patrick Williams wrote:
>> On Thu, Feb 18, 2021 at 05:23:56AM +0000, Joel Stanley wrote:
>>> On Thu, 18 Feb 2021 at 01:31, Thang Nguyen =
<thang@os.amperecomputing.com> wrote:
>>>>=20
>>>> On 18/02/2021 06:46, Nancy Yuen wrote:
>>>>=20
>>>> Code should be put into an appropriate repo, and repos created =
where necessary.  Then referenced in recipes from openbmc/openbmc =
metalayers.
>>>>=20
>>> It's a requirement.
>> My opinion is that there are two reasons that come to my mind on why =
we
>> follow this convention right now beyond just that Yocto is happier =
with it:
>>=20
>>     1. We like to have a discussion before making a new repository to
>>        make sure we're not fragmenting the codebase more than =
necessary.
>>        Often problems/solutions overlap more than might seem obvious
>>        when you're looking at it just from your machine or =
architecture's
>>        perspective.  There may be some existing implementation that
>>        could be modified slightly to make it fit your needs, or it =
could
>>        be that someone else has the same problem and would like to =
work
>>        with you on implementation.
> Thanks. It clears for me.
>>=20
>>     2. All of our CI infrastructure is set up where machine recipes =
go
>>        in openbmc/openbmc and code goes in various code repositories.
>>        If you try to put code directly into openbmc/openbmc you do =
not
>>        gain any of those CI efforts we already have:
>>             * Build of your code and unit tests when someone
>>               makes a code change.
>>             * Unit test execution.
>>             * Code formatting.
>>             * Static code analysis.
>>        We have a lot of support at a repository level that doesn't =
exist
>>        in openbmc/openbmc directly, because it isn't approriate for =
what
>>        is there.
>=20
> Does the CI setup automatically? if not, how can I set it up?
>=20
> It seems I don't have CI setup on the =
http://github.com/openbmc/ssifbridge repository. How can I have CI for =
it?

Just need to make a request on mailing list or find me on discord.=20
I=E2=80=99ve added it now.

>=20
>>=20
>> Hopefully this gives you some additional context on why.

