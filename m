Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE765E35A2
	for <lists+openbmc@lfdr.de>; Thu, 24 Oct 2019 16:34:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zV9q6R2lzDqRR
	for <lists+openbmc@lfdr.de>; Fri, 25 Oct 2019 01:34:07 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::233;
 helo=mail-oi1-x233.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="pzyaHKjI"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zV62327nzDqV1
 for <openbmc@lists.ozlabs.org>; Fri, 25 Oct 2019 01:30:49 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id s5so5392185oie.10
 for <openbmc@lists.ozlabs.org>; Thu, 24 Oct 2019 07:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2RSWZxBBXYOMkJBarUkwoDz0BV2/UqqXlw8MWPxlzh0=;
 b=pzyaHKjILKlSXbU8ObYqjjNeI5PE4lqO/O8s4oPmK6DOpI4A5/q5zbMKBGl+hN2OG/
 kELnY9F2hzyt61XLpBrp4gxMM7fePbV0ERaCnNl3F3z1sLG+UQ9mxX5xwpPnEFH3I+Nd
 qCOnwnmOp9SswD2M5wSJBL+Ja2Sao3wq00FkDdcBq14vCfImQ6DywEsYH9Q7Ybf9pAq0
 tt+K6MqTDwJ7CbNuPosNBwaWsndyExSQfUgLP8uBG0yigK8uX1StjTN4wY8pdYRTiwiy
 xuwjl5ReY27AjYFhZQwwH+ObzVQGodZ2gVsMA4RCgpZxinnF2bIeg1fHS84M40Svw90G
 rUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2RSWZxBBXYOMkJBarUkwoDz0BV2/UqqXlw8MWPxlzh0=;
 b=sy1P5XQkw7429AQLSXhModvVWVxMz0E3r4QGm9riRUfaM4KQYJ6tVazinwB66OsN9b
 UOZJ4XFBy3Vb3f7QbQw8226Sgr6hTQmzLYw18f2QIyzivck3YDMHgV0cU60R3BZlFswc
 kuOmR85fezUXUY+6oWaCbzW2qjkSKZB0stl7LR85A8h5YHzdm2yhvVb5DusMBzyeZWWS
 KakM9UVOYgyUomRfmuQdZdm5dTqJnSC+yaYIC+D13ZKP4ij52hq0uXzILC+JPbrrtIsy
 O765I88WkwKPxW10ED8vHDpeA8wUKMWtZv0cS8Y4EiAwW4hGNiaNZOfnK9taEdwpkz7T
 k8/A==
X-Gm-Message-State: APjAAAUM3EguXYKBLHqi3L1StjkzphlZ1vs2Hbb4R65/co14PDFLRelw
 +9XbV36gncojQrKYtKbBHQ4QTdXG
X-Google-Smtp-Source: APXvYqw2sDjKV0gAUM95CiVV3xjehAybiIG1gtDv4dcK6lJ0nq8h8OzxbLg90stOZq04Oxchmvg9ug==
X-Received: by 2002:aca:5885:: with SMTP id m127mr5060895oib.110.1571927446820; 
 Thu, 24 Oct 2019 07:30:46 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:5d8f:8fae:d6bf:f512])
 by smtp.gmail.com with ESMTPSA id c15sm644231otk.12.2019.10.24.07.30.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Oct 2019 07:30:46 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Running arbitrary tests in CI
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <3cf26eea-3dfb-23a5-a533-408d8ccc0027@linux.ibm.com>
Date: Thu, 24 Oct 2019 09:30:45 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <04B1459C-9B49-44BB-AA9F-FEDA5B4EBB3C@gmail.com>
References: <3cf26eea-3dfb-23a5-a533-408d8ccc0027@linux.ibm.com>
To: Matt Spinler <mspinler@linux.ibm.com>
X-Mailer: Apple Mail (2.3445.104.11)
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



> On Oct 24, 2019, at 9:25 AM, Matt Spinler <mspinler@linux.ibm.com> =
wrote:
>=20
> Hi,
>=20
> Following up to the thread that talks about being able to run extra =
tests in CI:
> https://lists.ozlabs.org/pipermail/openbmc/2019-September/018329.html
>=20
> I could definitely use something like this, so I am thinking of =
putting up the
> commit to do the: run any run-ci.sh in the repo.
>=20
> Are there any additional ideas or other comments on a way to do this?

Nothing from me. If you get the script in there, I=E2=80=99ll make the =
CI jenkins job
to call it.

>=20
> Thanks

