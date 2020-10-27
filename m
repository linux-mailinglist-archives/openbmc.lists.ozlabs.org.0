Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125A29CBA6
	for <lists+openbmc@lfdr.de>; Tue, 27 Oct 2020 22:58:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLQZ74BqWzDqPK
	for <lists+openbmc@lfdr.de>; Wed, 28 Oct 2020 08:58:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=geissonator@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DaCpn3aC; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLQYL43hnzDq9l
 for <openbmc@lists.ozlabs.org>; Wed, 28 Oct 2020 08:57:41 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id n11so2531717ota.2
 for <openbmc@lists.ozlabs.org>; Tue, 27 Oct 2020 14:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6LVpWeGX1PWscOOFvVfb0QmfR981CLlfdA8SnZbhEcs=;
 b=DaCpn3aC695wU081PE+4UhWAHr/96alS3j4ljiRZZU261YKcqbm+XuCBXxkuQ3BgPy
 dMaE753QNdCBTwEuPj73SsrIxf9fAD2ujlXRUECUGd//im002kB9g1jjlJi4ZT7mj2/c
 etppoTleLQwfTZG6YV4X833Ye8Dzd1EQElY/HNK0LsS7pGwq5QpdJclO6GW1GpNeudnP
 k7RsUE+qqFhgGKJ5WjOQ9ZKYdU17PDBdaafmWR0N4Hkixbd8jua284KKaRi7IhGdz9HF
 X9p0ya6tNKBEdqsNNvLFpzBePPS+Xec+VW8T2T5GZzC5hidwejaKC+/XBf1aZGFYpUlI
 1WUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=6LVpWeGX1PWscOOFvVfb0QmfR981CLlfdA8SnZbhEcs=;
 b=pL2lBDRXL7NRHi2N1VochSYH+WDsQcQ74wUQcRnjozz7f5IdDhebDJJ1eKgdA3GkU2
 9U0ci5aVjuOKBHRIbdF+5BWl8TgPvnMH65wI/UMChkky/TIdyj07Y3xyQWSTF1wbFM6K
 LZn4f3zEOT51nbG7OqQPXlrdk7oAmyx1PeuyLySmp/DodhKgP5MM4yWLIN5jTC4vKrGY
 EGwD0Rj/uDlDHElXdRv0fJUwDgOrrDHn2IC2yUdHQsf2vDQ3J6Xg5os2src60/x1qmCF
 sel1nyZnKGWSZLoi9NvT7wnHTyx/LqoG+fIhmiFp/3o59NyLIfUCPZHbPZi+74NXP1UM
 khEw==
X-Gm-Message-State: AOAM532GUGilEFfTEEOwRGyEh45NLIDIq9c/piS85eSuCKZxyBUmHvFm
 YNcyCROGJwzmmpieKvTXD9g=
X-Google-Smtp-Source: ABdhPJzDfm8zeIDvtbuQKn3RY7MPWePB6Dk5pRXrSXLIuhWC+srd6TnM/9WSoESxVUczPJxBfm1LSQ==
X-Received: by 2002:a05:6830:1651:: with SMTP id
 h17mr3145341otr.23.1603835858040; 
 Tue, 27 Oct 2020 14:57:38 -0700 (PDT)
Received: from andrews-mbp-2.attlocal.net
 (45-18-127-186.lightspeed.austtx.sbcglobal.net. [45.18.127.186])
 by smtp.gmail.com with ESMTPSA id b92sm1708720otc.70.2020.10.27.14.57.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 27 Oct 2020 14:57:37 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: Critical BMC process failure recovery
From: Andrew Geissler <geissonator@gmail.com>
In-Reply-To: <CY4PR1101MB2311ABDFBA0EA222BB602B7686190@CY4PR1101MB2311.namprd11.prod.outlook.com>
Date: Tue, 27 Oct 2020 16:57:36 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <B24BCA12-F3B1-4DFF-B839-2184D34D0F73@gmail.com>
References: <C270F145-2236-4CA1-8D57-A63AB622A47C@gmail.com>
 <20201020142846.GB5030@patrickw3-mbp.lan.stwcx.xyz>
 <A7171080-B143-42AD-B235-951A06B247A4@gmail.com>
 <CY4PR1101MB2311ABDFBA0EA222BB602B7686190@CY4PR1101MB2311.namprd11.prod.outlook.com>
To: "Matuszczak, Piotr" <piotr.matuszczak@intel.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
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



> On Oct 26, 2020, at 8:19 AM, Matuszczak, Piotr =
<piotr.matuszczak@intel.com> wrote:
>=20
> Hi, It's quite interesting discussion. Have you considered some kind =
of minimal set of features recovery image, to which BMC can switch after =
N resets during defined amount of time? Such image could hold error log =
and send periodic event about BMC failure.=20

That could definitely be useful. Some sort of safe mode. I believe =
systemd
has rescue/emergency mode options we could look at. I do think as =
Patrick
pointed out earlier though that most issues are some sort of BMC =
hardware
failure. Anything that needs the kernel running and even basic services =
going
is going to be difficult to get running in those scenarios.

>=20
> Piotr Matuszczak
> ---------------------------------------------------------------------
> Intel Technology Poland sp. z o.o.=20
> ul. Slowackiego 173, 80-298 Gdansk
> KRS 101882
> NIP 957-07-52-316
>=20

