Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F8178355
	for <lists+openbmc@lfdr.de>; Tue,  3 Mar 2020 20:47:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48X6wp55QXzDqV8
	for <lists+openbmc@lfdr.de>; Wed,  4 Mar 2020 06:47:22 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32e;
 helo=mail-ot1-x32e.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=P9YuD9N+; dkim-atps=neutral
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48X6wB2S35zDqTV
 for <openbmc@lists.ozlabs.org>; Wed,  4 Mar 2020 06:46:47 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id b3so4308020otp.4
 for <openbmc@lists.ozlabs.org>; Tue, 03 Mar 2020 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+/6oPYjWL/q8DmhWJdH3Nu+aCM3DK4PbYporyS8ucSU=;
 b=P9YuD9N+68Jwpw624tgjhQLg2SRPlDck32033IouPBOYjrAm7SsyE+Jn0CQC60qgoR
 hGa8YAS4eafpX3F5nIAJ8A/1DYa2X1DIyat7rmPQfsvZjltUbWROB/dOZPTGJumojqLu
 Q6hEvAdKkbQx7CvBx+dLtl8A8u3G4N66fiDnR3hmrw3577A0Gdc8bH1iIfwKt09bzGtD
 k0rD5MAsOdGzRICg1ruAVFaTz9+Lno+yYcAgFvl3u3eHeXKeJCOof5O0wGCZEOUpVMm9
 soymMxp/02enEzU8XU7Hh83YeJ1CpE3ilaJnP8giLEJN9Nz7vy/1tcKpvgEVr6REyaXh
 DTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=+/6oPYjWL/q8DmhWJdH3Nu+aCM3DK4PbYporyS8ucSU=;
 b=AuMCwZi6q9EqYwoRhAufp3Wg5vBAV2oPB9hwBmpHT3EKUIkd3xc6CTfGL2whbkqxOu
 5yONAJraC0d+XvYksI7HkEiZy/OhHQpZc5mls3riULXxuSQCBac2BvF64kuMlJkqnktd
 GkNDaClBHjot05iJzapKdibfhig2+ycQwpLgngGvl1qCqN0cRqTlcky9eiU2loptdVmX
 Tykq260uObJQ+L5KyhDCwxJ4zumkjSCUP/gWPwJCdVSR8zgYvqS9P+PnmsFrjDP7fGSs
 P708RBWmzEoi638G03Bcs8AZgSBYm6aAHLgfj8A/fek3R8R5sZEF31Baq5THL89Nx3LK
 2yEA==
X-Gm-Message-State: ANhLgQ0v9P00bF1xgFImCCZ2WGGm4GbArKERH4ld9xXsh54XBBLQi9tv
 1eCXjLW2NhBg5QVHmMIORWE=
X-Google-Smtp-Source: ADFU+vt+bUqzGwO+SnAZoAsnDsrhJ8COoN/CqzrD39rl7nXhRZOPo8OlbJMoPrd/YbZ9g4t37iCWJQ==
X-Received: by 2002:a9d:a16:: with SMTP id 22mr4389092otg.31.1583264805872;
 Tue, 03 Mar 2020 11:46:45 -0800 (PST)
Received: from ?IPv6:2600:1700:19e0:3310:55e0:b068:eaa2:66b1?
 ([2600:1700:19e0:3310:55e0:b068:eaa2:66b1])
 by smtp.gmail.com with ESMTPSA id f84sm435973oib.32.2020.03.03.11.46.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Mar 2020 11:46:45 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: service for tracking user activity (phosphor-audit)
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
Date: Tue, 3 Mar 2020 13:46:44 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <B9364499-3954-4862-BDF2-52467AF39327@gmail.com>
References: <4efbcd540d3dd4bfb8021bdb6864326f72092852.camel@yadro.com>
 <da51cb6767c7f1e9130204f6f9c4af0019552b5b.camel@yadro.com>
To: Ivan Mikhaylov <i.mikhaylov@yadro.com>
X-Mailer: Apple Mail (2.3608.60.0.2.5)
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
Cc: Matt Spinler <mspinler@linux.ibm.com>,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Brad Bishop <bradleyb@fuzziesquirrel.com>, joseph-reynolds@charter.net,
 gmills@us.ibm.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 28, 2020, at 11:15 AM, Ivan Mikhaylov <i.mikhaylov@yadro.com> =
wrote:
>=20
> On Mon, 2019-08-26 at 15:31 +0300, Ivan Mikhaylov wrote:
>> hi all, There it is updated design proposal about audit service which =
provides
>> a
>> way to track user activity. Right now most parts are described there. =
If you
>> have any ideas or anything to add, feel free to share in this thread.
>>=20
>> https://gerrit.openbmc-project.xyz/c/openbmc/docs/+/23870
>>=20
>>=20
>> thanks.
>>=20
>=20
> Thank you, everyone involved in the review process of this document! =
Just got
> back from the leave, and wanted to ask who should create the rep or =
which rep
> part it should belong to? I want to use the meson build system for =
this project,
> any problems with this decision? Also, any other tips or suggestions =
are
> welcome. I'll start working on it in next 1-2 weeks.

phosphor-logging would be one candidate for a repo for this function. =
Otherwise
a new repo, phosphor-audit would work.

Brad would be the one to create a new repo.

Matt and Deepak could weigh in on whether this could be a part of
phosphor-logging. The community has swung the pendulum from a repo
for each individual function to trying to group things more logically =
into
single larger repos which can be configured to enable different =
functions
(which is why I would lean towards phosphor-logging).

>=20
> Thanks.
>=20

