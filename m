Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 283CB157F96
	for <lists+openbmc@lfdr.de>; Mon, 10 Feb 2020 17:22:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GWQY0BJyzDqM0
	for <lists+openbmc@lfdr.de>; Tue, 11 Feb 2020 03:22:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b;
 helo=mail-il1-x12b.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OmoA8njr; dkim-atps=neutral
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GWPs0ms5zDqBX
 for <openbmc@lists.ozlabs.org>; Tue, 11 Feb 2020 03:21:52 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id p8so679619iln.12
 for <openbmc@lists.ozlabs.org>; Mon, 10 Feb 2020 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vWYLyv9yfLLhCps+Z/sZPrbQfMZvRZny2w3sbLpqVRQ=;
 b=OmoA8njrjuZh4i6OuH9BgIF5KvU8p7bANCGLR04NOKepDp/WRDihugUgBHpxmz5mNw
 GL0W4xZCbyrNVkyJaqSosIHccA091RtxGaqkslmmXINmzN7RD+z9gWI8450QMSJEWY0t
 BqAiImiJK+O09eHH27DlR5pPzshLvUr/tCs8fko24lalwseoIIbOxqyO0nYMkvGt11gj
 K5huAIZSVBDrbbZIwotm3CIuhmmRs+uxswR8URy/L4pYEQuKJdB+ec7IMUn/9gkq1nQn
 1pbccbKVrDpinpSP73p25tA4hXWXzdSK5LgEfkCUv9ZADH9BqLCV3ZZ1e0up0hYj4kyy
 oFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=vWYLyv9yfLLhCps+Z/sZPrbQfMZvRZny2w3sbLpqVRQ=;
 b=b7bOVaMh/Mu5kebsI8JI2PBG0xn0VNl6zUJkA8pZ2Z9aiMEnPG4x834dBlYmkK19A2
 KLfbMXn6sCFRnuFFlHS2NQRKm/IqKw6LcYPAd1v5kcjMA2voc3RKdd7ToplrUm33IMWC
 zF49qsPVdqrdpWYrx78/7k3jbXX9nHHW/wAN4VhfZC2yy4LU/AWFF89HmnNRsiivISXp
 fFZldNS3eJ8YY8IjW+Pm0XRow6ieWCAA4Zb7H76/jVCbSVdIuS1xHXQCueTXXaT3FMrl
 A8hZwmuC5PqKvz39GjkB8sj3KEMHJrUgzMWg19cfJsCqxU8TTEeUVyrtmrkyYUi5R1wW
 Su0g==
X-Gm-Message-State: APjAAAX1k2b3eLMXicBAnB7EnBnF8ioOGhI+0Yp3kxp/8ZBKcRMYu3sy
 mQorynh5Xd/4HEVKnPpM4BQ=
X-Google-Smtp-Source: APXvYqxmVv6faWs82j4QmzWYh+Etkh38g6Oh7boOJtE+48x3AkXAbw6maDKibw29HybNNeHe4TJvvQ==
X-Received: by 2002:a92:4982:: with SMTP id k2mr2074773ilg.57.1581351707382;
 Mon, 10 Feb 2020 08:21:47 -0800 (PST)
Received: from andrews-mbp-2.austin.ibm.com ([129.41.86.0])
 by smtp.gmail.com with ESMTPSA id w15sm217462iow.61.2020.02.10.08.21.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Feb 2020 08:21:46 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Re: Need help to add smbios-mdr to CI build
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <66c733ee-60a0-ac65-bc9a-1436d21f1522@linux.intel.com>
Date: Mon, 10 Feb 2020 10:21:45 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <9C675BF5-0EC9-48E7-BD1C-FF6F08BEEFE1@gmail.com>
References: <66c733ee-60a0-ac65-bc9a-1436d21f1522@linux.intel.com>
To: "Yang, Cheng C" <cheng.c.yang@linux.intel.com>
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



> On Feb 7, 2020, at 11:45 AM, Yang, Cheng C =
<cheng.c.yang@linux.intel.com> wrote:
>=20
> Hi Andrew,
>=20
>     We are going to use smbios-mdr repo, do you mind help to add it to =
CI build ? The latest code review of it
>=20
> is https://gerrit.openbmc-project.xyz/c/openbmc/smbios-mdr/+/29144

Sure thing, added it. Looks like the compile hit a fail for you to look =
at.

>=20
>=20
> Thank you very much!
>=20

