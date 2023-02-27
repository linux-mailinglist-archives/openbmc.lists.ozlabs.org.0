Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6086A4635
	for <lists+openbmc@lfdr.de>; Mon, 27 Feb 2023 16:40:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQPnz0fsdz3bfp
	for <lists+openbmc@lfdr.de>; Tue, 28 Feb 2023 02:40:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f/jHkhW8;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=geissonator@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f/jHkhW8;
	dkim-atps=neutral
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQPnK0dLLz307T
	for <openbmc@lists.ozlabs.org>; Tue, 28 Feb 2023 02:39:31 +1100 (AEDT)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-172afa7bee2so7778234fac.6
        for <openbmc@lists.ozlabs.org>; Mon, 27 Feb 2023 07:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EWrtMU3m9sbEwfTA6Oyqzjs4HdBbM2rJmOb6/zNiS90=;
        b=f/jHkhW85uQKpGRjkBlN/n6qV2rJWFWlQrFmh6tX2jpLS3WWzS5tt4Xxj0RxQv924g
         gKc1godkpDf0egybWDyFhqN4am65yX7O0BoggDDQDH9LgCHDuVw9y2Tznls0iQ4YrcQ6
         GgzMHKiQTtRzSpft7YxJgS0h2s991x3F2efJREk6NGZE+ymnSy9JjHz5L/+5YJeIhYlh
         HneU8SjRIDIi7CQm4YzCZHxVXb6YSamvVjbuLzLp6bQIZqOrO1+PTw3+/dEWZ9XDz27v
         329dwO3Uulwe8OuC0ad/ce0OlT7RWqee3V+DLn7fxdASFdbb0riHMuXjeg5kUIm5LSdt
         NQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWrtMU3m9sbEwfTA6Oyqzjs4HdBbM2rJmOb6/zNiS90=;
        b=eb+Ic/ugSZxljbrpl05JjtA+rOWLm3LToJqafzJzQwuPQe3YGJ6YO51fDbiDDiHEeM
         V1wl+NPJFhCPBelQa9YGiqdCPgyxyeduRla/21YvH3Czlfasdoa1DJTYQ8Wa9yYg36lT
         UaH4GnGBxqsOgqI3Ps6jwdkspik2/nl2AAJxzu2mwQx6gU8+ARrZCXU833uEyeKXyh4e
         zIi5UggzQVgQGUFbeW8XzTrKXeuAdDVNsDopFtBIj6HzLbBpKsk3L7YXgwHA7xnHF6Ji
         3UHUdZMGGHR9NHWtAJFUjrqQavYWg/b3s1iAoN2x8wtdt7ON+wYE0GUp9SKHpM4JebFu
         5utA==
X-Gm-Message-State: AO0yUKUzMGN+cc9AYcNo5PQnW4F19Rqr9G8uLHAvr/WbMJYJ5rPa8C9U
	OUQjAK2fWmXsAvDzqFDYA0GBKr3Y9xU=
X-Google-Smtp-Source: AK7set9vGnH/5I8xXUYa1GVNHP09UHD9fiZpjOFWSnVSQb0y+Mk6R+aSFBOwcIszTjdPAnaSYlTkhw==
X-Received: by 2002:a05:6870:b150:b0:16e:8b9f:93e1 with SMTP id a16-20020a056870b15000b0016e8b9f93e1mr21382436oal.5.1677512364207;
        Mon, 27 Feb 2023 07:39:24 -0800 (PST)
Received: from smtpclient.apple ([129.41.86.0])
        by smtp.gmail.com with ESMTPSA id g21-20020a056830309500b0068bc48c61a5sm2707566ots.19.2023.02.27.07.39.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Feb 2023 07:39:23 -0800 (PST)
From: Andrew Geissler <geissonator@gmail.com>
Message-Id: <A24C6F76-0303-4942-8F77-6D33A641B4F1@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_551F3FC9-4936-4880-88D0-9DD3FD044EF0"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: Regarding Code Coverage metrics for OpenBMC firmware
Date: Mon, 27 Feb 2023 09:39:22 -0600
In-Reply-To: <CAGugOWv-Fqbgb5HyujtfahXH8hLbhdsi9u2AtVahNL3jN=Gzhw@mail.gmail.com>
To: Satish Yaduvanshi <satishroyal4u@gmail.com>
References: <CAGugOWv-Fqbgb5HyujtfahXH8hLbhdsi9u2AtVahNL3jN=Gzhw@mail.gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
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


--Apple-Mail=_551F3FC9-4936-4880-88D0-9DD3FD044EF0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On Feb 26, 2023, at 9:31 AM, Satish Yaduvanshi =
<satishroyal4u@gmail.com> wrote:
>=20
>=20
> Hi All ,
>=20
> Could any one of you help  on how to capture the code coverage metrics =
for  openbmc firmware. Is there any documentation/procedure on it?

There is periodic jenkins job that runs and captures all of the coverage =
we currently have. The latest info can be found out at:

  =
https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastSuccessfulBu=
ild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/

You have to dig for the data though in each repo, for example:

  =
https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastSuccessfulBu=
ild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/phosphor-st=
ate-manager/build/meson-logs/coveragereport/index.html

This data is captured as a part of the standard CI unit test script.

>=20
> Thanks,
> Satish Kumar Gampa
>=20


--Apple-Mail=_551F3FC9-4936-4880-88D0-9DD3FD044EF0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 26, 2023, at 9:31 AM, Satish Yaduvanshi &lt;<a =
href=3D"mailto:satishroyal4u@gmail.com" =
class=3D"">satishroyal4u@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><br clear=3D"all" class=3D""><div class=3D"">Hi All =
,</div><div class=3D""><br class=3D""></div><div class=3D"">Could any =
one of you help&nbsp; on how to capture the code coverage metrics =
for&nbsp; openbmc firmware. Is there any documentation/procedure on =
it?</div></div></div></blockquote><div><br class=3D""></div><div>There =
is periodic jenkins job that runs and captures all of the coverage we =
currently have. The latest info can be found out at:</div><div><br =
class=3D""></div><div>&nbsp; <a =
href=3D"https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastSucc=
essfulBuild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/" =
class=3D"">https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastS=
uccessfulBuild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/=
</a></div><div><br class=3D""></div><div>You have to dig for the data =
though in each repo, for example:</div><div><br =
class=3D""></div><div>&nbsp;&nbsp;<a =
href=3D"https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastSucc=
essfulBuild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/pho=
sphor-state-manager/build/meson-logs/coveragereport/index.html" =
class=3D"">https://jenkins.openbmc.org/job/latest-unit-test-coverage/lastS=
uccessfulBuild/artifact/openbmc-build-scripts/scripts/unit-test-meta-data/=
phosphor-state-manager/build/meson-logs/coveragereport/index.html</a></div=
><div><br class=3D""></div><div>This data is captured as a part of the =
standard CI unit test script.</div><br class=3D""><blockquote =
type=3D"cite" class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><br class=3D""></div><div class=3D"">Thanks,</div><div =
class=3D"">Satish Kumar Gampa</div><div dir=3D"ltr" =
data-smartmail=3D"gmail_signature" class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D""><div dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div =
dir=3D"ltr" class=3D""><div dir=3D"ltr" class=3D""><div class=3D""><font =
face=3D"arial black, sans-serif" class=3D""><br =
class=3D""></font></div></div></div></div></div></div></div></div></div></=
div></div>
</div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_551F3FC9-4936-4880-88D0-9DD3FD044EF0--
