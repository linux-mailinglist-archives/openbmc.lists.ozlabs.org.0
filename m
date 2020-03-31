Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7619199DEF
	for <lists+openbmc@lfdr.de>; Tue, 31 Mar 2020 20:22:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sHjz3F0mzDqxf
	for <lists+openbmc@lfdr.de>; Wed,  1 Apr 2020 05:22:31 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::330;
 helo=mail-ot1-x330.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=byvTrbEc; dkim-atps=neutral
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sHgB5g9JzDqPl
 for <openbmc@lists.ozlabs.org>; Wed,  1 Apr 2020 05:20:04 +1100 (AEDT)
Received: by mail-ot1-x330.google.com with SMTP id l23so23077064otf.3
 for <openbmc@lists.ozlabs.org>; Tue, 31 Mar 2020 11:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=/UYWNJb+dBuYwk28gHErfJHS5B/8wneHeUxXE4FFu84=;
 b=byvTrbEcedRIJyBb4sOC3XeQvaDN9pfZ8nLAIw24gu/0ByWeClFP7CW2xA06O031Bt
 V8mgJu//rSJAHdvreER7tFgFHXwMbAQlCtOZr2xOaJGtU2fsEz6hwVbmOL8I/wlnVyoS
 s66t8GF4OPAuCNqf0P+bm/KYctFyy2plPG2kPmV5U/6JICXybGp/e1eiN5GcrU3um9Bh
 Z2+8w64UMKJyRPMnRdAAKgl53cyXv6AnM/sEQOjs8/lKSrxautwHPNSQQpzkSGpU/hAh
 0NEZkGNdhopuPNGEyS1GAftrBxFNr4gQPC4GhAC22Yk/J9CvtPIPp7eNumO4AZSL2xzC
 2B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=/UYWNJb+dBuYwk28gHErfJHS5B/8wneHeUxXE4FFu84=;
 b=QAgs7oeEt0ri08p+3xQwVA2BZO+yGlET7IUG1S0SM8whE1kU3Hz2uPDWnhmFVDxDFi
 hiL+KSwMPu7evZzcSoLZZwwUqKtH0Gs/77MYPhe/H6ofviOw0fz1IA8vDJ5PB+LWWp3O
 nzkXZuq+N0fPVFa+lzpZfI9qatrIHTQSyMlz9y24Ojhwgr3GH5drgo1SlKMAnNHFmdZ8
 FgfYAGDxDSRFGAcP8cg/ah/AR9lPIKY9nmCrpirZPyaMbGDdX1ZaMIbjygO/DJisk5ZE
 FEN4RaU9duCXZqH0YDdrTCuGPKiFHRqp/2LtRLOh5Srdm5RBrqb7x9B6BVUT7IgWGxu/
 MYzA==
X-Gm-Message-State: ANhLgQ19OgMjee6eMwWh6kgy8oB5sn53PWr9z7A8mIjAzj7pbNCjt9oZ
 924u4kHJCZZE/WIA2BfrRzzX90m0rRU=
X-Google-Smtp-Source: ADFU+vswYgtzhZ8xKGL74bl2qr51V+KP/wb3wIbjAMIWoA29S/2qivAsLEsygKtNkL1VoOk0/tKRlw==
X-Received: by 2002:a9d:3423:: with SMTP id v32mr4090548otb.46.1585678800559; 
 Tue, 31 Mar 2020 11:20:00 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 ([2600:1700:19e0:3310:298f:5627:e1a2:6a29])
 by smtp.gmail.com with ESMTPSA id d84sm5257374oig.33.2020.03.31.11.20.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 11:20:00 -0700 (PDT)
From: Andrew Geissler <geissonator@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: boost monthly download limits
Message-Id: <C0E87748-C981-46DE-A5D4-539BA33EC94A@gmail.com>
Date: Tue, 31 Mar 2020 13:19:59 -0500
To: yocto@lists.yoctoproject.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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

Greetings,

Recently, the OpenBMC project started to hit
https://github.com/boostorg/boost/issues/299#issuecomment-593064251. =
Basically
the site that hosts the boost packages has a monthly download limit and =
once
hit, starts to fail.

There was a commit last year,
=
https://github.com/openembedded/openembedded-core/commit/810aded01fc2ae2c2=
7c2573135c20947453e50c6
which moved from using sourceforge to dl.bintray.com. I don't see a =
reason in
the commit message but I suspect it was because sourceforge for some =
reason did
not mirror 1.71.0. They have 1.70.0 and 1.72.0 but not 1.71.0. I opened
=
https://sourceforge.net/p/boost/discussion/23622/thread/4fe1cce13b/?limit=3D=
25#7d3e
to try and understand why this was.

Given the download limitations of dl.bintray.com, does it make sense to =
try
and move back to sourceforge? Someone also had recommended we just grab
from github (i.e. =
https://github.com/boostorg/boost/archive/boost-1.71.0.tar.gz)

This issue will reset on the first of the month but could come back and =
bite
us again in the future. Anyone else hit this or looking into it?

Andrew=
