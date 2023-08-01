Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B649076BDDA
	for <lists+openbmc@lfdr.de>; Tue,  1 Aug 2023 21:34:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PrTJXWf4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFlgB4W1nz3bX2
	for <lists+openbmc@lfdr.de>; Wed,  2 Aug 2023 05:34:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PrTJXWf4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFlfZ4WXBz2yW0
	for <openbmc@lists.ozlabs.org>; Wed,  2 Aug 2023 05:34:13 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-403b30c7377so34347061cf.1
        for <openbmc@lists.ozlabs.org>; Tue, 01 Aug 2023 12:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690918450; x=1691523250;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RiXnRpgU/7pM7zmeIQ0mOj9rVRsb3P4nxXhXRggeKpk=;
        b=PrTJXWf4ietN8wFP7fWgPQbq6Q43Xvov4u9MyTKH0wp1TINqBUg9AOygwnN8pX0/YF
         rjEnYD1v6xTFH54mzf8PThMwT66okXcHsDQrmqiEjdWL4tQJl4fabx+75cl7rxuJ6nGE
         CWtsOmuuQ8vjlnoLNBY3sfptVgc3L/EWtctXHi/7zK1X3hEnc146i0je9BCSkGSxqA94
         BEK43ub2PkKHFhwN9mOJGrGSCusBPkjkdwaX3qdrD18wFBf0B4LOsYId5Z1lNgFtgx3X
         9n1KK4EPkUkbpim12Epm4WBOpk7u/cTl1hX6LwptGNssXVTmSCgysdzLBf7OIJcK+Bok
         AMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690918450; x=1691523250;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RiXnRpgU/7pM7zmeIQ0mOj9rVRsb3P4nxXhXRggeKpk=;
        b=flaBhMNHTMjC9EXlnIqm8IHCS1vlTfZLFauljDeO2nhij79RIX0NM2PplGlo7JMRIo
         SCASzs99TUgw3tB8s012j8Vhk320wuS1TdjJ8AJzJZxHbVnRPcq/Rzcc28WaOTTofrt6
         o1qTBA++WmflhyZ229fSCtffLyqR4CkkvZhmeFLu1vxtafosBP8pfAfIOjo1PKPq11rE
         1ganzUzV++n89TPBsD8fKs//B3PGzxcJpoFFpJOsUvqtD8cPvTjWkbUEy807nRUrbwoy
         P2NiQDkEO5CFlXHZpsRTbJMlBpFis0KkJ2Ya0IGgKlusoKsI9w1/zqP40tYwlPDmXJ78
         AtSA==
X-Gm-Message-State: ABy/qLY71rOjM0ZXJQLX3QHEthqJ2xanzaLseGXwHp8L2rtMzVlSpGzm
	usNssqnO7DFYAY8UCmMBXZw=
X-Google-Smtp-Source: APBJJlHpYsXI0M8G83461WFsQdSk8VzrBmzAwiWKeqDOoNM5BFjfttvU0H4HbqPGwwsJZOZP140KdQ==
X-Received: by 2002:ac8:5a4a:0:b0:406:9532:55ab with SMTP id o10-20020ac85a4a000000b00406953255abmr16375115qta.42.1690918449928;
        Tue, 01 Aug 2023 12:34:09 -0700 (PDT)
Received: from smtpclient.apple ([2601:184:200:8480:45d2:4dc4:4f7d:4655])
        by smtp.gmail.com with ESMTPSA id i15-20020ae9ee0f000000b0076c89639526sm3548139qkg.93.2023.08.01.12.34.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Aug 2023 12:34:09 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.3\))
Subject: Re: OpenBMC obmc-op-control-power
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CADz53W=bptekDoDVctBQ1TZdLcMz95YhWovn_LGRB92HsBp4Fw@mail.gmail.com>
Date: Tue, 1 Aug 2023 15:34:08 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <FCC6EA0D-0629-4591-8083-9E16DA8FD45B@gmail.com>
References: <CADz53W=bptekDoDVctBQ1TZdLcMz95YhWovn_LGRB92HsBp4Fw@mail.gmail.com>
To: Karthik Paladugula <karthik.paladugula@gmail.com>
X-Mailer: Apple Mail (2.3696.120.41.1.3)
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Jul 31, 2023, at 4:37 PM, Karthik Paladugula =
<karthik.paladugula@gmail.com> wrote:
>=20
> Hello Andrew!
>=20
> I see from the email archives found here: =
https://lists.ozlabs.org/pipermail/openbmc/ that you proposed back in =
November 2022 that obmc-op-control-power_git.bb be renamed to =
phosphor-skeleton-control-power_git.bb and that it will be removed =
eventually. I wanted to check up on that in this email and ask if you =
might know what the situation surrounding that package is now?

Hi Karthik, I added on the openbmc mailing list to cc as if you have the =
question, there=E2=80=99s a good chance someone else will some day.

The overall goal is to get rid of the skeleton repository. As you noted, =
I did a bit of clean up a while (ago)[1] and at least broke out the =
skeleton recipe to include its name. I think the only way we finally get =
rid of skeleton is when someone  goes back to at least the systems we =
support in CI and moves them to the phosphor-power version, or we =
eventually remove the servers from CI that are using skeleton. I don=E2=80=
=99t currently have any plans to do this work.

If you=E2=80=99re interested in working on it, you could push up a =
change to gerrit that removes the skeleton recipe and see what fails.

Andrew

[1]: =
https://lists.ozlabs.org/pipermail/openbmc/2022-November/032457.html=20

> Thank you,
> Karthik

