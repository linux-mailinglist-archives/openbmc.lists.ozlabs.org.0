Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D822816393
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 00:54:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cBdbKD2v;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StfvZ25jDz2xdf
	for <lists+openbmc@lfdr.de>; Mon, 18 Dec 2023 10:54:50 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=cBdbKD2v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Stfts5vhmz2yk7
	for <openbmc@lists.ozlabs.org>; Mon, 18 Dec 2023 10:54:13 +1100 (AEDT)
Received: from [192.168.68.112] (ppp118-210-80-147.adl-adc-lon-bras32.tpg.internode.on.net [118.210.80.147])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 93FC12012A;
	Mon, 18 Dec 2023 07:54:03 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1702857250;
	bh=RZ2K1bWIHjJUrdTRjTnf0vshXf3nOCTkbxL5PirxiqM=;
	h=Subject:From:To:Cc:Date;
	b=cBdbKD2vbhi9IwE5zaui8TVCRSc2Hj8kFwtmc/a/PGF0RqBoUtcfL5O0uhXLsOQ6U
	 2OCEDk38a8le2wMotyxVNpsORhRWDQJOGjYqYQQc/6wY63OUDjSDakV4yo5Pd7wCLG
	 iPWUp7YS9+G+Aat3Dxfqn5X+q/7CMsieSnhF5pQUuCgBjuQF9eQLfo378kBAJKUQvc
	 Hpg4/RjtSpMkiY2nWpW9E3oJMjCtEDMsSRpE+Xix9MfI5BmFCBQzm2HaJ4mu8eHb2g
	 YVsdJS8hK96hu+Ur+uEIj4OtAnwYGGm7Q7ZfWJPZ1SyAci3KMLWxyHPpL0wHUyY5k4
	 42dEcybgvgbOg==
Message-ID: <47c53da80f585dac8e1450b20c5855ede960d243.camel@codeconstruct.com.au>
Subject: openbmc/telemetry: First complaint of unresponsiveness
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: adrian.ambrozewicz@linux.intel.com, jozef.wludzik@intel.com, 
	cezary.zwolak@intel.com
Date: Mon, 18 Dec 2023 10:24:00 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
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
Cc: openbmc@lists.ozlabs.org, liuxiwei@ieisystem.com
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Adrian, Jozef, and Cezary,

A complaint has been raised to the Technical Oversight Forum that as
maintainers you collectively have not responded to several patches for
openbmc/telemetry in a reasonable timeframe.

Some time ago the project defined constraints on timeliness for
reviews. This helps to set expectations for both contributors and
maintainers. Maintainers are expected to find time to provide feedback
on patches inside one month of them being pushed to Gerrit. Upon
complaint, missing this deadline forms one count of unresponsiveness.
If a subproject's maintainers receive three complaints of
unresponsiveness in a 12 month period then the Technical Oversight
Forum will seek to introduce new maintainers to the subproject.

This is the first notice of a complaint of unresponsiveness for
openbmc/telemetry.

This notice is copied to the OpenBMC mailing list to provide community
visibility. We need the process to be both public and archived to make
sure we are clear and accountable in our communication.

Further details and considerations of this policy are defined at the
link below:

https://github.com/openbmc/docs/blob/master/process/subproject-maintainersh=
ip.md

The complaint regarding openbmc/telemetry at:

https://github.com/openbmc/technical-oversight-forum/issues/32

The specific patches identified by the complaint are:

1. 64867: build: upgrade to C++23
   https://gerrit.openbmc.org/c/openbmc/telemetry/+/64867

2. 67240: clang-format: copy latest and re-format
   https://gerrit.openbmc.org/c/openbmc/telemetry/+/67240

3. 66007: meson_options.txt: Support for reading options from meson.options
   https://gerrit.openbmc.org/c/openbmc/telemetry/+/66007

If you are unable to continue with your maintenance role for
openbmc/telemetry then please work with the community identify others
who are capable and willing. When doing so, please consider the
expectations set out in the community membership documentation:

https://github.com/openbmc/docs/blob/master/community-membership.md

On behalf of the Technical Oversight Forum,

Andrew
