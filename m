Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D1136950D
	for <lists+openbmc@lfdr.de>; Fri, 23 Apr 2021 16:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FRccw3vWhz301B
	for <lists+openbmc@lfdr.de>; Sat, 24 Apr 2021 00:49:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TDoecZkx;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a;
 helo=mail-oi1-x22a.google.com; envelope-from=proclivis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TDoecZkx; dkim-atps=neutral
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FRccj1dbqz2xfh
 for <openbmc@lists.ozlabs.org>; Sat, 24 Apr 2021 00:49:08 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id k18so44471258oik.1
 for <openbmc@lists.ozlabs.org>; Fri, 23 Apr 2021 07:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oG5pR/5+vSi4D6XBo8tXTmz5DrG6+I+plbUEVaEFDk4=;
 b=TDoecZkxeNJ2sxkyj6UjDA8vfpRazzDfSO9vsihyHu60fH3j4SzATwigzg7S6QyC0Y
 jn7RVC9hD6K0iY1TT1txvRIK4u+WZO4ib8ISVex3O+belD1cgaWi8RYR6Hv2g8RXQ367
 TzQbpFdeSPTd+5676ayeJB/7R7lePtexEMluMXMad2vZPrQF9GYTziP9zPtr7J9WrCTe
 NJqess3nXvhB7ZRHAC/dN0BRMLOWyg5I65G1ZQXTj1zYOjBzFPRljA34zpel/8ScFaaO
 y+09z6dChx68QIU2vJx7gma3CMg40jP1UUpbjQP7k6dPODGi38Pqw7jWTcpBsEOQtPxc
 Z23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=oG5pR/5+vSi4D6XBo8tXTmz5DrG6+I+plbUEVaEFDk4=;
 b=djlWR43/1mZjcaZo4xa83IUglJzZaazsGTp9D3MRXkixQJ+1BuepX33IBZbRy248LT
 zVCNo2xtSkjhZQkzcgQLleZwbX7Z2/Ir+51ZYMyjCi5Pyap1Po+ki4v1m6X4yuRczlGz
 TN+aZiSlIsxUKZbV1Sv9kfyIDWYfyotZt0FkbO3oPUWWoopbPB2mdrQI5KkPs2Q4I51r
 nn7aRCDWwr9rryTGu5g/UuLox2Op0Q5s0SGiaFw6TcVVAHKmSiTAS+ndL4rZKZ/SZSbK
 6P7fmVIOnDkiCGuEf6PeCKg7yISAp52XarUF87AG92/QnnbMf8TYfS2ugBWCEeBJE3cy
 /ivw==
X-Gm-Message-State: AOAM530eVFieSnrPtjYqytZscd1K47bu/cJqsFNIa5TJH/U9OzkiuC6v
 Z5nCMfgBDAK13RteLxMYv8Eld1W17Tg=
X-Google-Smtp-Source: ABdhPJyCY7JzCJClMiY/Wj8PgYKBXcB9fKeG9LlHPH+oDbQFdGHRc6O2R8QztGXKYntmS12eDFOmzA==
X-Received: by 2002:aca:1c03:: with SMTP id c3mr3108290oic.47.1619189347120;
 Fri, 23 Apr 2021 07:49:07 -0700 (PDT)
Received: from ?IPv6:2601:281:c001:2359:7982:337a:e73e:2882?
 ([2601:281:c001:2359:7982:337a:e73e:2882])
 by smtp.gmail.com with ESMTPSA id u139sm1280592oia.52.2021.04.23.07.49.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 07:49:06 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: PMC
From: Mike Jones <proclivis@gmail.com>
In-Reply-To: <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
Date: Fri, 23 Apr 2021 08:49:05 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <1F0D01CD-2A39-49B3-9E63-DDFCA3371672@gmail.com>
References: <YILLjQfgD4Q2vH5L@heinlein>
 <31F00F60-DF2D-40FB-A9BC-85538975398D@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
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
Cc: openbmc@lists.ozlabs.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Patrick,

We are using spec: Open Rack V3 48V BBU.

In the case of a PMC, since I don=E2=80=99t know the OCP architecture =
well, is there a PMC device in the rack that would manage a BBU, or do =
devices that plug into their rack each have a PMC?

Looking at the above spec, the functions of the MCU are quite limited, =
so I assume there is a PMC device that is managing these other elements =
like a BBU.=20

Perhaps there is a spec for that I can look at?

Mike

> On Apr 23, 2021, at 7:39 AM, Mike <proclivis@gmail.com> wrote:
>=20
> ADI is working on a reference design using an Open Compute PMC spec. I =
will find the spec and get back.
>=20
> Sent from my iPhone
>=20
>> On Apr 23, 2021, at 7:28 AM, Patrick Williams <patrick@stwcx.xyz> =
wrote:
>>=20
>> =EF=BB=BFOn Fri, Apr 16, 2021 at 01:40:40PM -0600, Mike wrote:
>>> Is OBMC ever used as firmware for a PMC (Power Management =
Controller)?
>>=20
>> Hi Mike,
>>=20
>> We were working on a power management controller as a potential =
design
>> option for OCP Rack v3 and we presented an early look of that work at
>> the 2020 OCP Tech Week.  We haven't made much progress on =
implementation
>> at this point though as we've been focused on other aspects of the =
ORv3
>> design.  As code is available we plan to deliver it on Gerrit.
>>=20
>> Is there anything there you'd like to collaborate with from a design =
/
>> requirements perspective?
>>=20
>> --=20
>> Patrick Williams

